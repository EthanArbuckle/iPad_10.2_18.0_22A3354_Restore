@implementation NSOperationQueue

uint64_t __91__NSOperationQueue_ICRequestAdditions__ic_sharedRequestOperationQueueWithQualityOfService___block_invoke_3()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_7;
  ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_7 = (uint64_t)v0;

  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_7, "setMaxConcurrentOperationCount:", -1);
  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_7, "setQualityOfService:", 33);
  return objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_7, "setName:", CFSTR("com.apple.iTunesCloud.NSOperationQueue.ICRequestUserInteractive"));
}

uint64_t __91__NSOperationQueue_ICRequestAdditions__ic_sharedRequestOperationQueueWithQualityOfService___block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2;
  ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2 = (uint64_t)v0;

  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2, "setMaxConcurrentOperationCount:", -1);
  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2, "setQualityOfService:", 25);
  return objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2, "setName:", CFSTR("com.apple.iTunesCloud.NSOperationQueue.ICRequestUserIntitiated"));
}

uint64_t __91__NSOperationQueue_ICRequestAdditions__ic_sharedRequestOperationQueueWithQualityOfService___block_invoke_5()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_17;
  ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_17 = (uint64_t)v0;

  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_17, "setMaxConcurrentOperationCount:", 3);
  return objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_17, "setName:", CFSTR("com.apple.iTunesCloud.NSOperationQueue.ICRequestDefault"));
}

uint64_t __91__NSOperationQueue_ICRequestAdditions__ic_sharedRequestOperationQueueWithQualityOfService___block_invoke_4()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_12;
  ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_12 = (uint64_t)v0;

  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_12, "setMaxConcurrentOperationCount:", 3);
  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_12, "setQualityOfService:", 9);
  return objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_12, "setName:", CFSTR("com.apple.iTunesCloud.NSOperationQueue.ICRequestBackground"));
}

uint64_t __91__NSOperationQueue_ICRequestAdditions__ic_sharedRequestOperationQueueWithQualityOfService___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue;
  ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue = (uint64_t)v0;

  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue, "setMaxConcurrentOperationCount:", 3);
  objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue, "setQualityOfService:", 17);
  return objc_msgSend((id)ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue, "setName:", CFSTR("com.apple.iTunesCloud.NSOperationQueue.ICRequestUtility"));
}

@end
