import static prova.Token.*;

%%
%{
    private void imprimir(String token, String lexema){
        System.out.println(lexema + " -> Classicicacao lexica: " + token);
    }
%}

%class Lexer
%type Token

letra = [a-zA-Z]
nomeVariavel = [_a-zA-Z][_a-zA-z0-9]*
digito = [0-9]
underline = "_"
inteiro = {digito}+
palavraReservada = "main"
tipoVariavel = "int" | "float" | "char"
retornoDeFuncao = "void"
atribuicao = "="
decimal = {inteiro}"."{inteiro}
const_literal = \"(\\\"|[^\"\n\r])*\"
operadoresAritimeticos = ("+" | "-" | "/" | "*")
incremento = "++"
funcaoIntegrada = "count >>" | "cin <<"
operadoresComparacao = ("<>" | "<" | ">" | "<=" | ">=")
operadoresLogicos = "else" | "if"
loopDeRepeticao = "do" | "while" | "for"
simbolosEspeciais = ("(" | ")" |"[" | "]" | "." | "," | ";"| "{" | "}")
palavraChave = "ABRIR TABELA" | "MOSTRAR"| "DE" | "ONDE" | "ORDENAR POR"|"DECRESCENTE"| 
"CRESCENTE" | "EM CONJUNTO COM" | "ATRAVES DA LIGACAO" |"UNIDA COM"| 
"AGRUPAR POR" | "FILTRO_ DO_GRUPO" | "CONTAR" | "MEDIA" | "VALOR MINIMO"| 
"VALOR MAXIMO"|"SOMATORIA"|"EH"|"VAZIO"|"CONTENDO"
branco = [\n|\t|\r| ]+
%%

{palavraChave} {imprimir("PALAVRA-CHAVE " , yytext()); return PALAVRACHAVE; }
{branco} { return BRANCO; }
{const_literal} {imprimir("LITERAL " , yytext()); return CONSTANTE; }
{inteiro} {imprimir("NUMERO INTEIRO " , yytext()); return INTEIRO; }
{decimal} {imprimir("NUMERO DECIMAL " , yytext()); return DECIMAL; }
{operadoresAritimeticos} {imprimir("OPERADOR ARITMETICO " , yytext()); return OPERADORARITIMETICO; }
{operadoresComparacao} {imprimir("OPERADOR COMPARATIVO " , yytext()); return OPERADORCOMPARATIVO; }
{operadoresLogicos} {imprimir("OPERADOR LOGICOS " , yytext()); return OPERADORLOGICO; }
{simbolosEspeciais} {imprimir("SIMBOLOS ESPECIFICO " , yytext()); return SIMBOLOESPECIAL; }
{palavraReservada}  {imprimir("PALAVRA RESERVADA ", yytext()); return PALAVRARESERVADA;}
{tipoVariavel}  {imprimir("TIPO VARIAVEL ", yytext()); return TIPOVARIAVEL;}
{retornoDeFuncao}  {imprimir("RETORNO DE FUNCAO ", yytext()); return RETORNODEFUNCAO;}
{atribuicao}  {imprimir("ATRIBUICAO ", yytext()); return ATRIBUICAO;}
{loopDeRepeticao}  {imprimir("LOOP DE REPETICAO ", yytext()); return LOOPDEREPETICAO;}
{incremento}  {imprimir("INCREMENTO ", yytext()); return INCREMENTO;}
{nomeVariavel}      { imprimir("VARIAVEL : ", yytext()); return NOME_VARIAVEL;}


. {imprimir("<<< CARACTER INVALIDO!!! >>> ", yytext()); return ERROR; }
<<EOF>> {return null;}




