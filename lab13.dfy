method Sum_of_first_n_natural_numbers(n : nat) returns (sum : nat)
requires n > 0
ensures sum == n*(n+1)/2
{
  var i: nat := 0;
  sum := 0;
  while (i <= n)
  invariant 0<= i <= n+1
  invariant sum == (i-1) * i/2
  {
    sum := sum + i;
    i := i + 1;
  }
}



method Main() {
  var n := 10;
  var sum := Sum_of_first_n_natural_numbers(n);
  print "Sum of the first n numbers is ", sum, "\n";
}