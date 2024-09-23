@implementation OverlayContainerViewController

- (OverlayContainerDimmingBehaviour)dimmingBehaviour
{
  OverlayContainerDimmingBehaviour *v3;
  OverlayContainerDimmingBehaviour *dimmingBehaviour;
  OverlayContainerDimmingController *v5;
  DimmingBehaviour *v6;
  void *v7;
  OverlayContainerDimmingBehaviour *v8;
  OverlayContainerDimmingBehaviour *v9;

  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    dimmingBehaviour = self->_dimmingBehaviour;
    if (!dimmingBehaviour)
    {
      v5 = [OverlayContainerDimmingController alloc];
      v6 = sub_10075C31C(&stru_1011C5AA0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = -[OverlayContainerDimmingController initWithDimmingBehaviour:customBehaviours:](v5, "initWithDimmingBehaviour:customBehaviours:", v7, 0);
      v9 = self->_dimmingBehaviour;
      self->_dimmingBehaviour = v8;

      dimmingBehaviour = self->_dimmingBehaviour;
    }
    v3 = dimmingBehaviour;
  }
  return v3;
}

- (void)_updateDimmingViewsWithAlpha:(double)a3 animated:(BOOL)a4
{
  _QWORD v4[6];

  if (a4)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10068B404;
    v4[3] = &unk_1011AD518;
    v4[4] = self;
    *(double *)&v4[5] = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.25);
  }
  else
  {
    -[OverlayContainerViewController _updateDimmingViewsWithAlpha:](self, "_updateDimmingViewsWithAlpha:", a3);
  }
}

- (void)_updateDimmingViewsWithAlpha:(double)a3
{
  _QWORD *v5;
  unint64_t v6;
  __n128 v7;
  double v8;
  double v9;
  _QWORD v10[5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10068B4D4;
  v10[3] = &unk_1011B2300;
  v10[4] = self;
  v5 = objc_retainBlock(v10);
  v6 = -[ContainerViewController containerStyle](self, "containerStyle");
  v7.n128_u64[0] = 0;
  if (((1 << v6) & 0xE3) != 0)
    v8 = a3;
  else
    v8 = 0.0;
  if (((1 << v6) & 0xE3) != 0)
    v9 = 0.0;
  else
    v9 = a3;
  if (v6 <= 7)
  {
    v7.n128_f64[0] = v8;
    a3 = v9;
  }
  ((void (*)(_QWORD *, __n128))v5[2])(v5, v7);
  -[UIView setAlpha:](self->_topDimmingView, "setAlpha:", a3);

}

- (void)_updateDimming
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  CGRect v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController dimmingBehaviour](self, "dimmingBehaviour"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "frame");
    objc_msgSend(v5, "overlayContainer:dimmingPercentageForCurrentContaineeWithNewHeight:", self, CGRectGetHeight(v13));
    v9 = v8;

    v10 = fmin(fmax(v9, 0.0), 1.0);
    -[OverlayContainerViewController currentDimmingValue](self, "currentDimmingValue");
    v12 = v10 == 1.0 && v11 == 0.0;
    -[OverlayContainerViewController _updateDimmingViewsWithAlpha:animated:](self, "_updateDimmingViewsWithAlpha:animated:", v12, v10);
  }
}

- (void)restoreDimmingViewAlphaCacheIfNeeded
{
  NSNumber *dimmingViewDisabledAlphaUpdateCache;
  NSNumber *v4;

  if (!self->_dimmingViewDisabled)
  {
    dimmingViewDisabledAlphaUpdateCache = self->_dimmingViewDisabledAlphaUpdateCache;
    if (dimmingViewDisabledAlphaUpdateCache)
    {
      -[NSNumber doubleValue](dimmingViewDisabledAlphaUpdateCache, "doubleValue");
      -[DimmingContainerView setAlpha:](self->_dimmingView, "setAlpha:");
      v4 = self->_dimmingViewDisabledAlphaUpdateCache;
      self->_dimmingViewDisabledAlphaUpdateCache = 0;

    }
  }
}

