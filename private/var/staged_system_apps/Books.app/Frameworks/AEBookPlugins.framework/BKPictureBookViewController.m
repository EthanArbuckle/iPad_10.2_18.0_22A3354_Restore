@implementation BKPictureBookViewController

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = CFSTR("BKReadingScrolledContinuous");
  v5 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  objc_msgSend(v2, "registerDefaults:", v3);

}

- (BKPictureBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  BKPictureBookViewController *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *thumbnailContext;
  UIScreenEdgePanGestureRecognizer *v8;
  UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookViewController;
  v4 = -[BKThumbnailBookViewController initWithBook:storeID:](&v14, "initWithBook:storeID:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierDynamicTheme));
    -[BKPictureBookViewController setTheme:](v4, "setTheme:", v5);

    v6 = (NSNumber *)objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
    thumbnailContext = v4->_thumbnailContext;
    v4->_thumbnailContext = v6;

    v8 = (UIScreenEdgePanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIScreenEdgePanGestureRecognizer), "initWithTarget:action:", v4, "edgePanGestureHandler:");
    edgePanGestureRecognizer = v4->_edgePanGestureRecognizer;
    v4->_edgePanGestureRecognizer = v8;

    -[UIScreenEdgePanGestureRecognizer setEdges:](v4->_edgePanGestureRecognizer, "setEdges:", 8);
    -[UIScreenEdgePanGestureRecognizer setCancelsTouchesInView:](v4->_edgePanGestureRecognizer, "setCancelsTouchesInView:", 1);
    -[UIScreenEdgePanGestureRecognizer setDelegate:](v4->_edgePanGestureRecognizer, "setDelegate:", v4);
    if (-[BKPictureBookViewController isViewLoaded](v4, "isViewLoaded"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](v4, "view"));
      objc_msgSend(v10, "addGestureRecognizer:", v4->_edgePanGestureRecognizer);

      -[BKPictureBookViewController setSwipeToShowScrubberEnable:](v4, "setSwipeToShowScrubberEnable:", 1);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v12 = -[BKPictureBookViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v11, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIScreenEdgePanGestureRecognizer setDelegate:](self->_edgePanGestureRecognizer, "setDelegate:", 0);
  -[UIScreenEdgePanGestureRecognizer removeTarget:action:](self->_edgePanGestureRecognizer, "removeTarget:action:", 0, 0);
  -[BKPictureBookViewController _cleanupSnapshotWebViews](self, "_cleanupSnapshotWebViews");
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController dealloc](&v3, "dealloc");
}

- (void)_cleanupSnapshotWebViews
{
  WKWebView **p_snapshotWebView;
  id WeakRetained;

  p_snapshotWebView = &self->_snapshotWebView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotWebView);
  objc_msgSend(WeakRetained, "removeFromSuperview");

  objc_storeWeak((id *)p_snapshotWebView, 0);
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKPictureBookViewController loadView](&v5, "loadView");
  if (self->_edgePanGestureRecognizer)
  {
    if (-[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL"))
      v3 = 2;
    else
      v3 = 8;
    -[UIScreenEdgePanGestureRecognizer setEdges:](self->_edgePanGestureRecognizer, "setEdges:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v4, "addGestureRecognizer:", self->_edgePanGestureRecognizer);

    -[BKPictureBookViewController setSwipeToShowScrubberEnable:](self, "setSwipeToShowScrubberEnable:", 1);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v4;

  if (isPhone(self, a2)
    && -[BKPictureBookViewController hasContinuousScrollingBehavior](self, "hasContinuousScrollingBehavior"))
  {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  return -[BKBookViewController supportedInterfaceOrientations](&v4, "supportedInterfaceOrientations");
}

- (void)setSwipeToShowScrubberEnable:(BOOL)a3
{
  -[UIScreenEdgePanGestureRecognizer setEnabled:](self->_edgePanGestureRecognizer, "setEnabled:", a3);
}

- (UIView)scrubberContainerView
{
  UIView *scrubberContainerView;
  id v4;
  UIView *v5;
  UIView *v6;

  scrubberContainerView = self->_scrubberContainerView;
  if (!scrubberContainerView)
  {
    v4 = objc_alloc((Class)UIView);
    -[BKPictureBookViewController scrubberContainerViewFrame](self, "scrubberContainerViewFrame");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_scrubberContainerView;
    self->_scrubberContainerView = v5;

    -[UIView setAutoresizingMask:](self->_scrubberContainerView, "setAutoresizingMask:", 0);
    scrubberContainerView = self->_scrubberContainerView;
  }
  return scrubberContainerView;
}

- (UIView)currentReadingPositionView
{
  UIView *currentReadingPositionView;
  UIView *v4;
  UIView *v5;
  CGFloat v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CGRect v14;

  currentReadingPositionView = self->_currentReadingPositionView;
  if (!currentReadingPositionView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 5.0, 5.0);
    v5 = self->_currentReadingPositionView;
    self->_currentReadingPositionView = v4;

    -[UIView bounds](self->_currentReadingPositionView, "bounds");
    v6 = CGRectGetWidth(v14) * 0.5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_currentReadingPositionView, "layer"));
    objc_msgSend(v7, "setCornerRadius:", v6);

    -[UIView setAutoresizingMask:](self->_currentReadingPositionView, "setAutoresizingMask:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksWhite](UIColor, "bc_booksWhite"));
    -[UIView setBackgroundColor:](self->_currentReadingPositionView, "setBackgroundColor:", v8);

    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.6, 0.6, 0.6, 0.18)));
    v10 = objc_msgSend(v9, "CGColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_currentReadingPositionView, "layer"));
    objc_msgSend(v11, "setShadowColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_currentReadingPositionView, "layer"));
    objc_msgSend(v12, "setShadowRadius:", 4.0);

    -[UIView setUserInteractionEnabled:](self->_currentReadingPositionView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_currentReadingPositionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    currentReadingPositionView = self->_currentReadingPositionView;
  }
  return currentReadingPositionView;
}

- (CGRect)scrubberContainerViewFrame
{
  void *v3;
  double v4;
  double v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double Width;
  void *v12;
  double v13;
  double v14;
  void *v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  v6 = -[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "safeAreaInsets");
    v10 = v9 + 8.0;
  }
  else
  {
    objc_msgSend(v7, "frame");
    Width = CGRectGetWidth(v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v12, "safeAreaInsets");
    v10 = Width - v13 + -40.0 + -8.0;

  }
  v14 = v5 + 8.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v15, "frame");
  v16 = CGRectGetHeight(v22) + v14 * -2.0;

  v17 = 40.0;
  v18 = v10;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v17;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setupVerticalScrubber
{
  void *v3;
  __int128 v4;
  void *v5;
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
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double MaxX;
  double v34;
  double v35;
  double MinX;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  int64_t v63;
  void *v64;
  int64_t v65;
  void *v66;
  void *v67;
  _OWORD v68[3];
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v68[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v68[1] = v4;
  v68[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v3, "setTransform:", v68);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
    objc_msgSend(v7, "addSubview:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v5, "addSubview:", v9);

    -[BKPictureBookViewController scrubberContainerViewFrame](self, "scrubberContainerViewFrame");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(v5, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentReadingPositionView](self, "currentReadingPositionView"));
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    LODWORD(v8) = -[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v28, "frame");
    if ((_DWORD)v8)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v29);
      v69.origin.x = v21;
      v69.origin.y = v23;
      v69.size.width = v25;
      v69.size.height = v27;
      v34 = 8.0 - CGRectGetWidth(v69);
      v35 = 0.5;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v29);
      v70.origin.x = v21;
      v70.origin.y = v23;
      v70.size.width = v25;
      v70.size.height = v27;
      MaxX = MinX - CGRectGetWidth(v70);
      v71.origin.x = v21;
      v71.origin.y = v23;
      v71.size.width = v25;
      v71.size.height = v27;
      v34 = 8.0 - CGRectGetWidth(v71);
      v35 = -0.5;
    }
    v37 = MaxX + v34 * v35;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentReadingPositionView](self, "currentReadingPositionView"));
    objc_msgSend(v38, "setFrame:", v37, 0.0, v25, v27);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentReadingPositionView](self, "currentReadingPositionView"));
    objc_msgSend(v5, "addSubview:", v39);

  }
  -[BKPictureBookViewController scrubberContainerViewFrame](self, "scrubberContainerViewFrame");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  objc_msgSend(v5, "frame");
  v73.origin.x = v48;
  v73.origin.y = v49;
  v73.size.width = v50;
  v73.size.height = v51;
  v72.origin.x = v41;
  v72.origin.y = v43;
  v72.size.width = v45;
  v72.size.height = v47;
  if (!CGRectEqualToRect(v72, v73))
  {
    objc_msgSend(v5, "setFrame:", v41, v43, v45, v47);
    objc_msgSend(v5, "bounds");
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layer"));
  objc_msgSend(v62, "removeAllAnimations");

  v63 = -[BKBookViewController pageCountExcludingUpsell](self, "pageCountExcludingUpsell");
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
  objc_msgSend(v64, "setPageCount:", v63);

  v65 = -[BKBookViewController currentPageNumber](self, "currentPageNumber");
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
  objc_msgSend(v66, "setPageNumber:", v65);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
  objc_msgSend(v67, "setProgress:", 1.0);

}

- (BOOL)isVerticalScrubberVisible
{
  void *v3;
  double v4;
  BOOL v5;

  if (!self->super._verticalScrubber)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_scrubberContainerView, "superview"));
  if (v3)
  {
    -[UIView alpha](self->_scrubberContainerView, "alpha");
    v5 = v4 != 0.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)hideVerticalScrubber
{
  if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
    -[BKPictureBookViewController hideVerticalScrubberAndResetZoomScale:](self, "hideVerticalScrubberAndResetZoomScale:", 1);
}

- (void)showVerticalScrubber
{
  if (!-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
  {
    -[BKPictureBookViewController prepareForScrubberAnimation](self, "prepareForScrubberAnimation");
    -[BKPictureBookViewController animateVerticalScrubberIn:animated:](self, "animateVerticalScrubberIn:animated:", 1, 1.1);
  }
}

- (void)hideVerticalScrubberAndResetZoomScale:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  BKPictureBookViewController *v26;
  BOOL v27;

  v5 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    objc_msgSend(v10, "layoutIfNeeded");

    -[BKThumbnailBookViewController defaultPageNumberHUDWidthConstraintConstant](self, "defaultPageNumberHUDWidthConstraintConstant");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUDWidthConstraint](self, "pageNumberHUDWidthConstraint"));
    objc_msgSend(v13, "setConstant:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    objc_msgSend(v14, "forceReflowText");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    objc_msgSend(v15, "setNeedsLayout");

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_EBC0;
    v24[3] = &unk_1BEB40;
    v27 = a3;
    v16 = v8;
    v25 = v16;
    v26 = self;
    objc_msgSend(v9, "addAnimations:", v24);
    objc_initWeak(&location, self);
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_ED24;
    v20 = &unk_1BEB68;
    objc_copyWeak(&v22, &location);
    v21 = v16;
    objc_msgSend(v9, "addCompletion:", &v17);
    objc_msgSend(v9, "startAnimation", v17, v18, v19, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

- (void)prepareForScrubberAnimation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  _OWORD v15[3];
  CGAffineTransform v16;
  CGAffineTransform v17;

  v3 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    -[BKBookViewController setControlsVisible:](self, "setControlsVisible:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCacheIfLoaded](self, "pictureBookRenderingCacheIfLoaded"));
    objc_msgSend(v7, "suspend");

    -[BKPictureBookViewController setupVerticalScrubber](self, "setupVerticalScrubber");
    v8 = objc_msgSend(v6, "shouldDisplaySpread");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v9, "setShowSpreads:", v8);

    CGAffineTransformMakeScale(&v17, 0.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
    v16 = v17;
    objc_msgSend(v10, "setTransform:", &v16);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v15[1] = v12;
    v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v11, "setTransform:", v15);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
    objc_msgSend(v13, "setAlpha:", 1.0);

    if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
      -[BKPictureBookViewController displayVerticalScrubberBackground](self, "displayVerticalScrubberBackground");
    -[BKPictureBookViewController updateCurrentReadingPositionViewIfNeeded](self, "updateCurrentReadingPositionViewIfNeeded");
    -[UIView setAlpha:](self->_currentReadingPositionView, "setAlpha:", 0.0);
    objc_msgSend(v6, "setAllowDoubleTapToZoom:", 0);
    -[BKBookViewController pageViewControllersDidChange](self, "pageViewControllersDidChange");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    objc_msgSend(v14, "layoutIfNeeded");

  }
}

