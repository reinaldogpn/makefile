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
PROJ_NAME=Pacman.run

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

## Terminal color codes
Black=			"30"
Red=			"31"
Green=			"32"
Yellow=			"33"
Blue=			"34"
Magenta=		"35"
Cyan=			"36"
LightGray=		"37"
Gray=			"90"
LightRed=		"91"
LightGreen=		"92"
LightYellow=	"93"
LightBlue=		"94"
LightMagenta=	"95"
LightCyan=		"96"
White=			"97"

# Color code
CCODE=$(LightYellow)

COLOR="\e[0;$(CCODE)m"
COLOR_BOLD="\e[1;$(CCODE)m"
NO_COLOR="\e[0m"

UNDERLINE="\e[4m"
BLINK="\e[5m"
DIM="\e[2m"

# Compilação e linkedição

all: objFolder $(PROJ_NAME) run

$(PROJ_NAME): $(OBJ)
	@ echo $(COLOR_BOLD)"Gerando binários utilizando o $(CC) ..."$(NO_COLOR)
	@ $(CC) $^ -o $@
	@ echo ''
	@ echo $(COLOR_BOLD)"Criação de binários finalizada! Arquivo executável gerado:"$(NO_COLOR)
	@ echo $(COLOR_BOLD)"-->" $(UNDERLINE)$@$(NO_COLOR) #"$(PWD)/"
	@ echo ''

./objects/%.o: ./source/%.cpp ./source/%.h
	@ echo $(COLOR_BOLD)"Linkando o arquivo alvo utilizando o $(CC):" $(COLOR)$<$(NO_COLOR)
	@ $(CC) $< $(CC_FLAGS) -o $@

./objects/main.o: ./source/main.cpp $(H_SOURCE)
	@ echo $(COLOR_BOLD)"Linkando o arquivo main utilizando o $(CC):" $(COLOR)$<$(NO_COLOR)
	@ $(CC) $< $(CC_FLAGS) -o $@

./objects/Main.o: ./source/Main.cpp $(H_SOURCE)
	@ echo $(COLOR_BOLD)"Linkando o arquivo main utilizando o $(CC):" $(COLOR)$<$(NO_COLOR)
	@ $(CC) $< $(CC_FLAGS) -o $@

# Criação de uma pasta para guardar os arquivos .o
objFolder:
	@ mkdir objects

# Executa o arquivo gerado
run:
	@ echo $(COLOR_BOLD)"Executando o arquivo gerado: "$(UNDERLINE)$(PROJ_NAME)$(NO_COLOR)
	@ echo ''
	@ ./$(PROJ_NAME)

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
