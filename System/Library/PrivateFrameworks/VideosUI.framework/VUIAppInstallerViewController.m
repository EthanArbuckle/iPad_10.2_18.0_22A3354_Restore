@implementation VUIAppInstallerViewController

- (VUIAppInstallerViewController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VUIAppInstallerViewControllerInitException"), CFSTR("-init is not supported. Use -initWithChannel:"));

  return 0;
}

- (VUIAppInstallerViewController)initWithInstallable:(id)a3
{
  return -[VUIAppInstallerViewController initWithInstallable:punchoutURL:](self, "initWithInstallable:punchoutURL:", a3, 0);
}

- (VUIAppInstallerViewController)initWithInstallable:(id)a3 punchoutURL:(id)a4
{
  id v7;
  id v8;
  VUIAppInstallerViewController *v9;
  VUIAppInstallerViewController *v10;
  VUIASDDialogObserver *v11;
  VUIAppInstallerViewController *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIAppInstallerViewController;
    v9 = -[VUIAppInstallerViewController init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_installable, a3);
      v10->_displayAppStoreLink = 1;
      v11 = objc_alloc_init(VUIASDDialogObserver);
      -[VUIASDDialogObserver setPresenterViewController:](v11, "setPresenterViewController:", v10);
      -[VUIAppInstallerViewController setDialogObserver:](v10, "setDialogObserver:", v11);
      -[VUIAppInstallerViewController setPunchoutURL:](v10, "setPunchoutURL:", v8);

    }
    self = v10;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("installable must be non-nil"));
    v12 = 0;
  }

  return v12;
}

