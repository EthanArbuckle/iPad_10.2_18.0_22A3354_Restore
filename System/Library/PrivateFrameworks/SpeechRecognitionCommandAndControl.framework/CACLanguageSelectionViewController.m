@implementation CACLanguageSelectionViewController

+ (id)defaultControllerWithStyle:(unint64_t)a3
{
  CACLanguageSelectionViewController *v4;

  v4 = objc_alloc_init(CACLanguageSelectionViewController);
  -[CACLanguageSelectionViewController setControllerStyle:](v4, "setControllerStyle:", a3);
  return v4;
}

- (CACLanguageSelectionViewController)init
{
  CACLanguageSelectionViewController *v2;
  void *v3;
  uint64_t v4;
  NSArray *availableLocales;
  void *v6;
  uint64_t v7;
  CACUILanguageViewBridgeController *languageViewBridgeController;
  uint64_t v9;
  UIViewController *languageViewController;
  void *v11;
  void *v12;
  CACUILanguageViewBridgeController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CACLanguageSelectionViewController;
  v2 = -[CACLanguageSelectionViewController init](&v20, sel_init);
  if (v2)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userSelectableLocaleIdentifiers");
    v4 = objc_claimAutoreleasedReturnValue();
    availableLocales = v2->_availableLocales;
    v2->_availableLocales = (NSArray *)v4;

    +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerForCallback");

    v7 = objc_opt_new();
    languageViewBridgeController = v2->_languageViewBridgeController;
    v2->_languageViewBridgeController = (CACUILanguageViewBridgeController *)v7;

    -[CACUILanguageViewBridgeController setDelegate:](v2->_languageViewBridgeController, "setDelegate:", v2);
    -[CACUILanguageViewBridgeController createLanguageViewControllerWithLocales:](v2->_languageViewBridgeController, "createLanguageViewControllerWithLocales:", v2->_availableLocales);
    v9 = objc_claimAutoreleasedReturnValue();
    languageViewController = v2->_languageViewController;
    v2->_languageViewController = (UIViewController *)v9;

    +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installationStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CACUILanguageViewBridgeController updateInstallationStatus:](v2->_languageViewBridgeController, "updateInstallationStatus:", v12);
    v13 = v2->_languageViewBridgeController;
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bestLocaleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACUILanguageViewBridgeController setSelectedLanguageIdentifier:](v13, "setSelectedLanguageIdentifier:", v15);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel_handleDownloadProgressChange, CFSTR("CACNotificationAssetDownloadProgressChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_handleErrorOccured_, CFSTR("CACNotificationAssetDownloadErrorOccured"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_languageChanged, CFSTR("CACNotificationLanguageChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CACNotificationLanguageChanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)CACLanguageSelectionViewController;
  -[CACLanguageSelectionViewController dealloc](&v4, sel_dealloc);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[6];

  v41[4] = *MEMORY[0x24BDAC8D0];
  v40.receiver = self;
  v40.super_class = (Class)CACLanguageSelectionViewController;
  -[CACLanguageSelectionViewController viewDidLoad](&v40, sel_viewDidLoad);
  -[CACLanguageSelectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLanguageSelectionViewController addChildViewController:](self, "addChildViewController:", v5);

  -[CACLanguageSelectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didMoveToParentViewController:", self);

  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CACLanguageSelectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDD1628];
  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v28;
  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v16;
  -[CACLanguageSelectionViewController languageViewController](self, "languageViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v13;
  objc_msgSend(v13, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v22);

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("LanguageSelection.Title"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLanguageSelectionViewController setTitle:](self, "setTitle:", v23);

  if (!-[CACLanguageSelectionViewController controllerStyle](self, "controllerStyle"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
    -[CACLanguageSelectionViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItem:", v24);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACLanguageSelectionViewController;
  -[CACLanguageSelectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CACLanguageSelectionViewController languageViewBridgeController](self, "languageViewBridgeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateInstallationStatus:", MEMORY[0x24BDBD1B8]);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CACLanguageSelectionViewController;
  -[CACLanguageSelectionViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)selectedLanguageWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocaleIdentifier:", v3);

}

- (void)dismiss
{
  -[CACLanguageSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)languageDidChange
{
  void *v3;
  void *v4;
  id v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestLocaleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CACLanguageSelectionViewController languageViewBridgeController](self, "languageViewBridgeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedLanguageIdentifier:", v5);

}

- (void)handleDownloadProgressChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CACLanguageSelectionViewController_handleDownloadProgressChange__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __66__CACLanguageSelectionViewController_handleDownloadProgressChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDownloadProgress");
}

- (void)updateDownloadProgress
{
  void *v3;
  void *v4;
  id v5;

  +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadProgress");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CACLanguageSelectionViewController languageViewBridgeController](self, "languageViewBridgeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDownloadStatus:", v5);

}

- (void)handleErrorOccured:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CACLogAssetDownload();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CACLanguageSelectionViewController handleErrorOccured:].cold.1((uint64_t)v4, v5);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CACLanguageSelectionViewController_handleErrorOccured___block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__CACLanguageSelectionViewController_handleErrorOccured___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDownloadProgress");
}

- (void)cacLanguageDownloadStartDownload:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CACLogAssetDownload();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_DEFAULT, "Start download for language %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)cacLanguageDownloadStopDownload:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CACLogAssetDownload();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_DEFAULT, "Stop download for language %@", (uint8_t *)&v5, 0xCu);
  }

}

- (unint64_t)controllerStyle
{
  return self->_controllerStyle;
}

- (void)setControllerStyle:(unint64_t)a3
{
  self->_controllerStyle = a3;
}

- (CACUILanguageViewBridgeController)languageViewBridgeController
{
  return self->_languageViewBridgeController;
}

- (void)setLanguageViewBridgeController:(id)a3
{
  objc_storeStrong((id *)&self->_languageViewBridgeController, a3);
}

- (UIViewController)languageViewController
{
  return self->_languageViewController;
}

- (void)setLanguageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_languageViewController, a3);
}

- (NSArray)availableLocales
{
  return self->_availableLocales;
}

- (void)setAvailableLocales:(id)a3
{
  objc_storeStrong((id *)&self->_availableLocales, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLocales, 0);
  objc_storeStrong((id *)&self->_languageViewController, 0);
  objc_storeStrong((id *)&self->_languageViewBridgeController, 0);
}

- (void)handleErrorOccured:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Error occured in language download for %@", (uint8_t *)&v2, 0xCu);
}

@end
