#include <stdio.h>

int add(int a, int b) {
  // int a -> %edi or %rdi
  // int b -> %esi or %rsi
  // return always with %eax or %rax
  asm (
    "add %edi, %esi\n"
    "mov %esi, %eax\n"
      );
}

int main() {
  int x;
  x = add(1,2);
  printf("%d\n",x);
  return 0;
}
