@implementation SHSheetCustomSceneViewController

+ (FBSceneWorkspace)sceneWorkspace
{
  if (sceneWorkspace_onceToken_0 != -1)
    dispatch_once(&sceneWorkspace_onceToken_0, &__block_literal_global_41);
  return (FBSceneWorkspace *)(id)sceneWorkspace_sceneWorkspace_0;
}

void __50__SHSheetCustomSceneViewController_sceneWorkspace__block_invoke()
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
  v0 = (void *)getFBSceneWorkspaceClass_softClass_0;
  v8 = getFBSceneWorkspaceClass_softClass_0;
  if (!getFBSceneWorkspaceClass_softClass_0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getFBSceneWorkspaceClass_block_invoke_0;
    v4[3] = &unk_1E4001370;
    v4[4] = &v5;
    __getFBSceneWorkspaceClass_block_invoke_0((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_msgSend([v1 alloc], "initWithIdentifier:", CFSTR("com.apple.sharinguiservice.customscene"));
  v3 = (void *)sceneWorkspace_sceneWorkspace_0;
  sceneWorkspace_sceneWorkspace_0 = v2;

}

- (SHSheetCustomSceneViewController)initWithProcessIdentity:(id)a3
{
  id v5;
  SHSheetCustomSceneViewController *v6;
  SHSheetCustomSceneViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetCustomSceneViewController;
  v6 = -[SHSheetCustomSceneViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_processIdentity, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SHSheetCustomSceneViewController _tearDownScene](self, "_tearDownScene");
  v3.receiver = self;
  v3.super_class = (Class)SHSheetCustomSceneViewController;
  -[SHSheetCustomSceneViewController dealloc](&v3, sel_dealloc);
}

- (void)_tearDownScene
{
  UIScenePresenter *scenePresenter;
  FBScene *scene;

  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
  -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
  -[FBScene invalidate](self->_scene, "invalidate");
  scene = self->_scene;
  self->_scene = 0;

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHSheetCustomSceneViewController;
  -[SHSheetCustomSceneViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SHSheetCustomSceneViewController _setupScene](self, "_setupScene");
}

- (void)_setupScene
{
  void *v3;
  void *v4;
  FBScene *scene;
  void *v6;
  uint64_t v7;
  FBScene *v8;
  FBScene *v9;
  FBScene *v10;
  void *v11;
  UIScenePresenter *v12;
  UIScenePresenter *scenePresenter;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *sceneView;
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  SHSheetCustomSceneViewController *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("scene::SharingUI::%@"), v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  scene = self->_scene;
  if (!scene)
  {
    objc_msgSend((id)objc_opt_class(), "sceneWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__SHSheetCustomSceneViewController__setupScene__block_invoke;
    v21[3] = &unk_1E40039A8;
    v22 = v19;
    v23 = self;
    objc_msgSend(v6, "createScene:", v21);
    v8 = (FBScene *)objc_claimAutoreleasedReturnValue();
    v9 = self->_scene;
    self->_scene = v8;

    -[FBScene setDelegate:](self->_scene, "setDelegate:", self);
    -[FBScene addObserver:](self->_scene, "addObserver:", self);
    v10 = self->_scene;
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __47__SHSheetCustomSceneViewController__setupScene__block_invoke_2;
    v20[3] = &unk_1E40020F0;
    v20[4] = self;
    -[FBScene configureParameters:](v10, "configureParameters:", v20);
    -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createPresenterWithIdentifier:", CFSTR("default"));
    v12 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = v12;

    -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_19);
    -[UIScenePresenter activate](self->_scenePresenter, "activate");
    -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
    v14 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[SHSheetCustomSceneViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSubview:atIndex:", v14, 0);

    -[SHSheetCustomSceneViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");

    -[UIView setClipsToBounds:](v14, "setClipsToBounds:", 1);
    -[UIView layer](v14, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setName:", CFSTR("Scene View"));

    sceneView = self->_sceneView;
    self->_sceneView = v14;

    scene = self->_scene;
  }
  -[FBScene activateWithTransitionContext:](scene, "activateWithTransitionContext:", 0);

}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  +[FBSSceneSpecification specification](SHSheetSceneSpecification, "specification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpecification:", v5);

  v6 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(*(id *)(a1 + 40), "processIdentity");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityForProcessIdentity:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentity:", v7);

}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__SHSheetCustomSceneViewController__setupScene__block_invoke_3;
  v3[3] = &unk_1E40020C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = a2;
  objc_msgSend(v2, "updateSettingsWithBlock:", v3);
  objc_msgSend(v2, "updateClientSettingsWithBlock:", &__block_literal_global_14_0);

}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "setInterfaceOrientation:", 1);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)getFBDisplayManagerClass_softClass_0;
  v12 = getFBDisplayManagerClass_softClass_0;
  if (!getFBDisplayManagerClass_softClass_0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getFBDisplayManagerClass_block_invoke_0;
    v8[3] = &unk_1E4001370;
    v8[4] = &v9;
    __getFBDisplayManagerClass_block_invoke_0((uint64_t)v8);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v6, "mainConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayConfiguration:", v7);

  objc_msgSend(v3, "setForeground:", 1);
}

uint64_t __47__SHSheetCustomSceneViewController__setupScene__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredInterfaceOrientation:", 1);
}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", 0);
  objc_msgSend(v2, "setBackgroundColorWhileNotHosting:", 0);

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  FBScene *v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (FBScene *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_scene == v6)
  {
    if (v7)
    {
      share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "sceneDidDeactivate error:%@", (uint8_t *)&v10, 0xCu);
      }

    }
    -[SHSheetCustomSceneViewController _setupScene](self, "_setupScene");
  }

}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
}

@end
