@implementation SBSUIRemoteAlertSceneSpecification

- (id)defaultExtensions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)initialSettingsDiffActions
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSUIRemoteAlertSceneSpecification;
  -[UIApplicationSceneSpecification initialSettingsDiffActions](&v6, sel_initialSettingsDiffActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBSUIWindowSceneSessionRoleRemoteAlert");
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

@end
