@implementation BKLibraryBookCoverViewController

- (BKLibraryBookCoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (BKLibraryBookCoverViewController)initWithCoder:(id)a3
{

  return 0;
}

- (BKLibraryBookCoverViewController)initWithCoverImage:(id)a3 shadowImage:(id)a4
{
  id v7;
  id v8;
  BKLibraryBookCoverViewController *v9;
  BKLibraryBookCoverViewController *v10;
  uint64_t v11;
  UIColor *backgroundColor;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookCoverViewController;
  v9 = -[BKLibraryBookCoverViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverImage, a3);
    objc_storeStrong((id *)&v10->_shadowImage, a4);
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController dealloc](&v2, "dealloc");
}

- (BOOL)isNightMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "bc_userInterfaceStyleDark");

  return v3;
}

- (void)_updateImage:(id)a3
{
  UIImageView **p_imageView;
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  p_imageView = &self->_imageView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_imageView);
  objc_msgSend(WeakRetained, "setImage:", v5);

  v7 = objc_loadWeakRetained((id *)p_imageView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  if (v10 / v12 <= v15 / v17)
  {
    if (v10 / v12 < v15 / v17)
      v15 = v10 * (v17 / v12);
  }
  else
  {
    v17 = v12 * (v15 / v10);
  }
  -[BKLibraryBookCoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v15, v17);
}

- (void)_updateShadowImage:(id)a3
{
  -[UIImageView setImage:](self->_shadowImageView, "setImage:", a3);
}

- (void)_adjustShadowForCurrentCoverBounds
{
  void *v3;
  UIImage *shadowImage;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImage](self, "shadowImage"));

  if (v3)
  {
    shadowImage = self->_shadowImage;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageView](self, "imageView"));
    objc_msgSend(v14, "frame");
    -[UIImage bk_frameForImageFittedInFrame:](shadowImage, "bk_frameForImageFittedInFrame:");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImageView](self, "shadowImageView"));
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)_setupShadowEffects
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImageView](self, "shadowImageView"));
  +[BKBookBloomOpenAnimator setBlurRadius:forView:](BKBookBloomOpenAnimator, "setBlurRadius:forView:", v3, 60.0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImageView](self, "shadowImageView"));
  +[BKBookBloomOpenAnimator setBrightnessFilter:forView:](BKBookBloomOpenAnimator, "setBrightnessFilter:forView:", v4, -0.6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController viewDidAppear:](&v5, "viewDidAppear:");
  -[BKLibraryBookCoverViewController _updateBackButtonAnimated:](self, "_updateBackButtonAnimated:", v3);
}

