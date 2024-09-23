@implementation SAUITemplateTabularDataColumn

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularDataColumn");
}

+ (id)tabularDataColumn
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)minimumWidth
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("minimumWidth"));
}

- (void)setMinimumWidth:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("minimumWidth"), a3);
}

- (NSNumber)rightMargin
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rightMargin"));
}

- (void)setRightMargin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rightMargin"), a3);
}

- (NSArray)values
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("values"), v3);
}

- (void)setValues:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("values"), (uint64_t)a3);
}

@end
