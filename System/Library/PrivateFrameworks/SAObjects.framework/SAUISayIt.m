@implementation SAUISayIt

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SayIt");
}

+ (id)sayIt
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAudioData)audioData
{
  return (SAUIAudioData *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("audioData"));
}

- (void)setAudioData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("audioData"), a3);
}

- (NSString)audioDataUrl
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioDataUrl"));
}

- (void)setAudioDataUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioDataUrl"), a3);
}

- (BOOL)canUseServerTTS
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("canUseServerTTS"));
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("canUseServerTTS"), a3);
}

- (SAAceSerializable)context
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("context"));
}

- (void)setContext:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("context"), a3);
}

- (NSString)dialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogIdentifier"));
}

- (void)setDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogIdentifier"), a3);
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

- (NSNumber)listenAfterSpeaking
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listenAfterSpeaking"));
}

- (void)setListenAfterSpeaking:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listenAfterSpeaking"), a3);
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return (SAUIListenAfterSpeakingBehavior *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("listenAfterSpeakingBehavior"));
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("listenAfterSpeakingBehavior"), a3);
}

- (NSString)message
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("message"), a3);
}

- (BOOL)repeatable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("repeatable"));
}

- (void)setRepeatable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("repeatable"), a3);
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
  return 0;
}

@end
