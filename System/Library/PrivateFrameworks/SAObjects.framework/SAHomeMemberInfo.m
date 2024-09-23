@implementation SAHomeMemberInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("HomeMemberInfo");
}

+ (id)homeMemberInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attributes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributes"));
}

- (void)setAttributes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributes"), a3);
}

- (NSString)companionAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("companionAssistantId"));
}

- (void)setCompanionAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("companionAssistantId"), a3);
}

- (NSString)companionSpeechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("companionSpeechId"));
}

- (void)setCompanionSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("companionSpeechId"), a3);
}

- (NSString)enrollmentName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enrollmentName"));
}

- (void)setEnrollmentName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enrollmentName"), a3);
}

- (SAHomeMemberSettings)homeMemberSettings
{
  return (SAHomeMemberSettings *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("homeMemberSettings"));
}

- (void)setHomeMemberSettings:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("homeMemberSettings"), a3);
}

- (NSString)lastVisitedAceHost
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastVisitedAceHost"));
}

- (void)setLastVisitedAceHost:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastVisitedAceHost"), a3);
}

- (NSString)loggableCompanionAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("loggableCompanionAssistantId"));
}

- (void)setLoggableCompanionAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("loggableCompanionAssistantId"), a3);
}

- (NSString)loggableMultiUserSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("loggableMultiUserSharedUserId"));
}

- (void)setLoggableMultiUserSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("loggableMultiUserSharedUserId"), a3);
}

- (NSString)loggableSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("loggableSharedUserId"));
}

- (void)setLoggableSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("loggableSharedUserId"), a3);
}

- (NSString)sharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sharedUserId"));
}

- (void)setSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sharedUserId"), a3);
}

- (NSString)speechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechId"));
}

- (void)setSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechId"), a3);
}

@end
