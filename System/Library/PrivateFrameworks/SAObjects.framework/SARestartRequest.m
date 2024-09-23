@implementation SARestartRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RestartRequest");
}

+ (id)restartRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)lastResponseId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastResponseId"));
}

- (void)setLastResponseId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastResponseId"), a3);
}

- (NSString)requestId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestId"));
}

- (void)setRequestId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
