@implementation VUIHUDViewController

- (VUIHUDViewController)init
{
  VUIHUDViewController *v2;
  VUIHUDViewController *v3;
  NSString *tabIdentifier;
  UIViewController *hudContentViewController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIHUDViewController;
  v2 = -[VUIHUDViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tabIndex = -1;
    tabIdentifier = v2->_tabIdentifier;
    v2->_tabIdentifier = (NSString *)&stru_1E9FF3598;

    hudContentViewController = v3->_hudContentViewController;
    v3->_hudContentViewController = 0;

  }
  -[VUIHUDViewController setOverrideUserInterfaceStyle:](v3, "setOverrideUserInterfaceStyle:", 2);
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VUIHUDViewController;
  -[VUIHUDViewController dealloc](&v2, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIHUDViewController;
  -[VUIHUDViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[VUIHUDViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)setHudContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hudContentViewController, a3);
  -[VUIHUDViewController _addViewControllerToHud](self, "_addViewControllerToHud");
}

- (void)viewDidLayoutSubviews
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
  UIViewController *v12;
  void *v13;
  UIViewController *v14;
  _QWORD v15[4];
  UIViewController *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  -[VUIHUDViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = self->_hudContentViewController;
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__VUIHUDViewController_viewDidLayoutSubviews__block_invoke;
  v15[3] = &unk_1E9F9D420;
  v16 = v12;
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v14 = v12;
  objc_msgSend(v13, "performWithoutAnimation:", v15);

}

void __45__VUIHUDViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)_addViewControllerToHud
{
  UIViewController *v3;
  VUIHUDViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *v8;

  v3 = self->_hudContentViewController;
  if (v3)
  {
    v8 = v3;
    -[UIViewController parentViewController](v3, "parentViewController");
    v4 = (VUIHUDViewController *)objc_claimAutoreleasedReturnValue();

    v3 = v8;
    if (v4 != self)
    {
      -[VUIHUDViewController addChildViewController:](self, "addChildViewController:", v8);
      -[VUIHUDViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](v8, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v6);

      -[VUIHUDViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setClipsToBounds:", 0);

      -[UIViewController didMoveToParentViewController:](v8, "didMoveToParentViewController:", self);
      v3 = v8;
    }
  }

}

- (CGSize)_computePreferredContentSize
{
  void *v3;
  uint64_t v4;
  _BOOL8 v6;
  _BOOL4 v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  VUIHUDViewController *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGSize v28;
  CGSize v29;
  CGSize result;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIHUDViewController playerViewSize](self, "playerViewSize");
  v4 = objc_msgSend(v3, "vui_currentSizeClassForWindowWidth:");
  v6 = v4 == 1 || (v4 & 0xFFFFFFFFFFFFFFFELL) == 2;
  -[VUIHUDViewController playerViewSize](self, "playerViewSize");
  v7 = +[VUIUtilities shouldPlayerTabsUseVerticalLayoutForSize:isPhoneSizeClass:](VUIUtilities, "shouldPlayerTabsUseVerticalLayoutForSize:isPhoneSizeClass:", v6);
  if (v7)
    v8 = 1.79769313e308;
  else
    v8 = 160.0;
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIHUDViewController tabIdentifier](self, "tabIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIHUDViewController playerViewSize](self, "playerViewSize");
    NSStringFromCGSize(v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29.width = 0.0;
    v29.height = v8;
    NSStringFromCGSize(v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134219266;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2048;
    v22 = v4;
    v23 = 1024;
    v24 = v7;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIHUDViewController::(%p, %@) computePreferredContentSize, playerViewSize: %@, sizeClass: %ld, useVerticalLayout: %d, result: %@", (uint8_t *)&v15, 0x3Au);

  }
  v13 = 0.0;
  v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)avkit_customInfoPanelKindIdentifier
{
  return self->_tabIdentifier;
}

- (void)addBorderWithColor:(id)a3 width:(double)a4 cornerRadius:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  -[VUIHUDViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "CGColor");

  objc_msgSend(v10, "setBorderColor:", v12);
  -[VUIHUDViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderWidth:", a4);

  -[VUIHUDViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", a5);

  -[VUIHUDViewController view](self, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMasksToBounds:", 1);

}

- (UIViewController)hudContentViewController
{
  return self->_hudContentViewController;
}

- (int)tabIndex
{
  return self->_tabIndex;
}

- (void)setTabIndex:(int)a3
{
  self->_tabIndex = a3;
}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (void)setTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tabIdentifier, a3);
}

- (CGSize)playerViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_playerViewSize.width;
  height = self->_playerViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPlayerViewSize:(CGSize)a3
{
  self->_playerViewSize = a3;
}

- (NSObject)tabObserver
{
  return self->_tabObserver;
}

- (void)setTabObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tabObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabObserver, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
  objc_storeStrong((id *)&self->_hudContentViewController, 0);
}

@end
