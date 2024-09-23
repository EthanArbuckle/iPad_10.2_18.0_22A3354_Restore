@implementation MFPColorCurveEffect

+ (id)GUID
{
  return CFSTR("DD6A0022-58E4-4A67-9D9B-D48EB881A53D");
}

- (MFPColorCurveEffect)initWithAdjustment:(int)a3 channel:(int)a4 adjustValue:(int)a5
{
  MFPColorCurveEffect *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFPColorCurveEffect;
  result = -[MFPColorCurveEffect init](&v9, sel_init);
  if (result)
  {
    result->mAdjustment = a3;
    result->mChannel = a4;
    result->mAdjustValue = a5;
  }
  return result;
}

@end