- (double)currentDimmingValue
{
  unint64_t v3;
  int *v4;
  double result;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 > 7)
    v4 = &OBJC_IVAR___OverlayContainerViewController__topDimmingView;
  else
    v4 = off_1011BFBA8[v3];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v4), "alpha");
  return result;
}

- (void)transitionEnded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController transitionEnded](&v3, "transitionEnded");
  -[OverlayContainerViewController _updateDimming](self, "_updateDimming");
}

- (void)updateViewsForCustomPresentationTransition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  DimmingContainerView *dimmingView;

  self->_dimmingViewDisabled = 1;
  dimmingView = self->_dimmingView;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &dimmingView, 1));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v10, "setAlpha:", 0.0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v11, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v12, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v13, "setNeedsUpdateComponent:animated:", CFSTR("floatingControls"), 1);

}

- (void)updateViewsForCustomDismissalTransition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  DimmingContainerView *dimmingView;

  self->_dimmingViewDisabled = 0;
  dimmingView = self->_dimmingView;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &dimmingView, 1));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v10, "setAlpha:", 1.0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[OverlayContainerViewController restoreDimmingViewAlphaCacheIfNeeded](self, "restoreDimmingViewAlphaCacheIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v11, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v12, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v13, "setNeedsUpdateComponent:animated:", CFSTR("floatingControls"), 1);

}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (void)viewDidLoad
{
  __int128 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UIView *v14;
  UIView *topContentView;
  void *v16;
  void *v17;
  UIView *v18;
  void *v19;
  PassThroughView *v20;
  void *v21;
  UIView *overlayView;
  PassThroughView *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  UILayoutGuide *v29;
  UILayoutGuide *innerLayoutGuide;
  objc_class *v31;
  NSString *v32;
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
  void *v43;
  NSArray *v44;
  NSArray *innerLayoutGuideConstraints;
  UIView *v46;
  UIView *topDimmingView;
  void *v48;
  void *v49;
  void *v50;
  DimmingContainerView *v51;
  DimmingContainerView *dimmingView;
  void *v53;
  DimmingContainerView *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;
  _QWORD v62[4];

  v61.receiver = self;
  v61.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController viewDidLoad](&v61, "viewDidLoad");
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->_modeTransitiontransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->_modeTransitiontransform.c = v3;
  *(_OWORD *)&self->_modeTransitiontransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("OverlayContainerView"));

  v14 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v6, v8, v10, v12);
  topContentView = self->_topContentView;
  self->_topContentView = v14;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](self->_topContentView, "setBackgroundColor:", v16);

  -[UIView setClipsToBounds:](self->_topContentView, "setClipsToBounds:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  v18 = self->_topContentView;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v17, "insertSubview:belowSubview:", v18, v19);

  v20 = -[PassThroughView initWithFrame:]([PassThroughView alloc], "initWithFrame:", v6, v8, v10, v12);
  -[PassThroughView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PassThroughView setBackgroundColor:](v20, "setBackgroundColor:", v21);

  -[PassThroughView setDelegate:](v20, "setDelegate:", self);
  overlayView = self->_overlayView;
  self->_overlayView = (UIView *)v20;
  v23 = v20;

  v24 = (objc_class *)objc_opt_class(self);
  v25 = NSStringFromClass(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.OverlayView"), v26));
  -[UIView setAccessibilityIdentifier:](self->_overlayView, "setAccessibilityIdentifier:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  objc_msgSend(v28, "insertSubview:belowSubview:", self->_overlayView, self->_topContentView);

  v29 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  innerLayoutGuide = self->_innerLayoutGuide;
  self->_innerLayoutGuide = v29;

  v31 = (objc_class *)objc_opt_class(OverlayContainerViewController);
  v32 = NSStringFromClass(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.innerLayoutGuide"), v33));
  -[UILayoutGuide setIdentifier:](self->_innerLayoutGuide, "setIdentifier:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  objc_msgSend(v35, "addLayoutGuide:", self->_innerLayoutGuide);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_innerLayoutGuide, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView topAnchor](v23, "topAnchor"));
  -[ContainerViewController edgePadding](self, "edgePadding");
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59));
  v62[0] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_innerLayoutGuide, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView leadingAnchor](v23, "leadingAnchor"));
  -[ContainerViewController edgePadding](self, "edgePadding");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v36));
  v62[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView bottomAnchor](v23, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_innerLayoutGuide, "bottomAnchor"));
  -[ContainerViewController bottomEdgePadding](self, "bottomEdgePadding");
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39));
  v62[2] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView trailingAnchor](v23, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_innerLayoutGuide, "trailingAnchor"));
  -[ContainerViewController edgePadding](self, "edgePadding");
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42));
  v62[3] = v43;
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 4));
  innerLayoutGuideConstraints = self->_innerLayoutGuideConstraints;
  self->_innerLayoutGuideConstraints = v44;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_innerLayoutGuideConstraints);
  v46 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v6, v8, v10, v12);
  topDimmingView = self->_topDimmingView;
  self->_topDimmingView = v46;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topDimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
  -[UIView setBackgroundColor:](self->_topDimmingView, "setBackgroundColor:", v48);

  -[UIView setAlpha:](self->_topDimmingView, "setAlpha:", 0.0);
  -[UIView setUserInteractionEnabled:](self->_topDimmingView, "setUserInteractionEnabled:", 0);
  -[UIView setClipsToBounds:](self->_topDimmingView, "setClipsToBounds:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_topDimmingView, "layer"));
  objc_msgSend(v49, "setCornerRadius:", 10.0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  objc_msgSend(v50, "insertSubview:aboveSubview:", self->_topDimmingView, self->_topContentView);

  v51 = -[DimmingContainerView initWithFrame:]([DimmingContainerView alloc], "initWithFrame:", v6, v8, v10, v12);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v51;

  -[DimmingContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_dimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[DimmingContainerView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
  -[DimmingContainerView setUserInteractionEnabled:](self->_dimmingView, "setUserInteractionEnabled:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
  v54 = self->_dimmingView;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
  objc_msgSend(v53, "insertSubview:belowSubview:", v54, v55);

  v56 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_dismissAction:");
  -[DimmingContainerView addGestureRecognizer:](self->_dimmingView, "addGestureRecognizer:", v56);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[OverlayContainerViewController setupConstraints](self, "setupConstraints");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView superview](self->_topBannerView, "superview"));

  if (v3)
  {
    -[OverlayContainerViewController _topBannerMaxHeight](self, "_topBannerMaxHeight");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
    objc_msgSend(v6, "setMaximumHeight:", v5);

    -[TopBannerView systemLayoutSizeFittingSize:](self->_topBannerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v8 = v7;
    -[ContainerViewController edgePadding](self, "edgePadding");
    v10 = -(v8 + v9);
  }
  else
  {
    v10 = 0.0;
  }
  -[NSLayoutConstraint constant](self->_overlayToTopInsetConstraint, "constant");
  if (v10 != v11)
  {
    -[NSLayoutConstraint setConstant:](self->_overlayToTopInsetConstraint, "setConstant:", v10);
    -[ContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
  }
  -[OverlayContainerViewController updateEdgePadding](self, "updateEdgePadding");
  -[OverlayContainerViewController layoutGuideUpdated](self, "layoutGuideUpdated");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)OverlayContainerViewController;
  v7 = a4;
  -[ContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10068C3A8;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_1011BFB88, v8);

}

- (void)applyTransitionWithProgress:(double)a3
{
  void *v5;
  void *v6;
  CGFloat MaxY;
  double v8;
  void *v9;
  __int128 v10;
  CGAffineTransform *p_modeTransitiontransform;
  __int128 v12;
  void *v13;
  int v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  CGAffineTransform v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  objc_super v40;
  _BYTE v41[128];
  CGRect v42;
  CGRect v43;

  v40.receiver = self;
  v40.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController applyTransitionWithProgress:](&v40, "applyTransitionWithProgress:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  objc_msgSend(v5, "setAlpha:", a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v6, "frame");
  MaxY = CGRectGetMaxY(v42);
  v8 = 1.0 - a3;
  CGAffineTransformMakeTranslation(&v39, 0.0, -(MaxY * v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v38 = v39;
  objc_msgSend(v9, "setTransform:", &v38);

  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v37.c = v10;
  *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  p_modeTransitiontransform = &self->_modeTransitiontransform;
  v12 = *(_OWORD *)&self->_modeTransitiontransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_modeTransitiontransform.a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_modeTransitiontransform.tx;
  *(_OWORD *)&t2.a = *(_OWORD *)&v37.a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)&v37.tx;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
      v14 = objc_msgSend(v13, "effectiveUserInterfaceLayoutDirection") == (id)1;

      v15 = -[ContainerViewController stackOnOppositeSide](self, "stackOnOppositeSide");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
      objc_msgSend(v16, "frame");
      if (v14 == v15)
        v21 = -(CGRectGetMaxX(*(CGRect *)&v17) * v8);
      else
        v21 = v8 * CGRectGetMinX(*(CGRect *)&v17);
      v22 = 0.0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
      objc_msgSend(v16, "frame");
      v22 = v8 * CGRectGetHeight(v43);
      v21 = 0.0;
    }
    CGAffineTransformMakeTranslation(&v37, v21, v22);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleCardViews](self, "visibleCardViews"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v27);
        v30 = v37;
        objc_msgSend(v28, "setTransform:", &v30);
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v25);
  }

  v29 = *(_OWORD *)&v37.c;
  *(_OWORD *)&p_modeTransitiontransform->a = *(_OWORD *)&v37.a;
  *(_OWORD *)&p_modeTransitiontransform->c = v29;
  *(_OWORD *)&p_modeTransitiontransform->tx = *(_OWORD *)&v37.tx;
}

