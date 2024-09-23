@implementation SASemanticValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SemanticValue");
}

+ (id)semanticValue
{
  return objc_alloc_init((Class)a1);
}

- (NSString)semanticValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("semanticValue"));
}

- (void)setSemanticValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("semanticValue"), a3);
}

@end
