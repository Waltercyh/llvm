# llvm
MF1933012 
陈宇辉

## 源代码src.c

    int foo(){
    int a;
    a = 1;
    a = 2;

    int* p;
    *p = 1;
    *p = 2;

    }
    
## llvm得到 dst.ll

选取主要部分

    %1 = alloca i32, align 4
    %a = alloca i32, align 4
    %p = alloca i32*, align 8
    store i32 1, i32* %a, align 4
    store i32 2, i32* %a, align 4
    %2 = load i32*, i32** %p, align 8
    store i32 1, i32* %2, align 4
    %3 = load i32*, i32** %p, align 8
    store i32 2, i32* %3, align 4
    %4 = load i32, i32* %1, align 4
    ret i32 %4
    
## 分析

改变变量a的值的时候，不会重建：

    store i32 1, i32* %a, align 4
    store i32 2, i32* %a, align 4
    
但改变指针变量p中的值时会重建:

    %2 = load i32*, i32** %p, align 8
    store i32 1, i32* %2, align 4
    %3 = load i32*, i32** %p, align 8
    store i32 2, i32* %3, align 4


     