- (void)edgePanGestureHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double v15;
  id v16;
  CGRect v17;

  v16 = a3;
  if (objc_msgSend(v16, "state") == (char *)&dword_0 + 1)
  {
    -[BKPictureBookViewController prepareForScrubberAnimation](self, "prepareForScrubberAnimation");
  }
  else if (objc_msgSend(v16, "state") == (char *)&dword_0 + 2 || objc_msgSend(v16, "state") == (char *)&dword_0 + 3)
  {
    v4 = objc_opt_class(BKPictureBookVerticalNavigationController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v6 = BUDynamicCast(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
      objc_msgSend(v16, "locationInView:", v8);
      v10 = v9;

      if (!-[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
        objc_msgSend(v11, "bounds");
        v10 = CGRectGetWidth(v17) - v10;

      }
      if (v10 / 112.0 + -0.2 >= 0.0)
        v12 = v10 / 112.0 + -0.2;
      else
        v12 = 0.0;
      v13 = objc_msgSend(v16, "state") == (char *)&dword_0 + 3;
      v14 = v12 < 1.0;
      v15 = 1.1;
      if (!v13 || !v14)
        v15 = v12;
      -[BKPictureBookViewController animateVerticalScrubberIn:animated:](self, "animateVerticalScrubberIn:animated:", v13 & v14, v15);
    }

  }
}

- (void)displayVerticalScrubberBackground
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_F2D8;
  v17 = sub_F2E8;
  v3 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v5 = BUDynamicCast(v3, v4);
  v18 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (v14[5])
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
    v7 = (char *)objc_msgSend((id)v14[5], "pageOffset");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_F2F0;
    v10[3] = &unk_1BEB90;
    objc_copyWeak(&v11, &location);
    v10[4] = &v13;
    v9 = objc_msgSend(v6, "generateMasterImageForPageNumber:asset:priority:callbackBlock:", v7 + 1, v8, 0, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v13, 8);

}

- (void)setupBackgroundImageViewWithImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  v4 = a3;
  v5 = objc_alloc((Class)UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = objc_msgSend(v5, "initWithFrame:");
  -[BKPictureBookViewController setBackgroundImageView:](self, "setBackgroundImageView:", v7);

  v8 = objc_alloc((Class)UIImageView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v9, "bounds");
  v10 = objc_msgSend(v8, "initWithFrame:");

  objc_msgSend(v10, "setImage:", v4);
  CGAffineTransformMakeScale(&v29, 2.0, 2.0);
  v28 = v29;
  objc_msgSend(v10, "setTransform:", &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect _effectWithBlurRadius:scale:](UIBlurEffect, "_effectWithBlurRadius:scale:", 40.0, 1.3));
  v12 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v13, "bounds");
  objc_msgSend(v12, "setFrame:");

  v14 = objc_alloc((Class)UIView);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v15, "bounds");
  v16 = objc_msgSend(v14, "initWithFrame:");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5));
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusD));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
  objc_msgSend(v19, "setCompositingFilter:", v18);

  v20 = objc_alloc((Class)UIView);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v21, "bounds");
  v22 = objc_msgSend(v20, "initWithFrame:");

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1BEBD0));
  objc_msgSend(v22, "setBackgroundColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v24, "addSubview:", v10);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v25, "addSubview:", v12);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v26, "addSubview:", v16);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v27, "addSubview:", v22);

}

- (void)animateVerticalScrubberIn:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double Width;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CGFloat v53;
  void *v54;
  CGFloat v55;
  double v56;
  double v57;
  id v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  id v74[3];
  _QWORD v75[4];
  id v76;
  BKPictureBookViewController *v77;
  double v78;
  CGAffineTransform v79;
  double v80;
  CGAffineTransform v81;
  double v82;
  CGAffineTransform v83;
  BOOL v84;
  char v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v4 = a4;
  v7 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (!v10)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/EPub/PictureBook/Controllers/BKPictureBookViewController.m", 398, "-[BKPictureBookViewController animateVerticalScrubberIn:animated:]", "pageNavigationController != nil", CFSTR("Pagination controller need to be a BKPictureBookVerticalNavigationController for this vertical scrubber animation."));
    goto LABEL_30;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  objc_msgSend(v10, "pageSize");
  v15 = v14;
  if (objc_msgSend(v10, "shouldDisplaySpread"))
    v15 = v15 + v15;
  v16 = -[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL");
  v17 = (v13 - v15) * 0.5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v19;
  v22 = v21;

  if (v16)
    v23 = v22;
  else
    v23 = v20;
  v24 = v17 - v23;
  if (v24 >= 56.0)
  {
    objc_msgSend(v11, "zoomScale");
    v25 = fabs(v26 + -1.0) >= 0.00999999978;
  }
  else
  {
    v25 = 1;
  }
  if (a3 >= 1.0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCacheIfLoaded](self, "pictureBookRenderingCacheIfLoaded"));
    objc_msgSend(v27, "resume");

    -[BKPictureBookViewController setSwipeToShowScrubberEnable:](self, "setSwipeToShowScrubberEnable:", 0);
    a3 = 1.0;
    goto LABEL_14;
  }
  if (a3 <= 1.0)
  {
LABEL_14:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
    objc_msgSend(v28, "alpha");
    if (v29 == 0.0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
      objc_msgSend(v30, "safeAreaInsets");
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
      objc_msgSend(v30, "frame");
      MaxY = CGRectGetMaxY(v90);
    }
    v32 = MaxY;

    objc_msgSend(v11, "contentOffset");
    v34 = v33;
    objc_msgSend(v11, "bounds");
    v36 = v34 + v35 * 0.5;
    objc_msgSend(v11, "contentSize");
    v38 = v36 / v37;
    objc_msgSend(v11, "bounds");
    v40 = v32 * 0.5 + v38 * v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
    objc_msgSend(v41, "center");
    v43 = v42 - v40;

    v69 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v70 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v89.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v89.c = v69;
    v68 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v89.tx = v68;
    if (-[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL"))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
      objc_msgSend(v44, "center");
      v46 = -v45;
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
      objc_msgSend(v44, "frame");
      Width = CGRectGetWidth(v91);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
      objc_msgSend(v48, "center");
      v46 = Width - v49;

    }
    *(_OWORD *)&v88.a = v70;
    *(_OWORD *)&v88.c = v69;
    *(_OWORD *)&v88.tx = v68;
    CGAffineTransformTranslate(&v89, &v88, (1.0 - a3) * v46, -((1.0 - a3) * v43));
    v87 = v89;
    CGAffineTransformScale(&v88, &v87, a3, a3);
    v89 = v88;
    memset(&v88.c, 0, 32);
    if (v16)
      v50 = 56.0;
    else
      v50 = -56.0;
    *(_OWORD *)&v87.a = v70;
    *(_OWORD *)&v87.c = v69;
    *(_OWORD *)&v87.tx = v68;
    *(_OWORD *)&v88.a = 0uLL;
    CGAffineTransformTranslate(&v88, &v87, v50 * a3, 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v51, "frame");
    v52 = 56.0 - v24;
    v53 = CGRectGetWidth(v92) - (56.0 - v24);

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v54, "frame");
    v55 = v53 / CGRectGetWidth(v93);

    *(_OWORD *)&v86.a = v70;
    *(_OWORD *)&v86.c = v69;
    *(_OWORD *)&v86.tx = v68;
    memset(&v87, 0, sizeof(v87));
    CGAffineTransformTranslate(&v87, &v86, v52 * a3, 0.0);
    -[BKThumbnailBookViewController defaultPageNumberHUDWidthConstraintConstant](self, "defaultPageNumberHUDWidthConstraintConstant");
    v57 = v56 + a3 * -56.0;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_FD6C;
    v75[3] = &unk_1BEBF8;
    v84 = v25;
    v58 = v10;
    v79 = v87;
    v81 = v89;
    v83 = v88;
    v85 = v16;
    v76 = v58;
    v77 = self;
    v78 = 1.0 - (1.0 - v55) * a3;
    v80 = v57;
    v82 = a3;
    v59 = objc_retainBlock(v75);
    objc_initWeak((id *)&v86, self);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_FEC8;
    v73[3] = &unk_1BEC20;
    objc_copyWeak(v74, (id *)&v86);
    v73[4] = self;
    v74[1] = *(id *)&a3;
    v74[2] = *(id *)&v57;
    v60 = objc_retainBlock(v73);
    if (v4)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
      objc_msgSend(v61, "addAnimations:", v59);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
      objc_msgSend(v62, "addCompletion:", v60);

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_FF60;
      v71[3] = &unk_1BEC48;
      objc_copyWeak(&v72, (id *)&v86);
      objc_msgSend(v63, "addCompletion:", v71);

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
      objc_msgSend(v64, "startAnimation");

      objc_destroyWeak(&v72);
    }
    else
    {
      ((void (*)(_QWORD *))v59[2])(v59);
      ((void (*)(_QWORD *, _QWORD))v60[2])(v60, 0);
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
    v66 = (char *)objc_msgSend(v65, "state");

    if (v66 != (_BYTE *)&dword_0 + 1)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubberAnimator](self, "verticalScrubberAnimator"));
      objc_msgSend(v67, "startAnimation");

    }
    objc_destroyWeak(v74);
    objc_destroyWeak((id *)&v86);

  }
LABEL_30:

}

- (UIViewPropertyAnimator)verticalScrubberAnimator
{
  UIViewPropertyAnimator *verticalScrubberAnimator;
  id v4;
  id v5;
  UIViewPropertyAnimator *v6;
  UIViewPropertyAnimator *v7;

  verticalScrubberAnimator = self->_verticalScrubberAnimator;
  if (!verticalScrubberAnimator)
  {
    v4 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 230.0, 25.0, 0.0, 0.0);
    v5 = objc_alloc((Class)UIViewPropertyAnimator);
    objc_msgSend(v4, "settlingDuration");
    v6 = (UIViewPropertyAnimator *)objc_msgSend(v5, "initWithDuration:timingParameters:", v4);
    v7 = self->_verticalScrubberAnimator;
    self->_verticalScrubberAnimator = v6;

    verticalScrubberAnimator = self->_verticalScrubberAnimator;
  }
  return verticalScrubberAnimator;
}

