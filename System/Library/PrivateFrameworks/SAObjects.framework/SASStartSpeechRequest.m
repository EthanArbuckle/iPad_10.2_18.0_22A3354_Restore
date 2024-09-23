@implementation SASStartSpeechRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartSpeechRequest");
}

+ (id)startSpeechRequest
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)autoPunctuationEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("autoPunctuationEnabled"));
}

- (void)setAutoPunctuationEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("autoPunctuationEnabled"), a3);
}

- (NSArray)bargeInModes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bargeInModes"));
}

- (void)setBargeInModes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bargeInModes"), a3);
}

- (NSString)clientModelVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientModelVersion"));
}

- (void)setClientModelVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientModelVersion"), a3);
}

- (NSNumber)durationSincePreviousTTSFinish
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationSincePreviousTTSFinish"));
}

- (void)setDurationSincePreviousTTSFinish:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationSincePreviousTTSFinish"), a3);
}

- (NSNumber)durationSincePreviousTTSStart
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationSincePreviousTTSStart"));
}

- (void)setDurationSincePreviousTTSStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationSincePreviousTTSStart"), a3);
}

- (BOOL)eyesFree
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("eyesFree"));
}

- (void)setEyesFree:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("eyesFree"), a3);
}

- (BOOL)handsFree
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("handsFree"));
}

- (void)setHandsFree:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("handsFree"), a3);
}

- (NSString)responseMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseMode"));
}

- (void)setResponseMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseMode"), a3);
}

- (SASetRequestOrigin)setRequestOrigin
{
  return (SASetRequestOrigin *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("setRequestOrigin"));
}

- (void)setSetRequestOrigin:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("setRequestOrigin"), a3);
}

- (BOOL)talkOnly
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("talkOnly"));
}

- (void)setTalkOnly:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("talkOnly"), a3);
}

- (BOOL)textToSpeechIsMuted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("textToSpeechIsMuted"));
}

- (void)setTextToSpeechIsMuted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("textToSpeechIsMuted"), a3);
}

- (NSArray)voiceTriggerPhrases
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("voiceTriggerPhrases"));
}

- (void)setVoiceTriggerPhrases:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("voiceTriggerPhrases"), a3);
}

- (BOOL)wasLaunchedForRequest
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("wasLaunchedForRequest"));
}

- (void)setWasLaunchedForRequest:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("wasLaunchedForRequest"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
