@implementation BKEndOfBookCompactViewController

- (BKEndOfBookCompactViewController)initWithOptions:(id)a3
{
  id v4;
  BKEndOfBookCompactViewController *v5;
  BKEndOfBookCompactViewController *v6;
  uint64_t v7;
  NSMutableArray *presentationCompletionBlocks;
  void *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKEndOfBookCompactViewController;
  v5 = -[BKEndOfBookCompactViewController init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[BKEndOfBookCompactViewController setOptions:](v5, "setOptions:", v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    presentationCompletionBlocks = v6->_presentationCompletionBlocks;
    v6->_presentationCompletionBlocks = (NSMutableArray *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v10 = -[BKEndOfBookCompactViewController registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v9, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  double y;
  double width;
  double height;
  UIView *v7;
  void *v8;
  id v9;
  double v10;
  UIView *dropShadowView;
  UIView *v12;
  UIView *v13;
  UIView *contentView;
  UIView *v15;
  _BKEndOfBookToastBlurEffectView *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  BSUIFeedViewController *feedViewController;
  id v25;
  UIView *v26;
  id v27;
  UIView *closeButton;
  UIView *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)BKEndOfBookCompactViewController;
  -[BKEndOfBookCompactViewController viewDidLoad](&v32, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController view](self, "view"));
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  objc_msgSend(v3, "setFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 1);
  objc_msgSend(v3, "setAccessibilityContainerType:", 4);
  v7 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 34);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v7, "layer"));
  objc_msgSend(v8, "setCornerCurve:", kCACornerCurveContinuous);
  objc_msgSend(v8, "setCornerRadius:", 22.0);
  objc_msgSend(v8, "setShadowOffset:", 0.0, 8.0);
  objc_msgSend(v8, "setShadowRadius:", 18.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  objc_msgSend(v8, "setShadowColor:", objc_msgSend(v9, "CGColor"));

  LODWORD(v10) = 1041865114;
  objc_msgSend(v8, "setShadowOpacity:", v10);
  objc_msgSend(v8, "setShadowPathIsBounds:", 1);
  v31 = v3;
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](v7, "setFrame:");
  objc_msgSend(v3, "addSubview:", v7);
  dropShadowView = self->_dropShadowView;
  self->_dropShadowView = v7;
  v12 = v7;

  v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  -[UIView setClipsToBounds:](v13, "setClipsToBounds:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v13, "layer"));
  objc_msgSend(v30, "setCornerCurve:", kCACornerCurveContinuous);
  objc_msgSend(v30, "setCornerRadius:", 22.0);
  v29 = v12;
  -[UIView bounds](v12, "bounds");
  -[UIView setFrame:](v13, "setFrame:");
  -[UIView addSubview:](v12, "addSubview:", v13);
  contentView = self->_contentView;
  self->_contentView = v13;
  v15 = v13;

  v16 = objc_alloc_init(_BKEndOfBookToastBlurEffectView);
  -[UIView bounds](v15, "bounds");
  -[_BKEndOfBookToastBlurEffectView setFrame:](v16, "setFrame:");
  -[UIView addSubview:](v15, "addSubview:", v16);
  v17 = objc_msgSend(objc_alloc((Class)UIControl), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v17, "setAutoresizingMask:", 18);
  -[_BKEndOfBookToastBlurEffectView bounds](v16, "bounds");
  objc_msgSend(v17, "setFrame:");
  -[_BKEndOfBookToastBlurEffectView addSubview:](v16, "addSubview:", v17);
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "_contentTapBegan", 17);
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "_contentTapCancelled", 288);
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, "_contentTapCompleted", 64);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController options](self, "options"));
  v19 = objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("end-of-book-compact"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKContextMenuProvider sharedProvider](BKContextMenuProvider, "sharedProvider"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, BSUIFeedOptionsKeyContextMenuProvider);

  v21 = objc_msgSend(objc_alloc((Class)BSUIFeedViewController), "initWithOptions:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v22, "setUserInteractionEnabled:", 0);

  -[BKEndOfBookCompactViewController addChildViewController:](self, "addChildViewController:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v17, "bounds");
  objc_msgSend(v23, "setFrame:");
  objc_msgSend(v23, "setAutoresizingMask:", 18);
  objc_msgSend(v17, "addSubview:", v23);
  objc_msgSend(v21, "didMoveToParentViewController:", self);
  feedViewController = self->_feedViewController;
  self->_feedViewController = (BSUIFeedViewController *)v21;
  v25 = v21;

  v26 = (UIView *)objc_claimAutoreleasedReturnValue(+[BCCardGripperView cardGripperViewWithStyle:](BCCardGripperView, "cardGripperViewWithStyle:", 1));
  -[UIView setAccessibilityDelegate:](v26, "setAccessibilityDelegate:", self);
  -[UIView addSubview:](v15, "addSubview:", v26);
  -[BKEndOfBookCompactViewController _anchorGripperView:toView:](self, "_anchorGripperView:toView:", v26, v15);
  v27 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_gripperTapped:");
  -[UIView addGestureRecognizer:](v26, "addGestureRecognizer:", v27);
  closeButton = self->_closeButton;
  self->_closeButton = v26;

}

- (void)setCardViewController:(id)a3
{
  void *v4;
  id obj;

  obj = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController traitCollection](self, "traitCollection"));
  objc_msgSend(obj, "setOverrideUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));

  objc_storeWeak((id *)&self->_cardViewController, obj);
}

