@implementation PSEnrollContainerViewController

- (void)dealloc
{
  objc_super v3;

  -[PSEnrollContainerViewController teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)PSEnrollContainerViewController;
  -[PSEnrollContainerViewController dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  BiometricKitUIEnrollViewController *enrollController;

  -[BiometricKitUIEnrollViewController setDelegate:](self->_enrollController, "setDelegate:", 0);
  enrollController = self->_enrollController;
  self->_enrollController = 0;

}

- (BOOL)isModalInPresentation
{
  void *v2;
  char v3;

  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isModalInPresentation");

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSEnrollContainerViewController;
  -[PSEnrollContainerViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PSEnrollContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "configureWithTransparentBackground");
  -[PSEnrollContainerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEdgeAppearance:", v5);

  -[PSEnrollContainerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStandardAppearance:", v5);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSEnrollContainerViewController;
  -[PSEnrollContainerViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEnrollContainerViewController addChildViewController:](self, "addChildViewController:", v4);

  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEnrollContainerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  -[PSEnrollContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didMoveToParentViewController:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSEnrollContainerViewController;
  -[PSEnrollContainerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if (objc_opt_class())
  {
    -[PSEnrollContainerViewController enrollController](self, "enrollController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginAppearanceTransition:animated:", 0, 1);
    objc_msgSend(v4, "willMoveToParentViewController:", 0);
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v4, "removeFromParentViewController");
    objc_msgSend(v4, "endAppearanceTransition");

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSEnrollContainerViewController;
  -[PSEnrollContainerViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEnrollContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PSEnrollContainerViewController enrollController](self, "enrollController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BiometricKitUIEnrollViewController)enrollController
{
  return self->_enrollController;
}

- (void)setEnrollController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollController, 0);
}

@end
