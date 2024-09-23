@implementation SARefreshRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RefreshRequest");
}

+ (id)refreshRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSData)nlResultState
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nlResultState"));
}

- (void)setNlResultState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nlResultState"), a3);
}

- (NSData)serializedIntent
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serializedIntent"));
}

- (void)setSerializedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serializedIntent"), a3);
}

- (NSString)source
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("source"));
}

- (void)setSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("source"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