- (void)_initConfirmation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  VUIAppInstallConfirmationViewController *v47;
  VUIAppInstallConfirmationViewController *confirmationController;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  VUIAppInstallConfirmationViewController *v57;
  id v58;
  VUIAppInstallConfirmationViewController *v59;
  void *v60;
  BOOL v61;
  VUIAppInstallConfirmationViewController *v62;
  void *v63;
  BOOL v64;
  VUIAppInstallConfirmationViewController *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  __CFString *v69;
  NSString *v70;
  void *v71;
  NSString *v72;
  NSString *v73;
  NSString *v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id from;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD aBlock[5];
  id v86;
  id location;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  VUIAppInstallConfirmationViewController *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC8750], "defaultAppLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allAppBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[WLKInstallable appBundleIDs](self->_installable, "appBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v89;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v89 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  NSLog(CFSTR("App installation is update: %d"), v9);
  v74 = self->_confirmationTitle;
  v10 = self->_confirmationBody;
  v73 = self->_confirmationInstallButtonTitle;
  v70 = self->_localizedContentTitle;
  v11 = self->_updateBody;
  v72 = self->_updateTitle;
  -[WLKInstallable name](self->_installable, "name");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](v74, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom") == 2;

    v14 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("APP_GET_ALERT_TITLE_FORMAT");
    if (v13)
      v17 = CFSTR("APP_INSTALL_ALERT_TITLE_FORMAT");
    if (v9)
      v18 = CFSTR("APP_UPDATE_ALERT_TITLE_FORMAT");
    else
      v18 = v17;
    objc_msgSend(v15, "localizedStringForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), 0, v71);
    v20 = objc_claimAutoreleasedReturnValue();

    v74 = (NSString *)v20;
  }
  if (-[NSString length](v10, "length"))
  {
    v69 = (__CFString *)v10;
  }
  else
  {
    if (-[NSString length](v70, "length"))
    {
      if (v9)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:", CFSTR("APP_UPDATE_ALERT_MESSAGE_FORMAT"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@ %@"), 0, v70, v71);
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "userInterfaceIdiom") == 2;

        v26 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v27;
        if (v25)
          objc_msgSend(v27, "localizedStringForKey:", CFSTR("APP_INSTALL_ALERT_MESSAGE_FORMAT"));
        else
          objc_msgSend(v27, "localizedStringForKey:", CFSTR("APP_INSTALL_ALERT_MESSAGE_FORMAT_IOS"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@ %@"), 0, v70, v71);
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      v10 = (NSString *)v22;
    }
    else
    {
      v69 = CFSTR(" ");
    }

  }
  if (!-[NSString length](v73, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceIdiom") == 2;

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (v9)
        objc_msgSend(v30, "localizedStringForKey:", CFSTR("APP_INSTALL_ACTION_TITLE_UPDATE"));
      else
        objc_msgSend(v30, "localizedStringForKey:", CFSTR("APP_INSTALL_ACTION_TITLE_INSTALL"));
      v32 = objc_claimAutoreleasedReturnValue();

      v73 = (NSString *)v32;
    }
    else
    {
      if (v9)
        v33 = CFSTR("APP_INSTALL_ACTION_TITLE_UPDATE");
      else
        v33 = CFSTR("APP_INSTALL_ACTION_TITLE_GET");
      objc_msgSend(v30, "localizedStringForKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "localizedUppercaseString");
      v73 = (NSString *)objc_claimAutoreleasedReturnValue();
      v31 = v34;
    }

  }
  if (-[NSString length](v11, "length"))
  {
    v68 = (__CFString *)v11;
  }
  else
  {
    if (-[NSString length](v70, "length"))
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v36 = (NSString *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v9)
        v38 = CFSTR("APP_INSTALL_PAGE_UPDATE_SUBTITLE_FORMAT");
      else
        v38 = CFSTR("APP_INSTALL_PAGE_SUBTITLE_FORMAT");
      -[NSString localizedStringForKey:](v36, "localizedStringForKey:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithValidatedFormat:validFormatSpecifiers:error:", v39, CFSTR("%@ %@"), 0, v70, v71);
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = v37;
    }
    else
    {
      v68 = CFSTR(" ");
    }

  }
  if (!-[NSString length](v72, "length"))
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:", CFSTR("APP_INSTALL_PAGE_TITLE_FORMAT"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v42, CFSTR("%@"), 0, v71);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v44 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:", CFSTR("APP_INSTALL_PAGE_UPDATE_TITLE_FORMAT"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithValidatedFormat:validFormatSpecifiers:error:", v46, CFSTR("%@"), 0, v71);
      v72 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v72 = (NSString *)v43;
    }
  }
  v47 = -[VUIAppInstallConfirmationViewController initWithInstallable:]([VUIAppInstallConfirmationViewController alloc], "initWithInstallable:", self->_installable);
  confirmationController = self->_confirmationController;
  self->_confirmationController = v47;

  -[VUIAppInstallerViewController confirmationController](self, "confirmationController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTitle:", v74);

  -[VUIAppInstallerViewController confirmationController](self, "confirmationController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setMessage:", v69);

  -[VUIAppInstallerViewController confirmationController](self, "confirmationController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "actionButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setTitle:forState:", v73, 0);

  -[VUIAppInstallerViewController confirmationController](self, "confirmationController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setUpdateTitle:", v72);

  -[VUIAppInstallerViewController confirmationController](self, "confirmationController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setUpdateMessage:", v68);

  objc_initWeak(&location, self);
  v55 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke;
  aBlock[3] = &unk_1E9F9D150;
  objc_copyWeak(&v86, &location);
  aBlock[4] = self;
  v56 = _Block_copy(aBlock);
  v57 = self->_confirmationController;
  v83[0] = v55;
  v83[1] = 3221225472;
  v83[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_3;
  v83[3] = &unk_1E9FA3820;
  v58 = v56;
  v84 = v58;
  -[VUIAppInstallConfirmationViewController setCancelationHandler:](v57, "setCancelationHandler:", v83);
  v59 = self->_confirmationController;
  v81[0] = v55;
  v81[1] = 3221225472;
  v81[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_4;
  v81[3] = &unk_1E9F99C98;
  objc_copyWeak(&v82, &location);
  -[VUIAppInstallConfirmationViewController setActionHandler:](v59, "setActionHandler:", v81);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "userInterfaceIdiom") == 2)
  {
    v61 = !self->_displayAppStoreLink;

    if (!v61)
    {
      objc_initWeak(&from, self->_installable);
      v62 = self->_confirmationController;
      v77[0] = v55;
      v77[1] = 3221225472;
      v77[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_5;
      v77[3] = &unk_1E9FA3848;
      v78 = v58;
      objc_copyWeak(&v79, &from);
      -[VUIAppInstallConfirmationViewController setAppStoreHandler:](v62, "setAppStoreHandler:", v77);
      objc_destroyWeak(&v79);

      objc_destroyWeak(&from);
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "userInterfaceIdiom") == 2)
  {
    v64 = !self->_displaySecondaryLink;

    if (!v64)
    {
      -[VUIAppInstallConfirmationViewController setSecondaryLinkTitle:](self->_confirmationController, "setSecondaryLinkTitle:", self->_secondaryLinkTitle);
      v65 = self->_confirmationController;
      v75[0] = v55;
      v75[1] = 3221225472;
      v75[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_7;
      v75[3] = &unk_1E9F99C98;
      objc_copyWeak(&v76, &location);
      -[VUIAppInstallConfirmationViewController setSecondaryLinkHandler:](v65, "setSecondaryLinkHandler:", v75);
      objc_destroyWeak(&v76);
    }
  }
  else
  {

  }
  v92 = self->_confirmationController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallerViewController setViewControllers:](self, "setViewControllers:", v66);

  -[VUIAppInstallerViewController navigationBar](self, "navigationBar");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "_setHidesShadow:", 1);
  objc_msgSend(v67, "_setDisableBlurTinting:", 1);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);

}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v3 = (id *)(a1 + 40);
  if (a2 == 2)
  {
    NSLog(CFSTR("VUIAppInstallerViewController - Dismissed active app installation."));
    WeakRetained = objc_loadWeakRetained(v3);
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "confirmationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
  else
  {
    NSLog(CFSTR("VUIAppInstallerViewController - Cancelled app installation."));
    v8 = objc_loadWeakRetained(v3);
    v5 = v8;
    if (v8)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_2;
      v10[3] = &unk_1E9F98DF0;
      v10[4] = v8;
      objc_msgSend(v8, "_dismissAppInstallWithCompletion:", v10);
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "actionButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.install.state=\"inactive\"));

}

uint64_t __50__VUIAppInstallerViewController__initConfirmation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, 0, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setProgressBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setConfirmationController:", 0);
}

