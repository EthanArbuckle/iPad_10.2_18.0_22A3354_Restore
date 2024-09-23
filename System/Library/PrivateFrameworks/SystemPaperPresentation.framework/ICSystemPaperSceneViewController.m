@implementation ICSystemPaperSceneViewController

+ (void)presentSystemPaperWithUserActivityData:(id)a3 presenter:(id)a4 completion:(id)a5
{
  +[ICSystemPaperPresenter presentSystemPaperWithUserActivityData:presentingViewController:completion:](ICSystemPaperPresenter, "presentSystemPaperWithUserActivityData:presentingViewController:completion:", a3, a4, a5);
}

- (ICSystemPaperSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[ICSystemPaperSceneViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (ICSystemPaperSceneViewController)initWithCoder:(id)a3
{
  -[ICSystemPaperSceneViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICSystemPaperSceneViewController)initWithUserActivityData:(id)a3
{
  id v4;
  ICSystemPaperSceneViewController *v5;
  uint64_t v6;
  NSData *userActivityData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSystemPaperSceneViewController;
  v5 = -[ICSystemPaperSceneViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *sceneContainerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)ICSystemPaperSceneViewController;
  -[ICSystemPaperSceneViewController viewDidLoad](&v28, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[ICSystemPaperSceneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  sceneContainerView = self->_sceneContainerView;
  self->_sceneContainerView = v5;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sceneContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICSystemPaperSceneViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_sceneContainerView);

  v20 = (void *)MEMORY[0x24BDD1628];
  -[UIView leadingAnchor](self->_sceneContainerView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSystemPaperSceneViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  -[UIView trailingAnchor](self->_sceneContainerView, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSystemPaperSceneViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v19;
  -[UIView topAnchor](self->_sceneContainerView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSystemPaperSceneViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v11;
  -[UIView bottomAnchor](self->_sceneContainerView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSystemPaperSceneViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v16);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSystemPaperSceneViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  -[ICSystemPaperSceneViewController registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSystemPaperSceneViewController;
  -[ICSystemPaperSceneViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_visible = 1;
  -[ICSystemPaperSceneViewController _update](self, "_update");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSystemPaperSceneViewController;
  -[ICSystemPaperSceneViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_visible = 0;
  -[ICSystemPaperSceneViewController invalidate](self, "invalidate");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(v7, "containerView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v17;
  }
  else
  {
    objc_msgSend(v17, "window");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend(v8, "_toWindowOrientation");
    -[UIScene _synchronizedDrawingFence](self->_uiParentScene, "_synchronizedDrawingFence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BE38008];
    objc_msgSend(v7, "transitionDuration");
    objc_msgSend(v12, "settingsWithDuration:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v10, v13, v11, width, height);

  }
  else
  {
    v14 = -[ICSystemPaperSceneViewController interfaceOrientation](self, "interfaceOrientation");
    -[ICSystemPaperSceneViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v14, 0, 0, v15, v16);
  }

  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global, &__block_literal_global_14);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperSceneViewController;
  -[ICSystemPaperSceneViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[ICSystemPaperSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", -[ICSystemPaperSceneViewController interfaceOrientation](self, "interfaceOrientation"), 0, 0, v4, v5);

}

- (int64_t)contentState
{
  return -[FBScene contentState](self->_scene, "contentState");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICSystemPaperSceneViewController;
  -[ICSystemPaperSceneViewController dealloc](&v2, sel_dealloc);
}

- (void)invalidate
{
  _BOOL4 invalidated;
  int v4;
  ICSystemPaperSceneViewController *v5;
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
      _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: invalidated is now %{BOOL}i", (uint8_t *)&v4, 0x12u);
    }
    -[ICSystemPaperSceneViewController _teardown](self, "_teardown");
  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 active;
  int v6;
  ICSystemPaperSceneViewController *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  if (self->_active != v3)
  {
    self->_active = v3;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      active = self->_active;
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = active;
      _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: active is now %{BOOL}i", (uint8_t *)&v6, 0x12u);
    }
    -[ICSystemPaperSceneViewController _update](self, "_update");
  }
}

- (void)_teardown
{
  UIScenePresenter *scenePresenter;
  UIScenePresenter *v4;
  void *v5;
  void *v6;
  FBScene *scene;
  int v8;
  ICSystemPaperSceneViewController *v9;
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
      _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: invalidating scene %@", (uint8_t *)&v8, 0x16u);

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
  double v4;
  double v5;
  void *v6;
  UIScenePresenter *v7;
  UIScenePresenter *scenePresenter;
  UIView *sceneContainerView;
  id v10;

  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[ICSystemPaperSceneViewController _adjustParentScene](self, "_adjustParentScene");
    -[ICSystemPaperSceneViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", -[ICSystemPaperSceneViewController interfaceOrientation](self, "interfaceOrientation"), 0, 0, v4, v5);

    if (!self->_scenePresenter)
    {
      -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createPresenterWithIdentifier:", CFSTR("QuickNote"));
      v7 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v7;

      -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_22);
      -[UIScenePresenter activate](self->_scenePresenter, "activate");
      sceneContainerView = self->_sceneContainerView;
      -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](sceneContainerView, "addSubview:", v10);

    }
  }
}

void __43__ICSystemPaperSceneViewController__update__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 0);

}

- (void)_adjustParentScene
{
  void *v3;
  void *v4;
  UIScene *v5;
  UIScene **p_uiParentScene;
  UIScene *uiParentScene;
  UIScene *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  UIScene *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[ICSystemPaperSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (UIScene *)objc_claimAutoreleasedReturnValue();

  p_uiParentScene = &self->_uiParentScene;
  uiParentScene = self->_uiParentScene;
  if (uiParentScene != v5)
  {
    if (v5)
    {
      objc_storeStrong((id *)&self->_uiParentScene, v5);
      v8 = *p_uiParentScene;
      v15[0] = self;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScene _registerSettingsDiffActionArray:forKey:](v8, "_registerSettingsDiffActionArray:forKey:", v9, v11);

    }
    else
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScene _unregisterSettingsDiffActionArrayForKey:](uiParentScene, "_unregisterSettingsDiffActionArrayForKey:", v13);

      v14 = *p_uiParentScene;
      *p_uiParentScene = 0;

    }
  }

}

- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  double height;
  double width;
  unint64_t v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  __int16 v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  FBScene *scene;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  FBScene *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  int64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  FBScene *v41;
  FBScene *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  _BOOL4 active;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  int v57;
  FBScene *v58;
  void *v59;
  id v60;
  __int16 v61;
  id v62;
  _QWORD v63[4];
  id v64;
  uint8_t buf[4];
  ICSystemPaperSceneViewController *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  height = a3.height;
  width = a3.width;
  v71 = *MEMORY[0x24BDAC8D0];
  v11 = (unint64_t)a5;
  v12 = (unint64_t)a6;
  if ((unint64_t)(a4 - 3) >= 2)
    v13 = height;
  else
    v13 = width;
  if ((unint64_t)(a4 - 3) >= 2)
    height = width;
  -[UIScene _FBSScene](self->_uiParentScene, "_FBSScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "deactivationReasons");

  if (!(v11 | v12))
  {
    -[ICSystemPaperSceneViewController userActivityData](self, "userActivityData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v62 = 0;
      goto LABEL_15;
    }
  }
  v18 = objc_alloc_init(MEMORY[0x24BDF6830]);
  objc_msgSend(v18, "setAnimationSettings:", v11);
  objc_msgSend(v18, "setAnimationFence:", v12);
  -[ICSystemPaperSceneViewController userActivityData](self, "userActivityData");
  v19 = objc_claimAutoreleasedReturnValue();
  v62 = v18;
  if (!v19)
    goto LABEL_15;
  v20 = (void *)v19;
  scene = self->_scene;
  if (!scene)
  {

    goto LABEL_13;
  }
  v22 = -[FBScene isActive](scene, "isActive");

  if ((v22 & 1) == 0)
  {
LABEL_13:
    -[ICSystemPaperSceneViewController userActivityData](self, "userActivityData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSystemPaperSceneViewController uiActivityContinuationActionForUserActivityData:](self, "uiActivityContinuationActionForUserActivityData:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActions:", v25);

  }
LABEL_15:
  v26 = self->_scene;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BE38098], "definition");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BE380E0];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v61 = v16;
    v29 = v11;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = a4;
    v32 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.mobilenotes"), "stringByAppendingString:", CFSTR(".QuickNote"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identityForIdentifier:workspaceIdentifier:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setIdentity:", v35);

    v12 = v32;
    a4 = v31;

    v11 = v29;
    v16 = v61;
    v36 = (void *)MEMORY[0x24BE380D0];
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.mobilenotes"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "identityForProcessIdentity:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClientIdentity:", v38);

    -[objc_class specification](NSClassFromString(CFSTR("SBSUISystemNotesSceneSpecification")), "specification");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSpecification:", v39);

    objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "createSceneWithDefinition:", v27);
    v41 = (FBScene *)objc_claimAutoreleasedReturnValue();
    v42 = self->_scene;
    self->_scene = v41;

    -[FBScene setDelegate:](self->_scene, "setDelegate:", self);
    v26 = self->_scene;
  }
  v43 = v16 & 0x100;
  -[FBScene settings](v26, "settings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");

  objc_msgSend(v45, "setInterfaceOrientation:", a4);
  if (self->_visible)
  {
    active = self->_active;
    v47 = self->_active;
    if (objc_msgSend(v45, "isForeground") == v47)
      goto LABEL_25;
  }
  else
  {
    if ((objc_msgSend(v45, "isForeground") & 1) == 0)
      goto LABEL_25;
    active = 0;
    v47 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene identityToken](self->_scene, "identityToken");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v66 = self;
    v67 = 1024;
    v68 = active;
    v69 = 2112;
    v70 = v49;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: foreground changed to %{BOOL}i on %@", buf, 0x1Cu);

  }
  objc_msgSend(v45, "setForeground:", v47);
