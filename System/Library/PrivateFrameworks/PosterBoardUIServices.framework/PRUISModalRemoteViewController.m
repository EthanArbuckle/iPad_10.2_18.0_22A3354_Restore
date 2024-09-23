@implementation PRUISModalRemoteViewController

- (PRUISModalRemoteViewController)initWithEntryPoint:(id)a3
{
  id v5;
  PRUISModalRemoteViewController *v6;
  PRUISModalRemoteViewController *v7;
  id v8;
  uint64_t v9;
  FBScene *scene;
  NSObject *v11;
  FBScene *v12;
  objc_super v14;
  uint8_t buf[4];
  FBScene *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRUISModalRemoteViewController;
  v6 = -[PRUISModalRemoteViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entryPoint, a3);
    if (_PRUISModalRemoteViewControllerSceneWorkspace_onceToken != -1)
      dispatch_once(&_PRUISModalRemoteViewControllerSceneWorkspace_onceToken, &__block_literal_global_222);
    v8 = (id)_PRUISModalRemoteViewControllerSceneWorkspace_workspace;
    objc_msgSend(v8, "createScene:", &__block_literal_global_13);
    v9 = objc_claimAutoreleasedReturnValue();
    scene = v7->_scene;
    v7->_scene = (FBScene *)v9;

    -[FBScene addExtension:](v7->_scene, "addExtension:", objc_opt_class());
    PRUISLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7->_scene;
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_2445ED000, v11, OS_LOG_TYPE_DEFAULT, "Created new PosterBoard modal scene %{public}@", buf, 0xCu);
    }

    -[FBScene setDelegate:](v7->_scene, "setDelegate:", v7);
  }

  return v7;
}

void __53__PRUISModalRemoteViewController_initWithEntryPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x24BE80C98];
  v3 = a2;
  objc_msgSend(v2, "identityForAngelJobLabel:", CFSTR("com.apple.PosterBoard"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sceneID:com.apple.PosterBoard-modal:"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIdentifier:", v7);
  +[FBSSceneSpecification specification](PRUISModalSceneSpecification, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpecification:", v8);

  objc_msgSend(MEMORY[0x24BE380D0], "identityForProcessIdentity:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentity:", v9);

}

- (void)dealloc
{
  objc_super v3;

  -[PRUISModalRemoteViewController endObservingApplicationLifecycle](self, "endObservingApplicationLifecycle");
  v3.receiver = self;
  v3.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController dealloc](&v3, sel_dealloc);
}

- (id)_defaultDisplayConfigurationWithScreen:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "displayConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    -[PRUISModalRemoteViewController _update](self, "_update");
  }

}

- (FBSDisplayConfiguration)displayConfiguration
{
  FBSDisplayConfiguration *displayConfiguration;
  FBSDisplayConfiguration *v3;
  void *v5;

  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
  {
    v3 = displayConfiguration;
  }
  else
  {
    -[UIWindowScene screen](self->_uiParentScene, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISModalRemoteViewController _defaultDisplayConfigurationWithScreen:](self, "_defaultDisplayConfigurationWithScreen:", v5);
    v3 = (FBSDisplayConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)invalidate
{
  _BOOL4 invalidated;
  int v4;
  PRUISModalRemoteViewController *v5;
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      invalidated = self->_invalidated;
      v4 = 134218240;
      v5 = self;
      v6 = 1024;
      v7 = invalidated;
      _os_log_impl(&dword_2445ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "PosterBoard modal-%p: invalidated is now %{BOOL}i", (uint8_t *)&v4, 0x12u);
    }
    -[PRUISModalRemoteViewController _teardown](self, "_teardown");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PRUISModalRemoteViewController _update](self, "_update");
  -[PRUISModalRemoteViewController startObservingApplicationLifecycle](self, "startObservingApplicationLifecycle");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRUISModalRemoteViewController _update](self, "_update");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PRUISModalRemoteViewController _update](self, "_update");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PRUISModalRemoteViewController _update](self, "_update");
  -[PRUISModalRemoteViewController endObservingApplicationLifecycle](self, "endObservingApplicationLifecycle");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PRUISModalRemoteViewController _update](self, "_update");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[PRUISModalRemoteViewController _update](self, "_update");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRUISModalRemoteViewController;
  v4 = a3;
  -[PRUISModalRemoteViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PRUISModalRemoteViewController traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PRUISModalRemoteViewController _update](self, "_update");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  height = a3.height;
  width = a3.width;
  v20 = a4;
  objc_msgSend(v20, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v7, "window");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[PRUISModalRemoteViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "interfaceOrientation");

  if (v20)
  {
    v14 = objc_msgSend(v9, "_toWindowOrientation");
    -[UIWindowScene _synchronizedDrawingFence](self->_uiParentScene, "_synchronizedDrawingFence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BE0BD98];
    objc_msgSend(v20, "transitionDuration");
    objc_msgSend(v16, "settingsWithDuration:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISModalRemoteViewController _configureSceneIfNeededWithParentWindow:](self, "_configureSceneIfNeededWithParentWindow:", v9);
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v14, v17, v15, width, height);

  }
  else
  {
    -[PRUISModalRemoteViewController _configureSceneIfNeededWithParentWindow:](self, "_configureSceneIfNeededWithParentWindow:", v9);
    -[PRUISModalRemoteViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v13, 0, 0, v18, v19);
  }

}

