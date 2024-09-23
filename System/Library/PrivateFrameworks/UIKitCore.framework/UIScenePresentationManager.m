@implementation UIScenePresentationManager

- (void)owner:(id)a3 willPrioritizePresenter:(id)a4 deactivatePresenter:(id)a5
{
  _UIScenePresenterOwner *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (_UIScenePresenterOwner *)a3;
  v8 = a4;
  if (self->_scenePresenterOwner == v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = self->_prioritizedPresenterObservers;
    v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "_presentationManager:willPrioritizePresenter:", self, v8);
        }
        v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }
  }
  else
  {
    -[UIScenePresentationContext _layerTargetsToExclude](self->_defaultScenePresentationContext, "_layerTargetsToExclude");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_UIScenePresenterOwner context](v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v10, "addObject:", v11);
    else
      objc_msgSend(v10, "removeObject:", v11);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__UIScenePresentationManager_owner_willPrioritizePresenter_deactivatePresenter___block_invoke;
    v17[3] = &unk_1E16B8198;
    v18 = v10;
    v12 = v10;
    -[UIScenePresentationManager modifyDefaultPresentationContext:](self, "modifyDefaultPresentationContext:", v17);

  }
}

- (void)modifyDefaultPresentationContext:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  UIScenePresentationContext *v10;
  UIScenePresentationContext *v11;
  uint64_t v12;
  void *v13;
  _UIScenePresenterOwner *scenePresenterOwner;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  UIScenePresentationContext *defaultScenePresentationContext;
  void *v26;
  void *v27;
  void *v28;
  SEL v29;
  id v30;
  void *v31;
  void (**v32)(id, void *);
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[5];
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  UIScenePresentationContext *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifyBlock"));

  }
  if (-[UIScenePresentationManager isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 114, CFSTR("Cannot modify the default presentation context if the presentation manager is already invalidated"));

  }
  v6 = (void *)-[UIScenePresentationContext mutableCopy](self->_defaultScenePresentationContext, "mutableCopy");
  v5[2](v5, v6);
  UIScenePresentationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    UIScenePresentationLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      objc_msgSend(WeakRetained, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BSEqualObjects());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      defaultScenePresentationContext = self->_defaultScenePresentationContext;
      *(_DWORD *)buf = 138413058;
      v44 = v23;
      v45 = 2112;
      v46 = v24;
      v47 = 2112;
      v48 = defaultScenePresentationContext;
      v49 = 2112;
      v50 = v6;
      _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "Modify default presentation context on %@ (equal? %@), prevContext: %@, newContext: %@", buf, 0x2Au);

    }
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    v29 = a2;
    v31 = v6;
    v32 = v5;
    v10 = (UIScenePresentationContext *)objc_msgSend(v6, "copy");
    v11 = self->_defaultScenePresentationContext;
    self->_defaultScenePresentationContext = v10;

    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke;
    aBlock[3] = &unk_1E16C8020;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    scenePresenterOwner = self->_scenePresenterOwner;
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_3;
    v39[3] = &unk_1E16C8048;
    v30 = v13;
    v40 = v30;
    -[_UIScenePresenterOwner enumeratePresentersUsingBlock:](scenePresenterOwner, "enumeratePresentersUsingBlock:", v39);
    v15 = (void *)-[UIScenePresentationContext mutableCopy](self->_defaultScenePresentationContext, "mutableCopy");
    objc_msgSend(v15, "_setLayerTargetsToExclude:", 0);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSMapTable objectEnumerator](self->_mapLayersToPresenterOwners, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v33[0] = v12;
          v33[1] = 3221225472;
          v33[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_4;
          v33[3] = &unk_1E16C7CE8;
          v34 = v15;
          objc_msgSend(v21, "enumeratePresentersUsingBlock:", v33);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v18);
    }

    if (-[UIScenePresentationContext _isVisibilityPropagationEnabled](self->_defaultScenePresentationContext, "_isVisibilityPropagationEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("UIScenePresentationManager.m"), 149, CFSTR("Toggling visibility propagation on the default scene presentation context is not supported."));

    }
    v6 = v31;
    v5 = v32;
  }

}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)sceneContentStateDidChange:(id)a3
{
  id WeakRetained;
  BOOL v5;
  _UIScenePresenterOwner *scenePresenterOwner;
  _QWORD v7[4];
  BOOL v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v5 = objc_msgSend(WeakRetained, "contentState") != 0;

  scenePresenterOwner = self->_scenePresenterOwner;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke;
  v7[3] = &__block_descriptor_33_e31_v24__0___UIScenePresenter_8_B16l;
  v8 = v5;
  -[_UIScenePresenterOwner enumeratePresentersUsingBlock:](scenePresenterOwner, "enumeratePresentersUsingBlock:", v7);
}

