@implementation MFPBrightnessContrastEffect

+ (id)GUID
{
  return CFSTR("D3A1DBE1-8EC4-4C17-9F4C-EA97AD1C343D");
}

- (MFPBrightnessContrastEffect)initWithBrightness:(int)a3 contrast:(int)a4
{
  MFPBrightnessContrastEffect *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPBrightnessContrastEffect;
  result = -[MFPBrightnessContrastEffect init](&v7, sel_init);
  if (result)
  {
    result->mBrightness = a3;
    result->mContrast = a4;
  }
  return result;
}

@end
