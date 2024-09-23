@implementation PRRenderingSceneViewController

- (PRRenderingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 previewing:(BOOL)a5
{
  PRRenderingSceneViewController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRRenderingSceneViewController;
  result = -[PRSceneViewController _initWithProvider:contents:previewing:](&v6, sel__initWithProvider_contents_previewing_, a3, a4, a5);
  if (result)
    result->_showDebugGear = 1;
  return result;
}

- (void)viewDidLoad
{
  FBSMutableSceneSettings *v3;
  FBSMutableSceneSettings *settings;
  FBSMutableSceneSettings *v5;
  void *v6;
  uint32_t v7;
  uint32_t v8;
  void *v9;
  void *v10;
  PRPosterEnvironmentImpl *v11;
  PRPosterEnvironmentImpl *environment;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  UIButton *button;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PRRenderingSceneViewController;
  -[PRSceneViewController viewDidLoad](&v37, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D23150], "settings");
  v3 = (FBSMutableSceneSettings *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  self->_settings = v3;

  -[FBSMutableSceneSettings pui_setMode:](self->_settings, "pui_setMode:", 1);
  v5 = self->_settings;
  v6 = (void *)MEMORY[0x1E0D01710];
  v7 = arc4random_uniform(0x64u);
  v8 = arc4random_uniform(0x64u);
  objc_msgSend(v6, "colorWithRed:green:blue:alpha:", (double)v7 / 100.0, (double)v8 / 100.0, (double)arc4random_uniform(0x64u) / 100.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSMutableSceneSettings pr_setCaseColor:](v5, "pr_setCaseColor:", v9);

  -[PRRenderingSceneViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:]([PRPosterEnvironmentImpl alloc], "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", self->_settings, v32, 0, 0);
  environment = self->_environment;
  self->_environment = v11;

  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  v39 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 52.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v13, "initWithString:attributes:", CFSTR("⚙️"), v15);

  objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAttributedTitle:", v31);
  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E0DC3428];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __45__PRRenderingSceneViewController_viewDidLoad__block_invoke;
  v34[3] = &unk_1E2183D00;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v16, "actionWithHandler:", v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v33);
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v17;

  -[UIButton sizeToFit](self->_button, "sizeToFit");
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setHidden:](self->_button, "setHidden:", !self->_showDebugGear);
  -[PRRenderingSceneViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_button);
  v20 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton centerXAnchor](self->_button, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v23;
  -[UIButton bottomAnchor](self->_button, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v28);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __45__PRRenderingSceneViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "doThing");

}

- (void)setShowDebugGear:(BOOL)a3
{
  if (self->_showDebugGear != a3)
  {
    self->_showDebugGear = a3;
    -[UIButton setHidden:](self->_button, "setHidden:", !a3);
  }
}

- (void)doThing
{
  PRRenderingEnvironmentViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PRRenderingEnvironmentViewController initWithEnvironment:delegate:]([PRRenderingEnvironmentViewController alloc], "initWithEnvironment:delegate:", self->_environment, self);
  -[PRRenderingEnvironmentViewController sheetPresentationController](v3, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", self->_button);

  -[PRRenderingEnvironmentViewController sheetPresentationController](v3, "sheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bounds](self->_button, "bounds");
  objc_msgSend(v5, "setSourceRect:");

  -[PRRenderingEnvironmentViewController sheetPresentationController](v3, "sheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersEdgeAttachedInCompactHeight:", 1);

  -[PRRenderingEnvironmentViewController sheetPresentationController](v3, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("EnvironmentDetent"), &__block_literal_global_36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetents:", v9);

  -[PRRenderingSceneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
}

double __41__PRRenderingSceneViewController_doThing__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "maximumDetentValue");
  return v2 * 0.3;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRRenderingSceneViewController;
  -[PRRenderingSceneViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[PRRenderingSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", self->_button);

}

+ (id)role
{
  return (id)*MEMORY[0x1E0D7FD98];
}

- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRRenderingSceneViewController;
  v6 = a3;
  -[PRSceneViewController _updateSceneSettings:transitionContext:](&v7, sel__updateSceneSettings_transitionContext_, v6, a4);
  -[PRPosterEnvironmentImpl _applyToSceneSettings:](self->_environment, "_applyToSceneSettings:", v6, v7.receiver, v7.super_class);

}

- (void)environmentViewController:(id)a3 didUpdateEnvironment:(id)a4
{
  id v6;
  FBScene *scene;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_storeStrong((id *)&self->_environment, a4);
  scene = self->super._scene;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PRRenderingSceneViewController_environmentViewController_didUpdateEnvironment___block_invoke;
  v9[3] = &unk_1E2184F48;
  v10 = v6;
  v8 = v6;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v9);

}

uint64_t __81__PRRenderingSceneViewController_environmentViewController_didUpdateEnvironment___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyToSceneSettings:", a2);
}

- (BOOL)showDebugGear
{
  return self->_showDebugGear;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
