@implementation SAUIShowRequestHandlingStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ShowRequestHandlingStatus");
}

- (NSString)asrStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("asrStatus"));
}

- (void)setAsrStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("asrStatus"), a3);
}

- (NSString)executionInputSystem
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("executionInputSystem"));
}

- (void)setExecutionInputSystem:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("executionInputSystem"), a3);
}

- (NSString)requestHandlingStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestHandlingStatus"));
}

- (void)setRequestHandlingStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestHandlingStatus"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
