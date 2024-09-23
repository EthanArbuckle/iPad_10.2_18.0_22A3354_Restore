@implementation BCCardViewController

- (BCCardViewController)initWithNavigationControllerClass:(Class)a3 cardSetData:(id)a4 distanceToExpand:(double)a5
{
  id v8;
  BCCardViewController *v9;
  BCCardViewController *v10;
  UITapGestureRecognizer *v11;
  UITapGestureRecognizer *cardTapGestureRecognizer;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BCCardViewController;
  v9 = -[BCCardViewController init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationControllerClass, a3);
    objc_storeWeak((id *)&v10->_cardSetData, v8);
    v10->_distanceToExpand = a5;
    ++qword_30D4C0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1B324C();
    v11 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v10, "cardTapped:");
    cardTapGestureRecognizer = v10->_cardTapGestureRecognizer;
    v10->_cardTapGestureRecognizer = v11;

    v10->_uppEnabled = _os_feature_enabled_impl("Books", "unifiedProductPage");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v14 = -[BCCardViewController registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v13, "_traitCollectionDidChange:previousTraitCollection:");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, "_applicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, "_applicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

  }
  return v10;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController viewState](self, "viewState", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view"));
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController viewState](self, "viewState"));
    objc_msgSend(v10, "viewSize");
    v12 = v11;
    v14 = v13;

    if (v7 == v12 && v9 == v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController viewState](self, "viewState"));
      objc_msgSend(v15, "cardScrollViewContentOffset");
      v17 = v16;
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v20, "setContentOffset:", v17, v19);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController viewState](self, "viewState"));
      objc_msgSend(v21, "contentScrollViewContentOffset");
      v23 = v22;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
      objc_msgSend(v26, "setContentOffset:", v23, v25);

    }
    -[BCCardViewController setViewState:](self, "setViewState:", 0);
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  double v4;
  double v5;
  void *v7;
  BCCardViewControllerViewState *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  BCCardViewControllerViewState *v21;
  id v22;

  v22 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView", a3));
  objc_msgSend(v22, "contentOffset");
  if (v5 != CGPointZero.x || v4 != CGPointZero.y)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController viewState](self, "viewState"));

    if (v7)
      return;
    v8 = [BCCardViewControllerViewState alloc];
    v22 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
    objc_msgSend(v22, "contentOffset");
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
    objc_msgSend(v13, "contentOffset");
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view"));
    objc_msgSend(v18, "size");
    v21 = -[BCCardViewControllerViewState initWithContentOffset:contentScrollViewContentOffset:viewSize:](v8, "initWithContentOffset:contentScrollViewContentOffset:viewSize:", v10, v12, v15, v17, v19, v20);
    -[BCCardViewController setViewState:](self, "setViewState:", v21);

  }
}

- (BOOL)isCurrentCard
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController glassView](self, "glassView"));
  v3 = v2 == 0;

  return v3;
}

- (void)setIsCurrentCard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController glassView](self, "glassView"));

  if (v3)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController glassView](self, "glassView"));
      objc_msgSend(v6, "removeFromSuperview");

      -[BCCardViewController setGlassView:](self, "setGlassView:", 0);
    }
  }
  else if (!v5)
  {
    v7 = objc_alloc((Class)UIView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    objc_msgSend(v8, "bounds");
    v9 = objc_msgSend(v7, "initWithFrame:");

    objc_msgSend(v9, "setAutoresizingMask:", 18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    objc_msgSend(v10, "addSubview:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    objc_msgSend(v11, "bringSubviewToFront:", v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardTapGestureRecognizer](self, "cardTapGestureRecognizer"));
    objc_msgSend(v9, "addGestureRecognizer:", v12);

    -[BCCardViewController setGlassView:](self, "setGlassView:", v9);
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  objc_msgSend(v13, "setIsCurrentCard:", v3);

}

- (void)dealloc
{
  UIScrollView **p_contentScrollView;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  p_contentScrollView = &self->_contentScrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), off_306A00);

  v5 = objc_loadWeakRetained((id *)p_contentScrollView);
  objc_msgSend(v5, "_removeScrollViewScrollObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "_removeScrollViewScrollObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);
  --qword_30D4C0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_1B32C0();

  v8.receiver = self;
  v8.super_class = (Class)BCCardViewController;
  -[BCCardViewController dealloc](&v8, "dealloc");
}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  self->_cornerRadius = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  objc_msgSend(v5, "cardContractedScale");
  v7 = a3 / v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
  objc_msgSend(v8, "_setContinuousCornerRadius:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v9, "_setContinuousCornerRadius:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  objc_msgSend(v10, "_setContinuousCornerRadius:", v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v11, "_setContinuousCornerRadius:", v7);

  -[BCCardViewController _updateShadowPath](self, "_updateShadowPath");
}

- (void)setRoundedCorners:(BOOL)a3
{
  self->_roundedCorners = a3;
  -[BCCardViewController setCornerRadius:](self, "setCornerRadius:", self->_cornerRadius);
}

- (void)setAnimator:(id)a3
{
  UIViewPropertyAnimator *v4;
  UIViewPropertyAnimator *animator;
  id v6;
  NSObject *v7;
  UIViewPropertyAnimator *v8;

  v4 = (UIViewPropertyAnimator *)a3;
  animator = self->_animator;
  if (animator && -[UIViewPropertyAnimator state](animator, "state") == (char *)&dword_0 + 1)
  {
    v6 = BCCardModelLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1B3334(v7);

    -[UIViewPropertyAnimator stopAnimation:](self->_animator, "stopAnimation:", 0);
    -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_animator, "finishAnimationAtPosition:", 2);
  }
  v8 = self->_animator;
  self->_animator = v4;

}

- (BOOL)itemPushedOnCard
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllers"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (void)_updateFromMetrics
{
  -[BCCardViewController _updateShadowPath](self, "_updateShadowPath");
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_rootScrollView;
}

