# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pollivie <pollivie.student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/21 05:40:07 by pollivie          #+#    #+#              #
#    Updated: 2024/08/21 05:40:08 by pollivie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# C++
CXX = clang++
CXXFLAGS = -std=c++98                                             \
           -D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_DEBUG  \
           -ftrapv                                                \
           -funwind-tables                                        \
           -g3                                                    \
           -gcolumn-info                                          \
           -gembed-source                                         \
           -gfull                                                 \
           -ggnu-pubnames                                         \
           -glldb                                                 \
           -gno-inline-line-tables                                \
           -ggdb                                                  \
           -gsplit-dwarf                                          \
           -mno-omit-leaf-frame-pointer                           \
           -gused                                                 \
           -fdebug-macro                                          \
           -fdebug-pass-arguments                                 \
           -fdebug-pass-structure                                 \
           -fdwarf-exceptions                                     \
           -femit-dwarf-unwind=always                             \
           -fno-eliminate-unused-debug-types                      \
           -fno-omit-frame-pointer                                \
           -fno-optimize-sibling-calls                            \
           -fdiagnostics-absolute-paths                           \
           -fdiagnostics-show-note-include-stack                  \
           -fdiagnostics-show-template-tree                       \
           -femit-all-decls                                       \
           -fforce-dwarf-frame                                    \
           -fshow-column                                          \
           -fshow-source-location                                 \
           -fspell-checking                                       \
           -fstandalone-debug                                     \
           -fstack-protector-all                                  \
           -fstack-clash-protection                               \
           -fno-inline-functions                                  \
           -MMD                                                   \
           -MP                                                    \
           -Wall                                                  \
           -Wextra                                                \
           -Wthread-safety                                        \
           -Wunsafe-buffer-usage                                  \
           -Wuninitialized                                        \
           -Wdouble-promotion                                     \
           -Wnull-dereference                                     \
           -fsanitize=alignment                                   \
           -fsanitize=bool                                        \
           -fsanitize=bounds                                      \
           -fsanitize=builtin                                     \
           -fsanitize=enum                                        \
           -fsanitize=float-cast-overflow                         \
           -fsanitize=float-divide-by-zero                        \
           -fsanitize=function                                    \
           -fsanitize=implicit-integer-sign-change                \
           -fsanitize=implicit-signed-integer-truncation          \
           -fsanitize=implicit-unsigned-integer-truncation        \
           -fsanitize=integer                                     \
           -fsanitize=local-bounds                                \
           -fsanitize=memory                                      \
           -fsanitize-memory-param-retval                         \
           -fsanitize-memory-track-origins=2                      \
           -fsanitize=nonnull-attribute                           \
           -fsanitize=null                                        \
           -fsanitize=nullability-arg                             \
           -fsanitize=nullability-assign                          \
           -fsanitize=nullability-return                          \
           -fsanitize=pointer-overflow                            \
           -fsanitize-recover=all                                 \
           -fsanitize=return                                      \
           -fsanitize=returns-nonnull-attribute                   \
           -fsanitize=shift                                       \
           -fsanitize=signed-integer-overflow                     \
           -fsanitize=undefined                                   \
           -fsanitize=unreachable                                 \
           -fsanitize=unsigned-shift-base                         \
           -fsanitize=vla-bound                                   \
           -fsafe-buffer-usage-suggestions                        \
           -fno-sanitize-trap=all                                 \

# Project settings
NAME ?= my_project
SRC_DIRS ?= src
INC_DIRS ?= include
BUILD_DIR ?= .build

# Automatically detect source files and include paths
SRCS := $(shell find $(SRC_DIRS) -type f -name '*.cpp')
INCS := $(addprefix -I, $(INC_DIRS))

# Convert .cpp files to .o files in the build directory, mirroring directory structure
OBJS := $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRCS))
DEPS := $(OBJS:.o=.d)

.PHONY: all re clean fclean

all: $(NAME)

# Link the final executable from objects in .build/
$(NAME): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@

# Compile .cpp files into .o files inside .build/ with directory creation
$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)     # Create directory structure for the .o and .d file
	$(CXX) $(CXXFLAGS) $(INCS) -c $< -o $@

-include $(DEPS)

clean:
	$(RM) -r $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all


# #C version

