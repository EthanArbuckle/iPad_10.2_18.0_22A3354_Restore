@implementation UIApplicationProcessIsCarousel

void ___UIApplicationProcessIsCarousel_block_invoke()
{
  id v0;

  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EDDC800C = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Carousel"));

  }
  else
  {
    byte_1EDDC800C = 0;
  }
}

@end
