@implementation SADomainObjectCancel

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectCancel");
}

+ (id)domainObjectCancel
{
  return objc_alloc_init((Class)a1);
}

- (SADomainObject)identifier
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("identifier"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
