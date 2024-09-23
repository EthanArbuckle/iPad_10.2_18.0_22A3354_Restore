@implementation UIApplicationExtensionDiscoveryGetPostprocessedExtensions

uint64_t ___UIApplicationExtensionDiscoveryGetPostprocessedExtensions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_plugIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

@end
