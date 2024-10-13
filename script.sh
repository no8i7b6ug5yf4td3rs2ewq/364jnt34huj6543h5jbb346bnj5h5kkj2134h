FILE="index.html"
echo "<h1>AA Chapters</h1>" > $FILE
echo "<table><tr><th>Chapter</th><th>Last Modified</th><th>ETag</th></tr>" >> $FILE

for i in $(seq 1 6);
do
    echo "chapter $i"
    echo "<tr><td>$i</td>" >> $FILE
    data=`curl -Is $URL/capitolo$i.pdf`
    lastM=`echo "$data" | grep "Last-Modified" | cut -c16-`
    etag=`echo "$data" | grep "ETag" | cut -c7-`
    echo "<td>$lastM</td>" >> $FILE
    echo "<td>$etag</td>" >> $FILE
    echo "</tr>" >> $FILE
done

echo "</table>" >> $FILE

echo "done"