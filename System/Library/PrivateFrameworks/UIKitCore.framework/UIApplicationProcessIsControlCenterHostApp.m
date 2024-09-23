@implementation UIApplicationProcessIsControlCenterHostApp

void ___UIApplicationProcessIsControlCenterHostApp_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC800D = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.ControlCenterHostApp"));

}

@end
