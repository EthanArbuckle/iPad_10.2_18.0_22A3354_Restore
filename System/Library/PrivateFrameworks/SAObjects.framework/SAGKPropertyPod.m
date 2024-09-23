@implementation SAGKPropertyPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("PropertyPod");
}

+ (id)propertyPod
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)propertyList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("propertyList"), v3);
}

- (void)setPropertyList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("propertyList"), (uint64_t)a3);
}

@end
