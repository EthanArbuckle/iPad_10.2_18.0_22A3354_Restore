@implementation SHSheetSceneViewController

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 1;
}

- (SHSheetSceneViewController)initWithSession:(id)a3
{
  id v5;
  SHSheetSceneViewController *v6;
  SHSheetSceneViewController *v7;
  uint64_t v8;
  SHSheetScene *scene;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHSheetSceneViewController;
  v6 = -[SHSheetSceneViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_msgSend(v5, "remoteScene");
    v8 = objc_claimAutoreleasedReturnValue();
    scene = v7->_scene;
    v7->_scene = (SHSheetScene *)v8;

    -[SHSheetScene setDelegate:](v7->_scene, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__willEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__sceneWillEnterForeground_, *MEMORY[0x1E0DC5338], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5338], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5318], 0);

  -[SHSheetSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v7.receiver = self;
  v7.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController dealloc](&v7, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[SHSheetSceneViewController _installSceneView](self, "_installSceneView");
  -[SHSheetSceneViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__SHSheetSceneViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E4001608;
  v8 = v4;
  v5 = v4;
  -[SHSheetSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFenceCompletionHandler:", v7);

}

uint64_t __41__SHSheetSceneViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readyToInteract");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[SHSheetSceneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unregisterSettingsDiffActionArrayForKey:", CFSTR("SHSheetSceneViewControllerSceneSettingsDiffAction"));

}

- (void)viewIsAppearing:(BOOL)a3
{
  SHSheetSceneSettingsDiffAction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController viewIsAppearing:](&v18, sel_viewIsAppearing_, a3);
  v4 = objc_alloc_init(SHSheetSceneSettingsDiffAction);
  -[SHSheetSceneSettingsDiffAction setDelegate:](v4, "setDelegate:", self);
  -[SHSheetSceneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_registerSettingsDiffActionArray:forKey:", v8, CFSTR("SHSheetSceneViewControllerSceneSettingsDiffAction"));

  -[SHSheetSceneViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SHSheetSceneViewController _hostProcessType](self, "_hostProcessType");
  -[SHSheetSceneViewController scene](self, "scene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__SHSheetSceneViewController_viewIsAppearing___block_invoke;
  v15[3] = &unk_1E40033B8;
  v15[4] = self;
  v16 = v11;
  v17 = v12;
  v14 = v11;
  objc_msgSend(v13, "updateWithChange:", v15);

}

void __46__SHSheetSceneViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  *a3 = 1;
  v4 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v4, "_framePortrait");
  objc_msgSend(v7, "setFramePortrait:");
  objc_msgSend(*(id *)(a1 + 32), "_safeAreaInsetsPortrait");
  objc_msgSend(v7, "setSafeAreaInsetsPortrait:");
  objc_msgSend(v7, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"));
  objc_msgSend(*(id *)(a1 + 40), "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayConfiguration:", v6);

  objc_msgSend(v7, "setHostProcessType:", *(_QWORD *)(a1 + 48));
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  -[SHSheetSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SHSheetSceneViewController scene](self, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SHSheetSceneViewController_viewDidLayoutSubviews__block_invoke;
    v7[3] = &unk_1E40033E0;
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v6, "updateWithChange:", v7);

  }
}

void __51__SHSheetSceneViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_framePortrait");
  objc_msgSend(v4, "setFramePortrait:");
  objc_msgSend(v4, "setPresentationStyle:", SHSheetPresentationControllerPresentationStyle(*(void **)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "_safeAreaInsetsPortrait");
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"));
  objc_msgSend(*(id *)(a1 + 40), "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v6);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[SHSheetSceneViewController scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SHSheetSceneViewController_traitCollectionDidChange___block_invoke;
  v5[3] = &unk_1E4002198;
  v5[4] = self;
  objc_msgSend(v4, "updateWithChange:", v5);

}

void __55__SHSheetSceneViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
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

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSheetSceneViewController;
  -[SHSheetSceneViewController viewSafeAreaInsetsDidChange](&v5, sel_viewSafeAreaInsetsDidChange);
  -[SHSheetSceneViewController scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SHSheetSceneViewController_viewSafeAreaInsetsDidChange__block_invoke;
  v4[3] = &unk_1E4002198;
  v4[4] = self;
  objc_msgSend(v3, "updateWithChange:", v4);

}

void __57__SHSheetSceneViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_safeAreaInsetsPortrait");
  objc_msgSend(v3, "setSafeAreaInsetsPortrait:");

}

