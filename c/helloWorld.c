void hw(char *a, int s) {
  asm(
    // reset value to 0x0
    "xor %rax, %rax\n"
    "xor %rdx, %rdx\n"
    "xor %rbx, %rbx\n"
    "xor %rcx, %rcx\n"

    // move len to %rdx
    "mov %rsi, %rdx\n"
    // move ptr to %rsi
    "mov %rdi, %rsi\n"
    // set file descriptor to 1 (output)
    "mov $1, %rdi\n"
    // set syscall to 1 (write)
    "mov $1, %rax\n"
    // call kernel
    "syscall\n"
      );
}

int main() {
  char *a= "Hellooooooo World!\n";

  hw(a,(int)strlen(a));
  return 0;
}
