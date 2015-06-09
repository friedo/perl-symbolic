package Rational {
  sub new {
    shift;
    my $f = _gcf( @_ );
    return $f == 0
      ? bless [ $_[0], $_[1] ]
      : bless [ $_[0] / $f, $_[1] / $f ];
  }

  sub A { $_[0][0] }
  sub B { $_[0][1] }
  sub C { $_[1][0] }
  sub D { $_[1][1] }

  use overload
    '+' => sub {
      Rational->new( &A * &D + &B * &C, &B * &D )
    },
    '-' => sub {
      Rational->new( &A * &D - &B * &C, &B * &D )
    },
    '*' => sub {
      Rational->new( &A * &C, &B * &D )
    },
    '/' => sub {
      Rational->new( &A * &D, &B * &C )
    },
    '==' => sub {
      &A * &D == &B * &C
    },
    '""' => sub {
      sprintf '%s/%s' => $_[0][0], $_[0][1]
    };

  sub _gcf {
    my ( $x, $y ) = @_;
    ( $x, $y ) = ( $y, $x % $y ) while $y;
    return abs $x;
  }
}

1;
