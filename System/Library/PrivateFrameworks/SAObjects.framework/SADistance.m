@implementation SADistance

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Distance");
}

+ (id)distance
{
  return objc_alloc_init((Class)a1);
}

- (NSString)unit
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("unit"));
}

- (void)setUnit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("unit"), a3);
}

- (NSNumber)value
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
