@implementation SAUIErrorSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ErrorSnippet");
}

+ (id)errorSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)message
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("message"), a3);
}

@end
