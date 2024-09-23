@implementation SASSpeechRecognized

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechRecognized");
}

+ (id)speechRecognized
{
  return objc_alloc_init((Class)a1);
}

- (SASAudioAnalytics)audioAnalytics
{
  return (SASAudioAnalytics *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("audioAnalytics"));
}

- (void)setAudioAnalytics:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("audioAnalytics"), a3);
}

- (BOOL)eager
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("eager"));
}

- (void)setEager:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("eager"), a3);
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("processedAudioDuration"));
}

- (void)setProcessedAudioDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("processedAudioDuration"), a3);
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognition"), a3);
}

- (SAUIGetResponseAlternatives)responseAlternatives
{
  return (SAUIGetResponseAlternatives *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("responseAlternatives"));
}

- (void)setResponseAlternatives:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("responseAlternatives"), a3);
}

- (NSString)resultId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultId"));
}

- (void)setResultId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultId"), a3);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
