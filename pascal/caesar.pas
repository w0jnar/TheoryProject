(*Thomas Wojnar*)

Program Caesar;
Uses sysutils;(*Used for AnsiStrUpper(str);*)

VAR enword : String;
    enoffset: Integer;
    deword : String;
	deoffset: Integer;
    solword : String;
	maxshift: Integer;
	
Function Encrypt(input:String; off:Integer) : String;
VAR letter : Integer;
VAR modoff : Integer := off mod 26;
Begin
     FOR letter:=1 TO length(input) DO
		begin
		   if ((ord(input[letter]) >= ord("A")) and (ord(input[letter]) <= ord("Z"))) then
			   begin
				  if ((ord(input[letter]) + modoff) > ord("Z"))
                      then input[letter] := chr((ord(input[letter]) + modoff) - 26)
			      else input[letter] := chr(ord(input[letter]) + modoff);
			   end;
		   end;
	return input;
End;

Function Decrypt(input:String; off:Integer) : String;
VAR letter : Integer;
VAR demodoff : Integer := off mod 26;
Begin
     FOR letter:=1 TO length(input) DO
		begin
		   if ((ord(input[letter]) >= ord("A")) and (ord(input[letter]) <= ord("Z"))) then
			   begin
					    if ((ord(input[letter]) - demodoff) < ord("A"))
		                   then input[letter] := chr((ord(input[letter]) - demodoff) + 26)
					    else input[letter] := chr(ord(input[letter]) - demodoff);
			   end;
		end;
	return input;
End;

Function Solve(input:String; maxshift:Integer) : String;
VAR letter : Integer;
VAR shift : Integer;
Begin
   FOR shift:= 0 TO maxshift DO
   begin
   FOR letter:=1 TO length(input) DO
	  begin
	     if ((ord(input[letter]) >= ord("A")) and (ord(input[letter]) <= ord("Z"))) then
		     begin
			     if ((ord(input[letter]) - 1) < ord("A"))
		            then input[letter] := chr((ord(input[letter]) - 1) + 26)
			     else input[letter] := chr(ord(input[letter]) - 1);
			 end;
		end;
    if shift < 10 then
       Writeln('Caesar 0', shift,': ', input)
    else Writeln('Caesar ', shift,': ', input);
	end;
	return ('done');
End;

Begin
  Write('Enter the String to encrypt: ');
  Readln(enword);
  AnsiStrUpper(enword);
  Write('Enter the offset to encrpyt : ');
  Readln(enoffset); 
  Writeln(ENCRYPT(enword, enoffset));
  Readln;
  
  Write('Enter the String to decrypt: ');
  Readln(deword);
  AnsiStrUpper(deword);
  Write('Enter the offset to decrpyt : ');
  Readln(deoffset);
  Writeln(DECRYPT(deword, deoffset));
  Readln;

  Write('Enter the String to solve: ');
  Readln(solword);
  AnsiStrUpper(solword);
  Write('Enter the max shift amount: ');
  Readln(maxshift);
  Writeln(SOLVE(solword, maxshift));
  Readln;
End.
