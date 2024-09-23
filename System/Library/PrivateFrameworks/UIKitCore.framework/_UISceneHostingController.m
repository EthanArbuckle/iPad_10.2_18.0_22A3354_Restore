@implementation _UISceneHostingController

- (id)activationStateComponent
{
  FBScene *fbScene;
  FBScene *v3;
  uint64_t v4;
  void *v5;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  v4 = objc_opt_class();
  -[FBScene componentForExtension:ofClass:](v3, "componentForExtension:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_UISceneHostingIntelligenceSupportHost)intelligenceHostSceneComponent
{
  FBScene *fbScene;
  FBScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  v4 = objc_opt_class();
  -[FBScene componentForExtension:ofClass:](v3, "componentForExtension:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
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

  return (_UISceneHostingIntelligenceSupportHost *)v9;
}

- (id)contentSizePreferenceProvider
{
  FBScene *fbScene;
  FBScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  v4 = objc_opt_class();
  -[FBScene componentForExtension:ofClass:](v3, "componentForExtension:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
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

  return v9;
}

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_373);
}

- (_UISceneHostingController)initWithAdvancedConfiguration:(id)a3
{
  id v4;
  _UISceneHostingController *v5;
  _UISceneHostingView *v6;
  _UISceneHostingView *sceneView;
  id *v8;
  _UISceneHostingViewController *sceneViewController;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISceneHostingController;
  v5 = -[_UISceneHostingController init](&v11, sel_init);
  if (v5)
  {
    v6 = -[_UISceneHostingView initWithSceneHostingController:]([_UISceneHostingView alloc], "initWithSceneHostingController:", v5);
    sceneView = v5->_sceneView;
    v5->_sceneView = v6;

    v8 = -[_UISceneHostingViewController initWithSceneHostingController:]([_UISceneHostingViewController alloc], v5);
    sceneViewController = v5->_sceneViewController;
    v5->_sceneViewController = (_UISceneHostingViewController *)v8;

    -[_UISceneHostingController createSceneWithConfiguration:](v5, "createSceneWithConfiguration:", v4);
    -[_UISceneHostingController setActivationController:](v5, "setActivationController:", 0);
    -[_UISceneHostingController beginObservingNotifications](v5, "beginObservingNotifications");
  }

  return v5;
}

- (_UISceneHostingController)initWithProcessIdentity:(id)a3 sceneSpecification:(id)a4
{
  id v6;
  id v7;
  _UISceneHostingControllerAdvancedConfiguration *v8;
  _UISceneHostingController *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_UISceneHostingControllerAdvancedConfiguration initWithProcessIdentity:]([_UISceneHostingControllerAdvancedConfiguration alloc], "initWithProcessIdentity:", v7);

  -[_UISceneHostingControllerAdvancedConfiguration setSceneSpecification:](v8, "setSceneSpecification:", v6);
  v9 = -[_UISceneHostingController initWithAdvancedConfiguration:](self, "initWithAdvancedConfiguration:", v8);

  return v9;
}

- (void)createSceneWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  id v7;
  FBScene *v8;
  FBScene *fbScene;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  id v21;
  char v22;
  id v23;
  void *v24;
  NSUserActivity *v25;
  NSUserActivity *userActivity;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_fbScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingController.m"), 100, CFSTR("A scene already exists!"));

  }
  objc_msgSend(v5, "sceneWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __58___UISceneHostingController_createSceneWithConfiguration___block_invoke;
  v32[3] = &unk_1E16D8420;
  v7 = v5;
  v33 = v7;
  objc_msgSend(v6, "createScene:", v32);
  v8 = (FBScene *)objc_claimAutoreleasedReturnValue();
  fbScene = self->_fbScene;
  self->_fbScene = v8;

  -[FBScene setDelegate:](self->_fbScene, "setDelegate:", self);
  -[_UISceneHostingView setPresentedScene:](self->_sceneView, "setPresentedScene:", self->_fbScene);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "additionalExtensions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        -[FBScene addExtension:](self->_fbScene, "addExtension:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v12);
  }

  -[_UISceneHostingController contentSizePreferenceProvider](self, "contentSizePreferenceProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentSizePreferenceReceiver:", self->_sceneViewController);

  -[_UISceneHostingController _remoteSheetProvider](self, "_remoteSheetProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setTargetViewController:", self->_sceneViewController);

  -[FBScene _relationshipManagementHostComponent](self->_fbScene, "_relationshipManagementHostComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingController _eventDeferringComponent](self, "_eventDeferringComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:", v18);

  -[FBScene _relationshipManagementHostComponent](self->_fbScene, "_relationshipManagementHostComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_opt_respondsToSelector();

  -[_UISceneHostingController addSettingsProvider:](self, "addSettingsProvider:", self->_sceneView);
  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    -[_UISceneHostingController addSettingsProvider:](self, "addSettingsProvider:", v23);

  }
  objc_msgSend(v7, "sceneSpecification");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "userActivity");
    v25 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
    userActivity = self->_userActivity;
    self->_userActivity = v25;

  }
  -[FBScene updateSettings:](self->_fbScene, "updateSettings:", &__block_literal_global_17_3);

}

