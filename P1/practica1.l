%{
	/* Ponerlo a 1 activa el modo debug */
	#define info 1

	// Contadores
	int caracteres = 0;
	int palabras = 0;
	int minusculas = 0;
	int mayusculas = 0;
	int frase = 0;
%}

delim	 	[ \t]+
letra	 	[^ \t\.]
letras   	{letra}+
minuscula	[a-z]
mayuscula	[A-Z]
palabramin	{minuscula}+
palabramay	{mayuscula}+
frasemin	{palabramin}\.
frasemay	{palabramay}\.
frase		{palabra}\.
punto		\.
frasepuntos	{punto}\.
palabra		{letras}|{punto}({letras}?)

%%

{delim}			{
					// Los delimitadores no se tienen en cuenta
					if(info) printf("Separador\n");
				}


{frasemin}		{
					// Obtiene una frase como ultima palabra en minusculas
					if(info) printf("Frase con palabra en minusculas: %s\n", yytext);
					frase++; palabras++; minusculas++; caracteres += yyleng;
				}

{frasemay}		{
					// Obtiene una frase como ultima palabra en mayusculas
					if(info) printf("Frase con palabra en mayusculas: %s\n", yytext);
					frase++; palabras++; mayusculas++; caracteres += yyleng;
				}

{frase}			{
					// Obtiene una frase con una palabra normal
					if(info) printf("Frase: %s\n", yytext);
					frase++; palabras++; caracteres += yyleng;
				}


{palabramin}	{
					// Cuenta una palabra en minusculas
					if(info) printf("Palabra en minusculas: %s\n", yytext);
					palabras++; minusculas++; caracteres += yyleng;
				}

{palabramay}	{
					// Cuenta una palabra en mayusculas
					if(info) printf("Palabra en mayusculas: %s\n", yytext);
					palabras++; mayusculas++; caracteres += yyleng;
				}

{palabra}		{
					// Cuenta una palabra normal
					if(info) printf("Palabra: %s\n", yytext);
					palabras++; caracteres += yyleng;
				}

<<EOF>>			{
					// Fin de fichero, imprime la salida y termina la ejecución
					if(info) printf("Fin de fichero\n");
					caracteres++;
				
					printf("En la entrada hay %i caracteres, %i palabras y %i frases. También contiene:\
							\n  - %i son palabras minusculas (todos los caracteres)\
							\n  - %i son palabras mayusculas (todos los caracteres)\n", caracteres, palabras, frase, minusculas, mayusculas);
					return 0;
       			}