- (BOOL)prefersStatusBarHidden
{
  return self->_presentedPrefersStatusBarHidden;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[PRUISModalRemoteViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)_teardown
{
  UIScenePresenter *scenePresenter;
  UIScenePresenter *v4;
  void *v5;
  void *v6;
  FBScene *scene;
  int v8;
  PRUISModalRemoteViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    -[UIScenePresenter invalidate](scenePresenter, "invalidate");
    v4 = self->_scenePresenter;
    self->_scenePresenter = 0;

  }
  if (self->_scene)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identityToken](self->_scene, "identityToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2445ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "PosterBoard modal-%p: invalidating scene %@", (uint8_t *)&v8, 0x16u);

    }
    -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
    -[FBScene invalidate](self->_scene, "invalidate");
    scene = self->_scene;
    self->_scene = 0;

  }
}

- (void)_update
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  UIScenePresenter *scenePresenter;
  void *v9;
  objc_class *v10;
  void *v11;
  UIScenePresenter *v12;
  UIScenePresenter *v13;
  NSObject *v14;
  void *v15;
  UIScenePresentation *scenePresentationView;
  UIScenePresenter *v17;
  uint8_t v18[16];

  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[PRUISModalRemoteViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISModalRemoteViewController _configureSceneIfNeededWithParentWindow:](self, "_configureSceneIfNeededWithParentWindow:", v4);
    v5 = objc_msgSend(v4, "_windowInterfaceOrientation");
    objc_msgSend(v3, "bounds");
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v5, 0, 0, v6, v7);
    scenePresenter = self->_scenePresenter;
    if (v4)
    {
      if (!scenePresenter)
      {
        -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createPresenterWithIdentifier:", v11);
        v12 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
        v13 = self->_scenePresenter;
        self->_scenePresenter = v12;

        -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_31);
        -[UIScenePresenter activate](self->_scenePresenter, "activate");
        PRUISLogRemoteEditing();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_2445ED000, v14, OS_LOG_TYPE_DEFAULT, "Installing live scene view on scene setup", v18, 2u);
        }

        -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bounds");
        objc_msgSend(v15, "setFrame:");
        objc_msgSend(v15, "setAutoresizingMask:", 18);
        objc_msgSend(v3, "addSubview:", v15);
        objc_msgSend(v3, "sendSubviewToBack:", v15);
        scenePresentationView = self->_scenePresentationView;
        self->_scenePresentationView = (UIScenePresentation *)v15;

      }
    }
    else
    {
      -[UIScenePresenter invalidate](scenePresenter, "invalidate");
      v17 = self->_scenePresenter;
      self->_scenePresenter = 0;

    }
    -[PRUISModalRemoteViewController _updateStatusBarVisibilityWithTransitionContext:](self, "_updateStatusBarVisibilityWithTransitionContext:", 0);

  }
}

void __41__PRUISModalRemoteViewController__update__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRUISModalRemoteViewController;
  -[PRUISModalRemoteViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  if (!self->_invalidated)
  {
    -[PRUISModalRemoteViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_windowInterfaceOrientation");

    objc_msgSend(v3, "bounds");
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v5, 0, 0, v6, v7);

  }
}

- (void)_configureSceneIfNeededWithParentWindow:(id)a3
{
  UIWindowScene *v4;
  UIWindowScene *uiParentScene;
  FBScene *scene;
  _QWORD v7[5];

  if (!self->_didConfigureScene)
  {
    objc_msgSend(a3, "windowScene");
    v4 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
    uiParentScene = self->_uiParentScene;
    self->_uiParentScene = v4;

    if (self->_uiParentScene)
    {
      scene = self->_scene;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke;
      v7[3] = &unk_251535AF0;
      v7[4] = self;
      -[FBScene configureParameters:](scene, "configureParameters:", v7);
      self->_didConfigureScene = 1;
    }
  }
}

