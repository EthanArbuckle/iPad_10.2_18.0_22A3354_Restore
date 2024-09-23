@implementation UITraitSceneCaptureState

+ (NSString)name
{
  return (NSString *)CFSTR("SceneCaptureState");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("UITraitSceneCaptureState");
}

+ (int64_t)defaultValue
{
  return -1;
}

+ (BOOL)defaultValueRepresentsUnspecified
{
  return 1;
}

+ (BOOL)affectsColorAppearance
{
  return 0;
}

+ (BOOL)_isPrivate
{
  return 0;
}

@end
