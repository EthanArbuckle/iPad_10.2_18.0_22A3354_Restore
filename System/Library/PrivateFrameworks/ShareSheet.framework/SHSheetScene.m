@implementation SHSheetScene

+ (FBSceneWorkspace)sceneWorkspace
{
  if (sceneWorkspace_onceToken != -1)
    dispatch_once(&sceneWorkspace_onceToken, &__block_literal_global_11);
  return (FBSceneWorkspace *)(id)sceneWorkspace_sceneWorkspace;
}

void __30__SHSheetScene_sceneWorkspace__block_invoke()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getFBSceneWorkspaceClass_softClass;
  v8 = getFBSceneWorkspaceClass_softClass;
  if (!getFBSceneWorkspaceClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getFBSceneWorkspaceClass_block_invoke;
    v4[3] = &unk_1E4001370;
    v4[4] = &v5;
    __getFBSceneWorkspaceClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_msgSend([v1 alloc], "initWithIdentifier:", CFSTR("com.apple.sharinguiservice"));
  v3 = (void *)sceneWorkspace_sceneWorkspace;
  sceneWorkspace_sceneWorkspace = v2;

}

- (SHSheetScene)initWithSession:(id)a3
{
  id v4;
  SHSheetScene *v5;
  SHSheetScene *v6;
  uint64_t v7;
  SHSheetUIServiceClientContext *sessionContext;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  FBSDisplayConfiguration *displayConfiguration;
  objc_super v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SHSheetScene;
  v5 = -[SHSheetScene init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    objc_msgSend(v4, "createClientContext");
    v7 = objc_claimAutoreleasedReturnValue();
    sessionContext = v6->_sessionContext;
    v6->_sessionContext = (SHSheetUIServiceClientContext *)v7;

    objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    if (v15 >= v17)
      v18 = v17;
    else
      v18 = v15;
    if (v15 >= v17)
      v19 = v15;
    else
      v19 = v17;
    v6->_framePortrait.origin.x = v11;
    v6->_framePortrait.origin.y = v13;
    v6->_framePortrait.size.width = v18;
    v6->_framePortrait.size.height = v19;
    objc_msgSend(v4, "activityViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_userInterfaceStyle = objc_msgSend(v21, "userInterfaceStyle");

    objc_msgSend(v4, "activityViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_presentationStyle = SHSheetPresentationControllerPresentationStyle(v22);

    v6->_interfaceOrientation = 1;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v23 = (void *)getFBDisplayManagerClass_softClass;
    v33 = getFBDisplayManagerClass_softClass;
    if (!getFBDisplayManagerClass_softClass)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __getFBDisplayManagerClass_block_invoke;
      v29[3] = &unk_1E4001370;
      v29[4] = &v30;
      __getFBDisplayManagerClass_block_invoke((uint64_t)v29);
      v23 = (void *)v31[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v24, "mainConfiguration");
    v25 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v6->_displayConfiguration;
    v6->_displayConfiguration = (FBSDisplayConfiguration *)v25;

    v6->_hostProcessType = 0;
    v6->_foreground = 1;
    -[SHSheetScene _registerForApplicationStateChangeNotification](v6, "_registerForApplicationStateChangeNotification");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SHSheetScene _unregisterForApplicationStateChangeNotification](self, "_unregisterForApplicationStateChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)SHSheetScene;
  -[SHSheetScene dealloc](&v3, sel_dealloc);
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[SHSheetScene scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (UIView)sceneView
{
  return (UIView *)-[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
}

- (void)activate
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  FBScene *v16;
  FBScene *scene;
  FBScene *v18;
  void *v19;
  UIScenePresenter *v20;
  UIScenePresenter *scenePresenter;
  NSObject *v22;
  FBScene *v23;
  void *v24;
  char v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  FBScene *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((-[FBScene isActive](self->_scene, "isActive") & 1) == 0)
  {
    if (!self->_scene)
    {
      share_sheet_log();
      v3 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v4 = objc_claimAutoreleasedReturnValue();
      -[SHSheetScene session](self, "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = os_signpost_id_make_with_pointer(v4, v6);

      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19E419000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SetupScene", " enableTelemetry=YES ", buf, 2u);
      }

      share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "setting up new scene", buf, 2u);
      }

      v9 = (void *)MEMORY[0x1E0CB3940];
      -[SHSheetScene session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("scene::SharingUI::%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "sceneWorkspace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __24__SHSheetScene_activate__block_invoke;
      v28[3] = &unk_1E40020A0;
      v29 = v12;
      v15 = v12;
      objc_msgSend(v13, "createScene:", v28);
      v16 = (FBScene *)objc_claimAutoreleasedReturnValue();
      scene = self->_scene;
      self->_scene = v16;

      -[FBScene setDelegate:](self->_scene, "setDelegate:", self);
      -[FBScene addObserver:](self->_scene, "addObserver:", self);
      v18 = self->_scene;
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = __24__SHSheetScene_activate__block_invoke_2;
      v27[3] = &unk_1E40020F0;
      v27[4] = self;
      -[FBScene configureParameters:](v18, "configureParameters:", v27);
      -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createPresenterWithIdentifier:", CFSTR("default"));
      v20 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v20;

      -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_17);
      -[UIScenePresenter activate](self->_scenePresenter, "activate");

    }
    share_sheet_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_scene;
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl(&dword_19E419000, v22, OS_LOG_TYPE_DEFAULT, "activating scene:%@", buf, 0xCu);
    }

    -[FBScene activateWithTransitionContext:](self->_scene, "activateWithTransitionContext:", 0);
    -[SHSheetScene delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[SHSheetScene delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sceneDidBecomeActive:", self);

    }
  }
}

void __24__SHSheetScene_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentifier:", v2);
  +[FBSSceneSpecification specification](SHSheetSceneSpecification, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpecification:", v4);

  objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", CFSTR("com.apple.sharinguiservice"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentity:", v5);

}

uint64_t __24__SHSheetScene_activate__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__SHSheetScene_activate__block_invoke_3;
  v3[3] = &unk_1E40020C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "updateSettingsWithBlock:", v3);
}

void __24__SHSheetScene_activate__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_configureSceneSettings:", v4);
  objc_msgSend(v4, "setInterfaceOrientationMode:", 2);
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
  objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v3);

  objc_msgSend(v4, "setForeground:", 1);
}

