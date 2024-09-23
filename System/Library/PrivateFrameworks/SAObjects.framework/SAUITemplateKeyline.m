@implementation SAUITemplateKeyline

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("Keyline");
}

+ (id)keyline
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)width
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("width"));
}

- (void)setWidth:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("width"), a3);
}

@end
