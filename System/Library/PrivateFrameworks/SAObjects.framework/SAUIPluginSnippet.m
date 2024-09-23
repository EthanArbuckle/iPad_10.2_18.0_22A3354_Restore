@implementation SAUIPluginSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PluginSnippet");
}

- (NSString)bundleName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleName"));
}

- (void)setBundleName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleName"), a3);
}

- (NSData)modelData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("modelData"));
}

- (void)setModelData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("modelData"), a3);
}

- (NSString)responseViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseViewId"));
}

- (void)setResponseViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseViewId"), a3);
}

@end
