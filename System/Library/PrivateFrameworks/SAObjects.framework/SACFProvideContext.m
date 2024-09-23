@implementation SACFProvideContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("ProvideContext");
}

+ (id)provideContext
{
  return objc_alloc_init((Class)a1);
}

- (NSString)context
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("context"));
}

- (void)setContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("context"), a3);
}

- (NSString)contextVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contextVersion"));
}

- (void)setContextVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contextVersion"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