uint64_t __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke_2;
  v3[3] = &unk_251535AC8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "updateSettingsWithBlock:", v3);
}

void __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[128];
  v9 = a2;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "_updateCommonModalSceneSettings:withFrame:interfaceOrientation:", v9, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "interfaceOrientation"), v5, v6, v7, v8);

}

- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  FBScene *scene;
  double v14;
  double v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  int64_t v24;

  height = a3.height;
  width = a3.width;
  v16 = a5;
  v11 = a6;
  v12 = v11;
  if (self->_didConfigureScene)
  {
    scene = self->_scene;
    if ((unint64_t)(a4 - 3) >= 2)
      v14 = height;
    else
      v14 = width;
    if ((unint64_t)(a4 - 3) >= 2)
      v15 = width;
    else
      v15 = height;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __93__PRUISModalRemoteViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
    v17[3] = &unk_251535B18;
    v20 = 0;
    v21 = 0;
    v17[4] = self;
    v22 = v15;
    v23 = v14;
    v24 = a4;
    v18 = v11;
    v19 = v16;
    -[FBScene performUpdate:](scene, "performUpdate:", v17);

  }
}

void __93__PRUISModalRemoteViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v6, "setForeground:", objc_msgSend(v5, "_appearState") != 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateCommonModalSceneSettings:withFrame:interfaceOrientation:", v6, *(_QWORD *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_msgSend(v7, "setAnimationFence:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setAnimationSettings:", *(_QWORD *)(a1 + 48));

}

- (void)_updateCommonModalSceneSettings:(id)a3 withFrame:(CGRect)a4 interfaceOrientation:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  objc_msgSend(v15, "setFrame:", x, y, width, height);
  objc_msgSend(v15, "setInterfaceOrientation:", a5);
  -[PRUISModalRemoteViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));

  -[PRUISModalRemoteViewController displayConfiguration](self, "displayConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDisplayConfiguration:", v12);

  objc_msgSend(v15, "setShouldInheritHostDisplayConfiguration:", self->_displayConfiguration != 0);
  objc_msgSend(v15, "setEntryPoint:", self->_entryPoint);
  -[UIWindowScene _FBSScene](self->_uiParentScene, "_FBSScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isUISubclass"))
  {
    objc_msgSend(v14, "defaultStatusBarHeightForOrientation:", a5);
    objc_msgSend(v15, "setDefaultStatusBarHeight:forOrientation:", a5);
  }

}

- (void)_updateStatusBarVisibilityWithTransitionContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  UIWindowScene *uiParentScene;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  -[FBScene clientSettings](self->_scene, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUISubclass"))
  {
    v6 = objc_msgSend(v5, "statusBarHidden");
    if (self->_presentedPrefersStatusBarHidden != v6)
    {
      self->_presentedPrefersStatusBarHidden = v6;
      objc_msgSend(v4, "animationSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "duration");
      v9 = v8;

      if (v9 <= 0.0)
      {
        -[PRUISModalRemoteViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
      }
      else
      {
        uiParentScene = self->_uiParentScene;
        objc_msgSend(v4, "animationFence");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIWindowScene _synchronizeDrawingWithFence:](uiParentScene, "_synchronizeDrawingWithFence:", v11);

        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __82__PRUISModalRemoteViewController__updateStatusBarVisibilityWithTransitionContext___block_invoke;
        v12[3] = &unk_251534F38;
        v12[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v12, v9);
      }
    }
  }

}

uint64_t __82__PRUISModalRemoteViewController__updateStatusBarVisibilityWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)_invokeWillDismissDelegateWithResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PRUISModalRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "modalRemoteViewController:willDismissWithResponse:", self, v5);

}

- (void)_invokeDidDismissDelegateWithResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PRUISModalRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "modalRemoteViewController:didDismissWithResponse:", self, v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "modalRemoteViewControllerDidDismiss:", self);

}

- (void)_invalidateAfterDismissal
{
  PRUISModalEntryPoint *entryPoint;
  uint64_t v4;
  PRUISModalEntryPoint *v5;
  PRUISModalEntryPoint *v6;
  PRUISModalEntryPoint *v7;
  uint64_t v8;
  dispatch_time_t v9;
  _QWORD block[5];

  entryPoint = self->_entryPoint;
  v4 = objc_opt_class();
  v5 = entryPoint;
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

  v8 = -[PRUISModalEntryPoint editingType](v7, "editingType");
  if (v8 == 1)
  {
    v9 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__PRUISModalRemoteViewController__invalidateAfterDismissal__block_invoke;
    block[3] = &unk_251534F38;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[PRUISModalRemoteViewController invalidate](self, "invalidate");
  }
}

