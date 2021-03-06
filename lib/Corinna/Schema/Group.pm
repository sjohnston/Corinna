package Corinna::Schema::Group;
use utf8;
use strict;
use warnings;

use parent 'Corinna::Schema::Object';

our $VERSION = '2.0';

Corinna::Schema::Group->mk_accessors(qw(elements elementInfo));

sub new {
    my $class = shift;
    my $self  = {@_};

    unless ( $self->{elements} ) {
        $self->{elements} = [];
    }
    unless ( $self->{elementInfo} ) {
        $self->{elementInfo} = {};
    }
    unless ( $self->{contentType} ) {
        $self->{contentType} = "group";
    }

    return bless $self, $class;
}

sub _type_key
{
   my ( $self ) = @_;

   return 'group';
}

1;

__END__

=head1 NAME

B<Corinna::Schema::Group> - Class that represents the META information about a W3C schema B<group>.

=head1 WARNING

This module is used internally by L<Corinna>. You do not normally know much
about this module to actually use L<Corinna>.  It is documented here for
completeness and for L<Corinna> developers. Do not count on the interface of
this module. It may change in any of the subsequent releases. You have been
warned.

=head1 ISA

This class descends from L<Corinna::Schema::Object>.

=head1 SYNOPSIS

    my $g = Corinna::Schema::Group->new();

    $g->set_fields(
        name                   => 'personal',
        scope                  => 'global',
        name_is_auto_generated => 0
    );

    $g->elements( [ 'lastName', 'firstName', 'title', 'dateOfBirth' ] );

    print $g->name();     # prints 'personal'.
    print $g->scope();    # prints 'global'.

=head1 DESCRIPTION

B<Corinna::Schema::Group> is a data-oriented object class that reprsents a W3C
B<group>. It is parsed from the W3C schema and is used a building block for
the produced B<schema model>. Objects of this class contain META information
about the W3C schema B<group> that they represent.

Like other schema object classes, this is a data-oriented object class,
meaning it doesn't have many methods other than a constructor and various
accessors.

=head1 METHODS

=head2 CONSTRUCTORS

=head4 new()

  $class->new(%fields)

B<CONSTRUCTOR>, overriden.

The new() constructor method instantiates a new object. It is inheritable.

Any -named- fields that are passed as parameters are initialized to those
values within the newly created object.

In its overriden form, what this method does is as follows:

=over

=item * sets the I<contentType> field to 'I<group>';

=item * creates the B<elements> array-ref field if not passed already as a parameter;

=item * creates the B<elementInfo> hash-ref field if not passed already as a parameter;

=back

=head2 ACCESSORS

=head3 Inherited accessors

Several accessors are inherited by this class from its ancestor
L<Corinna::Schema::Object>.  Please see L<Corinna::Schema::Object> for a
documentation of those.

=head3 Accessors defined here

=head4 elements()

  my $elems = $object->elements();  # GET
  $object->elements($elems);        # SET

A reference to an array containing the names of the child elements that this
B<group> has.  The array does not take into consideration any differnce
between I<sequence>, I<choice>, or I<all> groupings.

=head4 elementInfo()

  my $ei = $object->elementInfo();  # GET
  $object->elementInfo($ei);        # SET

A reference to a hash whose keys are the names of the child elements, and
whose values are objects of type L<Corinna::Schema::Element>, that give meta
information about those child elements.

=head1 BUGS & CAVEATS

There no known bugs at this time, but this doesn't mean there are aren't any.
Note that, although some testing was done prior to releasing the module, this
should still be considered alpha code.  So use it at your own risk.

Note that there may be other bugs or limitations that the author is not aware
of.

=head1 AUTHOR

Ayhan Ulusoy <dev(at)ulusoy(dot)name>

=head1 COPYRIGHT

  Copyright (C) 2006-2007 Ayhan Ulusoy. All Rights Reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 SEE ALSO

See also L<Corinna>, L<Corinna::ComplexType>, L<Corinna::SimpleType>

If you are curious about the implementation, see L<Corinna::Schema::Parser>,
L<Corinna::Schema::Model>, L<Corinna::Generator>.

If you really want to dig in, see L<Corinna::Schema::Attribute>,
L<Corinna::Schema::AttributeGroup>, L<Corinna::Schema::ComplexType>,
L<Corinna::Schema::Element>, L<Corinna::Schema::Group>,
L<Corinna::Schema::List>, L<Corinna::Schema::SimpleType>,
L<Corinna::Schema::Type>, L<Corinna::Schema::Object>

=cut
