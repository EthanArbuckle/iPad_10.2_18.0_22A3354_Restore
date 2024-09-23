@implementation SAAbstractItemList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AbstractItemList");
}

+ (id)abstractItemList
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)domainObjects
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("domainObjects"), v3);
}

- (void)setDomainObjects:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("domainObjects"), (uint64_t)a3);
}

- (NSNumber)selectedIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selectedIndex"));
}

- (void)setSelectedIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selectedIndex"), a3);
}

@end
