@implementation UIStatusBarTimeItemView

+ (const)_cStringFromData:(id *)a3
{
  void *v4;
  char v5;

  if (_UIDeviceNativeUserInterfaceIdiom() == 1
    && (_UIKitUserDefaults(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "BOOLForKey:", 0x1E176CE40),
        v4,
        (v5 & 1) != 0))
  {
    return a3->var2;
  }
  else
  {
    return a3->var1;
  }
}

@end
