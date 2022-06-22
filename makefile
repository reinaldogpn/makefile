#-------------------------------------------------------------------------------------------------------#
# *** Makefile padrão ***
#
# Após muita pesquisa e noites viradas, aprendi a criar um arquivo makefile padrão que funciona
# para qualquer projeto em C++, sem precisar alterar absolutamente nada no arquivo!!!
#
# Esse makefile organiza o diretório do projeto e realiza a chamada do processo de compilação de forma
# automática e também faz a limpeza do diretório raiz do projeto ao acionar o comando "make clean" 
# (para linux) ou "make wclean" (para Windows).
#
# Para que funcione, este arquivo deve estar na pasta raiz do projeto, juntamente com outra pasta
# nomeada "source", onde devem estar contidos todos os arquivos .h e .cpp relacionados ao projeto.
#
# Ao chamar o comando "make" no terminal, será criada de forma automática uma pasta nomeada "objects"
# na pasta raiz do projeto, onde estarão contidos os arquivos .o gerados. Além disso, será gerado um
# arquivo executável com o nome definido na variável 'PROJ_NAME'.
#-------------------------------------------------------------------------------------------------------#

# Nome do projeto
PROJ_NAME=program

# Arquivos .cpp
C_SOURCE=$(wildcard ./source/*.cpp)

# Arquivos .h
H_SOURCE=$(wildcard ./source/*.h)

# Arquivos .o
OBJ=$(subst .cpp,.o,$(subst source,objects,$(C_SOURCE)))

# Compilador / linker
CC=g++

# Flags para o compilador
CC_FLAGS=-c         \
         -Wall

#
# Compilação e linkedição
#
all: objFolder $(PROJ_NAME)

$(PROJ_NAME): $(OBJ)
	@ echo Criando binarios utilizando o G++:
	$(CC) $^ -o $@
	@ echo Criacao de binarios finalizada, arquivo executavel gerado: $@
	@ echo ''

./objects/%.o: ./source/%.cpp ./source/%.h
	@ echo Criando o arquivo alvo utilizando o G++: $<
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ''

./objects/main.o: ./source/main.cpp $(H_SOURCE)
	@ echo Criando os arquivos "main" utilizando o G++: $<
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ''

./objects/Main.o: ./source/Main.cpp $(H_SOURCE)
	@ echo Criando os arquivos "main" utilizando o G++: $<
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ''

# Criação de uma pasta para guardar os arquivos .o
objFolder:
	@ mkdir objects

# Para linux:
clean:
	@ rm -rf ./objects/*.o $(PROJ_NAME) *~
	@ rmdir objects

# Para windows:
wclean:
	@ del /Q $(PROJ_NAME).exe
	@ rmdir /S /Q objects

# Palavras declaradas como "alvo falso"
.PHONY: all clean
