@implementation _UISceneHostingSheetPresentationHostComponent

- (id)currentPresentationController
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  objc_msgSend(WeakRetained, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = objc_opt_class();
        v14 = v12;
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v16 = v15;

        if (v16)
        {
          -[_UISceneHostingSheetPresentationHostComponent currentPresentationController](self, "currentPresentationController", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "executeActionForSheetPresentationController:", v17);

          objc_msgSend(v6, "addObject:", v16);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_msgSend(v6, "copy");
  return v18;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a6;
  if (objc_msgSend(a4, "containsProperty:", sel_sheetClientConfiguration))
  {
    objc_msgSend(v9, "clientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sheetClientConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UISceneHostingSheetPresentationHostComponent currentPresentationController](self, "currentPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __123___UISceneHostingSheetPresentationHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
      v21 = &unk_1E16B1B50;
      v22 = v13;
      v23 = v12;
      v15 = (void (**)(_QWORD))_Block_copy(&v18);
      -[FBSSceneComponent hostScene](self, "hostScene", v18, v19, v20, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_uiHostingController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        -[_UISceneHostingController performBlock:withClientTransitionContext:]((uint64_t)v17, v15, v10);
      else
        v15[2](v15);

    }
  }

}

- (void)_setSheetConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _UISceneHostingSheetPresentationHostComponent *v9;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72___UISceneHostingSheetPresentationHostComponent__setSheetConfiguration___block_invoke;
  v7[3] = &unk_1E16E1198;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "_performUpdateWithoutActivation:", v7);

}

- (_UISheetPresentationControllerConfiguration)_sheetConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sheetConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISheetPresentationControllerConfiguration *)v4;
}

- (void)_setViewClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", v3);

}

- (BOOL)_viewClipsToBounds
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clipsToBounds");

  return v4;
}

- (UIViewController)_targetViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_targetViewController);
}

- (void)_setTargetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_targetViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetViewController);
}

@end
