@implementation SACreateVOXList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CreateVOXList");
}

+ (id)createVOXList
{
  return objc_alloc_init((Class)a1);
}

- (NSString)domainName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainName"));
}

- (void)setDomainName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainName"), a3);
}

- (NSArray)introductions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("introductions"));
}

- (void)setIntroductions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("introductions"), a3);
}

- (NSArray)items
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("items"), v3);
}

- (void)setItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("items"), (uint64_t)a3);
}

- (int64_t)pageSize
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("pageSize"));
}

- (void)setPageSize:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("pageSize"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
