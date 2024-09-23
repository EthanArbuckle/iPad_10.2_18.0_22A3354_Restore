@implementation SAUITemplateAttributedString

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("AttributedString");
}

+ (id)attributedString
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attributeRuns
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("attributeRuns"), v3);
}

- (void)setAttributeRuns:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("attributeRuns"), (uint64_t)a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
