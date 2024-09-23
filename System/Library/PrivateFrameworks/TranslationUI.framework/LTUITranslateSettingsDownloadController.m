@implementation LTUITranslateSettingsDownloadController

- (LTUITranslateSettingsDownloadController)initWithNibName:(id)a3 bundle:(id)a4
{
  LTUITranslateSettingsDownloadController *v4;
  LTUITranslateSettingsDownloadController *v5;
  LTUITranslateSettingsDownloadController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LTUITranslateSettingsDownloadController;
  v4 = -[LTUITranslateSettingsDownloadController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[LTUITranslateSettingsDownloadController setUsageContext:](v4, "setUsageContext:", 0);
    -[LTUITranslateSettingsDownloadController loadBridge](v5, "loadBridge");
    v6 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LTUITranslateSettingsDownloadController;
  -[LTUITranslateSettingsDownloadController viewDidLoad](&v16, sel_viewDidLoad);
  -[LTUITranslateSettingsDownloadController addChildViewController:](self, "addChildViewController:", self->_bridge);
  -[LTUITranslateSettingsDownloadController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIViewController view](self->_bridge, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[UIViewController view](self->_bridge, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 18);

  -[LTUITranslateSettingsDownloadController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_bridge, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[UIViewController didMoveToParentViewController:](self->_bridge, "didMoveToParentViewController:", self);
}

- (id)navigationItem
{
  return -[UIViewController navigationItem](self->_bridge, "navigationItem");
}

- (void)loadBridge
{
  UIViewController *v3;
  UIViewController *bridge;

  if (-[LTUITranslateSettingsDownloadController usageContext](self, "usageContext") == 1)
    +[LTUIHostedDownloadViewBridge accessibilityViewController](LTUIHostedDownloadViewBridge, "accessibilityViewController");
  else
    +[LTUIHostedDownloadViewBridge viewController](LTUIHostedDownloadViewBridge, "viewController");
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  bridge = self->_bridge;
  self->_bridge = v3;

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)LTUITranslateSettingsDownloadController;
  -[LTUITranslateSettingsDownloadController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Apps/com.apple.Translate/DOWNLOADED_LANGUAGES_SPECIFIER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("ON_DEVICE_LANGUAGES_TITLE"), CFSTR("Localizable"), v6, v8);

  v10 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithKey:table:locale:bundleURL:", CFSTR("TRANSLATE"), CFSTR("Localizable"), v11, v13);

  v17[0] = v14;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTUITranslateSettingsDownloadController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.Translation"), v9, v15, v4);

}

- (unint64_t)usageContext
{
  return self->_usageContext;
}

- (void)setUsageContext:(unint64_t)a3
{
  self->_usageContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
}

@end
