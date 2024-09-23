@implementation STSharedPathSizingOpQueue

uint64_t __STSharedPathSizingOpQueue_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)STSharedPathSizingOpQueue_opQueue;
  STSharedPathSizingOpQueue_opQueue = (uint64_t)v0;

  STSharedConcurrentQueue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)STSharedPathSizingOpQueue_opQueue, "setUnderlyingQueue:", v2);

  return objc_msgSend((id)STSharedPathSizingOpQueue_opQueue, "setMaxConcurrentOperationCount:", 8);
}

@end
