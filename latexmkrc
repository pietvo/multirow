$ENV{'TZ'} = 'America/La Paz';

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}

$makeindex = 'makeindex -s gind.ist -o %D %S';

push @generated_exts, 'glo', 'gls', 'glg', 'sty', 'txt';

$pdflatex = 'internal mylatex';
sub mylatex { 
	my @args = @_;
	(my $base = $$Psource) =~ s/\.[^.]+$//;
	system("latex $base.ins");
	system("sed -e s/\\\\\\\\jobname/$base/g $base.dtx > $base.tex");
	return system("pdflatex @args");
}
