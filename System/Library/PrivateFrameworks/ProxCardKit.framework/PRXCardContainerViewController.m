@implementation PRXCardContainerViewController

- (id)initAsSingleCardWithContentViewController:(id)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4 configuration:(id)a5
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  id v12;
  id v13;
  PRXCardContainerViewController *v14;
  PRXCardContainerViewController *v15;
  objc_super v17;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v12 = a3;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PRXCardContainerViewController;
  v14 = -[PRXCardContainerViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a5);
    objc_storeStrong((id *)&v15->_contentViewController, a3);
    v15->_containerLayoutMargins.top = top;
    v15->_containerLayoutMargins.leading = leading;
    v15->_containerLayoutMargins.bottom = bottom;
    v15->_containerLayoutMargins.trailing = trailing;
    v15->_legacyCard = 1;
    -[PRXCardContainerViewController _commonInit](v15, "_commonInit");
  }

  return v15;
}

- (PRXCardContainerViewController)initWithConfiguration:(id)a3
{
  id v5;
  PRXCardContainerViewController *v6;
  PRXCardContainerViewController *v7;
  PRXNavigationController *v8;
  UINavigationController *mainNavigationController;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRXCardContainerViewController;
  v6 = -[PRXCardContainerViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_alloc_init(PRXNavigationController);
    mainNavigationController = v7->_mainNavigationController;
    v7->_mainNavigationController = &v8->super;

    -[UINavigationController setDelegate:](v7->_mainNavigationController, "setDelegate:", v7);
    -[UINavigationController setNavigationBarHidden:](v7->_mainNavigationController, "setNavigationBarHidden:", 1);
    objc_storeStrong((id *)&v7->_contentViewController, v7->_mainNavigationController);
    v7->_containerLayoutMargins.top = PRXCardContainerDefaultLayoutMargins();
    v7->_containerLayoutMargins.leading = v10;
    v7->_containerLayoutMargins.bottom = v11;
    v7->_containerLayoutMargins.trailing = v12;
    v7->_legacyCard = 0;
    -[PRXCardContainerViewController _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (PRXCardContainerViewController)init
{
  void *v3;
  PRXCardContainerViewController *v4;

  +[PRXFlowConfiguration defaultConfiguration](PRXFlowConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRXCardContainerViewController initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (PRXCardContainerViewController)initWithCoder:(id)a3
{
  void *v4;
  PRXCardContainerViewController *v5;

  +[PRXFlowConfiguration defaultConfiguration](PRXFlowConfiguration, "defaultConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRXCardContainerViewController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (void)_commonInit
{
  PRXTransitioningController *v3;
  PRXTransitioningController *transitionController;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[PRXCardContainerViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
  v3 = -[PRXTransitioningController initWithPullDismissalProvider:]([PRXTransitioningController alloc], "initWithPullDismissalProvider:", self);
  transitionController = self->_transitionController;
  self->_transitionController = v3;

  -[PRXCardContainerViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self->_transitionController);
  -[PRXCardContainerViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsDarkMode");

  if ((v6 & 1) == 0)
    -[PRXCardContainerViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);
  -[PRXCardContainerViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "overrideInterfaceStyle");

  if (v8)
  {
    -[PRXCardContainerViewController configuration](self, "configuration");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PRXCardContainerViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v9, "overrideInterfaceStyle"));

  }
}

- (void)loadView
{
  PRXCardContainerView *v3;
  uint64_t v4;
  PRXCardContainerView *v5;
  PRXCardContainerView *container;
  void *v7;

  v3 = [PRXCardContainerView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "bounds");
  v5 = -[PRXCardContainerView initWithFrame:containerLayoutMargins:](v3, "initWithFrame:containerLayoutMargins:");
  container = self->_container;
  self->_container = v5;

  -[PRXCardContainerView setAutoresizingMask:](self->_container, "setAutoresizingMask:", 18);
  -[PRXCardContainerView setDelegate:](self->_container, "setDelegate:", self);
  -[PRXCardContainerViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "supportsDarkMode");

  if ((v4 & 1) == 0)
    -[PRXCardContainerView setAccessibilityIgnoresInvertColors:](self->_container, "setAccessibilityIgnoresInvertColors:", 1);
  -[PRXCardContainerViewController setView:](self, "setView:", self->_container);
}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 1);
}

- (void)viewDidLoad
{
  PRXPullDismissalInteractionDriver *v3;
  void *v4;
  PRXPullDismissalInteractionDriver *v5;
  PRXPullDismissalInteractionDriver *pullDismissalInteractionDriver;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRXCardContainerViewController;
  -[PRXCardContainerViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PRXCardContainerViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  v3 = [PRXPullDismissalInteractionDriver alloc];
  -[PRXCardContainerView pullDismissalScrollView](self->_container, "pullDismissalScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRXPullDismissalInteractionDriver initWithPresentedViewController:scrollView:](v3, "initWithPresentedViewController:scrollView:", self, v4);
  pullDismissalInteractionDriver = self->_pullDismissalInteractionDriver;
  self->_pullDismissalInteractionDriver = v5;

  -[PRXCardContainerViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[UIViewController view](self->_contentViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContainerView contentContainerView](self->_container, "contentContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v8, "addSubview:", v7);
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  -[PRXCardContainerView bounds](self->_container, "bounds");
  -[PRXCardContainerViewController _updateCardSizeClassForContainerSize:](self, "_updateCardSizeClassForContainerSize:", v9, v10);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIViewController *contentViewController;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PRXCardContainerViewController;
  -[PRXCardContainerViewController viewDidLayoutSubviews](&v26, sel_viewDidLayoutSubviews);
  if (self->_legacyCard)
  {
    -[UIViewController view](self->_contentViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;

    contentViewController = self->_contentViewController;
    -[PRXCardContainerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[PRXCardContainerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", contentViewController, v10, v11);
    v13 = v12;
    v15 = v14;

    -[UIViewController view](self->_contentViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v5, v7, v13, v15);
  }
  else
  {
    -[PRXCardContainerView contentContainerView](self->_container, "contentContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[UIViewController view](self->_contentViewController, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v5;
  UIViewController *contentViewController;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIViewController *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  PRXFlowDelegate **p_flowDelegate;
  id WeakRetained;
  id v25;
  objc_super v26;

  v3 = a3;
  -[UINavigationController topViewController](self->_mainNavigationController, "topViewController");
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  contentViewController = v5;
  if (!v5)
    contentViewController = self->_contentViewController;
  -[PRXCardContainerView bounds](self->_container, "bounds");
  -[PRXCardContainerViewController _updatePreferredContentSizeForViewController:containerSize:](self, "_updatePreferredContentSizeForViewController:containerSize:", contentViewController, v7, v8);

  -[UIViewController view](self->_contentViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  v14 = self->_contentViewController;
  -[PRXCardContainerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  -[PRXCardContainerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v14, v16, v17);
  v19 = v18;
  v21 = v20;

  -[UIViewController view](self->_contentViewController, "view");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v22, "setFrame:", v11, v13, v19, v21);

  -[PRXCardContainerViewController _updateContainerPreferredContentSize](self, "_updateContainerPreferredContentSize");
  v26.receiver = self;
  v26.super_class = (Class)PRXCardContainerViewController;
  -[PRXCardContainerViewController viewWillAppear:](&v26, sel_viewWillAppear_, v3);
  p_flowDelegate = &self->_flowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_flowDelegate);
  LOBYTE(v22) = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v25 = objc_loadWeakRetained((id *)p_flowDelegate);
    objc_msgSend(v25, "proxCardFlowWillPresent");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  PRXFlowDelegate **p_flowDelegate;
  id WeakRetained;
  char v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRXCardContainerViewController;
  -[PRXCardContainerViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  p_flowDelegate = &self->_flowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_flowDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_flowDelegate);
    objc_msgSend(v7, "proxCardFlowDidDismiss");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  UIViewController *v8;
  UIViewController *contentViewController;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PRXCardContainerViewController _updateCardSizeClassForContainerSize:](self, "_updateCardSizeClassForContainerSize:", width, height);
  -[UINavigationController topViewController](self->_mainNavigationController, "topViewController");
  v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  contentViewController = v8;
  if (!v8)
    contentViewController = self->_contentViewController;
  -[PRXCardContainerViewController _updatePreferredContentSizeForViewController:containerSize:](self, "_updatePreferredContentSizeForViewController:containerSize:", contentViewController, width, height);

  -[PRXCardContainerViewController _updateContainerPreferredContentSize](self, "_updateContainerPreferredContentSize");
  v10.receiver = self;
  v10.super_class = (Class)PRXCardContainerViewController;
  -[PRXCardContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PRXCardContainerViewController _maximumCardSizeForContainerSize:](self, "_maximumCardSizeForContainerSize:", a3, a4.width, a4.height);
  v6 = v5;
  v8 = v7;
  -[PRXCardContainerView preferredContentSize](self->_container, "preferredContentSize");
  if (v6 < v9)
    v9 = v6;
  if (v8 < v10)
    v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_maximumCardSizeForContainerSize:(CGSize)a3
{
  double height;
  double width;
  NSDirectionalEdgeInsets *p_containerLayoutMargins;
  double trailing;
  double bottom;
  double leading;
  _BOOL4 v9;
  double *p_top;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  p_containerLayoutMargins = &self->_containerLayoutMargins;
  bottom = self->_containerLayoutMargins.bottom;
  trailing = self->_containerLayoutMargins.trailing;
  leading = self->_containerLayoutMargins.leading;
  v9 = PRXIsPad();
  if (height <= width || v9)
    p_top = &p_containerLayoutMargins->top;
  else
    p_top = (double *)&PRXCardContainerTopLayoutMarginPortraitPhone;
  v12 = width - (leading + trailing);
  v13 = height - bottom - *p_top;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  UIViewController *v4;
  UIViewController *contentViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRXCardContainerViewController;
  v4 = (UIViewController *)a3;
  -[PRXCardContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v6, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  contentViewController = self->_contentViewController;

  if (contentViewController == v4)
    -[PRXCardContainerViewController _updateContainerPreferredContentSize](self, "_updateContainerPreferredContentSize", v6.receiver, v6.super_class);
}

- (int64_t)_cardStyleForContentContainer:(id)a3
{
  UINavigationController *v4;
  UINavigationController *v5;
  UINavigationController *mainNavigationController;
  void *v7;
  int64_t v8;

  v4 = (UINavigationController *)a3;
  v5 = v4;
  mainNavigationController = self->_mainNavigationController;
  v7 = v4;
  if (mainNavigationController == v4)
  {
    -[UINavigationController topViewController](v4, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "cardStyle");
  else
    v8 = 0;

  return v8;
}

- (void)_updateCardSizeClassForContainerSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  _BOOL8 v17;
  _QWORD v18[3];

  height = a3.height;
  width = a3.width;
  v18[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6F30], "prx_traitCollectionWithCardSizeClass:", PRXCardPreferredSizeClassForContainerBounds(0.0, 0.0, a3.width, a3.height));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContainerViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDF6F30];
    -[PRXCardContainerViewController configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "customBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prx_traitCollectionWithCustomBackgroundColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDF6F30];
    v18[0] = v6;
    v18[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollectionWithTraitsFromCollections:", v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v6;
  }
  -[PRXCardContainerViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v15, self->_contentViewController);
  v16 = !PRXIsPad();
  v17 = height > width && v16;
  -[PRXCardContainerView setUsePortraitTopInset:](self->_container, "setUsePortraitTopInset:", v17);

}

- (void)_updatePreferredContentSizeForViewController:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = -[PRXCardContainerViewController _cardStyleForContentContainer:](self, "_cardStyleForContentContainer:", v11);
    -[UIViewController traitCollection](self->_contentViewController, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PRXCardPreferredSize(v7, objc_msgSend(v8, "prx_cardSizeClass"));

    -[PRXCardContainerViewController _maximumCardSizeForContainerSize:](self, "_maximumCardSizeForContainerSize:", width, height);
    if (v9 < v10)
      v10 = v9;
    objc_msgSend(v11, "updatePreferredContentSizeForCardWidth:", v10);
  }

}

- (void)_updateContainerPreferredContentSize
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[PRXCardContainerViewController _cardStyleForContentContainer:](self, "_cardStyleForContentContainer:", self->_contentViewController);
  -[UIViewController traitCollection](self->_contentViewController, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PRXCardPreferredSize(v3, objc_msgSend(v4, "prx_cardSizeClass"));
  v7 = v6;

  -[UIViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
  if (v7 >= v8)
    v8 = v7;
  -[PRXCardContainerView setPreferredContentSize:](self->_container, "setPreferredContentSize:", v5, v8);
}

- (BOOL)_shouldLayoutViewControllerBeforeCalculatingSize:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v8 = objc_opt_isKindOfClass();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  char v3;

  -[UINavigationController topViewController](self->_mainNavigationController, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowWhileLocked");

  return v3;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v7;
  PRXCrossDissolveTransition *v8;
  void *v9;
  double v10;
  double v11;
  int64_t v12;
  _QWORD v14[5];

  v7 = a6;
  v8 = objc_alloc_init(PRXCrossDissolveTransition);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __123__PRXCardContainerViewController_navigationController_animationControllerForOperation_fromViewController_toViewController___block_invoke;
  v14[3] = &unk_24CC31DB8;
  v14[4] = self;
  -[PRXCrossDissolveTransition setAdditionalAnimations:](v8, "setAdditionalAnimations:", v14);
  -[PRXCardContainerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[PRXCardContainerViewController _maximumCardSizeForContainerSize:](self, "_maximumCardSizeForContainerSize:", v10, v11);
  -[PRXCrossDissolveTransition setMaxSize:](v8, "setMaxSize:");

  v12 = -[PRXCardContainerViewController _cardStyleForContentContainer:](self, "_cardStyleForContentContainer:", v7);
  -[PRXCrossDissolveTransition setCardStyle:](v8, "setCardStyle:", v12);
  return v8;
}

void __123__PRXCardContainerViewController_navigationController_animationControllerForOperation_fromViewController_toViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setDefersKeyboardUpdates:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "contentContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
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
  id v26;

  v5 = a5;
  v26 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "allowsPullToDismiss");
  else
    v9 = 0;
  -[PRXCardContainerView pullDismissalScrollView](self->_container, "pullDismissalScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsPullToDismiss:", v9);

  if ((-[PRXCardContainerViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    -[PRXCardContainerView bounds](self->_container, "bounds");
    -[PRXCardContainerViewController _updatePreferredContentSizeForViewController:containerSize:](self, "_updatePreferredContentSizeForViewController:containerSize:", v8, v11, v12);
    objc_msgSend(v8, "preferredContentSize");
    objc_msgSend(v26, "setPreferredContentSize:");
  }
  if (v5)
  {
    -[PRXCardContainerView setDefersKeyboardUpdates:](self->_container, "setDefersKeyboardUpdates:", 1);
    -[PRXCardContainerViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(v26, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;

    -[PRXCardContainerViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    -[PRXCardContainerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v26, v20, v21);
    v23 = v22;
    v25 = v24;

    objc_msgSend(v26, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v16, v18, v23, v25);
  }

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[PRXCardContainerViewController didShowViewController](self, "didShowViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PRXCardContainerViewController didShowViewController](self, "didShowViewController");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)backgroundTapped:(id)a3
{
  id v3;

  -[PRXCardContainerViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (PRXPullDismissalInteractionDriver)pullDismissalInteractionDriver
{
  return self->_pullDismissalInteractionDriver;
}

- (PRXFlowConfiguration)configuration
{
  return self->_configuration;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UINavigationController)mainNavigationController
{
  return self->_mainNavigationController;
}

- (PRXFlowDelegate)flowDelegate
{
  return (PRXFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (id)didShowViewController
{
  return self->_didShowViewController;
}

- (void)setDidShowViewController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didShowViewController, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pullDismissalInteractionDriver, 0);
  objc_storeStrong((id *)&self->_mainNavigationController, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

@end