- (void)viewDidLoad
{
  BCCardViewControllerScrollView *v3;
  void *v4;
  BCCardViewControllerScrollView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *navigationControllerClass;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  BCCardGripperView *v43;
  BCCardGripperView *gripperView;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)BCCardViewController;
  -[BCCardViewController viewDidLoad](&v58, "viewDidLoad");
  v3 = [BCCardViewControllerScrollView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = -[BCCardViewControllerScrollView initWithFrame:](v3, "initWithFrame:");

  -[BCCardViewControllerScrollView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[BCCardViewControllerScrollView setAccessibilityDelegate:](v5, "setAccessibilityDelegate:", self);
  -[BCCardViewControllerScrollView setContentInsetAdjustmentBehavior:](v5, "setContentInsetAdjustmentBehavior:", 2);
  -[BCCardViewControllerScrollView setClipsToBounds:](v5, "setClipsToBounds:", 0);
  -[BCCardViewControllerScrollView setDelegate:](v5, "setDelegate:", self);
  -[BCCardViewControllerScrollView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 1);
  -[BCCardViewControllerScrollView setAlwaysBounceVertical:](v5, "setAlwaysBounceVertical:", 1);
  objc_storeStrong((id *)&self->_rootScrollView, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v5);

  v7 = objc_alloc_init((Class)UIView);
  -[BCCardViewController setCardView:](self, "setCardView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1)));
  v12 = objc_msgSend(v11, "CGColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setBorderColor:", v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v19, "setBorderWidth:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  objc_msgSend(v20, "addSubview:", v21);

  v22 = objc_alloc_init((Class)UIView);
  -[BCCardViewController setContentContainerView:](self, "setContentContainerView:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v23, "setAutoresizingMask:", 18);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v24, "addSubview:", v25);

  navigationControllerClass = self->_navigationControllerClass;
  if (!navigationControllerClass)
    navigationControllerClass = (objc_class *)UINavigationController;
  v27 = objc_alloc_init(navigationControllerClass);
  -[BCCardViewController setCardNavigationController:](self, "setCardNavigationController:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  objc_msgSend(v28, "setDelegate:", self);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  -[BCCardViewController addChildViewController:](self, "addChildViewController:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
  objc_msgSend(v31, "setAutoresizingMask:", 2);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
  objc_msgSend(v32, "addSubview:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  objc_msgSend(v35, "didMoveToParentViewController:", self);

  -[BCCardViewController _updateCardFrames](self, "_updateCardFrames");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view"));
  objc_msgSend(v36, "bounds");
  -[BCCardViewController updateContentSize:](self, "updateContentSize:", v37, v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v39, "setClipsToBounds:", 1);

  -[BCCardViewController setRoundedCorners:](self, "setRoundedCorners:", 1);
  v40 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "dismissPan:");
  objc_msgSend(v40, "setDelegate:", self);
  -[BCCardViewController setDismissPanGestureRecognizer:](self, "setDismissPanGestureRecognizer:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "navigationBar"));
  objc_msgSend(v42, "addGestureRecognizer:", v40);

  if (!self->_uppEnabled)
  {
    v43 = (BCCardGripperView *)objc_claimAutoreleasedReturnValue(+[BCCardGripperView cardGripperViewWithStyle:](BCCardGripperView, "cardGripperViewWithStyle:", 0));
    gripperView = self->_gripperView;
    self->_gripperView = v43;

    -[BCCardGripperView setAlpha:](self->_gripperView, "setAlpha:", 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView layer](self->_gripperView, "layer"));
    objc_msgSend(v45, "setZPosition:", 1000.0);

    -[BCCardGripperView _accessibilitySetSortPriority:](self->_gripperView, "_accessibilitySetSortPriority:", 999);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
    objc_msgSend(v46, "setAccessibilityDelegate:", self);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
    objc_msgSend(v47, "addSubview:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "view"));
    -[BCCardViewController anchorGripperView:toView:](self, "anchorGripperView:toView:", v49, v51);

    v52 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "gripperTapped:");
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
    objc_msgSend(v53, "addGestureRecognizer:", v52);

    -[BCCardViewController _setupGripperMenu](self, "_setupGripperMenu");
  }
  v54 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "scrollViewTapped:");
  objc_msgSend(v54, "setDelegate:", self);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v55, "addGestureRecognizer:", v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
  -[BCCardViewController _setCurrentState:updateStatusBarIfNeeded:](self, "_setCurrentState:updateStatusBarIfNeeded:", v56, 0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v57, "_addScrollViewScrollObserver:", self);

  -[BCCardViewController _updateFromMetrics](self, "_updateFromMetrics");
}

- (void)anchorGripperView:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[2];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  objc_msgSend(v8, "auxiliaryNavigationBarHorizontalInset");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  objc_msgSend(v11, "auxiliaryNavigationBarVerticalInset");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, v13));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -v10));
  v20 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));

  if (v20 == v7)
    -[BCCardViewController setAuxiliaryNavigationBarTopConstraint:](self, "setAuxiliaryNavigationBarTopConstraint:", v16);
  v22[0] = v16;
  v22[1] = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (UIView)auxiliaryNavigationBarView
{
  void *v2;
  void *v3;

  if (self->_uppEnabled)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
  }
  return (UIView *)v3;
}

- (UIView)auxiliaryNavigationBarViewForAnimation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "animatableCopyView"));

  return (UIView *)v3;
}

- (void)attachAuxiliaryNavigationBarViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentViewController"));

    if (!v7)
    {
      -[BCCardViewController addChildViewController:](self, "addChildViewController:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
      objc_msgSend(v8, "addSubview:", v9);

      objc_msgSend(v6, "didMoveToParentViewController:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
      -[BCCardViewController anchorAuxiliaryNavigationBarView:toView:](self, "anchorAuxiliaryNavigationBarView:toView:", v10, v12);

      if (v3)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
        objc_msgSend(v13, "alpha");
        v15 = v14;

        if (v15 != 0.0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
          objc_msgSend(v16, "alpha");
          v18 = v17;

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISpringTimingParameters bc_swiftUIDefault](UISpringTimingParameters, "bc_swiftUIDefault"));
          v20 = objc_alloc((Class)UIViewPropertyAnimator);
          objc_msgSend(v19, "settlingDuration");
          v21 = objc_msgSend(v20, "initWithDuration:timingParameters:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
          objc_msgSend(v22, "setAlpha:", 0.0);

          v23 = _NSConcreteStackBlock;
          v24 = 3221225472;
          v25 = sub_8314;
          v26 = &unk_28B938;
          v27 = v6;
          v28 = v18;
          objc_msgSend(v21, "addAnimations:", &v23);
          objc_msgSend(v21, "startAnimation", v23, v24, v25, v26);

        }
      }
    }
  }

}

- (double)auxiliaryNavigationBarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationBar"));
  objc_msgSend(v3, "defaultHeightForMetrics:", 0);
  v5 = v4;

  return v5;
}

- (void)anchorAuxiliaryNavigationBarView:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[3];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v17 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarView](self, "auxiliaryNavigationBarView"));

  if (v17 == v7)
    -[BCCardViewController setAuxiliaryNavigationBarTopConstraint:](self, "setAuxiliaryNavigationBarTopConstraint:", v10);
  v19[0] = v10;
  v19[1] = v13;
  v19[2] = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (void)_setAuxiliaryNavigationBarViewAlpha:(double)a3
{
  void *v4;
  id v5;

  if (self->_uppEnabled)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarView](self, "auxiliaryNavigationBarView"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
  v5 = v4;
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCCardViewController;
  -[BCCardViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetData](self, "cardSetData"));
  if ((objc_msgSend(v4, "covered") & 1) != 0)
  {

LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
    objc_msgSend(v7, "setIsParentCardOccluded:", 1);
    goto LABEL_6;
  }
  v5 = -[BCCardViewController isCurrentCard](self, "isCurrentCard");

  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
  objc_msgSend(v6, "setIsParentCardOccluded:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController topContentViewController](self, "topContentViewController"));
  objc_msgSend(v7, "didBecomeVisibleContentScrollView");
LABEL_6:

}

- (void)bc_analyticsVisibilityDidAppear
{
  void *v3;
  unsigned int v4;
  void *v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCCardViewController;
  -[BCCardViewController bc_analyticsVisibilityDidAppear](&v7, "bc_analyticsVisibilityDidAppear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetData](self, "cardSetData"));
  if ((objc_msgSend(v3, "covered") & 1) != 0)
  {

  }
  else
  {
    v4 = -[BCCardViewController isCurrentCard](self, "isCurrentCard");

    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_8758;
      block[3] = &unk_28B960;
      block[4] = self;
      dispatch_after(0, (dispatch_queue_t)&_dispatch_main_q, block);
      return;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
  objc_msgSend(v5, "setIsParentCardOccluded:", 1);

}

- (void)bc_analyticsVisibilityDidDisappear
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCCardViewController;
  -[BCCardViewController bc_analyticsVisibilityDidDisappear](&v4, "bc_analyticsVisibilityDidDisappear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
  objc_msgSend(v3, "setIsParentCardOccluded:", 1);

}

- (void)scrollViewTapped:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController delegate](self, "delegate"));
    objc_msgSend(v4, "cardViewControllerDidTapScrollView:", self);

  }
}

- (void)cardTapped:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController delegate](self, "delegate"));
    objc_msgSend(v4, "cardViewControllerDidTapCard:", self);

  }
}

