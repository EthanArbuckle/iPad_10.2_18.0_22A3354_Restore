@implementation PPLPeopleEntityViewController

- (PPLPeopleEntityViewController)initWithMetadata:(id)a3
{
  id v4;
  void *v5;
  PPLPeopleEntityViewController *v6;

  v4 = a3;
  +[PPLPeopleAppSceneManager sharedSceneManager](PPLPeopleAppSceneManager, "sharedSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPLPeopleEntityViewController initWithMetadata:sceneManager:](self, "initWithMetadata:sceneManager:", v4, v5);

  return v6;
}

- (PPLPeopleEntityViewController)initWithMetadata:(id)a3 sceneManager:(id)a4
{
  id v7;
  id v8;
  PPLPeopleEntityViewController *v9;
  PPLPeopleEntityViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPLPeopleEntityViewController;
  v9 = -[PPLPeopleEntityViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_sceneManager, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PPLPeopleEntityViewController sceneManager](self, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSceneRequester:", self);

  v6.receiver = self;
  v6.super_class = (Class)PPLPeopleEntityViewController;
  -[PPLPeopleEntityViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PPLPeopleEntityViewController sceneManager](self, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSceneRequester:", self);

  v6.receiver = self;
  v6.super_class = (Class)PPLPeopleEntityViewController;
  -[PPLPeopleEntityViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (CGRect)initialSceneFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PPLPeopleEntityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PPLPeopleEntityViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSURL)personURL
{
  void *v2;
  void *v3;

  -[PPLPeopleEntityViewController metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)sceneManager:(id)a3 didGrantOwnershipOfScene:(id)a4
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
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint8_t buf[16];

  v5 = a4;
  -[PPLPeopleEntityViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PPLPeopleEntityViewController setScene:](self, "setScene:", v5);
    -[PPLPeopleEntityViewController scene](self, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiPresentationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%p"), v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "createPresenterWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPLPeopleEntityViewController setPresenter:](self, "setPresenter:", v12);
    objc_msgSend(v12, "presentationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPLPeopleEntityViewController setHostView:](self, "setHostView:", v13);

    objc_msgSend(v12, "modifyPresentationContext:", &__block_literal_global);
    objc_msgSend(v12, "activate");
    -[PPLPeopleEntityViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPLPeopleEntityViewController hostView](self, "hostView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPLPeopleEntityViewController hostView](self, "hostView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v16);

    -[PPLPeopleEntityViewController hostView](self, "hostView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(v15, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    objc_msgSend(v15, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    objc_msgSend(v15, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    objc_msgSend(v15, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    PPLPeopleViewServiceLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216B10000, v30, OS_LOG_TYPE_DEFAULT, "created scene", buf, 2u);
    }

    -[PPLPeopleEntityViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutIfNeeded");

  }
}

void __71__PPLPeopleEntityViewController_sceneManager_didGrantOwnershipOfScene___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", 0);

}

- (void)sceneManager:(id)a3 didRevokeOwnershipOfScene:(id)a4
{
  void *v5;
  void *v6;

  -[PPLPeopleEntityViewController setScene:](self, "setScene:", 0, a4);
  -[PPLPeopleEntityViewController presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[PPLPeopleEntityViewController setPresenter:](self, "setPresenter:", 0);
  -[PPLPeopleEntityViewController hostView](self, "hostView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[PPLPeopleEntityViewController setHostView:](self, "setHostView:", 0);
}

- (void)sceneManager:(id)a3 sceneDidRequestDismissal:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  PPLPeopleViewServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_216B10000, v5, OS_LOG_TYPE_DEFAULT, "scene requested dismissal", v7, 2u);
  }

  -[PPLPeopleEntityViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "peopleEntityViewControllerDidRequestDismissal:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  _BOOL4 v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  _QWORD v39[12];
  objc_super v40;
  CGRect v41;
  CGRect v42;

  v40.receiver = self;
  v40.super_class = (Class)PPLPeopleEntityViewController;
  -[PPLPeopleEntityViewController viewDidLayoutSubviews](&v40, sel_viewDidLayoutSubviews);
  -[PPLPeopleEntityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PPLPeopleEntityViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:");
  v5 = v4;
  v37 = v6;
  v8 = v7;
  v10 = v9;

  -[PPLPeopleEntityViewController sceneSafeAreaInsetPortrait](self, "sceneSafeAreaInsetPortrait");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v38 = v17;
  -[PPLPeopleEntityViewController scene](self, "scene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPLPeopleEntityViewController safeAreaInsetFromSceneSettings:](self, "safeAreaInsetFromSceneSettings:", v19);
  v21 = v20;
  v23 = v22;
  v35 = v24;
  v36 = v25;

  -[PPLPeopleEntityViewController scene](self, "scene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "settings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v42.origin.x = v28;
  v42.origin.y = v29;
  v42.size.width = v30;
  v42.size.height = v31;
  v41.origin.x = v5;
  v41.origin.y = v37;
  v41.size.width = v8;
  v41.size.height = v10;
  v32 = CGRectEqualToRect(v41, v42);

  if (!v32 || v14 != v23 || v12 != v21 || (v33 = v38, v38 != v36) || (v33 = v35, v16 != v35))
  {
    -[PPLPeopleEntityViewController scene](self, "scene", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __54__PPLPeopleEntityViewController_viewDidLayoutSubviews__block_invoke;
    v39[3] = &__block_descriptor_96_e33_v16__0__FBSMutableSceneSettings_8l;
    *(CGFloat *)&v39[4] = v5;
    *(CGFloat *)&v39[5] = v37;
    *(CGFloat *)&v39[6] = v8;
    *(CGFloat *)&v39[7] = v10;
    *(double *)&v39[8] = v12;
    *(double *)&v39[9] = v14;
    *(double *)&v39[10] = v16;
    *(double *)&v39[11] = v38;
    objc_msgSend(v34, "updateSettingsWithBlock:", v39);

  }
}

void __54__PPLPeopleEntityViewController_viewDidLayoutSubviews__block_invoke(double *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
  if (objc_msgSend(v3, "isUISubclass"))
    objc_msgSend(v3, "setSafeAreaInsetsPortrait:", a1[8], a1[9], a1[10], a1[11]);

}

- (CGRect)sceneSettingsFrameFromRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v12 = CGRectEqualToRect(v17, *MEMORY[0x24BDBF090]);
  if (v12)
    v13 = v9;
  else
    v13 = width;
  if (v12)
    v14 = v11;
  else
    v14 = height;
  v15 = x;
  v16 = y;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (UIEdgeInsets)sceneSafeAreaInsetPortrait
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[PPLPeopleEntityViewController initialSceneFrame](self, "initialSceneFrame");
  v9 = v8;
  v11 = v10;

  if (v5 == v9 && v7 == v11)
  {
    -[PPLPeopleEntityViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_scene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && (objc_msgSend(v20, "isUISubclass") & 1) != 0)
    {
      objc_msgSend(v20, "safeAreaInsetsPortrait");
      v13 = v21;
      v14 = v22;
      v15 = v23;
      v16 = v24;
    }
    else
    {
      v13 = *MEMORY[0x24BDF7718];
      v14 = *(double *)(MEMORY[0x24BDF7718] + 8);
      v15 = *(double *)(MEMORY[0x24BDF7718] + 16);
      v16 = *(double *)(MEMORY[0x24BDF7718] + 24);
    }

  }
  else
  {
    v13 = *MEMORY[0x24BDF7718];
    v14 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v15 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v16 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (UIEdgeInsets)safeAreaInsetFromSceneSettings:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = a3;
  if (objc_msgSend(v3, "isUISubclass"))
  {
    objc_msgSend(v3, "safeAreaInsetsPortrait");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x24BDF7718];
    v7 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v9 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (PPLPeopleEntityViewControllerDelegate)delegate
{
  return (PPLPeopleEntityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (UIScenePresentation)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
  objc_storeStrong((id *)&self->_hostView, a3);
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (PPLPeopleEntityMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (PPLPeopleAppSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
