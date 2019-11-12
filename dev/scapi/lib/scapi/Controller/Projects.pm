package scapi::Controller::Projects;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

scapi::Controller::Projects - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(projects => [$c->model('DB::Project')->all]);
    $c->stash(template => 'projects/list.tt');
}

sub add_project :Chained('base') :PathPart('add_project') :Args(0) {
    my ($self, $c) = @_;

    my $project_name = $c->request->params->{project_name};
    my $project = $c->model('DB::Project')->create({
        name => $project_name
    });

    $c->redirect_to_action('index');
}


=encoding utf8

=head1 AUTHOR

Jirawat Uttayaya

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
