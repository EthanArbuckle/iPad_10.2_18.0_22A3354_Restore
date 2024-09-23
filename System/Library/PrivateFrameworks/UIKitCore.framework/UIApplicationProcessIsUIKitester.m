@implementation UIApplicationProcessIsUIKitester

void ___UIApplicationProcessIsUIKitester_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC800B = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.UIKitester"));

}

@end