- (void)dismissPan:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v5, "cardViewController:dismissPan:cardData:", self, v4, self);

}

- (void)_setupGripperMenu
{
  _QWORD v3[4];
  id v4;
  id location;

  -[BCCardGripperView setContextMenuInteractionEnabled:](self->_gripperView, "setContextMenuInteractionEnabled:", 1);
  -[BCCardGripperView setMenuViewController:](self->_gripperView, "setMenuViewController:", self);
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_89F4;
  v3[3] = &unk_28B9B0;
  objc_copyWeak(&v4, &location);
  -[BCCardGripperView setActionProvider:](self->_gripperView, "setActionProvider:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)gripperTapped:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardStackViewController](self, "cardStackViewController"));
    objc_msgSend(v4, "popCardsAnimated:reason:", 1, 1);

  }
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardStackViewController](self, "cardStackViewController"));
  objc_msgSend(v2, "popCardsAnimated:reason:", 1, 0);

  return 1;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCCardViewController;
  -[BCCardViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[BCCardViewController _updateCardFrames](self, "_updateCardFrames");
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
  v10.super_class = (Class)BCCardViewController;
  v7 = a4;
  -[BCCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8F38;
  v9[3] = &unk_28B8F0;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9114;
  v8[3] = &unk_28B8F0;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)_updateCardFrames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
    goto LABEL_5;
  }
  if (!-[BCCardViewController dismissing](self, "dismissing"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
LABEL_5:
    v5 = v4;
    objc_msgSend(v4, "cardViewControllerUpdateCardSize:", self);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[BCCardViewController _updateShadowPath](self, "_updateShadowPath");
}

- (void)updateContentSize:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v6, "cardViewController:updateContentSize:", self, width, height);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id v35;

  v35 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  if (v4 == v35)
  {

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));

    if (v5 != v35)
      goto LABEL_14;
  }
  if (self->_uppEnabled)
    v6 = objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarView](self, "auxiliaryNavigationBarView"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v8, "cardViewController:positionAuxiliaryNavigationBarView:cardDate:", self, v7, self);

  if (self->_uppEnabled)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarView](self, "auxiliaryNavigationBarView"));
    objc_msgSend(v9, "alpha");
    if (v10 != 1.0)
    {
LABEL_12:

      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
    v13 = (char *)objc_msgSend(v12, "count");

    if (v13 == (_BYTE *)&dword_0 + 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
      objc_msgSend(v9, "cardViewController:positionAuxiliaryNavigationBarBackgroundWithData:", self, self);
      goto LABEL_12;
    }
  }
LABEL_13:

LABEL_14:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v15 = objc_msgSend(v14, "ignoreContentOffsetForCardViewController:", self);

  if ((v15 & 1) == 0)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));

    if (v16 != v35)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      if (v17 != v35)
      {
LABEL_25:

        goto LABEL_26;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      if ((objc_msgSend(v18, "isDecelerating") & 1) != 0)
        goto LABEL_20;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      if (objc_msgSend(v19, "isDragging"))
      {

LABEL_20:
        v17 = v35;
LABEL_24:

        goto LABEL_25;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetData](self, "cardSetData"));
      v34 = objc_msgSend(v33, "isInTransitionUpdateMode");

      if ((v34 & 1) != 0)
        goto LABEL_26;
LABEL_23:
      v17 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
      objc_msgSend(v17, "cardViewController:repositionOffsetsWithContentScrollView:cardData:", self, v18, self);
      goto LABEL_24;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
    objc_msgSend(v20, "cardViewController:cardScrollViewOffsetForContentScrollView:cardData:", self, v21, self);
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
    objc_msgSend(v24, "contentOffset");
    v26 = v25;
    v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v29, "scale");
    v31 = 1.0 / v30;

    if (vabdd_f64(v23, v28) >= v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v32, "setContentOffset:", v26, v23);

      goto LABEL_23;
    }
  }
LABEL_26:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  _QWORD v28[7];
  objc_super v29;

  v10 = a4;
  v11 = a5;
  if (off_306A00 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("contentSize")))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));

      if (v12 == v10)
      {
        v13 = objc_opt_class(NSValue);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
        v15 = BUDynamicCast(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        objc_msgSend(v16, "CGSizeValue");
        v18 = v17;
        v20 = v19;
        v21 = objc_opt_class(NSValue);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
        v23 = BUDynamicCast(v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        objc_msgSend(v24, "CGSizeValue");
        if (v26 != v18 || v25 != v20)
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_97C0;
          v28[3] = &unk_28B9D8;
          v28[4] = self;
          *(double *)&v28[5] = v18;
          *(double *)&v28[6] = v20;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
        }

      }
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)BCCardViewController;
    -[BCCardViewController observeValueForKeyPath:ofObject:change:context:](&v29, "observeValueForKeyPath:ofObject:change:context:", a3, v10, v11, a6);
  }

}

- (BCCardContent)topContentViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topViewController"));
  v4 = objc_opt_class(UIViewController);
  v5 = BUClassAndProtocolCast(v3, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (BCCardContent *)v6;
}

- (void)_applyContentInsetToContentViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  if ((objc_opt_respondsToSelector(v15, "scrollView") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    if (v6 == v15)
      -[BCCardViewController contentInset](self, "contentInset");
    else
      -[BCCardViewController contentInsetForContent](self, "contentInsetForContent");
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;

    -[BCCardViewController _updateViewController:withContentInset:unalteredContentInset:](self, "_updateViewController:withContentInset:unalteredContentInset:", v15, v11, v12, v13, v14, self->_unalteredContentInset.top, self->_unalteredContentInset.left, self->_unalteredContentInset.bottom, self->_unalteredContentInset.right);
  }

}

- (void)_updateContentWithContentInset
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(UIViewController);
        v11 = BUClassAndProtocolCast(v9, v10, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        -[BCCardViewController _applyContentInsetToContentViewController:](self, "_applyContentInsetToContentViewController:", v12, &OBJC_PROTOCOL___BCCardContent);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MaxY;
  void *v23;
  double v24;
  double v25;
  double v26;
  CGRect v30;
  CGRect v31;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_unalteredContentInset = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  v9 = objc_msgSend(v8, "cardsCanExpand");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v13, "bounds");
    objc_msgSend(v11, "convertRect:toView:", 0);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v30.origin.x = v15;
    v30.origin.y = v17;
    v30.size.width = v19;
    v30.size.height = v21;
    MaxY = CGRectGetMaxY(v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    objc_msgSend(v23, "frame");
    v24 = CGRectGetMaxY(v31);

    v25 = v24 - MaxY;
    if (v24 - MaxY <= 0.0)
      v25 = -0.0;
    bottom = bottom + v25;
  }
  v26 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v26 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.top = top;
    self->_contentInset.left = left;
    self->_contentInset.bottom = bottom;
    self->_contentInset.right = right;
    -[BCCardViewController contentInsetForContent](self, "contentInsetForContent", v26);
    UIEdgeInsetsReplace(4);
    -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:");
    -[BCCardViewController _updateScrollViewContentInset](self, "_updateScrollViewContentInset");
    -[BCCardViewController _updateContentWithContentInset](self, "_updateContentWithContentInset");
  }
}