uint64_t __50__VUIAppInstallerViewController__initConfirmation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(CFSTR("VUIAppInstallerViewController - Accepted app installation."));
    objc_msgSend(WeakRetained, "_beginInstallingApp");
  }

}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_6;
  block[3] = &unk_1E9F99C98;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "appStoreURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("VUIAppInstallerViewController - App store link %@"), v2);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appStoreURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

    WeakRetained = v5;
  }

}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(void);
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "secondaryLinkHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

    WeakRetained = v3;
  }

}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIAppInstallerViewController;
  -[VUIAppInstallerViewController loadView](&v7, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 2)
  {
    -[VUIAppInstallerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)VUIAppInstallerViewController;
  return -[VUIAppInstallerViewController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
}

- (void)beginInstallingAppWithProgressHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id progressBlock;
  id completionBlock;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[4];
  id v21;

  v6 = a3;
  v7 = a4;
  -[VUIAppInstallerViewController _dismissAppInstallWithCompletion:](self, "_dismissAppInstallWithCompletion:", 0);
  progressBlock = self->_progressBlock;
  if (progressBlock)
  {
    self->_progressBlock = 0;

  }
  completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    self->_completionBlock = 0;

  }
  objc_msgSend(MEMORY[0x1E0DC8750], "defaultAppLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginIgnoringAppLibraryChanges");

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke;
  aBlock[3] = &unk_1E9FA3870;
  v21 = v7;
  v12 = v7;
  v13 = _Block_copy(aBlock);
  v14 = self->_completionBlock;
  self->_completionBlock = v13;

  self->_lastProgress = 0.0;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke_2;
  v18[3] = &unk_1E9FA3898;
  v18[4] = self;
  v19 = v6;
  v15 = v6;
  v16 = _Block_copy(v18);
  v17 = self->_progressBlock;
  self->_progressBlock = v16;

  -[VUIAppInstallerViewController _initConfirmation](self, "_initConfirmation");
}

