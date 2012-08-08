#const global g_font_x 176/16
#const global g_font_y 162/6

#const global g_font_suit_x 48
#const global g_font_suit_y 32

#const global g_screen_x 320
#const global g_screen_y 480

#module
#deffunc fprint str _p1
	;	fprint "message"
	;	(画像を使用したフォント表示を行ないます)
	;	"message" : 表示するメッセージ
	;	表示座標は、posで指定した位置から
	;
	i = 0: st = _p1

	repeat
		a1 = peek(st, i) :i++
		if a1 = 0 :break
		if a1 = 13 { ; 改行
			a1 = peek(st, i)
			if a1 = 10 :i++
			continue
		} else {
			celput 1 , a1 - 32
		}
	loop

	return

#deffunc suitprint int _i, int _j, var _f
	; _i suit
	; _j number
	x = (_j-1)*4 + (_i-1)
	celput 2, x, _f, _f
	return

#deffunc suitborder int _x1, int _y1, int _x2, int _y2, int _r, int _g, int b
	; カードの枠を書く
	pos _x1, _y1
	color _r, _g, _b
	line _x1     , _y1 + _y2
	line _x1+_x2 , _y1 + _y2
	line _x1+_x2 , _y1
	line _x1     , _y1
	return

#defcfunc get_rows array _a, int _i
	for j, 0, 104, 1
		if ( _a(_i, j) = 0 ) :_break
	next
	return j

#defcfunc chk_complete array _a, int _i, int _t, int _d
	; 完成チェック
	; _a カード情報配列
	; _i x座標
	; _t 裏返し状態
	; _d 難易度

	ret = 0

	for j, 0, 104, 1
		if ( _a(_i, j) = 0 ) :_break
	next
	j--
	;if ( j < 13 ) :return 0

	a = _a(_i, j) & 15
	if ( a = 1 ) {
		for k, j, 0, -1
			if ( k <= _t ) & ( _t > 0 ) :_break
			suit = ( _a(_i, k-1) >> 4 ) \ _d
			if ( suit = 0 ) :suit = _d
			number = _a(_i, k-1) & 15
			card_before = suit * 16 + number

			suit = ( _a(_i, k) >> 4 ) \ _d
			if ( suit = 0 ) :suit = _d
			number = _a(_i, k) & 15
			card_current = suit * 16 + number

			if (( card_current + 1 ) != card_before ) :_break
			if (( card_before & 15 ) = 13 ) {
				ret = 1
				_break
			}

		next
	}

	return ret

#global