- (UIView)dropShadowView
{
  -[BKEndOfBookCompactViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_dropShadowView;
}

- (UIView)contentView
{
  -[BKEndOfBookCompactViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_contentView;
}

- (BSUIFeedViewController)feedViewController
{
  -[BKEndOfBookCompactViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_feedViewController;
}

- (BOOL)isPresentingCard
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKEndOfBookCardViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController presentedViewController](self, "presentedViewController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  LOBYTE(v3) = v6 != 0;

  return v3;
}

- (BOOL)isToolbarVisible
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController parentViewController](self, "parentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationController"));

  if (v3)
    v4 = objc_msgSend(v3, "isToolbarHidden") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController traitCollection](self, "traitCollection", a3, a4));
  v5 = objc_msgSend(v7, "userInterfaceStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", v5);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKEndOfBookCompactViewController;
  v7 = a4;
  -[BKEndOfBookCompactViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100171408;
  v8[3] = &unk_1008E7AD0;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewSafeAreaInsetsDidChange
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[9];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKEndOfBookCompactViewController;
  -[BKEndOfBookCompactViewController viewSafeAreaInsetsDidChange](&v17, "viewSafeAreaInsetsDidChange");
  v3 = -[BKEndOfBookCompactViewController isToolbarVisible](self, "isToolbarVisible");
  if (v3 != -[BKEndOfBookCompactViewController wasToolbarVisible](self, "wasToolbarVisible"))
  {
    -[BKEndOfBookCompactViewController setWasToolbarVisible:](self, "setWasToolbarVisible:", v3);
    if (-[BKEndOfBookCompactViewController isPresented](self, "isPresented"))
    {
      v4 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 200.0, 20.0, 0.0, 0.0);
      v5 = objc_alloc((Class)UIViewPropertyAnimator);
      objc_msgSend(v4, "settlingDuration");
      v6 = objc_msgSend(v5, "initWithDuration:timingParameters:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController parentViewController](self, "parentViewController"));
      -[BKEndOfBookCompactViewController preferredFrameInViewController:isPresented:](self, "preferredFrameInViewController:isPresented:", v7, -[BKEndOfBookCompactViewController isPresented](self, "isPresented"));
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100171618;
      v16[3] = &unk_1008E82B8;
      v16[4] = self;
      v16[5] = v9;
      v16[6] = v11;
      v16[7] = v13;
      v16[8] = v15;
      objc_msgSend(v6, "addAnimations:", v16);
      objc_msgSend(v6, "startAnimation");

    }
  }
}

