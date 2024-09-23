@implementation SASTItemGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("ItemGroup");
}

+ (id)itemGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)fallbackCommands
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("fallbackCommands"), v3);
}

- (void)setFallbackCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("fallbackCommands"), (uint64_t)a3);
}

- (NSArray)templateItems
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("templateItems"), &unk_1EE780738);
}

- (void)setTemplateItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("templateItems"), (uint64_t)a3);
}

@end
