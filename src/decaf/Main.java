package decaf;

import java.io.*;
//import antlr.Token;
import java.util.Arrays;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java6035.tools.CLI.*;
import decaf.DecafSymbolsAndScopes;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
		        			{
							case DecafLexer.CHARLITERAL:
								type = "CHARLITERAL";
								break;

							case DecafLexer.HEX:
								type = "HEXADECIMAL";
								break;

							case DecafLexer.ID:
								type = "IDENTIFIER";
								break;

							case DecafLexer.NUMEROPOSITIVO:
								type = "NUMEROS POSITIVOS";
								break;
							/*		
							case DecafLexer.OPERADORES:
								type = "OPERADORES";
								break;
							*/
							case DecafLexer.LBRACKET:
								type = "LEFT BRACKET";
								break;

							case DecafLexer.RBRACKET:
								type = "RIGHT BRACKET";
								break;

							case DecafLexer.PONTOVIR:
								type = "PONTO E VIRGULA";
								break;
						/*	case DecafLexer.ARITMETICOS:
								type = "ARITMETICOS";
								break;

							case DecafLexer.LOGICOS:
								type = "LOGICOS";
								break;

							case DecafLexer.COMPARACAO:
								type = "COMPARACAO";
								break;
						*/
							case DecafLexer.ATRIBUICAO:
								type = "ATRIBUICAO";
								break;

							case DecafLexer.STRING:
								type = "STRINGLITERAL";
								break;

							case DecafLexer.BOOLEANO:
								type = "BOOLEANO";
								break;

							case DecafLexer.CHAMAR:
								type = "CHAMAR";
								break;
							case DecafLexer.CLASSE:
								type = "CLASSE";
								break;
							case DecafLexer.SE:
								type = "SE";
								break;
							case DecafLexer.SENAO:
								type = "SENAO";
								break;

							case DecafLexer.VOID:
								type = "VOID";
								break;

							case DecafLexer.PARA:
								type = "SENAO";
								break;

							case DecafLexer.FORPAR:
								type = "FORPAR";
								break;

							case DecafLexer.BREAK:
								type = "BREAK";
								break;

							case DecafLexer.RETORNO:
								type = "SENAO";
								break;
							case DecafLexer.CONTINUA:
								type = "CONTINUA";
								break;

							case DecafLexer.FALSO:
								type = "FALSO";
								break;

							case DecafLexer.VERDADEIRO:
								type = "VERDADEIRO";
								break;

							case DecafLexer.INTEIRO:
								type = "INTEIRO";
								break;
		        			}
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        	    // Primeiro faz o parsing da cadeia
                DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                DecafParser parser = new DecafParser(tokens);

                // Adiciona as regras semÃ¢nticas
                ParseTree tree = parser.program();

                if (CLI.debug) {
                    // Se estiver no modo debug imprime a Ã¡rvore de parsing
                    // Create Tree View
                    // Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui


                    //show AST in console
                    System.out.println(tree.toStringTree(parser));

		      //show AST in GUI
				JFrame frame = new JFrame("Antlr AST");
				JPanel panel = new JPanel();
	    JScrollPane scrollPane = new JScrollPane(panel);
	    scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
	    scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_NEVER);
	    scrollPane.setBounds(50, 30, 300, 50);
				TreeViewer viewr = new TreeViewer(Arrays.asList(
						parser.getRuleNames()),tree);
				viewr.setScale(1.5);//scale a little
				panel.add(viewr);
				frame.add(scrollPane);
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setSize(600,400);
				frame.setVisible(true);
                }

            } else if (CLI.target == CLI.INTER) {
				// Primeiro faz o parsing da cadeia
				DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
				DecafParser parser = new DecafParser(tokens);

				// Adiciona as regras semânticas
				ParseTree tree = parser.program();

				// Realiza o parsing do programa
				DecafSymbolsAndScopes def = new DecafSymbolsAndScopes();
				ParseTreeWalker walker = new ParseTreeWalker();
				walker.walk(def, tree);

				if (CLI.debug) {
					// Se estiver no modo debug imprime a árvore de parsing
					// Create Tree View
					// Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui


					//show AST in console
					System.out.println(tree.toStringTree(parser));

					//show AST in GUI
					JFrame frame = new JFrame("Antlr AST");
				JPanel panel = new JPanel();
	    JScrollPane scrollPane = new JScrollPane(panel);
	    scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
	    scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_NEVER);
	    scrollPane.setBounds(50, 30, 300, 50);
				TreeViewer viewr = new TreeViewer(Arrays.asList(
						parser.getRuleNames()),tree);
				viewr.setScale(1.5);//scale a little
				panel.add(viewr);
				frame.add(scrollPane);
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setSize(600,400);
				frame.setVisible(true);
				}

			}
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}

