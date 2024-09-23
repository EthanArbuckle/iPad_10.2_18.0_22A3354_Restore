@implementation UIApplicationIsUniversalControl

void ___UIApplicationIsUniversalControl_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8003 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.universalcontrol"));

}

@end
