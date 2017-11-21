# build and run software on a set of tests
# attempt to find bugs
make
out=".out"
out_correct=".out_correct"
in=".in"
bin="./bin_correct"
tests="./tests/"
for input in ./tests/*.in
do
	base=`basename $input .in`
	base=$tests$base
	echo "$base$in -> $bin -> $base$out_correct"
	$bin < $input > $base$out_correct
	if [ $? -ne 0 ]; then
		echo "TEST GEN FAILED"
		echo "code:"
		echo $?
		echo "input:"
		echo cat $base$in
		echo "output before crash:"
		echo cat $base$out_correct
		exit
	fi
done

echo "ALL TESTS PREPARED [✔]"
