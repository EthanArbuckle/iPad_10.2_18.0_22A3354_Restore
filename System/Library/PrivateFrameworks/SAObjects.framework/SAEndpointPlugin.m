@implementation SAEndpointPlugin

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("EndpointPlugin");
}

+ (id)endpointPlugin
{
  return objc_alloc_init((Class)a1);
}

- (NSString)pluginPath
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pluginPath"));
}

- (void)setPluginPath:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pluginPath"), a3);
}

@end
