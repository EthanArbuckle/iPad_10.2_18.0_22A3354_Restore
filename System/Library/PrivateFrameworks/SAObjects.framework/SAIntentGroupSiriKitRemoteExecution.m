@implementation SAIntentGroupSiriKitRemoteExecution

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitRemoteExecution");
}

+ (id)siriKitRemoteExecution
{
  return objc_alloc_init((Class)a1);
}

- (NSString)executionDeviceAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("executionDeviceAssistantId"));
}

- (void)setExecutionDeviceAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("executionDeviceAssistantId"), a3);
}

- (NSString)invocationDeviceAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("invocationDeviceAssistantId"));
}

- (void)setInvocationDeviceAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("invocationDeviceAssistantId"), a3);
}

- (NSString)personalDomainAuthenticationMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("personalDomainAuthenticationMode"));
}

- (void)setPersonalDomainAuthenticationMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("personalDomainAuthenticationMode"), a3);
}

- (NSString)runLocation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("runLocation"));
}

- (void)setRunLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("runLocation"), a3);
}

@end