- (void)preloadContentWithViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
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
  int v20;
  BKEndOfBookCompactViewController *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = BCAugmentedExperienceLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v20 = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: preloadContentWithViewController %@", (uint8_t *)&v20, 0x16u);
  }

  -[BKEndOfBookCompactViewController preferredFrameInViewController:isPresented:](self, "preferredFrameInViewController:isPresented:", v6, 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController view](self, "view"));
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController feedViewController](self, "feedViewController"));
  objc_msgSend(v19, "preloadAugmentedExperienceContentWithViewController:numEntries:completion:", v6, 1, v7);

}

- (void)_forceOrientationBackToPortraitOrientation:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = objc_opt_class(_BCWindowScene);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController bc_windowForViewController](self, "bc_windowForViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001718A8;
    v10[3] = &unk_1008E8870;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v9, "attemptRotateToPortraitWithCompletion:", v10);

  }
  else
  {
    v4[2](v4);
  }

}

- (CGRect)preferredFrameInViewController:(id)a3 isPresented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  double v13;
  CGFloat y;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewIfLoaded"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "bounds");
    -[BKEndOfBookCompactViewController preferredFrameInViewController:newSize:isPresented:](self, "preferredFrameInViewController:newSize:isPresented:", v6, v4, v9, v10);
    x = v11;
    y = v13;
    width = v15;
    height = v17;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)preferredFrameInViewController:(id)a3 newSize:(CGSize)a4 isPresented:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  int v17;
  CGFloat x;
  CGFloat y;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double MaxY;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect result;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewIfLoaded"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
    v12 = objc_msgSend(v11, "horizontalSizeClass");

    v15 = 8.0;
    v16 = 8.0;
    if (v12 == (id)1 || (v16 = 16.0, isPhone(v13, v14)))
    {
      v17 = 1;
    }
    else
    {
      v17 = 0;
      v15 = 16.0;
    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
    if (v22
      && (v23 = (void *)v22,
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController")),
          v25 = objc_msgSend(v24, "isToolbarHidden"),
          v24,
          v23,
          (v25 & 1) == 0))
    {
      objc_msgSend(v10, "safeAreaInsets");
      v26 = v15 + v29;
    }
    else
    {
      objc_msgSend(v10, "safeAreaInsets");
      v26 = v15;
      if (v27 > v15)
      {
        objc_msgSend(v10, "safeAreaInsets");
        v26 = v28;
      }
    }
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.width = width;
    v46.size.height = height;
    v30 = 404.0;
    if (CGRectGetWidth(v46) + v16 * -2.0 < 404.0)
    {
      v47.origin.x = 0.0;
      v47.origin.y = 0.0;
      v47.size.width = width;
      v47.size.height = height;
      v30 = CGRectGetWidth(v47) + -v16 * 2.0;
    }
    v31 = v26 + 84.0;
    v32 = 0;
    v33 = 0;
    v34 = width;
    v35 = height;
    if (v17)
      v36 = (CGRectGetWidth(*(CGRect *)&v32) - v30) * 0.5;
    else
      v36 = CGRectGetMaxX(*(CGRect *)&v32) - v16 - v30;
    v48.origin.x = 0.0;
    v48.origin.y = 0.0;
    v48.size.width = width;
    v48.size.height = height;
    MaxY = CGRectGetMaxY(v48);
    v38 = -v31;
    if (!v5)
      v38 = v15;
    x = IMRectFlippedForRTL(-[BKEndOfBookCompactViewController pageProgressionIsRTL](self, "pageProgressionIsRTL"), v36, MaxY + v38, v30, v31, 0.0, 0.0, width, height);
    y = v39;
    v20 = v40;
    v21 = v41;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v20 = CGRectZero.size.width;
    v21 = CGRectZero.size.height;
  }

  v42 = x;
  v43 = y;
  v44 = v20;
  v45 = v21;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (void)_gripperTapped:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
  {
    -[BKEndOfBookCompactViewController _reportFigaroCloseClickEventWithReason:](self, "_reportFigaroCloseClickEventWithReason:", CFSTR("buttonTap"));
    -[BKEndOfBookCompactViewController dismiss](self, "dismiss");
  }
}

