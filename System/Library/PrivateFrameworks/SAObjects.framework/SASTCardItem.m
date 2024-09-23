@implementation SASTCardItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("CardItem");
}

+ (id)cardItem
{
  return objc_alloc_init((Class)a1);
}

- (SAUIColor)backgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("backgroundColor"));
}

- (void)setBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("backgroundColor"), a3);
}

- (SAUIDecoratedText)footnote
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("footnote"));
}

- (void)setFootnote:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("footnote"), a3);
}

- (SAUIDecoratedText)label
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("label"), a3);
}

- (SAUIColor)labelTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("labelTextColor"));
}

- (void)setLabelTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("labelTextColor"), a3);
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("title"), a3);
}

- (SAUIColor)titleBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("titleBackgroundColor"));
}

- (void)setTitleBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("titleBackgroundColor"), a3);
}

- (SAUIColor)titleTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("titleTextColor"));
}

- (void)setTitleTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("titleTextColor"), a3);
}

@end
