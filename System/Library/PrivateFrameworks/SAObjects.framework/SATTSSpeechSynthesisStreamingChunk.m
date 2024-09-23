@implementation SATTSSpeechSynthesisStreamingChunk

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisStreamingChunk");
}

+ (id)speechSynthesisStreamingChunk
{
  return objc_alloc_init((Class)a1);
}

- (NSData)audioData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioData"));
}

- (void)setAudioData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioData"), a3);
}

- (SATTSSpeechSynthesisAudioInfo)audioInfo
{
  return (SATTSSpeechSynthesisAudioInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("audioInfo"));
}

- (void)setAudioInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("audioInfo"), a3);
}

- (int64_t)index
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("index"));
}

- (void)setIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("index"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
