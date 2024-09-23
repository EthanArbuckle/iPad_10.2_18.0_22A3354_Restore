@implementation SATTSSpeechSynthesisAudioInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisAudioInfo");
}

+ (id)speechSynthesisAudioInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)wordTimingInfoList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("wordTimingInfoList"), v3);
}

- (void)setWordTimingInfoList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("wordTimingInfoList"), (uint64_t)a3);
}

@end
