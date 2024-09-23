@implementation SATTSSpeechSynthesisPartialResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisPartialResponse");
}

+ (id)speechSynthesisPartialResponse
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAudioData)aceAudioData
{
  return (SAUIAudioData *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("aceAudioData"));
}

- (void)setAceAudioData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("aceAudioData"), a3);
}

- (SATTSSpeechSynthesisAudioInfo)aceAudioInfo
{
  return (SATTSSpeechSynthesisAudioInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("aceAudioInfo"));
}

- (void)setAceAudioInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("aceAudioInfo"), a3);
}

- (int64_t)currentPacketNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("currentPacketNumber"));
}

- (void)setCurrentPacketNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("currentPacketNumber"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
