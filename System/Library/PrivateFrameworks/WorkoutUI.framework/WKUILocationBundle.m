@implementation WKUILocationBundle

void __WKUILocationBundle_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDD1488];
  WKUILocationBundlePath();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)WKUILocationBundle_bundle;
  WKUILocationBundle_bundle = v1;

}

@end
