@implementation TUModalCardViewController

- (TUModalCardViewController)initWithRootViewController:(id)a3
{
  return -[TUModalCardViewController initWithRootViewController:useMaterialBackground:](self, "initWithRootViewController:useMaterialBackground:", a3, 0);
}

- (TUModalCardViewController)initWithRootViewController:(id)a3 useMaterialBackground:(BOOL)a4
{
  id v7;
  TUModalCardViewController *v8;
  TUModalCardViewController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUModalCardViewController;
  v8 = -[TUModalCardViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rootViewController, a3);
    v9->_usesMaterialBackground = a4;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11)
    {
      -[TUModalCardViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
    }
    else
    {
      -[TUModalCardViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 7);
      -[TUModalCardViewController popoverPresentationController](v9, "popoverPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", v9);

    }
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *backgroundView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  UIButton *closeButton;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)TUModalCardViewController;
  -[TUModalCardViewController viewDidLoad](&v23, sel_viewDidLoad);
  if (self->_usesMaterialBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v3);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    -[TUModalCardViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_backgroundView);

  }
  -[TUModalCardViewController rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willMoveToParentViewController:", self);

  -[TUModalCardViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController rootViewController](self, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  -[TUModalCardViewController rootViewController](self, "rootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController addChildViewController:](self, "addChildViewController:", v11);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
  v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v12;

  -[TUModalCardViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController closeButton](self, "closeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[TUModalCardViewController closeButton](self, "closeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  -[TUModalCardViewController rootViewController](self, "rootViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityElements:", v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUModalCardViewController;
  -[TUModalCardViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[TUModalCardViewController onDisappear](self, "onDisappear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUModalCardViewController onDisappear](self, "onDisappear");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)viewDidLayoutSubviews
{
  UIVisualEffectView *backgroundView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double MaxX;
  void *v15;
  void *v16;
  void *v17;
  double Width;
  void *v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21.receiver = self;
  v21.super_class = (Class)TUModalCardViewController;
  -[TUModalCardViewController viewDidLayoutSubviews](&v21, sel_viewDidLayoutSubviews);
  if (self->_usesMaterialBackground)
  {
    backgroundView = self->_backgroundView;
    -[TUModalCardViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");

  }
  -[TUModalCardViewController rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  -[TUModalCardViewController closeButton](self, "closeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

  v9 = (void *)MEMORY[0x1E0DC3F10];
  -[TUModalCardViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v10, "semanticContentAttribute"));

  v12 = 16.0;
  if (v11 != 1)
  {
    -[TUModalCardViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    MaxX = CGRectGetMaxX(v22);
    -[TUModalCardViewController closeButton](self, "closeButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v12 = MaxX - CGRectGetWidth(v23) + -16.0;

  }
  -[TUModalCardViewController closeButton](self, "closeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUModalCardViewController closeButton](self, "closeButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  Width = CGRectGetWidth(v24);
  -[TUModalCardViewController closeButton](self, "closeButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  objc_msgSend(v16, "setFrame:", v12, 16.0, Width, CGRectGetHeight(v25));

  -[TUModalCardViewController closeButton](self, "closeButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_handleClose, 64);

}

- (void)handleClose
{
  -[TUModalCardViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC4330];
  v5 = a4;
  objc_msgSend(v4, "_mediumDetent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0DC4330], "_largeDetent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setDetents:", v8);

  objc_msgSend(v5, "_setWidthFollowsPreferredContentSizeWhenBottomAttached:", 1);
  objc_msgSend(v5, "_setWantsBottomAttachedInCompactHeight:", 1);

}

- (id)onDisappear
{
  return self->_onDisappear;
}

- (void)setOnDisappear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (BOOL)usesMaterialBackground
{
  return self->_usesMaterialBackground;
}

- (void)setUsesMaterialBackground:(BOOL)a3
{
  self->_usesMaterialBackground = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong(&self->_onDisappear, 0);
}

@end
