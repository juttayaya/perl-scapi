use utf8;
package scapi::Schema::Result::Study;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

scapi::Schema::Result::Study

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

=head1 TABLE: C<study>

=cut

__PACKAGE__->table("study");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 project_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "project_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 project

Type: belongs_to

Related object: L<scapi::Schema::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project",
  "scapi::Schema::Result::Project",
  { id => "project_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

=head2 study_gene_mutations

Type: has_many

Related object: L<scapi::Schema::Result::StudyGeneMutation>

=cut

__PACKAGE__->has_many(
  "study_gene_mutations",
  "scapi::Schema::Result::StudyGeneMutation",
  { "foreign.study_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 gene_mutations

Type: many_to_many

Composing rels: L</study_gene_mutations> -> gene_mutation

=cut

__PACKAGE__->many_to_many("gene_mutations", "study_gene_mutations", "gene_mutation");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-11-12 16:48:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3ORW/IVRN0JCLaMaTdYvmg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
