$ENV{'TZ'} = 'America/La Paz';

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}

$makeindex = 'makeindex -s gind.ist -o %D %S';

push @generated_exts, 'glo', 'gls', 'glg', 'sty', 'txt';

# Shell commands

$create_sty = 'latex %R.ins';

# backslashes will be interpreted three times:
# (1) in the per string (2) by the shell (3) by the sed regexp handler
# therefore we need 8 backslashes to match a single one.

$create_tex = 'sed -e s/\\\\\\\\jobname/%R/g %R.dtx > %R.tex';

$pdflatex = "$create_sty ; $create_tex ; pdflatex %S";