- (void)updateCurrentReadingPositionViewIfNeeded
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double MidX;
  double MidY;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v3, "thumbRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberContainerView](self, "scrubberContainerView"));
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    MidX = CGRectGetMidX(v20);
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    MidY = CGRectGetMidY(v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v12, "convertPoint:fromView:", v15, MidX, MidY);
    v17 = v16;

    -[UIView frame](self->_currentReadingPositionView, "frame");
    -[UIView setFrame:](self->_currentReadingPositionView, "setFrame:", v22.origin.x, v17 - floor(CGRectGetHeight(v22) * 0.5), v22.size.width, v22.size.height);
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    v18 = floor(CGRectGetMidX(v23));
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    v19 = floor(CGRectGetMidY(v24));
    -[BKThumbnailScrubber setGravitationalPoint:](self->super._verticalScrubber, "setGravitationalPoint:", v18, v19);
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  NSAttributedStringKey v12;
  void *v13;

  v11.receiver = self;
  v11.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v4, "setBarTintColor:", v3);

  v12 = NSForegroundColorAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v7, "setTitleTextAttributes:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v9, "setTintColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
  objc_msgSend(v10, "setDelegate:", self);

  -[BKPictureBookViewController updatePageNumberHUD](self, "updatePageNumberHUD");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a4;
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v22, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  if (v6 && self->super._imageCache)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController _thumbnailBookViewConfiguration](self, "_thumbnailBookViewConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstDocument"));
    objc_msgSend(v10, "fixedLayoutSize");
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(v8, "hidesSpine") ^ 1;
    objc_msgSend(v6, "bounds");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v7, v15, v12, v14, v16, v17, v18, v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
    objc_msgSend(v21, "setLayoutGeometry:", v20);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BKPictureBookViewController generateSnapshotsForCurrentPages](self, "generateSnapshotsForCurrentPages");
  -[BKPictureBookViewController generateRenderingPiggyBackForAllPages](self, "generateRenderingPiggyBackForAllPages");
  -[BKPictureBookViewController _prewarmThumbnailsForVerticalScrubber](self, "_prewarmThumbnailsForVerticalScrubber");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKPictureBookViewController _cancelCachingAndCleanupSnapshotWebViews](self, "_cancelCachingAndCleanupSnapshotWebViews");
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)_cancelCachingAndCleanupSnapshotWebViews
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(AEPictureBookRenderingCache);
  v4 = BUDynamicCast(v3, self->super._imageCache);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderingPiggyBack"));
  objc_msgSend(v6, "invalidate");

  -[IMThumbnailRenderingCache cancelRenderingCacheOperationsForTarget:context:](self->super._imageCache, "cancelRenderingCacheOperationsForTarget:context:", 0, self->_thumbnailContext);
}

- (id)_thumbnailBookViewConfiguration
{
  return -[BKPictureBookViewController im_ancestorConfigurationConformingToProtocol:](self, "im_ancestorConfigurationConformingToProtocol:", &OBJC_PROTOCOL___BKThumbnailBookViewConfiguring);
}

- (id)pictureBookRenderingCacheIfLoaded
{
  return self->super._imageCache;
}

- (id)pictureBookRenderingCache
{
  IMThumbnailRenderingCache **p_imageCache;
  void *v4;
  void *v5;
  void *v6;
  AEPictureBookRenderingCache *v7;
  void *v8;
  AEPictureBookRenderingCache *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;

  p_imageCache = &self->super._imageCache;
  if (!self->super._imageCache)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController _thumbnailBookViewConfiguration](self, "_thumbnailBookViewConfiguration"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v7 = [AEPictureBookRenderingCache alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "databaseKey"));
      v9 = -[AEPictureBookRenderingCache initWithIdentifier:configuration:webViewBuilder:](v7, "initWithIdentifier:configuration:webViewBuilder:", v8, v5, self);

      -[AEPictureBookRenderingCache setUpsellPageNumber:](v9, "setUpsellPageNumber:", -[BKBookViewController upsellPageNumber](self, "upsellPageNumber"));
      objc_storeStrong((id *)p_imageCache, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookReadingStatisticsCollector readingStatisticsCollectorWithAssetViewController:](BKPictureBookReadingStatisticsCollector, "readingStatisticsCollectorWithAssetViewController:", self));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      objc_msgSend(v10, "setupWithBookInfo:", v11);

      -[AEPictureBookRenderingCache setRenderingPiggyBack:](v9, "setRenderingPiggyBack:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache persistentCachePath](v9, "persistentCachePath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentCachePath"));
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        objc_msgSend(v16, "resetPersistentCache");

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache persistentCachePath](v9, "persistentCachePath"));
        objc_msgSend(v17, "setPersistentCachePath:", v18);

        -[NSManagedObjectContext save:](self->super.super._bookMoc, "save:", 0);
      }

    }
  }
  -[BKPictureBookViewController idealCacheSize](self, "idealCacheSize");
  -[IMThumbnailRenderingCache setPrimaryImageSize:](*p_imageCache, "setPrimaryImageSize:");
  return *p_imageCache;
}

- (BOOL)_bookRenditionFlowIsScrolled
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fixedLayoutFlow"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("scrolled-continuous")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fixedLayoutFlow"));
    v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("scrolled-doc"));

  }
  return v5;
}

- (BOOL)_bookRenditionFlowIsScrolledContinuous
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fixedLayoutFlow"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("scrolled-continuous"));

  return v4;
}

- (unint64_t)defaultLayoutToUse
{
  void *v3;
  unint64_t v4;

  if (!-[BKPictureBookViewController _bookRenditionFlowIsScrolled](self, "_bookRenditionFlowIsScrolled"))
    return -[BKBookViewController lastLayoutUsed](self, "lastLayoutUsed");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = -[BKThumbnailBookViewController scrollLayoutForBook:](self, "scrollLayoutForBook:", v3);

  return v4;
}

- (id)lastLayoutUsedKey
{
  return CFSTR("BKPictureBookLayoutKey");
}

- (BOOL)hidesPageControlsOnOpen
{
  return 1;
}

- (double)hidesPageControlsOnOpenDelay
{
  return 5.0;
}

- (BOOL)shouldSavePageControlVisibility
{
  return 0;
}

- (BOOL)isSharingSupported
{
  return 1;
}

- (BOOL)showSpreads
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fixedLayoutSpread"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("none")) ^ 1;

  return v4;
}

- (id)pageNavigationViewController
{
  BKPageNavigationViewController *pageNavigationViewController;
  BKPictureBookVerticalNavigationController *v4;
  void *v5;
  BKPageNavigationViewController *v6;
  BKPictureBookVerticalNavigationController *v7;
  BKPictureBookNavigationController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BKPageNavigationViewController *v13;
  void *v14;

  pageNavigationViewController = self->super.super._pageNavigationViewController;
  if (!pageNavigationViewController)
  {
    if ((char *)-[BKBookViewController layout](self, "layout") == (char *)&dword_0 + 1
      || !+[BKThumbnailBookViewController verticalScrollFeatureEnabled](BKPictureBookViewController, "verticalScrollFeatureEnabled"))
    {
      if (-[BKPictureBookViewController showSpreads](self, "showSpreads"))
      {
        v8 = objc_alloc_init(BKPictureBookNavigationController);
        -[BKPageNavigationViewController setDelegate:](v8, "setDelegate:", self);
        -[BKPageNavigationViewController setPageCount:](v8, "setPageCount:", -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));
        -[BKPictureBookNavigationController setDrawsSpine:](v8, "setDrawsSpine:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstDocument"));
        objc_msgSend(v10, "fixedLayoutSize");
        -[BKPictureBookNavigationController setContentSize:](v8, "setContentSize:");

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        -[BKPictureBookNavigationController setDrawsSpine:](v8, "setDrawsSpine:", objc_msgSend(v11, "hidesSpine") ^ 1);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        -[BKPictureBookNavigationController setOpenToSpread:](v8, "setOpenToSpread:", objc_msgSend(v12, "openToSpread"));

        -[BKViewController setLayoutDirection:](v8, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
      }
      else
      {
        v8 = objc_alloc_init(BKPageScrollerViewController);
        -[BKPictureBookNavigationController setThumbnailingDelegate:](v8, "setThumbnailingDelegate:", self);
        -[BKPictureBookNavigationController setMaintainZoomScale:](v8, "setMaintainZoomScale:", 1);
        -[BKPageNavigationViewController setDelegate:](v8, "setDelegate:", self);
        -[BKPictureBookNavigationController setImageResizerDelegate:](v8, "setImageResizerDelegate:", self);
        -[BKPageNavigationViewController setPageCount:](v8, "setPageCount:", -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));
        -[BKViewController setLayoutDirection:](v8, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
        -[BKPictureBookNavigationController setMaxZoomScale:](v8, "setMaxZoomScale:", 8.0);
        -[BKPictureBookNavigationController setResizeViewsWhenZoomed:](v8, "setResizeViewsWhenZoomed:", 1);
        -[BKPictureBookNavigationController setMaxResizeScale:](v8, "setMaxResizeScale:", 4.0);
      }
      v13 = self->super.super._pageNavigationViewController;
      self->super.super._pageNavigationViewController = &v8->super;

    }
    else
    {
      v4 = objc_alloc_init(BKPictureBookVerticalNavigationController);
      -[BKPictureBookVerticalNavigationController setDelegate:](v4, "setDelegate:", self);
      -[BKPictureBookVerticalNavigationController setPageCount:](v4, "setPageCount:", -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      -[BKPictureBookVerticalNavigationController setBook:](v4, "setBook:", v5);

      -[BKViewController setLayoutDirection:](v4, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
      v6 = self->super.super._pageNavigationViewController;
      self->super.super._pageNavigationViewController = &v4->super;
      v7 = v4;

      -[BKPictureBookVerticalNavigationController loadViewIfNeeded](v7, "loadViewIfNeeded");
      -[BKPictureBookViewController _prewarmThumbnailsForVerticalScrubber](self, "_prewarmThumbnailsForVerticalScrubber");
    }
    -[BKPictureBookViewController addChildViewController:](self, "addChildViewController:", self->super.super._pageNavigationViewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKBookViewController layout](self, "layout")));
    -[BKPictureBookViewController _updateWebProcessPluginObject:withParameter:](self, "_updateWebProcessPluginObject:withParameter:", v14, CFSTR("BEWebProcessPluginLayoutModeParameterKey"));

    pageNavigationViewController = self->super.super._pageNavigationViewController;
  }
  return pageNavigationViewController;
}

- (void)setLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  BKPageNavigationViewController *pageNavigationViewController;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v31.receiver = self;
  v31.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController setLayout:](&v31, "setLayout:", a3);
  -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
  -[BKThumbnailBookViewController updateBottomToolbar:](self, "updateBottomToolbar:", 1);
  -[BKPictureBookViewController updatePageNumberHUD](self, "updatePageNumberHUD");
  -[BKBookViewController clearSearchResult](self, "clearSearchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController view](self->super.super._pageNavigationViewController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController view](self->super.super._pageNavigationViewController, "view"));
  objc_msgSend(v6, "removeFromSuperview");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController childViewControllers](self->super.super._pageNavigationViewController, "childViewControllers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11), "removeFromParentViewController");
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  -[BKPageNavigationViewController removeFromParentViewController](self->super.super._pageNavigationViewController, "removeFromParentViewController");
  pageNavigationViewController = self->super.super._pageNavigationViewController;
  self->super.super._pageNavigationViewController = 0;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v5, "insertSubview:aboveSubview:", v24, self->super._backgroundView);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKBookViewController layout](self, "layout")));
  -[BKPictureBookViewController _updateWebProcessPluginObject:withParameter:](self, "_updateWebProcessPluginObject:withParameter:", v25, CFSTR("BEWebProcessPluginLayoutModeParameterKey"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
  objc_msgSend(v26, "setNeedsUpdateConstraints");

}

- (void)updatePageNumberHUD
{
  unint64_t layout;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  layout = self->super.super._layout;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
  v5 = v4;
  if (layout == 2)
  {
    objc_msgSend(v4, "setIconSymbol:", CFSTR("sidebar.trailing"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    v8 = v6;
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "setIconSymbol:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    v8 = v6;
    v7 = 0;
  }
  objc_msgSend(v6, "setUserInteractionEnabled:", v7);

}

- (BOOL)savedLocationIsEndOfBook
{
  void *v3;
  void *v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "linearDocuments"));

  v5 = (char *)objc_msgSend(v4, "count");
  if (-[BKPictureBookViewController showSpreads](self, "showSpreads"))
  {
    if ((uint64_t)v5 < 3)
    {
LABEL_7:
      v13 = 0;
      goto LABEL_8;
    }
    v6 = ~(_BYTE)v5 | 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    v6 = -1;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", &v5[v6]));
  if (!v7)
    goto LABEL_7;
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "readingLocation"));
  v11 = objc_msgSend(v10, "ordinal");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "documentOrdinal"));
  v13 = (uint64_t)v11 >= (int)objc_msgSend(v12, "intValue");

