@implementation VUIBaseViewController

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIBaseViewController;
  v4 = a3;
  -[VUIBaseViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);
  -[VUIBaseViewController vui_willMoveToParentViewController:](self, "vui_willMoveToParentViewController:", v4, v5.receiver, v5.super_class);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[VUIBaseViewController vui_viewWillLayoutSubviews](self, "vui_viewWillLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[VUIBaseViewController vui_viewWillAppear:](self, "vui_viewWillAppear:", v3);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[VUIBaseViewController vui_viewDidLoad](self, "vui_viewDidLoad");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[VUIBaseViewController vui_viewDidLayoutSubviews](self, "vui_viewDidLayoutSubviews");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[VUIBaseViewController vui_viewDidAppear:](self, "vui_viewDidAppear:", v3);
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[VUIBaseViewController vui_updateViewConstraints](self, "vui_updateViewConstraints");
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController loadView](&v3, sel_loadView);
  -[VUIBaseViewController vui_loadView](self, "vui_loadView");
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIBaseViewController;
  v4 = a3;
  -[VUIBaseViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, v4);
  -[VUIBaseViewController vui_didMoveToParentViewController:](self, "vui_didMoveToParentViewController:", v4, v5.receiver, v5.super_class);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[VUIBaseViewController vui_viewWillDisappear:](self, "vui_viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseViewController;
  -[VUIBaseViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  -[VUIBaseViewController vui_viewDidDisappear:](self, "vui_viewDidDisappear:", v3);
}

- (BOOL)isViewInTopMostVisibleViewController
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vuiView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIBaseViewController vuiView](self, "vuiView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "vui_isDescendantOfView:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