uint64_t __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setVisibilityPropagationEnabled:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setDefaultPresentationContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t __69__UIScenePresentationManager_createPresenterWithIdentifier_priority___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setVisibilityPropagationEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (id)_initWithScene:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;

  v4 = a3;
  +[_UISceneKeyboardProxyLayerForwardingManager sharedInstance](_UISceneKeyboardProxyLayerForwardingManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UISceneKeyboardProxyLayerForwardingPresentationScene initWithScene:]([_UISceneKeyboardProxyLayerForwardingPresentationScene alloc], v4);
  v7 = -[UIScenePresentationManager _initWithScene:keyboardProxyLayerManager:keyboardProxyPresentationEnvironment:](self, "_initWithScene:keyboardProxyLayerManager:keyboardProxyPresentationEnvironment:", v4, v5, v6);

  return v7;
}

- (int64_t)_defaultPresentationPriority
{
  id WeakRetained;
  int64_t v4;

  if (!self->_delegateFlags.defaultPriorityBand)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "scenePresentationManagerDefaultPriorityBand:", self);

  return v4;
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_2;
  v3[3] = &unk_1E16B8198;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "modifyPresentationContext:", v3);
}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (id)createPresenterWithIdentifier:(id)a3 priority:(int64_t)a4
{
  id v7;
  _UIScenePresenter *v8;
  _UIScenePresenterOwner *scenePresenterOwner;
  uint64_t v10;
  _UIScenePresenter *v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  BOOL v20;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (-[UIScenePresentationManager isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 163, CFSTR("Cannot create a presenter on a presentation manager that's been invalidated."));

  }
  if (-[UIScenePresentationManager _hasPresenterWithIdentifier:](self, "_hasPresenterWithIdentifier:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 164, CFSTR("Cannot create a presenter with this identifier as it's already in use."));

  }
  v8 = [_UIScenePresenter alloc];
  scenePresenterOwner = self->_scenePresenterOwner;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[_UIScenePresenter initWithOwner:identifier:sortContext:](v8, "initWithOwner:identifier:sortContext:", scenePresenterOwner, v7, v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v13 = objc_msgSend(WeakRetained, "contentState");

  -[_UIScenePresenter presentationContext](v11, "presentationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_isVisibilityPropagationEnabled");
  LOBYTE(v10) = BSEqualBools();

  if ((v10 & 1) == 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__UIScenePresentationManager_createPresenterWithIdentifier_priority___block_invoke;
    v19[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    v20 = v13 != 0;
    -[_UIScenePresenter modifyPresentationContext:](v11, "modifyPresentationContext:", v19);
  }
  -[_UIScenePresenterOwner addPresenter:](self->_scenePresenterOwner, "addPresenter:", v11);

  return v11;
}

void __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;
  _QWORD v6[4];
  char v7;

  v5 = a2;
  objc_msgSend(v5, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_isVisibilityPropagationEnabled");
  v4 = BSEqualBools();

  if ((v4 & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke_2;
    v6[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    v7 = *(_BYTE *)(a1 + 32);
    objc_msgSend(v5, "modifyPresentationContext:", v6);
  }

}

- (BOOL)_hasPresenterWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIScenePresenterOwner presenterWithIdentifier:](self->_scenePresenterOwner, "presenterWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMapTable objectEnumerator](self->_mapLayersToPresenterOwners, "objectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "presenterWithIdentifier:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (id)_initWithScene:(id)a3 keyboardProxyLayerManager:(id)a4 keyboardProxyPresentationEnvironment:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIScenePresentationManager *v12;
  UIScenePresentationManager *v13;
  id v14;
  void *v15;
  _UIScenePresenterOwner *v16;
  id WeakRetained;
  uint64_t v18;
  _UIScenePresenterOwner *scenePresenterOwner;
  UIScenePresentationContext *v20;
  UIScenePresentationContext *defaultScenePresentationContext;
  uint64_t v22;
  NSMapTable *mapLayersToPresenterOwners;
  void *v25;
  void *v26;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  if ((objc_msgSend(v9, "isValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 70, CFSTR("Must have a valid scene to create a presentation manager for a scene."));

  }
  v27.receiver = self;
  v27.super_class = (Class)UIScenePresentationManager;
  v12 = -[UIScenePresentationManager init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    v14 = objc_storeWeak((id *)&v12->_scene, v9);
    objc_msgSend(v9, "addObserver:", v13);

    objc_msgSend(v9, "_relationshipManagementHostComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScenePresentationManager _addPrioritizedPresenterObserver:](v13, "_addPrioritizedPresenterObserver:", v15);
    v13->_invalidated = 0;
    v16 = [_UIScenePresenterOwner alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v13->_scene);
    v18 = -[_UIScenePresenterOwner initWithScenePresentationManager:context:](v16, "initWithScenePresentationManager:context:", v13, WeakRetained);
    scenePresenterOwner = v13->_scenePresenterOwner;
    v13->_scenePresenterOwner = (_UIScenePresenterOwner *)v18;

    -[_UIScenePresenterOwner setDelegate:](v13->_scenePresenterOwner, "setDelegate:", v13);
    v20 = -[UIScenePresentationContext _initWithDefaultValues]([UIScenePresentationContext alloc], "_initWithDefaultValues");
    defaultScenePresentationContext = v13->_defaultScenePresentationContext;
    v13->_defaultScenePresentationContext = v20;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    mapLayersToPresenterOwners = v13->_mapLayersToPresenterOwners;
    v13->_mapLayersToPresenterOwners = (NSMapTable *)v22;

    objc_storeStrong((id *)&v13->_keyboardProxyPresentationEnvironment, a5);
    objc_msgSend(v10, "trackPresentationEnvironment:", v13->_keyboardProxyPresentationEnvironment);
    -[UIScenePresentationManager _addPrioritizedPresenterObserver:](v13, "_addPrioritizedPresenterObserver:", v13->_keyboardProxyPresentationEnvironment);

  }
  return v13;
}

- (UIScenePresentationContext)defaultPresentationContext
{
  return self->_defaultScenePresentationContext;
}

+ (id)sceneHostingGraph
{
  return +[_UISceneHostingGraph sharedInstance](_UISceneHostingGraph, "sharedInstance");
}

- (UIScenePresentationManager)init
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 60, CFSTR("[UIScenePresentationManager init] is unavailable for use."));

  v6.receiver = self;
  v6.super_class = (Class)UIScenePresentationManager;
  return -[UIScenePresentationManager init](&v6, sel_init);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  id obj;

  obj = a3;
  if (obj && -[UIScenePresentationManager isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 101, CFSTR("Cannot set a new delegate if the presentation manager is already invalidated"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v7 = objc_opt_respondsToSelector();
    v6 = obj;
    self->_delegateFlags.defaultPriorityBand = v7 & 1;
  }

}

void __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_4(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_5;
  v3[3] = &unk_1E16B8198;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "modifyPresentationContext:", v3);

}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setDefaultPresentationContext:", *(_QWORD *)(a1 + 32));
}

- (id)createPresenterWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIScenePresentationManager createPresenterWithIdentifier:priority:](self, "createPresenterWithIdentifier:priority:", v4, -[UIScenePresentationManager _defaultPresentationPriority](self, "_defaultPresentationPriority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createPresenterForLayerTarget:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[UIScenePresentationManager createPresenterForLayerTarget:identifier:priority:](self, "createPresenterForLayerTarget:identifier:priority:", v7, v6, -[UIScenePresentationManager _defaultPresentationPriority](self, "_defaultPresentationPriority"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createPresenterForLayerTarget:(id)a3 identifier:(id)a4 priority:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  _UIScenePresenterOwner *v12;
  _UIScenePresenter *v13;
  void *v14;
  _UIScenePresenter *v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  UIScenePresentationManager *v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layerTarget"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  if (-[UIScenePresentationManager isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 189, CFSTR("Cannot create a presenter on a presentation manager that's been invalidated."));

  }
  if (-[UIScenePresentationManager _hasPresenterWithIdentifier:](self, "_hasPresenterWithIdentifier:", v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationManager.m"), 190, CFSTR("Cannot create a presenter with this identifier as it's already in use."));

  }
  -[NSMapTable objectForKey:](self->_mapLayersToPresenterOwners, "objectForKey:", v9);
  v12 = (_UIScenePresenterOwner *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[_UIScenePresenterOwner initWithScenePresentationManager:context:]([_UIScenePresenterOwner alloc], "initWithScenePresentationManager:context:", self, v9);
    -[_UIScenePresenterOwner setDelegate:](v12, "setDelegate:", self);
    -[NSMapTable setObject:forKey:](self->_mapLayersToPresenterOwners, "setObject:forKey:", v12, v9);
  }
  v13 = [_UIScenePresenter alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_UIScenePresenter initWithOwner:identifier:sortContext:](v13, "initWithOwner:identifier:sortContext:", v12, v11, v14);

  v16 = (void *)-[UIScenePresentationContext mutableCopy](self->_defaultScenePresentationContext, "mutableCopy");
  objc_msgSend(v16, "_setLayerTargetsToExclude:", 0);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__UIScenePresentationManager_createPresenterForLayerTarget_identifier_priority___block_invoke;
  v24[3] = &unk_1E16C8070;
  v25 = v9;
  v26 = self;
  v27 = v16;
  v17 = v16;
  v18 = v9;
  -[_UIScenePresenter modifyPresentationContext:](v15, "modifyPresentationContext:", v24);
  -[_UIScenePresenterOwner addPresenter:](v12, "addPresenter:", v15);

  return v15;
}

void __80__UIScenePresentationManager_createPresenterForLayerTarget_identifier_priority___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a1[4];
  v7 = a2;
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setExclusiveLayerTargetsToInclude:", v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
  objc_msgSend(v7, "_setVisibilityPropagationEnabled:", objc_msgSend(WeakRetained, "contentState") != 0);

  objc_msgSend(v7, "_setDefaultPresentationContext:", a1[6]);
}

- (id)snapshotContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIScenePresentationManager scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScenePresentationContext presentedLayerTypes](self->_defaultScenePresentationContext, "presentedLayerTypes");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "layerManager", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "type");
        if ((FBSceneLayerTypeMaskContainsType() & 1) == 0)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setLayersToExclude:", v5);
  -[UIScenePresentationContext backgroundColorWhileHosting](self->_defaultScenePresentationContext, "backgroundColorWhileHosting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alphaComponent");
  objc_msgSend(v4, "setOpaque:", v14 >= 1.0);

  return v4;
}

- (id)snapshotPresentationForSnapshot:(id)a3
{
  id v3;
  _UISceneSnapshotPresentationView *v4;

  v3 = a3;
  v4 = -[_UISceneSnapshotPresentationView initWithSnapshot:]([_UISceneSnapshotPresentationView alloc], "initWithSnapshot:", v3);

  return v4;
}

- (NSString)description
{
  return (NSString *)-[UIScenePresentationManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIScenePresentationManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("sceneID"));

  if (-[UIScenePresentationManager isInvalidated](self, "isInvalidated"))
    v6 = (id)objc_msgSend(v3, "appendBool:withName:", 1, CFSTR("invalidated"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScenePresentationManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  UIScenePresentationManager *v11;

  v4 = a3;
  -[UIScenePresentationManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__UIScenePresentationManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __68__UIScenePresentationManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("allLayersTargetOwner"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("individualLayersTargetOwner"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("defaultPresentationContext"), 1);
}

uint64_t __80__UIScenePresentationManager_owner_willPrioritizePresenter_deactivatePresenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setLayerTargetsToExclude:", *(_QWORD *)(a1 + 32));
}

- (void)ownerDidInvalidateLastPresenter:(id)a3
{
  void *v4;
  int v5;
  NSMapTable *mapLayersToPresenterOwners;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EDF40450);

  if (v5)
  {
    -[UIScenePresentationManager owner:willPrioritizePresenter:deactivatePresenter:](self, "owner:willPrioritizePresenter:deactivatePresenter:", v8, 0, 0);
    mapLayersToPresenterOwners = self->_mapLayersToPresenterOwners;
    objc_msgSend(v8, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](mapLayersToPresenterOwners, "removeObjectForKey:", v7);

    objc_msgSend(v8, "setDelegate:", 0);
    objc_msgSend(v8, "invalidate");
  }

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  _UIScenePresenterOwner *scenePresenterOwner;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMapTable *mapLayersToPresenterOwners;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[_UIScenePresenterOwner invalidate](self->_scenePresenterOwner, "invalidate");
    scenePresenterOwner = self->_scenePresenterOwner;
    self->_scenePresenterOwner = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NSMapTable objectEnumerator](self->_mapLayersToPresenterOwners, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v9);
    }

    -[NSMapTable removeAllObjects](self->_mapLayersToPresenterOwners, "removeAllObjects");
    mapLayersToPresenterOwners = self->_mapLayersToPresenterOwners;
    self->_mapLayersToPresenterOwners = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          objc_msgSend(v18, "setDelegate:", 0, (_QWORD)v19);
          objc_msgSend(v18, "invalidate");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

    objc_setAssociatedObject(v4, &_UI_PRESENTATION_MANAGER_KEY, 0, (void *)0x301);
  }

}

