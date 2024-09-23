@implementation SAABPersonSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("PersonSnippet");
}

+ (id)personSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)displayProperties
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayProperties"));
}

- (void)setDisplayProperties:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayProperties"), a3);
}

- (NSArray)persons
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("persons"), v3);
}

- (void)setPersons:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("persons"), (uint64_t)a3);
}

@end