LABEL_8:
  return v13;
}

- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[BKPictureBookViewController _cancelCachingAndCleanupSnapshotWebViews](self, "_cancelCachingAndCleanupSnapshotWebViews");
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController appearanceViewController:didChangeLayout:](&v7, "appearanceViewController:didChangeLayout:", v6, a4);

}

- (void)setLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  char *v28;
  char *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;

  v4 = a3;
  v5 = _AECaptureLocationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BKPictureBookViewController setLocation:]"));
    *(_DWORD *)buf = 138412546;
    v39 = v7;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "#PictureBookVC %@: %@", buf, 0x16u);

  }
  v37.receiver = self;
  v37.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setLocation:](&v37, "setLocation:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController viewIfLoaded](self, "viewIfLoaded"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v11 = objc_msgSend(v10, "activationState");

  if (v11)
  {
    v12 = _AEBookPluginsLifeCycleLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetLogID"));
      *(_DWORD *)buf = 138543362;
      v39 = v15;
      v16 = "Setting Location when scene state is not foregroundActive. Bailing out. logID:%{public}@";
      v17 = v13;
      v18 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController viewIfLoaded](self, "viewIfLoaded"));

    if (!v19)
    {
      v31 = _AEBookPluginsLifeCycleLog();
      v13 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetLogID"));
      *(_DWORD *)buf = 138543618;
      v39 = v4;
      v40 = 2114;
      v41 = v15;
      v16 = "Bailing out on attempt to set location when our view is not loaded. Location:%{public}@ logID:%{public}@ ";
      v17 = v13;
      v18 = 22;
      goto LABEL_6;
    }
    v20 = objc_opt_class(BKPageLocation);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
    v22 = BUDynamicCast(v20, v21);
    v13 = objc_claimAutoreleasedReturnValue(v22);

    v23 = _AECaptureLocationLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[NSObject ordinal](v13, "ordinal")+ (_QWORD)-[NSObject pageOffset](v13, "pageOffset")));
        *(_DWORD *)buf = 138412290;
        v39 = v26;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "#PictureBookVC 1 Setting offset: %@", buf, 0xCu);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      v28 = (char *)-[NSObject ordinal](v13, "ordinal");
      v29 = &v28[(_QWORD)-[NSObject pageOffset](v13, "pageOffset")];
      v30 = v27;
    }
    else
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "#PictureBookVC 2 Setting Offset 0", buf, 2u);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      v27 = v30;
      v29 = 0;
    }
    objc_msgSend(v30, "setPageOffset:", v29);

    -[BKPictureBookViewController updateCurrentReadingPositionViewIfNeeded](self, "updateCurrentReadingPositionViewIfNeeded");
    v32 = -[BKPictureBookViewController currentPages](self, "currentPages");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33));
    -[BKPictureBookViewController _updateWebProcessPluginObject:withParameter:](self, "_updateWebProcessPluginObject:withParameter:", v34, CFSTR("BEWebProcessPluginCurrentPageLengthParameterKey"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v32));
    -[BKPictureBookViewController _updateWebProcessPluginObject:withParameter:](self, "_updateWebProcessPluginObject:withParameter:", v35, CFSTR("BEWebProcessPluginCurrentPageLocationParameterKey"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell")));
    -[BKPictureBookViewController _updateWebProcessPluginObject:withParameter:](self, "_updateWebProcessPluginObject:withParameter:", v36, CFSTR("BEWebProcessPluginPageCountParameterKey"));

  }
LABEL_18:

}

- (void)restoreSavedLocation
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = _AECaptureLocationLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "#PictureBookVC restoreSavedLocation", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController restoreSavedLocation](&v5, "restoreSavedLocation");
  if (-[BKPictureBookViewController savedLocationIsEndOfBook](self, "savedLocationIsEndOfBook"))
    -[BKPictureBookViewController setLocation:](self, "setLocation:", 0);
}

- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController didChangeLocationClosing:suspending:](&v5, "didChangeLocationClosing:suspending:", a3, a4);
  if (-[BKPictureBookViewController isVisible](self, "isVisible"))
    -[BKPictureBookViewController generateSnapshotsForCurrentPages](self, "generateSnapshotsForCurrentPages");
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  id v4;
  uint64_t v5;
  BKPageLocation *v6;
  BKPageLocation *v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  BKPageLocation *v15;
  __int16 v16;
  void *v17;

  v13.receiver = self;
  v13.super_class = (Class)BKPictureBookViewController;
  v4 = -[BKBookViewController pageLocationForPageNumber:](&v13, "pageLocationForPageNumber:");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (BKPageLocation *)v5;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !v5)
  {
    v7 = [BKPageLocation alloc];
    if (a3)
      v8 = a3 - 1;
    else
      v8 = 0;
    v6 = -[BKPageLocation initWithOrdinal:andOffset:](v7, "initWithOrdinal:andOffset:", v8, 0);
  }
  v9 = _AECaptureLocationLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "#PictureBookVC returning pageLocation:%@ for pageNumber:%@", buf, 0x16u);

  }
  return v6;
}

- (void)setPageCountIncludingUpsell:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setPageCountIncludingUpsell:](&v7, "setPageCountIncludingUpsell:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCacheIfLoaded](self, "pictureBookRenderingCacheIfLoaded"));
  objc_msgSend(v5, "setUpsellPageNumber:", -[BKBookViewController upsellPageNumber](self, "upsellPageNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[BKPictureBookViewController _updateWebProcessPluginObject:withParameter:](self, "_updateWebProcessPluginObject:withParameter:", v6, CFSTR("BEWebProcessPluginPageCountParameterKey"));

}

- (int64_t)calculatePageCountExcludingUpsell
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  v3 = -[BKBookViewController calculatePageCountExcludingUpsell](&v7, "calculatePageCountExcludingUpsell");
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v3 = objc_msgSend(v5, "linearDocumentCount");

    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return (int64_t)v3;
}

- (void)setBook:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setBook:](&v9, "setBook:");
  if (a3)
    -[BKBookViewController createPaginationControllerIfNeeded:](self, "createPaginationControllerIfNeeded:", 1);
  if (!-[BKPictureBookViewController showSpreads](self, "showSpreads"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutQueue"));
    objc_msgSend(v6, "waitUntilAllOperationsAreFinished");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resultsQueue"));
    objc_msgSend(v8, "waitUntilAllOperationsAreFinished");

  }
}

- (void)transitionDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController transitionDidFinish:](&v9, "transitionDidFinish:");
  v5 = objc_opt_class(BKPictureBookNavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v8, "transitionDidFinish:", v3);
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));

  if (v10)
  {
    -[BKBookViewController clearSelection](self, "clearSelection");
    v11 = objc_opt_class(BKPageLocation);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      v12 = v8;
      v13 = objc_msgSend(v12, "ordinal");
      v14 = (char *)objc_msgSend(v12, "pageOffset");

      v15 = &v14[(_QWORD)v13 + 1];
    }
    else
    {
      v16 = objc_opt_class(BKEpubCFILocation);
      if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
      {
        v15 = (char *)objc_msgSend(v8, "ordinal") + 1;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
        v15 = (char *)objc_msgSend(v17, "pageNumberForLocation:", v8);

      }
    }
    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v15 = (_BYTE *)(&dword_0 + 1);
    v18 = _AECaptureLocationLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
      v23 = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#PictureBookVC jumpToLocation:%@ pageNumber:%@", (uint8_t *)&v23, 0x16u);

    }
    -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v15, v6);
  }
  v21 = objc_retainBlock(v9);
  v22 = v21;
  if (v21)
    (*((void (**)(id))v21 + 2))(v21);

}

- (void)contentViewReady:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController contentViewReady:](&v3, "contentViewReady:", a3);
}

- (id)_stylesheetSetForSnapshot:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:](ContentViewStyleManager, "getPictureBookUserStyleSheetWithLegacyBook:", objc_msgSend(a3, "shouldDisableOptimizeSpeed") ^ 1));
  v4 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
  v8 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = objc_msgSend(v4, "initWithMainframeOnlyStylesheets:", v5);

  return v6;
}

- (void)finishedSnapshottingForCache:(id)a3
{
  _QWORD *v3;
  _QWORD v4[4];
  _QWORD *v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_11D58;
  v6[3] = &unk_1BEA38;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v3[2])(v3);
    }
    else
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_11D60;
      v4[3] = &unk_1BEC70;
      v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

    }
  }

}

- (id)webViewForSnapshotting:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  WKWebView **p_snapshotWebView;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  CGRect v23;
  CGRect v24;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  p_snapshotWebView = &self->_snapshotWebView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotWebView);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "frame");
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = width;
    v24.size.height = height;
    if (!CGRectEqualToRect(v23, v24))
      objc_msgSend(v10, "setFrame:", 0.0, 0.0, width, height);
    objc_msgSend(v7, "fixedLayoutSize");
    +[BEWebViewFactory updateFixedLayoutWebView:fixedLayoutSize:](BEWebViewFactory, "updateFixedLayoutWebView:fixedLayoutSize:", v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookLanguage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentCleanupJSOptions fixedLayoutOptionsWithLanguage:](BEContentCleanupJSOptions, "fixedLayoutOptionsWithLanguage:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BECFIUtilitiesJSOptions cfiUtilitiesJSOptionsForBookInfoSnapshot:ordinal:](BECFIUtilitiesJSOptions, "cfiUtilitiesJSOptionsForBookInfoSnapshot:ordinal:", v7, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v7, 0, width, height));
    objc_msgSend(v7, "fixedLayoutSize");
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cacheItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController _stylesheetSetForSnapshot:](self, "_stylesheetSetForSnapshot:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:", v19, v14, v12, v13, v20, 0.0, 0.0, width, height, v16, v18));

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAutoresizingMask:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v21, "insertSubview:atIndex:", v10, 0);

    objc_storeWeak((id *)p_snapshotWebView, v10);
  }

  return v10;
}

- (BOOL)wantsBottomToolbar
{
  return (char *)-[BKBookViewController layout](self, "layout") != (char *)&dword_0 + 2;
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (a3)
    -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setControlsVisible:animated:](&v7, "setControlsVisible:animated:", v5, v4);
}

- (void)bkaxToggleControls:(id)a3
{
  id v4;
  dispatch_time_t v5;

  v4 = a3;
  -[BKBookViewController setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:](self, "setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:", 1);
  -[BKThumbnailBookViewController toggleControls:](self, "toggleControls:", v4);

  -[BKBookViewController setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:](self, "setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:", 0);
  v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_1BEC90);
}

- (void)presentAppearanceViewControllerFromItem:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
    -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController presentAppearanceViewControllerFromItem:](&v5, "presentAppearanceViewControllerFromItem:", v4);

}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  if (self->super.super._section != a3)
  {
    -[BKPictureBookViewController _cancelCachingAndCleanupSnapshotWebViews](self, "_cancelCachingAndCleanupSnapshotWebViews");
    if ((_DWORD)v7 == 1)
      -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
  }
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController setSection:animated:adjustScrollToReveal:](&v9, "setSection:animated:adjustScrollToReveal:", v7, v6, v5);
}

- (int64_t)readerType
{
  return 5;
}

