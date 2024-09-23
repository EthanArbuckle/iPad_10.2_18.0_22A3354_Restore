@implementation BKExpandedContentViewController

+ (Class)classForResource:(id)a3
{
  id v3;
  double v4;
  id v5;
  unsigned int v6;
  __objc2_class **v7;
  id v8;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKExpandedImageContentViewController).n128_u64[0];
  v6 = objc_msgSend(v5, "supportsResource:", v3, v4);

  v7 = &off_1BD418;
  if (v6)
    v7 = off_1BD410;
  objc_opt_class(*v7);
  return (Class)v8;
}

+ (BOOL)canPreviewResource:(id)a3
{
  return objc_msgSend(a1, "classForResource:", a3) != 0;
}

+ (id)expandedContentControllerForResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForResource:", v4)), "initWithResource:", v4);

  return v5;
}

- (BKExpandedContentViewController)initWithResource:(id)a3
{
  id v5;
  BKExpandedContentViewController *v6;
  BKExpandedContentViewController *v7;
  uint64_t v8;
  UIColor *contentBackgroundColor;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKExpandedContentViewController;
  v6 = -[BKExpandedContentViewController init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resource, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    contentBackgroundColor = v7->_contentBackgroundColor;
    v7->_contentBackgroundColor = (UIColor *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierDynamicTheme));
    -[BKExpandedContentViewController setTheme:](v7, "setTheme:", v10);

    -[BKExpandedContentViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
    -[BKExpandedContentViewController setToolbarHidden:](v7, "setToolbarHidden:", 0);
  }

  return v7;
}

