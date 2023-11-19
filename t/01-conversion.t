#!perl -T

use 5.014;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Pod::AsciiDoctor ();

my $adoc = Pod::AsciiDoctor->new();
$adoc->parse_from_file("t/data/pod.pm");

# Test C<...>
like(
    $adoc->adoc(),
    qr/`\$x >> 3` or even `\$y >> 5`/,
    "Converted C<<< \$x >> 3 >>> or even C<<<< \$y >> 5 >>>>.",
);

# Test B<...>
like( $adoc->adoc(), qr/\*test\*/, "bold markup", );

# Test I<...>
like( $adoc->adoc(), qr/_grand_/, "italics markup", );

# Test L<text|http://...>
like(
    $adoc->adoc(),
    qr/reference \[Asciidoctor User Manual\]/,
    "hyperlink markup",
);

done_testing();
