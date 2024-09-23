@implementation SAUIAudioData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AudioData");
}

+ (id)audioData
{
  return objc_alloc_init((Class)a1);
}

- (NSData)audioBuffer
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioBuffer"));
}

- (void)setAudioBuffer:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioBuffer"), a3);
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

@end
