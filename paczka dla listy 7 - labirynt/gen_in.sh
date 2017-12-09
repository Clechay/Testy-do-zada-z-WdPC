# build and run software on a set of tests
# attempt to find bugs
#make test_writer
_dot="."
_out=".out"
_out_correct=".out_correct"
_in=".in"
_bin="./bin"
_tw="./test_writer"
_tests="./tests_automated/"
echo "this should take about 60 sec on mobile 3rd gen intel i7 (number of cpu cores is meaningless)"

_prefix="00_tiny_"
echo "doing tiny"
for base in `seq -w 1 500`
do
	base=$_tests$_prefix$base
#	echo "$_tw -> $base$_in"
	$_tw 3 3 < /dev/urandom > $base$_in
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED [x]"
		echo "code:"
		echo $?
		echo "input:"
		echo $base$_in
		echo cat $base$_in
		exit
	fi
done


_prefix="01_small_"
echo "doing small"
for base in `seq -w 1 5000`
do
	base=$_tests$_prefix$base
#	echo "$_tw -> $base$_in"
	$_tw 5 5 < /dev/urandom > $base$_in
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED [x]"
		echo "code:"
		echo $?
		echo "input:"
		echo $base$_in
		echo cat $base$_in
		exit
	fi
done

echo "doing med"
_prefix="02_medium_"
for base in `seq -w 1 3000`
do
	base=$_tests$_prefix$base
#	echo "$_tw -> $base$_in"
	$_tw 25 25 < /dev/urandom > $base$_in
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED [x]"
		echo "code:"
		echo $?
		echo "input:"
		echo $base$_in
		echo cat $base$_in
		exit
	fi
done

echo "doing big"
_prefix="03_big_"
for base in `seq -w 1 1000`
do
	base=$_tests$_prefix$base
	echo "$_tw -> $base$_in"
	$_tw 70 70 < /dev/urandom > $base$_in
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED [x]"
		echo "code:"
		echo $?
		echo "input:"
		echo $base$_in
		echo cat $base$_in
		exit
	fi
done

echo "doing max"
_prefix="04_max_"
for base in `seq -w 1 1000`
do
	base=$_tests$_prefix$base
	echo "$_tw -> $base$_in"
	$_tw 100 100 < /dev/urandom > $base$_in
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED [x]"
		echo "code:"
		echo $?
		echo "input:"
		echo $base$_in
		echo cat $base$_in
		exit
	fi
done

echo "ALL TESTS PREPARED [✔]"
