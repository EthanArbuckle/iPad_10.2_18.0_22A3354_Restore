@implementation SARDRemoteExecutionContextUpdate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("RemoteExecutionContextUpdate");
}

- (NSData)executionContextUpdate
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("executionContextUpdate"));
}

- (void)setExecutionContextUpdate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("executionContextUpdate"), a3);
}

- (NSString)remoteDeviceAssistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("remoteDeviceAssistantId"));
}

- (void)setRemoteDeviceAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("remoteDeviceAssistantId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
