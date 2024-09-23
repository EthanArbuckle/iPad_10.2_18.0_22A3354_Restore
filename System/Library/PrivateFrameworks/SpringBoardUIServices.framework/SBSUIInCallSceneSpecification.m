@implementation SBSUIInCallSceneSpecification

- (id)defaultExtensions
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getAMUIAmbientPresentationSceneExtensionClass_softClass_0;
  v9 = getAMUIAmbientPresentationSceneExtensionClass_softClass_0;
  if (!getAMUIAmbientPresentationSceneExtensionClass_softClass_0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_0;
    v5[3] = &unk_1E4C3E458;
    v5[4] = &v6;
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

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
  SBSUIInCallWindowSceneBSActionsHandler *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBSUIInCallSceneSpecification;
  -[UIApplicationSceneSpecification initialActionHandlers](&v7, sel_initialActionHandlers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBSUIInCallWindowSceneBSActionsHandler);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialSettingsDiffActions
{
  void *v2;
  SBSUIInCallWindowSceneSettingsDiffAction *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBSUIInCallSceneSpecification;
  -[UIApplicationSceneSpecification initialSettingsDiffActions](&v7, sel_initialSettingsDiffActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(SBSUIInCallWindowSceneSettingsDiffAction);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)uiSceneSessionRole
{
  return CFSTR("SBSUIWindowSceneSessionRoleInCall");
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

@end
