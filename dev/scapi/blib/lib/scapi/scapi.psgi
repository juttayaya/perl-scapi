use strict;
use warnings;

use scapi;

my $app = scapi->apply_default_middlewares(scapi->psgi_app);
$app;

