@implementation SASetDeviceTTSMuteState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetDeviceTTSMuteState");
}

+ (id)setDeviceTTSMuteState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)textToSpeechIsMuted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("textToSpeechIsMuted"));
}

- (void)setTextToSpeechIsMuted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("textToSpeechIsMuted"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
