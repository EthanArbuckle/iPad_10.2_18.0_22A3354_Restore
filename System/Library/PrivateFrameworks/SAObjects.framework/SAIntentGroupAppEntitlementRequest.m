@implementation SAIntentGroupAppEntitlementRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AppEntitlementRequest");
}

+ (id)appEntitlementRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
