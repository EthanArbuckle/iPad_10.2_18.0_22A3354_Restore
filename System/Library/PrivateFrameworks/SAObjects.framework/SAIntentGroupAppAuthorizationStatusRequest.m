@implementation SAIntentGroupAppAuthorizationStatusRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AppAuthorizationStatusRequest");
}

+ (id)appAuthorizationStatusRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appBundleIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleIds"));
}

- (void)setAppBundleIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleIds"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
