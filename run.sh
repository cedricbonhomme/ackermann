echo "-= Compiling phase =-"

echo "Compiling C version..."
gcc -Wall ./ackermann.c -o ackermann-c
echo
echo "Compiling Go version..."
go build -o ackermann-go ./ackermann.go
echo
echo "Compiling Ocaml version..."
ocamlc ./ackermann.ml -o ackermann-ocaml
echo
echo "Compiling Haskell version..."
ghc ./ackermann.hs -o ackermann-haskell > /dev/null 2>&1
echo
echo "Compiling Python version..."
python -c "import ackermann"
mv ackermann.pyc ackermann-python.pyc
echo
echo "Compiling Pascal version..."
fpc -g ackermann.pas -oackermann-pascal> /dev/null 2>&1
echo

echo "-= Launching tests =-"

m=3
n=12

echo "C implementation:"
time ./ackermann-c $m $n
echo "------------------------------------------"

echo "Go implementation:"
time ./ackermann-go $m $n
echo "------------------------------------------"

echo "Pascal implementation:"
time ./ackermann-pascal $m $n
echo "------------------------------------------"

echo "OCaml implementation:"
time ./ackermann-ocaml $m $n
echo "------------------------------------------"

echo "Haskell implementation:"
time ./ackermann-haskell $m $n
echo "------------------------------------------"

echo "Python implementation:"
time python ackermann-python.pyc $m $n
