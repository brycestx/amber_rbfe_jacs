#!/bin/bash
echo RUNNING ON `hostname`!
LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda-9.1/lib64:$LD_LIBRARY_PATH
t=1
LAMVALS=( 0.0 0.25 0.5 0.75 1.0 )
LAM=${LAMVALS[SLURM_ARRAY_TASK_ID]}
cd $LAM
FILE=ti-$LAM-$t.out
STR='Total wall time'
if [ -f $FILE ]; then
grep "$STR" $FILE
RESULT=$?
if [ $RESULT -eq 0 ]; then
echo 'No need to submit TI jobs.'
exit 0
fi
fi
$AMBERHOME/bin/pmemd -i min.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.rst7 -ref $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.rst7 -O -o min.out -inf min.info -e min.en -r min.rst7 -l min.log -x min.nc
$AMBERHOME/bin/pmemd.cuda -i heat-1.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c min.rst7 -ref min.rst7 -O -o heat-1.out -inf heat-1.info -e heat-1.en -r heat-1.rst7 -l heat-1.log -x heat-1.nc
$AMBERHOME/bin/pmemd.cuda -i press-1.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c heat-1.rst7 -ref heat-1.rst7 -O -o press-1.out -inf press-1.info -e press-1.en -r press-1.rst7 -l press-1.log -x press-1.nc
$AMBERHOME/bin/pmemd.cuda -i heat-2.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c press-1.rst7 -ref press-1.rst7 -O -o heat-2.out -inf heat-2.info -e heat-2.en -r heat-2.rst7 -l heat-2.log -x heat-2.nc
$AMBERHOME/bin/pmemd.cuda -i press-2.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c heat-2.rst7 -ref heat-2.rst7 -O -o press-2.out -inf press-2.info -e press-2.en -r press-2.rst7 -l press-2.log -x press-2.nc
$AMBERHOME/bin/pmemd.cuda -i heat-3.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c press-2.rst7 -ref press-2.rst7 -O -o heat-3.out -inf heat-3.info -e heat-3.en -r heat-3.rst7 -l heat-3.log -x heat-3.nc
$AMBERHOME/bin/pmemd.cuda -i press-3.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c heat-3.rst7 -ref heat-3.rst7 -O -o press-3.out -inf press-3.info -e press-3.en -r press-3.rst7 -l press-3.log -x press-3.nc
$AMBERHOME/bin/pmemd.cuda -i ti-$LAM.in -p $BASEDIR/_perturbations/CAT-17b~CAT-13d_ambest/complex/decharge/complex-decharge.parm7 -c press-3.rst7 -ref press-3.rst7 -O -o ti-$LAM-$t.out -inf ti-$LAM-$t.info -e ti-$LAM-$t.en -r ti-$LAM-$t.rst7 -l ti-$LAM-$t.log -x ti-$LAM-$t.nc
cd ..
