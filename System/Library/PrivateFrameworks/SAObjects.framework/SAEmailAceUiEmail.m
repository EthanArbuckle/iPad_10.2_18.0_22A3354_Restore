@implementation SAEmailAceUiEmail

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.email");
}

- (id)encodedClassName
{
  return CFSTR("AceUiEmail");
}

+ (id)aceUiEmail
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)read
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("read"));
}

- (void)setRead:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("read"), a3);
}

@end
