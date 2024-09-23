@implementation SADomainObjectUpdate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectUpdate");
}

+ (id)domainObjectUpdate
{
  return objc_alloc_init((Class)a1);
}

- (SADomainObject)addFields
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("addFields"));
}

- (void)setAddFields:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("addFields"), a3);
}

- (SADomainObject)identifier
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("identifier"), a3);
}

- (SADomainObject)removeFields
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("removeFields"));
}

- (void)setRemoveFields:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("removeFields"), a3);
}

- (SADomainObject)setFields
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("setFields"));
}

- (void)setSetFields:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("setFields"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
