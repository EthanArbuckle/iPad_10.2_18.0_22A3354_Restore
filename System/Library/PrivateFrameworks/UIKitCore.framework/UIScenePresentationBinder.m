@implementation UIScenePresentationBinder

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6;
  id v7;
  FBSSceneSettingsDiffInspector *v8;
  FBSSceneSettingsDiffInspector *settingsDiffInspector;
  FBSSceneSettingsDiffInspector *v10;
  uint64_t v11;
  FBSSceneSettingsDiffInspector *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (!self->_settingsDiffInspector)
  {
    objc_initWeak(&location, self);
    v8 = (FBSSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D23218]);
    settingsDiffInspector = self->_settingsDiffInspector;
    self->_settingsDiffInspector = v8;

    v10 = self->_settingsDiffInspector;
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke;
    v16[3] = &unk_1E16B81E0;
    objc_copyWeak(&v17, &location);
    -[FBSSceneSettingsDiffInspector observeLevelWithBlock:](v10, "observeLevelWithBlock:", v16);
    v12 = self->_settingsDiffInspector;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke_2;
    v14[3] = &unk_1E16B81E0;
    objc_copyWeak(&v15, &location);
    -[FBSSceneSettingsDiffInspector observeIsForegroundWithBlock:](v12, "observeIsForegroundWithBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v7, "settingsDiff");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "evaluateWithInspector:context:", self->_settingsDiffInspector, v6);

}

- (UIScenePresentationBinder)initWithIdentifier:(id)a3 priority:(int64_t)a4 rootView:(id)a5 appearanceStyle:(unint64_t)a6
{
  id v11;
  id v12;
  UIScenePresentationBinder *v13;
  UIScenePresentationBinder *v14;
  uint64_t v15;
  NSMutableSet *scenes;
  NSMutableDictionary *v17;
  NSMutableDictionary *mapSceneIDToPresenter;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UIScenePresentationBinder;
  v13 = -[UIScenePresentationBinder init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_priority = a4;
    objc_storeStrong((id *)&v14->_rootView, a5);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    scenes = v14->_scenes;
    v14->_scenes = (NSMutableSet *)v15;

    v14->_appearanceStyle = a6;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapSceneIDToPresenter = v14->_mapSceneIDToPresenter;
    v14->_mapSceneIDToPresenter = v17;

  }
  return v14;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 62, CFSTR("UIAutomaticScenePresenter must be invalidated before it can be deallocated."));

  }
  v5.receiver = self;
  v5.super_class = (Class)UIScenePresentationBinder;
  -[UIScenePresentationBinder dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v7;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 4;
    else
      v9 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v9;

  }
}

- (void)addScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *mapSceneIDToPresenter;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  UIScenePresentationBinder *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  if (!self->_invalidated && (-[NSMutableSet containsObject:](self->_scenes, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_scenes, "addObject:", v5);
    objc_msgSend(v5, "addObserver:", self);
    objc_msgSend(v5, "layerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);

    objc_msgSend(v5, "uiPresentationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createPresenterWithIdentifier:priority:", self->_identifier, self->_priority);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__UIScenePresentationBinder_addScene___block_invoke;
    v14[3] = &unk_1E16B8198;
    v14[4] = self;
    objc_msgSend(v8, "modifyPresentationContext:", v14);
    mapSceneIDToPresenter = self->_mapSceneIDToPresenter;
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](mapSceneIDToPresenter, "setObject:forKey:", v8, v10);

    UIScenePresentationBinderLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = self;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-added scene.", buf, 0x16u);

    }
    -[UIScenePresentationBinder _evaluateSceneForHosting:forReason:](self, "_evaluateSceneForHosting:forReason:", v5, CFSTR("client added scene"));

  }
}

void __38__UIScenePresentationBinder_addScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = a2;
  objc_msgSend(v3, "setAppearanceStyle:", v2);
  objc_msgSend(v3, "setPresentedLayerTypes:", 26);

}

