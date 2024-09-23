@implementation SASettingGetAutoBrightness

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("GetAutoBrightness");
}

+ (id)getAutoBrightness
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
