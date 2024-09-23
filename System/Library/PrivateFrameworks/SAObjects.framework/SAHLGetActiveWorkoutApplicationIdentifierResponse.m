@implementation SAHLGetActiveWorkoutApplicationIdentifierResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("GetActiveWorkoutApplicationIdentifierResponse");
}

+ (id)getActiveWorkoutApplicationIdentifierResponse
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
  return 0;
}

@end
