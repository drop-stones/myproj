#!/bin/sh
target_branch="ghp-deploy"
git config --global user.name "drop-stones"
git config --global user.email "shizukuishi.s.aa@m.titech.ac.jp"
git checkout "$target_branch"
git reset --hard origin/main

cd deploy
gcc -o a.out x.c
./a.out
echo "output of a.out: tribonacci(10) = $(echo $?)" > x.txt

git add a.out x.txt
git commit -m "[skip ci] updates GitHub Pages"
if [ $? -ne 0 ]; then
    echo "nothing to commit"
    exit 0
fi
git remote set-url origin "https://github.com/drop-stones/myproj.git"
git push -f origin "$target_branch"