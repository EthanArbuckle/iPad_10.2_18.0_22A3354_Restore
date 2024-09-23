@implementation RCDetailContainerViewController

- (void)adjustConstraints:(BOOL)a3 forDisplayMode:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[RCDetailContainerViewController cardInsets:forDisplayMode:](self, "cardInsets:forDisplayMode:", a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", -v8);
  -[NSLayoutConstraint setConstant:](self->_leftConstraint, "setConstant:", v6);
  -[NSLayoutConstraint setConstant:](self->_rightConstraint, "setConstant:", v10);
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[RCDetailContainerViewController setView:](self, "setView:", v5);
  self->_displayMode = 2;

}

- (UIEdgeInsets)cardInsets:(BOOL)a3 forDisplayMode:(int64_t)a4
{
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  double right;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider", a3));
  if (objc_msgSend(v9, "playbackCardHasInsets"))
  {
    if (a4 == 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v10, "playbackViewEdgeInsets");
      top = v11;
      left = v12;
      bottom = v13;
      right = v14;

    }
    right = -right;
  }

  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)setHostedViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_hostedViewController;
  UIViewController *hostedViewController;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  p_hostedViewController = &self->_hostedViewController;
  hostedViewController = self->_hostedViewController;
  if (hostedViewController != v5)
  {
    v11 = v5;
    if (hostedViewController)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](hostedViewController, "view"));
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](*p_hostedViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_hostedViewController, a3);
    -[RCDetailContainerViewController addChildViewController:](self, "addChildViewController:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCDetailContainerViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v11, "view"));
    objc_msgSend(v9, "addSubview:", v10);

    -[UIViewController didMoveToParentViewController:](*p_hostedViewController, "didMoveToParentViewController:", self);
    -[RCDetailContainerViewController setupConstraints](self, "setupConstraints");
    v5 = v11;
  }

}

- (void)adjustConstraintsForDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
  -[RCDetailContainerViewController adjustConstraints:forDisplayMode:](self, "adjustConstraints:forDisplayMode:", 1, a3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  void *v5;
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
  double v17;
  char v18;
  UIEdgeInsets result;

  *a4 = 1;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCDetailContainerViewController parentViewController](self, "parentViewController", a3));
  objc_msgSend(v5, "_edgeInsetsForChildViewController:insetsAreAbsolute:", self, &v18);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)RCDetailContainerViewController;
  v7 = a4;
  -[RCDetailContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_transitionSize.width = width;
  self->_transitionSize.height = height;
  self->_isTransitioningSizes = 1;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F194;
  v9[3] = &unk_1001ABA08;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002F1AC;
  v8[3] = &unk_1001ABA08;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RCDetailContainerViewController;
  -[RCDetailContainerViewController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *leftConstraint;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *rightConstraint;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  void *v16;
  _QWORD v17[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCDetailContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_hostedViewController, "view"));
  v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, v3, 3, 1.0, 0.0));
    topConstraint = self->_topConstraint;
    self->_topConstraint = v6;

    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, v3, 4, 1.0, 0.0));
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v8;

    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 1, 0, v3, 1, 1.0, 0.0));
    leftConstraint = self->_leftConstraint;
    self->_leftConstraint = v10;

    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 2, 0, v3, 2, 1.0, 0.0));
    rightConstraint = self->_rightConstraint;
    self->_rightConstraint = v12;

    v14 = self->_bottomConstraint;
    v17[0] = self->_topConstraint;
    v17[1] = v14;
    v15 = self->_rightConstraint;
    v17[2] = self->_leftConstraint;
    v17[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
    objc_msgSend(v3, "addConstraints:", v16);

    -[RCDetailContainerViewController adjustConstraints:forDisplayMode:](self, "adjustConstraints:forDisplayMode:", 0, self->_displayMode);
  }

}

- (void)setDimmed:(BOOL)a3
{
  UIView *v4;
  UIView *dimmingView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *dimmingConstraints;
  void *v25;
  void *v26;
  id v27;

  if (a3)
  {
    if (!self->_dimmingView)
    {
      v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      dimmingView = self->_dimmingView;
      self->_dimmingView = v4;

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
      -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_dimmingView, "layer"));
      objc_msgSend(v7, "setCornerRadius:", 10.0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_dimmingView, "layer"));
      objc_msgSend(v8, "setMasksToBounds:", 1);

      -[UIView setUserInteractionEnabled:](self->_dimmingView, "setUserInteractionEnabled:", 1);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    if (!self->_dimmingConstraints)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v9, "playbackViewEdgeInsets");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_hostedViewController, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingView, 1, 0, v18, 1, 1.0, v13));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingView, 2, 0, v18, 2, 1.0, -v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingView, 3, 0, v18, 3, 1.0, v11));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_dimmingView, 4, 0, v18, 4, 1.0, -v15));
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v20, v21, v22, 0));
      dimmingConstraints = self->_dimmingConstraints;
      self->_dimmingConstraints = v23;

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCDetailContainerViewController view](self, "view"));
    objc_msgSend(v25, "addSubview:", self->_dimmingView);

    v27 = (id)objc_claimAutoreleasedReturnValue(-[RCDetailContainerViewController view](self, "view"));
    objc_msgSend(v27, "addConstraints:", self->_dimmingConstraints);

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCDetailContainerViewController view](self, "view"));
    objc_msgSend(v26, "removeConstraints:", self->_dimmingConstraints);

    -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
  }
}

- (UIViewController)hostedViewController
{
  return self->_hostedViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViewController, 0);
  objc_storeStrong((id *)&self->_dimmingConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end