void __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_msgSend(MEMORY[0x1E0DC8750], "defaultAppLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endIgnoringAppLibraryChanges");

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v8 + 16))(v8, a2, a3, v9);

}

uint64_t __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke_2(uint64_t result, double a2)
{
  uint64_t v3;
  double v4;

  if (*(_QWORD *)(result + 40))
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 32), "lastProgress");
    if ((v4 * 100.0) != (a2 * 100.0))
      return (*(uint64_t (**)(double))(*(_QWORD *)(v3 + 40) + 16))(a2);
  }
  return result;
}

- (void)_beginInstallingApp
{
  void *v3;
  WLKInstallable *installable;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[VUIAppInstallConfirmationViewController setPreInstallState](self->_confirmationController, "setPreInstallState");
  -[VUIASDDialogObserver startListening](self->_dialogObserver, "startListening");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC8748], "defaultAppInstaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  installable = self->_installable;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke;
  v8[3] = &unk_1E9FA38C0;
  objc_copyWeak(&v9, &location);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3;
  v6[3] = &unk_1E9F9C880;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "installAppForInstallable:sceneIdentifier:progressHandler:completion:", installable, 0, v8, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke(uint64_t a1, double a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2;
  v3[3] = &unk_1E9F9C210;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(double);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateWithInstallProgress:", *(double *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "progressBlock");
    v3 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v3[2](*(double *)(a1 + 40));

  }
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dialogObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "dialogObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopListening");

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_4;
  v8[3] = &unk_1E9F98FD8;
  v8[4] = WeakRetained;
  v9 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint8_t v18[16];
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_5;
  aBlock[3] = &unk_1E9FA38E8;
  v3 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v22 = v3;
  v19[0] = v2;
  v19[1] = 3221225472;
  v19[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_73;
  v19[3] = &unk_1E9F9FAB8;
  v4 = _Block_copy(aBlock);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v4;
  v5 = _Block_copy(v19);
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUIAppInstallerViewController - fetch app link data", v18, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "punchoutURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(*(id *)(a1 + 32), "punchoutURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithURL:resolvingAgainstBaseURL:", v9, 0);

    objc_msgSend(v10, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("https")))
    {

    }
    else
    {
      objc_msgSend(v10, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("http"));

      if (!v15)
      {
        (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(a1 + 32));
        goto LABEL_10;
      }
    }
    v16 = (void *)MEMORY[0x1E0CA5838];
    objc_msgSend(*(id *)(a1 + 32), "punchoutURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "afterAppLinksBecomeAvailableForURL:limit:performBlock:", v17, -1, v5);

LABEL_10:
    goto LABEL_11;
  }
  (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(a1 + 32));
