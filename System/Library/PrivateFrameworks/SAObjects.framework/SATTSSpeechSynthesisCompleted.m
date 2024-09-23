@implementation SATTSSpeechSynthesisCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisCompleted");
}

+ (id)speechSynthesisCompleted
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)totalPacketNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("totalPacketNumber"));
}

- (void)setTotalPacketNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("totalPacketNumber"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