- (void)_animateScaleForPressed:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController dropShadowView](self, "dropShadowView"));
  memset(&v16, 0, sizeof(v16));
  if (v3)
  {
    CGAffineTransformMakeScale(&v16, 0.96, 0.96);
  }
  else
  {
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v16.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v16.c = v8;
    v7 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v16.tx = v7;
  }
  LODWORD(v7) = 1051260355;
  LODWORD(v5) = 1059816735;
  LODWORD(v8) = 0;
  LODWORD(v6) = 1.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", *(double *)&v7, *(double *)&v8, v5, v6));
  v10 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithCustomCurve:", v9);
  v11 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v10, 0.18);
  v13[1] = 3221225472;
  v15 = v16;
  v13[0] = _NSConcreteStackBlock;
  v13[2] = sub_100171D98;
  v13[3] = &unk_1008ED080;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "addAnimations:", v13);
  objc_msgSend(v11, "startAnimation");

}

- (void)_contentTapBegan
{
  -[BKEndOfBookCompactViewController _animateScaleForPressed:](self, "_animateScaleForPressed:", 1);
}

- (void)_contentTapCancelled
{
  -[BKEndOfBookCompactViewController _animateScaleForPressed:](self, "_animateScaleForPressed:", 0);
}

- (void)_contentTapCompleted
{
  -[BKEndOfBookCompactViewController _presentCardWithReason:completion:](self, "_presentCardWithReason:completion:", CFSTR("buttonTap"), 0);
  -[BKEndOfBookCompactViewController _animateScaleForPressed:](self, "_animateScaleForPressed:", 0);
}

- (void)_anchorGripperView:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 15.0));
  v14[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -14.5));
  v14[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)_willDismissCardWithReason:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_opt_class(BKEndOfBookCardViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
  v7 = BUDynamicCast(v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardNavigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentFeedViewController"));
  objc_msgSend(v9, "cardStackViewController:parentCardWillDismissWithReason:targetViewController:", 0, a3, self);

}

- (void)presentCardWithCompletion:(id)a3
{
  -[BKEndOfBookCompactViewController _presentCardWithReason:completion:](self, "_presentCardWithReason:completion:", CFSTR("autoTrigger"), a3);
}

- (void)_presentCardWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BKEndOfBookCardTransitionAnimationController *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
  if (v8 && !-[BKEndOfBookCompactViewController isPresentingCard](self, "isPresentingCard"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController presentedViewController](self, "presentedViewController"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController presentedViewController](self, "presentedViewController"));
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    -[BKEndOfBookCompactViewController _reportFigaroOpenClickEventWithReason:](self, "_reportFigaroOpenClickEventWithReason:", v6);
    if (v7)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController presentationCompletionBlocks](self, "presentationCompletionBlocks"));
      v14 = objc_retainBlock(v7);
      objc_msgSend(v13, "addObject:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController transitionAnimationController](self, "transitionAnimationController"));

    if (!v15)
    {
      objc_msgSend(v8, "setTransitioningDelegate:", self);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationController"));
      objc_msgSend(v16, "setDelegate:", self);

      v17 = objc_opt_class(BKEndOfBookCardViewController);
      v18 = BUDynamicCast(v17, v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_msgSend(v19, "setDelegate:", self);
      objc_initWeak(location, self);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1001723B8;
      v37[3] = &unk_1008E74C8;
      objc_copyWeak(&v38, location);
      v20 = objc_retainBlock(v37);
      v21 = objc_opt_class(UISheetPresentationController);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationController"));
      v23 = BUDynamicCast(v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController dropShadowView](self, "dropShadowView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
      objc_msgSend(v26, "cornerRadius");
      objc_msgSend(v24, "_setCornerRadiusForPresentationAndDismissal:");

      objc_msgSend(v24, "_setShouldDismissWhenTappedOutside:", 1);
      v27 = -[BKEndOfBookCardTransitionAnimationController initWithCompactViewController:cardViewController:]([BKEndOfBookCardTransitionAnimationController alloc], "initWithCompactViewController:cardViewController:", self, v19);
      -[BKEndOfBookCompactViewController setTransitionAnimationController:](self, "setTransitionAnimationController:", v27);

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1001724F0;
      v33[3] = &unk_1008EB378;
      objc_copyWeak(&v36, location);
      v34 = v8;
      v28 = v20;
      v35 = v28;
      v29 = objc_retainBlock(v33);
      if (isPhone(v29, v30) && isLandscape())
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100172698;
        v31[3] = &unk_1008E7680;
        v31[4] = self;
        v32 = v29;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v31);

      }
      else
      {
        ((void (*)(_QWORD *))v29[2])(v29);
      }

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(location);

    }
  }
  else
  {
    v9 = objc_retainBlock(v7);
    v10 = v9;
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);

  }
}

