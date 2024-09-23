@implementation SBPhysicalButtonZStackPolicyAssistant

- (void)setForegroundScenes:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v8 = a2;
  if (a1 && (BSEqualArrays() & 1) == 0)
  {
    objc_msgSend(v8, "bs_differenceWithArray:", *(_QWORD *)(a1 + 16));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "bs_differenceWithArray:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__SBPhysicalButtonZStackPolicyAssistant_setForegroundScenes___block_invoke;
    v10[3] = &unk_1E8EA5600;
    v10[4] = a1;
    objc_msgSend(v4, "bs_each:", v10);
    v6 = objc_msgSend(v8, "copy");
    v7 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v6;

    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __61__SBPhysicalButtonZStackPolicyAssistant_setForegroundScenes___block_invoke_2;
    v9[3] = &unk_1E8EA5600;
    v9[4] = a1;
    objc_msgSend(v3, "bs_each:", v9);
    -[SBPhysicalButtonZStackPolicyAssistant _resolveProposedPolicies](a1);

  }
}

- (void)_resolveProposedPolicies
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBCaptureIntentSceneTarget *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  void *v27;
  id *v28;
  id WeakRetained;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(a1 + 16), "reverseObjectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v1 = 0;
    v2 = 0;
    if (v33)
    {
      v34 = 0;
      v35 = 0;
      v32 = *(_QWORD *)v40;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v3);
          objc_msgSend(v4, "clientSettings");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v5;
          if (v6)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v8 = v7;
            else
              v8 = 0;
          }
          else
          {
            v8 = 0;
          }
          v9 = v8;

          objc_msgSend(v9, "physicalButtonConfigurations");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "_count"))
          {
            objc_msgSend(MEMORY[0x1E0DA9EA8], "targetWithScene:", v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __65__SBPhysicalButtonZStackPolicyAssistant__resolveProposedPolicies__block_invoke;
            v37[3] = &unk_1E8EA5628;
            v12 = v11;
            v38 = v12;
            objc_msgSend(v10, "_enumerateConfigurationsWithBlock:", v37);
            v13 = v34;
            if (!v34)
              v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v34 = v13;
            objc_msgSend(v13, "addObject:", v12);

          }
          if (!v2)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBPhysicalButtonZStackPolicyAssistant _sceneHasFullFidelityEventsEntitlement:](a1, v4));
            v2 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v36 = v9;
          if (objc_msgSend(v2, "BOOLValue"))
          {
            v14 = v35;
            if (!v35)
              v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v35 = v14;
            objc_msgSend(v10, "_configurationForButton:", 5);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v35, "addObject:", v4);
            v16 = v1;

          }
          else
          {
            v16 = v1;
          }
          +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "clientHandle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "processHandle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bundle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "captureApplicationForBundleIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22
            || (objc_msgSend(v17, "captureApplicationForExtensionIdentifier:", v21),
                (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v1 = v16;
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v1 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v23 = -[SBCaptureIntentSceneTarget initWithScene:andCaptureApplication:]([SBCaptureIntentSceneTarget alloc], "initWithScene:andCaptureApplication:", v4, v22);
            objc_msgSend(v1, "addObject:", v23);

          }
          else
          {
            v1 = v16;
          }

          ++v3;
        }
        while (v33 != v3);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        v33 = v24;
      }
      while (v24);
    }
    else
    {
      v34 = 0;
      v35 = 0;
    }

    v25 = BSEqualArrays();
    if ((v25 & 1) == 0)
    {
      v26 = objc_msgSend(v34, "copy");
      v27 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v26;

    }
    if (BSEqualArrays())
    {
      v28 = (id *)(a1 + 40);
      if ((BSEqualArrays() & 1) != 0)
      {
        if ((v25 & 1) != 0)
          goto LABEL_45;
        goto LABEL_44;
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 32), v35);
      v28 = (id *)(a1 + 40);
      if ((BSEqualArrays() & 1) != 0)
      {
LABEL_44:
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(WeakRetained, "physicalButtonZStackPolicyAssistantDidChange:", a1);

LABEL_45:
        return;
      }
    }
    objc_storeStrong(v28, v1);
    goto LABEL_44;
  }
}

uint64_t __61__SBPhysicalButtonZStackPolicyAssistant_setForegroundScenes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:", *(_QWORD *)(a1 + 32));
}

void __65__SBPhysicalButtonZStackPolicyAssistant__resolveProposedPolicies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DA9EB8];
  v4 = a2;
  v5 = objc_msgSend(v4, "_button");
  v6 = objc_msgSend(v4, "_generation");
  objc_msgSend(v4, "_auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "targetWithPhysicalButton:generation:auditToken:", v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addButtonTarget:", v8);
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FBSSceneClientSettingsDiffInspector *sceneClientSettingsDiffInspector;
  id v15;
  FBSSceneClientSettingsDiffInspector *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[NSArray containsObject:](self->_foregroundScenes, "containsObject:", v10))
  {
    sceneClientSettingsDiffInspector = self->_sceneClientSettingsDiffInspector;
    if (!sceneClientSettingsDiffInspector)
    {
      objc_initWeak(&location, self);
      v15 = objc_alloc_init(MEMORY[0x1E0CEA328]);
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __115__SBPhysicalButtonZStackPolicyAssistant_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
      v20 = &unk_1E8EA2658;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v15, "observePhysicalButtonConfigurationsWithBlock:", &v17);
      v16 = self->_sceneClientSettingsDiffInspector;
      self->_sceneClientSettingsDiffInspector = (FBSSceneClientSettingsDiffInspector *)v15;

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      sceneClientSettingsDiffInspector = self->_sceneClientSettingsDiffInspector;
    }
    objc_msgSend(v11, "evaluateWithInspector:context:", sceneClientSettingsDiffInspector, 0, v17, v18, v19, v20);
  }

}

- (id)initWithDelegate:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SBPhysicalButtonZStackPolicyAssistant;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

uint64_t __61__SBPhysicalButtonZStackPolicyAssistant_setForegroundScenes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:", *(_QWORD *)(a1 + 32));
}

void __115__SBPhysicalButtonZStackPolicyAssistant_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBPhysicalButtonZStackPolicyAssistant _resolveProposedPolicies]((uint64_t)WeakRetained);

}

- (BOOL)_sceneHasFullFidelityEventsEntitlement:(uint64_t)a1
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!a1)
    return 0;
  objc_msgSend(a2, "clientHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  if (v3)
  {
    objc_msgSend(v3, "auditToken", 0, 0, 0, 0);
    if ((BSAuditTokenTaskHasEntitlement() & 1) != 0 || BSAuditTokenTaskHasEntitlement())
      v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
