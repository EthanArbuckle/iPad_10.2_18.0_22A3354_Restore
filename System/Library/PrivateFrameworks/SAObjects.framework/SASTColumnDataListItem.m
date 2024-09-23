@implementation SASTColumnDataListItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("ColumnDataListItem");
}

+ (id)columnDataListItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("action"), a3);
}

- (NSArray)decoratedRows
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("decoratedRows"), v3);
}

- (void)setDecoratedRows:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("decoratedRows"), (uint64_t)a3);
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

- (NSString)rowLayout
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rowLayout"));
}

- (void)setRowLayout:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rowLayout"), a3);
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
