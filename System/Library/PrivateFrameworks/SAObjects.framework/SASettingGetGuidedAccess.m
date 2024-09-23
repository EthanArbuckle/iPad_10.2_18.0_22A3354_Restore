@implementation SASettingGetGuidedAccess

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("GetGuidedAccess");
}

+ (id)getGuidedAccess
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
