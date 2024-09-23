@implementation SAPhonePostVoiceTriggerDuringCallEnabledNotification

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("PostVoiceTriggerDuringCallEnabledNotification");
}

- (BOOL)enableVoiceTriggerDuringPhoneCall
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enableVoiceTriggerDuringPhoneCall"));
}

- (void)setEnableVoiceTriggerDuringPhoneCall:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enableVoiceTriggerDuringPhoneCall"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
