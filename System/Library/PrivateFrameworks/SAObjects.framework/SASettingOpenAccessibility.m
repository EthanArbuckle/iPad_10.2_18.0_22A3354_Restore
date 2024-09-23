@implementation SASettingOpenAccessibility

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("OpenAccessibility");
}

+ (id)openAccessibility
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
