@implementation SAUITemplateTabularDataRow

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularDataRow");
}

+ (id)tabularDataRow
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)actions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("actions"), v3);
}

- (void)setActions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("actions"), (uint64_t)a3);
}

@end