- (BOOL)snapshotDuringLiveResize
{
  void *v3;
  BOOL v4;

  if (!-[BKBookViewController section](self, "section"))
    return 1;
  if (-[BKBookViewController section](self, "section") != 1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v4 = objc_msgSend(v3, "selectedIndex") != (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)blurSnapshotDuringLiveResize
{
  void *v3;
  BOOL v4;

  if (-[BKBookViewController section](self, "section") != 1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v4 = objc_msgSend(v3, "selectedIndex") != (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)animateLiveResizeTransitions
{
  void *v3;
  BOOL v4;

  if (-[BKBookViewController section](self, "section") != 1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v4 = objc_msgSend(v3, "selectedIndex") != (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)aspectFitDuringLiveResize
{
  void *v3;
  BOOL v4;

  if (!-[BKBookViewController section](self, "section"))
    return 1;
  if (-[BKBookViewController section](self, "section") != 1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v4 = objc_msgSend(v3, "selectedIndex") == (char *)&dword_0 + 1;

  return v4;
}

- (void)assetViewControllerDidEndLiveResize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  dispatch_time_t v15;
  _QWORD block[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController assetViewControllerDidEndLiveResize](&v17, "assetViewControllerDidEndLiveResize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "adjustToNewSize:", v5, v6);

  if (-[BKBookViewController section](self, "section") == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedViewController"));

    v9 = objc_opt_class(BKThumbnailDirectory);
    v10 = BUDynamicCast(v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v12, "bounds");
    objc_msgSend(v11, "adjustToNewSize:", v13, v14);

  }
  if (-[BKPictureBookViewController pageNavigationIsVertical](self, "pageNavigationIsVertical"))
    -[BKPictureBookViewController _prewarmThumbnailsForVerticalScrubber](self, "_prewarmThumbnailsForVerticalScrubber");
  v15 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12458;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)assetViewControllerViewForLiveResizeSnapshot
{
  void *v3;
  void *v4;

  if (-[BKBookViewController section](self, "section") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForLiveResize"));

  }
  return v3;
}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  unsigned __int8 v8;

  v4 = a3;
  if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible")
    || (objc_msgSend(v4, "velocity"), v6 = v5, objc_msgSend(v4, "velocity"), v6 >= v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "proposedBeginState");
  }

  return v8;
}

- (void)updateScrubberUsingTouchbar:(double)a3
{
  int64_t v4;
  void *v5;

  v4 = -[BKBookViewController pageNumberForTouchBarPosition:](self, "pageNumberForTouchBarPosition:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentScrubber](self, "currentScrubber"));
  objc_msgSend(v5, "setPageNumber:", v4);

  -[BKPictureBookViewController layoutScrubberCallout:](self, "layoutScrubberCallout:", 0);
}

- (void)touchBarScrollerDidStart:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController touchBarScrollerDidStart:](&v7, "touchBarScrollerDidStart:");
  -[BKBookViewController setControlsVisible:](self, "setControlsVisible:", 1);
  -[BKPictureBookViewController updateScrubberUsingTouchbar:](self, "updateScrubberUsingTouchbar:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentScrubber](self, "currentScrubber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callout"));
  objc_msgSend(v6, "setAlpha:", 1.0);

}

- (void)touchBarScrollerDidScroll:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController touchBarScrollerDidScroll:](&v5, "touchBarScrollerDidScroll:");
  -[BKPictureBookViewController updateScrubberUsingTouchbar:](self, "updateScrubberUsingTouchbar:", a3);
}

- (void)touchBarScrollerDidEnd:(double)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController touchBarScrollerDidEnd:completion:](&v7, "touchBarScrollerDidEnd:completion:", a4, a3);
  -[BKBookViewController setControlsVisible:](self, "setControlsVisible:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentScrubber](self, "currentScrubber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callout"));
  objc_msgSend(v6, "setAlpha:", 0.0);

}

- (void)infoHUDTapped:(id)a3
{
  UIAccessibilityNotifications v4;
  id v5;
  void *v6;
  const __CFString *v7;
  UIAccessibilityNotifications v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible", a3))
  {
    -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
    v4 = UIAccessibilityAnnouncementNotification;
    v5 = AEBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = CFSTR("Dismissed page chooser");
  }
  else
  {
    -[BKPictureBookViewController showVerticalScrubber](self, "showVerticalScrubber");
    v8 = UIAccessibilityLayoutChangedNotification;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    UIAccessibilityPostNotification(v8, v9);

    v4 = UIAccessibilityAnnouncementNotification;
    v10 = AEBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v7 = CFSTR("Page chooser");
  }
  v12 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1C3088, 0));
  UIAccessibilityPostNotification(v4, v11);

}

- (BOOL)isSpread
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v4 = objc_opt_class(BKPictureBookNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v6 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v7 = objc_opt_isKindOfClass(v3, v6);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_opt_class(BKPictureBookNavigationController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v10 = BUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = objc_msgSend(v11, "isZoomedToSpread");
  }
  else
  {
    if ((v7 & 1) == 0)
    {
      v16 = 0;
      goto LABEL_7;
    }
    v13 = objc_opt_class(BKPictureBookVerticalNavigationController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v15 = BUDynamicCast(v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v12 = objc_msgSend(v11, "shouldDisplaySpread");
  }
  v16 = v12;

LABEL_7:
  return v16;
}

- (void)books_pageRight:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController", a3));
  objc_msgSend(v3, "turnToNextPage");

}

- (void)books_pageLeft:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController", a3));
  objc_msgSend(v3, "turnToPreviousPage");

}

- (void)books_pageForward:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    -[BKPictureBookViewController books_pageLeft:](self, "books_pageLeft:", v4);
  else
    -[BKPictureBookViewController books_pageRight:](self, "books_pageRight:", v4);

}

- (void)books_pageBackward:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
    -[BKPictureBookViewController books_pageRight:](self, "books_pageRight:", v4);
  else
    -[BKPictureBookViewController books_pageLeft:](self, "books_pageLeft:", v4);

}

- (void)turnToNextChapter
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = -[BKPictureBookViewController currentPages](self, "currentPages");
  v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v8 = (char *)objc_msgSend(v7, "numberOfChapters");

    if (v8)
    {
      if (-[BKPictureBookViewController isSpread](self, "isSpread"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
        v10 = objc_msgSend(v9, "pageTotal");

        if (v6 < (unint64_t)v10)
          ++v6;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      v12 = (char *)objc_msgSend(v11, "chapterIndexForPageNumber:", v6);

      if (v12 != (char *)0x7FFFFFFFFFFFFFFFLL && v12 < v8)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
        v14 = objc_msgSend(v13, "pageRangeForChapterAtIndex:", v12 + 1);

LABEL_11:
        -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v14, 1);
        return;
      }
      if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
        v14 = objc_msgSend(v15, "pageRangeForChapterAtIndex:", 0);

        if (v6 < (unint64_t)v14)
          goto LABEL_11;
      }
    }
  }
}

- (void)turnToPreviousChapter
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v3 = -[BKPictureBookViewController currentPages](self, "currentPages");
  v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v8 = objc_msgSend(v7, "numberOfChapters");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      v10 = (char *)objc_msgSend(v9, "chapterIndexForPageNumber:getFirstChapter:", v6, 1);

      if (!v10)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
        v15 = objc_msgSend(v14, "pageRangeForChapterAtIndex:", 0);

        if (v6 <= (unint64_t)v15)
          v13 = &dword_0 + 1;
        else
          v13 = v15;
        goto LABEL_12;
      }
      if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
        v13 = objc_msgSend(v16, "pageRangeForChapterAtIndex:", v10 - 1);

        goto LABEL_12;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
      v12 = objc_msgSend(v11, "pageRangeForChapterAtIndex:", 0);

      if (v6 < (unint64_t)v12)
      {
        v13 = &dword_0 + 1;
LABEL_12:
        -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v13, 1);
      }
    }
  }
}

- (void)recordedTurnToNextChapter
{
  -[BKPictureBookViewController turnToNextChapter](self, "turnToNextChapter");
}

- (void)recordedTurnToPreviousChapter
{
  -[BKPictureBookViewController turnToPreviousChapter](self, "turnToPreviousChapter");
}

- (void)contentViewController:(id)a3 navigatePageDirection:(id)a4
{
  void *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;

  v9 = a4;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("nextChapter")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("previousChapter")))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      v8 = (char *)-[BKPictureBookViewController currentPages](self, "currentPages") - 1;
      goto LABEL_5;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("next")))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      if (-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
      {
LABEL_10:
        objc_msgSend(v5, "turnToPreviousPage");
        goto LABEL_6;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("previous")))
        goto LABEL_7;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      if (!-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
        goto LABEL_10;
    }
    objc_msgSend(v5, "turnToNextPage");
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v6 = (char *)-[BKPictureBookViewController currentPages](self, "currentPages");
  -[BKPictureBookViewController currentPages](self, "currentPages");
  v8 = &v6[v7];
LABEL_5:
  objc_msgSend(v5, "turnToPageNumber:animated:", v8, 1);
LABEL_6:

LABEL_7:
}

- (id)upsellContentViewController
{
  BKUpsell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BKPictureBookViewController;
  v3 = -[BKBookViewController upsellContentViewController](&v23, "upsellContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController viewIfLoaded](self, "viewIfLoaded"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstDocument"));
      objc_msgSend(v7, "fixedLayoutSize");
      v9 = v8;
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController _thumbnailBookViewConfiguration](self, "_thumbnailBookViewConfiguration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v14 = objc_msgSend(v13, "hidesSpine") ^ 1;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController viewIfLoaded](self, "viewIfLoaded"));
      objc_msgSend(v15, "bounds");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v12, v14, v9, v11, v16, v17, v18, v19));
      objc_msgSend(v20, "maximumSize");
      objc_msgSend(v4, "setContentSize:");

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMThemePage themeWithIdentifier:](IMThemePage, "themeWithIdentifier:", kIMThemeIdentifierWhitePageTheme));
      objc_msgSend(v4, "setTheme:", v21);

    }
  }
  return v4;
}

- (void)setTheme:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  -[BKBookViewController setTheme:](&v7, "setTheme:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierWhitePageTheme));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController upsellContentViewController](self, "upsellContentViewController"));
    objc_msgSend(v6, "setTheme:", v5);

  }
}

- (id)_bk_backgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", NSLocaleCountryCode));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("jp"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BKPictureBookViewController;
    v8 = -[BKThumbnailBookViewController _bk_backgroundColor](&v11, "_bk_backgroundColor");
    v7 = objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = (void *)v7;

  return v9;
}

- (BOOL)shouldShowHUDs
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  unsigned __int8 v12;
  void *v14;
  void *v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKPictureBookViewController;
  v3 = -[BKThumbnailBookViewController shouldShowHUDs](&v17, "shouldShowHUDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController viewIfLoaded](self, "viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    v6 = objc_opt_class(BKPictureBookVerticalNavigationController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v8 = BUDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9 && !-[BKBookViewController section](self, "section"))
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v11 = v10 - self->_preferredPageNumberHUDVisibilityChangedTime;
      v12 = objc_msgSend(v9, "preferredPageNumberHUDVisibility");
      if (v11 <= 2.0)
        v3 = 1;
      else
        v3 = v12;
      if (-[BKThumbnailBookViewController catalystToolbarActive](self, "catalystToolbarActive")
        || -[BKBookViewController controlsVisible](self, "controlsVisible"))
      {
        v3 = 1;
      }
      else if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "callout"));
        objc_msgSend(v15, "alpha");
        if (v16 == 0.0)
          v3 = 1;

      }
    }

  }
  return v3;
}

