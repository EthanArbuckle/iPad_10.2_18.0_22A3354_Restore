@implementation SAUISnippetAttributeOpened

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SnippetAttributeOpened");
}

+ (id)snippetAttributeOpened
{
  return objc_alloc_init((Class)a1);
}

- (NSString)attributeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributeName"));
}

- (void)setAttributeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributeName"), a3);
}

- (NSString)attributeValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributeValue"));
}

- (void)setAttributeValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributeValue"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
