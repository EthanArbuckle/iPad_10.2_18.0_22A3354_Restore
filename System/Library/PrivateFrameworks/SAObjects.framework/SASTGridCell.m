@implementation SASTGridCell

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("GridCell");
}

+ (id)gridCell
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)subTitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("subTitle"));
}

- (void)setSubTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("subTitle"), a3);
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