- (UIEdgeInsets)_scrollIndicatorInsetsForContentInset:(UIEdgeInsets)a3 unalteredContentInset:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  double top;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  v10 = objc_msgSend(v9, "cardsCanExpand");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
    objc_msgSend(v11, "scaledContractedOffset");

    if (top == 0.0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
      objc_msgSend(v12, "cardCornerRadius");

    }
    top = UIEdgeInsetsReplace(4);
    left = v13;
    bottom = v14;
    right = v15;
  }
  v16 = top;
  v17 = left;
  v18 = bottom;
  v19 = right;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)_updateViewController:(id)a3 withContentInset:(UIEdgeInsets)a4 unalteredContentInset:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;
  id v15;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v9 = a4.right;
  v10 = a4.bottom;
  v11 = a4.left;
  v12 = a4.top;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scrollView"));
  -[BCCardViewController _updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:](self, "_updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:", v14, v15, v12, v11, v10, v9, top, left, bottom, right, *(_QWORD *)&v12, *(_QWORD *)&v11, *(_QWORD *)&v10, *(_QWORD *)&v9);

}

- (void)_updateViewController:(double)a3 scrollView:(double)a4 withContentInset:(double)a5 unalteredContentInset:(double)a6 contentInsetForScrollIndicatorInsets:(double)a7
{
  id v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  char *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v45;

  v45 = a11;
  v26 = a12;
  if (objc_msgSend(v45, "prefersAdditionalSafeAreaInsetsForInsetting"))
  {
    v27 = a4 - BCCardAdditionalBottomInset();
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "viewIfLoaded"));
    objc_msgSend(v28, "safeAreaInsets");
    v30 = v29;
    objc_msgSend(v45, "additionalSafeAreaInsets");
    v32 = v30 - v31;

    objc_msgSend(v45, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v27 - v32, 0.0);
  }
  else
  {
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "scrollView"));
    if ((id)v33 == v26)
    {

      v36 = a5;
      v37 = a15;
      v39 = a4;
      v38 = a14;
      v40 = a3;
    }
    else
    {
      v34 = (void *)v33;
      v35 = (char *)objc_msgSend(v26, "contentInsetAdjustmentBehavior");

      v36 = a5;
      v37 = a15;
      v39 = a4;
      v38 = a14;
      v40 = a3;
      if (v35 != (_BYTE *)&dword_0 + 2)
        objc_msgSend(v26, "setContentInsetAdjustmentBehavior:", 2);
    }
    objc_msgSend(v26, "setContentInset:", a2, v40, v39, v36);
    objc_msgSend(a1, "_scrollIndicatorInsetsForContentInset:unalteredContentInset:", a13, v38, v37, a16, a6, a7, a8, a9);
    objc_msgSend(v26, "setScrollIndicatorInsets:");
  }

}

- (void)_updateScrollViewContentInset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  if (objc_msgSend(v3, "useContentInsetForContentForScrollIndicatorInsets"))
    -[BCCardViewController contentInsetForContent](self, "contentInsetForContent");
  else
    -[BCCardViewController contentInset](self, "contentInset");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  -[BCCardViewController contentInset](self, "contentInset");
  -[BCCardViewController _updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:](self, "_updateViewController:scrollView:withContentInset:unalteredContentInset:contentInsetForScrollIndicatorInsets:", 0, v12, v8, v9, v10, v11);

}

- (void)setupRootContentScrollView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
  -[BCCardViewController setContentScrollView:](self, "setContentScrollView:", v4);

}

- (void)setContentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  else
  {
    v6 = &__NSArray0__struct;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  objc_msgSend(v7, "setViewControllers:", v6);

  if (v5)
  -[BCCardViewController _applyContentInsetToContentViewController:](self, "_applyContentInsetToContentViewController:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scrollView"));
  -[BCCardViewController setupRootContentScrollView:](self, "setupRootContentScrollView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  objc_msgSend(v9, "bc_updateNavBarVisibleWithTransitionCoordinator:duration:", 0, 0.0);

  v10 = BUProtocolCast(&OBJC_PROTOCOL___BCSafeAreaInsetsObservable, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v11, "setBcSafeAreaInsetsObserver:", self);
  if (self->_uppEnabled
    && (objc_opt_respondsToSelector(v5, "auxiliaryNavigationBarViewControllerWithCompletionHandler:") & 1) != 0)
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_A29C;
    v12[3] = &unk_28BA00;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "auxiliaryNavigationBarViewControllerWithCompletionHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)setContentScrollView:(id)a3
{
  sub_A454((uint64_t)self, a3, 1);
}

- (BCCardStackTransitioningCardContent)transitioningCardContent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCCardStackTransitioningCardContent));

  return (BCCardStackTransitioningCardContent *)v3;
}

- (void)setScrimAlpha:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[6];

  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));

  if (v9)
  {
    if (v6)
    {
LABEL_3:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_A9BC;
      v26[3] = &unk_28B938;
      v26[4] = self;
      *(double *)&v26[5] = a3;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_A9FC;
      v25[3] = &unk_28BA28;
      *(double *)&v25[5] = a3;
      v25[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v26, v25, a5);
      return;
    }
  }
  else
  {
    if (a3 == 0.0)
      return;
    v10 = objc_alloc((Class)UIView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    objc_msgSend(v11, "bounds");
    v12 = objc_msgSend(v10, "initWithFrame:");
    -[BCCardViewController setBlackScrimView:](self, "setBlackScrimView:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
    objc_msgSend(v13, "setAutoresizingMask:", 18);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
    objc_msgSend(v14, "addSubview:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
    objc_msgSend(v17, "setBackgroundColor:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
    objc_msgSend(v18, "setAlpha:", 0.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
    objc_msgSend(v19, "_continuousCornerRadius");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
    objc_msgSend(v22, "_setContinuousCornerRadius:", v21);

    if (v6)
      goto LABEL_3;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
  objc_msgSend(v23, "setAlpha:", a3);

  if (a3 == 0.0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController blackScrimView](self, "blackScrimView"));
    objc_msgSend(v24, "removeFromSuperview");

    -[BCCardViewController setBlackScrimView:](self, "setBlackScrimView:", 0);
  }
}

- (void)_configureAsExpanded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  -[BCCardViewController setRoundedCorners:](self, "setRoundedCorners:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  -[BCCardViewController distanceToExpand](self, "distanceToExpand");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "adjustedContentInset");
  v10 = v7 - v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v11, "setContentOffset:", v5, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
  -[BCCardViewController setCurrentState:](self, "setCurrentState:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v13, "cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", self, self);
  v15 = v14;

  -[BCCardViewController _setAuxiliaryNavigationBarViewAlpha:](self, "_setAuxiliaryNavigationBarViewAlpha:", v15);
}

- (void)configureChromeForExpanded
{
  void *v3;
  double v4;
  double v5;

  -[BCCardViewController setRoundedCorners:](self, "setRoundedCorners:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState cardViewControllerExpandedState:](BCCardSetState, "cardViewControllerExpandedState:", self));
  objc_msgSend(v3, "cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", self, self);
  v5 = v4;

  -[BCCardViewController _setAuxiliaryNavigationBarViewAlpha:](self, "_setAuxiliaryNavigationBarViewAlpha:", v5);
}

- (void)configureChromeForContracted
{
  void *v3;
  double v4;
  double v5;

  -[BCCardViewController setRoundedCorners:](self, "setRoundedCorners:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState cardViewControllerExpandedState:](BCCardSetState, "cardViewControllerExpandedState:", self));
  objc_msgSend(v3, "cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", self, self);
  v5 = v4;

  -[BCCardViewController _setAuxiliaryNavigationBarViewAlpha:](self, "_setAuxiliaryNavigationBarViewAlpha:", v5);
}

- (void)goExpanded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BCCardViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
  if (v29 == v3)
  {

LABEL_10:
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedState](BCCardSetState, "pushedState"));

  if (v4 != v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
    v7 = (BCCardViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCardViewController"));

    if (v7 != self)
    {
      -[BCCardViewController _configureAsExpanded](self, "_configureAsExpanded");
      return;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandingState](BCCardSetState, "expandingState"));
    -[BCCardViewController setCurrentState:](self, "setCurrentState:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController animator](self, "animator"));
    objc_msgSend(v9, "setFractionComplete:", 1.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
    v12 = (char *)objc_msgSend(v11, "count");

    if (v12 == (_BYTE *)&dword_0 + 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v13, "contentOffset");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
      objc_msgSend(v16, "scaledContractedOffset");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
      objc_msgSend(v19, "cardExpandedTopOffset");
      v21 = v18 - v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v22, "adjustedContentInset");
      v24 = v21 - v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v25, "setContentOffset:", v15, v24);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController animator](self, "animator"));
    objc_msgSend(v26, "stopAnimation:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController animator](self, "animator"));
    objc_msgSend(v27, "finishAnimationAtPosition:", 0);

    v29 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
    objc_msgSend(v29, "cardViewController:repositionOffsetsWithContentScrollView:cardData:", self, v28, self);

    goto LABEL_10;
  }
}

- (void)goContracted
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double y;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned int v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v4 = objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
  if (v3 == (void *)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedContractedState](BCCardSetState, "pushedContractedState"));

    if (v6 != v7)
    {
      y = CGPointZero.y;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v9, "setContentOffset:", CGPointZero.x, y);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState contractingState](BCCardSetState, "contractingState"));
      -[BCCardViewController setCurrentState:](self, "setCurrentState:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController animator](self, "animator"));
      objc_msgSend(v11, "setFractionComplete:", 1.0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController animator](self, "animator"));
      objc_msgSend(v12, "stopAnimation:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController animator](self, "animator"));
      objc_msgSend(v13, "finishAnimationAtPosition:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
      v15 = objc_msgSend(v14, "cardsCanExpand");

      if ((v15 & 1) == 0)
        return;
LABEL_7:
      -[BCCardViewController clearSavedContentOffsets](self, "clearSavedContentOffsets");
      v24 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v24, "contentOffset");
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v20, "adjustedContentInset");
      v22 = -v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
      objc_msgSend(v23, "setContentOffset:", v19, v22);

      return;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  v17 = objc_msgSend(v16, "cardsCanExpand");

  if (v17)
    goto LABEL_7;
}

