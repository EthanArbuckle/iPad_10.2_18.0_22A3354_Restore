@implementation SAUIDomainObjectPicker

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectPicker");
}

+ (id)domainObjectPicker
{
  return objc_alloc_init((Class)a1);
}

- (NSString)idNodeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("idNodeName"));
}

- (void)setIdNodeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("idNodeName"), a3);
}

@end
