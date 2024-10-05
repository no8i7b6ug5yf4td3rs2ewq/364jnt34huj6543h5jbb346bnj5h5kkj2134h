for i in $(seq 1 6);
do
    echo "capitolo$i"
    wget -O capitolo$i.pdf http://intranet.di.unisa.it/~robdep/AA/dispensa/capitolo$i.pdf
done

echo "done"