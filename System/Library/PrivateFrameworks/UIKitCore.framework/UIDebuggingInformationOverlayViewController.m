@implementation UIDebuggingInformationOverlayViewController

- (UIView)containerView
{
  return (UIView *)self->_shadowContainer;
}

- (UIDebuggingInformationOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingInformationOverlayViewController *v4;
  UIDebuggingInformationRootTableViewController *v5;
  UIDebuggingInformationRootTableViewController *rootTableViewController;
  UINavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UINavigationController *navController;
  UINavigationController *v13;
  UIDebuggingInformationContainerView *v14;
  void *v15;
  UIDebuggingInformationContainerView *shadowContainer;
  UIDebuggingInformationContainerView *v17;
  void *v18;
  void *v19;
  void *v20;
  UIPanGestureRecognizer *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)UIDebuggingInformationOverlayViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = -[UIDebuggingInformationRootTableViewController initWithStyle:]([UIDebuggingInformationRootTableViewController alloc], "initWithStyle:", 0);
    rootTableViewController = v4->_rootTableViewController;
    v4->_rootTableViewController = v5;

    v7 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v4->_rootTableViewController);
    -[UIViewController view](v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 23.0);

    -[UIViewController view](v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 1);

    navController = v4->_navController;
    v4->_navController = v7;
    v13 = v7;

    v14 = objc_alloc_init(UIDebuggingInformationContainerView);
    -[UIViewController view](v13, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v14, "addSubview:", v15);

    shadowContainer = v4->_shadowContainer;
    v4->_shadowContainer = v14;
    v17 = v14;

    +[UIColor clearColor](UIColor, "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v4, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

    -[UIViewController addChildViewController:](v4, "addChildViewController:", v13);
    -[UIViewController view](v4, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v17);

    -[UINavigationController didMoveToParentViewController:](v13, "didMoveToParentViewController:", v4);
    v21 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v4, sel_didReceiveGesture_);

    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v21, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v21, "setMinimumNumberOfTouches:", 1);
    -[UINavigationController navigationBar](v13, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addGestureRecognizer:", v21);
  }
  return v4;
}

- (void)viewDidLayoutSubviews
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double x;
  double v8;
  double y;
  double v10;
  double v11;
  double v12;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double MidY;
  void *v21;
  void *v22;
  double Width;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v34.receiver = self;
  v34.super_class = (Class)UIDebuggingInformationOverlayViewController;
  -[UIViewController viewDidLayoutSubviews](&v34, sel_viewDidLayoutSubviews);
  v3 = -[UIDebuggingInformationOverlayViewController isFullscreen](self, "isFullscreen");
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "bounds");
    x = v6;
    y = v8;
    v11 = v10;
    height = v12;

    v14 = height;
    v15 = v11;
    v16 = y;
    v17 = x;
  }
  else
  {
    objc_msgSend(v4, "safeAreaInsets");
    v17 = v18;
    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    MidY = CGRectGetMidY(v35);
    -[UIViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v16 = MidY + CGRectGetHeight(v36) * -0.25;
    -[UIViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    Width = CGRectGetWidth(v37);
    -[UIViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaInsets");
    v26 = Width - v25;
    -[UIViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaInsets");
    v15 = v26 - v28;
    -[UIViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v14 = CGRectGetHeight(v38) * 0.5;

    v39.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v39.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v39.size.width = v15;
    v39.size.height = v14;
    v40 = CGRectInset(v39, 10.0, 10.0);
    x = v40.origin.x;
    y = v40.origin.y;
    v11 = v40.size.width;
    height = v40.size.height;
  }
  -[UIView setFrame:](self->_shadowContainer, "setFrame:", v17, v16, v15, v14);
  -[UIViewController view](self->_navController, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", x, y, v11, height);

  if (-[UIDebuggingInformationOverlayViewController isFullscreen](self, "isFullscreen"))
    v31 = 0.0;
  else
    v31 = 23.0;
  -[UIViewController view](self->_navController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCornerRadius:", v31);

}

- (void)toggleFullscreen
{
  void *v3;
  _QWORD v4[5];

  -[UIDebuggingInformationOverlayViewController setIsFullscreen:](self, "setIsFullscreen:", -[UIDebuggingInformationOverlayViewController isFullscreen](self, "isFullscreen") ^ 1);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__UIDebuggingInformationOverlayViewController_toggleFullscreen__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.5);
}

void __63__UIDebuggingInformationOverlayViewController_toggleFullscreen__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setShadowHidden:", objc_msgSend(*(id *)(a1 + 32), "isFullscreen"));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)didReceiveGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;

  v31 = a3;
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  if (objc_msgSend(v31, "state") == 1)
  {
    -[UIDebuggingInformationOverlayViewController containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v11 = v10;
    v13 = v12;

    -[UIDebuggingInformationOverlayViewController setOffset:](self, "setOffset:", v6 - v11, v8 - v13);
  }
  else if (objc_msgSend(v31, "state") == 2)
  {
    -[UIViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    -[UIDebuggingInformationOverlayViewController containerView](self, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;

    -[UIDebuggingInformationOverlayViewController offset](self, "offset");
    v25 = v6 - v24;
    -[UIDebuggingInformationOverlayViewController offset](self, "offset");
    v27 = v8 - v26;
    v28 = fmin(v16 - v21 * 0.5, fmax(v21 * 0.5, v25));
    v29 = fmin(v18 - v23 * 0.5, fmax(v23 * 0.5, v27));
    -[UIDebuggingInformationOverlayViewController containerView](self, "containerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCenter:", v28, v29);

  }
}

- (UIDebuggingInformationRootTableViewController)rootTableViewController
{
  return self->_rootTableViewController;
}

- (void)setRootTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootTableViewController, a3);
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void)setIsFullscreen:(BOOL)a3
{
  self->_isFullscreen = a3;
}

- (CGPoint)offset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootTableViewController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_shadowContainer, 0);
}

@end