- (BOOL)shouldShowBookmarkControl
{
  objc_super v4;

  if (-[BKPictureBookViewController hasContinuousScrollingBehavior](self, "hasContinuousScrollingBehavior"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  return -[BKThumbnailBookViewController shouldShowBookmarkControl](&v4, "shouldShowBookmarkControl");
}

- (BOOL)shouldShowTOCControl
{
  objc_super v4;

  if (-[BKPictureBookViewController hasContinuousScrollingBehavior](self, "hasContinuousScrollingBehavior"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookViewController;
  return -[BKThumbnailBookViewController shouldShowTOCControl](&v4, "shouldShowTOCControl");
}

- (BOOL)canOrdinalOnlyLocationsBeVisible
{
  return 1;
}

- (double)_contentAspectRatio
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstDocument"));
  objc_msgSend(v3, "fixedLayoutSize");
  v5 = v4;
  v7 = v6;

  v8 = v7 == 0.0 || v5 == 0.0;
  result = v5 / v7;
  if (v8)
    return 1.0;
  return result;
}

- (id)_pageDirectory
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  v3 = -[BKThumbnailBookViewController _pageDirectory](&v7, "_pageDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setShowSpreads:", -[BKPictureBookViewController showSpreads](self, "showSpreads"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v4, "setHidesSpine:", objc_msgSend(v5, "hidesSpine"));

  return v4;
}

- (id)_bookmarkDirectory
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPictureBookViewController;
  v3 = -[BKThumbnailBookViewController _bookmarkDirectory](&v7, "_bookmarkDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v4, "setHidesSpine:", objc_msgSend(v5, "hidesSpine"));

  objc_msgSend(v4, "setShowSpreads:", -[BKPictureBookViewController showSpreads](self, "showSpreads"));
  return v4;
}

- (_NSRange)currentPages
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v3 = objc_msgSend(v2, "visiblePages");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)pageNavigationIsVertical
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6 != 0;
}

- (id)scrubber
{
  BKThumbnailScrubber *scrubber;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  scrubber = self->super._scrubber;
  if (!scrubber)
  {
    v9.receiver = self;
    v9.super_class = (Class)BKPictureBookViewController;
    v4 = -[BKThumbnailBookViewController scrubber](&v9, "scrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v5, "setShowSpreads:", -[BKPictureBookViewController showSpreads](self, "showSpreads"));
    -[BKPictureBookViewController _contentAspectRatio](self, "_contentAspectRatio");
    objc_msgSend(v5, "setCellAspectRatio:");
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "scrubberTouch:forEvent:", 4095);
    v6 = objc_msgSend(objc_alloc((Class)BKScrubberCalloutView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v6, "setShouldDisplayPageInfo:", 1);
    objc_msgSend(v5, "setCallout:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v7, "addSubview:", v6);

    scrubber = self->super._scrubber;
  }
  return scrubber;
}

- (id)verticalScrubber
{
  BKThumbnailScrubber *verticalScrubber;
  BKThumbnailScrubber *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  verticalScrubber = self->super._verticalScrubber;
  if (!verticalScrubber)
  {
    v15.receiver = self;
    v15.super_class = (Class)BKPictureBookViewController;
    v4 = -[BKThumbnailBookViewController verticalScrubber](&v15, "verticalScrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v5, "setPageCount:", -[BKBookViewController pageCountExcludingUpsell](self, "pageCountExcludingUpsell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v6, "setCornerRadius:", 6.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v7, "setMasksToBounds:", 1);

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor")));
    v9 = objc_msgSend(v8, "CGColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v10, "setShadowColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v11, "setShadowRadius:", 10.0);

    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "scrubberTouch:forEvent:", 4095);
    v12 = objc_msgSend(objc_alloc((Class)BKScrubberCalloutView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v12, "setShouldDisplayPageInfo:", 1);
    objc_msgSend(v5, "setCallout:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v13, "addSubview:", v12);

    verticalScrubber = self->super._verticalScrubber;
  }
  return verticalScrubber;
}

- (void)_prewarmThumbnailsForVerticalScrubber
{
  void *v3;
  id v4;
  CGRect v5;

  if (-[BKPictureBookViewController isViewLoaded](self, "isViewLoaded"))
  {
    if ((char *)-[BKBookViewController layout](self, "layout") == (char *)&dword_0 + 2)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
      objc_msgSend(v3, "frame");
      objc_msgSend(v4, "prewarmThumbnailsForScrubberSize:", 40.0, CGRectGetHeight(v5));

    }
  }
}

- (BOOL)_thumbnailShouldTrackWithScrubber
{
  return 1;
}

- (id)currentScrubber
{
  void *v3;

  if (-[BKPictureBookViewController shouldUseVerticalScrubber](self, "shouldUseVerticalScrubber"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubber](self, "scrubber"));
  return v3;
}

- (id)scrubberCallout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentScrubber](self, "currentScrubber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callout"));

  return v3;
}

- (void)layoutScrubberCallout:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double MinX;
  void *v27;
  double MinY;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double width;
  double height;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  void *v88;
  unsigned int v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  CGFloat y;
  double v101;
  CGFloat x;
  id v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v103 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberCallout](self, "scrubberCallout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v15 = v14;
  v17 = v16;
  v104.origin.x = v7;
  v104.origin.y = v9;
  v104.size.width = v11;
  v104.size.height = v13;
  v18 = CGRectGetWidth(v104) + -10.0;
  if (v15 >= v18)
    v19 = v18;
  else
    v19 = v15;
  if (-[BKPictureBookViewController shouldUseVerticalScrubber](self, "shouldUseVerticalScrubber"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "superview"));
    objc_msgSend(v21, "bounds");
    v22 = CGRectGetWidth(v105) + 16.0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v23, "safeAreaInsets");
    v25 = v22 + v24;

    if (!-[BKThumbnailBookViewController isInterfaceRTL](self, "isInterfaceRTL"))
    {
      v106.origin.x = v7;
      v106.origin.y = v9;
      v106.size.width = v11;
      v106.size.height = v13;
      MinX = CGRectGetMinX(v106);
      v107.origin.x = v7;
      v107.origin.y = v9;
      v107.size.width = v11;
      v107.size.height = v13;
      v25 = MinX + round(CGRectGetWidth(v107) - v19 - v25);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    objc_msgSend(v27, "frame");
    MinY = CGRectGetMinY(v108);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController navigationController](self, "navigationController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "toolbar"));

    v109.origin.x = v7;
    v109.origin.y = v9;
    v109.size.width = v11;
    v109.size.height = v13;
    v30 = CGRectGetMinX(v109);
    v110.origin.x = v7;
    v110.origin.y = v9;
    v110.size.width = v11;
    v110.size.height = v13;
    v25 = v30 + round((CGRectGetWidth(v110) - v19) * 0.5);
    objc_msgSend(v27, "frame");
    MinY = CGRectGetMinY(v111) - v17 + -10.0;
  }
  v31 = v25;
  v32 = v19;
  v33 = v17;
  v112 = CGRectIntegral(*(CGRect *)(&MinY - 1));
  y = v112.origin.y;
  x = v112.origin.x;
  width = v112.size.width;
  height = v112.size.height;

  if (-[BKPictureBookViewController _thumbnailShouldTrackWithScrubber](self, "_thumbnailShouldTrackWithScrubber"))
  {
    v99 = height;
    v95 = width;
    v91 = v19;
    v92 = v17;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController currentScrubber](self, "currentScrubber"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "track"));
    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "track"));
    objc_msgSend(v37, "convertRect:fromView:", v47, v40, v42, v44, v46);
    v97 = v49;
    v98 = v48;
    v51 = v50;
    v53 = v52;

    if (v103)
    {
      v96 = v53;
      v94 = v51;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "allTouches"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "anyObject"));

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
      objc_msgSend(v55, "locationInView:", v56);
      v90 = v57;
      v59 = v58;

      height = v99;
    }
    else
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController touchBarController](self, "touchBarController"));

      if (v76)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
        objc_msgSend(v77, "bounds");
        v97 = v79;
        v98 = v78;
        v81 = v80;
        v96 = v82;

        v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController touchBarController](self, "touchBarController"));
        objc_msgSend(v83, "scrollPosition");
        v85 = v84;

        if (-[BKPictureBookViewController shouldUseVerticalScrubber](self, "shouldUseVerticalScrubber"))
        {
          -[BKBookViewController pagePositionForTouchBarPosition:](self, "pagePositionForTouchBarPosition:", v85);
          v93 = v86;
          height = v99;
        }
        else
        {
          height = v99;
          v93 = v85;
        }
        v119.origin.x = v98;
        v119.origin.y = v81;
        v119.size.width = v96;
        v119.size.height = v97;
        v90 = v93 * CGRectGetWidth(v119);
        v120.origin.x = v98;
        v94 = v81;
        v120.origin.y = v81;
        v120.size.width = v96;
        v120.size.height = v97;
        v59 = v93 * CGRectGetHeight(v120);
      }
      else
      {
        v96 = v53;
        v94 = v51;
        v59 = CGPointZero.y;
        v90 = CGPointZero.x;
        height = v99;
      }
      v87 = objc_claimAutoreleasedReturnValue(-[BKBookViewController touchBarController](self, "touchBarController"));
      if (v87)
      {
        v88 = (void *)v87;
        v89 = -[BKPictureBookViewController shouldUseVerticalScrubber](self, "shouldUseVerticalScrubber");

        if (v89)
        {
          v121.origin.x = v7;
          v121.origin.y = v9;
          v121.size.width = v11;
          v121.size.height = v13;
          v70 = CGRectGetMaxY(v121) - v92 + -16.0;
          v122.origin.x = v7;
          v122.origin.y = v9;
          v122.size.width = v11;
          v122.size.height = v13;
          v71 = CGRectGetMaxX(v122) * 0.5 - v91 * 0.5;
          width = v95;
LABEL_24:

          goto LABEL_25;
        }
      }
    }
    if (-[BKPictureBookViewController shouldUseVerticalScrubber](self, "shouldUseVerticalScrubber"))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
      objc_msgSend(v60, "safeAreaInsets");
      v101 = v61;
      v63 = v62;

      v113.origin.x = v98;
      v113.origin.y = v94;
      v113.size.width = v96;
      v113.size.height = v97;
      v64 = CGRectGetMinY(v113);
      v114.origin.x = v98;
      v114.origin.y = v94;
      v114.size.width = v96;
      v114.size.height = v97;
      v65 = fmax(v64, fmin(CGRectGetMaxY(v114), v59));
      v115.origin.x = v7;
      v115.origin.y = v9;
      v115.size.width = v11;
      v115.size.height = v13;
      v66 = CGRectGetMaxY(v115) - v63;
      height = v99;
      v67 = v66 + -5.0 - v92;
      v68 = v101 + 5.0;
      v69 = v65 - round(v92 * 0.5);
      if (v101 + 5.0 < v69)
        v68 = v69;
      if (v67 >= v68)
        v70 = v68;
      else
        v70 = v67;
      width = v95;
      v71 = x;
    }
    else
    {
      v116.origin.x = v98;
      v116.origin.y = v94;
      v116.size.width = v96;
      v116.size.height = v97;
      v72 = CGRectGetMinX(v116);
      v117.origin.x = v98;
      v117.origin.y = v94;
      v117.size.width = v96;
      v117.size.height = v97;
      v73 = fmax(v72, fmin(CGRectGetMaxX(v117), v90));
      v118.origin.x = v7;
      v118.origin.y = v9;
      v118.size.width = v11;
      v118.size.height = v13;
      v74 = CGRectGetMaxX(v118) + -5.0 - v91;
      v75 = fmax(v73 - round(v91 * 0.5), 5.0);
      if (v74 >= v75)
        v71 = v75;
      else
        v71 = v74;
      width = v95;
      v70 = y;
    }
    goto LABEL_24;
  }
  v70 = y;
  v71 = x;
