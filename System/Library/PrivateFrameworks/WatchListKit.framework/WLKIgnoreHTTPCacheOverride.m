@implementation WLKIgnoreHTTPCacheOverride

void __WLKIgnoreHTTPCacheOverride_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v2, "objectForKey:", CFSTR("IgnoreHTTPCache"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    NSLog(CFSTR("WLKIgnoreHTTPCacheOverride: %@"), v0);
    objc_storeStrong((id *)&WLKIgnoreHTTPCacheOverride_retVal, v1);
  }

}

@end