- (void)_installSceneView
{
  void *v3;
  UIView **p_sceneView;
  UIView *sceneView;
  void *v6;
  void *v7;
  UIView *obj;

  -[SHSheetSceneViewController scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneView");
  obj = (UIView *)objc_claimAutoreleasedReturnValue();

  p_sceneView = &self->_sceneView;
  sceneView = self->_sceneView;
  if (sceneView != obj)
  {
    -[UIView removeFromSuperview](sceneView, "removeFromSuperview");
    -[SHSheetSceneViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", obj);

    -[UIView setClipsToBounds:](obj, "setClipsToBounds:", 1);
    -[UIView layer](obj, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("SHSheetSceneView"));

    objc_storeStrong((id *)p_sceneView, obj);
  }

}

- (CGRect)_framePortrait
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[SHSheetSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetSceneViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_msgSend(v5, "interfaceOrientation");
  if ((unint64_t)(v15 - 3) >= 2)
    v16 = v14;
  else
    v16 = v12;
  if ((unint64_t)(v15 - 3) < 2)
    v12 = v14;

  v17 = v8;
  v18 = v10;
  v19 = v12;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (UIEdgeInsets)_safeAreaInsetsPortrait
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  -[SHSheetSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetSceneViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 1)
    goto LABEL_6;
  v17 = objc_msgSend(v5, "interfaceOrientation");
  if (v17 == 2)
  {
    v18 = v10;
    v19 = v8;
    v20 = v14;
    v14 = v12;
    goto LABEL_7;
  }
  if (v17 == 3)
  {
    v18 = v8;
    v19 = v14;
    v20 = v12;
    v14 = v10;
    goto LABEL_7;
  }
  if (v17 != 4)
  {
LABEL_6:
    v18 = v14;
    v19 = v12;
    v20 = v10;
    v14 = v8;
  }
  else
  {
    v18 = v12;
    v19 = v10;
    v20 = v8;
  }
LABEL_7:

  v21 = v14;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)sceneSettingsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[SHSheetSceneViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SHSheetSceneViewController scene](self, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__SHSheetSceneViewController_sceneSettingsDidChange___block_invoke;
    v7[3] = &unk_1E4002198;
    v7[4] = self;
    objc_msgSend(v6, "updateWithChange:", v7);

  }
}

void __53__SHSheetSceneViewController_sceneSettingsDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v11);

}

- (void)_willEnterForeground:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SHSheetSceneViewController scene](self, "scene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if ((v5 & 1) == 0)
  {
    -[SHSheetSceneViewController scene](self, "scene");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activate");

  }
}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SHSheetSceneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
    {
      -[SHSheetSceneViewController scene](self, "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateWithChange:", &__block_literal_global_32);

    }
  }

}

uint64_t __56__SHSheetSceneViewController__sceneWillEnterForeground___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 1);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[5];

  v4 = a3;
  -[SHSheetSceneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v7)
    {
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __55__SHSheetSceneViewController__sceneDidEnterBackground___block_invoke;
        v10[3] = &unk_1E4001608;
        v10[4] = self;
        objc_msgSend(v7, "_performAfterSystemSnapshotsComplete:", v10);
      }
    }
    else
    {

    }
  }

}

void __55__SHSheetSceneViewController__sceneDidEnterBackground___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "scene");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithChange:", &__block_literal_global_29_0);

}

uint64_t __55__SHSheetSceneViewController__sceneDidEnterBackground___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

