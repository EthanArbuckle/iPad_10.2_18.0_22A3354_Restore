@implementation SAMappedDomainEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("MappedDomainEntity");
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (NSData)usoGraphPayload
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("usoGraphPayload"));
}

- (void)setUsoGraphPayload:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("usoGraphPayload"), a3);
}

@end
