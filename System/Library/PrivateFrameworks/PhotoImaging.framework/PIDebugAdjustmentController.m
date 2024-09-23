@implementation PIDebugAdjustmentController

+ (NSString)inputExposureKey
{
  return (NSString *)CFSTR("inputExposure");
}

+ (NSString)outputExposureKey
{
  return (NSString *)CFSTR("outputExposure");
}

+ (NSString)headroomAdjustmentKey
{
  return (NSString *)CFSTR("headroomAdjust");
}

+ (NSString)falseColorHDRKey
{
  return (NSString *)CFSTR("falseColorHDR");
}

+ (NSString)inputRAWGamutMapMaxKey
{
  return (NSString *)CFSTR("inputRAWGamutMapMax");
}

@end
