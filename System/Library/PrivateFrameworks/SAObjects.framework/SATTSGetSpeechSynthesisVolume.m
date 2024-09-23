@implementation SATTSGetSpeechSynthesisVolume

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("GetSpeechSynthesisVolume");
}

+ (id)getSpeechSynthesisVolume
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
