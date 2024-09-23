@implementation SASVoiceIdentificationSignal

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("VoiceIdentificationSignal");
}

+ (id)voiceIdentificationSignal
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)recordUserAudio
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("recordUserAudio"));
}

- (void)setRecordUserAudio:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("recordUserAudio"), a3);
}

- (NSString)resultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultCandidateId"));
}

- (void)setResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultCandidateId"), a3);
}

- (NSString)selectedSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedSharedUserId"));
}

- (void)setSelectedSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedSharedUserId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
