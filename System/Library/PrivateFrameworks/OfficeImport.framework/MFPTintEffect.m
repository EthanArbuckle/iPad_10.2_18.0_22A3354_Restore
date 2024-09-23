@implementation MFPTintEffect

+ (id)GUID
{
  return CFSTR("1077AF00-2848-4441-9489-44AD4C2D7A2C");
}

- (MFPTintEffect)initWithHue:(int)a3 amount:(int)a4
{
  MFPTintEffect *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPTintEffect;
  result = -[MFPTintEffect init](&v7, sel_init);
  if (result)
  {
    result->mHue = a3;
    result->mAmount = a4;
  }
  return result;
}

@end