void __24__SHSheetScene_activate__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", 0);
  objc_msgSend(v2, "setBackgroundColorWhileNotHosting:", 0);

}

- (void)invalidate
{
  NSObject *v3;
  FBScene *scene;
  UIScenePresenter *scenePresenter;
  FBScene *v6;
  int v7;
  FBScene *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_scene)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      scene = self->_scene;
      v7 = 138412290;
      v8 = scene;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "invalidating scene:%@", (uint8_t *)&v7, 0xCu);
    }

    -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

    -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
    -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
    -[FBScene invalidate](self->_scene, "invalidate");
    v6 = self->_scene;
    self->_scene = 0;

  }
}

- (void)_registerForApplicationStateChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didUpdateApplicationState_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didUpdateApplicationState_, *MEMORY[0x1E0DC4750], 0);

}

- (void)_unregisterForApplicationStateChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4750], 0);

}

- (void)_didUpdateApplicationState:(id)a3
{
  -[SHSheetScene updateWithChange:](self, "updateWithChange:", &__block_literal_global_24);
}

- (void)_setSheetConfiguration:(id)a3
{
  id v5;
  _UISheetPresentationControllerConfiguration *v6;
  _UISheetPresentationControllerConfiguration *v7;
  _UISheetPresentationControllerConfiguration *v8;
  char v9;
  _QWORD v10[4];
  _UISheetPresentationControllerConfiguration *v11;

  v5 = a3;
  v6 = self->__sheetConfiguration;
  v7 = (_UISheetPresentationControllerConfiguration *)v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      v9 = -[_UISheetPresentationControllerConfiguration isEqual:](v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__sheetConfiguration, a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__SHSheetScene__setSheetConfiguration___block_invoke;
    v10[3] = &unk_1E40020C8;
    v11 = v8;
    -[SHSheetScene _updateSettingsWithFence:transitionCoordinator:](self, "_updateSettingsWithFence:transitionCoordinator:", v10, 0);

  }
LABEL_8:

}

void __39__SHSheetScene__setSheetConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setSheetConfiguration:", *(_QWORD *)(a1 + 32));

}

- (_UISheetPresentationControllerConfiguration)_sheetConfiguration
{
  return self->__sheetConfiguration;
}

