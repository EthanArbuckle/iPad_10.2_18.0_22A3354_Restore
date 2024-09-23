@implementation SALoadAssistant

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("LoadAssistant");
}

+ (id)loadAssistant
{
  return objc_alloc_init((Class)a1);
}

- (NSData)activationToken
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationToken"));
}

- (void)setActivationToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationToken"), a3);
}

- (NSString)appleConnectServiceTicket
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appleConnectServiceTicket"));
}

- (void)setAppleConnectServiceTicket:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appleConnectServiceTicket"), a3);
}

- (NSString)appleConnectSessionToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appleConnectSessionToken"));
}

- (void)setAppleConnectSessionToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appleConnectSessionToken"), a3);
}

- (NSString)assistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assistantId"));
}

- (void)setAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assistantId"), a3);
}

- (NSString)connectionMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("connectionMode"));
}

- (void)setConnectionMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("connectionMode"), a3);
}

- (NSString)connectionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("connectionType"));
}

- (void)setConnectionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("connectionType"), a3);
}

- (NSString)dataSharingOptInStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dataSharingOptInStatus"));
}

- (void)setDataSharingOptInStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dataSharingOptInStatus"), a3);
}

- (NSNumber)deviceAuthVersion
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceAuthVersion"));
}

- (void)setDeviceAuthVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceAuthVersion"), a3);
}

- (NSString)ephemeralUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ephemeralUserId"));
}

- (void)setEphemeralUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ephemeralUserId"), a3);
}

- (NSArray)experiments
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("experiments"), v3);
}

- (void)setExperiments:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("experiments"), (uint64_t)a3);
}

- (BOOL)gmDevice
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("gmDevice"));
}

- (void)setGmDevice:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("gmDevice"), a3);
}

- (NSString)hubAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hubAssistantId"));
}

- (void)setHubAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hubAssistantId"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)lastKnownAceHostOfCompanion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastKnownAceHostOfCompanion"));
}

- (void)setLastKnownAceHostOfCompanion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastKnownAceHostOfCompanion"), a3);
}

- (NSString)linkedAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkedAssistantId"));
}

- (void)setLinkedAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkedAssistantId"), a3);
}

- (NSData)linkedSessionValidationData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkedSessionValidationData"));
}

- (void)setLinkedSessionValidationData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkedSessionValidationData"), a3);
}

- (NSString)linkedSpeechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkedSpeechId"));
}

- (void)setLinkedSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkedSpeechId"), a3);
}

- (NSString)loggableAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("loggableAssistantId"));
}

- (void)setLoggableAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("loggableAssistantId"), a3);
}

- (NSString)loggableSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("loggableSharedUserId"));
}

- (void)setLoggableSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("loggableSharedUserId"), a3);
}

- (NSNumber)rpiEnabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rpiEnabled"));
}

- (void)setRpiEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rpiEnabled"), a3);
}

- (NSString)selfClockId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selfClockId"));
}

- (void)setSelfClockId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selfClockId"), a3);
}

- (NSData)sessionValidationData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionValidationData"));
}

- (void)setSessionValidationData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionValidationData"), a3);
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

- (BOOL)requiresResponse
{
  return 1;
}

@end
