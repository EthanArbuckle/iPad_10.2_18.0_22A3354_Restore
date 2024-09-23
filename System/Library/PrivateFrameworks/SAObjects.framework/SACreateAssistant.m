@implementation SACreateAssistant

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CreateAssistant");
}

+ (id)createAssistant
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

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)linkedAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkedAssistantId"));
}

- (void)setLinkedAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkedAssistantId"), a3);
}

- (NSString)linkedSpeechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkedSpeechId"));
}

- (void)setLinkedSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkedSpeechId"), a3);
}

- (NSData)linkedValidationData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkedValidationData"));
}

- (void)setLinkedValidationData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkedValidationData"), a3);
}

- (NSString)speechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechId"));
}

- (void)setSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechId"), a3);
}

- (NSData)validationData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("validationData"));
}

- (void)setValidationData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("validationData"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
