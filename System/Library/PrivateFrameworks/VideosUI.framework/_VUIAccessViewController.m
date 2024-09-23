@implementation _VUIAccessViewController

- (_VUIAccessViewController)initWithBundleIDs:(id)a3 channels:(id)a4 consentCancelButtonType:(unint64_t)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _VUIAccessViewController *v16;
  uint64_t v17;
  NSMutableArray *bundleIDs;
  uint64_t v19;
  NSMutableArray *channelIds;
  uint64_t v21;
  id completionHandler;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_VUIAccessViewController;
  v16 = -[_VUIAccessViewController init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_opt_new();
    bundleIDs = v16->_bundleIDs;
    v16->_bundleIDs = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    channelIds = v16->_channelIds;
    v16->_channelIds = (NSMutableArray *)v19;

    if (objc_msgSend(v12, "count"))
      -[NSMutableArray addObjectsFromArray:](v16->_bundleIDs, "addObjectsFromArray:", v12);
    objc_storeStrong((id *)&v16->_options, a6);
    NSLog(CFSTR("VUIAccessViewController: options %@"), v16->_options);
    v16->_consentCancelButtonType = a5;
    objc_storeStrong((id *)&v16->_channels, a4);
    v21 = objc_msgSend(v15, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v21;

    -[_VUIAccessViewController _init](v16, "_init");
  }

  return v16;
}

- (_VUIAccessViewController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VUIAccessViewControllerInitException"), CFSTR("-init not supported. Use -initWithCompletionHandler:"));

  return 0;
}

- (void)_init
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1D96EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[VUIAccessViewController]: Nil icon for TV.app", v0, 2u);
}

