@implementation SADomainCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DomainCommand");
}

+ (id)domainCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)targetAppId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("targetAppId"));
}

- (void)setTargetAppId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("targetAppId"), a3);
}

- (NSURL)targetPluginId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("targetPluginId"));
}

- (void)setTargetPluginId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("targetPluginId"), a3);
}

- (NSNumber)timeout
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeout"));
}

- (void)setTimeout:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeout"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
