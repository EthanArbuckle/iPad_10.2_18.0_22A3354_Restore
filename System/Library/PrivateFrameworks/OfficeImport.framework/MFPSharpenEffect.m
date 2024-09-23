@implementation MFPSharpenEffect

+ (id)GUID
{
  return CFSTR("63CBF3EE-C526-402C-8F71-62C540BF5142");
}

- (MFPSharpenEffect)initWithAmount:(float)a3 radius:(float)a4
{
  MFPSharpenEffect *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPSharpenEffect;
  result = -[MFPSharpenEffect init](&v7, sel_init);
  if (result)
  {
    result->mAmount = a3;
    result->mRadius = a4;
  }
  return result;
}

@end
