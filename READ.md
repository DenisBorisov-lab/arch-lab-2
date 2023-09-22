# Отчет по лабораторной работе N 2 по курсу

# “Фундаментальная информатика”

Студент группы: M8О-109Б, Борисов Денис Сергеевич

Контакты: Mai.borisov.denis@gmail.com

Работа выполнена: 13.09.2023

Преподаватель: Ткаченко Егор Юрьевич

## 1. Тема

Операционная среда ОС UNIX

## 2. Цель работы

Изучение и освоение программного обеспечения ОС UNIX и приобритение навыков, необходимых для выполнения курсовых и лабораторных работ в среде UNIX.

## 3. Задание

Приобретение основных навыков работы в ОС UNIX

## 4. Оборудование

Процессор: Apple M1

ОП: 16Гб

НМД: 251Гб

Монитор: 2560x1600

## 5. Программное обеспечение

Операционная система семейства: **macOS Monterey**, версия **12.5**

Интерпретатор команд: **bash**, версия **3.2.57(1)-release**.

Система программирования: **–**, версия **–**

Редактор текстов: **Visual Studio Code**, версия **1.60.2 (Universal)**

Утилиты операционной системы: **–**

Прикладные системы и программы: **Git**

Местонахождение и имена файлов программ и данных на домашнем компьютере: 

```c
~/Linux :directory
~/Linux/log_file.txt :ASCII text
~/Linux/script.sh :Unicode text
~/Linux/formated-linux-data :directory
~/Linux/formated-linux-data/data*.json :JSON data
* = [0-9]
```

## 6. Идея, метод, алгоритм решения задачи

Сюда идею, алгоритм вашего решения

На **Github** репозитории ([https://github.com/DenisBorisov-lab/linux-data](https://github.com/DenisBorisov-lab/linux-data)) хранятся файлы с логами некоторой программы в формате: txt, json

### Цели программы:

- Скачать данные с **Github** репозитория, отделить ***json*** файлы от ***txt*** файлов и поместить ***json*** файлы в отдельную папку
- Вывести в консоль статистику по обработке данных

### Алгорит решения задачи:

1. Скачать данные с **Github** репозитория и расположить их в директории **linux-data**
2. Создать директорию **formated-linux-data**, где будут располагаться ***json*** файлы
3. Создать текстовый файл **log_file.txt**, ****чтобы записывать туда статистику по обработке данных
4. Отобрать ***json*** файлы из директории **linux-data** и скопировать их в директорию **formated-linux-data**
5. Записать информацию о скопированных файлах в **log_file.txt**
6. Записать информацию о текстовых файлах в **log_file.txt**
7. Удалить директорию **linux-data**
8. Перейти в директорию **formated-linux-data** и записать содержимое ***json*** файлов в **log_file.txt**
9. Вывести статистку об обработке скаченных данных

## 7. С**ценарий выполнения работы**

---

Клонируем репозиторий с помощью ***ssh***

```
git clone git@github.com:DenisBorisov-lab/linux-data.git
```

---

Создаём директорию **formated-linux-data**

```
mkdir formated-linux-data
```

---

Создаём пустой файл **log_file.txt**

```
touch log_file.txt
```

---

Записываем строку “Moved files:” в файл **log_file.txt**

```
echo "Moved files:" > log_file.txt
```

---

Переходим в директорию **linux-data**

```
cd linux-data
```

---

Осуществляем поиск в текущей директории по файлам с расширеним ***json*** и допзаписываем результат этой операции в файл **log_file.txt**

```
find . -name "*.json" >> ../log_file.txt
```

---

В цикле по всем файлам с расширением ***json*** копируем эти файлы в директорию **formated-linux-data**

```
for file in ./*.json;
do
cp $file ../formated-linux-data
done
```

---

Поднимаемся в файловой системе на один уровень выше и записываем в файл **log_file.txt** строку “Deleted files:”

```
cd .. && echo "Deleted files:" >> log_file.txt
```

---

Осуществляем поиск в директории **linux-data** всех файлов с расширением ***txt*** и дозаписываем результат этой операции в файл **log_file.txt**

```
find ./linux-data -name "*.txt" >> log_file.txt
```

---

Дозаписываем строку “All logs from json files:” В файл **log_file.txt**

```
echo "All logs from json files:" >> log_file.txt
```

---

Удалем директорию linux-data, потому что необходимую сортировку мы уже выполнили и далее эти файлы нам будут не нужны

```
rm -r -f linux-data
```

---

Переходим в директорию **formated-linux-data**

```
cd formated-linux-data
```

---

В цикле по всем файлам текущей директории берём только первую строку (потому что при скачивании ***json*** файлы представляют из себя набор символов в одну строчку, а **head** по умолчанию берёт первые 10 строк) и дозаписываем файл **log_file.txt** результатом предыдущей команды

```
for file in *;
do
head -n 1 $file >> ../log_file.txt
done
```

---

Переходим в директорию **formated-linux-data**

```
cd ../formated-linux-data
```

---

Выводим в терминал сообщение “Количество обратботанных json файлов:”

```
echo "Количество обратботанных json файлов:"
```

---

Выбираем строки из содержания всей директории и считаем их

```
ls | grep -p "json$" | wc -l
```

---

Поднимаемся на уровень выше в файловой системе, выводим сообщение “Содержание лог файла” и выводим содержимое **log_file.txt**

```
cd .. && echo "Содержимое лог файлы":
cat log_file.txt
```

## 8. Распечатка протокола

```
➜  Linux bash script.sh
Cloning into 'linux-data'...
remote: Enumerating objects: 13, done.
remote: Counting objects: 100% (13/13), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 13 (delta 0), reused 13 (delta 0), pack-reused 0
Receiving objects: 100% (13/13), done.
Количество обратботанных json файлов:
      10
Содержимое лог файлы:
Moved files:
./data0.json
./data1.json
./data6.json
./data7.json
./data4.json
./data8.json
./data9.json
./data5.json
./data2.json
./data3.json
Deleted files:
./linux-data/text_data8.txt
./linux-data/text_data9.txt
./linux-data/text_data1.txt
./linux-data/text_data0.txt
./linux-data/text_data2.txt
./linux-data/text_data3.txt
./linux-data/text_data7.txt
./linux-data/text_data6.txt
./linux-data/text_data4.txt
./linux-data/text_data5.txt
All logs from json files:
{"editor":"developer","time":"2023-09-17T23:32:41.001067","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.068825","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.069774","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.069917","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.070039","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.070181","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.070280","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.070368","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.070462","message":"Some messages about edited part"}{"editor":"developer","time":"2023-09-17T23:32:41.070561","message":"Some messages about edited part"}

```

## 9. Дневник отладки

| № | Лаб. или дом. | Дата | Время | Событие | Действие по исправлению | Примечание |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | Дом | 17.09.2023 | 12:00 | Придумал идею и написал код для лабораторной работы |  | Готова полностью рабочая программа |
| 2 | Дом | 22.09.2023 | 15:36 | Написал отчёт по лабораторной работе и выложил её на Github |  | Завершил выполнение лабораторной работы |

## 10. Замечания автора по существу работы

В работе были использованы следующие элементы:

- Циклы и регулярные выражения
- Команды: git clone, mkdir, touch, echo, cd, find, cp, rm, head, ls, grep, wc, cat
- Флаги: -r, -f, -l, -n, -p, -name(не совсем флаг, скорее критерий)
- Специальные символы: >, >>, |

## 11. Выводы

Научился работать с OC UNIX