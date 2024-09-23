@implementation SASettingShowPassword

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("ShowPassword");
}

+ (id)showPassword
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

- (NSString)appOrWebsiteName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appOrWebsiteName"));
}

- (void)setAppOrWebsiteName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appOrWebsiteName"), a3);
}

- (NSNumber)shouldPromptForAuthentication
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("shouldPromptForAuthentication"));
}

- (void)setShouldPromptForAuthentication:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("shouldPromptForAuthentication"), a3);
}

- (NSString)spokenAppOrWebsiteName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spokenAppOrWebsiteName"));
}

- (void)setSpokenAppOrWebsiteName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spokenAppOrWebsiteName"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
