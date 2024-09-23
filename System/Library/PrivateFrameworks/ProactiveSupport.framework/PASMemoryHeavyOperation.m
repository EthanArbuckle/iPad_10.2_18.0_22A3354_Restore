@implementation PASMemoryHeavyOperation

uint64_t ___PASMemoryHeavyOperation_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = pthread_setspecific(_PASMemoryHeavyOperation_tlKey, (const void *)1);
  v3 = (void *)MEMORY[0x1A1AFDC98](v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);
  return pthread_setspecific(_PASMemoryHeavyOperation_tlKey, 0);
}

uint64_t ___PASMemoryHeavyOperation_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = dispatch_queue_create("_PASMemoryHeavyOperationLock-UI", 0);
  v1 = (void *)_PASMemoryHeavyOperation_uiQueue;
  _PASMemoryHeavyOperation_uiQueue = (uint64_t)v0;

  v2 = dispatch_queue_create("_PASMemoryHeavyOperationLock-Low", 0);
  v3 = (void *)_PASMemoryHeavyOperation_lowQueue;
  _PASMemoryHeavyOperation_lowQueue = (uint64_t)v2;

  return pthread_key_create((pthread_key_t *)&_PASMemoryHeavyOperation_tlKey, 0);
}

@end
