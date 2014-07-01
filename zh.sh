FILE=$1
grep -E 'ipv4.[^*]' $FILE | cut -f 2,4,5 -d'|'|sed -e 's/|/ /g' | while read country ip cnt
do
mask=`echo "scale=10; 32-l($cnt)/l(2)+0.001" | bc -l |awk -F"." '{print $1}'`
        echo $ip/$mask >> $country.txt
        #echo $ip/$mask
done