- (void)cardSetPresentationTransitionDidComplete
{
  if (self->_uppEnabled)
    -[BCCardViewController attachAuxiliaryNavigationBarViewAnimated:](self, "attachAuxiliaryNavigationBarViewAnimated:", -[BCCardViewController isCurrentCard](self, "isCurrentCard"));
}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  -[BCCardViewController setContentScrollView:](self, "setContentScrollView:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = BUProtocolCast(&OBJC_PROTOCOL___BCCardContentRebuildable, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "suspendAndTeardownForReason:", v4);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)clearSavedContentOffsets
{
  double y;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  y = CGPointZero.y;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setContentOffset:", CGPointZero.x, y);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = BUProtocolCast(&OBJC_PROTOCOL___BCCardContentRebuildable, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v12, "clearSuspendedViewState");

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)resumeAndRebuildForReason:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __objc2_prot *v43;
  _QWORD v44[5];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "adjustedContentInset");
  v10 = v7 + v9;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v12);
        v17 = BUProtocolCast(&OBJC_PROTOCOL___BCCardContentRebuildable, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = objc_msgSend(v18, "resumeAndRebuildForReason:", v4);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v14);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v20, "contentOffset");
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v23, "adjustedContentInset");
  v25 = v10 - v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v26, "setContentOffset:", v22, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "viewControllers"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
  v30 = objc_opt_class(UIViewController);
  v43 = &OBJC_PROTOCOL___BCCardContent;
  v31 = BUClassAndProtocolCast(v29, v30, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  if (v32)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_B6D4;
    v44[3] = &unk_28B808;
    v44[4] = self;
    v45 = v32;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v44, &OBJC_PROTOCOL___BCCardContent);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController", v43));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "viewControllers"));
  v35 = objc_msgSend(v34, "count");

  if ((unint64_t)v35 >= 2)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "viewControllers"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastObject"));
    v39 = objc_opt_class(UIViewController);
    v40 = BUClassAndProtocolCast(v38, v39, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "scrollView", &OBJC_PROTOCOL___BCCardContent));
      -[BCCardViewController setContentScrollView:](self, "setContentScrollView:", v42);

      -[BCCardViewController _adjustContentInsetForViewController:](self, "_adjustContentInsetForViewController:", v41);
      v32 = v41;
    }
    else
    {
      v32 = 0;
    }
  }

}

- (void)scrollToTop:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController topContentViewController](self, "topContentViewController"));
  v6 = objc_opt_respondsToSelector(v5, "scrollToTopAnimated:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController topContentViewController](self, "topContentViewController"));
    objc_msgSend(v7, "scrollToTopAnimated:", v3);
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    objc_msgSend(v7, "cardViewController:scrollToTopAnimated:cardData:", self, v3, self);
  }

}

- (void)prepareForDismiss
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v3, "cardViewController:willDismissWithCardData:", self, self);

}

- (void)cardViewControllerScrollView:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState", a3));
  objc_msgSend(v7, "cardViewController:accessibilityWantsToScrollToOffset:cardData:", self, self, x, y);

}

- (UIEdgeInsets)accessibilityVisibleContentInsetForCardViewControllerScrollView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  UIEdgeInsets result;

  -[BCCardViewController contentInsetForContent](self, "contentInsetForContent", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  v13 = objc_msgSend(v12, "cardsCanExpand");

  if ((v13 & 1) == 0)
  {
    if (self->_uppEnabled)
      v14 = objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarView](self, "auxiliaryNavigationBarView"));
    else
      v14 = objc_claimAutoreleasedReturnValue(-[BCCardViewController gripperView](self, "gripperView"));
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
    objc_msgSend(v15, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
    objc_msgSend(v17, "convertRect:fromView:", v26, v19, v21, v23, v25);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    v39.origin.x = v28;
    v39.origin.y = v30;
    v39.size.width = v32;
    v39.size.height = v34;
    v5 = v5 + CGRectGetMaxY(v39) + 4.0;

  }
  v35 = v5;
  v36 = v7;
  v37 = v9;
  v38 = v11;
  result.right = v38;
  result.bottom = v37;
  result.left = v36;
  result.top = v35;
  return result;
}

- (void)accessibilityDidActivateGripperView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "cardViewControllerDidTapScrollView:", self);

}

- (void)cardContentViewController:(id)a3 initializeManagerWithScrollView:(id)a4
{
  id v5;

  v5 = a4;
  -[BCCardViewController contentInset](self, "contentInset");
  objc_msgSend(v5, "safeAreaInsets");
  -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:", UIEdgeInsetsReplace(1));
  -[BCCardViewController setupRootContentScrollView:](self, "setupRootContentScrollView:", v5);

}

- (UIEdgeInsets)cardContentViewController:(id)a3 contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a4
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
  UIEdgeInsets result;

  -[BCCardViewController contentInsetForContent](self, "contentInsetForContent", a3, a4.top, a4.left, a4.bottom, a4.right);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarViewController](self, "auxiliaryNavigationBarViewController"));
  objc_msgSend(v5, "backgroundSafeAreaInsets");
  v6 = UIEdgeInsetsReplace(1);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)bcSafeAreaInsetsObservableViewController:(id)a3 safeAreaInsetsDidChange:(UIEdgeInsets)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  -[BCCardViewController contentInset](self, "contentInset", a3);
  v5 = UIEdgeInsetsReplace(1);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers"));
  v14 = objc_msgSend(v13, "count");

  if ((unint64_t)v14 >= 2)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController topContentViewController](self, "topContentViewController"));
    -[BCCardViewController _updateViewController:withContentInset:unalteredContentInset:](self, "_updateViewController:withContentInset:unalteredContentInset:", v15, v5, v7, v9, v11, self->_unalteredContentInset.top, self->_unalteredContentInset.left, self->_unalteredContentInset.bottom, self->_unalteredContentInset.right);

  }
}

