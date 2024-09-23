@implementation SATTSGetSpeechSynthesisVolumeResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("GetSpeechSynthesisVolumeResponse");
}

+ (id)getSpeechSynthesisVolumeResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)volumeLevel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volumeLevel"));
}

- (void)setVolumeLevel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volumeLevel"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
