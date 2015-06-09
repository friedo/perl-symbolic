package Polynomial {
  sub new {
    shift;
    return bless \@_;
  }

  use overload
    '+' => sub {
      my @a = reverse @{ +shift };
      my @b = reverse @{ +shift };
      my $size = @a > @b ? @a : @b;
      my @new;
      for my $i( 0 .. $size ) {
        push @new, $a[$i] + $b[$i];
      }
      return Polynomial->new( reverse @new );
    },
    '""' => sub {
      my @p = @{ +shift };
      my $expr;
      my $degree = @p;
      foreach my $t( @p ) {
        $degree-- and next if $t == 0;
        $expr .= ' + ' . $t if $t > 0;
        $expr .= ' - ' . abs $t if $t < 0;
        $expr .= 'x' if $degree > 1;
        $expr .= '^' . ($degree-1) if $degree > 2;
        $degree--;
      }
      $expr =~ s{^\s+[-+]\s+}{};
      return $expr;
    };

    sub derivative {
      my @p = @{ +shift };
      my $degree = $#p;
      my @new;
      foreach my $t ( @p ) {
          push @new, $t * $degree;
          $degree--;
      }
      pop @new;
      return Polynomial->new( @new );
    }
}


1;
