$AMBERHOME/bin/pmemd -i min.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c $BASEDIR/_complexes/Bace^CAT-13i/complex.rst7 -ref $BASEDIR/_complexes/Bace^CAT-13i/complex.rst7 -O -o min.out -inf min.info -e min.en -r min.rst7 -l min.log -x min.nc
$AMBERHOME/bin/pmemd.cuda -i heat-1.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c min.rst7 -ref min.rst7 -O -o heat-1.out -inf heat-1.info -e heat-1.en -r heat-1.rst7 -l heat-1.log -x heat-1.nc
$AMBERHOME/bin/pmemd.cuda -i press-1.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c heat-1.rst7 -ref heat-1.rst7 -O -o press-1.out -inf press-1.info -e press-1.en -r press-1.rst7 -l press-1.log -x press-1.nc
$AMBERHOME/bin/pmemd.cuda -i heat-2.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c press-1.rst7 -ref press-1.rst7 -O -o heat-2.out -inf heat-2.info -e heat-2.en -r heat-2.rst7 -l heat-2.log -x heat-2.nc
$AMBERHOME/bin/pmemd.cuda -i press-2.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c heat-2.rst7 -ref heat-2.rst7 -O -o press-2.out -inf press-2.info -e press-2.en -r press-2.rst7 -l press-2.log -x press-2.nc
$AMBERHOME/bin/pmemd.cuda -i heat-3.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c press-2.rst7 -ref press-2.rst7 -O -o heat-3.out -inf heat-3.info -e heat-3.en -r heat-3.rst7 -l heat-3.log -x heat-3.nc
$AMBERHOME/bin/pmemd.cuda -i press-3.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c heat-3.rst7 -ref heat-3.rst7 -O -o press-3.out -inf press-3.info -e press-3.en -r press-3.rst7 -l press-3.log -x press-3.nc
$AMBERHOME/bin/pmemd.cuda -i relax-01.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c press-3.rst7 -ref press-3.rst7 -O -o relax-01.out -inf relax-01.info -e relax-01.en -r relax-01.rst7 -l relax-01.log -x relax-01.nc
$AMBERHOME/bin/pmemd.cuda -i relax-02.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c relax-01.rst7 -ref relax-01.rst7 -O -o relax-02.out -inf relax-02.info -e relax-02.en -r relax-02.rst7 -l relax-02.log -x relax-02.nc
$AMBERHOME/bin/pmemd.cuda -i relax-03.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c relax-02.rst7 -ref relax-02.rst7 -O -o relax-03.out -inf relax-03.info -e relax-03.en -r relax-03.rst7 -l relax-03.log -x relax-03.nc
$AMBERHOME/bin/pmemd.cuda -i relax-04.in -p $BASEDIR/_complexes/Bace^CAT-13i/complex.parm7 -c relax-03.rst7 -ref relax-03.rst7 -O -o relax-04.out -inf relax-04.info -e relax-04.en -r relax-04.rst7 -l relax-04.log -x relax-04.nc
