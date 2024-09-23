@implementation SAGKDomainObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("DomainObject");
}

+ (id)domainObject
{
  return objc_alloc_init((Class)a1);
}

@end
