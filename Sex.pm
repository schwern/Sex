package Sex;

use vars qw($VERSION);
$VERSION = '0.01';

my @grunts = ('Does it get bigger?',
              'I thought eight inches was longer than that.',
              'Baseball...',
              "Let's talk about our relationship.",
              qw(Yes!
                 Oh!
                 Harder!
                 YEAH!
                 YES!
                 OOOooooh...
                 Baby.
                 MORE!
                 Mmmmmm...
                 There!
                )
              );

sub import {
    my($class) = shift;
    my($caller) = caller;

    if( !@_ ) {
        die "It takes two to tango, babe.\n";
    }
    elsif( @_ == 1 ) {
        if( $_[0] eq $caller ) {
            die <<MASTURBATION;
  masturbation
       n : manual stimulation of the genital organs (of yourself or
           another) for sexual pleasure [syn: {onanism}, {self-abuse}]
MASTURBATION

        }
        else {
            die "Parthenogenesis isn't currently supported by ".
                __PACKAGE__ . "\n";
        }
    }
    elsif( @_ > 2 ) {
        warn "More than two sex partners?  ".
             "Kinky (and illegal in many states).\n";
    }

    
    my $call_sym_table = \%{$caller.'::'};
    foreach my $pack (@_) {
        eval "require $pack";
        my $sym_table = \%{$pack.'::'};

        my @zygote = grep { rand(2) } keys %$sym_table;

        foreach my $chromo (@zygote) {
            $call_sym_table->{$chromo} = $sym_table->{$chromo};
            $| = 1;
            print $grunts[rand @grunts], " ";
            select(undef, undef, undef, .7);
        }


    }
    print "\n";

    return 'Harry Balls who?';
}


=pod

=head1 NAME

Sex - Perl teaches the birds and the bees.

=head1 SYNOPSIS

  package Catholicism;
  use Sex qw(strict Religion);


=head1 DESCRIPTION

Heterogeneous recombination of Perl packages.

Given two (or more, I'm a liberal guy) packages, Sex.pm will recombine
their symbols at random recombining them into the new module.

So you could do:

    package Net::SFTP;
    use Sex qw(Net::FTP Net::SSLeay);

And get a secure FTP client!

=head1 AUTHOR

Michael 'The Porn King of CMU' Schwern  <schwern@pobox.com>


=head1 SEE ALSO

'Disco Dolls in Hot Skin'

=cut


return 'Harry balls anyone he wants!';
