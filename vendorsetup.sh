#!/bin/bash
export USE_CCACHE=true;
export SKIP_ABI_CHECKS=true;
export SDCLANG_PATH=/home/$USER/u/sdclang/toolchains/llvm-Snapdragon_LLVM_for_Android_6.0/prebuilt/linux-x86_64/bin;
export SDCLANG_LTO_DEFS=device/xiaomi/gemini/patches/sdllvm-lto-defs.mk;
export SDCLANG_COMMON_FLAGS="-O3 -fvectorize -Wno-user-defined-warnings -Wno-vectorizer-no-neon -Wno-unknown-warning-option \
-Wno-deprecated-register -Wno-tautological-type-limit-compare -Wno-sign-compare -Wno-gnu-folding-constant \
-mllvm -arm-implicit-it=always -Wno-inline-asm -Wno-unused-command-line-argument -Wno-unused-variable";
# Enable based on host OS/availablitiy
case $(uname -s) in
    Linux)
        if [ -d "$SDCLANG_PATH" ]; then
            export SDCLANG=true; echo -e "\033[32m""sdclang founded: $SDCLANG_PATH""\033[0m";
        fi
        ;;
    Darwin)
        ;;
    *)
        ;;
esac