LABEL_25:
  -[ICSystemPaperSceneViewController _screen](self, "_screen");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "displayConfiguration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setDisplayConfiguration:", v51);

  objc_msgSend(v45, "setFrame:", 0.0, 0.0, height, v13);
  -[ICSystemPaperSceneViewController traitCollection](self, "traitCollection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setUserInterfaceStyle:", objc_msgSend(v52, "userInterfaceStyle"));

  -[ICSystemPaperSceneViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "safeAreaInsets");
  objc_msgSend(v45, "setSafeAreaInsetsPortrait:");

  v54 = objc_msgSend(v45, "deactivationReasons") & 0xFFFFFFFFFFFFFEFFLL | v43;
  if (objc_msgSend(v45, "deactivationReasons") != v54)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identityToken](self->_scene, "identityToken");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v66 = self;
      v67 = 1024;
      v68 = v43 >> 8;
      v69 = 2112;
      v70 = v56;
      _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: keyboardSuppression changed to %{BOOL}i on %@", buf, 0x1Cu);

    }
    objc_msgSend(v45, "setDeactivationReasons:", v54);
  }
  v57 = -[FBScene isActive](self->_scene, "isActive");
  v58 = self->_scene;
  if (v57)
  {
    v59 = v62;
    -[FBScene updateSettings:withTransitionContext:](self->_scene, "updateSettings:withTransitionContext:", v45, v62);
  }
  else
  {
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __95__ICSystemPaperSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
    v63[3] = &unk_24F964120;
    v60 = v45;
    v64 = v60;
    -[FBScene configureParameters:](v58, "configureParameters:", v63);
    if (objc_msgSend(v60, "isForeground"))
      -[FBScene activateWithTransitionContext:](self->_scene, "activateWithTransitionContext:", v62);

    v59 = v62;
  }

}