- (void)_dismissAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController dimmingBehaviour](self, "dimmingBehaviour", a3));
  v5 = objc_msgSend(v4, "overlayContainerLayoutForContaineeDimmingDismissal:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));
  objc_msgSend(v6, "wantsLayout:", v5);

}

- (void)updateEdgePadding
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_innerLayoutGuideConstraints;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "firstAttribute", (_QWORD)v9) == (id)4)
        {
          -[ContainerViewController bottomEdgePadding](self, "bottomEdgePadding");
        }
        else if (objc_msgSend(v8, "firstAttribute") == (id)5)
        {
          sub_1005EC29C();
        }
        else
        {
          -[ContainerViewController edgePadding](self, "edgePadding");
        }
        objc_msgSend(v8, "setConstant:");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)layoutGuideUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  UIView *v15;
  UIView *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *overlayToTopInsetConstraint;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[8];
  _BYTE v54[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapInsetsLayoutGuide"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraintsAffectingLayoutForAxis:](self->_overlayView, "constraintsAffectingLayoutForAxis:", 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraintsAffectingLayoutForAxis:](self->_overlayView, "constraintsAffectingLayoutForAxis:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8));

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            v15 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstItem"));
            v16 = v15;
            if (v15 == self->_overlayView)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "secondItem"));
              v18 = v17 == v4;

              if (v18)
              {

                goto LABEL_15;
              }
            }
            else
            {

            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v11)
            continue;
          break;
        }
      }

      -[NSLayoutConstraint setActive:](self->_overlayToTopInsetConstraint, "setActive:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_overlayView, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      overlayToTopInsetConstraint = self->_overlayToTopInsetConstraint;
      self->_overlayToTopInsetConstraint = v21;

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[DimmingContainerView topAnchor](self->_dimmingView, "topAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, -6.0));
      v53[0] = v45;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[DimmingContainerView bottomAnchor](self->_dimmingView, "bottomAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
      v53[1] = v41;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[DimmingContainerView leadingAnchor](self->_dimmingView, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
      v53[2] = v37;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DimmingContainerView trailingAnchor](self->_dimmingView, "trailingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
      v53[3] = v33;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_overlayView, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
      v53[4] = v30;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_overlayView, "trailingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
      v53[5] = v25;
      v53[6] = self->_overlayToTopInsetConstraint;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_overlayView, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
      v53[7] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 8));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

      -[OverlayContainerViewController updateContainerStyleDependentConstraints](self, "updateContainerStyleDependentConstraints");
LABEL_15:

    }
  }

}

