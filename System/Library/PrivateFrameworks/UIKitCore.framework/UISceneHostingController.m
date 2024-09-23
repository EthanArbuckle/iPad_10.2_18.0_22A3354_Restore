@implementation UISceneHostingController

uint64_t __39___UISceneHostingController_initialize__block_invoke()
{
  objc_opt_class();
  return _class_setCustomDeallocInitiation();
}

void __58___UISceneHostingController_createSceneWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "sceneSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpecification:", v6);

  v7 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(*(id *)(a1 + 32), "processIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityForProcessIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentity:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58___UISceneHostingController_createSceneWithConfiguration___block_invoke_2;
  v10[3] = &unk_1E16D83F8;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "configureParameters:", v10);

}

void __58___UISceneHostingController_createSceneWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "initialSettingsUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "initialSettingsUpdater");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v4);

    objc_msgSend(v9, "applySettings:", v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "initialClientSettingsUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "initialClientSettingsUpdater");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v7);

    objc_msgSend(v9, "applyClientSettings:", v7);
  }

}

void __58___UISceneHostingController_createSceneWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addPropagatedProperty:", sel_isForeground);
  objc_msgSend(v2, "addPropagatedProperty:", sel_deactivationReasons);
  objc_msgSend(v2, "addPropagatedProperty:", sel_displayConfiguration);
  objc_msgSend(v2, "addPropagatedProperty:", sel_enhancedWindowingEnabled);
  objc_msgSend(v2, "addPropagatedProperty:", sel_hostReferenceAngleMode);
  objc_msgSend(v2, "addPropagatedProperty:", sel_angleFromHostReferenceUprightDirection);
  objc_msgSend(v2, "addPropagatedProperty:", sel_screenReferenceDisplayModeStatus);
  objc_msgSend(v2, "addPropagatedProperty:", sel_userInterfaceStyle);

}

void __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "animationFence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(*(id *)(a1 + 32), "animationFence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_synchronizeDrawingWithFence:", v4);

  }
  v5 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(*(id *)(a1 + 32), "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke_2;
  v7[3] = &unk_1E16B1BA0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "tryAnimatingWithSettings:actions:completion:", v6, v7, 0);

}

uint64_t __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80___UISceneHostingController__updateSceneSettingsFromSettingsProvidersWithFence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_applyOverridesToHostedSceneSettings:", v5, (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (*(_BYTE *)(a1 + 40))
  {
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAnimationSettings:", v12);

    }
    else
    {
      objc_msgSend(v6, "setAnimationSettings:", 0);
    }
    +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence", (_QWORD)v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationFence:", v13);

  }
}

void __38___UISceneHostingController_activate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_1[0];
    if (!_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_1[0])
    {
      v7 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, _UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_1);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = v10;
      objc_msgSend(v6, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v10;
      v21 = 2048;
      v22 = v11;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "<%@: %p> Encountered an error while building user activity for scene: %@", buf, 0x20u);

    }
  }
  if (v5)
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActions:", v15);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __38___UISceneHostingController_activate___block_invoke_61;
  v17[3] = &unk_1E16B1B50;
  v16 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

uint64_t __38___UISceneHostingController_activate___block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "activateWithTransitionContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __54___UISceneHostingController_sceneWillEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
