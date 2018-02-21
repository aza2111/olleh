OBJS = ast.cmo parser.cmo scanner.cmo toplevel.cmo

toplevel : $(OBJS)
	ocamlc -o toplevel $(OBJS)

scanner.ml : scanner.mll
	ocamllex scanner.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

# "make clean" removes all generated files

.PHONY : clean
clean :
	rm -f toplevel parser.ml parser.mli scanner.ml *.cmo *.cmi

# Generated by "ocamldep *.ml *.mli" after building scanner.ml 
# and parser.ml

ast.cmo :
ast.cmx :
toplevel.cmo : scanner.cmo parser.cmi ast.cmo
toplevel.cmx : scanner.cmx parser.cmx ast.cmo
parser.cmo : ast.cmo parser.cmi
parser.cmx : ast.cmo parser.cmi
scanner.cmo : parser.cmi
scanner.cmx : parser.cmx
parser.cmi : ast.cmo

# Building the tarball

TESTS = \
    func-pos if-pos loop-pos vers-pos \
    players-neg print-neg foreach-neg if-neg func-neg

TESTFILES = $(TESTS:%=test-%.olh) $(TESTS:%=test-%.out)

TARFILES = README \
    ast.ml Makefile parser.mly scanner.mll testall.sh \
    $(TESTFILES:%=tests/%)