- (void)viewDidLoad
{
  void *v3;
  UIViewController *v4;
  UIViewController *coverImageViewController;
  UIImageView *v6;
  UIImageView *shadowImageView;
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
  id v26;
  UIImage *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UINavigationItem *v43;
  void *v44;
  UIImage *v45;
  UIImage *v46;
  objc_super v47;
  _QWORD v48[2];

  v47.receiver = self;
  v47.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController viewDidLoad](&v47, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (UIViewController *)objc_msgSend(objc_alloc((Class)UIViewController), "initWithNibName:bundle:", 0, 0);
  coverImageViewController = self->_coverImageViewController;
  self->_coverImageViewController = v4;

  v6 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", self->_shadowImage);
  shadowImageView = self->_shadowImageView;
  self->_shadowImageView = v6;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_shadowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKLibraryBookCoverViewController _setupShadowEffects](self, "_setupShadowEffects");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImageView](self, "shadowImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageView](self, "imageView"));
  objc_msgSend(v8, "insertSubview:belowSubview:", v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackBottomConstraint](self, "progressTrackBottomConstraint"));
  objc_msgSend(v11, "constant");
  -[BKLibraryBookCoverViewController setProgressTrackBottomSpecDistance:](self, "setProgressTrackBottomSpecDistance:");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackLeadingConstraint](self, "progressTrackLeadingConstraint"));
  objc_msgSend(v12, "constant");
  -[BKLibraryBookCoverViewController setProgressTrackLeadingSpecDistance:](self, "setProgressTrackLeadingSpecDistance:");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackTrailingConstraint](self, "progressTrackTrailingConstraint"));
  objc_msgSend(v13, "constant");
  -[BKLibraryBookCoverViewController setProgressTrackTrailingSpecDistance:](self, "setProgressTrackTrailingSpecDistance:");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKBookBloomOpenAnimator backgroundColorForZoomedBookCover](BKBookBloomOpenAnimator, "backgroundColorForZoomedBookCover"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  objc_msgSend(v15, "setBackgroundColor:", v14);

  if (self->_coverImage || self->_fallbackImage)
    -[BKLibraryBookCoverViewController _updateImage:](self, "_updateImage:");
  -[BKLibraryBookCoverViewController _updateShadowImage:](self, "_updateShadowImage:", self->_shadowImage);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v16, "setLoadingProgress:", 1.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v17, "setReadingProgress:", 0.0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v18, "setAlpha:", 0.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v19, "setThickness:", 3.0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v20, "setRoundEndCaps:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v21, "setTrackForegroundColor:", v3);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.2));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v22, v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  objc_msgSend(v25, "setTrackBackgroundColor:", v24);

  -[BKLibraryBookCoverViewController _updateProgress](self, "_updateProgress");
  v26 = objc_alloc_init((Class)UINavigationBar);
  v27 = objc_opt_new(UIImage);
  objc_msgSend(v26, "setBackgroundImage:forBarMetrics:", v27, 0);

  objc_msgSend(v26, "setTranslucent:", 1);
  objc_msgSend(v26, "setTintColor:", v3);
  objc_msgSend(v26, "_setHidesShadow:", 1);
  objc_msgSend(v26, "setDelegate:", self);
  objc_msgSend(v26, "setAlpha:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", v26);

  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leftAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leftAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v31));
  objc_msgSend(v32, "setActive:", 1);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "rightAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "rightAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v35));
  objc_msgSend(v36, "setActive:", 1);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "safeAreaLayoutGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v40));
  objc_msgSend(v41, "setActive:", 1);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController navBarBackItem](self, "navBarBackItem"));
  v48[0] = v42;
  v43 = objc_opt_new(UINavigationItem);
  v48[1] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
  objc_msgSend(v26, "setItems:animated:", v44, 0);

  if (!-[BKLibraryBookCoverViewController showBackChevron](self, "showBackChevron"))
  {
    v45 = objc_opt_new(UIImage);
    objc_msgSend(v26, "setBackIndicatorImage:", v45);

    v46 = objc_opt_new(UIImage);
    objc_msgSend(v26, "setBackIndicatorTransitionMaskImage:", v46);

  }
  -[BKLibraryBookCoverViewController setNavBarForBackButton:](self, "setNavBarForBackButton:", v26);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
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
  id v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;

  v51.receiver = self;
  v51.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController viewWillLayoutSubviews](&v51, "viewWillLayoutSubviews");
  -[BKLibraryBookCoverViewController coverAnimationSourceFrame](self, "coverAnimationSourceFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  v16 = v15 - CGRectGetMaxY(v52);
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  v17 = v13 - CGRectGetMaxX(v53);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageTopConstraint](self, "imageTopConstraint"));
  objc_msgSend(v18, "setConstant:", v6);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageBottomConstraint](self, "imageBottomConstraint"));
  objc_msgSend(v19, "setConstant:", v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageLeadingConstraint](self, "imageLeadingConstraint"));
  objc_msgSend(v20, "setConstant:", v4);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageTrailingConstraint](self, "imageTrailingConstraint"));
  objc_msgSend(v21, "setConstant:", v17);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController traitCollection](self, "traitCollection"));
  v23 = objc_msgSend(v22, "horizontalSizeClass");

  if (v23 == (id)2)
  {
    v24 = (v13 + -320.0) * 0.5;
    -[BKLibraryBookCoverViewController progressTrackBottomSpecDistance](self, "progressTrackBottomSpecDistance");
    v26 = v16 + v25 + -32.0;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackBottomConstraint](self, "progressTrackBottomConstraint"));
    objc_msgSend(v27, "setConstant:", v26);

    -[BKLibraryBookCoverViewController progressTrackLeadingSpecDistance](self, "progressTrackLeadingSpecDistance");
    v29 = v24 + v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackLeadingConstraint](self, "progressTrackLeadingConstraint"));
    objc_msgSend(v30, "setConstant:", v29);

    -[BKLibraryBookCoverViewController progressTrackTrailingSpecDistance](self, "progressTrackTrailingSpecDistance");
    v32 = v24 + v31;
  }
  else
  {
    -[BKLibraryBookCoverViewController progressTrackBottomSpecDistance](self, "progressTrackBottomSpecDistance");
    v34 = v16 + v33 + -24.0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackBottomConstraint](self, "progressTrackBottomConstraint"));
    objc_msgSend(v35, "setConstant:", v34);

    -[BKLibraryBookCoverViewController progressTrackLeadingSpecDistance](self, "progressTrackLeadingSpecDistance");
    v37 = v4 + v36 + 1.0;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackLeadingConstraint](self, "progressTrackLeadingConstraint"));
    objc_msgSend(v38, "setConstant:", v37);

    -[BKLibraryBookCoverViewController progressTrackTrailingSpecDistance](self, "progressTrackTrailingSpecDistance");
    v32 = v17 + v39 + 1.0;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrackTrailingConstraint](self, "progressTrackTrailingConstraint"));
  objc_msgSend(v40, "setConstant:", v32);

  -[BKLibraryBookCoverViewController coverAnimationSourceFrame](self, "coverAnimationSourceFrame");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController coverImageViewController](self, "coverImageViewController"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "view"));
  objc_msgSend(v50, "setFrame:", v42, v44, v46, v48);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v18, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "image"));
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

    objc_msgSend(v6, "bounds");
    v14 = v13;
    v16 = v15;
    v17 = v13 / v15;
    if (v10 / v12 <= v17)
    {
      if (v10 / v12 < v17)
        v14 = v10 * (v16 / v12);
    }
    else
    {
      v16 = v12 * (v13 / v10);
    }
    -[BKLibraryBookCoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v14, v16, v10 / v12);
  }

}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController navBarForBackButton](self, "navBarForBackButton", a3, a4));
  objc_msgSend(v4, "setAlpha:", 0.0);

  return 1;
}

