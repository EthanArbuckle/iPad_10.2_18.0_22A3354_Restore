@implementation RPUILocalizedString

void __RPUILocalizedString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.RapportUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RPUILocalizedString_sBundle;
  RPUILocalizedString_sBundle = v0;

}

@end
