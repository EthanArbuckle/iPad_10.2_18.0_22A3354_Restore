@implementation NSOperationQueue

void __75__NSOperationQueue_RelevanceEngineUtilities__re_sharedSerialOperationQueue__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)re_sharedSerialOperationQueue_queue;
  re_sharedSerialOperationQueue_queue = (uint64_t)v0;

  objc_msgSend((id)re_sharedSerialOperationQueue_queue, "setName:", CFSTR("com.apple.relevanceengine.shared.utility.operation-queue"));
  objc_msgSend((id)re_sharedSerialOperationQueue_queue, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)re_sharedSerialOperationQueue_queue, "setQualityOfService:", 17);
  v2 = (void *)re_sharedSerialOperationQueue_queue;
  RESharedSerialDispatchQueue();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnderlyingQueue:", v3);

}

@end
