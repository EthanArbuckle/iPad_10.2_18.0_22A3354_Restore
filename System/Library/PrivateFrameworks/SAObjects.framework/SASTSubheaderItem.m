@implementation SASTSubheaderItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("SubheaderItem");
}

+ (id)subheaderItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)leftText
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("leftText"));
}

- (void)setLeftText:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("leftText"), a3);
}

- (SAUIDecoratedText)rightText
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rightText"));
}

- (void)setRightText:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rightText"), a3);
}

@end