- (void)releaseViews
{
  BCNavigationBar *toolbar;
  UIView *contentContainer;
  UITapGestureRecognizer *doubleTapRecognizer;
  UIImageView *animationImageView;
  UIView *contentObscuringView;
  BKActivityIndicatorOverlayView *activityIndicator;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKExpandedContentViewController;
  -[BKViewController releaseViews](&v9, "releaseViews");
  toolbar = self->_toolbar;
  self->_toolbar = 0;

  contentContainer = self->_contentContainer;
  self->_contentContainer = 0;

  -[UITapGestureRecognizer setDelegate:](self->_doubleTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_doubleTapRecognizer, "removeTarget:action:", 0, 0);
  doubleTapRecognizer = self->_doubleTapRecognizer;
  self->_doubleTapRecognizer = 0;

  animationImageView = self->_animationImageView;
  self->_animationImageView = 0;

  contentObscuringView = self->_contentObscuringView;
  self->_contentObscuringView = 0;

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[BKExpandedContentViewController releaseViews](self, "releaseViews");
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)BKExpandedContentViewController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  BCNavigationBar *v9;
  BCNavigationBar *toolbar;
  BCNavigationBar *v11;
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
  BCNavigationBar *v25;
  void *v26;
  void *v27;
  BCNavigationBar *v28;
  void *v29;
  UIView *v30;
  UIView *contentContainer;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BKActivityIndicatorOverlayView *v41;
  void *v42;
  void *v43;
  void *v44;
  BKActivityIndicatorOverlayView *v45;
  BKActivityIndicatorOverlayView *activityIndicator;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[3];
  _QWORD v59[3];

  v57.receiver = self;
  v57.super_class = (Class)BKExpandedContentViewController;
  -[BKExpandedContentViewController viewDidLoad](&v57, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController themePage](self, "themePage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController view](self, "view"));
  v5 = objc_alloc((Class)BCNavigationBar);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (BCNavigationBar *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  toolbar = self->_toolbar;
  self->_toolbar = v9;

  v11 = self->_toolbar;
  v55 = v3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headerTextColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v12, NSForegroundColorAttributeName));
  -[BCNavigationBar setTitleTextAttributes:](v11, "setTitleTextAttributes:", v13);

  -[BCNavigationBar setTranslatesAutoresizingMaskIntoConstraints:](self->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCNavigationBar setDelegate:](self->_toolbar, "setDelegate:", self);
  -[BCNavigationBar setAlpha:](self->_toolbar, "setAlpha:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController theme](self, "theme"));
  objc_msgSend(v14, "stylizeBCNavigationBar:", self->_toolbar);

  v15 = v4;
  objc_msgSend(v4, "addSubview:", self->_toolbar);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar leadingAnchor](self->_toolbar, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v51));
  v59[0] = v49;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar trailingAnchor](self->_toolbar, "trailingAnchor"));
  v17 = v15;
  v56 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v59[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar topAnchor](self->_toolbar, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  v59[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  v25 = self->_toolbar;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController leftToolbarItems](self, "leftToolbarItems"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController rightToolbarItems](self, "rightToolbarItems"));
  -[BCNavigationBar setLeftItems:rightItems:title:animated:](v25, "setLeftItems:rightItems:title:animated:", v26, v27, 0, 0);

  v28 = self->_toolbar;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource title](self->_resource, "title"));
  -[BCNavigationBar setTitle:](v28, "setTitle:", v29);

  v30 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentContainer = self->_contentContainer;
  self->_contentContainer = v30;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_contentContainer, "setClipsToBounds:", 1);
  objc_msgSend(v56, "addSubview:", self->_contentContainer);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentContainer, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "safeAreaLayoutGuide"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v50));
  v58[0] = v48;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentContainer, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "safeAreaLayoutGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  v58[1] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentContainer, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  v58[2] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentView](self, "contentView"));
  if (v40)
    -[BKExpandedContentViewController setInnerView:](self, "setInnerView:", v40);
  v41 = [BKActivityIndicatorOverlayView alloc];
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "contentTextColor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "colorWithAlphaComponent:", 0.7));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "backgroundColorForTraitEnvironment:", self));
  v45 = -[BKActivityIndicatorOverlayView initWithBackgroundColor:foregroundColor:](v41, "initWithBackgroundColor:foregroundColor:", v43, v44);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v45;

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "backgroundColorForTraitEnvironment:", self));
  -[BKExpandedContentViewController setBackgroundColor:](self, "setBackgroundColor:", v47);

  objc_msgSend(v56, "bringSubviewToFront:", self->_toolbar);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKExpandedContentViewController;
  -[BKExpandedContentViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  -[BKExpandedContentViewController setToolBarHidden:animated:](self, "setToolBarHidden:animated:", -[BKExpandedContentViewController toolbarHidden](self, "toolbarHidden"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController scrollView](self, "scrollView"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "zoomScale");
    -[BKExpandedContentViewController setInitialZoomScale:](self, "setInitialZoomScale:");
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;
  void *v22;
  void *v23;
  void *v24;

  v21.receiver = self;
  v21.super_class = (Class)BKExpandedContentViewController;
  -[BKExpandedContentViewController viewDidLayoutSubviews](&v21, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentToViewTopAnchorConstraint](self, "contentToViewTopAnchorConstraint"));

  if (!v3)
  {
    if (-[BKExpandedContentViewController wantsTapToHideToolbarGestureRecognizer](self, "wantsTapToHideToolbarGestureRecognizer"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentContainer, "topAnchor"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController view](self, "view"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
      -[BKExpandedContentViewController setContentToViewTopAnchorConstraint:](self, "setContentToViewTopAnchorConstraint:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentToViewTopAnchorConstraint](self, "contentToViewTopAnchorConstraint"));
      v22 = v8;
      v9 = &v22;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentToViewTopAnchorConstraint](self, "contentToViewTopAnchorConstraint"));
      v11 = objc_msgSend(v10, "isActive");

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentToViewTopAnchorConstraint](self, "contentToViewTopAnchorConstraint"));
        v24 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v13);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentContainer, "topAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "safeAreaLayoutGuide"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
      -[BCNavigationBar bounds](self->_toolbar, "bounds");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v17, v18));
      -[BKExpandedContentViewController setContentToViewTopAnchorConstraint:](self, "setContentToViewTopAnchorConstraint:", v19);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentToViewTopAnchorConstraint](self, "contentToViewTopAnchorConstraint"));
      v23 = v8;
      v9 = &v23;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKExpandedContentViewController setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 0, a3, 0.0);
  v5.receiver = self;
  v5.super_class = (Class)BKExpandedContentViewController;
  -[BKExpandedContentViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKExpandedContentViewController;
  v2 = -[BKExpandedContentViewController keyCommands](&v10, "keyCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "handleEscapeKey:"));
  objc_msgSend(v7, "addObject:", v8);

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)wantsDoubleTapGestureRecognizer
{
  return 1;
}

- (BOOL)wantsTapToHideToolbarGestureRecognizer
{
  return 1;
}

- (void)close:(BOOL)a3
{
  -[BKExpandedContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (id)leftToolbarItems
{
  return 0;
}

- (id)rightToolbarItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "done:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController themePage](self, "themePage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColorForNavbarButtons"));
  objc_msgSend(v3, "setTintColor:", v5);

  v8 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v6;
}

- (void)done:(id)a3
{
  if (-[BKExpandedContentViewController isViewLoaded](self, "isViewLoaded", a3))
    -[BKExpandedContentViewController close:](self, "close:", 1);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  BKExpandedContentViewController *v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  BKExpandedContentViewController *v13;
  id v14;

  v4 = a3;
  v6 = a4;
  v11[1] = 3221225472;
  v11[2] = sub_6B18C;
  v11[3] = &unk_1BEDE0;
  v13 = self;
  v14 = v6;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController delegate](v13, "delegate"));
  v10.receiver = v13;
  v10.super_class = (Class)BKExpandedContentViewController;
  v11[0] = _NSConcreteStackBlock;
  v7 = v13;
  v8 = v12;
  v9 = v6;
  -[BKExpandedContentViewController dismissViewControllerAnimated:completion:](&v10, "dismissViewControllerAnimated:completion:", v4, v11);

}

