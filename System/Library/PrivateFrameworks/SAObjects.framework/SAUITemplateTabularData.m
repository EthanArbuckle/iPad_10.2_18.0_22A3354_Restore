@implementation SAUITemplateTabularData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularData");
}

+ (id)tabularData
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)allowContentScrolling
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("allowContentScrolling"));
}

- (void)setAllowContentScrolling:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("allowContentScrolling"), a3);
}

- (NSArray)columns
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("columns"), v3);
}

- (void)setColumns:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("columns"), (uint64_t)a3);
}

- (SAUITemplateItem)footerItem
{
  return (SAUITemplateItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("footerItem"));
}

- (void)setFooterItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("footerItem"), a3);
}

- (SAUITemplateItem)headerItem
{
  return (SAUITemplateItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("headerItem"));
}

- (void)setHeaderItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("headerItem"), a3);
}

- (NSString)layoutStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("layoutStyle"));
}

- (void)setLayoutStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("layoutStyle"), a3);
}

- (NSNumber)minimumRowHeight
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("minimumRowHeight"));
}

- (void)setMinimumRowHeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("minimumRowHeight"), a3);
}

- (NSArray)rowStyleRules
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("rowStyleRules"), v3);
}

- (void)setRowStyleRules:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("rowStyleRules"), (uint64_t)a3);
}

- (BOOL)showHeaderDivider
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showHeaderDivider"));
}

- (void)setShowHeaderDivider:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showHeaderDivider"), a3);
}

@end