- (void)removeScene:(id)a3
{
  id v5;
  int v6;
  void *v7;
  id v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    v5 = 0;
  }
  if (!self->_invalidated)
  {
    v8 = v5;
    v6 = -[NSMutableSet containsObject:](self->_scenes, "containsObject:", v5);
    v5 = v8;
    if (v6)
    {
      -[UIScenePresentationBinder _removeScene:forReason:](self, "_removeScene:forReason:", v8, CFSTR("client requested"));
      v5 = v8;
    }
  }

}

- (id)_rootView
{
  return self->_rootView;
}

- (BOOL)_delegateShouldPresentSceneOnlyWhenLayersExist
{
  UIScenePresentationBinder *v3;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
    return 0;
  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "scenePresentationBinderShouldPresentSceneOnlyWhenLayersExist:", v3);

  return (char)v3;
}

- (void)_delegateDidStartPresentingScene:(id)a3
{
  UIScenePresentationBinderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "scenePresentationBinder:didStartPresentingScene:", self, v5);

  }
}

- (void)_delegateDidStopPresentingScene:(id)a3
{
  UIScenePresentationBinderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "scenePresentationBinder:didStopPresentingScene:", self, v5);

  }
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  FBSSceneSettingsDiffInspector *settingsDiffInspector;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = (void *)-[NSMutableSet copy](self->_scenes, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[UIScenePresentationBinder removeScene:](self, "removeScene:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    settingsDiffInspector = self->_settingsDiffInspector;
    self->_settingsDiffInspector = 0;

    -[FBSSceneSettingsDiffInspector removeAllObservers](self->_settingsDiffInspector, "removeAllObservers");
    self->_invalidated = 1;
  }
}

- (NSString)description
{
  return (NSString *)-[UIScenePresentationBinder descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIScenePresentationBinder succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  UIScenePresentationBinder *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UIScenePresentationBinder_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E16B1B50;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

void __55__UIScenePresentationBinder_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("identifier"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("priority"));
  v3 = *(void **)(a1 + 32);
  NSStringFromUISceneAppearanceStyle(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("style"));

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScenePresentationBinder descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UIScenePresentationBinder *v11;

  v4 = a3;
  -[UIScenePresentationBinder succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__UIScenePresentationBinder_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __67__UIScenePresentationBinder_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("sceneIDsToPresenter"), 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v3, CFSTR("scenes"), 0);

}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSMutableSet *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  UIScenePresentationBinder *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UIScenePresentationBinderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIScenePresentationBinder _delegateShouldPresentSceneOnlyWhenLayersExist](self, "_delegateShouldPresentSceneOnlyWhenLayersExist");
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v23 = self;
    v24 = 2114;
    if (v7)
      v8 = CFSTR("YES");
    v25 = v6;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-started tracking layers: shouldPresentOnlyWhenLayersExist: %{public}@", buf, 0x20u);

  }
  if (-[UIScenePresentationBinder _delegateShouldPresentSceneOnlyWhenLayersExist](self, "_delegateShouldPresentSceneOnlyWhenLayersExist"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_scenes;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(v14, "layerManager", (_QWORD)v17);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
          break;
        if (v11 == ++v13)
        {
          v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            goto LABEL_8;
          goto LABEL_17;
        }
      }
      v16 = v14;

      if (!v16)
        goto LABEL_18;
      -[UIScenePresentationBinder _evaluateSceneForHosting:forReason:](self, "_evaluateSceneForHosting:forReason:", v16, CFSTR("layers exist"));
      v9 = v16;
    }
LABEL_17:

  }
