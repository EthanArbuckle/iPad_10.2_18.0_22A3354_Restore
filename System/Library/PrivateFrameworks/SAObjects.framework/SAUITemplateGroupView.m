@implementation SAUITemplateGroupView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("GroupView");
}

+ (id)groupView
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

- (NSString)layoutStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("layoutStyle"));
}

- (void)setLayoutStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("layoutStyle"), a3);
}

@end
