generate.bash

for i in {1..5}
do
   echo "Welcome $i times"
   touch $i.txt
done


rename.bash

n=0;
for i in *.txt; do
	p=$(printf "distorted_%d.txt" ${n})
	mv ${i} ${p}
	n=$((n+1))
done
