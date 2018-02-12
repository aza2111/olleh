OBJS = parser.cmo scanner.cmo mainfile.cmo

mainfile : $(OBJS)
	ocamlc -o mainfile $(OBJS)

scanner.ml : scanner.mll
	ocamllex scanner.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

.PHONY : clean
clean :
	rm -f mainfile parser.ml parser.mli scanner.ml *.cmo *.cmi

# Generated by ocamldep *.ml *.mli
mainfile.cmo: scanner.cmo parser.cmi ast.cmo
mainfile.cmx: scanner.cmx parser.cmx ast.cmo
parser.cmo: ast.cmo parser.cmi
parser.cmx: ast.cmo parser.cmi
scanner.cmo: parser.cmi
scanner.cmx: parser.cmx
parser.cmi: ast.cmo
