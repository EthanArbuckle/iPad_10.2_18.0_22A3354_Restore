@implementation ExtensionFlowViewController

- (ExtensionFlowViewController)init
{
  return -[ExtensionFlowViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (ExtensionFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ExtensionFlowViewController *v4;
  ExtensionFlowViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ExtensionFlowViewController;
  v4 = -[ExtensionFlowViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setPresentedModally:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setTakesAvailableHeight:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v8, "setAllowsSwipeToDismiss:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v9, "setBlurInCardView:", 0);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionFlowViewController;
  -[ContaineeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[ExtensionFlowViewController setupHeaderView](self, "setupHeaderView");
}

- (void)handleDismissAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));

  if (v6 == v8)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController headerView](self, "headerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController headerView](self, "headerView"));
    objc_msgSend(v9, "extensionFlowHeaderViewDidTapDismiss:", v10);

  }
  else
  {
    -[ExtensionFlowViewController popViewController](self, "popViewController");
  }
}

- (ExtensionFlowHeaderView)headerView
{
  ExtensionFlowHeaderView *headerView;

  headerView = self->_headerView;
  if (!headerView)
  {
    -[ExtensionFlowViewController setupHeaderView](self, "setupHeaderView");
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)pushViewController:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = -[ExtensionFlowViewController viewControllerUseExtensionFlowHeader:](self, "viewControllerUseExtensionFlowHeader:");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController headerView](self, "headerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
    objc_msgSend(v6, "setTitleView:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
    objc_msgSend(v7, "setLeftBarButtonItem:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
    objc_msgSend(v8, "setRightBarButtonItem:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
    objc_msgSend(v9, "setHidesBackButton:", 1);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
  objc_msgSend(v10, "_setMinimumDesiredHeight:forBarMetrics:", 0, 44.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
  objc_msgSend(v11, "_setMinimumDesiredHeight:forBarMetrics:", 1, 44.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController"));
    v15 = -[ExtensionFlowViewController viewControllerUseExtensionFlowHeader:](self, "viewControllerUseExtensionFlowHeader:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationBar"));
    objc_msgSend(v17, "setSupressTransition:", v4 & v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
    objc_msgSend(v18, "pushViewController:animated:", v19, 1);

  }
  else
  {
    -[ExtensionFlowViewController setupContainerViewWithRootViewController:](self, "setupContainerViewWithRootViewController:", v19);
  }

}

- (BOOL)viewControllerUseExtensionFlowHeader:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___ExtensionFlowViewControllerChildController)&& (objc_opt_respondsToSelector(v3, "useExtensionFlowHeader") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "useExtensionFlowHeader");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)popViewController
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v2 = objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)setScrollContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController containerScrollView](self, "containerScrollView"));
  objc_msgSend(v5, "setContentOffset:animated:", 1, x, y);

}

- (void)setupContainerViewWithRootViewController:(id)a3
{
  id v4;
  id v5;
  ExtensionNavigationBar *v6;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);

  -[ExtensionFlowViewController setNavigationController:](self, "setNavigationController:", v5);
  v6 = objc_opt_new(ExtensionNavigationBar);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setNavigationBar:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));
  objc_msgSend(v9, "setTranslucent:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  -[ExtensionFlowViewController setContentContainerView:](self, "setContentContainerView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentContainerView](self, "contentContainerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v36[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentContainerView](self, "contentContainerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v36[1] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentContainerView](self, "contentContainerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  v36[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentContainerView](self, "contentContainerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  v36[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)_setMaskOnNavigationBar:(id)a3
{
  id v4;
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "capInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navigationBar"));
  objc_msgSend(v18, "_setCornerRadius:", v10);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationBar"));
  objc_msgSend(v20, "setClipsToBounds:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController navigationController](self, "navigationController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBar"));
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));

  v23 = objc_retainAutorelease(v4);
  v24 = objc_msgSend(v23, "CGImage");

  objc_msgSend(v25, "setCornerContents:", v24);
  objc_msgSend(v25, "setCornerContentsCenter:", v12 / v6, v10 / v8, (v6 - v12 - v16) / v6, (v8 - v10 - v14) / v8);

}

- (void)setupHeaderView
{
  ExtensionFlowHeaderView *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_headerView)
  {
    v3 = objc_opt_new(ExtensionFlowHeaderView);
    -[ExtensionFlowViewController setHeaderView:](self, "setHeaderView:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController headerView](self, "headerView"));
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController headerView](self, "headerView"));
    objc_msgSend(v6, "setHeight:", 54.0);

  }
}

- (ExtensionFlowDelegate)contentUpdateDelegate
{
  return (ExtensionFlowDelegate *)objc_loadWeakRetained((id *)&self->_contentUpdateDelegate);
}

- (void)setContentUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentUpdateDelegate, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIViewController)topViewController
{
  return self->_topViewController;
}

- (void)setTopViewController:(id)a3
{
  objc_storeStrong((id *)&self->_topViewController, a3);
}

- (UIViewController)pendingViewController
{
  return self->_pendingViewController;
}

- (void)setPendingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pendingViewController, a3);
}

- (NSMutableArray)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
  objc_storeStrong((id *)&self->_controllers, a3);
}

- (UIScrollView)containerScrollView
{
  return self->_containerScrollView;
}

- (void)setContainerScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_containerScrollView, a3);
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerView, a3);
}

- (NSLayoutConstraint)contentContainerViewSpacerConstraint
{
  return self->_contentContainerViewSpacerConstraint;
}

- (void)setContentContainerViewSpacerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerViewSpacerConstraint, a3);
}

- (BOOL)keyboardDisplayed
{
  return self->_keyboardDisplayed;
}

- (void)setKeyboardDisplayed:(BOOL)a3
{
  self->_keyboardDisplayed = a3;
}

- (NSLayoutConstraint)bottomToBottomConstraint
{
  return self->_bottomToBottomConstraint;
}

- (void)setBottomToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomToBottomConstraint, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_bottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentContainerViewSpacerConstraint, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_containerScrollView, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_pendingViewController, 0);
  objc_storeStrong((id *)&self->_topViewController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_contentUpdateDelegate);
}

@end
