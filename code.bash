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


commands in terminal 

delete a folder 

rm -r file_name


mv rename_files.sh ../50 && cd ../50/ && source rename_files.sh
