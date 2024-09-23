@implementation UIAsyncInvocation

uint64_t __28___UIAsyncInvocation_invoke__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 16);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __28___UIAsyncInvocation_invoke__block_invoke_2;
  v7 = &unk_1E16B1B28;
  v8 = v1;
  return (*(uint64_t (**)(void))(v2 + 16))();
}

void __28___UIAsyncInvocation_invoke__block_invoke_2(uint64_t a1)
{
  unint64_t *v1;
  void *v2;
  unint64_t *v3;

  v1 = *(unint64_t **)(a1 + 32);
  v2 = (void *)atomic_load(v1 + 1);
  v3 = v1;
  objc_msgSend(v2, "_didCompleteInvocation");

}

uint64_t __37___UIAsyncInvocation_emptyInvocation__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

@end
