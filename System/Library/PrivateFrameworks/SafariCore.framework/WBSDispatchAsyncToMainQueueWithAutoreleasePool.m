@implementation WBSDispatchAsyncToMainQueueWithAutoreleasePool

void __WBSDispatchAsyncToMainQueueWithAutoreleasePool_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E27154]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
