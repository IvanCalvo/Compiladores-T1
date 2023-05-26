'''
    Autores:
    Ivan Duarte Calvo RA: 790739
    João Ricardo Lopes Lovato RA: 772138
    Vinícius Borges de Lima RA: 795316
'''

import sys
from antlr4 import *
from gramatica2 import gramatica2

# Verificando se todos os argumentos necessarios foram passados
if len(sys.argv) < 3:
    print("É necessário fornecer o nome dos arquivos de entrada e saida como argumento.")
    sys.exit(1)

# Os argumentos representam os arquivos de entrada e saida respectivamente 
input_file_name = sys.argv[1]
output_file_name = sys.argv[2]

try:
    # Criando um InputStream atraves do arquivo de entrada
    input_stream = FileStream(input_file_name, encoding='utf-8')

    # Utilizando o lexer criado com o ANTLR
    lexer = gramatica2(input_stream)
    token = lexer.nextToken()

    # Listando os tipos definidos para facilitar
    tipos_definidos = ['IDENT', 'CADEIA', 'NUM_INT', 'NUM_REAL']

    output = open(output_file_name, 'w')

    while token.type != Token.EOF:

        # Aplicando a formatacao padrao para as palavras chave
        txt = '\'' + token.text + '\''
        
        # Identificando o tipo do token
        typeStr = gramatica2.symbolicNames[token.type]

        # Por fim definindo o outout, e se houve erro ou nao
        if (typeStr == 'Nao_Fechado'):
            output.write('Linha ' + str(token.line) + ': comentario nao fechado\n')
            break

        elif (typeStr == 'Literal_Nao_Fechada'):
            output.write('Linha ' + str(token.line) + ': cadeia literal nao fechada\n')
            break

        elif(typeStr == 'ERR'):
            output.write('Linha ' + str(token.line) + ': ' + token.text + ' - simbolo nao identificado\n')
            break

        else:    
            if (typeStr in tipos_definidos):
                output.write('<'+ txt + "," + typeStr + '>\n')
            else:
                output.write('<' + txt + ',' + txt + '>\n')
            
        token = lexer.nextToken()

# Caso nao seja possivel abrir o arquivo de entrada
except IOError:
    print("Erro ao abrir o arquivo:", input_file_name)
