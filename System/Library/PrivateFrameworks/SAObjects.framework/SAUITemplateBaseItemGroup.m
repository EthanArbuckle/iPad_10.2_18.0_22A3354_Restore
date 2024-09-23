@implementation SAUITemplateBaseItemGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("BaseItemGroup");
}

+ (id)baseItemGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)templateItems
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("templateItems"), &unk_1EE795738);
}

- (void)setTemplateItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("templateItems"), (uint64_t)a3);
}

@end