- (CGRect)cardStackTransitioningCardFinalFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[BCCardViewController viewFrameBeforeAnimation](self, "viewFrameBeforeAnimation");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)cardStackTransitioningCardExtraXOffset
{
  double result;

  -[BCCardViewController extraXOffsetForAnimation](self, "extraXOffsetForAnimation");
  return result;
}

- (double)cardStackTransitioningCardContentAlpha
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setCardStackTransitioningCardContentAlpha:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)cardStackTransitioningCardPrepare:(BOOL)a3 extraXOffsetForAnimation:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView", a3));
  objc_msgSend(v6, "frame");
  -[BCCardViewController setViewFrameBeforeAnimation:](self, "setViewFrameBeforeAnimation:");

  -[BCCardViewController setExtraXOffsetForAnimation:](self, "setExtraXOffsetForAnimation:", a4);
  v7 = objc_alloc((Class)UIView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  objc_msgSend(v8, "bounds");
  v9 = objc_msgSend(v7, "initWithFrame:");
  -[BCCardViewController setWhiteScrimView:](self, "setWhiteScrimView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardView](self, "cardView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v12, "setAlpha:", 0.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentContainerView](self, "contentContainerView"));
  objc_msgSend(v18, "_continuousCornerRadius");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v17, "_setContinuousCornerRadius:", v16);

}

- (void)cardStackTransitioningCardFinalize:(BOOL)a3
{
  void *v4;

  -[BCCardViewController setViewFrameBeforeAnimation:](self, "setViewFrameBeforeAnimation:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController whiteScrimView](self, "whiteScrimView"));
  objc_msgSend(v4, "removeFromSuperview");

  -[BCCardViewController setWhiteScrimView:](self, "setWhiteScrimView:", 0);
}

- (BOOL)expanded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
  if (v3 == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
    if (objc_msgSend(v5, "cardsCanExpand"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedState](BCCardSetState, "pushedState"));
      v8 = v6 == v7;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)setCurrentState:(id)a3
{
  -[BCCardViewController _setCurrentState:updateStatusBarIfNeeded:](self, "_setCurrentState:updateStatusBarIfNeeded:", a3, 1);
}

- (void)_setCurrentState:(id)a3 updateStatusBarIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  BCCardSetState *v7;
  BCCardSetState **p_currentState;
  BCCardSetState *currentState;
  BCCardSetState *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BCCardSetState *v15;

  v4 = a4;
  v7 = (BCCardSetState *)a3;
  p_currentState = &self->_currentState;
  currentState = self->_currentState;
  if (currentState != v7)
  {
    v15 = v7;
    -[BCCardSetState willStopBeingCurrentStateCardViewController:newState:cardDate:](currentState, "willStopBeingCurrentStateCardViewController:newState:cardDate:", self, v7, self);
    v10 = *p_currentState;
    objc_storeStrong((id *)&self->_currentState, a3);
    -[BCCardSetState didBecomeCurrentStateCardViewController:previousState:cardData:](*p_currentState, "didBecomeCurrentStateCardViewController:previousState:cardData:", self, v10, self);
    if (v4 && !-[BCCardSetState transitioning](*p_currentState, "transitioning"))
    {
      -[BCCardViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
      -[BCCardSetState cardViewControllerStatusBarBackgroundOpacity:](*p_currentState, "cardViewControllerStatusBarBackgroundOpacity:", self);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCStatusBarBackgroundController backgroundControllerForViewController:](BCStatusBarBackgroundController, "backgroundControllerForViewController:", self));
      objc_msgSend(v13, "setOpacity:", v12);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController topContentViewController](self, "topContentViewController"));
    objc_msgSend(v14, "didSetCurrentCardState:", v15);

    v7 = v15;
  }

}

- (void)animationCompletedAtPosition:(int64_t)a3
{
  id v5;

  -[BCCardViewController setAnimator:](self, "setAnimator:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v5, "cardViewController:animationCompletedAtPosition:cardData:", self, a3, self);

}

- (void)_adjustContentInsetForViewController:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double MaxY;
  id v13;
  CGRect v14;

  v13 = a3;
  -[BCCardViewController contentInsetForContent](self, "contentInsetForContent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
  objc_msgSend(v11, "frame");
  MaxY = CGRectGetMaxY(v14);

  -[BCCardViewController setContentInsetForContent:](self, "setContentInsetForContent:", MaxY, v5, v7, v9);
  -[BCCardViewController _updateViewController:withContentInset:unalteredContentInset:](self, "_updateViewController:withContentInset:unalteredContentInset:", v13, MaxY, v5, v7, v9, self->_unalteredContentInset.top, self->_unalteredContentInset.left, self->_unalteredContentInset.bottom, self->_unalteredContentInset.right);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  void *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BCCardViewController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer"));
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarDismissPanGestureRecognizer](self, "auxiliaryNavigationBarDismissPanGestureRecognizer"));

  if (v7 == v4)
  {
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    v8 = objc_msgSend(v9, "cardViewController:dismissPanShouldBegin:cardData:", self, v4, self);

    goto LABEL_6;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BCCardViewController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer"));
  if ((id)v8 == v6)
  {
    v13 = 1;
    v11 = v6;
  }
  else
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController auxiliaryNavigationBarDismissPanGestureRecognizer](self, "auxiliaryNavigationBarDismissPanGestureRecognizer"));

    if (v10 == v6)
    {
      v13 = 1;
      goto LABEL_7;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
    v13 = v11 == v12;

  }
LABEL_7:

  return v13;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
  objc_msgSend(v6, "cardViewController:cardData:scrollViewWillBeginDragging:contentScrollView:", self, self, v4, v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[BCCardViewController settingContentOffset](self, "settingContentOffset"))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetData](self, "cardSetData"));
    if ((objc_msgSend(v5, "isInTransitionUpdateMode") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetData](self, "cardSetData"));
      v4 = objc_msgSend(v6, "covered");

    }
  }
  if ((objc_msgSend(v10, "isDragging") & 1) != 0
    || (objc_msgSend(v10, "isDecelerating") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = !-[BCCardViewController scrollingToTop](self, "scrollingToTop");
  }
  if (((v4 | v7) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
    objc_msgSend(v8, "cardViewController:cardData:scrollViewDidScroll:contentScrollView:", self, self, v10, v9);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
  objc_msgSend(v8, "cardViewController:cardData:scrollViewDidEndDragging:willDecelerate:contentScrollView:", self, self, v6, v4, v7);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
  objc_msgSend(v6, "cardViewController:cardData:scrollViewDidEndDecelerating:contentScrollView:", self, self, v4, v5);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
  objc_msgSend(v11, "cardViewController:cardData:scrollViewWillEndDragging:withVelocity:targetContentOffset:contentScrollView:", self, self, v9, a5, v10, x, y);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardStackViewController](self, "cardStackViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topCardSetViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));

  if (v5 == v6)
    -[BCCardViewController setScrollingToTop:](self, "setScrollingToTop:", 1);

  return v5 == v6;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  -[BCCardViewController setScrollingToTop:](self, "setScrollingToTop:", 0);
}

- (BOOL)bc_isPresentedInCardViewController
{
  return 1;
}

- (BOOL)prefersStatusBarBackgroundHidden
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController _preferredTargetState](self, "_preferredTargetState"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "prefersStatusBarBackgroundHidden");
  else
    v4 = 1;

  return v4;
}

