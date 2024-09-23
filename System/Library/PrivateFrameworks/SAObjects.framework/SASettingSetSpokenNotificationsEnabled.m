@implementation SASettingSetSpokenNotificationsEnabled

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetSpokenNotificationsEnabled");
}

+ (id)setSpokenNotificationsEnabled
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

- (NSDate)timeToReEnable
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeToReEnable"));
}

- (void)setTimeToReEnable:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeToReEnable"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