- (UIViewController)sceneViewController
{
  return (UIViewController *)self->_sceneViewController;
}

- (void)sendAction:(id)a3
{
  FBScene *fbScene;
  void *v5;
  NSMutableArray *queuedActions;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v9 = a3;
  if (-[FBScene isActive](self->_fbScene, "isActive"))
  {
    fbScene = self->_fbScene;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene sendActions:](fbScene, "sendActions:", v5);

  }
  else
  {
    queuedActions = self->_queuedActions;
    if (!queuedActions)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_queuedActions;
      self->_queuedActions = v7;

      queuedActions = self->_queuedActions;
    }
    -[NSMutableArray addObject:](queuedActions, "addObject:", v9);
  }

}

- (void)performBlock:(void *)a3 withClientTransitionContext:
{
  void (**v5)(_QWORD);
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));

    if (v6 && WeakRetained)
    {
      objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke;
      v9[3] = &unk_1E16BAD68;
      v10 = v6;
      v11 = a1;
      v12 = v5;
      objc_msgSend(v8, "performAsync:", v9);

    }
    else
    {
      v5[2](v5);
    }
  }

}

- (void)invalidate
{
  _UISceneHostingActivationHandle *activationHandle;
  _UISceneHostingActivationControlling *activationController;

  -[FBScene invalidate](self->_fbScene, "invalidate");
  -[_UISceneHostingController endObservingNotifications](self, "endObservingNotifications");
  -[_UISceneHostingActivationHandle invalidate](self->_activationHandle, "invalidate");
  activationHandle = self->_activationHandle;
  self->_activationHandle = 0;

  -[_UISceneHostingActivationControlling endManagingHostedSceneActivationForHostingController:](self->_activationController, "endManagingHostedSceneActivationForHostingController:", self);
  activationController = self->_activationController;
  self->_activationController = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[_UISceneHostingController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UISceneHostingController;
  -[_UISceneHostingController dealloc](&v3, sel_dealloc);
}

- (void)_updateSceneSettingsFromSettingsProvidersWithFence:(BOOL)a3
{
  FBScene *fbScene;
  _QWORD v4[5];
  BOOL v5;

  fbScene = self->_fbScene;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80___UISceneHostingController__updateSceneSettingsFromSettingsProvidersWithFence___block_invoke;
  v4[3] = &unk_1E16D8448;
  v4[4] = self;
  v5 = a3;
  -[FBScene _performUpdateWithoutActivation:](fbScene, "_performUpdateWithoutActivation:", v4);
}

- (void)_clientIsReady
{
  id WeakRetained;
  char v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UISceneHostingController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIsReady");

  }
}

- (void)_prototype_requestSettingsUpdateWithFence:(BOOL)a3
{
  if (self)
    -[_UISceneHostingController _updateSceneSettingsFromSettingsProvidersWithFence:](self, "_updateSceneSettingsFromSettingsProvidersWithFence:", a3);
}

