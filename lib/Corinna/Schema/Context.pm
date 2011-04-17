package Corinna::Schema::Context;
use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

#========================================================

use Class::Accessor;
use Corinna::Stack;
use Corinna::Schema::Object;

our @ISA = qw(Class::Accessor);

Corinna::Schema::Context->mk_accessors(
    qw(	counter schema schema_url operation nodeStack targetNamespace));

#------------------------------------------------------------
sub new {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self  = {@_};

    unless ( $self->{nodeStack} ) {
        $self->{nodeStack} = Corinna::Stack->new();
    }

    unless ( defined( $self->{counter} ) ) {
        $self->{counter} = 0;
    }

    return bless $self, $class;
}

#------------------------------------------------------------
sub top_node {
    my $self = shift;
    return $self->nodeStack()->peek();
}

#------------------------------------------------------------
sub find_node {
    my $self  = shift;
    my $args  = {@_};
    my $class = $args->{class};

    my $nodeStack = $self->nodeStack();
    for ( my $i = 0 ; $i < $nodeStack->count() ; $i++ ) {
        my $node = $nodeStack->get($i);

        #		print "\n", ref($node);
        if ( ref($class) =~ /ARRAY/ ) {
            foreach my $c (@$class) {
                if ( UNIVERSAL::isa( $node, $c ) ) {
                    return $node;
                }
            }
        }
        elsif ( UNIVERSAL::isa( $node, $class ) ) {
            return $node;
        }
    }
    return undef;
}

#------------------------------------------------------------
sub name_path {
    my $self      = shift;
    my $args      = {@_};
    my $separator = $args->{separator} || '/';
    my @names     = ();

    my $nodeStack = $self->nodeStack();
    for ( my $i = 0 ; $i < $nodeStack->count() ; $i++ ) {
        my $node = $nodeStack->get($i);
        my $name = undef;
        if ( UNIVERSAL::can( $node, "nameIsAutoGenerated" )
            && $node->nameIsAutoGenerated() )
        {

            # ignore auto-generated names
            $name = undef;
        }
        elsif ( UNIVERSAL::can( $node, "name" ) ) {
            $name = $node->name();
        }
        elsif ( ( ref($node) =~ /HASH/ ) && $node->{name} ) {
            $name = $node->{name};
        }

        if ($name) {
            unshift @names, $name;
        }
    }
    return join $separator, @names;
}

1;
