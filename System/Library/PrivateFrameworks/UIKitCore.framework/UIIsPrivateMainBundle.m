@implementation UIIsPrivateMainBundle

void ___UIIsPrivateMainBundle_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1285 = objc_msgSend(v0, "hasPrefix:", CFSTR("com.apple."));

}

@end
