#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.10;
use strict;
use warnings;
use utf8;
use if $^V ge v5.12.0, feature => 'unicode_strings';

use Test::More tests => 21;
use Test::Exception;

use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new('br_FR');
is ($locale->locale_name('fr'), 'galleg', 'Name without territory');
is ($locale->locale_name('fr_CA'), 'galleg Kanada', 'Name with known territory') ;
is ($locale->locale_name('fr_BE'), 'galleg (Belgia)', 'Name with unknown territory') ;
is ($locale->locale_name('fr_BE'), 'galleg (Belgia)', 'Cached method') ;
is ($locale->language_name, 'brezhoneg', 'Language name');
is ($locale->language_name('wibble'), 'yezh dianav', 'Unknown Language name');
is ($locale->script_name('Cyrs'), 'kirillek henslavonek', 'Script name');
is ($locale->script_name('wibl'), 'skritur dianav', 'Invalid Script name');
is ($locale->territory_name('GB'), 'Rouantelezh-Unanet', 'Territory name');
is ($locale->territory_name('wibble'), 'Rannved dianav', 'Invalid Territory name');
is ($locale->variant_name('AREVMDA'), 'armenianeg ar Cʼhornôg', 'Variant name');
throws_ok { $locale->variant_name('WIBBLE') } qr{ \A Invalid \s variant }xms, 'Invalid Variant name';
is ($locale->language_name('i_klingon'), 'klingon', 'Language alias');
is ($locale->territory_name('BQ'), 'Nederlandat Karib', 'Territory alias');
is ($locale->territory_name('830'), 'Rannved dianav', 'Territory alias');
is ($locale->variant_name('BOKMAL'), '', 'Variant alias');
is ($locale->key_name('ca'), 'deiziadur', 'Key name');
is ($locale->key_name('calendar'), 'deiziadur', 'Key name');
is ($locale->type_name('ca', 'gregorian'), 'deiziadur gregorian', 'Type name');
is ($locale->type_name('calendar', 'gregorian'), 'deiziadur gregorian', 'Type name');