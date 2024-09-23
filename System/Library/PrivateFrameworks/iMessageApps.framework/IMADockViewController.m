@implementation IMADockViewController

- (IMADockViewController)init
{
  IMADockViewController *v2;
  IMAAppPresenter *v3;
  IMAAppPresenter *appPresenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMADockViewController;
  v2 = -[IMADockViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMAAppPresenter);
    appPresenter = v2->_appPresenter;
    v2->_appPresenter = v3;

    v2->_showIconBorders = 1;
  }
  return v2;
}

- (void)viewDidLoad
{
  CKBrowserSwitcherFooterViewDataSource *v3;
  CKBrowserSwitcherFooterViewDataSource *appStripDataSource;
  id v5;
  CKBrowserSwitcherFooterView *v6;
  CKBrowserSwitcherFooterView *appStrip;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMADockViewController;
  -[IMADockViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (CKBrowserSwitcherFooterViewDataSource *)objc_alloc_init(MEMORY[0x24BE159F8]);
  appStripDataSource = self->_appStripDataSource;
  self->_appStripDataSource = v3;

  v5 = objc_alloc(MEMORY[0x24BE159F0]);
  v6 = (CKBrowserSwitcherFooterView *)objc_msgSend(v5, "initWithFrame:toggleBordersOnInterfaceStyle:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  appStrip = self->_appStrip;
  self->_appStrip = v6;

  -[CKBrowserSwitcherFooterView setAutoresizingMask:](self->_appStrip, "setAutoresizingMask:", 2);
  -[CKBrowserSwitcherFooterView setDelegate:](self->_appStrip, "setDelegate:", self);
  -[CKBrowserSwitcherFooterView setDataSource:](self->_appStrip, "setDataSource:", self->_appStripDataSource);
  -[CKBrowserSwitcherFooterView setScrollsLastUsedAppIconIntoView:](self->_appStrip, "setScrollsLastUsedAppIconIntoView:", 0);
  -[CKBrowserSwitcherFooterView setShowBorders:](self->_appStrip, "setShowBorders:", -[IMADockViewController showIconBorders](self, "showIconBorders"));
  -[IMADockViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_appStrip);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMADockViewController;
  -[IMADockViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[IMADockViewController updateAppStripFrame](self, "updateAppStripFrame");
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
  v9.super_class = (Class)IMADockViewController;
  v7 = a4;
  -[IMADockViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__IMADockViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24E210388;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __76__IMADockViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "updateAppFrameForRotation");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[IMAAppPresenter setDelegate:](self->_appPresenter, "setDelegate:", obj);
  }

}

- (BOOL)alwaysPresentAppsExpanded
{
  return -[IMAAppPresenter alwaysPresentAppsExpanded](self->_appPresenter, "alwaysPresentAppsExpanded");
}

- (void)setAlwaysPresentAppsExpanded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[IMAAppPresenter alwaysPresentAppsExpanded](self->_appPresenter, "alwaysPresentAppsExpanded") != a3)
  {
    -[IMAAppPresenter setAlwaysPresentAppsExpanded:](self->_appPresenter, "setAlwaysPresentAppsExpanded:", v3);
    -[IMADockViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", v3);

  }
}

- (void)setShowIconBorders:(BOOL)a3
{
  if (self->_showIconBorders != a3)
  {
    self->_showIconBorders = a3;
    -[CKBrowserSwitcherFooterView setShowBorders:](self->_appStrip, "setShowBorders:");
  }
}

- (double)minimizedDockHeight
{
  int v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = CKIsRunningInCameraAppsClient();
  objc_msgSend(MEMORY[0x24BE15A60], "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "cameraAppsMinimizedDockHeight");
  else
    objc_msgSend(v3, "chatChromeBottomInset");
  v6 = v5;

  return v6;
}

- (UIViewController)currentAppViewController
{
  return -[IMAAppPresenter currentAppViewController](self->_appPresenter, "currentAppViewController");
}

- (BOOL)hidesCompactAppForStickerDrag
{
  return -[IMAAppPresenter hidesCompactAppForStickerDrag](self->_appPresenter, "hidesCompactAppForStickerDrag");
}

- (void)setHidesCompactAppForStickerDrag:(BOOL)a3
{
  -[IMAAppPresenter setHidesCompactAppForStickerDrag:](self->_appPresenter, "setHidesCompactAppForStickerDrag:", a3);
}

- (id)imageViewForSticker:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BE15A40]);
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

  objc_msgSend(v6, "durationsWithMaxCount:", 0x7FFFFFFFLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "thumbnailAtIndex:fillToSize:maxCount:", v9, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v8, "addObject:", v10);

      ++v9;
    }
    while (v9 < objc_msgSend(v6, "count"));
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE159B0]), "initWithImages:durations:", v8, v7);
  v12 = objc_alloc_init(MEMORY[0x24BE159B8]);
  objc_msgSend(v12, "setAnimatedImage:", v11);
  objc_msgSend(v12, "setAutomaticallyObserveWindowForAnimationTimer:", 1);

  return v12;
}

- (void)hideAppViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  -[IMAAppPresenter hideAppViewControllerAnimated:completion:](self->_appPresenter, "hideAppViewControllerAnimated:completion:", a3, a4);
}

- (void)cleanupRunningApps
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE159D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAllActivePlugins");

  objc_msgSend(MEMORY[0x24BE159D0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceKillRemoteExtensionsWithDelay:", 1);

}

- (void)updateAppStripFrame
{
  double v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;

  -[CKBrowserSwitcherFooterView contentHeight](self->_appStrip, "contentHeight");
  v4 = v3;
  -[IMADockViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v15.origin.x = v7;
  v15.origin.y = v9;
  v15.size.width = v11;
  v15.size.height = v13;
  v14 = CGRectGetMaxY(v15) - v4;
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  -[CKBrowserSwitcherFooterView setFrame:](self->_appStrip, "setFrame:", 0.0, v14, CGRectGetWidth(v16), v4);
}

- (void)switcherView:(id)a3 didSelectPluginAtIndex:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  IMAAppPresenter *appPresenter;
  void *v12;
  _QWORD v13[5];

  v5 = (void *)MEMORY[0x24BE159D0];
  v6 = a4;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleDrawerPlugins");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  appPresenter = self->_appPresenter;
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__IMADockViewController_switcherView_didSelectPluginAtIndex___block_invoke;
  v13[3] = &unk_24E2103B0;
  v13[4] = self;
  -[IMAAppPresenter presentAppWithBundleIdentifier:completion:](appPresenter, "presentAppWithBundleIdentifier:completion:", v12, v13);

}

uint64_t __61__IMADockViewController_switcherView_didSelectPluginAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "clearSelection");
}

- (void)switcherView:(id)a3 didMagnify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[IMADockViewController updateAppStripFrame](self, "updateAppStripFrame", a3);
  -[IMADockViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "dockDidMagnify:", v4);

}

- (id)appStrip
{
  return self->_appStrip;
}

- (IMADockViewControllerDelegate)delegate
{
  return (IMADockViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)showIconBorders
{
  return self->_showIconBorders;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appPresenter, 0);
  objc_storeStrong((id *)&self->_appStripDataSource, 0);
  objc_storeStrong((id *)&self->_appStrip, 0);
}

@end
