@implementation VUIAppInstallConfirmationViewController

- (VUIAppInstallConfirmationViewController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VUIAppInstallerViewControllerInitException"), CFSTR("-init is not supported. Use -initWithChannel: title: message: placeholder:"));

  return 0;
}

- (VUIAppInstallConfirmationViewController)initWithInstallable:(id)a3
{
  id v5;
  VUIAppInstallConfirmationViewController *v6;
  VUIAppInstallConfirmationView *v7;
  uint64_t v8;
  VUIAppInstallConfirmationView *confirmationView;
  VUIAppInstallConfirmationViewController *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)VUIAppInstallConfirmationViewController;
    v6 = -[VUIAppInstallConfirmationViewController init](&v12, sel_init);
    if (v6)
    {
      v7 = [VUIAppInstallConfirmationView alloc];
      v8 = -[VUIAppInstallConfirmationView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      confirmationView = v6->_confirmationView;
      v6->_confirmationView = (VUIAppInstallConfirmationView *)v8;

      objc_storeStrong((id *)&v6->_installable, a3);
    }
    self = v6;
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("installable must be non-nil"));
    v10 = 0;
  }

  return v10;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  -[VUIAppInstallConfirmationView setTitle:](self->_confirmationView, "setTitle:", v4);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)VUIAppInstallConfirmationViewController;
    -[VUIAppInstallConfirmationViewController setTitle:](&v7, sel_setTitle_, v4);
  }

}

- (void)setMessage:(id)a3
{
  -[VUIAppInstallConfirmationView setMessage:](self->_confirmationView, "setMessage:", a3);
}

- (void)setUpdateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateMessage, a3);
}

- (void)setUpdateTitle:(id)a3
{
  objc_storeStrong((id *)&self->_updateTitle, a3);
}

