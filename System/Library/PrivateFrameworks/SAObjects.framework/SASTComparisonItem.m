@implementation SASTComparisonItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("ComparisonItem");
}

+ (id)comparisonItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTComparisonEntity)firstItem
{
  return (SASTComparisonEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("firstItem"));
}

- (void)setFirstItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("firstItem"), a3);
}

- (SAUIDecoratedText)footnote
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("footnote"));
}

- (void)setFootnote:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("footnote"), a3);
}

- (SASTComparisonEntity)secondItem
{
  return (SASTComparisonEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("secondItem"));
}

- (void)setSecondItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("secondItem"), a3);
}

@end
