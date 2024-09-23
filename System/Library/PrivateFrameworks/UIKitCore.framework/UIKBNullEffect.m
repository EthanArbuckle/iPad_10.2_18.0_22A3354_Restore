@implementation UIKBNullEffect

- (BOOL)isValid
{
  return 0;
}

- (BOOL)renderUnder
{
  return 0;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
  objc_msgSend(a3, "renderNullEffect:withTraits:", self, a4);
}

- (double)weight
{
  return 0.0;
}

- (BOOL)usesRGBColors
{
  return 0;
}

- (UIKBGradient)gradient
{
  return 0;
}

- (CGColor)CGColor
{
  return 0;
}

+ (id)nullEffect
{
  return objc_alloc_init((Class)a1);
}

@end
