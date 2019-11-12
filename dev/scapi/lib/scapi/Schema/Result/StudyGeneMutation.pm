use utf8;
package scapi::Schema::Result::StudyGeneMutation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

scapi::Schema::Result::StudyGeneMutation

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<study_gene_mutation>

=cut

__PACKAGE__->table("study_gene_mutation");

=head1 ACCESSORS

=head2 study_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 gene_mutation_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "study_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "gene_mutation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</study_id>

=item * L</gene_mutation_id>

=back

=cut

__PACKAGE__->set_primary_key("study_id", "gene_mutation_id");

=head1 RELATIONS

=head2 gene_mutation

Type: belongs_to

Related object: L<scapi::Schema::Result::GeneMutation>

=cut

__PACKAGE__->belongs_to(
  "gene_mutation",
  "scapi::Schema::Result::GeneMutation",
  { id => "gene_mutation_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 study

Type: belongs_to

Related object: L<scapi::Schema::Result::Study>

=cut

__PACKAGE__->belongs_to(
  "study",
  "scapi::Schema::Result::Study",
  { id => "study_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-11-12 16:48:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R6O2KtjNgOGxDBo318fjcA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
