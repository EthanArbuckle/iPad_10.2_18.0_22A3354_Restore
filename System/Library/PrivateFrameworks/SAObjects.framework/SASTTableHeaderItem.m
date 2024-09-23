@implementation SASTTableHeaderItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("TableHeaderItem");
}

+ (id)tableHeaderItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)columnValues
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("columnValues"), v3);
}

- (void)setColumnValues:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("columnValues"), (uint64_t)a3);
}

@end
