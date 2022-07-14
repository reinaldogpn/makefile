#-------------------------------------------------------------------------------------------------------#
# *** Makefile padrão ***
#
# Após muita pesquisa e noites viradas, aprendi a criar um arquivo makefile padrão que funciona
# para qualquer projeto em C++, sem precisar alterar absolutamente nada no arquivo!!!
#
# Esse makefile organiza o diretório do projeto e realiza a chamada do processo de compilação de forma
# automática e também faz a limpeza do diretório raiz do projeto ao acionar o comando "make clean".
#
# Para que funcione, este arquivo deve estar na pasta raiz do projeto, juntamente com outra pasta
# nomeada "source", onde devem estar contidos todos os arquivos .h e .cpp relacionados ao projeto.
#
# Ao chamar o comando "make" no terminal, será criada de forma automática uma pasta nomeada "objects"
# na pasta raiz do projeto, onde estarão contidos os arquivos .o gerados. Além disso, será gerado um
# arquivo executável com o nome definido na variável 'PROJ_NAME'.
#-------------------------------------------------------------------------------------------------------#

# Nome do projeto
PROJ_NAME=Pacman.exe

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

# Flags para o Allegro5.2
ALLEGRO_PATH=C:\allegro

ALLEGRO_INCLUDE=-I $(ALLEGRO_PATH)\include

ALLEGRO_LIB=$(ALLEGRO_PATH)\lib\liballegro_monolith.dll.a

# Compilação e linkedição
all: objFolder $(PROJ_NAME)

$(PROJ_NAME): $(OBJ)
	@ echo Gerando binarios utilizando o $(CC) ...
	@ $(CC) $^ -o $@ $(ALLEGRO_LIB)
	@ echo ==================================================
	@ echo Tudo certo! Arquivo executavel gerado: $@
	@ echo ==================================================

./objects/%.o: ./source/%.cpp ./source/%.h
	@$ echo Linkando o arquivo alvo utilizando o $(CC): $<
	@ $(CC) $< $(CC_FLAGS) $(ALLEGRO_INCLUDE) -o $@

./objects/main.o: ./source/main.cpp $(H_SOURCE)
	@ echo Linkando o arquivo main utilizando o $(CC): $<
	@ $(CC) $< $(CC_FLAGS) $(ALLEGRO_INCLUDE) -o $@

./objects/Main.o: ./source/Main.cpp $(H_SOURCE)
	@ echo Linkando o arquivo main utilizando o $(CC): $<
	@ $(CC) $< $(CC_FLAGS) $(ALLEGRO_INCLUDE) -o $@

# Criação de uma pasta para guardar os arquivos .o
objFolder:
	@ mkdir objects

# Execução do programa ao usar "make run"
run:
	@ echo ==================================================
	@ echo Executando o programa: $(PROJ_NAME)
	@ echo ==================================================
	@ $(PROJ_NAME)

clean:
	@ del /Q $(PROJ_NAME)
	@ rmdir /S /Q objects

# Palavras declaradas como "alvo falso"
.PHONY: all clean
