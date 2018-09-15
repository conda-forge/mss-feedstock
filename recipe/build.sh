export PROJ_LIB=`$PYTHON ./helper.py`
$PYTHON setup.py install --single-version-externally-managed --record record.txt