- (id)animationControllerForCompactViewController:(id)a3 cardViewController:(id)a4 isPresenting:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_opt_class(BKEndOfBookCompactViewController);
  v11 = BUDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_alloc_init((Class)_UISheetAnimationController);
  objc_msgSend(v13, "setIsReversed:", !v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dropShadowView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dropShadowView"));
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "superview"));
  objc_msgSend(v14, "convertRect:toView:", v25, v17, v19, v21, v23);
  objc_msgSend(v13, "setSourceFrame:");

  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001728B8;
  v30[3] = &unk_1008E7AA8;
  objc_copyWeak(&v31, &location);
  v32 = v5;
  objc_msgSend(v13, "addNoninteractiveAnimations:", v30);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100172914;
  v27[3] = &unk_1008EA270;
  objc_copyWeak(&v28, &location);
  v29 = v5;
  objc_msgSend(v13, "addNoninteractiveCompletion:", v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v13;
}

- (void)dismiss
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController delegate](self, "delegate"));
  objc_msgSend(v3, "endOfBookCompactViewControllerWantsToDismiss:", self);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a5;
  if (-[BKEndOfBookCompactViewController _shouldUseCoverAnimationWhenPresenting:](self, "_shouldUseCoverAnimationWhenPresenting:", 1))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController animationControllerForCompactViewController:cardViewController:isPresenting:](self, "animationControllerForCompactViewController:cardViewController:isPresenting:", v8, v7, 1));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[BKEndOfBookCompactViewController _shouldUseCoverAnimationWhenPresenting:](self, "_shouldUseCoverAnimationWhenPresenting:", 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController animationControllerForCompactViewController:cardViewController:isPresenting:](self, "animationControllerForCompactViewController:cardViewController:isPresenting:", self, v4, 0));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldUseCoverAnimationWhenPresenting:(BOOL)a3
{
  unsigned int v5;
  BOOL result;

  v5 = -[BKEndOfBookCompactViewController isPresented](self, "isPresented");
  result = a3 & v5;
  if (!a3)
  {
    if (v5)
      return !self->_closingBook;
  }
  return result;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BKEndOfBookCardTransitionAnimationController *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController transitionCoordinator](self, "transitionCoordinator", a3));
  if ((objc_msgSend(v10, "isInteractive") & 1) == 0
    && (objc_msgSend(v10, "isCancelled") & 1) == 0)
  {
    -[BKEndOfBookCompactViewController _willDismissCardWithReason:](self, "_willDismissCardWithReason:", 2);
    if (-[BKEndOfBookCompactViewController _shouldUseCoverAnimationWhenPresenting:](self, "_shouldUseCoverAnimationWhenPresenting:", 0))
    {
      v4 = objc_opt_class(BKEndOfBookCardViewController);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
      v6 = BUDynamicCast(v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

      v8 = -[BKEndOfBookCardTransitionAnimationController initWithCompactViewController:cardViewController:]([BKEndOfBookCardTransitionAnimationController alloc], "initWithCompactViewController:cardViewController:", self, v7);
      -[BKEndOfBookCompactViewController setTransitionAnimationController:](self, "setTransitionAnimationController:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController transitionAnimationController](self, "transitionAnimationController"));
      objc_msgSend(v9, "prepareForDismissal");

    }
  }
  -[BKEndOfBookCompactViewController _trackInteractiveDismissal](self, "_trackInteractiveDismissal");

}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (isPhone(self, a2))
    +[UIViewController attemptRotationToDeviceOrientation](UIViewController, "attemptRotationToDeviceOrientation");
}

