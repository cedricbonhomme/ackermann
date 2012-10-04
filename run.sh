echo "-= Compiling phase =-"

echo "Compiling C version..."
gcc -Wall ./ackermann.c -o ackermann-c
echo
echo "Compiling Go version..."
go build -o ackermann-go ./ackermann.go
echo
echo "Compiling Pascal version..."
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

echo "C implementation:"
time ./ackermann-c 3 12
echo "------------------------------------------"

echo "Go implementation:"
time ./ackermann-go 3 12
echo "------------------------------------------"

echo "Pascal implementation:"
time ./ackermann-pascal 3 12
echo "------------------------------------------"

echo "OCaml implementation:"
time ./ackermann-ocaml 3 12
echo "------------------------------------------"

echo "Haskell implementation:"
time ./ackermann-haskell 3 12
echo "------------------------------------------"

echo "Python implementation:"
time python ackermann-python.pyc 3 12