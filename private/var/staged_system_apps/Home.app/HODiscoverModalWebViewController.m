@implementation HODiscoverModalWebViewController

- (HODiscoverModalWebViewController)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithURL:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HODiscoverModalWebViewController.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HODiscoverModalWebViewController initWithCoder:]",
    v7);

  return 0;
}

- (HODiscoverModalWebViewController)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithURL:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HODiscoverModalWebViewController.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HODiscoverModalWebViewController init]",
    v6);

  return 0;
}

- (HODiscoverModalWebViewController)initWithURLString:(id)a3
{
  HODiscoverModalWebViewController *v3;
  HODiscoverModalDismissButton *v4;
  HODiscoverModalDismissButton *dismissButton;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HODiscoverModalWebViewController;
  v3 = -[HODiscoverWebViewController initWithURLString:](&v9, "initWithURLString:", a3);
  if (v3)
  {
    v4 = -[HODiscoverModalDismissButton initWithFrame:]([HODiscoverModalDismissButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = v4;

    if ((+[HFUtilities isAMac](HFUtilities, "isAMac") & 1) == 0)
    {
      if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
        v6 = 4;
      else
        v6 = 0;
      -[HODiscoverModalWebViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", v6);
      -[HODiscoverModalWebViewController setModalTransitionStyle:](v3, "setModalTransitionStyle:", 0);
      -[HODiscoverModalWebViewController setModalPresentationCapturesStatusBarAppearance:](v3, "setModalPresentationCapturesStatusBarAppearance:", 1);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "removeObserver:", v3);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double height;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)HODiscoverModalWebViewController;
  -[HODiscoverWebViewController viewDidLoad](&v36, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNavigationBarHidden:", 1);

  if ((+[HFUtilities isAMac](HFUtilities, "isAMac") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollView"));
    -[HODiscoverModalWebViewController _getStatusBarHeight](self, "_getStatusBarHeight");
    objc_msgSend(v5, "setContentInset:", -v6, 0.0, 0.0, 0.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController dismissButton](self, "dismissButton"));
    objc_msgSend(v7, "addTarget:action:forEvents:", self, "_dismissedButtonPressed:", 64);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    objc_msgSend(v8, "addSubview:", self->_dismissButton);

    -[HODiscoverModalWebViewController _addButtonConstraints](self, "_addButtonConstraints");
  }
  if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
    objc_msgSend(v10, "setCornerRadius:", 16.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    objc_msgSend(v12, "setMaskedCorners:", 3);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    objc_msgSend(v14, "setCornerRadius:", 16.0);

    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
    v16 = objc_msgSend(v15, "CGColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v18, "setShadowColor:", v16);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
    LODWORD(v21) = 1045220557;
    objc_msgSend(v20, "setShadowOpacity:", v21);

    height = CGSizeZero.height;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
    objc_msgSend(v24, "setShadowOffset:", CGSizeZero.width, height);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
    objc_msgSend(v26, "setShadowRadius:", 20.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layer"));
    objc_msgSend(v28, "setMasksToBounds:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
    objc_msgSend(v30, "setShouldRasterize:", 1);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v31, "scale");
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController view](self, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layer"));
    objc_msgSend(v35, "setRasterizationScale:", v33);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HODiscoverModalWebViewController;
  -[HODiscoverWebViewController viewWillAppear:](&v19, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scrollView"));
    objc_msgSend(v6, "setContentOffset:", CGPointZero.x, CGPointZero.y);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scrollView"));
    objc_msgSend(v8, "setBounces:", 0);

    if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
    {
      v9 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "handlePanGesture:");
      -[HODiscoverModalWebViewController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController panGestureRecognizer](self, "panGestureRecognizer"));
      objc_msgSend(v10, "setDelegate:", self);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scrollView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController panGestureRecognizer](self, "panGestureRecognizer"));
      objc_msgSend(v12, "addGestureRecognizer:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController shadowView](self, "shadowView"));
      objc_msgSend(v14, "bounds");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
      v16 = objc_msgSend(v15, "CGPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController shadowView](self, "shadowView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
      objc_msgSend(v18, "setShadowPath:", v16);

    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)handlePanGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class(HODiscoverModalPresentationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController presentationController](self, "presentationController"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v12 = v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  objc_msgSend(v4, "translationInView:", v8);
  v10 = v9;

  v11 = objc_msgSend(v4, "state");
  if (v11 == (id)2)
  {
    objc_msgSend(v12, "dismissalPanTranslationChanged:", v10);
  }
  else if (v11 == (id)3)
  {
    objc_msgSend(v12, "dismissalPanTranslationEnded");
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  unsigned __int8 v12;

  v5 = objc_opt_class(HODiscoverModalPresentationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController presentationController](self, "presentationController"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
  objc_msgSend(v10, "contentOffset");
  if (v11 <= 0.0)
    v12 = 1;
  else
    v12 = objc_msgSend(v8, "shouldAllowViewTranslation");

  return v12;
}

- (void)_addWebViewConstraints
{
  void *v3;
  void *v4;
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
  id v25;

  v25 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  objc_msgSend(v25, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  objc_msgSend(v25, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  objc_msgSend(v25, "addObject:", v17);

  LODWORD(v15) = +[HFUtilities isAMac](HFUtilities, "isAMac");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController webView](self, "webView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v21 = v20;
  if ((_DWORD)v15)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "safeAreaLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v23));
    objc_msgSend(v25, "addObject:", v24);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v22));
    objc_msgSend(v25, "addObject:", v23);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);
}

- (void)_addButtonConstraints
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController dismissButton](self, "dismissButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "safeAreaLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -20.0));
  v21[0] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController dismissButton](self, "dismissButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverWebViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v4, 20.0));
  v21[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController dismissButton](self, "dismissButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 35.0));
  v21[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController dismissButton](self, "dismissButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 35.0));
  v21[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_dismissedButtonPressed:(id)a3
{
  -[HODiscoverModalWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (double)_getStatusBarHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windows"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_filter:", &stru_1000B5EC8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusBarManager"));
    objc_msgSend(v7, "statusBarFrame");
    v9 = v8;

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;

  v9 = a3;
  if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    v4 = objc_opt_class(HODiscoverModalPresentationController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalWebViewController presentationController](self, "presentationController"));
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v9, "contentOffset");
    if (v8 < 0.0 || objc_msgSend(v7, "shouldAllowViewTranslation"))
      objc_msgSend(v9, "setContentOffset:", 0.0, 0.0);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return +[HFUtilities isAnIPad](HFUtilities, "isAnIPad", a3, a4);
}

- (HODiscoverModalDismissButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end
