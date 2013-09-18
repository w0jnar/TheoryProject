! Thomas Wojnar
 
module cae_mod
contains

FUNCTION to_upper(enstr) result(outstr)
     CHARACTER*(*) enstr
     CHARACTER(len=len(enstr)) outstr
     do i = 1, len(enstr)
          if (iachar(enstr(i:i)) .ge. iachar("a") .and. iachar(enstr(i:i)) .le. iachar("z") ) then
               outstr(i:i) = achar(iachar(enstr(i:i))-32)
          else
               outstr(i:i) = enstr(i:i)
          end if
     end do
end function to_upper

FUNCTION encrypt (enstr, offset) result(outstr)
   CHARACTER*(*) enstr
   INTEGER offset
   CHARACTER(len=len(enstr)) outstr 
   modoff = MOD(offset, 26)
   do i = 1, len(enstr)
      if ((IACHAR(enstr(i:i)) .ge. IACHAR("A")) .and. (IACHAR(enstr(i:i)) .le. IACHAR("Z"))) then
         if ((IACHAR(enstr(i:i)) + modoff) > IACHAR("Z")) then
            outstr(i:i) = ACHAR((IACHAR(enstr(i:i)) + modoff) - 26)
         else 
            outstr(i:i) = ACHAR(IACHAR(enstr(i:i)) + modoff)
         end if
      else
        outstr(i:i) = enstr(i:i)
      end if
   enddo
   RETURN
END function encrypt

FUNCTION decrypt (enstr, offset) result(outstr)
   CHARACTER*(*) enstr
   INTEGER offset
   CHARACTER(len=len(enstr)) outstr 
   modoff = MOD(offset, 26)
   do i = 1, len(enstr)
      if ((IACHAR(enstr(i:i)) .ge. IACHAR("A")) .and. (IACHAR(enstr(i:i)) .le. IACHAR("Z"))) then
         if ((IACHAR(enstr(i:i)) - modoff) < IACHAR("A")) then
            outstr(i:i) = ACHAR((IACHAR(enstr(i:i)) - modoff) + 26)
         else 
            outstr(i:i) = ACHAR(IACHAR(enstr(i:i)) - modoff)
         end if
      else
        outstr(i:i) = enstr(i:i)
      end if
   enddo
   RETURN
END function decrypt
 
FUNCTION solve (enstr, maxshift) result(outstr)
   CHARACTER*(*) enstr
   INTEGER maxshift
   CHARACTER(len=len(enstr)) outstr
   CHARACTER*(8) :: prt0 = "Caesar 0"
   CHARACTER*(7) :: prt1 = "Caesar "
   do shift = 0, maxshift
      do i = 1, len(enstr)
         if ((IACHAR(enstr(i:i)) .ge. IACHAR("A")) .and. (IACHAR(enstr(i:i)) .le. IACHAR("Z"))) then
            if ((IACHAR(enstr(i:i)) - 1) < IACHAR("A")) then
               enstr(i:i) = ACHAR((IACHAR(enstr(i:i)) - 1) + 26)
            else 
               enstr(i:i) = ACHAR(IACHAR(enstr(i:i)) - 1)
            end if
         else
            enstr(i:i) = enstr(i:i)
         end if
      enddo
      if (shift .lt. 10) then
         Write (*, "(A)", advance='no') prt0
         Write(*,"(I0.1)", advance='no') int(shift)
         Print *, ": ", enstr
      else
         Write (*, "(A)", advance='no') prt1
         Write(*,"(I0.1)", advance='no') int(shift)
         Print *, ": ", enstr
      end if
   enddo
   outstr = enstr
   RETURN
END function solve

END module cae_mod

  
program Caesar
   use cae_mod
   CHARACTER*(100) stren
   CHARACTER*(100) endstren
   INTEGER inten
   
   Print *, "Enter the string to encrypt: "
   read(*,'(A)') stren
   stren = to_upper(stren)
   Print *, "Enter the shift value to encrypt by: "
   read *, inten
   endstren = encrypt(stren, inten)
   write(*,'(A)') endstren
   
   Print *, "Enter the string to decrypt: "
   read(*,'(A)') stren
   stren = to_upper(stren)
   Print *, "Enter the shift value to decrypt by: "
   read *, inten
   endstren = decrypt(stren, inten)
   write(*,'(A)') endstren

   Print *, "Enter the string to solve: "
   read(*,'(A)') stren
   stren = to_upper(stren)
   Print *, "Enter the max shift value: "
   read *, inten
   endstren =  solve(stren, inten)
   read *
end program Caesar