LABEL_25:
  objc_msgSend(v4, "setFrame:", v71, v70, width, height);
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)scrubberTouch:(id)a3 forEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  if (-[BKPictureBookViewController shouldUseVerticalScrubber](self, "shouldUseVerticalScrubber"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allTouches"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));

    v8 = 0.0;
    if (objc_msgSend(v7, "phase") != (char *)&dword_0 + 3)
    {
      if (objc_msgSend(v7, "phase") == &dword_4)
        v8 = 0.0;
      else
        v8 = 1.0;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubber](self, "scrubber"));
    v8 = (double)objc_msgSend(v7, "isTracking");
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController scrubberCallout](self, "scrubberCallout"));
  objc_msgSend(v9, "alpha");
  if (v8 != v10)
  {
    if (v8 == 1.0)
    {
      objc_msgSend(v9, "setAlpha:", 1.0);
      -[BKPictureBookViewController showScrim:](self, "showScrim:", !UIAccessibilityIsVoiceOverRunning());
    }
    else
    {
      objc_msgSend(v9, "alpha");
      if (v11 == 1.0)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_14048;
        v12[3] = &unk_1BEA38;
        v13 = v9;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v12, 0, 0.2, 0.3);
        -[BKPictureBookViewController showScrim:](self, "showScrim:", 0);

      }
    }
  }
  -[BKPictureBookViewController layoutScrubberCallout:](self, "layoutScrubberCallout:", v5);

}

- (void)showScrim:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  UIView *v7;
  UIView *scrimView;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = a3;
  if (self->_scrimView)
  {
    if (!a3)
      goto LABEL_6;
  }
  else
  {
    v5 = objc_alloc((Class)UIView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    v7 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    scrimView = self->_scrimView;
    self->_scrimView = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15));
    -[UIView setBackgroundColor:](self->_scrimView, "setBackgroundColor:", v9);

    if (!v3)
    {
LABEL_6:
      v13[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1420C;
      v14[3] = &unk_1BEA38;
      v14[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1424C;
      v13[3] = &unk_1BEA88;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v14, v13, 0.2, 0.3);
      return;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_scrimView, "superview"));

  if (v10)
    goto LABEL_6;
  -[UIView setAlpha:](self->_scrimView, "setAlpha:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v11, "bounds");
  -[UIView setFrame:](self->_scrimView, "setFrame:");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController view](self, "view"));
  objc_msgSend(v12, "insertSubview:below:", self->_scrimView, self->super._topToolbar);

}

- (id)thumbnailScrubber:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  int64_t v13;
  void *v15;
  void *v16;
  NSNumber *thumbnailContext;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  height = a5.height;
  width = a5.width;
  v22.receiver = self;
  v22.super_class = (Class)BKPictureBookViewController;
  v10 = -[BKThumbnailBookViewController thumbnailScrubber:thumbnailForPage:size:context:](&v22, "thumbnailScrubber:thumbnailForPage:size:context:", a3, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    v13 = -[BKBookViewController upsellPageNumber](self, "upsellPageNumber");
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v13 == a4)
    {
      if (width == CGSizeZero.width && height == CGSizeZero.height)
      {
        v11 = 0;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        thumbnailContext = self->_thumbnailContext;
        -[BKThumbnailBookViewController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "thumbnailForPage:asset:size:renderingCacheCallbackTarget:renderingCacheCallbackContext:priority:containerBounds:", a4, v16, 0, thumbnailContext, 0, width, height, v18, v19, v20, v21));

      }
    }
  }
  return v11;
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  objc_super v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v6 = objc_msgSend(v5, "hasPhysicalPages");

  if (!v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)BKPictureBookViewController;
    v13 = -[BKBookViewController pageTitleForPageNumber:](&v15, "pageTitleForPageNumber:", a3);
    return (id)objc_claimAutoreleasedReturnValue(v13);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentWithOrdinal:", a3 - 1));

  if (!v8)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "physicalPageMapForDocument:", v8));

  if (!objc_msgSend(v10, "count"))
  {

LABEL_8:
    v12 = &stru_1C3088;
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("name")));

  if (!v12)
    goto LABEL_8;
LABEL_9:

  return v12;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = objc_opt_class(BKPictureBookNavigationController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v7 = BUDynamicCast(v5, v6);
  v15 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pageCurlManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageCurlConfiguration"));
  objc_msgSend(v9, "invalidate");

  v10 = objc_opt_class(IMTheme);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController theme](self, "theme"));
  v12 = BUDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchViewControllerIfLoaded](self, "searchViewControllerIfLoaded"));
  objc_msgSend(v14, "setTheme:", v13);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  UIView *scrubberContainerView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  scrubberContainerView = self->_scrubberContainerView;
  if (scrubberContainerView)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](scrubberContainerView, "superview"));

    if (v9)
      -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callout"));
    objc_msgSend(v12, "removeFromSuperview");

    -[BKThumbnailBookViewController setVerticalScrubber:](self, "setVerticalScrubber:", 0);
  }
  if (!-[BKBookViewController inLiveResize](self, "inLiveResize"))
    -[BKPictureBookViewController _prewarmThumbnailsForVerticalScrubber](self, "_prewarmThumbnailsForVerticalScrubber");
  v13.receiver = self;
  v13.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (CGSize)idealCacheSize
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  char v7;
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
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGSize result;
  CGRect v49;
  CGRect v50;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v4 = objc_opt_class(BKPictureBookNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v6 = objc_opt_class(BKPictureBookVerticalNavigationController);
  v7 = objc_opt_isKindOfClass(v3, v6);
  if ((isKindOfClass & 1) != 0 || (v7 & 1) != 0)
  {
    -[BKThumbnailBookViewController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v49.origin.x = CGRectZero.origin.x;
    v49.origin.y = CGRectZero.origin.y;
    v49.size.width = CGRectZero.size.width;
    v49.size.height = CGRectZero.size.height;
    v50.origin.x = v13;
    v50.origin.y = v15;
    v50.size.width = v17;
    v50.size.height = v19;
    if (CGRectEqualToRect(v49, v50))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewIfLoaded"));
      objc_msgSend(v21, "bounds");
      v13 = v22;
      v15 = v23;
      v17 = v24;
      v19 = v25;

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstDocument"));
    objc_msgSend(v27, "fixedLayoutSize");
    v29 = v28;
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController _thumbnailBookViewConfiguration](self, "_thumbnailBookViewConfiguration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v32, objc_msgSend(v33, "hidesSpine") ^ 1, 1, v29, v31, v13, v15, v17, v19));

    if ((isKindOfClass & 1) != 0)
    {
      v34 = objc_opt_class(BKPictureBookNavigationController);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      v36 = BUDynamicCast(v34, v35);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v36);

      v37 = objc_msgSend(v9, "isZoomedToSpread");
      v38 = (id)(isPortrait(v37) ^ 1);
      v39 = v8;
      v40 = v37;
    }
    else
    {
      v41 = objc_opt_class(BKPictureBookVerticalNavigationController);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
      v43 = BUDynamicCast(v41, v42);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v43);

      v38 = objc_msgSend(v9, "shouldDisplaySpread");
      v39 = v8;
      v40 = 0;
    }
    objc_msgSend(v39, "sizeForSpread:landscape:", v40, v38);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstDocument"));
    objc_msgSend(v9, "fixedLayoutSize");
  }
  v44 = v10;
  v45 = v11;

  v46 = v44;
  v47 = v45;
  result.height = v47;
  result.width = v46;
  return result;
}

- (void)pageNavigationSnapshotForPageNumber:(int64_t)a3 size:(CGSize)a4 isRight:(BOOL)a5 zoomScale:(double)a6 applyMaskAndGutter:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v32[4];
  id v33;

  v8 = a7;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v14 = a8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
  objc_msgSend(v15, "primaryImageSize");
  v18 = v16;
  v19 = v17;
  if (height > v17 || width > v16)
  {
    width = v16;
    height = v17;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  -[BKThumbnailBookViewController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_14A88;
  v32[3] = &unk_1BECB8;
  v33 = v14;
  v30 = v14;
  objc_msgSend(v15, "snapshotForBookInfo:pageNumber:size:maxSize:isRight:zoomScale:applyMaskAndGutter:containerBounds:completion:", v21, a3, v9, v8, v32, width, height, v18, v19, a6, v23, v25, v27, v29);

}

- (void)pageNavigationSnapshotForPageNumber:(int64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v8 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKThumbnailBookViewController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anySnapshotForBookInfo:pageNumber:containerBounds:", v7, a3));

  }
  v9[2](v9, v8);

}

- (void)generateSnapshotsForCurrentPages
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = -[BKPictureBookViewController currentPages](self, "currentPages");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
  objc_msgSend(v6, "resetPrioritiesForPageNumber:", -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v5));

  -[BKPictureBookViewController idealCacheSize](self, "idealCacheSize");
  v8 = v7;
  v10 = v9;
  v11 = (unint64_t)v3 + v5;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11 + 2;
    do
    {
      if ((uint64_t)v11 > -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"))
        break;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      objc_msgSend(v13, "generateSnapshotWithAsset:size:pageNumber:", v14, v11, v8, v10);

      ++v11;
    }
    while (v11 < v12);
  }
  v15 = (unint64_t)v3 - 3;
  v16 = (uint64_t)v3 - 1;
  if (v16 > v15 && v16 >= 1)
  {
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      objc_msgSend(v17, "generateSnapshotWithAsset:size:pageNumber:", v18, v16, v8, v10);

      if (v16 - 1 <= v15)
        break;
    }
    while ((unint64_t)v16-- > 1);
  }
}

- (void)generateRenderingPiggyBackForAllPages
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v3 >= 2)
  {
    v4 = v3;
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = 1; i != v4; ++i)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
        objc_msgSend(v6, "renderingPiggyBackForPageNumber:asset:priority:", i, v7, 0);

      }
    }
  }
}

- (id)contentViewControllerForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  BKPictureBookContentViewController *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class(BKPageLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    goto LABEL_8;
  v6 = (unint64_t)objc_msgSend(v4, "ordinal");
  if (v6 == -[BKBookViewController upsellOrdinal](self, "upsellOrdinal"))
  {
    v7 = (BKPictureBookContentViewController *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController upsellContentViewController](self, "upsellContentViewController"));
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v9 = objc_msgSend(v8, "readingDocumentCount");

  if (v6 >= (unint64_t)v9)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstDocumentLocation"));
    v6 = (unint64_t)objc_msgSend(v11, "ordinal");

  }
  v7 = objc_alloc_init(BKPictureBookContentViewController);
  -[BKHTMLContentViewController setOrdinal:](v7, "setOrdinal:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "documentWithOrdinal:", v6));
  -[BKContentViewController setDocument:](v7, "setDocument:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  -[BKContentViewController setBook:](v7, "setBook:", v14);

  -[BKContentViewController setPageOffset:](v7, "setPageOffset:", 0);
  -[BKContentViewController setSelectionHighlightType:](v7, "setSelectionHighlightType:", 0);
LABEL_9:

  return v7;
}

- (id)contentSubType
{
  return +[BAContentSubType fixedLayout](BAContentSubType, "fixedLayout");
}

- (CGSize)thumbnailingContentSizeForPageNumber:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v4, "fixedLayoutSizeForDocumentWithOrdinal:", a3 - 1);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)thumbnailingGenerateImageForPageNumber:(int64_t)a3 callbackBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pictureBookRenderingCache](self, "pictureBookRenderingCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "generateMasterImageForPageNumber:asset:priority:callbackBlock:", a3, v8, 8, v6));

  return v9;
}

- (void)thumbnailingGenerateImageForPageNumber:(int64_t)a3 size:(CGSize)a4 callbackBlock:(id)a5
{
  -[BKPictureBookViewController pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](self, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", a3, 0, 0, a5, a4.width, a4.height, 1.0);
}

- (BKImageResizerHelper)imageResizer
{
  BKImageResizerHelper *imageResizer;
  BKImageResizerHelper *v4;
  BKImageResizerHelper *v5;

  imageResizer = self->_imageResizer;
  if (!imageResizer)
  {
    v4 = objc_alloc_init(BKImageResizerHelper);
    v5 = self->_imageResizer;
    self->_imageResizer = v4;

    imageResizer = self->_imageResizer;
  }
  return imageResizer;
}

- (id)resizeImage:(id)a3 toSize:(CGSize)a4 callback:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController imageResizer](self, "imageResizer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resizeImage:toSize:callback:", v10, v9, width, height));

  return v12;
}

