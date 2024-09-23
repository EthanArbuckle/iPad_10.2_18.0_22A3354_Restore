@implementation SASyncAppIdentifyingInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("AppIdentifyingInfo");
}

+ (id)appIdentifyingInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSString)buildNumber
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("buildNumber"));
}

- (void)setBuildNumber:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("buildNumber"), a3);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (NSString)clientIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientIdentifier"));
}

- (void)setClientIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientIdentifier"), a3);
}

- (NSString)version
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("version"));
}

- (void)setVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("version"), a3);
}

@end
