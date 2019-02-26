#!/bin/bash

flex -o lexical.cpp lexical.l

bison -d -o syntactic.cpp syntactic.y

g++ -c `llvm-config --cppflags` -std=c++11 syntactic.cpp gen.cpp lexical.cpp printi.cpp main.cpp

g++ -o xy-complier syntactic.o gen.o main.o lexical.o printi.o `llvm-config --libs` `llvm-config --ldflags` -lpthread -ldl -lz -lncurses -rdynamic

cat demo.xy | ./xy-complier

