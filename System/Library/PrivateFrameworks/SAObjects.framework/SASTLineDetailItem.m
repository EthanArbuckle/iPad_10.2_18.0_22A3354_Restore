@implementation SASTLineDetailItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("LineDetailItem");
}

+ (id)lineDetailItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("title"), a3);
}

@end
