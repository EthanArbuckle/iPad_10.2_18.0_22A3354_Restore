@implementation FrameworkBundle

void ___FrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.StorageSettingsFramework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_FrameworkBundle_bundle;
  _FrameworkBundle_bundle = v0;

}

@end
