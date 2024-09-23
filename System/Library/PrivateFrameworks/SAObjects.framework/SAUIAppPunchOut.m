@implementation SAUIAppPunchOut

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AppPunchOut");
}

+ (id)appPunchOut
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAddViews)alternativePunchOut
{
  return (SAUIAddViews *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("alternativePunchOut"));
}

- (void)setAlternativePunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("alternativePunchOut"), a3);
}

- (BOOL)appAvailableInStorefront
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("appAvailableInStorefront"));
}

- (void)setAppAvailableInStorefront:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("appAvailableInStorefront"), a3);
}

- (NSString)appDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appDisplayName"));
}

- (void)setAppDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appDisplayName"), a3);
}

- (SAUIImageResource)appIcon
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appIcon"));
}

- (void)setAppIcon:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appIcon"), a3);
}

- (NSDictionary)appIconMap
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("appIconMap"), v3);
}

- (void)setAppIconMap:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("appIconMap"), (uint64_t)a3);
}

- (BOOL)appInstalled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("appInstalled"));
}

- (void)setAppInstalled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("appInstalled"), a3);
}

- (NSURL)appStoreUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("appStoreUri"));
}

- (void)setAppStoreUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("appStoreUri"), a3);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (NSArray)launchOptions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("launchOptions"));
}

- (void)setLaunchOptions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("launchOptions"), a3);
}

- (BOOL)launchOverSiri
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("launchOverSiri"));
}

- (void)setLaunchOverSiri:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("launchOverSiri"), a3);
}

- (NSString)predefinedButtonType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("predefinedButtonType"));
}

- (void)setPredefinedButtonType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("predefinedButtonType"), a3);
}

- (NSString)providerId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerId"));
}

- (void)setProviderId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerId"), a3);
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

- (NSString)subtitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (NSArray)themeIcons
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("themeIcons"), v3);
}

- (void)setThemeIcons:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("themeIcons"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