- (int64_t)_hostProcessType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[SHSheetSceneViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[SHSheetSceneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 2;
  else
    return 1;
}

- (void)scene:(id)a3 didReceiveAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v5, "type");
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "did receive action with type:%ld", (uint8_t *)&v11, 0xCu);
  }

  switch(objc_msgSend(v5, "type"))
  {
    case 0:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleCustomHeaderButton");
      goto LABEL_13;
    case 1:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleOptions");
      goto LABEL_13;
    case 2:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleCollaborationOptions");
      goto LABEL_13;
    case 3:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSelectCollaborativeAction");
      goto LABEL_13;
    case 4:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSelectSendCopyAction");
      goto LABEL_13;
    case 5:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleClose");
      goto LABEL_13;
    case 6:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleActionsEdit");
      goto LABEL_13;
    case 7:
      -[SHSheetSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleNext");
      goto LABEL_13;
    case 8:
      -[SHSheetSceneViewController session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

LABEL_13:
      break;
    case 9:
      -[SHSheetSceneViewController currentTest](self, "currentTest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "completionHandler");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();

      -[SHSheetSceneViewController setCurrentTest:](self, "setCurrentTest:", 0);
      break;
    default:
      break;
  }

}

- (id)_hostSheetPresentationController
{
  void *v3;
  void *v4;
  void *v5;

  -[SHSheetSceneViewController sheetPresentationController](self, "sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SHSheetSceneViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)scene:(id)a3 didReceiveMetadataUpdateAction:(id)a4
{
  id v5;

  objc_msgSend(a4, "metadata", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetSceneViewController setRemoteHeaderMetadata:](self, "setRemoteHeaderMetadata:", v5);

}

- (void)scene:(id)a3 didReceiveSuggestionAction:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SHSheetSceneViewController presenter](self, "presenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "handleInfoSuggestionPress:", v6);
}

- (void)scene:(id)a3 didReceiveDraggingAction:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v5 = a4;
  -[SHSheetSceneViewController _hostSheetPresentationController](self, "_hostSheetPresentationController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggingEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "type");
  switch(v7)
  {
    case 2:
      objc_msgSend(v19, "_remoteSheetInteractionDraggingDidEnd");
      break;
    case 1:
      objc_msgSend(v6, "translation");
      v14 = v13;
      v16 = v15;
      objc_msgSend(v6, "velocity");
      objc_msgSend(v19, "_remoteSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", objc_msgSend(v6, "shouldAnimate"), objc_msgSend(v6, "dismissible"), v14, v16, v17, v18);
      break;
    case 0:
      objc_msgSend(v6, "rubberBandCoefficient");
      v9 = v8;
      v10 = objc_msgSend(v6, "dismissible");
      objc_msgSend(v6, "interruptedOffset");
      objc_msgSend(v19, "_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v10, v9, v11, v12);
      break;
  }

}

- (void)updateWithViewModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[SHSheetSceneViewController session](self, "session", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createClientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SHSheetSceneViewController_updateWithViewModel___block_invoke;
  v8[3] = &unk_1E4002198;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateWithChange:", v8);

}

uint64_t __50__SHSheetSceneViewController_updateWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSessionContext:", *(_QWORD *)(a1 + 32));
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4;
  void *v5;
  SHSheetAirDropTransferUpdateAction *v6;

  v4 = a3;
  v6 = -[SHSheetAirDropTransferUpdateAction initWithAirDropTransferChange:]([SHSheetAirDropTransferUpdateAction alloc], "initWithAirDropTransferChange:", v4);

  -[SHSheetSceneViewController scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAction:", v6);

}

- (void)reloadMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SHSheetSceneViewController_reloadMetadata___block_invoke;
  v7[3] = &unk_1E4001270;
  v7[4] = self;
  softLinkSFUILinkMetadataSerializationForLocalUseOnly_0(v6, v7);

}

void __45__SHSheetSceneViewController_reloadMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  sf_dispatch_on_main_queue();

}

void __45__SHSheetSceneViewController_reloadMetadata___block_invoke_2(uint64_t a1)
{
  SHSheetMetadataChangedAction *v2;
  void *v3;
  void *v4;
  SHSheetMetadataChangedAction *v5;

  v2 = [SHSheetMetadataChangedAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHSheetMetadataChangedAction initWithSerializedMetadata:](v2, "initWithSerializedMetadata:", v3);

  objc_msgSend(*(id *)(a1 + 40), "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAction:", v5);

}

- (void)reloadContent
{
  void *v3;
  SHSheetContentReloadAction *v4;

  v4 = -[SHSheetContentReloadAction initWithActivityUUID:]([SHSheetContentReloadAction alloc], "initWithActivityUUID:", 0);
  -[SHSheetSceneViewController scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:", v4);

}

- (void)reloadActivity:(id)a3
{
  id v4;
  SHSheetContentReloadAction *v5;
  void *v6;
  void *v7;
  SHSheetContentReloadAction *v8;

  v4 = a3;
  v5 = [SHSheetContentReloadAction alloc];
  objc_msgSend(v4, "activityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SHSheetContentReloadAction initWithActivityUUID:](v5, "initWithActivityUUID:", v6);
  -[SHSheetSceneViewController scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendAction:", v8);

}

- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4
{
  id v6;
  void *v7;
  SHSheetPulsingAction *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "activityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetPulsingEvent startPulsingEventWithActivityUUID:localizedTitle:](SHSheetPulsingEvent, "startPulsingEventWithActivityUUID:localizedTitle:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[SHSheetPulsingAction initWithEvent:]([SHSheetPulsingAction alloc], "initWithEvent:", v10);
  -[SHSheetSceneViewController scene](self, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendAction:", v8);

}

- (void)stopPulsingActivity:(id)a3
{
  void *v4;
  SHSheetPulsingAction *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetPulsingEvent stopPulsingEventWithActivityUUID:](SHSheetPulsingEvent, "stopPulsingEventWithActivityUUID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[SHSheetPulsingAction initWithEvent:]([SHSheetPulsingAction alloc], "initWithEvent:", v7);
  -[SHSheetSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAction:", v5);

}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SHSheetScrollingTest *v11;
  NSObject *v12;
  SHSheetScrollingTestAction *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[SHSheetSceneViewController currentTest](self, "currentTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    share_sheet_log();
    v11 = (SHSheetScrollingTest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      -[SHSheetSceneViewController runScrollingTestWithName:type:completionHandler:].cold.1((uint64_t)v8, self, &v11->super);
  }
  else
  {
    v11 = -[SHSheetScrollingTest initWithName:type:completionHandler:]([SHSheetScrollingTest alloc], "initWithName:type:completionHandler:", v8, a4, v9);
    -[SHSheetSceneViewController setCurrentTest:](self, "setCurrentTest:", v11);
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "sending scrolling test action with test name:%@ type:%ld", (uint8_t *)&v15, 0x16u);
    }

    v13 = -[SHSheetScrollingTestAction initWithTest:]([SHSheetScrollingTestAction alloc], "initWithTest:", v11);
    -[SHSheetSceneViewController scene](self, "scene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendAction:", v13);

  }
}

- (SHSheetSession)session
{
  return self->_session;
}

- (SHSheetContentPresenter)presenter
{
  return (SHSheetContentPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (SHSheetScene)scene
{
  return self->_scene;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (LPLinkMetadata)remoteHeaderMetadata
{
  return self->_remoteHeaderMetadata;
}

- (void)setRemoteHeaderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_remoteHeaderMetadata, a3);
}

- (SHSheetScrollingTest)currentTest
{
  return self->_currentTest;
}

- (void)setCurrentTest:(id)a3
{
  objc_storeStrong((id *)&self->_currentTest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTest, 0);
  objc_storeStrong((id *)&self->_remoteHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)runScrollingTestWithName:(uint64_t)a1 type:(void *)a2 completionHandler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "currentTest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_19E419000, a3, OS_LOG_TYPE_ERROR, "request to run scrolling test with name:%@ failed because we already have a running test:%@", (uint8_t *)&v7, 0x16u);

}

@end
