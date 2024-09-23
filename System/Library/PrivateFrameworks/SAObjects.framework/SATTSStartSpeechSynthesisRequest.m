@implementation SATTSStartSpeechSynthesisRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("StartSpeechSynthesisRequest");
}

+ (id)startSpeechSynthesisRequest
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

- (BOOL)enableAudioInfo
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enableAudioInfo"));
}

- (void)setEnableAudioInfo:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enableAudioInfo"), a3);
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

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableContextInfo"));
}

- (void)setSpeakableContextInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableContextInfo"), a3);
}

- (BOOL)streaming
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("streaming"));
}

- (void)setStreaming:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("streaming"), a3);
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
