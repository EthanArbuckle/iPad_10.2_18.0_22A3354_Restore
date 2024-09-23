@implementation UIApplicationExternalScreenSceneSpecification

- (id)initialSettingsDiffActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v10[0] = v2;
  v3 = (void *)objc_opt_new();
  v10[1] = v3;
  v4 = (void *)objc_opt_new();
  v10[2] = v4;
  v5 = (void *)objc_opt_new();
  v10[3] = v5;
  v6 = (void *)objc_opt_new();
  v10[4] = v6;
  v7 = (void *)objc_opt_new();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)uiSceneSessionRole
{
  return CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive");
}

@end
