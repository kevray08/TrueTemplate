.PHONY: all config clean depend all_info config_info clean_info depend_info @@ARG0@@ config_@@ARG0@@ clean_@@ARG0@@ depend_@@ARG0@@

all: all_info @@ARG0@@
config: config_info config_@@ARG0@@
clean: clean_info clean_@@ARG0@@
depend: depend_info depend_@@ARG0@@

all_info:
	@echo ------------------------------------------------------------------------------
	@echo Compiling project: @@ARG0@@
	@echo ------------------------------------------------------------------------------

config_info:
	@echo ------------------------------------------------------------------------------
	@echo Configuring project: @@ARG0@@
	@echo ------------------------------------------------------------------------------

clean_info:
	@echo ------------------------------------------------------------------------------
	@echo Cleaning project: @@ARG0@@
	@echo ------------------------------------------------------------------------------

depend_info:
	@echo ------------------------------------------------------------------------------
	@echo Building dependencies: @@ARG0@@
	@echo ------------------------------------------------------------------------------

DIR_TOP:=..
DIR_BIN:=./bin
DIR_INC:=./include
DIR_LIB:=./lib
DIR_SRC:=./src

ASM:=as
CCC:=gcc
CPP:=g++
LINK:=gcc
DLLTOOL:=dlltool

DEBUG_TYPE:=release

ifeq ($(DEBUG_TYPE),debug)
 ASM_FLAGS:=-g
 CCC_FLAGS:=-g -O0 -W -Wall -pedantic
 CPP_FLAGS:=-g -O0 -W -Wall -pedantic
 LINK_FLAGS:=-g -O0 -W -Wall -pedantic -s -mdll
else
 ASM_FLAGS:=
 CCC_FLAGS:=-W -Wall -pedantic
 CPP_FLAGS:=-W -Wall -pedantic
 LINK_FLAGS:=-W -Wall -pedantic -s -mdll
endif

ASM_DEFINE:=
CCC_DEFINE:=
CPP_DEFINE:=

ASM_INCLUDE:=-I. -I$(DIR_INC)
CCC_INCLUDE:=-I. -I$(DIR_INC)
CPP_INCLUDE:=-I. -I$(DIR_INC)

LINK_LIBS:=-lstdc++ -lgdi32
LINK_PATH:=

WILDCARD_ASM:=$(addsuffix /*.s,$(DIR_SRC))
WILDCARD_CCC:=$(addsuffix /*.c,$(DIR_SRC))
WILDCARD_CPP:=$(addsuffix /*.cpp,$(DIR_SRC))

SRC_ASM:=$(notdir $(wildcard $(WILDCARD_ASM)))
SRC_CCC:=$(notdir $(wildcard $(WILDCARD_CCC)))
SRC_CPP:=$(notdir $(wildcard $(WILDCARD_CPP)))

DEP_ASM:=$(notdir $(patsubst %.s,%.d, $(wildcard $(WILDCARD_ASM))))
DEP_CCC:=$(notdir $(patsubst %.c,%.d, $(wildcard $(WILDCARD_CCC))))
DEP_CPP:=$(notdir $(patsubst %.cpp,%.d, $(wildcard $(WILDCARD_CPP))))

DEP_ASM_FULL:=$(addprefix $(DIR_LIB)/,$(DEP_ASM))
DEP_CCC_FULL:=$(addprefix $(DIR_LIB)/,$(DEP_CCC))
DEP_CPP_FULL:=$(addprefix $(DIR_LIB)/,$(DEP_CPP))

OBJ_ASM:=$(notdir $(patsubst %.s,%.o, $(wildcard $(WILDCARD_ASM))))
OBJ_CCC:=$(notdir $(patsubst %.c,%.o, $(wildcard $(WILDCARD_CCC))))
OBJ_CPP:=$(notdir $(patsubst %.cpp,%.o, $(wildcard $(WILDCARD_CPP))))

OBJ_ASM_FULL:=$(addprefix $(DIR_LIB)/,$(OBJ_ASM))
OBJ_CCC_FULL:=$(addprefix $(DIR_LIB)/,$(OBJ_CCC))
OBJ_CPP_FULL:=$(addprefix $(DIR_LIB)/,$(OBJ_CPP))

VPATH:=$(DIR_BIN) $(DIR_INC) $(DIR_LIB) $(DIR_SRC)

@@ARG0@@: $(OBJ_ASM) $(OBJ_CCC) $(OBJ_CPP)
	$(LINK) $(LINK_FLAGS) -o $(DIR_BIN)/$@.dll -Xlinker --base-file -Xlinker $(DIR_LIB)/$@.base $(addprefix $(DIR_LIB)/,$(notdir $^)) $(LINK_PATH) $(LINK_LIBS)
	$(DLLTOOL) --dllname $@ --base-file $(DIR_LIB)/$@.base --output-exp $(DIR_LIB)/$@.exp --def $(DIR_SRC)/$@.def
	$(LINK) $(LINK_FLAGS) -o $(DIR_BIN)/$@.dll $(addprefix $(DIR_LIB)/,$(notdir $^)) $(DIR_LIB)/$@.exp -Xlinker -Map -Xlinker $(DIR_BIN)/$@.map $(LINK_PATH) $(LINK_LIBS)
	rm -f $(DIR_LIB)/$@.base
	rm -f $(DIR_LIB)/$@.exp

%.o: %.s
	$(ASM) $(ASM_FLAGS) $(ASM_DEFINE) $(ASM_INCLUDE) $< -o $(DIR_LIB)/$@

%.o: %.c
	$(CCC) $(CCC_FLAGS) $(CCC_DEFINE) $(CCC_INCLUDE) -c $< -o $(DIR_LIB)/$@

%.o: %.cpp
	$(CPP) $(CPP_FLAGS) $(CPP_DEFINE) $(CPP_INCLUDE) -c $< -o $(DIR_LIB)/$@

config_@@ARG0@@:
	./configure

clean_@@ARG0@@:
	rm -f $(DIR_BIN)/@@ARG0@@.dll
	rm -f $(DIR_BIN)/@@ARG0@@.map
	rm -f $(DIR_LIB)/*.d
	rm -f $(DIR_LIB)/*.o

depend_@@ARG0@@: $(DEP_CCC) $(DEP_CPP)

$(DIR_LIB)/%.d: %.c
	@echo Building depends for $<
	$(CCC) -MD -E $(CCC_DEFINE) $(CCC_INCLUDE) $< > temp.tmp
	del /F /Q temp.tmp
	copy /Y *.d $(DIR_LIB)
	del /F /Q *.d

$(DIR_LIB)/%.d: %.cpp
	@echo Building depends for $<
	$(CPP) -MD -E $(CPP_DEFINE) $(CPP_INCLUDE) $< > temp.tmp
	del /F /Q temp.tmp
	copy /Y *.d $(DIR_LIB)
	del /F /Q *.d

-include $(DEP_CCC_FULL) $(DEP_CPP_FULL)
