@implementation ShouldWorkaround88706066

void ___ShouldWorkaround88706066_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_43_1 = objc_msgSend(CFSTR("com.apple.purplebuddy"), "isEqualToString:", v0);

}

@end