LABEL_18:

}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSMutableSet *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  UIScenePresentationBinder *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UIScenePresentationBinderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIScenePresentationBinder _delegateShouldPresentSceneOnlyWhenLayersExist](self, "_delegateShouldPresentSceneOnlyWhenLayersExist");
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v23 = self;
    v24 = 2114;
    if (v7)
      v8 = CFSTR("YES");
    v25 = v6;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-stopped tracking layers: shouldPresentOnlyWhenLayersExist: %{public}@", buf, 0x20u);

  }
  if (-[UIScenePresentationBinder _delegateShouldPresentSceneOnlyWhenLayersExist](self, "_delegateShouldPresentSceneOnlyWhenLayersExist"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_scenes;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(v14, "layerManager", (_QWORD)v17);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
          break;
        if (v11 == ++v13)
        {
          v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            goto LABEL_8;
          goto LABEL_17;
        }
      }
      v16 = v14;

      if (!v16)
        goto LABEL_18;
      -[UIScenePresentationBinder _evaluateSceneForHosting:forReason:](self, "_evaluateSceneForHosting:forReason:", v16, CFSTR("no layers exist"));
      v9 = v16;
    }
LABEL_17:

  }
LABEL_18:

}

void __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_noteSceneChangedLevel:", a2);

}

void __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = a2;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isForeground");

  if (v5)
    objc_msgSend(WeakRetained, "_noteSceneMovedToForeground:", v3);
  else
    objc_msgSend(WeakRetained, "_noteSceneMovedToBackground:", v3);

}

- (void)_removeScene:(id)a3 forReason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  UIScenePresentationBinder *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  objc_msgSend(v7, "layerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  objc_msgSend(v7, "removeObserver:", self);
  -[NSMutableSet removeObject:](self->_scenes, "removeObject:", v7);
  UIScenePresentationBinderLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v18 = self;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-removed scene for reason: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_mapSceneIDToPresenter, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isActive"))
    -[UIScenePresentationBinder _deactivatePresenter:scene:reason:](self, "_deactivatePresenter:scene:reason:", v14, v7, v9);
  -[NSMutableDictionary removeObjectForKey:](self->_mapSceneIDToPresenter, "removeObjectForKey:", v13);
  objc_msgSend(v14, "invalidate");

}

- (void)_evaluateSceneForHosting:(id)a3 forReason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *mapSceneIDToPresenter;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  _BOOL4 v22;
  int v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  UIScenePresentationBinder *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _BYTE v35[10];
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  UIScenePresentationBinderLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v31 = self;
    v32 = 2114;
    v33 = v11;
    v34 = 2114;
    *(_QWORD *)v35 = v9;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-evaluate scene for hosting for reason: %{public}@", buf, 0x20u);

  }
  mapSceneIDToPresenter = self->_mapSceneIDToPresenter;
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapSceneIDToPresenter, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "isActive");
  objc_msgSend(v7, "layerManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  objc_msgSend(v7, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isForeground");

  v21 = -[UIScenePresentationBinder _delegateShouldPresentSceneOnlyWhenLayersExist](self, "_delegateShouldPresentSceneOnlyWhenLayersExist");
  if (v18)
    v22 = v21;
  else
    v22 = 0;
  v23 = !v21;
  if (v20 && v23 | v22)
  {
    if ((v15 & 1) != 0)
    {
      UIScenePresentationBinderLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v31 = self;
        v32 = 2114;
        v33 = v25;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-not presenting scene is already being presented.", buf, 0x16u);

      }
    }
    else
    {
      -[UIScenePresentationBinder _activatePresenter:scene:reason:](self, "_activatePresenter:scene:reason:", v14, v7, v9);
    }
  }
  else if (v15)
  {
    -[UIScenePresentationBinder _deactivatePresenter:scene:reason:](self, "_deactivatePresenter:scene:reason:", v14, v7, v9);
  }
  else
  {
    UIScenePresentationBinderLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v31 = self;
      v32 = 2114;
      v33 = v27;
      v34 = 1024;
      *(_DWORD *)v35 = v20;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v22;
      v36 = 1024;
      v37 = v23;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-not hosting because scene is not foreground or other conditions aren't met to allow hosting (foreground: %d, allowsHostingWithLayersAndHasLayers: %d, allowsHostingWithoutLayers: %d).", buf, 0x28u);

    }
  }

}

