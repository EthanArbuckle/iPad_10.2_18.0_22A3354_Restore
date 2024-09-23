@implementation STSharedSerialOpQueue

uint64_t __STSharedSerialOpQueue_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)STSharedSerialOpQueue_opQueue;
  STSharedSerialOpQueue_opQueue = (uint64_t)v0;

  STSharedSerialQueue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)STSharedSerialOpQueue_opQueue, "setUnderlyingQueue:", v2);

  return objc_msgSend((id)STSharedSerialOpQueue_opQueue, "setMaxConcurrentOperationCount:", 1);
}

@end