- (id)_preferredTargetState
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  char v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = (char *)objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllerForKey:", UITransitionContextFromViewControllerKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardNavigationController](self, "cardNavigationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllers"));
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if (v11)
    v12 = v5 == (_BYTE *)&dword_0 + 2;
  else
    v12 = 0;
  if (!v12)
  {
    if (v5 == (_BYTE *)&dword_0 + 1)
      v13 = v11;
    else
      v13 = 1;
    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
      v15 = objc_msgSend(v14, "cardsCanExpand");

      if ((v15 & 1) == 0)
      {
        v16 = objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
        goto LABEL_21;
      }
      if (-[BCCardViewController bottomCardWasExpanded](self, "bottomCardWasExpanded"))
      {
        v16 = objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
LABEL_21:
        v19 = (void *)v16;
        goto LABEL_22;
      }
    }
    goto LABEL_14;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  if ((objc_msgSend(v17, "cardsCanExpand") & 1) != 0)
  {
    v18 = -[BCCardViewController expanded](self, "expanded");

    if (!v18)
    {
LABEL_14:
      v19 = 0;
      goto LABEL_22;
    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  if (objc_msgSend(v20, "cardsCanExpand"))
    v21 = objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedState](BCCardSetState, "pushedState"));
  else
    v21 = objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedContractedState](BCCardSetState, "pushedContractedState"));
  v19 = (void *)v21;

LABEL_22:
  return v19;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  BCCardViewController *v33;
  id v34;
  id v35[2];
  char v36;
  _QWORD v37[6];
  id location;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "_stopScrollingAndZoomingAnimations");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController contentScrollView](self, "contentScrollView"));
  objc_msgSend(v11, "_stopScrollingAndZoomingAnimations");

  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
    v13 = objc_msgSend(v12, "count");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
    v16 = objc_msgSend(v15, "containsObject:", v14);

    if (v16)
    {
      v17 = objc_opt_class(UIViewController);
      v18 = BUClassAndProtocolCast(v8, v17, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      -[BCCardViewController _adjustContentInsetForViewController:](self, "_adjustContentInsetForViewController:", v19, &OBJC_PROTOCOL___BCCardContent);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController _preferredTargetState](self, "_preferredTargetState"));
    objc_msgSend(v20, "cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", self, self);
    v22 = v21;
    objc_initWeak(&location, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_CB48;
    v37[3] = &unk_28BA50;
    v37[4] = self;
    v37[5] = v22;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_CB58;
    v31[3] = &unk_28BA78;
    objc_copyWeak(v35, &location);
    v32 = v8;
    v33 = self;
    v23 = v20;
    v36 = v16;
    v34 = v23;
    v35[1] = v13;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v37, v31);

    objc_destroyWeak(v35);
    objc_destroyWeak(&location);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController _preferredTargetState](self, "_preferredTargetState"));
    objc_msgSend(v14, "cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", self, self);
    -[BCCardViewController _setAuxiliaryNavigationBarViewAlpha:](self, "_setAuxiliaryNavigationBarViewAlpha:");
    v24 = objc_opt_class(UIViewController);
    v25 = BUClassAndProtocolCast(v8, v24, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController view](self, "view", &OBJC_PROTOCOL___BCCardContent));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "window"));
    v29 = v28 == 0;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "scrollView"));
    sub_A454((uint64_t)self, v30, v29);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "transitionCoordinator"));
  if (v6)
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
  if (!objc_msgSend(v7, "cardsCanExpand"))
  {

    goto LABEL_6;
  }
  v8 = -[BCCardViewController expanded](self, "expanded");

  if (!v8)
  {
LABEL_6:
    v9 = objc_claimAutoreleasedReturnValue(+[BCCardSetState cardViewControllerContractedState:](BCCardSetState, "cardViewControllerContractedState:", self));
    goto LABEL_7;
  }
  v9 = objc_claimAutoreleasedReturnValue(+[BCCardSetState cardViewControllerExpandedState:](BCCardSetState, "cardViewControllerExpandedState:", self));
LABEL_7:
  v10 = (void *)v9;
  -[BCCardViewController setCurrentState:](self, "setCurrentState:", v9);

  if (!self->_hasNotifiedScrollViewChangeForCurrentContentSV)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);
    objc_msgSend(v11, "cardViewController:contentScrollViewDidChange:cardData:", self, WeakRetained, self);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController currentState](self, "currentState"));
  objc_msgSend(v13, "cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", self, self);
  v15 = v14;

  -[BCCardViewController _setAuxiliaryNavigationBarViewAlpha:](self, "_setAuxiliaryNavigationBarViewAlpha:", v15);
LABEL_10:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "edgePanGestureRecognizer"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "viewControllers"));
    v19 = (unint64_t)objc_msgSend(v18, "count") < 3;

  }
  else
  {
    v19 = 0;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "edgePanGestureRecognizer"));
  objc_msgSend(v21, "setEnabled:", v19);

  v22 = v19 ^ 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "interactivePopGestureRecognizer"));
  objc_msgSend(v23, "setEnabled:", v22);

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BCCardViewController *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  unsigned int v19;
  id v20;
  __objc2_class **v22;
  void *v23;
  id v24;
  void *v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
  v14 = (BCCardViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentCardViewController"));

  if (v14 == self)
  {
    if (a4 != 2
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers")),
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0)),
          v16,
          v15,
          v16 == v11))
    {
      -[BCCardViewController setBottomCardWasExpanded:](self, "setBottomCardWasExpanded:", -[BCCardViewController expanded](self, "expanded"));
      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController configuration](self, "configuration"));
    v19 = objc_msgSend(v18, "cardsCanExpand");

    if (v19)
    {
      if (!-[BCCardViewController bottomCardWasExpanded](self, "bottomCardWasExpanded"))
      {
        if ((v17 & 1) != 0)
        {
          v22 = &off_289EF0;
        }
        else
        {
          if (a4 != 2)
          {
            v20 = 0;
            goto LABEL_17;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
          v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));

          v20 = 0;
          if (v24 != v12)
          {
LABEL_17:
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController"));
            objc_msgSend(v20, "setCardSetViewController:", v25);

            goto LABEL_8;
          }
          v22 = off_289EE8;
        }
        v20 = objc_alloc_init(*v22);
        goto LABEL_17;
      }
    }
  }
  v20 = 0;
LABEL_8:

  return v20;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController cardSetViewController](self, "cardSetViewController", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "percentDrivenInteractiveTransition"));

  return v5;
}

- (BOOL)_navigationControllerShouldCrossFadeNavigationBar:(id)a3
{
  return 0;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  if ((unint64_t)objc_msgSend(v5, "count") > 2)
  {
    v7 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
      v7 = 0;
    else
      v7 = -[BCCardViewController bottomCardWasExpanded](self, "bottomCardWasExpanded");

  }
  return v7;
}

- (void)scrollViewDidChange
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController topContentViewController](self, "topContentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scrollView"));
  -[BCCardViewController setContentScrollView:](self, "setContentScrollView:", v4);

  -[BCCardViewController _updateCardFrames](self, "_updateCardFrames");
}

- (NSString)stringForReturnToRootBarItem
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController presentingViewController](self, "presentingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___BCRootBarStringForReturnToRootBarItemProviding));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bc_stringForReturnToRootBarItem"));
  return (NSString *)v4;
}