- (id)_presenterWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIScenePresenterOwner presenterWithIdentifier:](self->_scenePresenterOwner, "presenterWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMapTable objectEnumerator](self->_mapLayersToPresenterOwners, "objectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "presenterWithIdentifier:", v4);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (void *)v11;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_12:

  }
  return v5;
}

- (void)_addPrioritizedPresenterObserver:(id)a3
{
  id v4;
  NSHashTable *prioritizedPresenterObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  prioritizedPresenterObservers = self->_prioritizedPresenterObservers;
  v8 = v4;
  if (!prioritizedPresenterObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_prioritizedPresenterObservers;
    self->_prioritizedPresenterObservers = v6;

    v4 = v8;
    prioritizedPresenterObservers = self->_prioritizedPresenterObservers;
  }
  -[NSHashTable addObject:](prioritizedPresenterObservers, "addObject:", v4);

}

- (void)_removePrioritizedPresenterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_prioritizedPresenterObservers, "removeObject:", a3);
}

- (UIScenePresentationManagerDelegate)delegate
{
  return (UIScenePresentationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultScenePresentationContext, 0);
  objc_storeStrong((id *)&self->_prioritizedPresenterObservers, 0);
  objc_storeStrong((id *)&self->_mapLayersToPresenterOwners, 0);
  objc_storeStrong((id *)&self->_scenePresenterOwner, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_keyboardProxyPresentationEnvironment, 0);
}

@end
