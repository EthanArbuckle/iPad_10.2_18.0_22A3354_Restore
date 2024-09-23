@implementation SAUITemplateTabularDataRowStyleRule

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularDataRowStyleRule");
}

+ (id)tabularDataRowStyleRule
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)minimumHeight
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("minimumHeight"));
}

- (void)setMinimumHeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("minimumHeight"), a3);
}

- (NSNumber)rowCount
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rowCount"));
}

- (void)setRowCount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rowCount"), a3);
}

- (NSNumber)rowStartIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rowStartIndex"));
}

- (void)setRowStartIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rowStartIndex"), a3);
}

- (NSNumber)showTopBorder
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("showTopBorder"));
}

- (void)setShowTopBorder:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("showTopBorder"), a3);
}

@end
