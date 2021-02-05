#!/bin/sh
set -x

wasm-pack build
cd www
npm install
npm run build

sha=`git rev-parse HEAD`
git config --global user.email "bryan.brady@gmail.com"
git config --global user.name "bryan brady"
git clone git@github.com:bryanbrady/asdf-sh.git
mkdir -p asdf-sh/wasm-game-of-life
git status
rm -rf asdf-sh/wasm-game-of-life/*
git status
cp dist/* asdf-sh/wasm-game-of-life/
git status
cd asdf-sh
pwd
ls
ls wasm-game-of-life/
if ! git diff --exit-code; then
  git status
  git add -u
  git status
  git add .
  git status
  git commit -m "https://github.com/bryanbrady/wasm-game-of-life/commit/$sha"
  git push origin master
fi