- (void)setSecondaryLinkTitle:(id)a3
{
  VUIAppInstallConfirmationView *confirmationView;
  id v4;
  id v5;

  confirmationView = self->_confirmationView;
  v4 = a3;
  -[VUIAppInstallConfirmationView secondaryLinkButton](confirmationView, "secondaryLinkButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (VUIAppInstallLockup)lockup
{
  return -[VUIAppInstallConfirmationView lockupView](self->_confirmationView, "lockupView");
}

- (UIButton)actionButton
{
  return -[VUIAppInstallConfirmationView actionButton](self->_confirmationView, "actionButton");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VUIAppInstallConfirmationViewController;
  -[VUIAppInstallConfirmationViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  v14 = CFSTR("appIds");
  -[VUIAppInstallConfirmationViewController installable](self, "installable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("pageDetails");
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", CFSTR("AppInstall"), CFSTR("AppInstall"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordPage:", v9);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView lockupView](self->_confirmationView, "lockupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[VUIAppInstallConfirmationView actionButton](self->_confirmationView, "actionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

    -[VUIAppInstallConfirmationView cancelButton](self->_confirmationView, "cancelButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

    -[VUIAppInstallConfirmationView appStoreButton](self->_confirmationView, "appStoreButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

  }
}

- (void)setPreInstallState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  VUIAppInstallConfirmationView *confirmationView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  self->_state = 1;
  -[VUIAppInstallConfirmationViewController lockup](self, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWaiting");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  confirmationView = self->_confirmationView;
  if (v6 == 2)
  {
    -[VUIAppInstallConfirmationView lockupView](confirmationView, "lockupView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCanFocus:", 1);

    -[VUIAppInstallConfirmationView setNeedsFocusUpdate](self->_confirmationView, "setNeedsFocusUpdate");
  }
  else
  {
    -[VUIAppInstallConfirmationView actionButton](confirmationView, "actionButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

    -[VUIAppInstallConfirmationView cancelButton](self->_confirmationView, "cancelButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    -[VUIAppInstallConfirmationView actionButton](self->_confirmationView, "actionButton");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

  }
}

- (void)setInstallingState
{
  void *v3;
  uint64_t v4;
  UIBarButtonItem *barButtonItem;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_state = 2;
  if (-[NSString length](self->_updateTitle, "length"))
    -[VUIAppInstallConfirmationView setTitle:](self->_confirmationView, "setTitle:", self->_updateTitle);
  if (-[NSString length](self->_updateMessage, "length"))
    -[VUIAppInstallConfirmationView setMessage:](self->_confirmationView, "setMessage:", self->_updateMessage);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 2)
  {
    barButtonItem = self->_barButtonItem;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", CFSTR("APP_INSTALL_ACTION_TITLE_DONE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](barButtonItem, "setTitle:", v7);

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:", CFSTR("APP_INSTALL_ACTION_TITLE_INSTALLING"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIAppInstallConfirmationView actionButton](self->_confirmationView, "actionButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forStates:", v9, 2);

  }
  -[VUIAppInstallConfirmationView actionButton](self->_confirmationView, "actionButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.install.state=\"installing\"));

}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id appStoreHandler;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *barButtonItem;
  void *v14;
  id secondaryLinkHandler;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 2)
  {
    -[VUIAppInstallConfirmationView cancelButton](self->_confirmationView, "cancelButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__handleCancel, 0x2000);

    appStoreHandler = self->_appStoreHandler;
    -[VUIAppInstallConfirmationView appStoreButton](self->_confirmationView, "appStoreButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (appStoreHandler)
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__handleAppStore, 0x2000);
    else
      objc_msgSend(v7, "setHidden:", 1);

    secondaryLinkHandler = self->_secondaryLinkHandler;
    -[VUIAppInstallConfirmationView secondaryLinkButton](self->_confirmationView, "secondaryLinkButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (secondaryLinkHandler)
      objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__handleSecondaryLink, 0x2000);
    else
      objc_msgSend(v16, "setHidden:", 1);

  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:", CFSTR("APP_INSTALL_ACTION_TITLE_CLOSE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIBarButtonItem *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, self, sel__handleCancel);
    barButtonItem = self->_barButtonItem;
    self->_barButtonItem = v12;

    -[VUIAppInstallConfirmationViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", self->_barButtonItem);

  }
  -[VUIAppInstallConfirmationView actionButton](self->_confirmationView, "actionButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__handleAction, 0x2000);

  -[VUIAppLoadingViewController setView:](self, "setView:", self->_confirmationView);
  -[VUIAppLoadingViewController setLoading:](self, "setLoading:", 1);
  -[VUIAppInstallConfirmationViewController _fetchAppInfo](self, "_fetchAppInfo");
}

- (void)_handleAction
{
  void (**actionHandler)(id, SEL);
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  actionHandler = (void (**)(id, SEL))self->_actionHandler;
  if (actionHandler)
    actionHandler[2](actionHandler, a2);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("targetId");
  v5[1] = CFSTR("targetType");
  v6[0] = CFSTR("install");
  v6[1] = CFSTR("button");
  v5[2] = CFSTR("actionType");
  v6[2] = CFSTR("install");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClick:", v4);

}

- (void)_handleCancel
{
  void (**cancelationHandler)(id, unint64_t);
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  cancelationHandler = (void (**)(id, unint64_t))self->_cancelationHandler;
  if (cancelationHandler)
    cancelationHandler[2](self->_cancelationHandler, self->_state);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("targetId");
  v5[1] = CFSTR("targetType");
  v6[0] = CFSTR("cancel");
  v6[1] = CFSTR("button");
  v5[2] = CFSTR("actionType");
  v6[2] = CFSTR("cancel");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClick:", v4);

}

- (void)_handleAppStore
{
  void (**appStoreHandler)(id, unint64_t);
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  appStoreHandler = (void (**)(id, unint64_t))self->_appStoreHandler;
  if (appStoreHandler)
    appStoreHandler[2](self->_appStoreHandler, self->_state);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("targetId");
  v5[1] = CFSTR("targetType");
  v6[0] = CFSTR("appStore");
  v6[1] = CFSTR("button");
  v5[2] = CFSTR("actionType");
  v6[2] = CFSTR("appStore");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClick:", v4);

}

- (void)_handleSecondaryLink
{
  void (**secondaryLinkHandler)(void);

  secondaryLinkHandler = (void (**)(void))self->_secondaryLinkHandler;
  if (secondaryLinkHandler)
    secondaryLinkHandler[2]();
}

- (void)_fetchAppInfo
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  id location;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  CGAffineTransform v46;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  +[VUIAppInstallConfirmationView iconSize](VUIAppInstallConfirmationView, "iconSize");
  v7 = v6;
  v9 = v8;
  CGAffineTransformMakeScale(&v46, v5, v5);
  v10 = v9 * v46.c + v46.a * v7;
  v11 = v9 * v46.d + v46.b * v7;
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  dispatch_group_enter(v12);
  -[VUIAppInstallConfirmationViewController installable](self, "installable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__4;
  v44[4] = __Block_byref_object_dispose__4;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__4;
  v42[4] = __Block_byref_object_dispose__4;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__4;
  v40[4] = __Block_byref_object_dispose__4;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__4;
  v38[4] = __Block_byref_object_dispose__4;
  v39 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke;
  v35[3] = &unk_1E9F9BB78;
  v37 = v44;
  v16 = v12;
  v36 = v16;
  +[VUIAppIconImageService fetchIconForInstallable:size:completion:](VUIAppIconImageService, "fetchIconForInstallable:size:completion:", v13, v35, v10, v11);
  objc_msgSend(v13, "appAdamIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v18, "length"))
  {
    NSLog(CFSTR("VUIAppInstallConfirmationViewController - error, continuing  without app adam id"));

    v18 = &stru_1E9FF3598;
  }
  objc_initWeak(&location, self);
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_2;
  v28[3] = &unk_1E9F9BBA0;
  objc_copyWeak(&v33, &location);
  v30 = v40;
  v31 = v42;
  v32 = v38;
  v19 = v16;
  v29 = v19;
  -[VUIAppInstallConfirmationViewController _fetchStoreInfoForAdamID:completion:](self, "_fetchStoreInfoForAdamID:completion:", v18, v28);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_3;
  block[3] = &unk_1E9F9BBC8;
  objc_copyWeak(&v27, &location);
  v22 = v14;
  v23 = v44;
  v24 = v42;
  v25 = v40;
  v26 = v38;
  v20 = v14;
  dispatch_group_notify(v19, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

}

void __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v15)
    {
      NSLog(CFSTR("VUIAppInstallConfirmationViewController - lockup lookup complete"));
      if (objc_msgSend(v15, "hasInAppPurchases"))
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("APP_INSTALL_OFFERS_IN_APP_PURCHASES"));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
      objc_msgSend(v15, "contentRatingsBySystemDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(WeakRetained, "_namedRatingWithRatings:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
      if ((isKindOfClass & 1) != 0)

      objc_msgSend(v15, "subtitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "length"))
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v14);

    }
    else
    {
      NSLog(CFSTR("VUIAppInstallConfirmationViewController - lockup lookup failed: %@"), v5);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "confirmationView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppIcon:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    objc_msgSend(v8, "confirmationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppName:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v8, "confirmationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAgeRating:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    objc_msgSend(v8, "confirmationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIAP:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    objc_msgSend(v8, "confirmationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAppSubtitle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

    objc_msgSend(v8, "setLoading:", 0);
    WeakRetained = v8;
  }

}

- (void)_fetchStoreInfoForAdamID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB48]), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.tv.videosui"), CFSTR("1"), v7)) != 0)
  {
    v9 = (void *)v8;
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemIdentifiers:", v10);

    objc_msgSend(v9, "perform");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__VUIAppInstallConfirmationViewController__fetchStoreInfoForAdamID_completion___block_invoke;
    v12[3] = &unk_1E9F9BBF0;
    v13 = v6;
    objc_msgSend(v11, "addFinishBlock:", v12);

  }
  else
  {
    NSLog(CFSTR("VUIAppInstallConfirmationViewController - bag and/or task is nil."));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIAppInstallerErrorDomain"), -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
  }

}

void __79__VUIAppInstallConfirmationViewController__fetchStoreInfoForAdamID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || !v5)
  {
    NSLog(CFSTR("VUIAppInstallConfirmationViewController - failed to lookup item: %@ or no item found"), v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8728]), "initWithDictionary:", v5);
    if (*(_QWORD *)(a1 + 32))
    {
      NSLog(CFSTR("VUIAppInstallConfirmationViewController - _fetchStoreInfoForAdamID successful"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

- (id)_fileSizeWithDeviceSizes:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  uint64_t i;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFDA50], "thinnedAppVariantId");
  objc_msgSend(MEMORY[0x1E0CFDA50], "compatibleProductType", objc_claimAutoreleasedReturnValue());
  v4 = 0;
  v11[1] = objc_claimAutoreleasedReturnValue();
  v11[2] = CFSTR("universal");
  while (1)
  {
    v5 = (id)v11[v4];
    if (v5)
      break;
    if (++v4 == 3)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  if (objc_msgSend(v5, "length"))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = v6;
  for (i = 2; i != -1; --i)

  return v8;
}

- (id)_namedRatingWithRatings:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("appsApple"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (id)appStoreHandler
{
  return self->_appStoreHandler;
}

- (void)setAppStoreHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (id)secondaryLinkHandler
{
  return self->_secondaryLinkHandler;
}

- (void)setSecondaryLinkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItem, a3);
}

- (VUIAppInstallConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationView, a3);
}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (void)setInstallable:(id)a3
{
  objc_storeStrong((id *)&self->_installable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installable, 0);
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong(&self->_secondaryLinkHandler, 0);
  objc_storeStrong(&self->_appStoreHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_cancelationHandler, 0);
  objc_storeStrong((id *)&self->_updateMessage, 0);
  objc_storeStrong((id *)&self->_updateTitle, 0);
}

@end
