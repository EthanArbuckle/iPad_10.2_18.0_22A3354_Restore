@implementation SATTSFetchSpeechSynthesisVoiceResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("FetchSpeechSynthesisVoiceResponse");
}

+ (id)fetchSpeechSynthesisVoiceResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)voiceKeyList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("voiceKeyList"), v3);
}

- (void)setVoiceKeyList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("voiceKeyList"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