- (void)_trackInteractiveDismissal
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  unsigned __int8 v7;

  v3 = -[BKEndOfBookCompactViewController _shouldUseCoverAnimationWhenPresenting:](self, "_shouldUseCoverAnimationWhenPresenting:", 0);
  if (-[BKEndOfBookCompactViewController isPresentingCard](self, "isPresentingCard"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController transitionCoordinator](self, "transitionCoordinator"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));

  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100172CC0;
  v6[3] = &unk_1008EAE20;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(v4, "notifyWhenInteractionChangesUsingBlock:", v6);

}

- (void)toastPresenter:(id)a3 willPresentToastInViewController:(id)a4
{
  -[BKEndOfBookCompactViewController setIsPresented:](self, "setIsPresented:", 1, a4);
}

- (void)toastPresenterWillDismissToast:(id)a3
{
  -[BKEndOfBookCompactViewController setIsPresented:](self, "setIsPresented:", 0);
}

- (void)endOfBookCardViewControllerDidFinish:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BKEndOfBookCardTransitionAnimationController *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));

  if (v5 == v4)
  {
    -[BKEndOfBookCompactViewController _willDismissCardWithReason:](self, "_willDismissCardWithReason:", 1);
    if (-[BKEndOfBookCompactViewController _shouldUseCoverAnimationWhenPresenting:](self, "_shouldUseCoverAnimationWhenPresenting:", 0))
    {
      v6 = objc_opt_class(BKEndOfBookCardViewController);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
      v8 = BUDynamicCast(v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      v10 = -[BKEndOfBookCardTransitionAnimationController initWithCompactViewController:cardViewController:]([BKEndOfBookCardTransitionAnimationController alloc], "initWithCompactViewController:cardViewController:", self, v9);
      -[BKEndOfBookCompactViewController setTransitionAnimationController:](self, "setTransitionAnimationController:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController transitionAnimationController](self, "transitionAnimationController"));
      objc_msgSend(v11, "prepareForDismissal");

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController cardViewController](self, "cardViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentingViewController"));
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);

    -[BKEndOfBookCompactViewController _trackInteractiveDismissal](self, "_trackInteractiveDismissal");
  }
}

- (void)_closeAllCardsIncludingEOB:(id)a3 cardStackViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = BCAugmentedExperienceLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dismissing card stack and EndOfBook card simultaneously", buf, 2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100173080;
  v20[3] = &unk_1008E7680;
  v13 = v8;
  v21 = v13;
  v22 = v9;
  v14 = v9;
  objc_msgSend(v10, "popAllCardsAnimated:completion:", 1, v20);
  -[BKEndOfBookCompactViewController _willDismissCardWithReason:](self, "_willDismissCardWithReason:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transitionCoordinator"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100173090;
  v18[3] = &unk_1008E8308;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v15, "animateAlongsideTransitionInView:animation:completion:", v16, v18, 0);

}

