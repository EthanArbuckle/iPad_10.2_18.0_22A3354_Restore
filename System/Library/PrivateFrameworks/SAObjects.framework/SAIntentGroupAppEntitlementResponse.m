@implementation SAIntentGroupAppEntitlementResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AppEntitlementResponse");
}

+ (id)appEntitlementResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appEntitlements
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appEntitlements"));
}

- (void)setAppEntitlements:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appEntitlements"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
