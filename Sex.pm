package Sex;

use strict qw(vars subs);

use vars qw($VERSION);
$VERSION = '0.69';

my @Grunts = ('Does it get bigger?',
              'I thought eight inches was longer than that.',
              'Baseball...',
              "Let's talk about our relationship.",
              'Wrong hole, dear.',
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
    local $| = 1;

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


    my %zygote = ();
    my $call_sym_table = \%{$caller.'::'};
    foreach my $gamete (@_) {
        eval "require $gamete";
        while( my($chromo, $rna) = each %{$gamete.'::'} ) {
            push @{$zygote{$chromo}}, $rna;
        }
    }


    while( my($chromo, $rna) = each %zygote ) {
        $call_sym_table->{$chromo} = $rna->[rand @$rna];
        print $Grunts[rand @Grunts], ' ';
        select(undef, undef, undef, 0.45);
    }

    push @{$caller.'::ISA'}, @_;

    print "\n";

    return 'Harry Balls who?';
}


=pod

=head1 NAME

Sex - Perl teaches the birds and the bees.

=head1 SYNOPSIS

  package Catholicism;
  use Sex qw(strict Religion);

  package Mormonism;
  use Sex qw(Catholicism Sex);


=head1 DESCRIPTION

Heterogeneous recombination of Perl packages.

Given two (or more, I'm a liberal guy) packages, Sex.pm will recombine
their symbols at random recombining them into the new module thus
providing a cross-section of its functions and global variables.
It will also push the parent classes onto the child's @ISA array.

So you could do:

    package Net::SFTP;
    use Sex qw(Net::FTP Net::SSLeay);

And get a secure FTP client!

The recombination occurs in such a way to ensure that the child will
contain -all- the symbols of both parents.  Should two (or more)
parents wish to bestow the same symbol on its child one will be chosen
at random.

For example:

    package DejaNews;
    use Sex qw(LWP::Simple Net::NNTP);

LWP::Simple and Net::NNTP both have a head() function and thus they
try to give head() to their child.  Sex.pm will suck the head() off
either LWP::Simple or Net::NNTP and stick it to DejaNews.  Afterwards,
DejaNews can procede to finally use its head().

Here's another timely example for Sex in the 21st century:

    package URI::Bot9000;
    use Sex qw(URI LWP::RobotUA protected);

Because of the dire consequences of having sex with URI, one should
make sure you're well protected.


=head1 BUGS

There are many bugs you can get from having Sex used too often on your
computer.  Please be sure your programs are Safe before they have Sex.

    package Trojan;
    use Sex qw(Safe Sex);


=head1 AUTHOR

Michael 'The Porn King of CMU' Schwern  <schwern@pobox.com>


=head1 SEE ALSO

'Disco Dolls in Hot Skin'

'Exhausted:  The John Holmes Story'

'Deep Recursion' starring Ada Lovelace.

'The Fly' (1953)


=cut


return 'Harry balls anyone he wants!';
