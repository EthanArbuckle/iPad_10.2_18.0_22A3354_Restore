@implementation SAUITemplateTabularDataRowAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularDataRowAction");
}

+ (id)tabularDataRowAction
{
  return objc_alloc_init((Class)a1);
}

@end
