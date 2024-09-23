@implementation NSOperationQueue

uint64_t __59__NSOperationQueue_WLKAdditions__wlkDefaultConcurrentQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)wlkDefaultConcurrentQueue___wlkDefaultConQueue;
  wlkDefaultConcurrentQueue___wlkDefaultConQueue = (uint64_t)v0;

  objc_msgSend((id)wlkDefaultConcurrentQueue___wlkDefaultConQueue, "setName:", CFSTR("com.apple.WatchListKit.defaultconcurrentqueue"));
  return objc_msgSend((id)wlkDefaultConcurrentQueue___wlkDefaultConQueue, "setMaxConcurrentOperationCount:", 10);
}

uint64_t __49__NSOperationQueue_WLKAdditions__wlkDefaultQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)wlkDefaultQueue___wlkDefaultQueue;
  wlkDefaultQueue___wlkDefaultQueue = (uint64_t)v0;

  objc_msgSend((id)wlkDefaultQueue___wlkDefaultQueue, "setName:", CFSTR("com.apple.WatchListKit.defaultqueue"));
  return objc_msgSend((id)wlkDefaultQueue___wlkDefaultQueue, "setMaxConcurrentOperationCount:", 1);
}

@end
