@implementation SAAppsQuitApp

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("QuitApp");
}

+ (id)quitApp
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
}

- (NSString)sceneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sceneId"));
}

- (void)setSceneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sceneId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
