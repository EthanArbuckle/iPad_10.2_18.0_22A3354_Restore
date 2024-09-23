@implementation MFPHueSaturationLightnessEffect

+ (id)GUID
{
  return CFSTR("8B2DD6C3-EB07-4D87-A5F0-7108E26A9C5F");
}

- (MFPHueSaturationLightnessEffect)initWithHueChange:(int)a3 saturationChange:(int)a4 lightnessChange:(int)a5
{
  MFPHueSaturationLightnessEffect *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFPHueSaturationLightnessEffect;
  result = -[MFPHueSaturationLightnessEffect init](&v9, sel_init);
  if (result)
  {
    result->mHueChange = a3;
    result->mSaturationChange = a4;
    result->mLightnessChange = a5;
  }
  return result;
}

@end