- (BOOL)auxiliaryNavigationBarViewControllerCanCloseAsset
{
  BCCardViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardViewController delegate](self, "delegate"));
  LOBYTE(v2) = objc_msgSend(v3, "cardViewControllerCanCloseAsset:", v2);

  return (char)v2;
}

- (void)auxiliaryNavigationBarViewControllerDidTapCloseAllCards
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController delegate](self, "delegate"));
  objc_msgSend(v3, "cardViewControllerDidTapCloseAllCards:", self);

}

- (void)auxiliaryNavigationBarViewControllerDidTapCloseAsset
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController delegate](self, "delegate"));
  objc_msgSend(v3, "cardViewControllerDidTapCloseAsset:", self);

}

- (void)setIsBubbleTipPresented:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (double)rawCurrentCardOffset
{
  return self->_rawCurrentCardOffset;
}

- (void)setRawCurrentCardOffset:(double)a3
{
  self->_rawCurrentCardOffset = a3;
}

- (BOOL)settingContentOffset
{
  return self->_settingContentOffset;
}

- (void)setSettingContentOffset:(BOOL)a3
{
  self->_settingContentOffset = a3;
}

- (BOOL)dismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (double)scrollViewVerticalVelocityWhenDraggingEnded
{
  return self->_scrollViewVerticalVelocityWhenDraggingEnded;
}

- (void)setScrollViewVerticalVelocityWhenDraggingEnded:(double)a3
{
  self->_scrollViewVerticalVelocityWhenDraggingEnded = a3;
}

- (CGPoint)oldContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_oldContentOffset.x;
  y = self->_oldContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOldContentOffset:(CGPoint)a3
{
  self->_oldContentOffset = a3;
}

- (BCCardViewControllerDelegate)delegate
{
  return (BCCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationController)cardNavigationController
{
  return self->_cardNavigationController;
}

- (void)setCardNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_cardNavigationController, a3);
}

- (BOOL)roundedCorners
{
  return self->_roundedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BCCardStackConfiguration)configuration
{
  return (BCCardStackConfiguration *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (void)setConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_configuration, a3);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)contentInsetForContent
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsetForContent.top;
  left = self->_contentInsetForContent.left;
  bottom = self->_contentInsetForContent.bottom;
  right = self->_contentInsetForContent.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsetForContent:(UIEdgeInsets)a3
{
  self->_contentInsetForContent = a3;
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerView, a3);
}

- (double)distanceToExpand
{
  return self->_distanceToExpand;
}

- (void)setDistanceToExpand:(double)a3
{
  self->_distanceToExpand = a3;
}

- (BCCardSetState)currentState
{
  return self->_currentState;
}

- (BCCardSetData)cardSetData
{
  return (BCCardSetData *)objc_loadWeakRetained((id *)&self->_cardSetData);
}

- (void)setCardSetData:(id)a3
{
  objc_storeWeak((id *)&self->_cardSetData, a3);
}

- (int64_t)sideCardAnimationCount
{
  return self->_sideCardAnimationCount;
}

- (void)setSideCardAnimationCount:(int64_t)a3
{
  self->_sideCardAnimationCount = a3;
}

- (BCCardSetNavigationSource)cardSetViewController
{
  return (BCCardSetNavigationSource *)objc_loadWeakRetained((id *)&self->_cardSetViewController);
}

- (void)setCardSetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cardSetViewController, a3);
}

- (UIScrollView)contentScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_contentScrollView);
}

- (Class)navigationControllerClass
{
  return self->_navigationControllerClass;
}

- (void)setNavigationControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_navigationControllerClass, a3);
}

- (UIView)blackScrimView
{
  return self->_blackScrimView;
}

- (void)setBlackScrimView:(id)a3
{
  objc_storeStrong((id *)&self->_blackScrimView, a3);
}

- (UIView)whiteScrimView
{
  return self->_whiteScrimView;
}

- (void)setWhiteScrimView:(id)a3
{
  objc_storeStrong((id *)&self->_whiteScrimView, a3);
}

- (BCCardGripperView)gripperView
{
  return self->_gripperView;
}

- (void)setGripperView:(id)a3
{
  objc_storeStrong((id *)&self->_gripperView, a3);
}

- (CGRect)viewFrameBeforeAnimation
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewFrameBeforeAnimation.origin.x;
  y = self->_viewFrameBeforeAnimation.origin.y;
  width = self->_viewFrameBeforeAnimation.size.width;
  height = self->_viewFrameBeforeAnimation.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setViewFrameBeforeAnimation:(CGRect)a3
{
  self->_viewFrameBeforeAnimation = a3;
}

- (double)extraXOffsetForAnimation
{
  return self->_extraXOffsetForAnimation;
}

- (void)setExtraXOffsetForAnimation:(double)a3
{
  self->_extraXOffsetForAnimation = a3;
}

- (UITapGestureRecognizer)cardTapGestureRecognizer
{
  return self->_cardTapGestureRecognizer;
}

- (void)setCardTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_cardTapGestureRecognizer, a3);
}

- (UIView)glassView
{
  return self->_glassView;
}

- (void)setGlassView:(id)a3
{
  objc_storeStrong((id *)&self->_glassView, a3);
}

- (BOOL)bottomCardWasExpanded
{
  return self->_bottomCardWasExpanded;
}

- (void)setBottomCardWasExpanded:(BOOL)a3
{
  self->_bottomCardWasExpanded = a3;
}

- (BOOL)scrollingToTop
{
  return self->_scrollingToTop;
}

- (void)setScrollingToTop:(BOOL)a3
{
  self->_scrollingToTop = a3;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (void)setDismissPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)auxiliaryNavigationBarDismissPanGestureRecognizer
{
  return self->_auxiliaryNavigationBarDismissPanGestureRecognizer;
}

- (void)setAuxiliaryNavigationBarDismissPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarDismissPanGestureRecognizer, a3);
}

- (NSLayoutConstraint)gripperWidthConstraint
{
  return self->_gripperWidthConstraint;
}

- (void)setGripperWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_gripperWidthConstraint, a3);
}

- (NSLayoutConstraint)gripperHeightConstraint
{
  return self->_gripperHeightConstraint;
}

- (void)setGripperHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_gripperHeightConstraint, a3);
}

- (NSLayoutConstraint)auxiliaryNavigationBarTopConstraint
{
  return self->_auxiliaryNavigationBarTopConstraint;
}

- (void)setAuxiliaryNavigationBarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarTopConstraint, a3);
}

- (BCCardAuxiliaryNavigationBarViewController)auxiliaryNavigationBarViewController
{
  return self->_auxiliaryNavigationBarViewController;
}

- (void)setAuxiliaryNavigationBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarViewController, a3);
}

- (BOOL)uppEnabled
{
  return self->_uppEnabled;
}

- (void)setUppEnabled:(BOOL)a3
{
  self->_uppEnabled = a3;
}

- (BCCardViewControllerViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarViewController, 0);
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_gripperHeightConstraint, 0);
  objc_storeStrong((id *)&self->_gripperWidthConstraint, 0);
  objc_storeStrong((id *)&self->_auxiliaryNavigationBarDismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_glassView, 0);
  objc_storeStrong((id *)&self->_cardTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gripperView, 0);
  objc_storeStrong((id *)&self->_whiteScrimView, 0);
  objc_storeStrong((id *)&self->_blackScrimView, 0);
  objc_storeStrong((id *)&self->_navigationControllerClass, 0);
  objc_destroyWeak((id *)&self->_contentScrollView);
  objc_destroyWeak((id *)&self->_cardSetViewController);
  objc_destroyWeak((id *)&self->_cardSetData);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_storeStrong((id *)&self->_cardNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_rootScrollView, 0);
}

@end
