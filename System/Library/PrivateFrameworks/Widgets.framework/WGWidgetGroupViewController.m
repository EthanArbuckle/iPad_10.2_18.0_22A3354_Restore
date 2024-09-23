@implementation WGWidgetGroupViewController

- (WGWidgetGroupViewController)initWithWidgetDiscoveryController:(id)a3 listSettings:(WGWidgetListSettings)a4
{
  uint64_t v4;
  unint64_t carouselEdges;
  id v8;
  WGWidgetGroupViewController *v9;
  WGWidgetGroupViewController *v10;
  id *p_discoveryController;
  void *v12;
  objc_super v14;

  v4 = *(_QWORD *)&a4.useFavorites;
  carouselEdges = a4.carouselEdges;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WGWidgetGroupViewController;
  v9 = -[WGWidgetGroupViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    p_discoveryController = (id *)&v9->_discoveryController;
    objc_storeStrong((id *)&v9->_discoveryController, a3);
    objc_msgSend(*p_discoveryController, "addDiscoveryObserver:", v10);
    objc_msgSend(*p_discoveryController, "setDebuggingHandler:", v10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_editViewWillAppear_, CFSTR("WGWidgetListEditViewControllerWillAppear"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_editViewDidAppear_, CFSTR("WGWidgetListEditViewControllerDidAppear"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_editViewWillDisappear_, CFSTR("WGWidgetListEditViewControllerWillDisappear"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_editViewDidDisappear_, CFSTR("WGWidgetListEditViewControllerDidDisappear"), 0);
    v10->_listSettings.carouselEdges = carouselEdges;
    *(_QWORD *)&v10->_listSettings.useFavorites = v4;

  }
  return v10;
}

- (id)_scrollViewForListViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WGWidgetGroupViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  objc_msgSend(v4, "loadViewIfNeeded");
  objc_msgSend(v4, "widgetListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIScrollView)majorScrollView
{
  return (UIScrollView *)-[WGWidgetGroupViewController _scrollViewForListViewController:](self, "_scrollViewForListViewController:", self->_majorColumnListViewController);
}

- (unint64_t)widgetCount
{
  return self->_lastWidgetCount;
}

- (void)setShouldBlurContent:(BOOL)a3
{
  if (self->_shouldBlurContent != a3)
  {
    self->_shouldBlurContent = a3;
    -[WGMajorListViewController setShouldBlurContent:](self->_majorColumnListViewController, "setShouldBlurContent:");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  WGCarouselListViewController *majorColumnListViewController;
  id v5;
  void *v6;
  UILabel *debugLabel;
  id v8;

  majorColumnListViewController = self->_majorColumnListViewController;
  v5 = a3;
  -[WGMajorListViewController footerView](majorColumnListViewController, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLegibilitySettings:", v5);

  debugLabel = self->_debugLabel;
  objc_msgSend(v5, "primaryColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setTextColor:](debugLabel, "setTextColor:", v8);
}

- (void)setHeaderContentViewController:(id)a3
{
  -[WGMajorListViewController setHeaderContentViewController:](self->_majorColumnListViewController, "setHeaderContentViewController:", a3);
}

- (UIViewController)headerContentViewController
{
  return -[WGMajorListViewController headerContentViewController](self->_majorColumnListViewController, "headerContentViewController");
}

- (BOOL)isHeaderVisible
{
  return -[WGMajorListViewController isHeaderVisible](self->_majorColumnListViewController, "isHeaderVisible");
}

- (UIControl)editButton
{
  return -[WGWidgetListViewController editButton](self->_majorColumnListViewController, "editButton");
}

- (BOOL)isEditingIcons
{
  return -[WGWidgetListViewController isEditingIcons](self->_majorColumnListViewController, "isEditingIcons");
}

- (void)setEditingIcons:(BOOL)a3
{
  -[WGCarouselListViewController setEditingIcons:](self->_majorColumnListViewController, "setEditingIcons:", a3);
}

- (void)setListSettings:(WGWidgetListSettings)a3
{
  self->_listSettings = a3;
  -[WGCarouselListViewController setListSettings:](self->_majorColumnListViewController, "setListSettings:");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[WGWidgetGroupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetGroupViewController _loadWidgetListViewController](self, "_loadWidgetListViewController");
  -[WGCarouselListViewController view](self->_majorColumnListViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v4);
  -[WGCarouselListViewController setContainerView:](self->_majorColumnListViewController, "setContainerView:", v3);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  WGCarouselListViewController *majorColumnListViewController;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  -[WGCarouselListViewController view](self->_majorColumnListViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[WGWidgetGroupViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v5);

    majorColumnListViewController = self->_majorColumnListViewController;
    -[WGWidgetGroupViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGCarouselListViewController setContainerView:](majorColumnListViewController, "setContainerView:", v9);

  }
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_majorColumnListViewController, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, v3);
  -[UILabel setText:](self->_debugLabel, "setText:", CFSTR("Appearing"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WGWidgetGroupViewController location](self, "location");
  -[WGWidgetDiscoveryController enabledWidgetIdentifiersForAllGroups](self->_discoveryController, "enabledWidgetIdentifiersForAllGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController disabledWidgetIdentifiers](self->_discoveryController, "disabledWidgetIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetListDidAppearAtLocation:withEnabledWidgets:disabledWidgets:", v5, v6, v7);

  -[UIViewController wg_endAppearanceTransitionIfNecessary](self->_majorColumnListViewController, "wg_endAppearanceTransitionIfNecessary");
  -[UILabel setText:](self->_debugLabel, "setText:", CFSTR("Appeared"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_majorColumnListViewController, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, v3);
  -[UILabel setText:](self->_debugLabel, "setText:", CFSTR("Disappearing"));
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WGWidgetGroupViewController;
  -[WGWidgetGroupViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[UIViewController wg_endAppearanceTransitionIfNecessary](self->_majorColumnListViewController, "wg_endAppearanceTransitionIfNecessary");
  -[WGCarouselListViewController presentedViewController](self->_majorColumnListViewController, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController presentedEditViewController](self->_discoveryController, "presentedEditViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[WGWidgetDiscoveryController dismissWidgetListEditViewControllerAnimated:completion:](self->_discoveryController, "dismissWidgetListEditViewControllerAnimated:completion:", 0, 0);
  +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetListDidDisappearAtLocation:", -[WGWidgetGroupViewController location](self, "location"));

  -[UILabel setText:](self->_debugLabel, "setText:", CFSTR("Disappeared"));
}

- (NSArray)extraViewsContainers
{
  return -[WGMajorListViewController extraViewsContainers](self->_majorColumnListViewController, "extraViewsContainers");
}

- (NSArray)extraViews
{
  return (NSArray *)-[WGCarouselListViewController extraViews](self->_majorColumnListViewController, "extraViews");
}

- (BOOL)shouldAnimateLastTwoViewsAsOne
{
  return -[WGMajorListViewController shouldAnimateLastTwoViewsAsOne](self->_majorColumnListViewController, "shouldAnimateLastTwoViewsAsOne");
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  return -[WGCarouselListViewController shouldAnimateFirstTwoViewsAsOne](self->_majorColumnListViewController, "shouldAnimateFirstTwoViewsAsOne");
}

- (int64_t)_layoutModeForSize:(CGSize)a3
{
  return objc_msgSend((id)objc_opt_class(), "layoutModeForSize:", a3.width, a3.height);
}

- (int64_t)_activeLayoutMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  int64_t v8;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!-[WGWidgetGroupViewController isViewLoaded](self, "isViewLoaded"))
    return 2 * ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  -[WGWidgetGroupViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = -[WGWidgetGroupViewController _layoutModeForSize:](self, "_layoutModeForSize:", v6, v7);

  return v8;
}

- (void)_loadWidgetListViewController
{
  WGCarouselListViewController *v3;
  WGCarouselListViewController *majorColumnListViewController;

  v3 = -[WGCarouselListViewController initWithWidgetDiscoveryController:listSettings:]([WGCarouselListViewController alloc], "initWithWidgetDiscoveryController:listSettings:", self->_discoveryController, self->_listSettings.carouselEdges, *(_QWORD *)&self->_listSettings.useFavorites);
  majorColumnListViewController = self->_majorColumnListViewController;
  self->_majorColumnListViewController = v3;

  -[WGWidgetListViewController setDelegate:](self->_majorColumnListViewController, "setDelegate:", self);
  -[WGMajorListViewController setShouldBlurContent:](self->_majorColumnListViewController, "setShouldBlurContent:", -[WGWidgetGroupViewController shouldBlurContent](self, "shouldBlurContent"));
  -[WGWidgetListViewController setShouldIncludeScrollView:](self->_majorColumnListViewController, "setShouldIncludeScrollView:", 1);
  -[WGWidgetGroupViewController addChildViewController:](self, "addChildViewController:", self->_majorColumnListViewController);
  -[WGCarouselListViewController didMoveToParentViewController:](self->_majorColumnListViewController, "didMoveToParentViewController:", self);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)editViewWillAppear:(id)a3
{
  -[WGCarouselListViewController beginAppearanceTransition:animated:](self->_majorColumnListViewController, "beginAppearanceTransition:animated:", 0, 1);
}

- (void)editViewDidAppear:(id)a3
{
  -[WGCarouselListViewController endAppearanceTransition](self->_majorColumnListViewController, "endAppearanceTransition", a3);
}

- (void)editViewWillDisappear:(id)a3
{
  if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared", a3))
    -[WGCarouselListViewController beginAppearanceTransition:animated:](self->_majorColumnListViewController, "beginAppearanceTransition:animated:", 1, 1);
}

- (void)editViewDidDisappear:(id)a3
{
  if (-[WGWidgetGroupViewController _appearState](self, "_appearState", a3) == 2)
    -[WGCarouselListViewController endAppearanceTransition](self->_majorColumnListViewController, "endAppearanceTransition");
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidScroll_, v5);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewWillBeginDragging_, v5);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id WeakRetained;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, a5, x, y);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;

  v4 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidEndDragging:willDecelerate:", v7, v4);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewWillBeginDecelerating_, v5);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidEndDecelerating_, v5);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidEndScrollingAnimation_, v5);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "scrollViewShouldScrollToTop:", v4);
  else
    v6 = 1;

  return v6;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "performSelector:withObject:", sel_scrollViewDidScrollToTop_, v5);

}

- (void)majorListViewControllerDidChangeHeaderVisibility:(id)a3
{
  id v4;

  -[WGWidgetGroupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "widgetGroupViewControllerDidChangeHeaderVisibility:", self);

}

- (CGSize)widgetListViewController:(id)a3 sizeForInterfaceOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  objc_msgSend(a3, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "bounds");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v9 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "widgetGroupViewController:sizeForInterfaceOrientation:", self, a4);
    v9 = v13;
    v11 = v14;
  }

  v15 = v9;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)widgetListViewController:(id)a3 contentOccludingInsetsForInterfaceOrientation:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  -[WGWidgetGroupViewController contentOccludingInset](self, "contentOccludingInset", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "widgetGroupViewController:contentOccludingInsetsForInterfaceOrientation:", self, a4);
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;
  }

  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (BOOL)isWidgetExtensionVisible:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[WGWidgetGroupViewController _appearState](self, "_appearState"))
    v5 = -[WGWidgetListViewController isWidgetExtensionVisible:](self->_majorColumnListViewController, "isWidgetExtensionVisible:", v4);
  else
    v5 = 0;

  return v5;
}

