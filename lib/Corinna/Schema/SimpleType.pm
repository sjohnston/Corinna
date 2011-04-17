package Corinna::Schema::SimpleType;
use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

#=================================================
use Corinna::Schema::Type;
our @ISA = qw(Corinna::Schema::Type);

Corinna::Schema::SimpleType->mk_accessors(
    qw(
      enumeration
      itemType
      itemClass
      length
      memberTypes
      memberClasses
      minLength
      maxLength
      minInclusive
      maxInclusive
      minExclusive
      maxExclusive
      pattern
      regex
      totalDigits
      fractionDigits
      whiteSpace
      )
);

sub new {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self  = {@_};

    unless ( $self->{contentType} ) {
        $self->{contentType} = "simple";
    }

    return bless $self, $class;
}

1;

__END__

=head1 NAME

B<Corinna::Schema::SimpleType> - Class that represents the META information about a W3C schema simple type.

=head1 WARNING

This module is used internally by L<Corinna>. You do not normally know much about this module to actually use L<Corinna>.  It is 
documented here for completeness and for L<Corinna> developers. Do not count on the interface of this module. It may change in 
any of the subsequent releases. You have been warned. 

=head1 ISA

This class descends from L<Corinna::Schema::Type> and hence from <Corinna::Schema::Object>.


=head1 SYNOPSIS
  
  my $type = Corinna::Schema::SimpleType->new();
  
  $type->set_fields(name => 'CountryCode', scope=> 'global', nameIsAutoGenerated=>0);
  $type->base('LocationCode');
  $type->derivedBy('restriction');
  
  print $type->name();  # prints 'CountryCode'.
  print $type->scope(); # prints 'global'.
  print $type->base();  # prints 'LocationCode'.
  print $type->derivedBy(); # prints 'restriction'.
  

=head1 DESCRIPTION

B<Corinna::Schema::SimpleType> is a data-oriented object class that reprsents a W3C Simple Type. It is
parsed from the W3C schema and is used a building block for the produced B<schema model>. It is also used 
embedded as class data within the simple classes generated by L<Corinna>. This way, objects of this 
class contain META information about the W3C schema simple type that they represent. 

Like other schema object classes, this is a data-oriented object class, meaning it doesn't have many methods other 
than a constructor and various accessors. 

=head1 METHODS

=head2 CONSTRUCTORS
 
=head4 new() 

  $class->new(%fields)

B<CONSTRUCTOR>, overridden. 

The new() constructor method instantiates a new object. It is inheritable. 
  
Any -named- fields that are passed as parameters are initialized to those values within
the newly created object. 

In its overriden form, what this method does is to set the I<contentType> field to 'I<simple>'.

.

=head2 ACCESSORS

=head3 Inherited accessors

Several accessors are inherited by this class from its ancestors L<Corinna::Schema::Type> and L<Corinna::Schema::Object>. 
Please see L<Corinna::Schema::Type> and L<Corinna::Schema::Object> for a documentation of those.

=head3 Accessors defined here

=head4 enumeration()

  my $enum = $object->enumeration();    # GET
  $object->enumeration($enum);          # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

Returns (GET) and expects (SET) a hash reference that represent the enumeration values that
the simple type can accept. The hash keys are the enumeration values and the hash values are all
set to 1. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 fractionDigits()

  my $fd = $object->fractionDigits();  # GET
  $object->fractionDigits($fd);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies the number of fractional digits that numeric values of this simple type 
must have. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 length()

  my $len = $object->length();  # GET
  $object->length($len);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

Returns (GET) and expects (SET) an integer value representing the exact string length of the 
simple type value must have for it to pass validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 itemType()

  my $it = $object->itemType(); # GET
  $object->itemType($it);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

Returns (GET) and expects (SET) a string value that represents the type of the items in a 'B<list>' type. 
A W3C list type is a whitespace separeted list of tokens (called items) which must have a common atomic type. 
This value is obtained from the W3C schema by the parser and is later used for validation.

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.
 
=head4 itemClass()

  my $cls = $object->itemClass();   # GET
  $object->itemClass($cls);        # SET

This is NOT a W3C facet. It is computed. 