- (void)setInnerView:(id)a3
{
  UIView **p_innerView;
  UIView *innerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *doubleTapRecognizer;
  UITapGestureRecognizer *v18;
  UITapGestureRecognizer *singleTapRecognizer;
  UIView *v20;
  void *v21;
  void *v22;
  UIView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];

  v31 = a3;
  p_innerView = &self->_innerView;
  innerView = self->_innerView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraints](innerView, "constraints"));
  -[UIView removeConstraints:](innerView, "removeConstraints:", v7);

  -[UIView removeFromSuperview](self->_innerView, "removeFromSuperview");
  if (-[BKExpandedContentViewController wantsDoubleTapGestureRecognizer](self, "wantsDoubleTapGestureRecognizer"))
    -[UIView removeGestureRecognizer:](*p_innerView, "removeGestureRecognizer:", self->_doubleTapRecognizer);
  objc_storeStrong((id *)&self->_innerView, a3);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_innerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_contentContainer, "addSubview:", *p_innerView);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_innerView, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentContainer, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v32[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_innerView, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentContainer, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v32[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_innerView, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentContainer, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v32[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_innerView, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentContainer, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v32[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  if (-[BKExpandedContentViewController wantsDoubleTapGestureRecognizer](self, "wantsDoubleTapGestureRecognizer"))
  {
    v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleDoubleTap:");
    doubleTapRecognizer = self->_doubleTapRecognizer;
    self->_doubleTapRecognizer = v16;

    -[UITapGestureRecognizer setDelegate:](self->_doubleTapRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapRecognizer, "setNumberOfTapsRequired:", 2);
    -[UIView addGestureRecognizer:](*p_innerView, "addGestureRecognizer:", self->_doubleTapRecognizer);
  }
  if (-[BKExpandedContentViewController wantsTapToHideToolbarGestureRecognizer](self, "wantsTapToHideToolbarGestureRecognizer"))
  {
    v18 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleSingleTap:");
    singleTapRecognizer = self->_singleTapRecognizer;
    self->_singleTapRecognizer = v18;

    -[UITapGestureRecognizer setDelegate:](self->_singleTapRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](*p_innerView, "addGestureRecognizer:", self->_singleTapRecognizer);
  }
  if (-[BKExpandedContentViewController enableSwipeToDismiss](self, "enableSwipeToDismiss"))
  {
    v20 = *p_innerView;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController dragDismissManager](self, "dragDismissManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "swipeGesture"));
    -[UIView addGestureRecognizer:](v20, "addGestureRecognizer:", v22);

  }
  if (-[BKExpandedContentViewController enablePullToDismiss](self, "enablePullToDismiss"))
  {
    v23 = *p_innerView;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController dragDismissManager](self, "dragDismissManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "panGesture"));
    -[UIView addGestureRecognizer:](v23, "addGestureRecognizer:", v25);

  }
}

- (void)startActivityIndicatorAfterDelay:(double)a3
{
  -[BKExpandedContentViewController setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 1, 1, a3);
}

- (void)stopActivityIndicator:(BOOL)a3
{
  -[BKExpandedContentViewController setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 0, a3, 0.0);
}

- (void)setPreviewTitle:(id)a3
{
  -[BCNavigationBar setTitle:](self->_toolbar, "setTitle:", a3);
}

- (BEDragDismissGestureManager)dragDismissManager
{
  BEDragDismissGestureManager *dragDismissManager;
  BEDragDismissGestureManager *v4;
  BEDragDismissGestureManager *v5;

  dragDismissManager = self->_dragDismissManager;
  if (!dragDismissManager)
  {
    v4 = objc_opt_new(BEDragDismissGestureManager);
    v5 = self->_dragDismissManager;
    self->_dragDismissManager = v4;

    -[BEDragDismissGestureManager setDelegate:](self->_dragDismissManager, "setDelegate:", self);
    dragDismissManager = self->_dragDismissManager;
  }
  return dragDismissManager;
}

- (id)contentView
{
  -[BKExpandedContentViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (CGRect)getAnimationRect
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController presentingViewController](self, "presentingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  v12 = CGRectGetWidth(v14) * 0.25;
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v13 = CGRectGetHeight(v15) * 0.25;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return CGRectInset(v16, v12, v13);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController contentContainer](self, "contentContainer"));
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (BOOL)isCurrentlyZoomed
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController scrollView](self, "scrollView"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "zoomScale");
    v6 = v5;
    -[BKExpandedContentViewController initialZoomScale](self, "initialZoomScale");
    v8 = v6 != v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UIScrollView)scrollView
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(UIScrollView).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController innerView](self, "innerView", v3));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (UIScrollView *)v8;
}

- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL8 v6;
  BKActivityIndicatorOverlayView *activityIndicator;
  id v8;

  v6 = a4;
  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController view](self, "view"));
    -[BKActivityIndicatorOverlayView showIndicatorCenteredInView:animated:animationDelay:](activityIndicator, "showIndicatorCenteredInView:animated:animationDelay:", v8, v6, a5);

  }
  else
  {
    -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](self->_activityIndicator, "hideIndicatorAnimated:animationDelay:", a4, a5);
  }
}

- (void)handleDoubleTap:(id)a3
{
  -[BKExpandedContentViewController close:](self, "close:", 1);
}

- (void)handleSingleTap:(id)a3
{
  -[BKExpandedContentViewController setToolBarHidden:animated:](self, "setToolBarHidden:animated:", -[BKExpandedContentViewController toolbarHidden](self, "toolbarHidden", a3) ^ 1, 1);
}

- (void)handleEscapeKey:(id)a3
{
  -[BKExpandedContentViewController close:](self, "close:", 1);
}

- (void)setToolBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  BOOL v11;

  v4 = a4;
  -[BKExpandedContentViewController setToolbarHidden:](self, "setToolbarHidden:");
  if (!a3)
    -[BKExpandedContentViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6B998;
  v10[3] = &unk_1BFD40;
  v11 = a3;
  v10[4] = self;
  v7 = objc_retainBlock(v10);
  v8 = v7;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6BA54;
    v9[3] = &unk_1BEA88;
    v9[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v9, 0.2);
  }
  else
  {
    ((void (*)(_QWORD *))v7[2])(v7);
  }

}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  double x;
  double y;
  double width;
  double height;
  _BKExpandedContentViewControllerAnimator *v9;
  CGRect v11;

  -[BKExpandedContentViewController getAnimationRect](self, "getAnimationRect", a3, a4, a5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (CGRectIsEmpty(v11))
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_alloc_init(_BKExpandedContentViewControllerAnimator);
    -[_BKExpandedContentViewControllerAnimator setSourceRect:](v9, "setSourceRect:", x, y, width, height);
  }
  return v9;
}

