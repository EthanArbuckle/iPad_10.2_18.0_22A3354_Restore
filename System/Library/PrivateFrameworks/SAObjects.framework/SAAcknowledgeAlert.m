@implementation SAAcknowledgeAlert

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AcknowledgeAlert");
}

+ (id)acknowledgeAlert
{
  return objc_alloc_init((Class)a1);
}

- (SADomainObject)object
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("object"));
}

- (void)setObject:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("object"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