uint64_t __59__PRUISModalRemoteViewController__invalidateAfterDismissal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)sendRequestDismissalAction
{
  FBScene *scene;
  void *v3;
  void *v4;
  id v5;

  scene = self->_scene;
  v3 = (void *)MEMORY[0x24BDBCF20];
  +[PRUISRequestDismissalAction actionWithAnimation:](PRUISRequestDismissalAction, "actionWithAnimation:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene sendActions:](scene, "sendActions:", v4);

}

- (void)startObservingApplicationLifecycle
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

}

- (void)endObservingApplicationLifecycle
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);

}

- (void)applicationWillResignActive:(id)a3
{
  PRUISForwardExtensionAppearanceNotificationAction *v4;
  FBScene *scene;
  void *v6;
  PRUISForwardExtensionAppearanceNotificationAction *v7;

  v4 = [PRUISForwardExtensionAppearanceNotificationAction alloc];
  v7 = -[PRUISForwardExtensionAppearanceNotificationAction initWithNotificationName:](v4, "initWithNotificationName:", *MEMORY[0x24BDD0C28]);
  scene = self->_scene;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene sendActions:](scene, "sendActions:", v6);

}

- (void)applicationDidBecomeActive:(id)a3
{
  PRUISForwardExtensionAppearanceNotificationAction *v4;
  FBScene *scene;
  void *v6;
  PRUISForwardExtensionAppearanceNotificationAction *v7;

  v4 = [PRUISForwardExtensionAppearanceNotificationAction alloc];
  v7 = -[PRUISForwardExtensionAppearanceNotificationAction initWithNotificationName:](v4, "initWithNotificationName:", *MEMORY[0x24BDD0C10]);
  scene = self->_scene;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene sendActions:](scene, "sendActions:", v6);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "response");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRUISModalRemoteViewController _invokeWillDismissDelegateWithResponse:](self, "_invokeWillDismissDelegateWithResponse:", v11);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "response");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRUISModalRemoteViewController _invokeDidDismissDelegateWithResponse:](self, "_invokeDidDismissDelegateWithResponse:", v12);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || (objc_msgSend(WeakRetained, "modalRemoteViewController:shouldDeferInvalidation:", self, self) & 1) == 0)
          {
            -[PRUISModalRemoteViewController _invalidateAfterDismissal](self, "_invalidateAfterDismissal");
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  PRUISModalEntryPointResponse *v8;
  int v9;
  PRUISModalRemoteViewController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_scene == a3)
  {
    PRUISLogRemoteEditing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_2445ED000, v7, OS_LOG_TYPE_DEFAULT, "Remote modal controller %p scene did deactivate with error: %@", (uint8_t *)&v9, 0x16u);
    }

    v8 = -[PRUISModalEntryPointResponse initWithResult:]([PRUISModalEntryPointResponse alloc], "initWithResult:", 0);
    -[PRUISModalRemoteViewController _invokeWillDismissDelegateWithResponse:](self, "_invokeWillDismissDelegateWithResponse:", v8);
    -[PRUISModalRemoteViewController _invokeDidDismissDelegateWithResponse:](self, "_invokeDidDismissDelegateWithResponse:", v8);
    -[PRUISModalRemoteViewController _invalidateAfterDismissal](self, "_invalidateAfterDismissal");

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  PRUISModalRemoteViewController *v20;
  id v21;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x24BDF6810];
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __108__PRUISModalRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v19 = &unk_251535B40;
  v20 = self;
  v21 = v9;
  v14 = v9;
  objc_msgSend(v13, "observeStatusBarHiddenWithBlock:", &v16);
  v15 = objc_msgSend(v12, "clientSettings", v16, v17, v18, v19, v20);

  objc_msgSend(v13, "inspectDiff:withContext:", v11, v15);
  objc_msgSend(v13, "removeAllObservers");

}

uint64_t __108__PRUISModalRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarVisibilityWithTransitionContext:", *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)-[PRUISModalRemoteViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PRUISModalRemoteViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PRUISModalRemoteViewController *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__PRUISModalRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_251534BE0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __72__PRUISModalRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  uint64_t v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 992), CFSTR("scenePresenter"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1008), CFSTR("scenePresentationView"));
  v4 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1040);
  if (v4)
    return (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("scene"));
  else
    return (id)objc_msgSend(v5, "appendPointer:withName:", v6, CFSTR("scene"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PRUISModalRemoteViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (PRUISModalRemoteViewControllerDelegate)delegate
{
  return (PRUISModalRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_scenePresentationView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_uiParentScene, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end
