; ModuleID = 'src.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
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
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
