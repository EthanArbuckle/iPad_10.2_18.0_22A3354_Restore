@implementation SAPropertyOverride

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PropertyOverride");
}

+ (id)propertyOverride
{
  return objc_alloc_init((Class)a1);
}

- (NSString)property
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("property"));
}

- (void)setProperty:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("property"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
