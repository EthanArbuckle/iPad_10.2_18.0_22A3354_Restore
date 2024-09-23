@implementation WGWidgetListItemViewController

- (WGWidgetListItemViewController)initWithWidgetIdentifier:(id)a3
{
  id v4;
  WGWidgetListItemViewController *v5;
  uint64_t v6;
  NSString *widgetIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListItemViewController;
  v5 = -[WGWidgetListItemViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    widgetIdentifier = v5->_widgetIdentifier;
    v5->_widgetIdentifier = (NSString *)v6;

  }
  return v5;
}

- (WGWidgetPlatterView)platterView
{
  return (WGWidgetPlatterView *)-[WGWidgetListItemViewController _platterViewLoadingIfNecessary:](self, "_platterViewLoadingIfNecessary:", 1);
}

- (CGSize)preferredContentSizeForContentOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WGWidgetListItemViewController _platterViewLoadingIfNecessary:](self, "_platterViewLoadingIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFitsContentWithSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)contentSizeForPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WGWidgetListItemViewController _platterViewLoadingIfNecessary:](self, "_platterViewLoadingIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSizeForSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)loadView
{
  WGWidgetPlatterView *v3;

  v3 = objc_alloc_init(WGWidgetPlatterView);
  -[WGWidgetPlatterView setListItem:](v3, "setListItem:", self);
  -[WGWidgetPlatterView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
  -[WGWidgetListItemViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WGWidgetListItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[WGWidgetListItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)managingContainerWillAppear:(id)a3
{
  id v4;

  v4 = a3;
  -[WGWidgetListItemViewController _addWidgetHostIfNecessary](self, "_addWidgetHostIfNecessary");
  -[WGWidgetHostingViewController managingContainerWillAppear:](self->_widgetHost, "managingContainerWillAppear:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[WGWidgetListItemViewController _addWidgetHostIfNecessary](self, "_addWidgetHostIfNecessary");
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_widgetHost, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[WGWidgetListItemViewController _addWidgetHostIfNecessary](self, "_addWidgetHostIfNecessary");
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_widgetHost, "wg_beginAppearanceTransitionIfNecessary:animated:", 1, v3);
  -[UIViewController wg_endAppearanceTransitionIfNecessary](self->_widgetHost, "wg_endAppearanceTransitionIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[UIViewController wg_beginAppearanceTransitionIfNecessary:animated:](self->_widgetHost, "wg_beginAppearanceTransitionIfNecessary:animated:", 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIViewController wg_endAppearanceTransitionIfNecessary](self->_widgetHost, "wg_endAppearanceTransitionIfNecessary");
}

- (void)managingContainerDidDisappear:(id)a3
{
  -[WGWidgetHostingViewController managingContainerDidDisappear:](self->_widgetHost, "managingContainerDidDisappear:", a3);
}

- (void)removeChildViewController:(id)a3
{
  WGWidgetHostingViewController *v4;
  objc_super v5;

  v4 = (WGWidgetHostingViewController *)a3;
  v5.receiver = self;
  v5.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController removeChildViewController:](&v5, sel_removeChildViewController_, v4);
  if (self->_widgetHost == v4)
  {
    self->_widgetHost = 0;

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[WGWidgetListItemViewController parentViewController](self, "parentViewController", a3, a4.width, a4.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "sizeForChildContentContainer:withParentContainerSize:", self, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  else
    -[WGWidgetListItemViewController preferredContentSize](self, "preferredContentSize");
  -[WGWidgetListItemViewController contentSizeForPreferredContentSize:](self, "contentSizeForPreferredContentSize:");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WGWidgetListItemViewController;
  v4 = a3;
  -[WGWidgetListItemViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[WGWidgetListItemViewController preferredContentSizeForContentOfSize:](self, "preferredContentSizeForContentOfSize:", v6, v8);
  -[WGWidgetListItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  self->_pendingSize.width = width;
  self->_pendingSize.height = height;
  v12.receiver = self;
  v12.super_class = (Class)WGWidgetListItemViewController;
  -[WGWidgetListItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[WGWidgetListItemViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateIntrinsicContentSize");

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__WGWidgetListItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24D7321D8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __85__WGWidgetListItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pendingSize");
  objc_msgSend(WeakRetained, "setPreferredContentSize:");

}

- (BOOL)adjustsFontForContentSizeCategory
{
  void *v2;
  char v3;

  -[WGWidgetListItemViewController platterView](self, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adjustsFontForContentSizeCategory");

  return v3;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WGWidgetListItemViewController platterView](self, "platterView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", v3);

}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  int v4;
  void *v5;

  -[WGWidgetListItemViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adjustForContentSizeCategoryChange");

  if (v4)
  {
    -[WGWidgetListItemViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intrinsicContentSize");
    -[WGWidgetListItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
  return v4;
}

- (id)_platterViewLoadingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if ((-[WGWidgetListItemViewController isViewLoaded](self, "isViewLoaded") & 1) != 0 || v3)
  {
    -[WGWidgetListItemViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_platterViewIfLoaded
{
  return -[WGWidgetListItemViewController _platterViewLoadingIfNecessary:](self, "_platterViewLoadingIfNecessary:", 0);
}

- (void)_addWidgetHostIfNecessary
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_2172E1000, log, OS_LOG_TYPE_ERROR, "%{public}@: failed to obtain widget host with ID '%{public}@'", (uint8_t *)&v4, 0x16u);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGRect v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WGWidgetListItemViewController widgetIdentifier](self, "widgetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" widgetIdentifier:%@;"), v7);

  if (-[WGWidgetListItemViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WGWidgetListItemViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetListItemViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    NSStringFromCGRect(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" view:%@; frame:%@;"), v8, v10);

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(" (view not loaded);"));
  }
  if (self->_widgetHost)
    objc_msgSend(v6, "appendFormat:", CFSTR(" _widgetHost:%@>"), self->_widgetHost);
  else
    objc_msgSend(v6, "appendString:", CFSTR(" (_widgetHost not loaded)>"));
  return (NSString *)v6;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (WGWidgetHostingViewControllerDelegate)delegate
{
  return (WGWidgetHostingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WGWidgetHostingViewController)widgetHost
{
  return self->_widgetHost;
}

- (CGSize)_pendingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pendingSize.width;
  height = self->_pendingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setPendingSize:(CGSize)a3
{
  self->_pendingSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetHost, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

@end
