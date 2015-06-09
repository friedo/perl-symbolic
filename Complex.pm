package Complex {
  sub new {
    shift;
    return bless [ $_[0], $_[1] ];
  }

  sub A { $_[0][0] }
  sub B { $_[0][1] }
  sub C { $_[1][0] }
  sub D { $_[1][1] }

  use overload
    '+' => sub {
      Complex->new( &A + &C, &B + &D )
    },
    '-' => sub {
      Complex->new( &A - &C, &B - &D )
    },
    '*' => sub {
      Complex->new( &A * &C - &B * &D, &B * &C + &A * &D )
    },
    '""' => sub {
      sprintf '%s %s %si'
        => $_[0][0],
           $_[0][1] >= 0 ? '+' : '-',
           abs $_[0][1]
    };

}

1;