- (void)setupConstraints
{
  UIView *topContentView;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *topContentConstraint;
  void *v11;
  void *v12;
  double v13;
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
  _OWORD v28[3];
  _QWORD v29[6];

  if (!self->_topContentConstraint)
  {
    topContentView = self->_topContentView;
    v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v28[1] = v4;
    v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[UIView setTransform:](topContentView, "setTransform:", v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_topContentView, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewportLayoutGuide"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
    topContentConstraint = self->_topContentConstraint;
    self->_topContentConstraint = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_topContentView, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 0.0));

    LODWORD(v13) = 1.0;
    v27 = v12;
    objc_msgSend(v12, "setPriority:", v13);
    v29[0] = self->_topContentConstraint;
    v29[1] = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_topDimmingView, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_topContentView, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v29[2] = v24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_topDimmingView, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_topContentView, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v14));
    v29[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_topDimmingView, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_topContentView, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v29[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_topDimmingView, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_topContentView, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    v29[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    -[OverlayContainerViewController updateContainerStyleDependentConstraints](self, "updateContainerStyleDependentConstraints");
  }
}

- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3
{
  void *v4;
  unsigned __int8 v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController containerStyleManagerConfigureLayoutForStyle:](&v11, "containerStyleManagerConfigureLayoutForStyle:", a3);
  -[OverlayContainerViewController updateContainerStyleDependentConstraints](self, "updateContainerStyleDependentConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    v6 = -[ContainerViewController containerStyle](self, "containerStyle");
    if (v6 <= 7 && ((1 << v6) & 0xE3) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
      v9 = v8;
      v10 = 0.0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
      v9 = v8;
      v10 = 10.0;
    }
    objc_msgSend(v8, "setCornerRadius:", v10);

  }
  -[OverlayContainerViewController _updateDimming](self, "_updateDimming");
}

