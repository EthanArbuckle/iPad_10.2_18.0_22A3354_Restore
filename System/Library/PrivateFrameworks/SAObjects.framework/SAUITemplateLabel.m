@implementation SAUITemplateLabel

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("Label");
}

+ (id)label
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)attributedTexts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("attributedTexts"), v3);
}

- (void)setAttributedTexts:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("attributedTexts"), (uint64_t)a3);
}

- (SAUITemplateAttributedString)text
{
  return (SAUITemplateAttributedString *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("text"), a3);
}

@end
