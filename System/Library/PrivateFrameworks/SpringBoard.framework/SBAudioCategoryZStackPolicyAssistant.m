@implementation SBAudioCategoryZStackPolicyAssistant

- (void)setForegroundScenes:(id *)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v8 = a2;
  if (a1 && (BSEqualArrays() & 1) == 0)
  {
    objc_msgSend(v8, "bs_differenceWithArray:", a1[2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[2], "bs_differenceWithArray:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__SBAudioCategoryZStackPolicyAssistant_setForegroundScenes___block_invoke;
    v10[3] = &unk_1E8EA5600;
    v10[4] = a1;
    objc_msgSend(v4, "bs_each:", v10);
    v6 = objc_msgSend(v8, "copy");
    v7 = a1[2];
    a1[2] = (id)v6;

    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __60__SBAudioCategoryZStackPolicyAssistant_setForegroundScenes___block_invoke_2;
    v9[3] = &unk_1E8EA5600;
    v9[4] = a1;
    objc_msgSend(v3, "bs_each:", v9);
    -[SBAudioCategoryZStackPolicyAssistant _resolveProposedPolicies](a1);

  }
}

uint64_t __60__SBAudioCategoryZStackPolicyAssistant_setForegroundScenes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:", *(_QWORD *)(a1 + 32));
}

- (void)_resolveProposedPolicies
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v1 = a1[2];
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v2)
    {
      v3 = v2;
      v4 = 0;
      v5 = *(_QWORD *)v18;
      do
      {
        v6 = 0;
        v7 = v4;
        do
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "clientSettings");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v8;
          if (v9)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v11 = v10;
            else
              v11 = 0;
          }
          else
          {
            v11 = 0;
          }
          v12 = v11;

          objc_msgSend(v12, "audioCategoriesDisablingVolumeHUD");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = 0;
          }
          SBFAudioCategoriesDisablingVolumeHUDUnion();
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          ++v6;
          v7 = v4;
        }
        while (v3 != v6);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v3);
    }
    else
    {
      v4 = 0;
    }

    if ((BSEqualSets() & 1) == 0)
    {
      objc_storeStrong(a1 + 3, v4);
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "audioCategoryZStackPolicyAssistantDidChange:", a1);

    }
  }
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
      v19 = __114__SBAudioCategoryZStackPolicyAssistant_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
      v20 = &unk_1E8EA2658;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v15, "observeAudioCategoriesDisablingVolumeHUDWithBlock:", &v17);
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
    v6.super_class = (Class)SBAudioCategoryZStackPolicyAssistant;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

uint64_t __60__SBAudioCategoryZStackPolicyAssistant_setForegroundScenes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:", *(_QWORD *)(a1 + 32));
}

void __114__SBAudioCategoryZStackPolicyAssistant_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAudioCategoryZStackPolicyAssistant _resolveProposedPolicies](WeakRetained);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
