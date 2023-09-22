git clone git@github.com:DenisBorisov-lab/linux-data.git
mkdir formated-linux-data
touch log_file.txt
echo "Moved files:" > log_file.txt
cd linux-data
find . -name "*.json" >> ../log_file.txt
for file in ./*.json;
do
cp $file ../formated-linux-data
done
cd .. && echo "Deleted files:" >> log_file.txt
find ./linux-data -name "*.txt" >> log_file.txt
echo "All logs from json files:" >> log_file.txt
rm -r -f linux-data
cd formated-linux-data
for file in ./*;
do
head -n 1 $file >> ../log_file.txt
done
cd ../formated-linux-data
echo "Количество обратботанных json файлов:"
ls | grep -p "json$" | wc -l
cd .. && echo "Содержимое лог файлы":
cat log_file.txt