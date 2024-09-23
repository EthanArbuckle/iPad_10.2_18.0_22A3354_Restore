@implementation SAPhonePlayVoiceMail

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("PlayVoiceMail");
}

+ (id)playVoiceMail
{
  return objc_alloc_init((Class)a1);
}

- (SARemoteDevice)targetDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("targetDevice"));
}

- (void)setTargetDevice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("targetDevice"), a3);
}

- (NSURL)voiceMailId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("voiceMailId"));
}

- (void)setVoiceMailId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("voiceMailId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
