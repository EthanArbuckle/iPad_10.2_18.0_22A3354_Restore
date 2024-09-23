@implementation SAUIURLData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("URLData");
}

+ (id)uRLData
{
  return objc_alloc_init((Class)a1);
}

- (NSData)data
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("data"));
}

- (void)setData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("data"), a3);
}

- (NSURL)uri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("uri"));
}

- (void)setUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("uri"), a3);
}

@end
