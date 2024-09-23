@implementation SAEndpointService

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("EndpointService");
}

+ (id)endpointService
{
  return objc_alloc_init((Class)a1);
}

- (NSString)serverUrl
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serverUrl"));
}

- (void)setServerUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serverUrl"), a3);
}

@end
