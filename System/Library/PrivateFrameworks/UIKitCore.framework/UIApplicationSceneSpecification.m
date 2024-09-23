@implementation UIApplicationSceneSpecification

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

- (id)coreSceneComponentClassDictionary
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIKeyWindowSceneObserverComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIEventDeferringSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), 0x1E1735560);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), 0x1E1735540);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIFocusSystemSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIShareableContentSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));
  return v2;
}

- (id)connectionHandlers
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  v3 = _Block_copy(&__block_literal_global_80);
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)hostAgentClass
{
  return (Class)objc_opt_class();
}

- (Class)clientAgentClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return CFSTR("UIWindowSceneSessionRoleApplication");
}

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 0;
}

- (id)initialActionHandlers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *p_info;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[7];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  p_info = &OBJC_METACLASS____UIVisualEffectImageView.info;
  v9 = (void *)objc_opt_new();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v10;
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0
    || objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle"))
  {
    v15 = (void *)objc_opt_new();
    v18[0] = v15;
    v2 = (void *)objc_opt_new();
    v18[1] = v2;
    p_info = (void *)objc_opt_new();
    v18[2] = p_info;
    v3 = (void *)objc_opt_new();
    v18[3] = v3;
    v4 = (void *)objc_opt_new();
    v18[4] = v4;
    v5 = (void *)objc_opt_new();
    v18[5] = v5;
    v6 = (void *)objc_opt_new();
    v18[6] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)UIApplicationSceneSpecification;
  -[FBSSceneSpecification initialActionHandlers](&v17, sel_initialActionHandlers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {

  }
  return v13;
}

- (id)finalActionHandlers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v6[0] = v2;
  v3 = (void *)objc_opt_new();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initialSettingsDiffActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[11];

  v18[10] = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_opt_new();
  v18[0] = v16;
  v15 = (void *)objc_opt_new();
  v18[1] = v15;
  v14 = (void *)objc_opt_new();
  v18[2] = v14;
  v3 = (void *)objc_opt_new();
  v18[3] = v3;
  v4 = (void *)objc_opt_new();
  v18[4] = v4;
  v5 = (void *)objc_opt_new();
  v18[5] = v5;
  v6 = (void *)objc_opt_new();
  v18[6] = v6;
  v7 = (void *)objc_opt_new();
  v18[7] = v7;
  v8 = (void *)objc_opt_new();
  v18[8] = v8;
  v9 = (void *)objc_opt_new();
  v18[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)UIApplicationSceneSpecification;
  -[FBSSceneSpecification initialSettingsDiffActions](&v17, sel_initialSettingsDiffActions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)affectsScreenOrientation
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 0;
}

- (Class)sceneSubstrateClass
{
  return (Class)objc_opt_class();
}

- (Class)lifecycleMonitorClass
{
  return (Class)objc_opt_self();
}

- (id)baseSceneComponentClassDictionary
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_opt_class(), "_statusBarManagerClass"), _UIStatusBarManagerWindowSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UISystemAppearanceManagerWindowSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIBannerManagerWindowSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIAlertControllerStackManagerCanvasComponentKey);
  if (+[_UIDebugIdentifierLabelSceneComponent isEnabled](_UIDebugIdentifierLabelSceneComponent, "isEnabled"))
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), 0x1E1765A40);
  }
  if (_os_feature_enabled_impl())
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("_UIContentTextExtractionSceneComponentKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIRenderingEnvironmentSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIHDRUsageCoordinatorSceneComponentKey);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), _UIInterfaceProtectionSceneComponentKey);
  return v2;
}

- (id)defaultExtensions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)UIApplicationSceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v10, sel_defaultExtensions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

- (id)_transitionContextHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0
    || objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle"))
  {
    v3 = (void *)objc_opt_new();
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  v8.receiver = self;
  v8.super_class = (Class)UIApplicationSceneSpecification;
  -[FBSSceneSpecification _transitionContextHandlers](&v8, sel__transitionContextHandlers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)disconnectionHandlers
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  v3 = _Block_copy(&__block_literal_global_7_1);
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
