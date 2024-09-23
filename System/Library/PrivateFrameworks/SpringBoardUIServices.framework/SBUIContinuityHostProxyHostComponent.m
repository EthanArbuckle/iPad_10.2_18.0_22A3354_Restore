@implementation SBUIContinuityHostProxyHostComponent

- (void)configureInitialSettings:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[FBSSceneComponent scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hostProxyUserInterfaceStyle");

  if (v6)
  {
    if (objc_msgSend(v15, "userInterfaceStyle") != v6)
      objc_msgSend(v15, "setUserInterfaceStyle:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEABA0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserInterfaceStyle:", objc_msgSend(v7, "currentStyle"));

  }
  objc_msgSend(v15, "setTargetOfEventDeferringEnvironments:", 0);
  objc_msgSend(v15, "setInterfaceOrientationMode:", 100);
  objc_msgSend(v15, "setInterfaceOrientation:", 1);
  objc_msgSend(v15, "setEnhancedWindowingEnabled:", 1);
  _SBUIApplyDisplayEdgeInfo(v15);
  objc_msgSend(v15, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneComponent hostScene](self, "hostScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_keyboardHostComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hardwareIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHardwareKeyboardExclusivityIdentifier:", v11);

  -[FBSSceneComponent hostScene](self, "hostScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemShellHostingEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSystemShellHostingSpaceIdentifier:", v14);

}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "previousSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    objc_msgSend(v14, "_keyboardHostComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHardwareKeyboardExclusivityIdentifier:", v11);

    objc_msgSend(v14, "systemShellHostingEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSystemShellHostingSpaceIdentifier:", v13);

  }
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  id *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];
  char v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char v27;

  v17 = a3;
  v5 = a4;
  if (v17)
  {
    objc_msgSend(v17, "uiSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v17, "clientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hostProxyUserInterfaceStyle");

    objc_msgSend(v17, "clientSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hostProxyIsCapturingContentForAdditionalRenderingDestination");

    objc_msgSend(v17, "clientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hostProxySceneRenderingEnvironmentIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "isActive"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke;
      v22[3] = &unk_1E4C40188;
      v26 = v8;
      v27 = v10;
      v13 = &v23;
      v14 = v17;
      v23 = v14;
      v15 = &v24;
      v24 = v12;
      v25 = v5;
      objc_msgSend(v14, "performUpdate:", v22);

    }
    else
    {
      if (objc_msgSend(v6, "userInterfaceStyle") == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke_2;
      v18[3] = &unk_1E4C401B0;
      v20[1] = v8;
      v21 = v10;
      v13 = &v19;
      v16 = v17;
      v19 = v16;
      v15 = (id *)v20;
      v20[0] = v12;
      objc_msgSend(v16, "updateSettings:", v18);
    }

    goto LABEL_8;
  }
LABEL_10:

}

void __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = a2;
  objc_msgSend(v6, "setUserInterfaceStyle:", v5);
  objc_msgSend(v6, "setIsCapturingContentForAdditionalRenderingDestination:", *(unsigned __int8 *)(a1 + 64));

  objc_msgSend(*(id *)(a1 + 32), "renderingEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSystemDisplayIdentifier:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "transitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v11, "setAnimationSettings:", v9);
  objc_msgSend(v8, "animationFence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v11, "setAnimationFence:", v10);

}

void __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setUserInterfaceStyle:", v3);
  objc_msgSend(v4, "setIsCapturingContentForAdditionalRenderingDestination:", *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "renderingEnvironment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemDisplayIdentifier:", *(_QWORD *)(a1 + 40));

}

@end
