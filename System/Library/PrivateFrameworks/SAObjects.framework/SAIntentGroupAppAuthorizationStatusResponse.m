@implementation SAIntentGroupAppAuthorizationStatusResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AppAuthorizationStatusResponse");
}

+ (id)appAuthorizationStatusResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)appAuthorizationStatusMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appAuthorizationStatusMap"));
}

- (void)setAppAuthorizationStatusMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appAuthorizationStatusMap"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
