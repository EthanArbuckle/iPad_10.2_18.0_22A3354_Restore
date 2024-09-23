@implementation SARDMUXExecuteNLOnServer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("MUXExecuteNLOnServer");
}

- (BOOL)markedForHandOff
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("markedForHandOff"));
}

- (void)setMarkedForHandOff:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("markedForHandOff"), a3);
}

- (BOOL)muxStateRollback
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("muxStateRollback"));
}

- (void)setMuxStateRollback:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("muxStateRollback"), a3);
}

- (NSString)selectedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedUserId"));
}

- (void)setSelectedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedUserId"), a3);
}

- (NSString)selectedUserIdentityClassification
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedUserIdentityClassification"));
}

- (void)setSelectedUserIdentityClassification:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedUserIdentityClassification"), a3);
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
