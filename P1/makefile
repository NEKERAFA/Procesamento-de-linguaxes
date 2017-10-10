FUENTE = practica1
PRUEBA = ejemplo2.txt

all: compile

compile:
	flex $(FUENTE).l
	gcc -o $(FUENTE).out lex.yy.c -lfl

clean:
	rm $(FUENTE).out lex.yy.c

run:
	./$(FUENTE).out < $(PRUEBA)

