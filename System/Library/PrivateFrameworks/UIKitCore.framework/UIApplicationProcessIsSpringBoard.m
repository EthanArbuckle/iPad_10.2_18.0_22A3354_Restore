@implementation UIApplicationProcessIsSpringBoard

void ___UIApplicationProcessIsSpringBoard_block_invoke()
{
  id v0;

  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EDDC8008 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.springboard"));

  }
  else
  {
    byte_1EDDC8008 = 0;
  }
}

@end
