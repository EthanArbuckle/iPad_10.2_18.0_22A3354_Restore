@implementation SASettingSetPrivacyLocationService

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetPrivacyLocationService");
}

+ (id)setPrivacyLocationService
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)userConfirmed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("userConfirmed"));
}

- (void)setUserConfirmed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("userConfirmed"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