Returns (GET) and expects (SET) a Perl Class name that represents the type of the items in a 'B<list>' type. 
A W3C list type is a whitespace separeted list of tokens (called items) which must have a common atomic type. 
This value is computed from the I<itemType> at schema model resolution time and is later used for validation.

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 maxExclusive()

  my $max = $object->maxExclusive();  # GET
  $object->maxExclusive($max);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies a numeric value that the values of this simple type 
must be less than. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 maxInclusive()

  my $max = $object->maxInclusive();  # GET
  $object->maxInclusive($max);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies the B<maximum> numeric value that the values of this simple type 
can have. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 maxLength()

  my $maxLen = $object->maxLength();  # GET
  $object->maxLength($maxLen);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies the B<maximum> string length that the values of this simple type 
can have. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 memberTypes()

  my $mt = $object->memberTypes();  # GET
  $object->memberTypes($mt);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This is a whitespace separated list of member type names in the context of a W3C B<union>. 
The value is retrieved from the W3C schema and further enriched by the implicit (local) type 
names by the schema parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 memberClasses()

  my $mc = $object->memberClasses();  # GET
  $object->memberClasses($mc);        # SET

This is NOT a W3C facet. It is computed. 

This is a reference to an array of Perl classes each of which represent a I<type> mentioned 
in L</memberTypes()>.  So it makes sense only in a W3C B<union> context. The value is computed at 
schema model resolution time. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 minExclusive()

  my $min = $object->minExclusive();  # GET
  $object->minExclusive($min);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies a numeric value that the values of this simple type 
must be greater than. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 minInclusive()

  my $min = $object->minInclusive();  # GET
  $object->minInclusive($min);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies the B<minimum> numeric value that the values of this simple type 
can have. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 minLength()

  my $minLen = $object->minLength();  # GET
  $object->minLength($minLen);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies the B<minimum> string length that the values of this simple type 
can have. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 pattern()

  my $pat = $object->pattern();  # GET
  $object->pattern($pat);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, gives a W3C regular expression to which the values of this simple type
must match. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 regex()

  my $rgx = $object->regex();  # GET
  $object->regex($rgx);        # SET

This is NOT a W3C facet. But it is used as such internally by L<Corinna> in order to give 
constraints to builtin types. 

This field, if present, gives a Perl regular expression to which the values of this simple type
must match. It is similar to the L</pattern()> field accept that the B<regex()> field will always be guaranteed 
to be a Perl regular expression whereas 'pattern' may digresse in the future. 
This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.

=head4 totalDigits()

  my $td = $object->totalDigits();  # GET
  $object->totalDigits($td);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies the total number of digits that numeric values of this simple type 
must have. This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head4 whiteSpace()

  my $ws= $object->whiteSpace();  # GET
  $object->whiteSpace($ws);        # SET

This is a W3C facet. For more information please refer to W3C XML schema documentation.

This field, if present, signifies treatment of whitespace within a the values of this simple type upon validation. 
Currently, three values are possible => 'I<preserve>'(default), 'I<collapse>', 'I<replace>'. 
This is obtained directly from the W3C schema and placed here by the parser. It is later used for validation. 

This accessor is created by a call to B<mk_accessors> from L<Class::Accessor>.


=head1 BUGS & CAVEATS

There no known bugs at this time, but this doesn't mean there are aren't any. 
Note that, although some testing was done prior to releasing the module, this should still be considered alpha code. 
So use it at your own risk.

Note that there may be other bugs or limitations that the author is not aware of.

=head1 AUTHOR

Ayhan Ulusoy <dev(at)ulusoy(dot)name>


=head1 COPYRIGHT

  Copyright (C) 2006-2007 Ayhan Ulusoy. All Rights Reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.


=head1 SEE ALSO

See also L<Corinna>, L<Corinna::ComplexType>, L<Corinna::SimpleType>

If you are curious about the implementation, see L<Corinna::Schema::Parser>,
L<Corinna::Schema::Model>, L<Corinna::Generator>.

If you really want to dig in, see L<Corinna::Schema::Attribute>, L<Corinna::Schema::AttributeGroup>,
L<Corinna::Schema::ComplexType>, L<Corinna::Schema::Element>, L<Corinna::Schema::Group>,
L<Corinna::Schema::List>, L<Corinna::Schema::SimpleType>, L<Corinna::Schema::Type>, 
L<Corinna::Schema::Object>

=cut
