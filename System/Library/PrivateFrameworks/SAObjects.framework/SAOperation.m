@implementation SAOperation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Operation");
}

+ (id)operation
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)constraints
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("constraints"));
}

- (void)setConstraints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("constraints"), a3);
}

- (NSString)domainId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainId"));
}

- (void)setDomainId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainId"), a3);
}

- (NSString)operationId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("operationId"));
}

- (void)setOperationId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("operationId"), a3);
}

@end