- (void)navigationBar:(id)a3 didPopItem:(id)a4
{
  id v5;

  if (-[BKLibraryBookCoverViewController showBackChevron](self, "showBackChevron", a3, a4))
  {
    -[BKLibraryBookCoverViewController im_dismissAnimated:](self, "im_dismissAnimated:", 1);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController delegate](self, "delegate"));
    objc_msgSend(v5, "dismissLibraryBookCoverViewController:animated:", self, 1);

  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[BKLibraryBookCoverViewController _adjustShadowForCurrentCoverBounds](self, "_adjustShadowForCurrentCoverBounds");
}

- (void)_updateProgress
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10015FC50;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.1);
}

- (void)setProgressValue:(id)a3
{
  float v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->_progressValue, "floatValue");
  if (v6 != v7 || !v8 || !self->_progressValue)
  {
    objc_storeStrong((id *)&self->_progressValue, a3);
    -[BKLibraryBookCoverViewController _updateProgress](self, "_updateProgress");
  }

}

- (void)setShowBackButton:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  if (self->_showBackButton != a3)
  {
    self->_showBackButton = a3;
    -[BKLibraryBookCoverViewController _updateBackButtonAnimated:](self, "_updateBackButtonAnimated:", 1);
    v4 = !self->_showBackButton;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController navBarForBackButton](self, "navBarForBackButton"));
    objc_msgSend(v5, "setAccessibilityElementsHidden:", v4);

  }
}

- (void)_updateBackButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10015FE98;
  v6[3] = &unk_1008E72C0;
  v6[4] = self;
  v4 = objc_retainBlock(v6);
  v5 = v4;
  if (v3)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.2);
  else
    ((void (*)(_QWORD *))v4[2])(v4);

}

- (void)setStatusBarOverrideViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_statusBarOverrideViewController, obj);
    -[BKLibraryBookCoverViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[BKLibraryBookCoverViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    v5 = obj;
  }

}

- (BOOL)prefersStatusBarHidden
{
  id WeakRetained;
  void *v3;
  unsigned __int8 v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "prefersStatusBarHidden");
  else
    v4 = 1;

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "preferredStatusBarStyle");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  return 1;
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 0;
}

- (id)coverAnimationHostTopViewsToFadeOut
{
  void *v3;
  void *v4;
  void *v6;

  -[BKLibraryBookCoverViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController progressTrack](self, "progressTrack"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (CGRect)coverAnimationSourceFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageView](self, "imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  if ((-[BKLibraryBookCoverViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0)
    v9 = 1;
  else
    v9 = (uint64_t)-[BKLibraryBookCoverViewController im_isCompactHeight](self, "im_isCompactHeight");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  +[BKBookBloomOpenAnimator zoomedFrameForCoverWithSize:isCompact:containerViewBounds:](BKBookBloomOpenAnimator, "zoomedFrameForCoverWithSize:isCompact:containerViewBounds:", v9, v6, v8, v11, v12, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)coverAnimationSourceImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return v3;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 1;
}

- (void)coverAnimationSourcePrepare
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageView](self, "imageView"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImageView](self, "shadowImageView"));
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)coverAnimationSourceFinalize
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController imageView](self, "imageView"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController shadowImageView](self, "shadowImageView"));
  objc_msgSend(v4, "setHidden:", 0);

}

