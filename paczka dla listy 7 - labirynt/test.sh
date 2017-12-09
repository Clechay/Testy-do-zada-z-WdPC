# build and run software on a set of tests
# attempt to find bugs
#make
out=".out_correct"
out2=".out"
dot="."
tests="./tests/"
atests="./tests_automated/"
for input in ./tests/*.in
do
	base=`basename $input .in`
	base=$tests$base
	echo $base$out
	echo $base$out2
	./bin < $input > $base$out2
	diff --ignore-blank-lines $base$out $base$out2 > /dev/null
	if [ $? -ne 0 ]; then
		echo "TEST FAILED [x]"
		echo $?
		diff --ignore-blank-lines $base$out $base$out2
		exit
	fi
	rm $base$out2
done
for input in ./tests_automated/*.in
do
	base=`basename $input .in`
	base=$atests$base
	echo $base$out
	echo $base$out2
	./bin < $input > $base$out2
	diff --ignore-blank-lines $base$out $base$out2 > /dev/null
	if [ $? -ne 0 ]; then
		echo "TEST FAILED [x]"
		echo $?
		diff --ignore-blank-lines $base$out $base$out2
		exit
	fi
	rm $base$out2
done

echo "ALL TEST PASSED [✔]"
