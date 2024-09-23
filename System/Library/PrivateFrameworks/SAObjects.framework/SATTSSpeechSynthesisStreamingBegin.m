@implementation SATTSSpeechSynthesisStreamingBegin

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisStreamingBegin");
}

+ (id)speechSynthesisStreamingBegin
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAudioDescription)decoderStreamDescription
{
  return (SAUIAudioDescription *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoderStreamDescription"));
}

- (void)setDecoderStreamDescription:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoderStreamDescription"), a3);
}

- (SAUIAudioDescription)playerStreamDescription
{
  return (SAUIAudioDescription *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playerStreamDescription"));
}

- (void)setPlayerStreamDescription:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playerStreamDescription"), a3);
}

- (SATTSSpeechSynthesisResource)speechSynthesisResource
{
  return (SATTSSpeechSynthesisResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("speechSynthesisResource"));
}

- (void)setSpeechSynthesisResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("speechSynthesisResource"), a3);
}

- (SATTSSpeechSynthesisVoice)speechSynthesisVoice
{
  return (SATTSSpeechSynthesisVoice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("speechSynthesisVoice"));
}

- (void)setSpeechSynthesisVoice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("speechSynthesisVoice"), a3);
}

- (float)streamingPlaybackBufferSize
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("streamingPlaybackBufferSize"));
}

- (void)setStreamingPlaybackBufferSize:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("streamingPlaybackBufferSize"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
