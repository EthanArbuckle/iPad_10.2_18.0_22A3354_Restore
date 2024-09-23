@implementation SAUITemplateAttributedStringAttributeRun

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("AttributedStringAttributeRun");
}

+ (id)attributedStringAttributeRun
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)AceObjectProtocolDictionaryForProperty(self, (uint64_t)CFSTR("attributes"), &unk_1EE77BF00);
}

- (void)setAttributes:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("attributes"), (uint64_t)a3);
}

- (SAUITemplateRange)range
{
  return (SAUITemplateRange *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("range"));
}

- (void)setRange:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("range"), a3);
}

@end
