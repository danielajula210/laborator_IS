/*
//1.1

method Triple (x: int ) returns (r: int){
    var y := 2 * x;
    r := x + y;
}

//If x is 10, what value does the method assign to r?
//R: 30

method m(){
    var t := Triple (18);
}
//What is the value of t?
//R: 54
*/
/*
//1.2
method Triple (x: int ) returns (r: int){
    var y := 2 * x;
    r := x + y;
assert r == 3 * x;
}
//What is the result?
//R:True
method Triple (x: int ) returns (r: int){
    var y := 2 * x;
    r := x + y;
assert r == 3 * x + 1;
}
//Change the asserted condition to 3*x+1. What is now the result?
//R:False
*/


//1.3
/*
method Triple (x: int ) returns (r: int){
    var y := 2 * x;
    r := x + y;
    assert r == 10 * x;
    assert r < 0;
    assert false ;
}
//Run it in the Dafny IDE. What do you observe? Change the second assertion to make the verifier
//complain about the first two assertions but not about the third.
//

*/

/*
//1.4

method Triple (x: int ) returns (r: int){
    if x == 0{
        r := 0;
    } else {
        var y := 2 * x;
        r := x + y;
    }
    assert r == 3 * x;
}

method Triple2 (x: int ) returns (r: int)
{
    if {
        case x < 18 =>
            var a, b := 2 * x, 4 * x;
            r := (a+b) / 2;
        case 0 <= x =>
            var y := 2 * x;
            r := x + y;
    }
    assert r == 3 * x;
}

method Main() {
  var a := 10;
  var b := 0;
  var ta := Triple(a);
  var tb := Triple(b);
  
  var t2a := Triple2(a);
  var t2b := Triple2(b);

  print "Triple of a = ", ta, "\n";
  print "Triple of b = ", tb, "\n";

  print "Triple of a = ", t2a, "\n";
  print "Triple of b = ", t2b, "\n";
}

*/

//1.5

method Caller ()
{
    var result := Triple (18) ;
    assert result < 100;
}

method Triple (x: int ) returns (r: int)
ensures r == 3 * x
{
    var y := 2 * x;
    r := x + y;
}
method Triple2 (x: int ) returns (r: int)
requires (x + 1) / 2 == x / 2
ensures r == 3 * x
{
    var y := x / 2;
    r := 6 * y;
}
//1.
//R:    
//2. Explain the role of the precondition and postcondition.
//R: The role of the precondition and post condition is to ensure that the function works as intended.
//3. Remove (or comment out) the precondition of Triple. What error does the verifier give you?
//R:a postcondition could not be proved on this return path
//4. Write two stronger alternatives to the precondition x % 2 == 0 that also make the method Triple verify.
//R: (x + 1) / 2 == x / 2