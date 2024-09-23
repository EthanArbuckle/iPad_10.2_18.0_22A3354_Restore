@implementation BSUIRootBarWrapperViewController

- (BSUIRootBarWrapperViewController)init
{
  return -[BSUIRootBarWrapperViewController initWithContentNavigationController:](self, "initWithContentNavigationController:", 0);
}

- (BSUIRootBarWrapperViewController)initWithContentNavigationController:(id)a3
{
  id v5;
  BSUIRootBarWrapperViewController *v6;
  BSUIRootBarWrapperViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSUIRootBarWrapperViewController;
  v6 = -[BSUIRootBarWrapperViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentNavigationController, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIRootBarWrapperViewController;
  -[BSUIRootBarWrapperViewController viewDidLoad](&v3, "viewDidLoad");
  if (self->_contentNavigationController)
    -[BSUIRootBarWrapperViewController _updateContentNavigationControllerFrom:to:](self, "_updateContentNavigationControllerFrom:to:", 0);
}

- (void)setContentNavigationController:(id)a3
{
  BSUINavigationController *v4;
  BSUINavigationController *contentNavigationController;
  BSUINavigationController *v6;
  id v7;

  v4 = (BSUINavigationController *)a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v7)
  {
    contentNavigationController = self->_contentNavigationController;
    if (contentNavigationController != v4)
      -[BSUIRootBarWrapperViewController _updateContentNavigationControllerFrom:to:](self, "_updateContentNavigationControllerFrom:to:", contentNavigationController, v4);
  }
  v6 = self->_contentNavigationController;
  self->_contentNavigationController = v4;

}

- (void)_updateContentNavigationControllerFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v6 = a3;
  objc_msgSend(v6, "willMoveToParentViewController:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrapperView"));
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(v6, "removeFromParentViewController");
  if (v20)
  {
    -[BSUIRootBarWrapperViewController addChildViewController:](self, "addChildViewController:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "wrapperView"));
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "wrapperView"));
    objc_msgSend(v18, "addSubview:", v19);

    objc_msgSend(v20, "didMoveToParentViewController:", self);
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController contentNavigationController](self, "contentNavigationController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController contentNavigationController](self, "contentNavigationController"));
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

    return (unint64_t)v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BSUIRootBarWrapperViewController;
    return -[BSUIRootBarWrapperViewController supportedInterfaceOrientations](&v7, "supportedInterfaceOrientations");
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSUIRootBarWrapperViewController;
  v5 = -[BSUIRootBarWrapperViewController contentScrollViewForEdge:](&v9, "contentScrollViewForEdge:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController contentNavigationController](self, "contentNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentScrollViewForEdge:", a3));

  }
  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIRootBarWrapperViewController;
  -[BSUIRootBarWrapperViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BSUIRootBarWrapperViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIRootBarWrapperViewController;
  -[BSUIRootBarWrapperViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BSUIRootBarWrapperViewController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIRootBarWrapperViewController;
  -[BSUIRootBarWrapperViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BSUIRootBarWrapperViewController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear");
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController contentNavigationController](self, "contentNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleViewController"));

  if (v3)
  {
    v4 = objc_opt_class(BSUIPlaceholderViewController);
    v5 = BUDynamicCast(v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)im_childViewControllerForTabBarVisibility
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIRootBarWrapperViewController contentNavigationController](self, "contentNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "im_childViewControllerForTabBarVisibility"));

  return v3;
}

- (BSUINavigationController)contentNavigationController
{
  return self->_contentNavigationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentNavigationController, 0);
}

@end
