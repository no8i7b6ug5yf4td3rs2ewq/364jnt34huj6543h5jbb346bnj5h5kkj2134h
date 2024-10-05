FILE="index.html"
echo "<h1>AA Chapters</h1>" > $FILE
echo "<table><tr><th>Chapter</th><th>Last Modified</th></tr>" >> $FILE

for i in $(seq 1 6);
do
    echo "chapter $i"
    echo "<tr><td>$i</td>" >> $FILE
    lastM=`curl -Is $URL/capitolo$i.pdf | grep "Last-Modified"`
    echo "<td>$lastM</td>" >> $FILE
    echo "</tr>" >> $FILE
done

echo "</table>" >> $FILE

echo "done"