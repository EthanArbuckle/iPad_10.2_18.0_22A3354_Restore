@implementation PUI

void __PUI_BundleForPrivacySettingsFramework_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PUI_BundleForPrivacySettingsFramework__privacySettingsFrameworkBundle;
  PUI_BundleForPrivacySettingsFramework__privacySettingsFrameworkBundle = v0;

}

@end