# CC = clang
# CFLAGS = -std=c99                                               \
#          -D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_DEBUG  \
#          -ftrapv                                                \
#          -funwind-tables                                        \
#          -g3                                                    \
#          -gcolumn-info                                          \
#          -gembed-source                                         \
#          -gfull                                                 \
#          -ggnu-pubnames                                         \
#          -glldb                                                 \
#          -gno-inline-line-tables                                \
#          -ggdb                                                  \
#          -gsplit-dwarf                                          \
#          -mno-omit-leaf-frame-pointer                           \
#          -gused                                                 \
#          -fdebug-macro                                          \
#          -fdebug-pass-structure                                 \
#          -fdebug-pass-arguments                                 \
#          -fdwarf-exceptions                                     \
#          -femit-dwarf-unwind=always                             \
#          -fno-eliminate-unused-debug-types                      \
#          -fno-omit-frame-pointer                                \
#          -fno-optimize-sibling-calls                            \
#          -fdiagnostics-absolute-paths                           \
#          -fdiagnostics-show-note-include-stack                  \
#          -femit-all-decls                                       \
#          -fforce-dwarf-frame                                    \
#          -fshow-column                                          \
#          -fshow-source-location                                 \
#          -fspell-checking                                       \
#          -fstandalone-debug                                     \
#          -fstack-protector-all                                  \
#          -fstack-clash-protection                               \
#          -fno-inline-functions                                  \
#          -MMD                                                   \
#          -MP                                                    \
#          -Wall                                                  \
#          -Wextra                                                \
#          -Wthread-safety                                        \
#          -Wunsafe-buffer-usage                                  \
#          -Wuninitialized                                        \
#          -Wdouble-promotion                                     \
#          -Wnull-dereference                                     \
#          -fsanitize=alignment                                   \
#          -fsanitize=bool                                        \
#          -fsanitize=bounds                                      \
#          -fsanitize=builtin                                     \
#          -fsanitize=enum                                        \
#          -fsanitize=float-cast-overflow                         \
#          -fsanitize=float-divide-by-zero                        \
#          -fsanitize=function                                    \
#          -fsanitize=implicit-integer-sign-change                \
#          -fsanitize=implicit-signed-integer-truncation          \
#          -fsanitize=implicit-unsigned-integer-truncation        \
#          -fsanitize=integer                                     \
#          -fsanitize=local-bounds                                \
#          -fsanitize=memory                                      \
#          -fsanitize-memory-param-retval                         \
#          -fsanitize-memory-track-origins=2                      \
#          -fsanitize=nonnull-attribute                           \
#          -fsanitize=null                                        \
#          -fsanitize=nullability-arg                             \
#          -fsanitize=nullability-assign                          \
#          -fsanitize=nullability-return                          \
#          -fsanitize=pointer-overflow                            \
#          -fsanitize-recover=all                                 \
#          -fsanitize=return                                      \
#          -fsanitize=returns-nonnull-attribute                   \
#          -fsanitize=shift                                       \
#          -fsanitize=signed-integer-overflow                     \
#          -fsanitize=undefined                                   \
#          -fsanitize=unreachable                                 \
#          -fsanitize=unsigned-shift-base                         \
#          -fsanitize=vla-bound                                   \
#          -fsafe-buffer-usage-suggestions                        \
#          -fno-sanitize-trap=all                                 \

# # Project settings
# NAME ?= my_project
# SRC_DIRS ?= src
# INC_DIRS ?= include
# BUILD_DIR ?= .build

# # Automatically detect source files and include paths
# SRCS := $(shell find $(SRC_DIRS) -type f -name '*.c')
# INCS := $(addprefix -I, $(INC_DIRS))

# # Convert .c files to .o files in the build directory, mirroring directory structure
# OBJS := $(patsubst %.c, $(BUILD_DIR)/%.o, $(SRCS))
# DEPS := $(OBJS:.o=.d)

# .PHONY: all re clean fclean

# all: $(NAME)

# # Link the final executable from objects in .build/
# $(NAME): $(OBJS)
# 	$(CC) $(CFLAGS) $(OBJS) -o $@

# # Compile .c files into .o files inside .build/ with directory creation
# $(BUILD_DIR)/%.o: %.c
# 	@mkdir -p $(dir $@)     # Create directory structure for the .o and .d file
# 	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

# -include $(DEPS)

# clean:
# 	$(RM) -r $(BUILD_DIR)

# fclean: clean
# 	$(RM) $(NAME)

# re: fclean all

