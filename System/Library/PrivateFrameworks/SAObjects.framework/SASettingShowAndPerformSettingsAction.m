@implementation SASettingShowAndPerformSettingsAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("ShowAndPerformSettingsAction");
}

+ (id)showAndPerformSettingsAction
{
  return objc_alloc_init((Class)a1);
}

- (SASettingSettingsAction)settingsAction
{
  return (SASettingSettingsAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("settingsAction"));
}

- (void)setSettingsAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("settingsAction"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
