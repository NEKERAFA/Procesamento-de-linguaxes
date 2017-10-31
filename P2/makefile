FUENTE = ejemplo1
PRUEBA = temps.txt

all: compile run

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd
	gcc -o $(FUENTE).out lex.yy.c $(FUENTE).tab.c -lfl -ly

clean:
	rm $(FUENTE).out lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h

run:
	./$(FUENTE).out < $(PRUEBA)

