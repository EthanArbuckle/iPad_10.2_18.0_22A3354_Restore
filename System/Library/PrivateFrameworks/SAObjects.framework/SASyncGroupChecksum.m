@implementation SASyncGroupChecksum

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("GroupChecksum");
}

+ (id)groupChecksum
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("count"));
}

- (void)setCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("count"), a3);
}

- (NSString)domainObjectClass
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainObjectClass"));
}

- (void)setDomainObjectClass:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainObjectClass"), a3);
}

- (NSString)identifierChecksum
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifierChecksum"));
}

- (void)setIdentifierChecksum:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifierChecksum"), a3);
}

- (SASyncAnchor)syncAnchor
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("syncAnchor"));
}

- (void)setSyncAnchor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("syncAnchor"), a3);
}

@end
