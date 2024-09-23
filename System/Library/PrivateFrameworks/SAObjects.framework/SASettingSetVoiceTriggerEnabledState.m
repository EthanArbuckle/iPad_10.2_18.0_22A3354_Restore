@implementation SASettingSetVoiceTriggerEnabledState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetVoiceTriggerEnabledState");
}

+ (id)setVoiceTriggerEnabledState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
