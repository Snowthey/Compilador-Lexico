package prova;

import java.io.*;

public class TesteAnalisador {
    
    public static void main(String[] args) throws IOException{
    String arquivo = "C:/Users/sherl/OneDrive/Documents/NetBeansProjects/Prova/src/prova/codigofonte.txt";
    
    BufferedReader texto = new BufferedReader(new FileReader(arquivo));
    
    Lexer analise = new Lexer(texto);
    
        while(true){
            Token objetotoken = analise.yylex();
            if(objetotoken == null)
                break;
        }
}
}
