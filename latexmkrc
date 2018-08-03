$ENV{'TZ'} = 'America/La Paz';

@default_files = ('multirow.tex','multirow.dtx');

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}

$makeindex = 'makeindex -s gind.ist %S';

	push @generated_exts, 'glo', 'gls', 'glg', 'sty', 'xxx';


system('ls -lR > xxx.xxx');

add_cus_dep('pdf', 'sty', 1, 'makedtx2sty');
sub makedtx2sty {
    system("latex \"$_[0].dtx\"; ls -lR >> xxx.xxx");
}