- (void)_scene:(id)a3 isMovingToParent:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _UISceneHostingController *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "_windowHostingScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);

  if (v6 != WeakRetained)
  {
    objc_storeWeak((id *)&self->_parentScene, v6);
    v8 = _scene_isMovingToParent____s_category;
    if (!_scene_isMovingToParent____s_category)
    {
      v8 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_scene_isMovingToParent____s_category);
    }
    v9 = *(id *)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = self;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = CFSTR("(nil)");
      }
      v15 = v14;
      v16 = v5;
      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v16);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412546;
      v22 = v15;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%@ Scene hosting view is moving to parent %@", buf, 0x16u);

    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      -[_UISceneHostingActivationControlling hostingController:isMovingToParentScene:](self->_activationController, "hostingController:isMovingToParentScene:", self, v6);
  }

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "UIActionType", (_QWORD)v15) == 56)
        {
          v13 = v12;
          objc_msgSend(v13, "performActionForSceneController:", self);
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)sceneContentStateDidChange:(id)a3
{
  if (objc_msgSend(a3, "contentState") == 2 && (*(_BYTE *)&self->_flags & 1) == 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    -[_UISceneHostingController _clientIsReady](self, "_clientIsReady");
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  NSMutableArray *queuedActions;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FBScene *fbScene;
  void *v12;
  NSMutableArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queuedActions = self->_queuedActions;
  if (queuedActions)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = queuedActions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          fbScene = self->_fbScene;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBScene sendActions:](fbScene, "sendActions:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v13 = self->_queuedActions;
    self->_queuedActions = 0;

  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[_UISceneHostingActivationControlling activationHandleDidUpdate:forHostingController:](self->_activationController, "activationHandleDidUpdate:forHostingController:", self->_activationHandle, self);

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    -[_UISceneHostingActivationControlling activationHandleDidUpdate:forHostingController:](self->_activationController, "activationHandleDidUpdate:forHostingController:", self->_activationHandle);
}

- (void)addSettingsProvider:(id)a3
{
  -[_UISceneHostingController addSettingsProvider:atIndexPath:](self, "addSettingsProvider:atIndexPath:", a3, -1);
}

- (void)addSettingsProvider:(id)a3 atIndexPath:(int64_t)a4
{
  id v6;
  NSPointerArray *settingsProviders;
  NSPointerArray *v8;
  NSPointerArray *v9;
  id v10;

  v6 = a3;
  settingsProviders = self->_settingsProviders;
  v10 = v6;
  if (!settingsProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v8 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_settingsProviders;
    self->_settingsProviders = v8;

    v6 = v10;
    settingsProviders = self->_settingsProviders;
  }
  if (a4 < 0)
    -[NSPointerArray addPointer:](settingsProviders, "addPointer:", v6);
  else
    -[NSPointerArray insertPointer:atIndex:](settingsProviders, "insertPointer:atIndex:", v6, a4);

}

- (void)removeSettingsProvider:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  if (-[NSPointerArray count](self->_settingsProviders, "count"))
  {
    v4 = 0;
    do
    {
      if (-[NSPointerArray pointerAtIndex:](self->_settingsProviders, "pointerAtIndex:", v4) == v5)
        -[NSPointerArray removePointerAtIndex:](self->_settingsProviders, "removePointerAtIndex:", v4);
      ++v4;
    }
    while (v4 < -[NSPointerArray count](self->_settingsProviders, "count"));
  }

}

- (void)setActivationController:(id)a3
{
  _UISceneHostingActivationControlling *v4;
  void *v5;
  unint64_t v6;
  _UISceneHostingActivationHandle *v7;
  _UISceneHostingActivationHandle *activationHandle;
  char v9;
  char v10;
  NSObject *v11;
  void *v12;
  _UISceneHostingController *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  uint8_t buf[4];
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (_UISceneHostingActivationControlling *)a3;
  if (v4)
  {
    v5 = v4;
    if (self->_activationController == v4)
      goto LABEL_15;
  }
  else
  {
    v5 = (void *)objc_opt_new();
  }
  v6 = setActivationController____s_category;
  if (!setActivationController____s_category)
  {
    v6 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&setActivationController____s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v11 = *(id *)(v6 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = self;
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v13);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = CFSTR("(nil)");
      }
      v17 = v16;
      v18 = v5;
      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v22;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "%@ Using %@ for activation control", buf, 0x16u);

    }
  }
  -[_UISceneHostingActivationHandle invalidate](self->_activationHandle, "invalidate");
  objc_msgSend(v5, "endManagingHostedSceneActivationForHostingController:", self);
  objc_storeStrong((id *)&self->_activationController, v5);
  v7 = (_UISceneHostingActivationHandle *)-[_UISceneHostingActivationHandle initWithActivationTarget:]((id *)[_UISceneHostingActivationHandle alloc], self);
  activationHandle = self->_activationHandle;
  self->_activationHandle = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 2;
  else
    v9 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 4;
  else
    v10 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v10;
  objc_msgSend(v5, "beginManagingHostedSceneActivationUsingHandle:forHostingController:", self->_activationHandle, self);
LABEL_15:

}

