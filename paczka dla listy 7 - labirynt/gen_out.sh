# build and run software on a set of tests
# attempt to find bugs
#make
out=".out_correct"
dot="."
in=".in"
bin="./bin_correct"
tests="./tests/"
for input in ./tests/*.in
do
	base=`basename $input .in`
	base=$tests$base
	echo "$base$in -> $bin -> $base$out"
	$bin < $input > $base$out
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED"
		echo "code:"
		echo $?
		echo "input:"
		echo cat $base$in
		echo "output before crash:"
		echo cat $base$out
		exit
	fi
done
tests="./tests_automated/"
for input in ./tests_automated/*.in
do
	base=`basename $input .in`
	base=$tests$base
	echo "$base$in -> $bin -> $base$out"
	$bin < $input > $base$out
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED"
		echo "code:"
		echo $?
		echo "input:"
		echo cat $base$in
		echo "output before crash:"
		echo cat $base$out
		exit
	fi
done

echo "ALL TESTS PREPARED [✔]"