- (void)endOfBookCardViewControllerWantsToCloseToAsset:(id)a3 cardStackViewController:(id)a4 completion:(id)a5
{
  id v7;
  _QWORD v8[4];
  BKEndOfBookCompactViewController *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100173178;
  v8[3] = &unk_1008E7680;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[BKEndOfBookCompactViewController _closeAllCardsIncludingEOB:cardStackViewController:completion:](v9, "_closeAllCardsIncludingEOB:cardStackViewController:completion:", a3, a4, v8);

}

- (void)endOfBookCardViewControllerWantsToCloseAsset:(id)a3 cardStackViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKPrimaryScenePresenting));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
  objc_msgSend(v11, "presenterSelectTabWithIdentifier:", v12);

  self->_closingBook = 1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001732C8;
  v14[3] = &unk_1008E7680;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  -[BKEndOfBookCompactViewController _closeAllCardsIncludingEOB:cardStackViewController:completion:](self, "_closeAllCardsIncludingEOB:cardStackViewController:completion:", v10, v9, v14);

}

- (id)ba_analyticsTracker
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKEndOfBookCompactViewController;
  v3 = -[BKEndOfBookCompactViewController ba_analyticsTracker](&v9, "ba_analyticsTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController feedViewController](self, "feedViewController"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ba_analyticsTracker"));

  }
  return v6;
}

- (void)_reportFigaroOpenClickEventWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", JSARecordEventTypeClick, JSARecordKeyEventType);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", JSARecordActionTypeNavigate, JSARecordKeyActionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController contentView](self, "contentView"));
  objc_msgSend(v7, "center");
  objc_msgSend(v6, "convertPoint:toView:", 0);
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, JSARecordKeyPositionX);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, JSARecordKeyPositionY);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController _additionalInfoForClickEvent:](self, "_additionalInfoForClickEvent:", v4));
  +[JSAApplication recordNativeEvent:additionalInfo:](JSAApplication, "recordNativeEvent:additionalInfo:", v15, v14);

}

- (void)_reportFigaroCloseClickEventWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", JSARecordEventTypeClick, JSARecordKeyEventType);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", JSARecordActionTypeDismiss, JSARecordKeyActionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController closeButton](self, "closeButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController closeButton](self, "closeButton"));
  objc_msgSend(v7, "center");
  objc_msgSend(v6, "convertPoint:toView:", 0);
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, JSARecordKeyPositionX);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, JSARecordKeyPositionY);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController _additionalInfoForClickEvent:](self, "_additionalInfoForClickEvent:", v4));
  +[JSAApplication recordNativeEvent:additionalInfo:](JSAApplication, "recordNativeEvent:additionalInfo:", v15, v14);

}

- (id)_additionalInfoForClickEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v12[0] = CFSTR("tracker");
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13[0] = v6;
  v12[1] = CFSTR("feed");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCompactViewController feedViewController](self, "feedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feed"));
  v9 = v8;
  if (!v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12[2] = CFSTR("reason");
  v13[1] = v9;
  v13[2] = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
  if (!v8)

  if (!v5)
  return v10;
}

- (UIViewController)cardViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_cardViewController);
}

- (BOOL)pageProgressionIsRTL
{
  return self->_pageProgressionIsRTL;
}

- (void)setPageProgressionIsRTL:(BOOL)a3
{
  self->_pageProgressionIsRTL = a3;
}

- (BKEndOfBookCompactViewControllerDelegate)delegate
{
  return (BKEndOfBookCompactViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (BOOL)wasToolbarVisible
{
  return self->_wasToolbarVisible;
}

- (void)setWasToolbarVisible:(BOOL)a3
{
  self->_wasToolbarVisible = a3;
}

- (UIView)closeButton
{
  return self->_closeButton;
}

- (BKEndOfBookCardTransitionAnimationController)transitionAnimationController
{
  return self->_transitionAnimationController;
}

- (void)setTransitionAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimationController, a3);
}

- (NSMutableArray)presentationCompletionBlocks
{
  return self->_presentationCompletionBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_transitionAnimationController, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedViewController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dropShadowView, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
}

@end