- (void)setSessionContext:(id)a3
{
  id v4;
  SHSheetUIServiceClientContext *v5;
  SHSheetUIServiceClientContext *v6;
  BOOL v7;
  SHSheetUIServiceClientContext *v8;
  SHSheetUIServiceClientContext *sessionContext;
  SHSheetUIServiceClientContext *v10;
  SHSheetUIServiceClientContext *v11;

  v4 = a3;
  -[SHSheetScene sessionContext](self, "sessionContext");
  v5 = (SHSheetUIServiceClientContext *)(id)objc_claimAutoreleasedReturnValue();
  v6 = (SHSheetUIServiceClientContext *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    sessionContext = v11;
  }
  else
  {
    if ((v6 != 0) != (v5 == 0))
    {
      v7 = -[SHSheetUIServiceClientContext isEqual:](v5, "isEqual:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_9;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    sessionContext = self->_sessionContext;
    self->_sessionContext = v10;
  }

  v8 = v11;
LABEL_9:

}

- (void)setSafeAreaInsetsPortrait:(UIEdgeInsets)a3
{
  if (a3.left != self->_safeAreaInsetsPortrait.left
    || a3.top != self->_safeAreaInsetsPortrait.top
    || a3.right != self->_safeAreaInsetsPortrait.right
    || a3.bottom != self->_safeAreaInsetsPortrait.bottom)
  {
    self->_safeAreaInsetsPortrait = a3;
    -[SHSheetScene setNeedsFenceAnimation:](self, "setNeedsFenceAnimation:", 1);
  }
}

- (void)setFramePortrait:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_framePortrait))
  {
    self->_framePortrait.origin.x = x;
    self->_framePortrait.origin.y = y;
    self->_framePortrait.size.width = width;
    self->_framePortrait.size.height = height;
    -[SHSheetScene setNeedsFenceAnimation:](self, "setNeedsFenceAnimation:", 1);
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
    self->_userInterfaceStyle = a3;
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3)
    self->_presentationStyle = a3;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    -[SHSheetScene setNeedsFenceAnimation:](self, "setNeedsFenceAnimation:", 1);
  }
}

- (void)setDisplayConfiguration:(id)a3
{
  FBSDisplayConfiguration *v5;
  FBSDisplayConfiguration **p_displayConfiguration;
  FBSDisplayConfiguration *displayConfiguration;
  FBSDisplayConfiguration *v8;

  v5 = (FBSDisplayConfiguration *)a3;
  displayConfiguration = self->_displayConfiguration;
  p_displayConfiguration = &self->_displayConfiguration;
  if (displayConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_displayConfiguration, a3);
    v5 = v8;
  }

}

- (void)setHostProcessType:(int64_t)a3
{
  int64_t hostProcessType;

  hostProcessType = self->_hostProcessType;
  if (hostProcessType != a3 && hostProcessType <= 0)
    self->_hostProcessType = a3;
}

- (void)setForeground:(BOOL)a3
{
  if (self->_foreground != a3)
    self->_foreground = a3;
}

- (void)sendAction:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetScene scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendActions:", v5);

}

- (void)updateWithSessionContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SHSheetScene_updateWithSessionContext___block_invoke;
  v6[3] = &unk_1E4002198;
  v7 = v4;
  v5 = v4;
  -[SHSheetScene updateWithChange:](self, "updateWithChange:", v6);

}

uint64_t __41__SHSheetScene_updateWithSessionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSessionContext:", *(_QWORD *)(a1 + 32));
}

- (void)updateWithChange:(id)a3
{
  -[SHSheetScene updateWithChange:transitionCoordinator:](self, "updateWithChange:transitionCoordinator:", a3, 0);
}

- (void)updateWithChange:(id)a3 transitionCoordinator:(id)a4
{
  id v6;
  void (**v7)(id, SHSheetScene *, _BYTE *);
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(id, SHSheetScene *, _BYTE *))a3;
  -[SHSheetScene setActiveUpdate:](self, "setActiveUpdate:", 1);
  v17 = 0;
  v7[2](v7, self, &v17);

  v8 = 0;
  if (!v17)
    v8 = -[SHSheetScene needsFenceAnimation](self, "needsFenceAnimation");
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "scene update change with fenceAnimation:%@", buf, 0xCu);

  }
  if (v8)
  {
    -[SHSheetScene fenceCompletionHandler](self, "fenceCompletionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetScene setFenceCompletionHandler:](self, "setFenceCompletionHandler:", 0);
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CD28B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke;
      v15[3] = &unk_1E40013E8;
      v16 = v11;
      objc_msgSend(v12, "addCommitHandler:forPhase:", v15, 5);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_3;
    v14[3] = &unk_1E40020C8;
    v14[4] = self;
    -[SHSheetScene _updateSettingsWithFence:transitionCoordinator:](self, "_updateSettingsWithFence:transitionCoordinator:", v14, v6);
  }
  else
  {
    -[SHSheetScene scene](self, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_4;
    v13[3] = &unk_1E40021C0;
    v13[4] = self;
    objc_msgSend(v11, "performUpdate:", v13);
  }

  -[SHSheetScene setNeedsFenceAnimation:](self, "setNeedsFenceAnimation:", 0);
  -[SHSheetScene setActiveUpdate:](self, "setActiveUpdate:", 0);

}

void __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_2;
  block[3] = &unk_1E40013E8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_configureSceneSettings:", v3);

}

void __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_configureSceneSettings:", v3);

}

- (void)_updateSettingsWithFence:(id)a3 transitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SHSheetScene scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SHSheetScene__updateSettingsWithFence_transitionCoordinator___block_invoke;
  v11[3] = &unk_1E40021E8;
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "updateSettingsWithTransitionBlock:", v11);

}

