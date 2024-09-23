@implementation _UIUserDefaultsActivityPresentableViewController

- (_UIUserDefaultsActivityPresentableViewController)initWithUserDefaultsViewController:(id)a3
{
  id v4;
  _UIUserDefaultsActivityPresentableViewController *v5;
  _UIUserDefaultsActivityPresentableViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIUserDefaultsActivityPresentableViewController;
  v5 = -[_UIUserDefaultsActivityPresentableViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[_UIUserDefaultsActivityPresentableViewController setUserDefaultsViewController:](v5, "setUserDefaultsViewController:", v4);
    -[_UIUserDefaultsActivityPresentableViewController setModalPresentationCapturesStatusBarAppearance:](v6, "setModalPresentationCapturesStatusBarAppearance:", 1);
    -[_UIUserDefaultsActivityPresentableViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 5);
    -[_UIUserDefaultsActivityPresentableViewController view](v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintAdjustmentMode:", 1);

  }
  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIUserDefaultsActivityPresentableViewController;
  -[_UIUserDefaultsActivityPresentableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[_UIUserDefaultsActivityPresentableViewController _loadNavigationController](self, "_loadNavigationController");
}

- (void)_loadNavigationController
{
  _UIUserDefaultsActivityNavigationController *v3;
  void *v4;
  _UIUserDefaultsActivityNavigationController *v5;
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
  _UIUserDefaultsActivityNavigationController *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = [_UIUserDefaultsActivityNavigationController alloc];
  -[_UIUserDefaultsActivityPresentableViewController userDefaultsViewController](self, "userDefaultsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIUserDefaultsActivityNavigationController initWithRootViewController:](v3, "initWithRootViewController:", v4);

  -[_UIUserDefaultsActivityNavigationController view](v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIUserDefaultsActivityNavigationController willMoveToParentViewController:](v5, "willMoveToParentViewController:", self);
  v26 = v5;
  -[_UIUserDefaultsActivityPresentableViewController addChildViewController:](self, "addChildViewController:", v5);
  -[_UIUserDefaultsActivityPresentableViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[_UIUserDefaultsActivityNavigationController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);
  v18 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUserDefaultsActivityPresentableViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  objc_msgSend(v6, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUserDefaultsActivityPresentableViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  objc_msgSend(v6, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUserDefaultsActivityPresentableViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v11;
  objc_msgSend(v6, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIUserDefaultsActivityPresentableViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

}

- (UIViewController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (UIViewController)userDefaultsViewController
{
  return self->_userDefaultsViewController;
}

- (void)setUserDefaultsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