LABEL_11:

}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id buf[2];

  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUIAppInstallerViewController - Posting app install finished.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_69;
  v10[3] = &unk_1E9F99000;
  objc_copyWeak(&v13, buf);
  v11 = *(id *)(a1 + 40);
  v9 = v5;
  v12 = v9;
  objc_msgSend(v8, "_finishInstallationWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_69(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id buf;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "confirmationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4 == 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUIAppInstallerViewController - Hiding app install display. Headless: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, WeakRetained);
  v6 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_70;
  v7[3] = &unk_1E9F99CE0;
  objc_copyWeak(&v10, &buf);
  v8 = a1[4];
  v9 = a1[5];
  v11 = v4 == 0;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&buf);

}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_70(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_initWeak(&location, WeakRetained);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2_71;
  v3[3] = &unk_1E9F99CE0;
  objc_copyWeak(&v6, &location);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(WeakRetained, "_dismissAppInstallWithCompletion:", v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2_71(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v3;
  void *v4;
  void (**v5)(double);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40) == 0;
  v10 = WeakRetained;
  objc_msgSend(WeakRetained, "progressBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "progressBlock");
    v5 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v5[2](1.0);

  }
  objc_msgSend(v10, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v10, "completionBlock");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    if (!v9)
      v9 = *(_QWORD *)(a1 + 40);
    (*(void (**)(uint64_t, _BOOL8, BOOL, uint64_t))(v7 + 16))(v7, v3, *(_BYTE *)(a1 + 56) != 0, v9);

  }
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[2];
  uint64_t (*v13)(_QWORD *);
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_73_cold_1((uint64_t)v6, v7);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v13 = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_74;
  v14 = &unk_1E9F9C588;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v9;
  v17 = v8;
  v10 = (void *)MEMORY[0x1E0CB3978];
  v11 = v6;
  if (objc_msgSend(v10, "isMainThread"))
    v13(block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_74(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_dismissAppInstallWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  VUIAppInstallConfirmationViewController *confirmationController;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[VUIAppInstallConfirmationViewController presentingViewController](self->_confirmationController, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__VUIAppInstallerViewController__dismissAppInstallWithCompletion___block_invoke;
    v7[3] = &unk_1E9F98E68;
    v8 = v4;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else if (v4)
  {
    v4[2](v4);
  }
  confirmationController = self->_confirmationController;
  self->_confirmationController = 0;

}

uint64_t __66__VUIAppInstallerViewController__dismissAppInstallWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateWithInstallProgress:(double)a3
{
  void *v5;
  id v6;

  if (a3 == 0.0)
    -[VUIAppInstallConfirmationViewController setInstallingState](self->_confirmationController, "setInstallingState");
  -[VUIAppInstallConfirmationViewController lockup](self->_confirmationController, "lockup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInstallProgress:", a3);

}

- (void)_finishInstallationWithCompletion:(id)a3
{
  VUIAppInstallConfirmationViewController *confirmationController;
  id v4;
  void *v5;
  id v6;

  confirmationController = self->_confirmationController;
  v4 = a3;
  -[VUIAppInstallConfirmationViewController lockup](confirmationController, "lockup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishInstallationWithCompletion:", v4);

}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (NSString)localizedContentTitle
{
  return self->_localizedContentTitle;
}

- (void)setLocalizedContentTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (NSString)confirmationBody
{
  return self->_confirmationBody;
}

- (void)setConfirmationBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (NSString)updateBody
{
  return self->_updateBody;
}

- (void)setUpdateBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (NSString)updateTitle
{
  return self->_updateTitle;
}

- (void)setUpdateTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (NSString)confirmationInstallButtonTitle
{
  return self->_confirmationInstallButtonTitle;
}

- (void)setConfirmationInstallButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1464);
}

- (BOOL)displayAppStoreLink
{
  return self->_displayAppStoreLink;
}

- (void)setDisplayAppStoreLink:(BOOL)a3
{
  self->_displayAppStoreLink = a3;
}

- (BOOL)displaySecondaryLink
{
  return self->_displaySecondaryLink;
}

- (void)setDisplaySecondaryLink:(BOOL)a3
{
  self->_displaySecondaryLink = a3;
}

- (NSString)secondaryLinkTitle
{
  return self->_secondaryLinkTitle;
}

- (void)setSecondaryLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (id)secondaryLinkHandler
{
  return self->_secondaryLinkHandler;
}

- (void)setSecondaryLinkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (double)lastProgress
{
  return self->_lastProgress;
}

- (void)setLastProgress:(double)a3
{
  self->_lastProgress = a3;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1504);
}

- (VUIAppInstallConfirmationViewController)confirmationController
{
  return self->_confirmationController;
}

- (void)setConfirmationController:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationController, a3);
}

- (VUIASDDialogObserver)dialogObserver
{
  return self->_dialogObserver;
}

- (void)setDialogObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dialogObserver, a3);
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (void)setPunchoutURL:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutURL, 0);
  objc_storeStrong((id *)&self->_dialogObserver, 0);
  objc_storeStrong((id *)&self->_confirmationController, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_secondaryLinkHandler, 0);
  objc_storeStrong((id *)&self->_secondaryLinkTitle, 0);
  objc_storeStrong((id *)&self->_confirmationInstallButtonTitle, 0);
  objc_storeStrong((id *)&self->_updateTitle, 0);
  objc_storeStrong((id *)&self->_updateBody, 0);
  objc_storeStrong((id *)&self->_confirmationBody, 0);
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_localizedContentTitle, 0);
  objc_storeStrong((id *)&self->_installable, 0);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_73_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIAppInstallerViewController::afterAppLinksBecomeAvailableForURL returned with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
