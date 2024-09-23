@implementation VisionCoreFrameworkBundle

void __VisionCoreFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.VisionCore"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VisionCoreFrameworkBundle_bundle;
  VisionCoreFrameworkBundle_bundle = v0;

}

@end
