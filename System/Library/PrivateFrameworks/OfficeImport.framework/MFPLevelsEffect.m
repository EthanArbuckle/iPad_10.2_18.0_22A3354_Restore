@implementation MFPLevelsEffect

+ (id)GUID
{
  return CFSTR("99C354EC-2A31-4F3A-8C34-17A803B33A25");
}

- (MFPLevelsEffect)initWithHighlight:(int)a3 midtone:(int)a4 shadow:(int)a5
{
  MFPLevelsEffect *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFPLevelsEffect;
  result = -[MFPLevelsEffect init](&v9, sel_init);
  if (result)
  {
    result->mHighlight = a3;
    result->mMidtone = a4;
    result->mShadow = a5;
  }
  return result;
}

@end
