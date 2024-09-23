@implementation NSFileManager

void __55__NSFileManager_HKSPFileManager___bundleCacheDirectory__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v3;

}

@end
