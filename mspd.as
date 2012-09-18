;-------------------------------------------------------------------------------
; �R���p�C���I�v�V����
#packopt name "muspider.exe"
#packopt type 0
#packopt xsize 320
#packopt ysize 480
#pack "fon_cha1.png"
#pack "fon_cha2.png"
#pack "fon_suit.png"

;-------------------------------------------------------------------------------

; �t�H���g�摜�̕����T�C�Y
#const global g_font_png_x 16
#const global g_font_png_y 32

; �t�H���g�T�C�Y�i�X�N���[���T�C�Y��j
;#const global g_font_x 12
;#const global g_font_y 24
g_font_x = 3 * (ginfo_winx + ginfo_winy) / 200
g_font_y = 3 * (ginfo_winx + ginfo_winy) / 100

; �t�H���g�i�J�[�h�j�T�C�Y
#const global g_font_suit_x 72
#const global g_font_suit_y 48

; �X�N���[���T�C�Y
;#const global g_screen_x 320
;#const global g_screen_y 480
g_screen_x = ginfo_winx
g_screen_y = ginfo_winy

; 3��/4
#const global g_3pi4 3*M_PI/4

; �g���[�X�r���[�s��
; �����[�X���� 0
#const global global_trace_row 4
;#const global global_trace_row 0

#module
#defcfunc log10 int _x
	; log10(x)
	; ��p�ΐ��i�؎̂āj��Ԃ�
	if ( _x <= 0 ) {
		ret = 1
	} else {
		ret = int ( logf(_x) / logf(10) )
	}
	return ret
#global

#module
#deffunc rpos int _x, int _y
	; ��]�Ή���������pos
	pos _x, _y
	return
#global

#module
#deffunc fprint str _p1, int _alpha
	;	fprint "message"
	;	(�摜���g�p�����t�H���g�\�����s�Ȃ��܂�)
	;	"message" : �\�����郁�b�Z�[�W
	;	�\�����W�́Apos�Ŏw�肵���ʒu����
	;	���p�J�i�͑S�p�t�H���g�摜���ǂݎ��
	;
	i = 0: st = _p1
	fx = double( 1.0 * g_font_x@ / g_font_png_x@ )
	fy = double( 1.0 * g_font_y@ / g_font_png_y@ )

	gmode 5, 0, 0, _alpha

	repeat
		a1 = peek(st, i) :i++
		if a1 = 0 :break
		if a1 = 13 { ; ���s
			a1 = peek(st, i)
			if a1 = 10 :i++
			continue
		} else {
			if ( a1 & 128 ) {
				celput 2 , a1 - 160, fx, fy
			} else {
				celput 1 , a1 - 32, fx, fy
			}
		}
	loop

	return
#global

#module
#deffunc suitprint int _i, int _j, var _f
	; _i suit
	; _j number
	x = (_j-1)*4 + (_i-1)
	celput 3, x, _f, _f
	return
#global

#module back_stack
#deffunc back_init
	dim stack, 1024, 5
	index = 0
	return
#deffunc back_push int _i, int _j, int _x, int _y, int _t
	if ( index = 1024 ) {
		for n, 0, 1023, 1
			stack(n, 0) = stack(n+1, 0)
			stack(n, 1) = stack(n+1, 1)
			stack(n, 2) = stack(n+1, 2)
			stack(n, 3) = stack(n+1, 3)
			stack(n, 4) = stack(n+1, 4)
		next
		stack(index, 0) = _i
		stack(index, 1) = _j
		stack(index, 2) = _x
		stack(index, 3) = _y
		stack(index, 4) = _t
	} else {
		stack(index, 0) = _i
		stack(index, 1) = _j
		stack(index, 2) = _x
		stack(index, 3) = _y
		stack(index, 4) = _t
		index++
	}
	return
#defcfunc back_pop
	if ( 0 < index ) {
		index--
		i = stack(index, 0) &  15
		j = stack(index, 1) & 127
		x = stack(index, 2) &  15
		y = stack(index, 3) & 255
		t = stack(index, 4) & 255
		ret = ( i << 27 ) + ( j << 20 ) + ( x << 16 ) + ( y << 8 ) + t
	} else {
		ret = -1
	}
	return ret
#defcfunc back_length
	return index
#global

#module
#defcfunc get_suit int _c, int _d
	; �X�[�g���擾
	; _c �J�[�h���
	; _d ��Փx
	ret = ( _c >> 4 ) \ _d
	if ( ret = 0 ) :ret = _d
	return ret
#global

#module
#defcfunc get_number int _c
	; �������擾
	; _c �J�[�h���
	ret = _c & 15
	return ret
#global

#module
#defcfunc is_right_order array _a, int _i, int _j, int _t, int _d
	; ��̃J�[�h�ƃX�[�g�ꏏ���ԍ����{�P
	; _a �J�[�h���z��
	; _i x���W
	; _j y���W
	; _t ���Ԃ����
	; _d ��Փx
	; �Ԃ�l ��̂ق��̃J�[�h�̐���

	if ( _j < 1 ) :return 0
	if ( ( _j - 1 ) <= _t ) :return 0

	card_before  = get_suit( _a(_i, _j-1), _d) * 16 + get_number( _a(_i, _j-1))
 	card_current = get_suit( _a(_i,   _j), _d) * 16 + get_number( _a(_i,   _j))

	if (( card_before - 1 ) = card_current ) {
		ret = card_before & 15
	} else {
		ret = 0
	}
	return ret
#global

#module
#deffunc suit_border int _x1, int _y1, int _x2, int _y2, int _r, int _g, int b
	; �J�[�h�̘g������
	rpos _x1, _y1
	color _r, _g, _b
	line _x1     , _y1 + _y2
	line _x1+_x2 , _y1 + _y2
	line _x1+_x2 , _y1
	line _x1     , _y1
	return
#global

#module
#defcfunc get_rows array _a, int _i
	; ��̒������擾
	for j, 0, 104, 1
		if ( _a(_i, j) = 0 ) :_break
	next
	return j
#global

#module
#defcfunc chk_complete array _a, int _i, int _t, int _d
	; �����`�F�b�N
	; _a �J�[�h���z��
	; _i x���W
	; _t ���Ԃ����
	; _d ��Փx

	ret = 0

	j = get_rows( _a, _i )
	if ( j < 13 ) :return 0
	j--

	if ( get_number( _a(_i, j) ) = 1 ) {
		for k, j, 0, -1
			ans = is_right_order( _a, _i, k, _t, _d )
			if ( ans = 0 ) :_break
			if ( ans = 13 ) {
				ret = 1
				_break
			}
		next
	}

	return ret
#global
