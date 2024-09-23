@implementation SAUILocalImageResource

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("LocalImageResource");
}

+ (id)localImageResource
{
  return objc_alloc_init((Class)a1);
}

- (NSString)imageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageCode"));
}

- (void)setImageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageCode"), a3);
}

@end