uint64_t __95__ICSystemPaperSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSettings:", *(_QWORD *)(a1 + 32));
}

- (void)_updateSceneUIApplicationSceneSettingsWithBlock:(id)a3
{
  id v4;
  FBScene *scene;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__ICSystemPaperSceneViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke;
  v7[3] = &unk_24F964148;
  v8 = v4;
  v6 = v4;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v7);

}

void __84__ICSystemPaperSceneViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "#sceneHosting Expected scene's settings to be UIMutableApplicationSceneSettings, but they weren't {actualClass: %@}", (uint8_t *)&v5, 0xCu);

  }
}

- (void)_updateSceneSafeAreaInsets
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  _QWORD v13[8];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;
  UIEdgeInsets v17;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ICSystemPaperSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v17.top = v5;
    v17.left = v7;
    v17.bottom = v9;
    v17.right = v11;
    NSStringFromUIEdgeInsets(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "#sceneHosting Updating scene's safe area insets {newSafeAreaInsets: %@}", buf, 0xCu);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__ICSystemPaperSceneViewController__updateSceneSafeAreaInsets__block_invoke;
  v13[3] = &__block_descriptor_64_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  *(CGFloat *)&v13[4] = v5;
  *(CGFloat *)&v13[5] = v7;
  *(CGFloat *)&v13[6] = v9;
  *(CGFloat *)&v13[7] = v11;
  -[ICSystemPaperSceneViewController _updateSceneUIApplicationSceneSettingsWithBlock:](self, "_updateSceneUIApplicationSceneSettingsWithBlock:", v13);
}