id __63__SHSheetScene__updateSettingsWithFence_transitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"))
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E0D22F70];
      objc_msgSend(v2, "transitionDuration");
      objc_msgSend(v3, "settingsWithDuration:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationSettings");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3490], "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v4);
  objc_msgSend(MEMORY[0x1E0DC3BC0], "_synchronizedDrawingFence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationFence:", v6);

  return v5;
}

- (void)_configureSceneSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SHSheetScene safeAreaInsetsPortrait](self, "safeAreaInsetsPortrait");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:");
  objc_msgSend(v8, "setUserInterfaceStyle:", -[SHSheetScene userInterfaceStyle](self, "userInterfaceStyle"));
  -[SHSheetScene framePortrait](self, "framePortrait");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setPresentationStyle:", -[SHSheetScene presentationStyle](self, "presentationStyle"));
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setApplicationState:", objc_msgSend(v4, "applicationState"));

  -[SHSheetScene sessionContext](self, "sessionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionContext:", v5);

  objc_msgSend(v8, "setInterfaceOrientation:", -[SHSheetScene interfaceOrientation](self, "interfaceOrientation"));
  -[SHSheetScene displayConfiguration](self, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SHSheetScene displayConfiguration](self, "displayConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayConfiguration:", v7);

  }
  objc_msgSend(v8, "setHostProcessType:", -[SHSheetScene hostProcessType](self, "hostProcessType"));
  objc_msgSend(v8, "setForeground:", -[SHSheetScene foreground](self, "foreground"));

}

- (void)resetContext
{
  -[SHSheetScene updateWithSessionContext:](self, "updateWithSessionContext:", 0);
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  if (v6 && self->_scene == a3)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SHSheetScene sceneDidDeactivate:withError:].cold.1((uint64_t)v6, v7);

    -[SHSheetScene activate](self, "activate");
  }

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  SHSheetScene *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v7;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "did receive actions:%@ from scene:%@", buf, 0x16u);
  }
  v29 = v6;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    v13 = 0x1E3FFF000uLL;
    v14 = 0x1E3FFF000uLL;
    v30 = self;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          if (objc_msgSend(v17, "type") == 10)
          {
            -[SHSheetScene session](self, "session");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "activityViewController");
            v19 = v11;
            v20 = v12;
            v21 = v13;
            v22 = v9;
            v23 = v14;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "_endDelayingPresentation");

            v14 = v23;
            v9 = v22;
            v13 = v21;
            v12 = v20;
            v11 = v19;
            self = v30;

          }
          -[SHSheetScene delegate](self, "delegate", v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "scene:didReceiveAction:", self, v17);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = v16;
            -[SHSheetScene delegate](self, "delegate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "scene:didReceiveMetadataUpdateAction:", self, v26);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v16;
              -[SHSheetScene delegate](self, "delegate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "scene:didReceiveSuggestionAction:", self, v27);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_19;
              v28 = v16;
              -[SHSheetScene delegate](self, "delegate", v29);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "scene:didReceiveDraggingAction:", self, v28);
            }
          }
        }

LABEL_19:
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  -[SHSheetScene session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v7, v9);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v6, OS_SIGNPOST_INTERVAL_END, v10, "SetupScene", " enableTelemetry=YES ", v11, 2u);
  }

}

- (BOOL)_viewClipsToBounds
{
  return self->_viewClipsToBounds;
}

- (void)_setViewClipsToBounds:(BOOL)a3
{
  self->_viewClipsToBounds = a3;
}

- (SHSheetSceneDelegate)delegate
{
  return (SHSheetSceneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetUIServiceClientContext)sessionContext
{
  return self->_sessionContext;
}

- (CGRect)framePortrait
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_framePortrait.origin.x;
  y = self->_framePortrait.origin.y;
  width = self->_framePortrait.size.width;
  height = self->_framePortrait.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortrait
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsetsPortrait.top;
  left = self->_safeAreaInsetsPortrait.left;
  bottom = self->_safeAreaInsetsPortrait.bottom;
  right = self->_safeAreaInsetsPortrait.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (id)fenceCompletionHandler
{
  return self->_fenceCompletionHandler;
}

- (void)setFenceCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SHSheetSession)session
{
  return (SHSheetSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (BOOL)activeUpdate
{
  return self->_activeUpdate;
}

- (void)setActiveUpdate:(BOOL)a3
{
  self->_activeUpdate = a3;
}

- (BOOL)needsFenceAnimation
{
  return self->_needsFenceAnimation;
}

- (void)setNeedsFenceAnimation:(BOOL)a3
{
  self->_needsFenceAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong(&self->_fenceCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__sheetConfiguration, 0);
}

- (void)sceneDidDeactivate:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "scene did deactivate with error:%@", (uint8_t *)&v2, 0xCu);
}

@end
