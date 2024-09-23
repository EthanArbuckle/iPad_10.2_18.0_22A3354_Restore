@implementation SBSUIStarkNotificationsSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (id)baseSettingsDiffActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)baseActionHandlers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 1;
}

@end
