$ENV{'TZ'} = 'Europe/Amsterdam';

@default_files = ('multirow.tex','multirow.dtx');

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}

$makeindex = 'makeindex -s gind.ist -o %D %S';

push @generated_exts, 'glo', 'gls', 'glg', 'sty', 'txt';


add_cus_dep('aux', 'sty', 1, 'makedtx2sty');
sub makedtx2sty {
    system("latex \"$_[0].ins\"; ls -lR >> xxx.txt");
}p