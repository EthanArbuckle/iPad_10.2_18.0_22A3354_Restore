@implementation SFBundleForSettingsFoundationFramework

void __SFBundleForSettingsFoundationFramework_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SFBundleForSettingsFoundationFramework__settingsFoundationFrameworkBundle;
  SFBundleForSettingsFoundationFramework__settingsFoundationFrameworkBundle = v0;

}

@end
