@implementation SASource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Source");
}

+ (id)source
{
  return objc_alloc_init((Class)a1);
}

- (NSString)accountIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accountIdentifier"));
}

- (void)setAccountIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accountIdentifier"), a3);
}

- (NSString)accountName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accountName"));
}

- (void)setAccountName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accountName"), a3);
}

- (NSString)domainIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainIdentifier"));
}

- (void)setDomainIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainIdentifier"), a3);
}

- (NSNumber)remote
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("remote"));
}

- (void)setRemote:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("remote"), a3);
}

@end