- (void)updateContainerStyleDependentConstraints
{
  void *v3;
  unsigned __int8 v4;
  unint64_t v5;
  double v6;
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
  NSArray *v19;
  unint64_t topContentSizeStyle;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSArray *topContentHorizontalConstraints;
  NSArray *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    v5 = -[ContainerViewController containerStyle](self, "containerStyle");
    if (v5 >= 8 || (v6 = 0.0, ((0xE3u >> v5) & 1) == 0))
      -[ContainerViewController edgePadding](self, "edgePadding", v6);
    -[NSLayoutConstraint setConstant:](self->_topContentConstraint, "setConstant:", v6);
    if (-[NSArray count](self->_topContentHorizontalConstraints, "count"))
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_topContentHorizontalConstraints);
    if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)6
      || (id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
    }
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));

    if (!v14)
      goto LABEL_18;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v8));
    v27 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v18));

    topContentSizeStyle = self->_topContentSizeStyle;
    if (topContentSizeStyle == 1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v12));
    }
    else
    {
      if (topContentSizeStyle)
      {
LABEL_17:
        topContentHorizontalConstraints = self->_topContentHorizontalConstraints;
        self->_topContentHorizontalConstraints = v19;
        v26 = v19;

        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_topContentHorizontalConstraints);
LABEL_18:

        return;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v12));
    }
    v24 = (void *)v23;
    -[NSArray addObject:](v19, "addObject:", v23);

    goto LABEL_17;
  }
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  objc_super v12;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:completion:](&v12, "presentController:animated:useDefaultContaineeLayout:completion:", v10, v8, v7, a6);
  if ((objc_opt_respondsToSelector(v10, "setBannerContainer:") & 1) != 0)
  {
    v11 = v10;
    objc_msgSend(v11, "setBannerContainer:", self);
    -[OverlayContainerViewController viewControllerWantsTopBannerItemsUpdate:](self, "viewControllerWantsTopBannerItemsUpdate:", v11);

  }
  else
  {
    -[OverlayContainerViewController updateTopBannerViewWithTopBannerItems:](self, "updateTopBannerViewWithTopBannerItems:", 0);
  }

}

