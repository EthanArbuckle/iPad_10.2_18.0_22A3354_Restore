@implementation SATTSStartSpeechSynthesisStreamingRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("StartSpeechSynthesisStreamingRequest");
}

+ (id)startSpeechSynthesisStreamingRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)audioType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioType"));
}

- (void)setAudioType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioType"), a3);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

- (NSString)quality
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("quality"));
}

- (void)setQuality:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("quality"), a3);
}

- (BOOL)requiresWordTimingInfo
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("requiresWordTimingInfo"));
}

- (void)setRequiresWordTimingInfo:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("requiresWordTimingInfo"), a3);
}

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableContextInfo"));
}

- (void)setSpeakableContextInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableContextInfo"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

- (NSString)voiceName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("voiceName"));
}

- (void)setVoiceName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("voiceName"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
