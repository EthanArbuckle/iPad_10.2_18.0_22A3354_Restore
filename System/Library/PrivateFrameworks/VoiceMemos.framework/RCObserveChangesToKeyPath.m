@implementation RCObserveChangesToKeyPath

void __RCObserveChangesToKeyPath_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  void *v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

@end
