@implementation LSBundleProxy(IsInstalled)

- (uint64_t)_isInstalled
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc(MEMORY[0x24BDC1540]);
  objc_msgSend(a1, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithURL:allowPlaceholder:error:", v3, 1, 0);

  objc_msgSend(v4, "applicationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInstalled");

  return v6;
}

@end