- (void)activate:(id)a3
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  _UISceneHostingView *sceneView;
  NSObject *v12;
  __CFString *v13;
  unint64_t v14;
  NSObject *v15;
  _UISceneHostingView *v16;
  NSObject *v17;
  __CFString *v18;
  unint64_t v19;
  NSObject *v20;
  _UISceneHostingView *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  NSUserActivity *userActivity;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, id))a3;
  if (v5)
  {
    v6 = (id)objc_opt_new();
    v5[2](v5, v6);
  }
  else
  {
    v6 = 0;
  }
  -[FBScene settings](self->_fbScene, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = _MergedGlobals_1146;
    if (!_MergedGlobals_1146)
    {
      v9 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_MergedGlobals_1146);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      sceneView = self->_sceneView;
      v12 = v10;
      -[UIView superview](sceneView, "superview");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v13;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Scene hosting view's superview: %@", buf, 0xCu);

    }
    v14 = qword_1ECD7F120;
    if (!qword_1ECD7F120)
    {
      v14 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD7F120);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_sceneView;
      v17 = v15;
      -[UIView window](v16, "window");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Scene hosting view's window: %@", buf, 0xCu);

    }
    v19 = qword_1ECD7F128;
    if (!qword_1ECD7F128)
    {
      v19 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&qword_1ECD7F128);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_sceneView;
      v22 = v20;
      -[UIView window](v21, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_remoteContentParent");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v24;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "Scene hosting view's parent environment: %@", buf, 0xCu);

    }
    v25 = qword_1ECD7F130;
    if (!qword_1ECD7F130)
    {
      v25 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&qword_1ECD7F130);
    }
    v26 = *(id *)(v25 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene parentScene](self->_fbScene, "parentScene");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v27);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "Parent scene: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene description](self->_fbScene, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingController.m"), 393, CFSTR("Activating a _UISceneHostingController's scene with a nil display configuration is not supported: %@"), v33);

  }
  userActivity = self->_userActivity;
  if (userActivity)
  {
    if (!v6)
    {
      v6 = (id)objc_opt_new();
      userActivity = self->_userActivity;
    }
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __38___UISceneHostingController_activate___block_invoke;
    v35[3] = &unk_1E16D8470;
    v35[4] = self;
    v6 = v6;
    v36 = v6;
    +[UISActivityContinuationAction buildWithUserActivity:completion:](UIActivityContinuationAction, "buildWithUserActivity:completion:", userActivity, v35);

  }
  else
  {
    -[FBScene activateWithTransitionContext:](self->_fbScene, "activateWithTransitionContext:", v6);
  }

}

- (void)deactivate:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  if (a3)
  {
    v4 = (void (**)(_QWORD))a3;
    v5 = (id)objc_opt_new();
    v4[2](v4);

  }
  else
  {
    v5 = 0;
  }
  -[FBScene deactivateWithTransitionContext:](self->_fbScene, "deactivateWithTransitionContext:", v5);

}

- (BOOL)isActive
{
  return -[FBScene isActive](self->_fbScene, "isActive");
}

- (void)beginObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_sceneWillEnterBackground_, CFSTR("UISceneDidEnterBackgroundNotification"), 0);

}

- (void)endObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UISceneDidEnterBackgroundNotification"), 0);

}

- (void)sceneWillEnterBackground:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  v16 = v4;
  v6 = WeakRetained;
  if (v16 == v6)
  {

LABEL_7:
    v8 = objc_loadWeakRetained((id *)&self->_parentScene);
    v9 = objc_opt_class();
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

    if (v12)
    {
      -[_UISceneHostingController activationStateComponent](self, "activationStateComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "foregroundAssertionForReason:", CFSTR("snapshotting"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54___UISceneHostingController_sceneWillEnterBackground___block_invoke;
      v17[3] = &unk_1E16B1B28;
      v18 = v14;
      v15 = v14;
      objc_msgSend(v12, "_performAfterSystemSnapshotsComplete:", v17);

    }
    return;
  }
  if (!v16 || !v6)
  {

    return;
  }
  v7 = objc_msgSend(v16, "isEqual:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_7;
}

- (uint64_t)_fbScene
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (_UISceneHostingView)sceneView
{
  return self->_sceneView;
}

- (_UISceneHostingControllerDelegate)delegate
{
  return (_UISceneHostingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UISceneHostingActivationControlling)activationController
{
  return self->_activationController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_fbScene, 0);
  objc_storeStrong((id *)&self->_activationHandle, 0);
  objc_storeStrong((id *)&self->_activationController, 0);
  objc_storeStrong((id *)&self->_queuedActions, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_settingsProviders, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_destroyWeak((id *)&self->_parentScene);
}

- (_UISceneHostingSheetPresentationHostProviding)_remoteSheetProvider
{
  FBScene *fbScene;
  FBScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  v4 = objc_opt_class();
  -[FBScene componentForExtension:ofClass:](v3, "componentForExtension:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
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

  return (_UISceneHostingSheetPresentationHostProviding *)v9;
}

- (id)_eventDeferringComponent
{
  FBScene *fbScene;
  FBScene *v3;
  uint64_t v4;
  void *v5;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  v4 = objc_opt_class();
  -[FBScene componentForExtension:ofClass:](v3, "componentForExtension:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)traitCollectionReceiver
{
  FBScene *fbScene;
  FBScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  v4 = objc_opt_class();
  -[FBScene componentForExtension:ofClass:](v3, "componentForExtension:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
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

  return v9;
}

- (id)keyboardSuppressionController
{
  FBScene *fbScene;
  FBScene *v3;
  void *v4;

  if (self)
    fbScene = self->_fbScene;
  else
    fbScene = 0;
  v3 = fbScene;
  -[FBScene _keyboardHostComponent](v3, "_keyboardHostComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
