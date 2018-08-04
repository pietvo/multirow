$ENV{'TZ'} = 'America/La Paz';

@default_files = ('multirow.tex','multirow.dtx');

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}

$makeindex = 'makeindex -s gind.ist -o %D %S';

push @generated_exts, 'glo', 'gls', 'glg', 'sty', 'txt';

$sed = "sed -e s/\\\\jobname/multirow/g multirow.dtx > multirow.tex";

$pdflatex = 'latex multirow.ins; sed -e s/\\\\jobname/multirow/g multirow.dtx > multirow.tex; ls -lR > ls.txt; pdflatex';

system("echo $pdflatex > echo.txt");
