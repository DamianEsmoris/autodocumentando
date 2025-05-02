#!/bin/bash
readonly TMP_FILE='salida.md';
rm -rf $TMP_FILE;
shopt -s extglob

for pract_folder in ./pract-+([0-9])_*; do
    IFS='_' read -r pract_no pract_name <<< "$pract_folder"
    echo -e "# ${pract_name}" >> $TMP_FILE

    for exercice_folder in ${pract_folder}/*; do
        [ -d $exercice_folder ] \
            || continue;

        for md in ${exercice_folder}/*.md; do
            echo -e "\n$(cat ${md})" >> $TMP_FILE
        done

        for cpp in ${exercice_folder}/*.cpp; do
            echo -e '\n```cpp' >> $TMP_FILE
            cat ${cpp} >> $TMP_FILE
            echo -e '```\n' >> $TMP_FILE
        done
    done
done 

