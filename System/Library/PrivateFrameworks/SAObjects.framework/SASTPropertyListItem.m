@implementation SASTPropertyListItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("PropertyListItem");
}

+ (id)propertyListItem
{
  return objc_alloc_init((Class)a1);
}

- (NSString)alignment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alignment"));
}

- (void)setAlignment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alignment"), a3);
}

- (SAUIDecoratedText)decoratedTitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedTitle"));
}

- (void)setDecoratedTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedTitle"), a3);
}

- (NSArray)decoratedValues
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("decoratedValues"), v3);
}

- (void)setDecoratedValues:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("decoratedValues"), (uint64_t)a3);
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSArray)values
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("values"));
}

- (void)setValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("values"), a3);
}

@end
