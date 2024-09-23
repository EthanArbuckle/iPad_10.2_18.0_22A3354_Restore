@implementation PRComplicationsSnapshotSceneHostViewController

- (PRComplicationsSnapshotSceneHostViewController)initWithScene:(id)a3
{
  id v5;
  PRComplicationsSnapshotSceneHostViewController *v6;
  PRComplicationsSnapshotSceneHostViewController *v7;
  id *p_scene;
  void *v9;
  uint64_t v10;
  UIScenePresenter *scenePresenter;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PRComplicationsSnapshotSceneHostViewController;
  v6 = -[PRComplicationsSnapshotSceneHostViewController init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    p_scene = (id *)&v6->_scene;
    objc_storeStrong((id *)&v6->_scene, a3);
    objc_msgSend(*p_scene, "configureParameters:", &__block_literal_global_91);
    objc_msgSend(*p_scene, "uiPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createPresenterWithIdentifier:", CFSTR("complications-snapshot"));
    v10 = objc_claimAutoreleasedReturnValue();
    v32 = v5;
    scenePresenter = v7->_scenePresenter;
    v7->_scenePresenter = (UIScenePresenter *)v10;

    -[UIScenePresenter modifyPresentationContext:](v7->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_95);
    -[UIScenePresenter activate](v7->_scenePresenter, "activate");
    -[UIScenePresenter presentationView](v7->_scenePresenter, "presentationView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("Scene View"));

    objc_msgSend(*p_scene, "activateWithTransitionContext:", 0);
    -[PRComplicationsSnapshotSceneHostViewController view](v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

    -[PRComplicationsSnapshotSceneHostViewController view](v7, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v12, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v29;
    objc_msgSend(v12, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v26;
    objc_msgSend(v12, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v18;
    objc_msgSend(v12, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
    v5 = v32;

  }
  return v7;
}

uint64_t __64__PRComplicationsSnapshotSceneHostViewController_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSettingsWithBlock:", &__block_literal_global_92);
}

void __64__PRComplicationsSnapshotSceneHostViewController_initWithScene___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D228F8];
  v4 = a2;
  objc_msgSend(v2, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v3);

  objc_msgSend(v4, "setForeground:", 1);
}

void __64__PRComplicationsSnapshotSceneHostViewController_initWithScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", 0);
  objc_msgSend(v2, "setBackgroundColorWhileNotHosting:", 0);
  objc_msgSend(v2, "setShouldPassthroughHitTestEventsIfTransparent:", 1);

}

- (void)dealloc
{
  UIScenePresenter *scenePresenter;
  FBScene *scene;
  objc_super v5;

  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
  -[FBScene invalidate](self->_scene, "invalidate");
  scene = self->_scene;
  self->_scene = 0;

  v5.receiver = self;
  v5.super_class = (Class)PRComplicationsSnapshotSceneHostViewController;
  -[PRComplicationsSnapshotSceneHostViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  FBScene *scene;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRComplicationsSnapshotSceneHostViewController;
  -[PRComplicationsSnapshotSceneHostViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  scene = self->_scene;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__PRComplicationsSnapshotSceneHostViewController_viewDidLayoutSubviews__block_invoke;
  v4[3] = &unk_1E2184D90;
  v4[4] = self;
  -[FBScene performUpdate:](scene, "performUpdate:", v4);
}

void __71__PRComplicationsSnapshotSceneHostViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
