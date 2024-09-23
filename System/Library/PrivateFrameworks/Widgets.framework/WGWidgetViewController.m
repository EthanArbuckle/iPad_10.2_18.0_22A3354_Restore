@implementation WGWidgetViewController

- (WGWidgetViewController)initWithWidgetInfo:(id)a3
{
  id v4;
  WGWidgetViewController *v5;
  WGWidgetHostingViewController *v6;
  WGWidgetHostingViewController *widgetHost;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetViewController;
  v5 = -[WGWidgetViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[WGWidgetHostingViewController initWithWidgetInfo:delegate:host:]([WGWidgetHostingViewController alloc], "initWithWidgetInfo:delegate:host:", v4, v5, v5);
    widgetHost = v5->_widgetHost;
    v5->_widgetHost = v6;

    -[WGWidgetViewController addChildViewController:](v5, "addChildViewController:", v5->_widgetHost);
    -[WGWidgetHostingViewController didMoveToParentViewController:](v5->_widgetHost, "didMoveToParentViewController:", v5);
  }

  return v5;
}

- (void)loadView
{
  WGWidgetPlatterView *v3;
  void *v4;
  void *v5;
  void *v6;
  WGWidgetPlatterView *v7;

  v3 = [WGWidgetPlatterView alloc];
  v7 = -[WGWidgetPlatterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[WGWidgetPlatterView setBackgroundHidden:](v7, "setBackgroundHidden:", 1);
  -[WGWidgetPlatterView _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:", 0.0);
  -[WGWidgetPlatterView setButtonMode:](v7, "setButtonMode:", 1);
  if (self->_widgetHost)
  {
    -[WGWidgetPlatterView setWidgetHost:](v7, "setWidgetHost:");
    -[WGWidgetHostingViewController widgetInfo](self->_widgetHost, "widgetInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetPlatterView setAddWidgetButtonVisible:](v7, "setAddWidgetButtonVisible:", objc_msgSend(v5, "optedIn") ^ 1);

    -[WGWidgetPlatterView addWidgetButton](v7, "addWidgetButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__addWidgetButtonTapped_, 64);

  }
  -[WGWidgetViewController setView:](self, "setView:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WGWidgetViewController;
  -[WGWidgetViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  v4 = 1.0;
  if (!-[WGWidgetHostingViewController isRemoteViewVisible](self->_widgetHost, "isRemoteViewVisible"))
  {
    if (-[WGWidgetHostingViewController isSnapshotLoaded](self->_widgetHost, "isSnapshotLoaded"))
      v4 = 1.0;
    else
      v4 = 0.0;
  }
  -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v4);

  +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController widgetIdentifier](self->_widgetHost, "widgetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetViewDidAppearWithWidget:", v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGWidgetViewController;
  -[WGWidgetViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetHostingViewController widgetIdentifier](self->_widgetHost, "widgetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetViewDidDisappearWithWidget:", v7);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)WGWidgetViewController;
  -[WGWidgetViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v19, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "requiredVisualStyleCategories", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "integerValue");
          -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "visualStylingProviderForCategory:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setVisualStylingProvider:forCategory:", v14, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

  }
}

- (UITraitCollection)requestedTraitCollectionOverride
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  -[WGWidgetViewController widgetHost](self, "widgetHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v3, CFSTR("13.0"));

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UITraitCollection *)v5;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  objc_msgSend(v5, "preferredContentSize");
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  -[WGWidgetViewController maxSizeForWidget:forDisplayMode:](self, "maxSizeForWidget:forDisplayMode:", v8, 0);
  v10 = v9;

  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v3;

  if (self->_widgetHost == a3)
  {
    -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateIntrinsicContentSize");

  }
}

- (id)_platterViewLoadingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if ((-[WGWidgetViewController isViewLoaded](self, "isViewLoaded") & 1) != 0 || v3)
  {
    -[WGWidgetViewController view](self, "view");
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
  return -[WGWidgetViewController _platterViewLoadingIfNecessary:](self, "_platterViewLoadingIfNecessary:", 0);
}

- (void)_addWidgetButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("WGWidgetViewControllerAddRequestBundleIdentifierKey");
  -[WGWidgetHostingViewController widgetIdentifier](self->_widgetHost, "widgetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WGWidgetViewControllerAddRequestNotification"), self, v6);

}

- (CGSize)maxSizeForWidget:(id)a3 forDisplayMode:(int64_t)a4
{
  void *v4;
  void *v5;
  CGFloat Width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    Width = CGRectGetWidth(v12);
  }
  else
  {
    Width = 0.0;
  }
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode](WGWidgetInfo, "maximumContentHeightForCompactDisplayMode");
  v8 = v7;

  v9 = Width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)registerWidgetForRefreshEvents:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widgetViewControllerNeedsToBeRegisteredForRefreshNotification:", self);

}

- (void)unregisterWidgetForRefreshEvents:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widgetViewControllerNeedsToBeUnregisteredForRefreshNotification:", self);

}

- (void)remoteViewControllerDidConnectForWidget:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteViewControllerDidConnectForWidgetViewController:", self);

}

- (void)remoteViewControllerViewDidAppearForWidget:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;

  if (-[UIViewController wg_isAppearingOrAppeared](self, "wg_isAppearingOrAppeared", a3))
  {
    -[WGWidgetViewController _platterViewIfLoaded](self, "_platterViewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alpha");
      v8 = v7;

      if (v8 == 0.0)
      {
        v9 = (void *)MEMORY[0x24BDF6F90];
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __69__WGWidgetViewController_remoteViewControllerViewDidAppearForWidget___block_invoke;
        v11[3] = &unk_24D7314D8;
        v12 = v5;
        objc_msgSend(v9, "animateWithDuration:animations:", v11, 0.25);

      }
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteViewControllerViewDidAppearForWidgetViewController:", self);

}

void __69__WGWidgetViewController_remoteViewControllerViewDidAppearForWidget___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (int64_t)userSpecifiedDisplayModeForWidget:(id)a3
{
  return 0;
}

- (int64_t)largestAvailableDisplayModeForWidget:(id)a3
{
  return 0;
}

- (void)widget:(id)a3 didRemoveSnapshotAtURL:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("WGWidgetViewControllerRemovedSnapshotWidgetIdentifierKey");
  objc_msgSend(v8, "widgetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = CFSTR("WGWidgetViewControllerRemovedSnapshotURLKey");
  v13[0] = v10;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WGWidgetViewControllerDidRemoveSnapshotNotification"), self, v11);
}

- (BOOL)isWidgetExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[WGWidgetViewController _appearState](self, "_appearState"))
  {
    -[WGWidgetHostingViewController widgetIdentifier](self->_widgetHost, "widgetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WGWidgetViewControllerDelegate)delegate
{
  return (WGWidgetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WGWidgetHostingViewController)widgetHost
{
  return self->_widgetHost;
}

- (void)setWidgetHost:(id)a3
{
  objc_storeStrong((id *)&self->_widgetHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetHost, 0);
}

@end
