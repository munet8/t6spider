#const global g_font_x 176/16
#const global g_font_y 162/6

#const global g_font_suit_x 48
#const global g_font_suit_y 32

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
	int_x_plus = int(1.0 * g_font_suit_x * float_zoom)
	int_y_plus = int(1.0 * g_font_suit_y * float_zoom)
	color _r, _g, _b
	line _x1     , _y1 + _y2
	line _x1+_x2 , _y1 + _y2
	line _x1+_x2 , _y1
	line _x1     , _y1
	return

#global
