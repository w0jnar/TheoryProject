(*Thomas Wojnar*)

fun encrypt(enstr, offset) =
let
	fun toupper(x) = if (ord(x) >= ord(#"a") andalso ord(x) <= ord(#"z"))
				 then chr(ord(x) - 32) 
				 else x;
	val strlt = explode(enstr);
	val upperstr = map toupper strlt;
	val modoff = offset mod 26;
	
	fun enc1 x =
		if (((ord x) >= (ord #"A")) andalso ((ord x) <= (ord #"Z"))) then
			if((ord x) + modoff > (ord #"Z")) then
				(chr (((ord x) + modoff) - 26))
			else (chr ((ord x) + modoff))
		else x;
	
	val retstr = map enc1 upperstr;
in
	implode(retstr)
end;

fun decrypt(enstr, offset) =
let
	fun toupper(x) = if (ord(x) >= ord(#"a") andalso ord(x) <= ord(#"z"))
				 then chr(ord(x) - 32) 
				 else x;
	val strlt = explode(enstr);
	val upperstr = map toupper strlt;
	val modoff = offset mod 26;
	
	fun enc1 x =
		if (((ord x) >= (ord #"A")) andalso ((ord x) <= (ord #"Z"))) then
			if((ord x) - modoff < (ord #"A")) then
				(chr (((ord x) - modoff) + 26))
			else (chr ((ord x) - modoff))
		else x;
	
	val retstr = map enc1 upperstr;
in
	implode(retstr)
end;

fun solve(enstr, maxoff) =
let
	fun toupper(x) = if (ord(x) >= ord(#"a") andalso ord(x) <= ord(#"z"))
				 then chr(ord(x) - 32) 
				 else x;
	val strlt = explode(enstr);
	val upperstr = map toupper strlt;	
	
	
	
	fun solve1(str,max,i) =
	let
		fun enc1 x =
			if (((ord x) >= (ord #"A")) andalso ((ord x) <= (ord #"Z"))) then
				if((ord x) + i > (ord #"Z")) then
					(chr (((ord x) + i) - 26))
				else (chr ((ord x) + i))
			else x;
		val edstr = map enc1 str
	in
	if i > max then print "\n"
	else 
	(if(i < 10) then
	(print("Caesar 0" ^ Int.toString(i) ^ ": " ^ implode(edstr) ^ "\n"); solve1(str,max,(i+1)))
	else (print("Caesar " ^ Int.toString(i) ^ ": " ^ implode(edstr) ^ "\n"); solve1(str,max,(i+1))))
	end;
	
in
	solve1(upperstr, maxoff, 0)
end;