@implementation SAInputValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("InputValue");
}

+ (id)inputValue
{
  return objc_alloc_init((Class)a1);
}

- (NSString)inputValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("inputValue"));
}

- (void)setInputValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("inputValue"), a3);
}

@end