- (void)contentView:(id)a3 unhandledClickAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v8 = objc_opt_class(BKPictureBookNavigationController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    v11 = objc_msgSend(v9, "hasMediaElementAtPoint:inView:", v10, x, y);

    if (v11)
    {

      if (!-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
        goto LABEL_9;
      goto LABEL_6;
    }
    objc_msgSend(v9, "curlPageForReadAloud:", 0);

    if (!-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
    {
LABEL_8:
      -[BKThumbnailBookViewController toggleControls:](self, "toggleControls:", self);
      goto LABEL_9;
    }
  }
  else if (!-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
  {
    goto LABEL_8;
  }
LABEL_6:
  -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
LABEL_9:

}

- (id)_prepareSmilMapOn:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  int64_t v22;
  BKPictureBookViewController *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v23 = self;
  v7 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", location, length);
  if (length)
  {
    v8 = 0;
    v22 = v7 - 1;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](v23, "book"));
      v25 = v8;
      v10 = v22 + v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "documentWithOrdinal:", v22 + v8));

      v24 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaOverlayElements"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v18 = objc_alloc((Class)NSDictionary);
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
            v20 = objc_msgSend(v18, "initWithObjectsAndKeys:", v17, CFSTR("smil"), v19, CFSTR("ordinal"), 0);

            objc_msgSend(v6, "addObject:", v20);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v14);
      }

      v8 = v25 + 1;
    }
    while (v25 + 1 != length);
  }
  return v6;
}

- (void)_installClickHandlers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (self->super.super._isReading)
  {
    v3 = a3;
    v4 = objc_opt_class(BKHTMLContentViewController);
    v5 = BUDynamicCast(v4, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue(v5);

    if (v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "document"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaOverlayElements"));

      objc_msgSend(v8, "installReadAloudClickHandlersOnMediaOverlayElements:", v7);
    }

  }
}

- (void)_removeClickHandlers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->super.super._isReading)
  {
    v3 = a3;
    v4 = objc_opt_class(BKHTMLContentViewController);
    v5 = BUDynamicCast(v4, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue(v5);

    if (v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "document"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaOverlayElements"));

      objc_msgSend(v8, "removeReadAloudClickHandlersOnMediaOverlayElements:", v7);
    }

  }
}

- (void)_markupDocumentElementForMediaOverlay:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (self->super.super._isReading)
  {
    v3 = a3;
    v4 = objc_opt_class(BKHTMLContentViewController);
    v5 = BUDynamicCast(v4, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue(v5);

    v6 = v7;
    if (v7)
    {
      objc_msgSend(v7, "markupDocumentForMediaOverlay");
      v6 = v7;
    }

  }
}

- (void)_cleanDocumentElementForMediaOverlay:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (!self->super.super._isReading)
  {
    v3 = a3;
    v4 = objc_opt_class(BKHTMLContentViewController);
    v5 = BUDynamicCast(v4, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue(v5);

    v6 = v7;
    if (v7)
    {
      objc_msgSend(v7, "cleanDocumentForMediaOverlay");
      v6 = v7;
    }

  }
}

- (BOOL)shouldShowNextPagePageButtonsHint
{
  return self->_shouldShowNextPagePageButtonsHint;
}

- (BOOL)pageNavigationController:(id)a3 shouldDelayChangeToPageOffset:(int64_t)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_opt_class(BKPictureBookVerticalNavigationController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v10 = BUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    objc_msgSend(v11, "pageSize");
    v13 = v12;
    v15 = v14;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_156E0;
    v17[3] = &unk_1BECB8;
    v18 = v7;
    -[BKPictureBookViewController thumbnailingGenerateImageForPageNumber:size:callbackBlock:](self, "thumbnailingGenerateImageForPageNumber:size:callbackBlock:", a4 + 1, v17, v13, v15);

  }
  return a4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)pageNavigationDidChangeLocation:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookViewController;
  -[BKThumbnailBookViewController pageNavigationDidChangeLocation:](&v3, "pageNavigationDidChangeLocation:", a3);
}

- (void)_nextPageHint:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v5 = objc_opt_class(BKPictureBookNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v12, v5);
  v7 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v12;
    v9 = -[BKPictureBookViewController currentPages](self, "currentPages");
    -[BKPictureBookViewController currentPages](self, "currentPages");
    v11 = (uint64_t)v9 + v10;
    if (v11 <= -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"))
    {
      if (v3 && objc_msgSend(v8, "isZoomedToSinglePage"))
        objc_msgSend(v8, "turnToPageNumber:animated:", v11 - 1, 1);
      objc_msgSend(v8, "curlPageForReadAloud:", v3);
    }

    v7 = v12;
  }

}

- (BOOL)_isManualCurlInProgress
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v3 = objc_opt_class(BKPictureBookNavigationController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = objc_msgSend(v2, "isManualCurlInProgress");
  else
    v4 = 0;

  return v4;
}

- (void)_focusOnPage:(int64_t)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v4 = objc_opt_class(BKPictureBookNavigationController);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    v5 = v6;
    if (objc_msgSend(v5, "isZoomedToSinglePage")
      && (objc_msgSend(v5, "isManualCurlInProgress") & 1) == 0)
    {
      objc_msgSend(v5, "turnToPageNumber:animated:", a3, 1);
    }

  }
  else
  {
    objc_msgSend(v6, "turnToPageNumber:animated:", a3, 1);
  }

}

- (BOOL)_isFocusedOnSecondPageOfSpread
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  BOOL v6;
  char v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v4 = objc_opt_class(BKPictureBookNavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && objc_msgSend(v3, "isZoomedToSinglePage"))
  {
    v5 = objc_msgSend(v3, "isZoomedToRightPage");
    if (-[BKViewController layoutDirection](self, "layoutDirection") || (v5 & 1) == 0)
    {
      v8 = v5 ^ 1;
      if ((char *)-[BKViewController layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
        v6 = v8;
      else
        v6 = 0;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_itemIndexForCurrentPage
{
  id v3;
  char *v4;
  id v5;
  id v6;
  NSArray *smilMap;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = -[BKPictureBookViewController currentPages](self, "currentPages");
  v5 = v4;
  if (v4)
  {
    v6 = v3;
    if (v4 == (_BYTE *)&dword_0 + 1
      || -[BKPictureBookViewController _isFocusedOnSecondPageOfSpread](self, "_isFocusedOnSecondPageOfSpread"))
    {
      smilMap = self->super.super._smilMap;
      self->super.super._smilMap = 0;

      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", v6, v5));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("ordinal"), (_QWORD)v16));
            if (v6 == (id)(int)objc_msgSend(v14, "intValue"))
            {
              v5 = objc_msgSend(v8, "indexOfObject:", v13);

              goto LABEL_14;
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v10)
            continue;
          break;
        }
      }
      v5 = 0;
LABEL_14:

    }
    else
    {
      return 0;
    }
  }
  return (unint64_t)v5;
}

- (id)currentSoundtrack
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  if (self->super.super._pageNavigationViewController
    && (v3 = -[BKPictureBookViewController currentPages](self, "currentPages"),
        v5 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4),
        v5 != 0x7FFFFFFFFFFFFFFFLL)
    && (v6 = v5, -[BKPictureBookViewController currentPages](self, "currentPages"), v7))
  {
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController existingContentViewControllerForPageNumber:](self, "existingContentViewControllerForPageNumber:", v6 + v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForSoundtrack"));

      if (v10)
        break;
      ++v8;
      -[BKPictureBookViewController currentPages](self, "currentPages");
      if (v8 >= v11)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v10 = 0;
  }
  return v10;
}

- (void)pictureBookVerticalNavigationInteractionDidStart:(int64_t)a3
{
  if (-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible"))
  {
    if (a3 == 1)
      -[BKPictureBookViewController hideVerticalScrubberAndResetZoomScale:](self, "hideVerticalScrubberAndResetZoomScale:", 0);
    else
      -[BKPictureBookViewController hideVerticalScrubber](self, "hideVerticalScrubber");
  }
}

- (void)pictureBookVerticalNavigationpreferredPageNumberHUDVisibilityChanged:(BOOL)a3
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!a3)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_preferredPageNumberHUDVisibilityChangedTime = v4;
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_updateHUDVisibility", 0);
  if (!-[BKBookViewController controlsVisible](self, "controlsVisible"))
  {
    if (!-[BKPictureBookViewController isVerticalScrubberVisible](self, "isVerticalScrubberVisible")
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController verticalScrubber](self, "verticalScrubber")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callout")),
          objc_msgSend(v6, "alpha"),
          v8 = v7,
          v6,
          v5,
          v8 != 0.0))
    {
      -[BKPictureBookViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_updateHUDVisibility", 0, 2.0);
    }
  }
}

- (CGRect)desiredBoundsForNavigationController
{
  void *v2;
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController viewIfLoaded](self, "viewIfLoaded"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)supportsSpreadForVerticalLayout
{
  return !-[BKPictureBookViewController hasContinuousScrollingBehavior](self, "hasContinuousScrollingBehavior");
}

- (BOOL)hasContinuousScrollingBehavior
{
  _BOOL4 v2;
  void *v3;
  unsigned __int8 v4;

  v2 = -[BKPictureBookViewController _bookRenditionFlowIsScrolledContinuous](self, "_bookRenditionFlowIsScrolledContinuous");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKReadingScrolledContinuous"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_updateHUDVisibility
{
  -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 1);
}

- (void)_updateWebProcessPluginObject:(id)a3 withParameter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v21 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(BKPictureBookContentViewController);
        v15 = BUDynamicCast(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "webView2"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "webView2"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "be_updateAXValueForMessage:", v21));
          objc_msgSend(v18, "be_updateAXCurrentReadingStateWithMessage:forValue:", v6, v20);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (UIScreenEdgePanGestureRecognizer)edgePanGestureRecognizer
{
  return self->_edgePanGestureRecognizer;
}

- (void)setEdgePanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, a3);
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (void)setScrubberContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberContainerView, a3);
}

- (void)setCurrentReadingPositionView:(id)a3
{
  objc_storeStrong((id *)&self->_currentReadingPositionView, a3);
}

- (void)setVerticalScrubberAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_verticalScrubberAnimator, a3);
}

- (void)setShouldShowNextPagePageButtonsHint:(BOOL)a3
{
  self->_shouldShowNextPagePageButtonsHint = a3;
}

- (void)setImageResizer:(id)a3
{
  objc_storeStrong((id *)&self->_imageResizer, a3);
}

- (WKWebView)snapshotWebView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_snapshotWebView);
}

- (void)setSnapshotWebView:(id)a3
{
  objc_storeWeak((id *)&self->_snapshotWebView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotWebView);
  objc_storeStrong((id *)&self->_imageResizer, 0);
  objc_storeStrong((id *)&self->_verticalScrubberAnimator, 0);
  objc_storeStrong((id *)&self->_currentReadingPositionView, 0);
  objc_storeStrong((id *)&self->_scrubberContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);
  objc_storeStrong((id *)&self->_thumbnailContext, 0);
}

- (void)_performScrollTest:(id)a3 completionHandler:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  *(_QWORD *)&v7 = objc_opt_class(BKPictureBookVerticalNavigationController).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewController pageNavigationViewController](self, "pageNavigationViewController", v7));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollView"));
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollView:completionHandler:", v16, v13, v6);
    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v14);
  }
  else
  {
    v15 = objc_retainBlock(v6);
    v14 = v15;
    if (v15)
      (*((void (**)(id))v15 + 2))(v15);
  }

}

@end
