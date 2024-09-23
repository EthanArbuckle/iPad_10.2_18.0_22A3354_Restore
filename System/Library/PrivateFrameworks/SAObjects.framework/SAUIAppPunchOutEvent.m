@implementation SAUIAppPunchOutEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AppPunchOutEvent");
}

+ (id)appPunchOutEvent
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appDisplayName"));
}

- (void)setAppDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appDisplayName"), a3);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (NSString)originalCommandId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalCommandId"));
}

- (void)setOriginalCommandId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalCommandId"), a3);
}

- (NSString)punchOutName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("punchOutName"));
}

- (void)setPunchOutName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("punchOutName"), a3);
}

- (NSURL)punchOutUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("punchOutUri"));
}

- (void)setPunchOutUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("punchOutUri"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
