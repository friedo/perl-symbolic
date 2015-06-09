package Quadratic {
  sub new {
    shift;
    return bless [ $_[0], $_[1], $_[3] ];
  }

  sub solve {
    my @q = @{ +shift };
    my $sqrt = sqrt( $q[1]**2 - 4*$q[0]*$q[3] );
    my $negb = 0 - $q[1];
    my $nump = $negb + $sqrt;
    my $numm = $negb - $sqrt;
    my $twoA = $q[0] * 2;
    return ( $nump / $twoA, $numm / $twoA )
  }
}

1;
