@implementation SATTSCancelSpeechSynthesis

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("CancelSpeechSynthesis");
}

+ (id)cancelSpeechSynthesis
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
