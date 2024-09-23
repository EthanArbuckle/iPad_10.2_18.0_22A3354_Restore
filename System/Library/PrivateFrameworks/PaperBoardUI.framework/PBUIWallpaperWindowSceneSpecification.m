@implementation PBUIWallpaperWindowSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_self();
}

- (Class)settingsClass
{
  return (Class)objc_opt_self();
}

- (id)initialActionHandlers
{
  void *v2;
  PBUIWallpaperWindowSceneBSActionHandler *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperWindowSceneSpecification;
  -[UIApplicationSceneSpecification initialActionHandlers](&v6, sel_initialActionHandlers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PBUIWallpaperWindowSceneBSActionHandler);
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initialSettingsDiffActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PBUIWallpaperWindowSceneSpecification;
  -[UIApplicationSceneSpecification initialSettingsDiffActions](&v8, sel_initialSettingsDiffActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v9[0] = v3;
  v4 = (void *)objc_opt_new();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)uiSceneSessionRole
{
  return CFSTR("PBUIWallpaperSceneSessionRoleWallpaper");
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

@end
