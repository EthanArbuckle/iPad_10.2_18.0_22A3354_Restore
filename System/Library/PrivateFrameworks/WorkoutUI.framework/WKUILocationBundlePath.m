@implementation WKUILocationBundlePath

void __WKUILocationBundlePath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MEMORY[0x24BD19BDC]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("System/Library/LocationBundles/AppleWatchWorkout.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WKUILocationBundlePath_bundlePath;
  WKUILocationBundlePath_bundlePath = v0;

}

@end
