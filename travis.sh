#!/bin/bash
abapmerge src/zabapgit.prog.abap > ../zabapgit.abap
wc -l ../zabapgit.abap
cd ..
git clone https://github.com/sb-sap/abapgit-build.git
ls -l
cp zabapgit.abap abapgit-build/zabapgit.abap
cd abapgit-build
git status
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
git add zabapgit.abap
git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
git push -q https://$GITHUB_API_KEY@github.com/sb-sap/abapgit-build.git > /dev/null 2>&1
