@implementation SAHAAttributeValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("AttributeValue");
}

+ (id)attributeValue
{
  return objc_alloc_init((Class)a1);
}

- (NSString)units
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("units"));
}

- (void)setUnits:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("units"), a3);
}

@end
