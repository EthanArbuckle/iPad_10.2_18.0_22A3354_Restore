@implementation SADomainObjectCreateCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectCreateCompleted");
}

+ (id)domainObjectCreateCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("identifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
