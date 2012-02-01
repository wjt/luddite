#!/usr/bin/perl
use strict;
use Irssi;

our $VERSION = '0.0.1';
our %IRSSI = (
    authors     => 'wjt',
    contact     => 'will@willthompson.co.uk',
    name        => 'luddite',
    description => 'replaces ``luddite quotes\'\' with “real quotes”',
    license     => 'WTFPL v2',
    url         => 'http://willthompson.co.uk/irssi/',
);

sub handle_msg {
    my ($server, $msg, $nick, $address, $target) = @_;

    if ($msg =~ m/``.*''/) {
        $msg =~ s/``(.*?)''/“$1”/g;
        Irssi::signal_emit('message public',
            $server, $msg, $nick, $address, $target);
        Irssi::signal_stop();
    }
}

Irssi::signal_add_first('message public', 'handle_msg');
