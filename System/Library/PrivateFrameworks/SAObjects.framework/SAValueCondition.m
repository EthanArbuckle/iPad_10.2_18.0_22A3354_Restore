@implementation SAValueCondition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ValueCondition");
}

+ (id)valueCondition
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)legalValues
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("legalValues"));
}

- (void)setLegalValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("legalValues"), a3);
}

@end
