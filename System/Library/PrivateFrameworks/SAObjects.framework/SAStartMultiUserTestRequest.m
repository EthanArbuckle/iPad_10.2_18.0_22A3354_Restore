@implementation SAStartMultiUserTestRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartMultiUserTestRequest");
}

+ (id)startMultiUserTestRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)expectedSelectedSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("expectedSelectedSharedUserId"));
}

- (void)setExpectedSelectedSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("expectedSelectedSharedUserId"), a3);
}

- (SAConfidenceScores)voiceIDConfidenceScores
{
  return (SAConfidenceScores *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("voiceIDConfidenceScores"));
}

- (void)setVoiceIDConfidenceScores:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("voiceIDConfidenceScores"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
