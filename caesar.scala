/**
 * Thomas Wojnar
 */
 
object Main
{
 
  def encrypt (enstr:String, offset:Int) : String = {
    var i:Int = 0
    var modoff = offset % 26
    var edstr = enstr.toCharArray()
    while(i < enstr.length())  {
      if(((enstr(i) toInt) >= ('A' toInt)) && ((enstr(i) toInt) <= ('Z' toInt))){
        if ((enstr.charAt(i) toInt) + modoff > ('Z' toInt)){
          edstr(i) = ((((enstr(i) toInt) + modoff) - 26) toChar)
        }
        else{
          edstr(i) = (((enstr(i) toInt) + modoff) toChar)
        }
      }
      i = i + 1
    }
    val newstr = edstr.mkString("")
    return newstr
  }
  
  def decrypt (enstr:String, offset:Int) : String = {
    var i:Int = 0
    var modoff = offset % 26
    var edstr = enstr.toCharArray()
    while(i < enstr.length())  {
      if(((enstr(i) toInt) >= ('A' toInt)) && ((enstr(i) toInt) <= ('Z' toInt))){
        if ((enstr.charAt(i) toInt) - modoff < ('A' toInt)){
          edstr(i) = ((((enstr(i) toInt) - modoff) + 26) toChar)
        }
        else{
          edstr(i) = (((enstr(i) toInt) - modoff) toChar)
        }
      }
      i = i + 1
    }
    val newstr = edstr.mkString("")
    return newstr
  }
 
 def solve (enstr:String, maxshift:Int) : String = {
    var i = 0
    var j = 0
    var edstr = enstr.toCharArray()
    var newstr = edstr.mkString("")
    while(j <= maxshift) {
    while(i < enstr.length()) {
      if(((enstr(i) toInt) >= ('A' toInt)) && ((enstr(i) toInt) <= ('Z' toInt))){
        if ((enstr.charAt(i) toInt) + j > ('Z' toInt)){
          edstr(i) = ((((enstr(i) toInt) + j ) - 26) toChar)
        }
        else{
          edstr(i) = (((enstr(i) toInt) + j) toChar)
        }
      }
      i = i + 1
        }
        newstr = edstr.mkString("")
        if(j < 10){
            println("Caesar 0" + j.toString + ": " + newstr)
        }
        else{
            println("Caesar " + j.toString + ": " + newstr)
        }
        i = 0
        j = j + 1
        }
    newstr = edstr.mkString("")
    return newstr
  }
  
  def main(args: Array[String]) {
    println("Please input the string you would like to encrypt: ");
    var enstr:String = readLine;
    println("Please input the number you would like to encrypt by: ");
    var en = readInt;
    enstr = enstr.toUpperCase();
    enstr = encrypt(enstr,en)
    println(enstr);
    
        println("Please input the string you would like to decrypt: ");
    var destr:String = readLine;
        println("Please input the number you would like to decrypt by: ");
    var de = readInt;
    destr = destr.toUpperCase();
    destr = decrypt(destr,de);
    println(destr);
    
    println("Please input the string you would like to solve: ");
    var strsol:String = readLine;
        println("Please input the max shift value: ");
    var max = readInt;
    strsol = strsol.toUpperCase();
    strsol = solve(strsol,max);
  }
}