@implementation SADomainObjectPunchOut

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectPunchOut");
}

+ (id)domainObjectPunchOut
{
  return objc_alloc_init((Class)a1);
}

- (SADomainObject)domainItem
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("domainItem"));
}

- (void)setDomainItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("domainItem"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
