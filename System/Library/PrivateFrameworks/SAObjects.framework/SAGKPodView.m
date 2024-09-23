@implementation SAGKPodView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("PodView");
}

+ (id)podView
{
  return objc_alloc_init((Class)a1);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