- (WGWidgetGroupViewControllerDelegate)delegate
{
  return (WGWidgetGroupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (BOOL)shouldBlurContent
{
  return self->_shouldBlurContent;
}

- (UIEdgeInsets)contentOccludingInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentOccludingInset.top;
  left = self->_contentOccludingInset.left;
  bottom = self->_contentOccludingInset.bottom;
  right = self->_contentOccludingInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentOccludingInset:(UIEdgeInsets)a3
{
  self->_contentOccludingInset = a3;
}

- (WGWidgetListSettings)listSettings
{
  WGWidgetListSettings *p_listSettings;
  unint64_t carouselEdges;
  uint64_t v4;
  WGWidgetListSettings result;

  p_listSettings = &self->_listSettings;
  carouselEdges = self->_listSettings.carouselEdges;
  v4 = *(_QWORD *)&p_listSettings->useFavorites;
  result.useFavorites = v4;
  result.carouselIgnoresHeader = BYTE1(v4);
  result.pinned = BYTE2(v4);
  result.carouselEdges = carouselEdges;
  return result;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_majorColumnListViewController, 0);
  objc_storeStrong((id *)&self->_discoveryController, 0);
}

- (void)makeVisibleWidgetWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  WGCarouselListViewController *v7;
  WGCarouselListViewController *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v9, "length"))
  {
    v7 = self->_majorColumnListViewController;
    v8 = v7;
    if (v7)
    {
      -[WGWidgetListViewController makeVisibleWidgetWithIdentifier:completion:](v7, "makeVisibleWidgetWithIdentifier:completion:", v9, v6);
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)presentEditViewWithCompletion:(id)a3
{
  id v4;
  WGWidgetDiscoveryController *discoveryController;
  WGCarouselListViewController *majorColumnListViewController;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  discoveryController = self->_discoveryController;
  majorColumnListViewController = self->_majorColumnListViewController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__WGWidgetGroupViewController_PPTTest__presentEditViewWithCompletion___block_invoke;
  v8[3] = &unk_24D731E40;
  v9 = v4;
  v7 = v4;
  -[WGWidgetDiscoveryController presentWidgetListEditViewControllerFromViewController:animated:completion:](discoveryController, "presentWidgetListEditViewControllerFromViewController:animated:completion:", majorColumnListViewController, 1, v8);

}

uint64_t __70__WGWidgetGroupViewController_PPTTest__presentEditViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