- (void)setTopContentSizeStyle:(unint64_t)a3
{
  if (self->_topContentSizeStyle != a3)
  {
    self->_topContentSizeStyle = a3;
    -[OverlayContainerViewController updateContainerStyleDependentConstraints](self, "updateContainerStyleDependentConstraints");
  }
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unsigned int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OverlayContainerViewController;
  -[ContainerViewController contentHeightUpdatedWithValue:](&v13, "contentHeightUpdatedWithValue:");
  v5 = -[ContainerViewController containerStyle](self, "containerStyle");
  v6 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v6 <= 7 && ((1 << v6) & 0xE3) != 0 && (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[OverlayContainerViewController _updateDimmingViewsWithAlpha:](self, "_updateDimmingViewsWithAlpha:", 0.0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController dimmingBehaviour](self, "dimmingBehaviour"));
    objc_msgSend(v7, "overlayContainer:dimmingPercentageForCurrentContaineeWithNewHeight:", self, a3);
    v9 = v8;

    if (!-[ContainerViewController transitioning](self, "transitioning") || vabdd_f64(0.0, v9) <= 2.22044605e-16)
      -[OverlayContainerViewController _updateDimmingViewsWithAlpha:](self, "_updateDimmingViewsWithAlpha:", v9);
    if (-[ContainerViewController transitioning](self, "transitioning"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardPresentationController"));
      v12 = objc_msgSend(v11, "presentedModally");

      if (v12)
        -[OverlayContainerViewController _updateDimmingViewsWithAlpha:animated:](self, "_updateDimmingViewsWithAlpha:animated:", 1, v9);
    }
  }
}

- (double)topEdgeInset
{
  double v3;
  double v4;
  void *v5;
  double MaxY;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;
  CGRect v14;

  -[NSLayoutConstraint constant](self->_overlayToTopInsetConstraint, "constant");
  v4 = v3;
  if ((id)-[ContainerViewController containerStyle](self, "containerStyle") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    objc_msgSend(v5, "frame");
    MaxY = CGRectGetMaxY(v13);
    -[ContainerViewController statusBarHeight](self, "statusBarHeight");
    if (MaxY <= v7)
    {
      -[ContainerViewController statusBarHeight](self, "statusBarHeight");
      v9 = v11;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
      objc_msgSend(v8, "frame");
      v9 = CGRectGetMaxY(v14);

    }
  }
  else
  {
    -[ContainerViewController statusBarHeight](self, "statusBarHeight");
    v9 = v10;
  }
  return v9 - v4;
}

- (double)topLabelEdgeInset
{
  int BOOL;
  BOOL v4;
  double result;

  BOOL = GEOConfigGetBOOL(MapsConfig_StatusBarBackgroundViewUsesFadingLabels, off_1014B4DA8);
  if (GEOConfigGetBOOL(MapsConfig_StatusBarBackgroundViewUsesVariableBlur, off_1014B4D58))
    v4 = BOOL == 0;
  else
    v4 = 0;
  if (v4)
    return 0.0;
  -[ContainerViewController statusBarHeight](self, "statusBarHeight");
  return result;
}

- (void)viewControllerWantsTopBannerItemsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));

  v5 = v7;
  if (v4 == v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topBannerItems"));
    -[OverlayContainerViewController updateTopBannerViewWithTopBannerItems:](self, "updateTopBannerViewWithTopBannerItems:", v6);

    v5 = v7;
  }

}

- (void)updateTopBannerViewWithTopBannerItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  TopBannerView *topBannerView;
  TopBannerView *v11;
  TopBannerView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TopBannerView items](self->_topBannerView, "items"));
  v5 = v19;
  if (v4 == v19)
    goto LABEL_11;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView items](self->_topBannerView, "items"));
  v7 = objc_msgSend(v19, "isEqualToArray:", v6);

  v8 = v19;
  if ((v7 & 1) == 0)
  {
    v9 = objc_msgSend(v19, "count");
    topBannerView = self->_topBannerView;
    if (v9)
    {
      if (!topBannerView)
      {
        v11 = -[TopBannerView initAllowingBlurredForButton:]([TopBannerView alloc], "initAllowingBlurredForButton:", 1);
        v12 = self->_topBannerView;
        self->_topBannerView = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController blurGroupName](self, "blurGroupName"));
        -[CardView setBlurGroupName:](self->_topBannerView, "setBlurGroupName:", v13);

        -[TopBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_topBannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        topBannerView = self->_topBannerView;
      }
      -[TopBannerView setItems:](topBannerView, "setItems:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView superview](self->_topBannerView, "superview"));

      if (!v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
        objc_msgSend(v15, "addSubview:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController _topBannerViewConstraints](self, "_topBannerViewConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

      }
      goto LABEL_10;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerView superview](topBannerView, "superview"));

    v8 = v19;
    if (v18)
    {
      -[TopBannerView setItems:](self->_topBannerView, "setItems:", 0);
      -[TopBannerView removeFromSuperview](self->_topBannerView, "removeFromSuperview");
LABEL_10:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController view](self, "view"));
      objc_msgSend(v5, "setNeedsLayout");
LABEL_11:

      v8 = v19;
    }
  }

}

- (id)_topBannerViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_topBannerView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController _topBannerViewHorizontalConstraints](self, "_topBannerViewHorizontalConstraints"));
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_innerLayoutGuide, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    objc_msgSend(v3, "addObject:", v8);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSArray)_topBannerViewHorizontalConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, sub_1005EC29C());
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v17[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topBannerView](self, "topBannerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -sub_1005EC29C());
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));

  return (NSArray *)v14;
}

- (double)_topBannerMaxHeight
{
  return 150.0;
}

- (UIView)topContentView
{
  return self->_topContentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (TopBannerView)topBannerView
{
  return self->_topBannerView;
}

- (void)setTopBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_topBannerView, a3);
}

- (unint64_t)topContentSizeStyle
{
  return self->_topContentSizeStyle;
}

- (UILayoutGuide)innerLayoutGuide
{
  return self->_innerLayoutGuide;
}

- (void)setInnerLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_innerLayoutGuide, a3);
}

- (void)setDimmingBehaviour:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingBehaviour, a3);
}

- (NSArray)innerLayoutGuideConstraints
{
  return self->_innerLayoutGuideConstraints;
}

- (void)setInnerLayoutGuideConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_innerLayoutGuideConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingBehaviour, 0);
  objc_storeStrong((id *)&self->_innerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_topBannerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_topContentView, 0);
  objc_storeStrong((id *)&self->_topDimmingView, 0);
  objc_storeStrong((id *)&self->_dimmingViewDisabledAlphaUpdateCache, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_overlayToTopInsetConstraint, 0);
  objc_storeStrong((id *)&self->_topContentHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_topContentConstraint, 0);
}

@end
