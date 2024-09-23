@implementation SADomainObjectCancelCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectCancelCompleted");
}

+ (id)domainObjectCancelCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
