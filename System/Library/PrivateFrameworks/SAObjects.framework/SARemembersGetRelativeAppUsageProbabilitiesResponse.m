@implementation SARemembersGetRelativeAppUsageProbabilitiesResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.remembers");
}

- (id)encodedClassName
{
  return CFSTR("GetRelativeAppUsageProbabilitiesResponse");
}

+ (id)getRelativeAppUsageProbabilitiesResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)bundleIDPercentages
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleIDPercentages"));
}

- (void)setBundleIDPercentages:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleIDPercentages"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
