import os
import sys

CMD = {
    "Compile": "clang -S -DENABLE_AVX2 -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -O3 -fno-builtin -ffast-math -mavx2 {src} -o {dst}",
    "TransPlan9": "/home/wang/Fancy-Stuffs/c2goasm/build/c2goasm -a {src} {dst}"
}

if __name__ == "__main__":
    src = os.listdir("./src")
    for item in src:
        compile_src = os.path.join("./src", item)
        compile_dst = os.path.join("./asm", item[:-2] + ".s")
        plan_dst = os.path.join(
            '../src/internal/simd/x86_64_simd', item[:-2] + "_avx2.s")
        os.system(CMD["Compile"].format(src=compile_src, dst=compile_dst))
        os.system(CMD["TransPlan9"].format(src=compile_dst, dst=plan_dst))
