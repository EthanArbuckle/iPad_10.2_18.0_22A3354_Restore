@implementation SHSheetSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_self();
}

- (Class)settingsClass
{
  return (Class)objc_opt_self();
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return CFSTR("UISceneSessionRoleShareSheet");
}

@end
