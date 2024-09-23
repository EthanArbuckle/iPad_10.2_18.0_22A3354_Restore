@implementation UIScrollView(PKAppearanceObject)

- (uint64_t)pk_applyAppearance:()PKAppearanceObject
{
  uint64_t v4;

  if (objc_msgSend(a3, "hasDarkAppearance"))
    v4 = 2;
  else
    v4 = 0;
  return objc_msgSend(a1, "setIndicatorStyle:", v4);
}

@end
