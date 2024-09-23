@implementation SASettingSetAppearanceResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetAppearanceResponse");
}

+ (id)setAppearanceResponse
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