- (BOOL)allowsDismissGesture
{
  void *v3;
  void *v4;
  double v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentViewController scrollView](self, "scrollView"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contentOffset");
    if (v5 <= 0.0)
      v6 = !-[BKExpandedContentViewController isCurrentlyZoomed](self, "isCurrentlyZoomed");
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)enablePullToDismiss
{
  return 1;
}

- (BOOL)enableSwipeToDismiss
{
  return 1;
}

- (void)dragDismissGestureDidPanToDismiss:(id)a3
{
  -[BKExpandedContentViewController close:](self, "close:", 1);
}

- (void)dragDismissGestureDidSwipeToDismiss:(id)a3
{
  -[BKExpandedContentViewController close:](self, "close:", 1);
}

- (BEExpandedContentDelegate)delegate
{
  return (BEExpandedContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BEExpandedContentPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (BKExpandedContentResource)resource
{
  return self->_resource;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentColor, a3);
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
}

- (UIView)innerView
{
  return self->_innerView;
}

- (BOOL)presentingFromTOC
{
  return self->_presentingFromTOC;
}

- (void)setPresentingFromTOC:(BOOL)a3
{
  self->_presentingFromTOC = a3;
}

- (BCNavigationBar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UIView)contentContainer
{
  return self->_contentContainer;
}

- (void)setContentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainer, a3);
}

- (UITapGestureRecognizer)singleTapRecognizer
{
  return self->_singleTapRecognizer;
}

- (void)setSingleTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singleTapRecognizer, a3);
}

- (UITapGestureRecognizer)doubleTapRecognizer
{
  return self->_doubleTapRecognizer;
}

- (void)setDoubleTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapRecognizer, a3);
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIImageView)animationImageView
{
  return self->_animationImageView;
}

- (void)setAnimationImageView:(id)a3
{
  objc_storeStrong((id *)&self->_animationImageView, a3);
}

- (UIView)contentObscuringView
{
  return self->_contentObscuringView;
}

- (void)setContentObscuringView:(id)a3
{
  objc_storeStrong((id *)&self->_contentObscuringView, a3);
}

- (CGRect)animationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_animationRect.origin.x;
  y = self->_animationRect.origin.y;
  width = self->_animationRect.size.width;
  height = self->_animationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnimationRect:(CGRect)a3
{
  self->_animationRect = a3;
}

- (NSLayoutConstraint)contentToViewTopAnchorConstraint
{
  return self->_contentToViewTopAnchorConstraint;
}

- (void)setContentToViewTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentToViewTopAnchorConstraint, a3);
}

- (void)setDragDismissManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragDismissManager, a3);
}

- (double)initialZoomScale
{
  return self->_initialZoomScale;
}

- (void)setInitialZoomScale:(double)a3
{
  self->_initialZoomScale = a3;
}

- (BOOL)toolbarHidden
{
  return self->_toolbarHidden;
}

- (void)setToolbarHidden:(BOOL)a3
{
  self->_toolbarHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragDismissManager, 0);
  objc_storeStrong((id *)&self->_contentToViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_contentObscuringView, 0);
  objc_storeStrong((id *)&self->_animationImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
