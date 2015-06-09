package Linear {
  use Rational;
  sub new {
    shift;
    return bless [ $_[0], $_[1] ];
  }

  sub solve {
    return ( Rational->new(0, 1) - $_[0][1] )
           / $_[0][0]
  }
}

1;
