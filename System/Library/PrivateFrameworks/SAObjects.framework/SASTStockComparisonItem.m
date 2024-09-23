@implementation SASTStockComparisonItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("StockComparisonItem");
}

+ (id)stockComparisonItem
{
  return objc_alloc_init((Class)a1);
}

- (NSString)stockValueFacet
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("stockValueFacet"));
}

- (void)setStockValueFacet:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("stockValueFacet"), a3);
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("title"), a3);
}

- (SAUIDecoratedText)value
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("value"), a3);
}

@end