- (BOOL)wallpaperStyleWantsTransparentLightEffect
{
  return 1;
}

- (void)bookOpenRevealDidEnd
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewController view](self, "view"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (BKLibraryBookCoverViewControllerDelegate)delegate
{
  return (BKLibraryBookCoverViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)progressText
{
  return self->_progressText;
}

- (void)setProgressText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)progressValue
{
  return self->_progressValue;
}

- (BOOL)showBackButton
{
  return self->_showBackButton;
}

- (BOOL)showBackChevron
{
  return self->_showBackChevron;
}

- (void)setShowBackChevron:(BOOL)a3
{
  self->_showBackChevron = a3;
}

- (UIViewController)coverImageViewController
{
  return self->_coverImageViewController;
}

- (UIViewController)statusBarOverrideViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);
}

- (UINavigationItem)navBarBackItem
{
  return self->_navBarBackItem;
}

- (void)setNavBarBackItem:(id)a3
{
  objc_storeStrong((id *)&self->_navBarBackItem, a3);
}

- (UINavigationBar)navBarForBackButton
{
  return self->_navBarForBackButton;
}

- (void)setNavBarForBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_navBarForBackButton, a3);
}

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (UIImage)fallbackImage
{
  return self->_fallbackImage;
}

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImageView, a3);
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (NSLayoutConstraint)imageTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_imageTopConstraint);
}

- (void)setImageTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_imageTopConstraint, a3);
}

- (NSLayoutConstraint)imageTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_imageTrailingConstraint);
}

- (void)setImageTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_imageTrailingConstraint, a3);
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_imageLeadingConstraint);
}

- (void)setImageLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_imageLeadingConstraint, a3);
}

- (NSLayoutConstraint)imageBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_imageBottomConstraint);
}

- (void)setImageBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_imageBottomConstraint, a3);
}

- (BKClassicScrubberTrack)progressTrack
{
  return (BKClassicScrubberTrack *)objc_loadWeakRetained((id *)&self->_progressTrack);
}

- (void)setProgressTrack:(id)a3
{
  objc_storeWeak((id *)&self->_progressTrack, a3);
}

- (NSLayoutConstraint)progressTrackBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_progressTrackBottomConstraint);
}

- (void)setProgressTrackBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_progressTrackBottomConstraint, a3);
}

- (NSLayoutConstraint)progressTrackTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_progressTrackTrailingConstraint);
}

- (void)setProgressTrackTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_progressTrackTrailingConstraint, a3);
}

- (NSLayoutConstraint)progressTrackLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_progressTrackLeadingConstraint);
}

- (void)setProgressTrackLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_progressTrackLeadingConstraint, a3);
}

- (double)progressTrackBottomSpecDistance
{
  return self->_progressTrackBottomSpecDistance;
}

- (void)setProgressTrackBottomSpecDistance:(double)a3
{
  self->_progressTrackBottomSpecDistance = a3;
}

- (double)progressTrackLeadingSpecDistance
{
  return self->_progressTrackLeadingSpecDistance;
}

- (void)setProgressTrackLeadingSpecDistance:(double)a3
{
  self->_progressTrackLeadingSpecDistance = a3;
}

- (double)progressTrackTrailingSpecDistance
{
  return self->_progressTrackTrailingSpecDistance;
}

- (void)setProgressTrackTrailingSpecDistance:(double)a3
{
  self->_progressTrackTrailingSpecDistance = a3;
}

- (UIColor)savedBackgroundColor
{
  return self->_savedBackgroundColor;
}

- (void)setSavedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_savedBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_progressTrackLeadingConstraint);
  objc_destroyWeak((id *)&self->_progressTrackTrailingConstraint);
  objc_destroyWeak((id *)&self->_progressTrackBottomConstraint);
  objc_destroyWeak((id *)&self->_progressTrack);
  objc_destroyWeak((id *)&self->_imageBottomConstraint);
  objc_destroyWeak((id *)&self->_imageLeadingConstraint);
  objc_destroyWeak((id *)&self->_imageTrailingConstraint);
  objc_destroyWeak((id *)&self->_imageTopConstraint);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_coverImage, 0);
  objc_storeStrong((id *)&self->_navBarForBackButton, 0);
  objc_storeStrong((id *)&self->_navBarBackItem, 0);
  objc_destroyWeak((id *)&self->_statusBarOverrideViewController);
  objc_storeStrong((id *)&self->_coverImageViewController, 0);
  objc_storeStrong((id *)&self->_progressValue, 0);
  objc_storeStrong((id *)&self->_progressText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