- (void)viewDidLoad
{
  VUIAppSpinnerView *v3;
  VUIAppSpinnerView *loadingView;
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
  NSUInteger v22;
  VUIAppSpinnerView *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)_VUIAccessViewController;
  -[_VUIAccessViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[_VUIAccessViewController _setupNavigationBar](self, "_setupNavigationBar");
  v3 = objc_alloc_init(VUIAppSpinnerView);
  loadingView = self->_loadingView;
  self->_loadingView = v3;

  -[VUIAppSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_VUIAccessViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_loadingView);

  -[VUIAppSpinnerView leadingAnchor](self->_loadingView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[VUIAppSpinnerView topAnchor](self->_loadingView, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[VUIAppSpinnerView trailingAnchor](self->_loadingView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[VUIAppSpinnerView bottomAnchor](self->_loadingView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  v22 = -[NSArray count](self->_appChannels, "count");
  v23 = self->_loadingView;
  if (v22)
  {
    -[VUIAppSpinnerView setHidden:](v23, "setHidden:", 0);
    -[_VUIAccessViewController _fetchRemoteAppInfo](self, "_fetchRemoteAppInfo");
  }
  else
  {
    -[VUIAppSpinnerView setHidden:](v23, "setHidden:", 1);
    -[_VUIAccessViewController _setupAccessViews](self, "_setupAccessViews");
  }
  -[_VUIAccessViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"Access\"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", v25);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSMutableArray *bundleIDs;
  __CFString *v6;
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
  v11.super_class = (Class)_VUIAccessViewController;
  -[_VUIAccessViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[VUIAccessView_iOS bodyScroll](self->_accessView, "bodyScroll");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

  v14 = CFSTR("appIds");
  bundleIDs = self->_bundleIDs;
  if (bundleIDs)
  {
    -[NSMutableArray componentsJoinedByString:](self->_bundleIDs, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E9FF3598;
  }
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (bundleIDs)

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("pageDetails");
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", CFSTR("VPPA"), CFSTR("VPPA"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordPage:", v10);

}

- (void)_allow:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  char v14;
  id location;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("requireVPPAStateUpdate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_invalidateCache");

  }
  -[_VUIAccessViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  -[_VUIAccessViewController _toggleLoadingScreen](self, "_toggleLoadingScreen");
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("NewVPPAConsentPrompt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = objc_msgSend(v9, "BOOLValue") ^ 1;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___VUIAccessViewController__allow___block_invoke;
  block[3] = &unk_1E9F9A758;
  objc_copyWeak(&v13, &location);
  v14 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_disallow:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[_VUIAccessViewController _toggleLoadingScreen](self, "_toggleLoadingScreen", a3);
  if (self->_shouldDenyOnCancel)
  {
    -[_VUIAccessViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", 0);

  }
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38___VUIAccessViewController__disallow___block_invoke;
  v6[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleSeeAllButton:(id)a3
{
  VUIAppsGridViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(VUIAppsGridViewController);
  -[_VUIAccessViewController _iconSize](self, "_iconSize");
  -[VUIAppsGridViewController setIconSize:](v4, "setIconSize:");
  -[VUIAppsGridViewController setApps:](v4, "setApps:", self->_appInfos);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 2)
  {
    -[_VUIAccessViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    -[_VUIAccessViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v4, 1);

  }
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("targetId");
  v10[1] = CFSTR("targetType");
  v11[0] = CFSTR("seeAll");
  v11[1] = CFSTR("button");
  v10[2] = CFSTR("actionType");
  v11[2] = CFSTR("seeAll");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordClick:", v9);

}

- (void)_handleMenuGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  if (!+[VUIAccessViewController isHostedInRemoteViewService](VUIAccessViewController, "isHostedInRemoteViewService", a3))-[_VUIAccessViewController _completeWithStatus:](self, "_completeWithStatus:", 0);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("targetId");
  v9[1] = CFSTR("targetType");
  v10[0] = CFSTR("cancel");
  v10[1] = CFSTR("button");
  v10[2] = CFSTR("cancel");
  v9[2] = CFSTR("actionType");
  v9[3] = CFSTR("actionDetails");
  v7 = CFSTR("button");
  v8 = CFSTR("menu");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordClick:", v6);

}

- (void)_handleNackButton:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  -[_VUIAccessViewController _completeWithStatus:](self, "_completeWithStatus:", 2);
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

- (void)_completeWithStatus:(unint64_t)a3
{
  _QWORD *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __48___VUIAccessViewController__completeWithStatus___block_invoke;
  v7 = &unk_1E9F9C210;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v4 = v5;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v6((uint64_t)v4);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_setupNavigationBar
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _BOOL4 shouldDenyOnCancel;
  void *v7;
  void *v8;
  id v9;

  if (self->_consentCancelButtonType == 1)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ACCESS_CANCEL");
  }
  else
  {
    shouldDenyOnCancel = self->_shouldDenyOnCancel;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (shouldDenyOnCancel)
      v5 = CFSTR("ACCESS_DENY_FINAL");
    else
      v5 = CFSTR("ACCESS_DENY");
  }
  objc_msgSend(v3, "localizedStringForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v9, 0, self, sel__disallow_);
  -[_VUIAccessViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.access.disallow"));
}

- (void)_setupAccessViews
{
  VUIAccessView_iOS *v3;
  VUIAccessView_iOS *accessView;
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
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;

  v3 = -[VUIAccessView_iOS initWithApps:]([VUIAccessView_iOS alloc], "initWithApps:", self->_appInfos);
  accessView = self->_accessView;
  self->_accessView = v3;

  -[VUIAccessView_iOS setTranslatesAutoresizingMaskIntoConstraints:](self->_accessView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_VUIAccessViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_accessView);

  -[VUIAccessView_iOS leadingAnchor](self->_accessView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[VUIAccessView_iOS topAnchor](self->_accessView, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[VUIAccessView_iOS trailingAnchor](self->_accessView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[VUIAccessView_iOS bottomAnchor](self->_accessView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[VUIAccessView_iOS allowButton](self->_accessView, "allowButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__allow_, 0x2000);

  -[VUIAccessView_iOS seeAllButton](self->_accessView, "seeAllButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__handleSeeAllButton_, 0x2000);

  -[VUIAccessView_iOS nackButton](self->_accessView, "nackButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__handleNackButton_, 0x2000);

  v25 = -[NSArray count](self->_appInfos, "count");
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("title"));
  v57 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("body"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("secondaryBody"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("account"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "length"))
  {
    v29 = v57;
  }
  else
  {
    if (v25 == 2)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:", CFSTR("ACCESS_MAIN_TITLE_PLURAL_2_FORMAT"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray firstObject](self->_appInfos, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("appName"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray lastObject](self->_appInfos, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("appName"));
      v37 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%@ %@"), 0, v33, v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v37;
    }
    else
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 == 1)
      {
        objc_msgSend(v30, "localizedStringForKey:", CFSTR("ACCESS_MAIN_TITLE_SINGULAR_FORMAT"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSArray firstObject](self->_appInfos, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("appName"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%@"), 0, v33);
      }
      else
      {
        objc_msgSend(v30, "localizedStringForKey:", CFSTR("ACCESS_MAIN_TITLE_PLURAL_3+_FORMAT"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSArray firstObject](self->_appInfos, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("appName"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v31, v33, (v25 - 1));
      }
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v57;
    }

    v29 = (id)v38;
  }
  v58 = v29;
  -[VUIAccessView_iOS setTitle:](self->_accessView, "setTitle:");
  if (!objc_msgSend(v26, "length"))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:", CFSTR("ACCESS_BODY_TEXT"));
    v42 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v42;
  }
  -[VUIAccessView_iOS setBody:](self->_accessView, "setBody:", v26);
  if (!objc_msgSend(v27, "length"))
  {
    if (v25 == 2)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:", CFSTR("ACCESS_SECONDARY_BODY_PLURAL_2_FORMAT"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray firstObject](self->_appInfos, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("appName"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray lastObject](self->_appInfos, "lastObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("appName"));
      v50 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v44, CFSTR("%@ %@ %@"), 0, v46, v50, v28);
      v51 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v50;
    }
    else
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      if (v25 == 1)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:", CFSTR("ACCESS_SECONDARY_BODY_SINGULAR_FORMAT"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSArray firstObject](self->_appInfos, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("appName"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v44, CFSTR("%@ %@"), 0, v46, v28, v56);
      }
      else
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "localizedStringForKey:", CFSTR("ACCESS_SECONDARY_BODY_PLURAL_3+_FORMAT"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSArray firstObject](self->_appInfos, "firstObject");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("appName"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v44, CFSTR("%@ %d %@"), 0, v46, (v25 - 1), v28);
      }
      v51 = objc_claimAutoreleasedReturnValue();
    }

    v27 = (void *)v51;
  }
  -[VUIAccessView_iOS setSecondaryBody:](self->_accessView, "setSecondaryBody:", v27);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleMenuGesture_);
  objc_msgSend(v54, "setAllowedPressTypes:", &unk_1EA0BBBE0);
  -[_VUIAccessViewController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addGestureRecognizer:", v54);

}

- (void)_toggleLoadingScreen
{
  VUIAccessView_iOS *v3;
  void *v4;
  VUIAccessView_iOS *v5;
  VUIAppSpinnerView *v6;
  VUIAppSpinnerView *v7;
  id v8;

  v7 = self->_loadingView;
  v3 = self->_accessView;
  if ((-[VUIAppSpinnerView isHidden](self->_loadingView, "isHidden") & 1) != 0)
  {
    v4 = v7;
  }
  else
  {
    v5 = self->_accessView;

    v6 = self->_loadingView;
    v4 = v5;
    v3 = (VUIAccessView_iOS *)v6;
  }
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "transitionFromView:toView:duration:options:completion:", v3, v4, 5243136, 0, 0.5);

}

- (void)_presentGenericErrorWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", CFSTR("AccessUnknownErrorTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("AccessUnknownErrorMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("AccessUnknownErrorButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "vui_addAction:", v10);
  objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", self, 1, 0);

}

- (id)_imageForBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC3BF8];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "_applicationIconImageForBundleIdentifier:format:scale:", v4, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)_iconSize
{
  double v2;
  double v3;
  CGSize result;

  +[VUIAccessView_iOS iconSize](VUIAccessView_iOS, "iconSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_fetchRemoteAppInfo
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_appChannels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "appBundleIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "channelID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (-[NSMutableArray containsObject:](self->_channelIds, "containsObject:", v10) & 1) == 0)
          -[NSMutableArray addObject:](self->_channelIds, "addObject:", v10);
        if (objc_msgSend(v9, "count"))
          -[NSMutableArray addObjectsFromArray:](self->_bundleIDs, "addObjectsFromArray:", v9);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke;
  v12[3] = &unk_1E9F99C98;
  objc_copyWeak(&v13, &location);
  dispatch_async(v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_watchListAppIcon
{
  void *v3;
  void *v4;

  WLKTVAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAccessViewController _imageForBundleID:](self, "_imageForBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cappedTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (cappedTraitCollection_onceToken != -1)
    dispatch_once(&cappedTraitCollection_onceToken, &__block_literal_global_166);
  -[_VUIAccessViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)cappedTraitCollection_cappedSizes, "containsObject:", v4))
  {
    v5 = (void *)MEMORY[0x1E0DC3E88];
    -[_VUIAccessViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollectionWithTraitsFromCollections:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_VUIAccessViewController;
  -[_VUIAccessViewController preferredFocusEnvironments](&v9, sel_preferredFocusEnvironments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccessView_iOS allowButton](self->_accessView, "allowButton");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_channelIds, 0);
  objc_storeStrong((id *)&self->_appChannels, 0);
  objc_storeStrong((id *)&self->_appInfos, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_accessView, 0);
}

@end
