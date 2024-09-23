@implementation UIApplicationStarkSceneSpecification

- (id)initialSettingsDiffActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v11[0] = v2;
  v3 = (void *)objc_opt_new();
  v11[1] = v3;
  v4 = (void *)objc_opt_new();
  v11[2] = v4;
  v5 = (void *)objc_opt_new();
  v11[3] = v5;
  v6 = (void *)objc_opt_new();
  v11[4] = v6;
  v7 = (void *)objc_opt_new();
  v11[5] = v7;
  v8 = (void *)objc_opt_new();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)finalActionHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)UIApplicationStarkSceneSpecification;
  -[UIApplicationSceneSpecification finalActionHandlers](&v8, sel_finalActionHandlers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)connectionHandlers
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  v3 = _Block_copy(&__block_literal_global_16);
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)disconnectionHandlers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)baseSceneComponentClassDictionary
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = _UICarPlaySceneComponentKey;
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)uiSceneSessionRole
{
  return CFSTR("UIWindowSceneSessionRoleCarPlay");
}

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

@end
