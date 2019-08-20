# Hangman game

A simple implementation of a hangman game using ruby

To get started first clone this repository
```
 $ git clone https://github.com/moacirguedes/forca.git

 $ cd forca
```

Then, assuming you have ruby installed (btw, i used 2.6.3), run
```
$ main.rb
```
If you want to change the categories and words of each one, open categories.txt, the rest is self explanatory

About the score calculation, if you hit the word with less attempts than the size of the current word, you get max points (hehe), else, each attempt will decrease your score according to the word size. (Its not the best, i know, but is what we have for today)
