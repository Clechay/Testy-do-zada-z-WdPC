# build and run software on a set of tests
# attempt to find bugs
make
out=".out"
out_correct=".out_correct"
in=".in"
bin="./bin"
tests="./tests/"
for input in ./tests/*.in
do
	base=`basename $input .in`
	base=$tests$base
	echo "$base$in -> $bin -> $base$out"
	./bin < $input > $base$out
	sdiff $base$out $base$out_correct > /dev/null
	if [ $? -ne 0 ]; then
		echo "TEST '$base' FAILED [x]"
		echo "code:"
		echo $?
		sdiff $base$out $base$out_correct
		exit
	fi
	rm $base$out
done

echo "ALL TESTS PASSED [✔]"