- (void)_activatePresenter:(id)a3 scene:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  UIScenePresentationBinder *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v11)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

  if (!v10)
    goto LABEL_10;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_4:
  UIScenePresentationBinderLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = self;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v11;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-started layer hosting for reason: %{public}@", buf, 0x20u);

  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 320, CFSTR("We expect a presenter."));

  }
  objc_msgSend(v9, "activate");
  -[UIScenePresentationBinder _noteWillStartPresentingScene:](self, "_noteWillStartPresentingScene:", v10);
  objc_msgSend(v9, "presentationView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScenePresentationBinder _positionPresentationViewInRootViewOrderedCorrectly:](self, "_positionPresentationViewInRootViewOrderedCorrectly:", v14);

  -[UIScenePresentationBinder _delegateDidStartPresentingScene:](self, "_delegateDidStartPresentingScene:", v10);
}

- (void)_deactivatePresenter:(id)a3 scene:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  UIScenePresentationBinder *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationBinder.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_4:
  UIScenePresentationBinderLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-stopped layer hosting for reason: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "presentationView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  objc_msgSend(v9, "deactivate");
  -[UIScenePresentationBinder _noteDidStopPresentingScene:](self, "_noteDidStopPresentingScene:", v10);
  -[UIScenePresentationBinder _delegateDidStopPresentingScene:](self, "_delegateDidStopPresentingScene:", v10);

}

- (void)_noteSceneMovedToForeground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  UIScenePresentationBinder *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UIScenePresentationBinderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-scene moved to foreground", (uint8_t *)&v7, 0x16u);

  }
  -[UIScenePresentationBinder _evaluateSceneForHosting:forReason:](self, "_evaluateSceneForHosting:forReason:", v4, CFSTR("scene moved foreground"));

}

- (void)_noteSceneMovedToBackground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  UIScenePresentationBinder *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UIScenePresentationBinderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-scene moved to background", (uint8_t *)&v7, 0x16u);

  }
  -[UIScenePresentationBinder _evaluateSceneForHosting:forReason:](self, "_evaluateSceneForHosting:forReason:", v4, CFSTR("scene moved background"));

}

- (void)_noteSceneChangedLevel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *mapSceneIDToPresenter;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  UIScenePresentationBinder *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UIScenePresentationBinderLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-scene level changed", (uint8_t *)&v11, 0x16u);

  }
  mapSceneIDToPresenter = self->_mapSceneIDToPresenter;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapSceneIDToPresenter, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isActive"))
  {
    objc_msgSend(v9, "presentationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScenePresentationBinder _positionPresentationViewInRootViewOrderedCorrectly:](self, "_positionPresentationViewInRootViewOrderedCorrectly:", v10);

  }
}

- (void)_positionPresentationViewInRootViewOrderedCorrectly:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v21;
  char v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "removeFromSuperview");
  -[UIScenePresentationBinder _rootView](self, "_rootView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v22 = 0;
    v21 = v6 - 1;
    v23 = v4;
    do
    {
      while (1)
      {
        objc_msgSend(v5, "objectAtIndex:", v8, v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "presenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "settings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "level");
        v14 = v13;
        objc_msgSend(v9, "presenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "settings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "level");
        v19 = v18;

        if (v14 <= v19)
          break;
        v4 = v23;
        objc_msgSend(v23, "insertSubview:aboveSubview:", v24, v9);

        v22 = 1;
        if (v21 == v8++)
          goto LABEL_12;
      }

      ++v8;
    }
    while (v7 != v8);
    v4 = v23;
    if ((v22 & 1) == 0)
    {
      objc_msgSend(v23, "addSubview:", v24);
      objc_msgSend(v23, "sendSubviewToBack:", v24);
    }
  }
  else
  {
    objc_msgSend(v4, "addSubview:", v24);
  }
LABEL_12:

}

- (NSSet)scenes
{
  return &self->_scenes->super;
}

- (UIScenePresentationBinderDelegate)delegate
{
  return (UIScenePresentationBinderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_mapSceneIDToPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