uint64_t __62__ICSystemPaperSceneViewController__updateSceneSafeAreaInsets__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setSafeAreaInsetsPortrait:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSystemPaperSceneViewController;
  -[ICSystemPaperSceneViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[ICSystemPaperSceneViewController _updateSceneSafeAreaInsets](self, "_updateSceneSafeAreaInsets");
}

- (void)_updateSceneUserInterfaceStyle
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __66__ICSystemPaperSceneViewController__updateSceneUserInterfaceStyle__block_invoke;
  v2[3] = &unk_24F964190;
  v2[4] = self;
  -[ICSystemPaperSceneViewController _updateSceneUIApplicationSceneSettingsWithBlock:](self, "_updateSceneUIApplicationSceneSettingsWithBlock:", v2);
}

void __66__ICSystemPaperSceneViewController__updateSceneUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  ICSystemPaperSceneViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v25 = self;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did receive actions %@", buf, 0x20u);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    v14 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "dismissalReason");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = self;
            v26 = 2114;
            v27 = v17;
            _os_log_impl(&dword_22D8F4000, v14, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: dismiss for reason: %{public}@", buf, 0x16u);

          }
          -[ICSystemPaperSceneViewController presentingViewController](self, "presentingViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, 0);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  ICSystemPaperSceneViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = a3;
    objc_msgSend(v5, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentState");

    NSStringFromFBSceneContentState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did change content state to %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)sceneDidActivate:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  ICSystemPaperSceneViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "identityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did activate", (uint8_t *)&v7, 0x16u);

  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  ICSystemPaperSceneViewController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = self;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did deactivate with error %@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE37FF8]))
  {
    v11 = objc_msgSend(v7, "code");

    if (v11 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identityToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218498;
        v17 = self;
        v18 = 2112;
        v19 = v13;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did deactivate with fatal error %@", (uint8_t *)&v16, 0x20u);

      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = self;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did deactivate with transient error %@", (uint8_t *)&v16, 0x20u);

  }
  -[ICSystemPaperSceneViewController _update](self, "_update");
LABEL_11:

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  ICSystemPaperSceneViewController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = a6;
    v11 = a4;
    objc_msgSend(a3, "identityToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 134218754;
    v15 = self;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_22D8F4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did update client settings with diff %@, transition %@", (uint8_t *)&v14, 0x2Au);

  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10;
  void *v11;

  v10 = a6;
  objc_msgSend(a4, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivationReasons");

  objc_msgSend(v10, "deactivationReasons");
  if ((BSEqualBools() & 1) == 0)
    -[ICSystemPaperSceneViewController _update](self, "_update");
}

- (void)createLinkWithUserActivityData:(id)a3
{
  FBScene *scene;
  void *v5;
  id v6;

  -[ICSystemPaperSceneViewController uiActivityContinuationActionForUserActivityData:](self, "uiActivityContinuationActionForUserActivityData:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene sendActions:](scene, "sendActions:", v5);

}

- (id)uiActivityContinuationActionForUserActivityData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1960];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithUserActivityData:", v4);
  v6 = objc_alloc(MEMORY[0x24BDF67C8]);
  v14[0] = v4;
  v13[0] = &unk_24F9659C0;
  v13[1] = &unk_24F9659D8;
  objc_msgSend(v5, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = &unk_24F9659F0;
  objc_msgSend(v5, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = &unk_24F965A08;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v6, "initWithSettings:", v10);
  return v11;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[ICSystemPaperSceneViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel__updateSceneUserInterfaceStyle);

}

- (BOOL)isActive
{
  return self->_active;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_uiParentScene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneContainerView, 0);
}

@end
