@implementation SAUITemplateFont

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("Font");
}

+ (id)font
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)size
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("size"));
}

- (void)setSize:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("size"), a3);
}

- (NSString)textStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("textStyle"));
}

- (void)setTextStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("textStyle"), a3);
}

@end
