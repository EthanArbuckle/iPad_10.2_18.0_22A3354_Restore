@implementation UIApplicationProcessIsCarPlayApp

void ___UIApplicationProcessIsCarPlayApp_block_invoke()
{
  id v0;

  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EDDC800E = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CarPlayApp"));

  }
  else
  {
    byte_1EDDC800E = 0;
  }
}

@end
