@implementation PKPassbookSettingsController

- (PKPassbookSettingsController)initWithDelegate:(id)a3 dataSource:(id)a4 context:(int64_t)a5
{
  id v8;
  id v9;
  PKPassbookSettingsController *v10;
  PKPassbookSettingsDataSource *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *latestTransitBalanceModel;
  void *v14;
  void *v15;
  id WeakRetained;
  char v17;
  id v18;
  uint64_t v19;
  PKPaymentWebService *webService;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  PKExpressPassController *expressPassController;
  PKContactAvatarManager *v29;
  void *v30;
  id v31;
  uint64_t v32;
  PKContactAvatarManager *avatarManager;
  uint64_t v34;
  PKLaunchAuthorizationPromptController *v35;
  id v36;
  uint64_t v37;
  PKLaunchAuthorizationPromptController *launchAuthorizationPromptController;
  uint64_t v39;
  PKPassbookPeerPaymentSettingsDelegate *peerPaymentDelegate;
  void *v41;
  uint64_t v42;
  PKPeerPaymentWebService *peerPaymentWebService;
  void *v44;
  uint64_t v45;
  PKPeerPaymentAccount *peerPaymentAccount;
  PKPeerPaymentAccountResolutionController *v47;
  PKPeerPaymentAccount *v48;
  PKPeerPaymentWebService *v49;
  id v50;
  uint64_t v51;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  PKPeerPaymentAccountResolutionController *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  PKAccountService *accountService;
  PKInboxDataSource *v60;
  PKInboxDataSource *inboxDataSource;
  FKBankConnectInstitutionsProvider *v62;
  FKBankConnectInstitutionsProvider *institutionsDataProvider;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  SESNFCAppSettingsContext *defaultWalletContext;
  void *v68;
  const char *v69;
  NSObject *v70;
  id v71;
  void *v72;
  PKPaymentDataProvider *v73;
  PKPaymentDataProvider *companionPaymentDataProvider;
  NSMutableDictionary *v75;
  NSMutableDictionary *pairedDeviceSupportsFeatureByAccountID;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  PKContactFormatValidator *contactFormatValidator;
  PKHideMyEmailManager *v82;
  PKHideMyEmailManager *hideMyEmailManager;
  PKHideMyEmailManager *v84;
  _QWORD v86[4];
  PKPassbookSettingsController *v87;
  _QWORD handler[4];
  id v89;
  _QWORD v90[4];
  id v91;
  id location;
  objc_super v93;

  v8 = a3;
  v9 = a4;
  v93.receiver = self;
  v93.super_class = (Class)PKPassbookSettingsController;
  v10 = -[PKPassbookSettingsController init](&v93, sel_init);
  if (!v10)
    goto LABEL_22;
  objc_initWeak(&location, v10);
  objc_storeWeak((id *)&v10->_delegate, v8);
  objc_storeStrong((id *)&v10->_dataSource, a4);
  -[PKPassbookSettingsDataSource setupDelegate](v10->_dataSource, "setupDelegate");
  v11 = (PKPassbookSettingsDataSource *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10->_dataSource;
    -[PKPassbookSettingsDataSource setSetupDelegate:](v11, "setSetupDelegate:", v10);
LABEL_5:

  }
  v10->_context = a5;
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  latestTransitBalanceModel = v10->_latestTransitBalanceModel;
  v10->_latestTransitBalanceModel = v12;

  -[PKPassbookSettingsDataSource passLibraryDataProvider](v10->_dataSource, "passLibraryDataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v10->_passLibraryDataProvider, v14);

  -[PKPassbookSettingsDataSource paymentDataProvider](v10->_dataSource, "paymentDataProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v10->_paymentDataProvider, v15);

  WeakRetained = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
    objc_msgSend(v18, "paymentWebService");
    v19 = objc_claimAutoreleasedReturnValue();
    webService = v10->_webService;
    v10->_webService = (PKPaymentWebService *)v19;

  }
  v21 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v23 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
    objc_msgSend(v23, "addDelegate:", v10);

  }
  v24 = objc_alloc(MEMORY[0x1E0D66D50]);
  v25 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  v26 = objc_loadWeakRetained((id *)&v10->_passLibraryDataProvider);
  v27 = objc_msgSend(v24, "initWithPaymentDataProvider:passLibraryDataProvider:isForWatch:", v25, v26, v10->_context == 1);
  expressPassController = v10->_expressPassController;
  v10->_expressPassController = (PKExpressPassController *)v27;

  v29 = [PKContactAvatarManager alloc];
  objc_msgSend(MEMORY[0x1E0D66C60], "defaultContactResolver");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  v32 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:](v29, "initWithContactResolver:paymentDataProvider:", v30, v31);
  avatarManager = v10->_avatarManager;
  v10->_avatarManager = (PKContactAvatarManager *)v32;

  -[PKPassbookSettingsController _reloadPassData](v10, "_reloadPassData");
  if (v10->_context == 1)
    v34 = 4;
  else
    v34 = 3;
  v35 = [PKLaunchAuthorizationPromptController alloc];
  v36 = objc_loadWeakRetained((id *)&v10->_passLibraryDataProvider);
  v37 = -[PKLaunchAuthorizationPromptController initWithContext:dataProvider:delegate:](v35, "initWithContext:dataProvider:delegate:", v34, v36, v10);
  launchAuthorizationPromptController = v10->_launchAuthorizationPromptController;
  v10->_launchAuthorizationPromptController = (PKLaunchAuthorizationPromptController *)v37;

  -[PKPassbookSettingsDataSource peerPaymentDelegate](v10->_dataSource, "peerPaymentDelegate");
  v39 = objc_claimAutoreleasedReturnValue();
  peerPaymentDelegate = v10->_peerPaymentDelegate;
  v10->_peerPaymentDelegate = (PKPassbookPeerPaymentSettingsDelegate *)v39;

  -[PKPassbookSettingsDataSource peerPaymentDataSource](v10->_dataSource, "peerPaymentDataSource");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "peerPaymentWebService");
  v42 = objc_claimAutoreleasedReturnValue();
  peerPaymentWebService = v10->_peerPaymentWebService;
  v10->_peerPaymentWebService = (PKPeerPaymentWebService *)v42;

  -[PKPeerPaymentWebService targetDevice](v10->_peerPaymentWebService, "targetDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "account");
  v45 = objc_claimAutoreleasedReturnValue();
  peerPaymentAccount = v10->_peerPaymentAccount;
  v10->_peerPaymentAccount = (PKPeerPaymentAccount *)v45;

  v47 = [PKPeerPaymentAccountResolutionController alloc];
  v48 = v10->_peerPaymentAccount;
  v49 = v10->_peerPaymentWebService;
  v50 = objc_loadWeakRetained((id *)&v10->_passLibraryDataProvider);
  v51 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:](v47, "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v48, v49, v34, v10, v50);
  peerPaymentAccountResolutionController = v10->_peerPaymentAccountResolutionController;
  v10->_peerPaymentAccountResolutionController = (PKPeerPaymentAccountResolutionController *)v51;

  v53 = v10->_peerPaymentAccountResolutionController;
  -[PKPassbookSettingsDataSource setupDelegate](v10->_dataSource, "setupDelegate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccountResolutionController setSetupDelegate:](v53, "setSetupDelegate:", v54);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService targetDevice](v10->_peerPaymentWebService, "targetDevice");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObserver:selector:name:object:", v10, sel__peerPaymentAccountDidChangeNotification_, *MEMORY[0x1E0D6B2B8], v56);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObserver:selector:name:object:", v10, sel__peerPaymentWebServiceDidChangeNotification_, *MEMORY[0x1E0D6B840], v10->_peerPaymentWebService);

  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v58 = objc_claimAutoreleasedReturnValue();
  accountService = v10->_accountService;
  v10->_accountService = (PKAccountService *)v58;

  -[PKAccountService registerObserver:](v10->_accountService, "registerObserver:", v10);
  -[PKPassbookSettingsController _fetchAccounts](v10, "_fetchAccounts");
  v60 = -[PKInboxDataSource initWithDelegate:]([PKInboxDataSource alloc], "initWithDelegate:", v10);
  inboxDataSource = v10->_inboxDataSource;
  v10->_inboxDataSource = v60;

  if (!a5)
  {
    v62 = (FKBankConnectInstitutionsProvider *)objc_alloc_init(MEMORY[0x1E0CADD08]);
    institutionsDataProvider = v10->_institutionsDataProvider;
    v10->_institutionsDataProvider = v62;

    -[FKBankConnectInstitutionsProvider setDelegate:](v10->_institutionsDataProvider, "setDelegate:", v10);
    -[PKPassbookSettingsController _fetchInstitutions](v10, "_fetchInstitutions");
    v64 = (void *)MEMORY[0x1E0D89660];
    v65 = *MEMORY[0x1E0D6B590];
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke;
    v90[3] = &unk_1E3E61310;
    objc_copyWeak(&v91, &location);
    objc_msgSend(v64, "contextWithBundleId:onChange:", v65, v90);
    v66 = objc_claimAutoreleasedReturnValue();
    defaultWalletContext = v10->_defaultWalletContext;
    v10->_defaultWalletContext = (SESNFCAppSettingsContext *)v66;

    objc_destroyWeak(&v91);
  }
  -[PKPassbookSettingsController _updateCardsGroupSpecifier](v10, "_updateCardsGroupSpecifier", sel_addDelegate_);
  -[PKPassbookSettingsController _updateCompanionGroupSpecifier](v10, "_updateCompanionGroupSpecifier");
  -[PKPassbookSettingsController _updatePendingCompanionGroupSpecifier](v10, "_updatePendingCompanionGroupSpecifier");
  -[PKPassbookSettingsController _updateAddButtonSpecifier](v10, "_updateAddButtonSpecifier");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObserver:selector:name:object:", v10, sel_applicationDidBecomeActive, *MEMORY[0x1E0DC4750], 0);
  objc_msgSend(v68, "addObserver:selector:name:object:", v10, sel__regionConfigurationDidChangeNotification, *MEMORY[0x1E0D6B838], 0);
  objc_msgSend(v68, "addObserver:selector:name:object:", v10, sel__expressPassDidChange, CFSTR("PKExpressPassesViewControllerExpressPassChangedNotification"), 0);
  v10->_notifyToken = -1;
  v69 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D69CB8], "UTF8String");
  v70 = MEMORY[0x1E0C80D38];
  v71 = MEMORY[0x1E0C80D38];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_3;
  handler[3] = &unk_1E3E62660;
  objc_copyWeak(&v89, &location);
  notify_register_dispatch(v69, &v10->_notifyToken, v70, handler);

  objc_msgSend(v9, "optionsDelegate");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v10->_optionsDelegate, v72);

  if (a5 == 1)
  {
    v73 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    companionPaymentDataProvider = v10->_companionPaymentDataProvider;
    v10->_companionPaymentDataProvider = v73;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentDataProvider addDelegate:](v10->_companionPaymentDataProvider, "addDelegate:", v10);
  }
  v75 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pairedDeviceSupportsFeatureByAccountID = v10->_pairedDeviceSupportsFeatureByAccountID;
  v10->_pairedDeviceSupportsFeatureByAccountID = v75;

  -[PKPassbookSettingsController _checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary](v10, "_checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary");
  -[PKPaymentWebService context](v10->_webService, "context");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "configuration");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "contactFormatConfiguration");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v79);
  contactFormatValidator = v10->_contactFormatValidator;
  v10->_contactFormatValidator = (PKContactFormatValidator *)v80;

  v82 = (PKHideMyEmailManager *)objc_alloc_init(MEMORY[0x1E0D66DC8]);
  hideMyEmailManager = v10->_hideMyEmailManager;
  v10->_hideMyEmailManager = v82;

  if (!a5 && -[NSArray count](v10->_paymentPasses, "count"))
  {
    v84 = v10->_hideMyEmailManager;
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_4;
    v86[3] = &unk_1E3E65130;
    v87 = v10;
    -[PKHideMyEmailManager isAvailable:](v84, "isAvailable:", v86);

  }
  objc_destroyWeak(&v89);

  objc_destroyWeak(&location);
LABEL_22:

  return v10;
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_2;
    block[3] = &unk_1E3E612E8;
    v4 = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", *(_QWORD *)(a1 + 32));

}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_expressPassDidChange");
    WeakRetained = v2;
  }

}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;

  v2 = 1;
  if (!a2)
    v2 = 2;
  v3 = MEMORY[0x1E0C809B0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632) = v2;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_5;
  block[3] = &unk_1E3E612E8;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392));

}

- (void)dealloc
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  id v6;
  int notifyToken;
  LAContext *LAContext;
  LAContext *v9;
  void *v10;
  objc_super v11;

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v6, "removeDelegate:", self);

  }
  if (self->_companionPaymentDataProvider && (objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentDataProvider removeDelegate:](self->_companionPaymentDataProvider, "removeDelegate:", self);
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  LAContext = self->_LAContext;
  if (LAContext)
  {
    -[LAContext invalidate](LAContext, "invalidate");
    v9 = self->_LAContext;
    self->_LAContext = 0;

  }
  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  -[SESNFCAppSettingsContext invalidate](self->_defaultWalletContext, "invalidate");
  v11.receiver = self;
  v11.super_class = (Class)PKPassbookSettingsController;
  -[PKPassbookSettingsController dealloc](&v11, sel_dealloc);
}

- (void)applicationDidBecomeActive
{
  -[PKPassbookSettingsController _fetchAccounts](self, "_fetchAccounts");
  -[PKPassbookSettingsController refreshPasses](self, "refreshPasses");
  if (-[PKPassbookSettingsController canPresentLaunchPrompts](self, "canPresentLaunchPrompts"))
  {
    -[PKLaunchAuthorizationPromptController enableLaunchPromptsForSession](self->_launchAuthorizationPromptController, "enableLaunchPromptsForSession");
    -[PKLaunchAuthorizationPromptController presentLaunchPromptsForPassesIfNeeded:](self->_launchAuthorizationPromptController, "presentLaunchPromptsForPassesIfNeeded:", self->_paymentPasses);
  }
}

- (void)viewDidAppear
{
  -[PKLaunchAuthorizationPromptController presentLaunchPromptsForPassesIfNeeded:](self->_launchAuthorizationPromptController, "presentLaunchPromptsForPassesIfNeeded:", self->_paymentPasses);
}

- (void)_updateCompanionPassesAddButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[PKPassbookSettingsController _companionPassSpecifiers](self, "_companionPassSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke;
  v7[3] = &unk_1E3E69260;
  v7[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  -[PKPassbookSettingsController _pendingCompanionPassSpecifiers](self, "_pendingCompanionPassSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke_2;
  v6[3] = &unk_1E3E69260;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *MEMORY[0x1E0D80940];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "objectForKeyedSubscript:", *MEMORY[0x1E0D80808]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80868]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(v9, "showActivitySpinner:", v8);

}

void __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *MEMORY[0x1E0D80940];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "objectForKeyedSubscript:", *MEMORY[0x1E0D80808]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80868]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(v9, "showActivitySpinner:", v8);

}

- (void)_updateAddButtonSpecifier
{
  uint64_t v3;
  PSSpecifier *addCardButtonSpecifier;
  uint64_t v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;
  void *v9;
  NSString *provisioningPassIdentifier;
  uint64_t v11;
  PSSpecifier *v12;
  id v13;

  PKLocalizedPaymentString(CFSTR("SETTINGS_ADD_PAYMENT_PASS"));
  v3 = objc_claimAutoreleasedReturnValue();
  addCardButtonSpecifier = self->_addCardButtonSpecifier;
  v13 = (id)v3;
  if (addCardButtonSpecifier)
  {
    v5 = *MEMORY[0x1E0D808B0];
    v6 = (void *)v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v3, self, 0, 0, 0, 13, 0, v3);
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v8 = self->_addCardButtonSpecifier;
    self->_addCardButtonSpecifier = v7;

    -[PSSpecifier setButtonAction:](self->_addCardButtonSpecifier, "setButtonAction:", sel_addCardTapped);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_addCardButtonSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    addCardButtonSpecifier = self->_addCardButtonSpecifier;
    v5 = *MEMORY[0x1E0D806F8];
    v6 = &unk_1E3FAD000;
  }
  -[PSSpecifier setObject:forKeyedSubscript:](addCardButtonSpecifier, "setObject:forKeyedSubscript:", v6, v5);
  -[PSSpecifier objectForKeyedSubscript:](self->_addCardButtonSpecifier, "objectForKeyedSubscript:", CFSTR("PKSettingsSpecifierLoadingKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  provisioningPassIdentifier = self->_provisioningPassIdentifier;

  if (!provisioningPassIdentifier)
  {
    if (PKSecureElementIsAvailable() || self->_context == 1)
      v11 = PKStoreDemoModeEnabled() ^ 1;
    else
      v11 = 0;
    v12 = self->_addCardButtonSpecifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v12, "setProperty:forKey:", v9, *MEMORY[0x1E0D80808]);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_updateCardsGroupSpecifier
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *paymentCardsGroupSpecifier;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  PSSpecifier *v13;
  PSSpecifier *otherCardsGroupSpecifier;
  id v15;

  if (self->_context == 1)
    v3 = CFSTR("SETTINGS_PAYMENT_CARDS_GROUP_PLURAL_WATCH");
  else
    v3 = CFSTR("SETTINGS_PAYMENT_CARDS_GROUP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPassbookSettingsDataSource secureElementIsProductionSigned](self->_dataSource, "secureElementIsProductionSigned"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedEnvironmentHint();
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v5 = v15;
  }
  else
  {
    PKLocalizedPaymentString(&v3->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v5);
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  paymentCardsGroupSpecifier = self->_paymentCardsGroupSpecifier;
  self->_paymentCardsGroupSpecifier = v7;

  v9 = *MEMORY[0x1E0D80868];
  -[PSSpecifier setProperty:forKey:](self->_paymentCardsGroupSpecifier, "setProperty:forKey:", v3, *MEMORY[0x1E0D80868]);
  if (self->_context == 1)
    v10 = CFSTR("SETTINGS_OTHER_CARDS_GROUP_PLURAL_WATCH");
  else
    v10 = CFSTR("SETTINGS_OTHER_CARDS_GROUP");
  PKLocalizedPaymentString(&v10->isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v12);
  v13 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  otherCardsGroupSpecifier = self->_otherCardsGroupSpecifier;
  self->_otherCardsGroupSpecifier = v13;

  -[PSSpecifier setProperty:forKey:](self->_otherCardsGroupSpecifier, "setProperty:forKey:", v10, v9);
}

- (void)_updateCompanionGroupSpecifier
{
  __CFString *v3;
  void *v4;
  PSSpecifier *v5;
  PSSpecifier *companionCardsGroupSpecifier;
  id v7;

  if (-[NSArray count](self->_paymentPasses, "count"))
    v3 = CFSTR("SETTINGS_PAYMENT_COMPANION_OTHER_CARDS_PLURAL_GROUP");
  else
    v3 = CFSTR("SETTINGS_PAYMENT_COMPANION_CARDS_PLURAL_GROUP");
  PKLocalizedPaymentString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v7);
  v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  companionCardsGroupSpecifier = self->_companionCardsGroupSpecifier;
  self->_companionCardsGroupSpecifier = v5;

  -[PSSpecifier setProperty:forKey:](self->_companionCardsGroupSpecifier, "setProperty:forKey:", v3, *MEMORY[0x1E0D80868]);
}

- (void)_updatePendingCompanionGroupSpecifier
{
  void *v3;
  PSSpecifier *v4;
  PSSpecifier *pendingCompanionCardsGroupSpecifier;
  id v6;

  PKLocalizedPaymentString(CFSTR("SETTINGS_PAYMENT_COMPANION_PENDING_CARDS_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v6);
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  pendingCompanionCardsGroupSpecifier = self->_pendingCompanionCardsGroupSpecifier;
  self->_pendingCompanionCardsGroupSpecifier = v4;

  -[PSSpecifier setProperty:forKey:](self->_pendingCompanionCardsGroupSpecifier, "setProperty:forKey:", CFSTR("SETTINGS_PAYMENT_COMPANION_PENDING_CARDS_GROUP"), *MEMORY[0x1E0D80868]);
}

- (id)_uppercaseGroupSpecifierTitleIfNecessary:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (PKIsVision())
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "pk_uppercaseStringForPreferredLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_refreshCompanionGroupSpecififiers
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_companionPassSpecifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", self, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_pendingCompanionPassSpecifiers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v16, "settingsController:requestsReloadSpecifier:", self, v15, (_QWORD)v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

}

- (id)_bridgeSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSArray **p_paymentPasses;
  PSSpecifier *v8;
  void *v9;
  void *v10;
  void *v11;
  PSSpecifier *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int IsAvailable;
  int64_t context;
  __CFString *v22;
  int v23;
  NSString *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSRange v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPassbookSettingsDataSource canRegisterForPeerPayment](self->_dataSource, "canRegisterForPeerPayment"))
  {
    -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!PKIsAltAccountPairedOrPairing() || v5)
    {
      -[PKPassbookSettingsController _peerPaymentGroupSpecifiers](self, "_peerPaymentGroupSpecifiers");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPassbookSettingsController _peerPaymentTinkerGroupSpecifiers](self, "_peerPaymentTinkerGroupSpecifiers");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v6;
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    p_paymentPasses = &self->_paymentPasses;
    if (!-[NSArray count](self->_paymentPasses, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);
      v8 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    p_paymentPasses = &self->_paymentPasses;
    if (!-[NSArray count](self->_paymentPasses, "count"))
    {
      v8 = 0;
      goto LABEL_12;
    }
  }
  v8 = self->_paymentCardsGroupSpecifier;
  objc_msgSend(v3, "addObject:", self->_paymentCardsGroupSpecifier);
  -[PKPassbookSettingsController _paymentPassSpecifiers](self, "_paymentPassSpecifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);
LABEL_11:

LABEL_12:
  objc_msgSend(v3, "addObject:", self->_addCardButtonSpecifier);
  if (-[NSArray count](self->_otherPasses, "count"))
  {
    objc_msgSend(v3, "addObject:", self->_otherCardsGroupSpecifier);
    -[PKPassbookSettingsController _otherPassSpecifiers](self, "_otherPassSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v11);

  }
  if (-[NSArray count](self->_companionPasses, "count"))
  {
    objc_msgSend(v3, "safelyAddObject:", self->_companionCardsGroupSpecifier);
    v12 = self->_companionCardsGroupSpecifier;

    -[PKPassbookSettingsController _companionPassSpecifiers](self, "_companionPassSpecifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v13);

    v8 = v12;
  }
  if (-[NSArray count](self->_pendingCompanionPasses, "count"))
  {
    objc_msgSend(v3, "safelyAddObject:", self->_pendingCompanionCardsGroupSpecifier);
    -[PKPassbookSettingsController _pendingCompanionPassSpecifiers](self, "_pendingCompanionPassSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v14);

  }
  v15 = -[PKPassbookSettingsController _supportsApplePay](self, "_supportsApplePay");
  if (!-[NSArray count](self->_paymentPasses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D65188], "pk_privacyFlowForContext:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedButtonTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IsAvailable = PKPearlIsAvailable();
    context = self->_context;
    if (!IsAvailable || context == 1)
    {
      if (context == 1)
        v23 = 1;
      else
        v23 = IsAvailable;
      v22 = CFSTR("SETTINGS_ABOUT_FOOTER");
    }
    else
    {
      v22 = CFSTR("SETTINGS_ABOUT_FOOTER_FACEID");
      v23 = 0;
    }
    PKDeviceSpecificLocalizedStringKeyForKey(v22, v23);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v25, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", v28, *MEMORY[0x1E0D80818]);

    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", v26, *MEMORY[0x1E0D80838]);
    v35.location = objc_msgSend(v26, "rangeOfString:", v19);
    NSStringFromRange(v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", v29, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", v30, *MEMORY[0x1E0D80830]);

    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", CFSTR("_openPrivacyLink"), *MEMORY[0x1E0D80820]);
    if (!v15)
      goto LABEL_36;
LABEL_31:
    PKPairedOrPairingDevice();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31
      && softLinkNRWatchOSVersionForRemoteDevice(v31) >= 0x30000
      && -[NSArray count](*p_paymentPasses, "count"))
    {
      -[PKPassbookSettingsController _handoffSwitchGroupSpecifiers](self, "_handoffSwitchGroupSpecifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v33);

    }
    goto LABEL_36;
  }
  if (self->_hasExpressCapablePass)
  {
    -[PKPassbookSettingsController _transitDefaultsGroupSpecifiers](self, "_transitDefaultsGroupSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v16);

  }
  -[PKPassbookSettingsController _defaultsGroupSpecifiers](self, "_defaultsGroupSpecifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v17);

  -[PSSpecifier removePropertyForKey:](v8, "removePropertyForKey:", *MEMORY[0x1E0D80818]);
  -[PSSpecifier removePropertyForKey:](v8, "removePropertyForKey:", *MEMORY[0x1E0D80838]);
  -[PSSpecifier removePropertyForKey:](v8, "removePropertyForKey:", *MEMORY[0x1E0D80828]);
  -[PSSpecifier removePropertyForKey:](v8, "removePropertyForKey:", *MEMORY[0x1E0D80830]);
  -[PSSpecifier removePropertyForKey:](v8, "removePropertyForKey:", *MEMORY[0x1E0D80820]);
  if (v15)
    goto LABEL_31;
LABEL_36:

  return v3;
}

- (BOOL)_supportsApplePay
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D67248];
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_isPaymentSetupSupportedForWebService:", v3);

  return (char)v2;
}

- (id)_settingsSpecifiers
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int IsAvailable;
  NSUInteger v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  char v18;
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
  int v29;
  int64_t context;
  __CFString *v31;
  int v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  PSSpecifier *paymentCardsGroupSpecifier;
  objc_class *v39;
  void *v40;
  PSSpecifier *v41;
  void *v42;
  PSSpecifier *v43;
  void *v44;
  void *v45;
  NSRange v47;

  v3 = PKUserInterfaceIdiom();
  v4 = PKUserInterfaceIdiom();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPassbookSettingsController _systemPolicyForAppSpecifiers](self, "_systemPolicyForAppSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  if (v3 == 1)
  {
    -[PKPassbookSettingsController _pendingInvitationsGroupSpecifiers](self, "_pendingInvitationsGroupSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  IsAvailable = PKSecureElementIsAvailable();
  v9 = -[NSArray count](self->_paymentPasses, "count");
  v10 = -[PKPassbookSettingsController _supportsApplePay](self, "_supportsApplePay");
  if (-[PKPassbookSettingsDataSource canRegisterForPeerPayment](self->_dataSource, "canRegisterForPeerPayment")&& IsAvailable)
  {
    -[PKPassbookSettingsController _peerPaymentGroupSpecifiers](self, "_peerPaymentGroupSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

  }
  else if (!IsAvailable && !v9)
  {
    goto LABEL_13;
  }
  objc_msgSend(v5, "addObject:", self->_paymentCardsGroupSpecifier);
  -[PKPassbookSettingsController _paymentPassSpecifiers](self, "_paymentPassSpecifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);
  if (IsAvailable)
    objc_msgSend(v5, "addObject:", self->_addCardButtonSpecifier);

LABEL_13:
  if (-[NSArray count](self->_otherPasses, "count"))
  {
    objc_msgSend(v5, "addObject:", self->_otherCardsGroupSpecifier);
    -[PKPassbookSettingsController _otherPassSpecifiers](self, "_otherPassSpecifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  if (PKBankCredentialCenterEnabled())
  {
    -[PKPassbookSettingsController _credentialCenterSpecifiers](self, "_credentialCenterSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v14);

  }
  -[PKPassbookSettingsController _openAccountsGroupSpecifiers](self, "_openAccountsGroupSpecifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v15);

  if (PKBankConnectEnabled() && !self->_context)
  {
    -[PKPassbookSettingsController _bankConnectGroupSpecifiers](self, "_bankConnectGroupSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v16);

  }
  v17 = v3 == 1 || v4 == 6;
  v18 = v17;
  if (v17)
  {
    if (v9)
    {
LABEL_39:
      -[PKPassbookSettingsController _defaultsGroupSpecifiers](self, "_defaultsGroupSpecifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v23);

    }
  }
  else
  {
    if (v10)
    {
      -[PKPassbookSettingsController _defaultAppSpecifiers](self, "_defaultAppSpecifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v5, "addObjectsFromArray:", v19);
      -[PKPassbookSettingsController _lockscreenSwitchGroupSpecifiers](self, "_lockscreenSwitchGroupSpecifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v20);

    }
    if (PKExpiredPassesRefreshEnabled())
    {
      -[PKPassbookSettingsController _expiredPassesSwitchGroupSpecifiers](self, "_expiredPassesSwitchGroupSpecifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v21);

    }
    if (v9)
    {
      if (self->_hasExpressCapablePass)
      {
        -[PKPassbookSettingsController _transitDefaultsGroupSpecifiers](self, "_transitDefaultsGroupSpecifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v22);

      }
      goto LABEL_39;
    }
  }
  -[PKPassbookSettingsController _cardBenefitSpecifiers](self, "_cardBenefitSpecifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v24);

  -[PKPassbookSettingsController _showPayLaterOptionsSpecifiers](self, "_showPayLaterOptionsSpecifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v25);

  if ((PKSafariCredentialProvisioningEnabled() & v10) == 1)
  {
    -[PKPassbookSettingsController _onlinePaymentsGroupSpecifiers](self, "_onlinePaymentsGroupSpecifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v26);

  }
  if (v9)
  {
    if ((v18 & 1) != 0)
    {
      if (v4 == 6)
        goto LABEL_51;
    }
    else
    {
      -[PKPassbookSettingsController _handoffSwitchGroupSpecifiers](self, "_handoffSwitchGroupSpecifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v33);

    }
    -[PKPassbookSettingsController _orderManagementGroupSpecifiers](self, "_orderManagementGroupSpecifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v34);

LABEL_51:
    -[PSSpecifier removePropertyForKey:](self->_paymentCardsGroupSpecifier, "removePropertyForKey:", *MEMORY[0x1E0D80818]);
    -[PSSpecifier removePropertyForKey:](self->_paymentCardsGroupSpecifier, "removePropertyForKey:", *MEMORY[0x1E0D80838]);
    -[PSSpecifier removePropertyForKey:](self->_paymentCardsGroupSpecifier, "removePropertyForKey:", *MEMORY[0x1E0D80828]);
    -[PSSpecifier removePropertyForKey:](self->_paymentCardsGroupSpecifier, "removePropertyForKey:", *MEMORY[0x1E0D80830]);
    -[PSSpecifier removePropertyForKey:](self->_paymentCardsGroupSpecifier, "removePropertyForKey:", *MEMORY[0x1E0D80820]);
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0D65188], "pk_privacyFlowForContext:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedButtonTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = PKPearlIsAvailable();
  context = self->_context;
  if (!v29 || context == 1)
  {
    if (context == 1)
      v32 = 1;
    else
      v32 = v29;
    v31 = CFSTR("SETTINGS_ABOUT_FOOTER");
  }
  else
  {
    v31 = CFSTR("SETTINGS_ABOUT_FOOTER_FACEID");
    v32 = 0;
  }
  PKDeviceSpecificLocalizedStringKeyForKey(v31, v32);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v36, v28);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  paymentCardsGroupSpecifier = self->_paymentCardsGroupSpecifier;
  v39 = (objc_class *)objc_opt_class();
  NSStringFromClass(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](paymentCardsGroupSpecifier, "setProperty:forKey:", v40, *MEMORY[0x1E0D80818]);

  -[PSSpecifier setProperty:forKey:](self->_paymentCardsGroupSpecifier, "setProperty:forKey:", v37, *MEMORY[0x1E0D80838]);
  v41 = self->_paymentCardsGroupSpecifier;
  v47.location = objc_msgSend(v37, "rangeOfString:", v28);
  NSStringFromRange(v47);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v41, "setProperty:forKey:", v42, *MEMORY[0x1E0D80828]);

  v43 = self->_paymentCardsGroupSpecifier;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v43, "setProperty:forKey:", v44, *MEMORY[0x1E0D80830]);

  -[PSSpecifier setProperty:forKey:](self->_paymentCardsGroupSpecifier, "setProperty:forKey:", CFSTR("_openPrivacyLink"), *MEMORY[0x1E0D80820]);
LABEL_57:
  -[PKPassbookSettingsController _closedAccountsGroupSpecifiers](self, "_closedAccountsGroupSpecifiers");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v45);

  return v5;
}

- (id)_pendingInvitationsGroupSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKInboxDataSource activeInboxMessages](self->_inboxDataSource, "activeInboxMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    PKLocalizedMadisonString(CFSTR("PENDING_INVITATIONS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PKPassbookSettingsController__pendingInvitationsGroupSpecifiers__block_invoke;
    v10[3] = &unk_1E3E69288;
    v10[4] = self;
    objc_msgSend(v4, "pk_arrayByApplyingBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

id __66__PKPassbookSettingsController__pendingInvitationsGroupSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D804E8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v3, 0, 0, 0, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("pkInboxMessage"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3FAD018, *MEMORY[0x1E0D806E8]);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80868]);
  objc_msgSend(v5, "setControllerLoadAction:", sel__presentInboxMessage_);
  return v5;
}

- (void)_presentInboxMessage:(id)a3
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pkInboxMessage"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsPresentInboxMessage:animated:completion:", self, v5, 1, 0);

}

- (void)_reloadPendingInvitationSpecifiers
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", self);

}

- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPassbookSettingsController_inboxDataSourceDidUpdateInboxMessages___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __70__PKPassbookSettingsController_inboxDataSourceDidUpdateInboxMessages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPendingInvitationSpecifiers");
}

- (id)_restrictedModeSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;

  if (-[PKPassbookSettingsDataSource deviceInRestrictedMode](self->_dataSource, "deviceInRestrictedMode"))
  {
    v3 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedPaymentString(CFSTR("SETTINGS_RESTRICTED_MODE_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupSpecifierWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v7, *MEMORY[0x1E0D80818]);

    PKLocalizedPaymentString(CFSTR("SETTINGS_RESTRICTED_MODE_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v9, CFSTR("settingsAlertHeaderText"));

    if (PKUserInterfaceIdiom() == 1)
    {
      v10 = CFSTR("SETTINGS_RESTRICTED_MODE_TEXT_IPAD");
    }
    else
    {
      if (self->_context != 1)
        return v5;
      v10 = CFSTR("SETTINGS_RESTRICTED_MODE_TEXT_WATCH");
    }
    PKLocalizedPaymentString(&v10->isa);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v5, "setProperty:forKey:", v11, CFSTR("settingsAlertDescriptionText"));

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKUserInterfaceIdiom() == 1 || self->_context == 1)
    && (-[PKPassbookSettingsController _restrictedModeSpecifier](self, "_restrictedModeSpecifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "safelyAddObject:", v4),
        v4,
        self->_context == 1))
  {
    -[PKPassbookSettingsController _bridgeSpecifiers](self, "_bridgeSpecifiers");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPassbookSettingsController _settingsSpecifiers](self, "_settingsSpecifiers");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (void)_reloadPassData
{
  NSObject *v3;
  NSArray *paymentPassSpecifiers;
  NSArray *otherPassSpecifiers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  int64_t context;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  PKPassbookSettingsController *v31;
  NSArray *paymentPasses;
  uint64_t v33;
  NSArray *otherPasses;
  NSArray *companionPassSpecifiers;
  NSArray *pendingCompanionPassSpecifiers;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  void *v58;
  int v59;
  char v60;
  int v61;
  void *v62;
  char v63;
  NSArray *activeCIDVUIConfigurations;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSArray *companionPasses;
  uint64_t v93;
  NSArray *pendingCompanionPasses;
  uint64_t v95;
  NSArray *hiddenCompanionPasses;
  id v97;
  uint64_t v98;
  NSString *defaultCardIdentifier;
  NSArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t j;
  void *v105;
  void *v106;
  PKPassbookSettingsDefaultBehavior *v107;
  id v108;
  void *v109;
  id v110;
  uint64_t v111;
  char v112;
  id v113;
  PKPassbookSettingsController *v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  id v118;
  void *v119;
  id v120;
  char v121;
  uint64_t v122;
  NSArray *obj;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t v140[128];
  uint8_t buf[4];
  uint64_t v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassbookSettingsController: reloading pass data", buf, 2u);
  }

  paymentPassSpecifiers = self->_paymentPassSpecifiers;
  self->_paymentPassSpecifiers = 0;

  otherPassSpecifiers = self->_otherPassSpecifiers;
  self->_otherPassSpecifiers = 0;

  if (self->_context == 1)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentWebService:supportedRegionFeatureOfType:", self->_webService, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ownerSharingOSVersionRequirement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ownerCredentialSharingAllowed = objc_msgSend(v10, "versionMeetsRequirements:deviceClass:", v7, v8);

    objc_msgSend(v9, "friendSharingOSVersionRequirement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_canAcceptCredentialInvitations = objc_msgSend(v11, "versionMeetsRequirements:deviceClass:", v7, v8);

    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "enabled";
      if (self->_ownerCredentialSharingAllowed)
        v14 = "enabled";
      else
        v14 = "disabled";
      if (!self->_canAcceptCredentialInvitations)
        v13 = "disabled";
      *(_DWORD *)buf = 136315394;
      v142 = (uint64_t)v14;
      v143 = 2080;
      v144 = (uint64_t)v13;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Configuring passes with owner sharing %s, accepting invitations %s", buf, 0x16u);
    }

  }
  v120 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = self->_context;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v114 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  objc_msgSend(WeakRetained, "paymentPasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v137 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
        if (objc_msgSend(v24, "passType") == 1)
        {
          v25 = v24;
          v26 = v25;
          if (context == 1)
            objc_msgSend(v25, "setPreferredImageSuffix:", 0);
          v27 = objc_msgSend(v26, "isAccessPass");
          v28 = v16;
          if ((v27 & 1) == 0)
          {
            if (objc_msgSend(v26, "isIdentityPass"))
              v28 = v16;
            else
              v28 = v15;
          }
          objc_msgSend(v28, "addObject:", v26);
          objc_msgSend(v26, "primaryAccountIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v120, "addObject:", v29);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
    }
    while (v21);
  }

  v30 = objc_msgSend(v15, "copy");
  v31 = v114;
  paymentPasses = v114->_paymentPasses;
  v114->_paymentPasses = (NSArray *)v30;

  v33 = objc_msgSend(v16, "copy");
  otherPasses = v114->_otherPasses;
  v114->_otherPasses = (NSArray *)v33;

  if (v114->_context == 1)
  {
    companionPassSpecifiers = v114->_companionPassSpecifiers;
    if (companionPassSpecifiers)
    {
      v114->_companionPassSpecifiers = 0;

    }
    pendingCompanionPassSpecifiers = v114->_pendingCompanionPassSpecifiers;
    if (pendingCompanionPassSpecifiers)
    {
      v114->_pendingCompanionPassSpecifiers = 0;

    }
    if ((PKIsAltAccountPairedOrPairing() & 1) == 0)
    {
      v107 = objc_alloc_init(PKPassbookSettingsDefaultBehavior);
      -[PKPassbookSettingsDefaultBehavior passLibraryDataProvider](v107, "passLibraryDataProvider");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "paymentPasses");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "copy");

      v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PKPassbookSettingsController watchPassReaderIdentifiers](v114, "watchPassReaderIdentifiers");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebService targetDevice](v114->_webService, "targetDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = objc_msgSend(v40, "areUnifiedAccessPassesSupported");
      else
        v41 = 0;
      v106 = v40;
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v42 = v39;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v133;
        v113 = v42;
        v112 = v41;
        v111 = *(_QWORD *)v133;
        do
        {
          v46 = 0;
          v115 = v44;
          do
          {
            if (*(_QWORD *)v133 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v46);
            v48 = objc_msgSend(v47, "hasCredentials", v106);
            if ((objc_msgSend(v47, "supportsSerialNumberBasedProvisioning") & 1) != 0
              || ((objc_msgSend(v47, "associatedAccountServiceAccountIdentifier"),
                   (v49 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
                ? (v50 = 1)
                : (v50 = v48),
                  v49,
                  v50 == 1))
            {
              if (!objc_msgSend(v47, "activationState") || objc_msgSend(v47, "activationState") == 2)
              {
                if (!v48 || !objc_msgSend(v47, "isCarKeyPass"))
                {
                  objc_msgSend(v47, "primaryAccountIdentifier");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v120;
                  goto LABEL_55;
                }
                if (-[PKPassbookSettingsController canShareCompanionPass:](v31, "canShareCompanionPass:", v47))
                {
                  objc_msgSend(v47, "pairedTerminalIdentifier");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v109;
LABEL_55:
                  v53 = objc_msgSend(v52, "containsObject:", v51);

                  if ((v53 & 1) != 0)
                    goto LABEL_110;
                }
                objc_msgSend(v47, "devicePrimaryPaymentApplication");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v54, "paymentType");

                if ((unint64_t)(v55 - 1005) < 0xFFFFFFFFFFFFFFFELL)
                  v56 = 1;
                else
                  v56 = v41;
                objc_msgSend(v47, "associatedAccountServiceAccountIdentifier");
                v57 = objc_claimAutoreleasedReturnValue();
                v119 = (void *)v57;
                if (v57)
                {
                  -[NSMutableDictionary objectForKeyedSubscript:](v31->_pairedDeviceSupportsFeatureByAccountID, "objectForKeyedSubscript:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v58, "BOOLValue");

                  v60 = objc_msgSend(v47, "hasAssociatedPeerPaymentAccount");
                  if (!v59)
                  {
                    v61 = objc_msgSend(v47, "isIdentityPass");
                    v62 = v118;
                    if (v61)
                    {
                      v63 = 1;
                      goto LABEL_65;
                    }
                    goto LABEL_109;
                  }
                }
                else
                {
                  v60 = objc_msgSend(v47, "hasAssociatedPeerPaymentAccount");
                }
                v63 = v60 | v56 ^ 1;
                if ((objc_msgSend(v47, "isIdentityPass") & 1) != 0)
                {
LABEL_65:
                  activeCIDVUIConfigurations = v31->_activeCIDVUIConfigurations;
                  if (!activeCIDVUIConfigurations)
                  {
                    PKLogFacilityTypeGetObject();
                    v90 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_19D178000, v90, OS_LOG_TYPE_DEFAULT, "Waiting for configurations, hiding pass for now", buf, 2u);
                    }

                    v62 = v118;
                    goto LABEL_109;
                  }
                  v116 = v63;
                  v117 = v46;
                  v130 = 0u;
                  v131 = 0u;
                  v128 = 0u;
                  v129 = 0u;
                  obj = activeCIDVUIConfigurations;
                  v65 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
                  if (v65)
                  {
                    v66 = v65;
                    v121 = 0;
                    v67 = *(_QWORD *)v129;
                    while (1)
                    {
                      v68 = 0;
                      v122 = v66;
                      do
                      {
                        if (*(_QWORD *)v129 != v67)
                          objc_enumerationMutation(obj);
                        v69 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v68);
                        PKLogFacilityTypeGetObject();
                        v70 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v69, "state");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          v72 = objc_msgSend(v69, "target");
                          objc_msgSend(v69, "state");
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v69, "country");
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 134218754;
                          v142 = (uint64_t)v71;
                          v143 = 2048;
                          v144 = v72;
                          v145 = 2112;
                          v146 = v73;
                          v147 = 2112;
                          v148 = v74;
                          _os_log_impl(&dword_19D178000, v70, OS_LOG_TYPE_DEFAULT, "Checking for match with config %lu/%lu/%@/%@", buf, 0x2Au);

                        }
                        objc_msgSend(v47, "issuerAdministrativeAreaCode");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v69, "state");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        v77 = v75;
                        v78 = v76;
                        v79 = v78;
                        if (v77 == v78)
                        {

                        }
                        else
                        {
                          if (!v77 || !v78)
                          {

LABEL_85:
                            goto LABEL_96;
                          }
                          v80 = -[NSObject caseInsensitiveCompare:](v77, "caseInsensitiveCompare:", v78);

                          if (v80)
                            goto LABEL_85;
                        }
                        v81 = v67;
                        v82 = v47;
                        objc_msgSend(v47, "issuerCountryCode");
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v69, "country");
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        v85 = v83;
                        v86 = v84;
                        if (v85 == v86)
                        {

                        }
                        else
                        {
                          v87 = v86;
                          if (!v85 || !v86)
                          {

                            v47 = v82;
                            v67 = v81;
                            v66 = v122;
                            goto LABEL_96;
                          }
                          v88 = objc_msgSend(v85, "caseInsensitiveCompare:", v86);

                          if (v88)
                          {
                            v47 = v82;
LABEL_94:
                            v67 = v81;
                            v66 = v122;
                            goto LABEL_97;
                          }
                        }
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                        {
                          v89 = objc_msgSend(v69, "status");
                          *(_DWORD *)buf = 134217984;
                          v142 = v89;
                          _os_log_impl(&dword_19D178000, v70, OS_LOG_TYPE_DEFAULT, "Config status %lu", buf, 0xCu);
                        }

                        v47 = v82;
                        if (objc_msgSend(v69, "target") != 2)
                          goto LABEL_94;
                        v67 = v81;
                        v66 = v122;
                        if (objc_msgSend(v69, "status") == 3)
                          goto LABEL_97;
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_19D178000, v70, OS_LOG_TYPE_DEFAULT, "Config status is not None, apply pending state", buf, 2u);
                        }
                        v121 = 1;
                        v77 = v70;
LABEL_96:

LABEL_97:
                        ++v68;
                      }
                      while (v66 != v68);
                      v66 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
                      if (!v66)
                        goto LABEL_106;
                    }
                  }
                  v121 = 0;
LABEL_106:

                  v46 = v117;
                  v62 = v118;
                  v42 = v113;
                  v31 = v114;
                  v41 = v112;
                  v45 = v111;
                  v44 = v115;
                  if ((v116 & 1) != 0)
                    goto LABEL_109;
                  v62 = v108;
                  if ((v121 & 1) != 0)
                    goto LABEL_109;
                }
                else
                {
                  v62 = v118;
                  if ((v63 & 1) != 0)
                    goto LABEL_109;
                }
                v62 = v110;
LABEL_109:
                objc_msgSend(v62, "addObject:", v47);

              }
            }
LABEL_110:
            ++v46;
          }
          while (v46 != v44);
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
        }
        while (v44);
      }

      v91 = objc_msgSend(v110, "copy");
      companionPasses = v31->_companionPasses;
      v31->_companionPasses = (NSArray *)v91;

      v93 = objc_msgSend(v108, "copy");
      pendingCompanionPasses = v31->_pendingCompanionPasses;
      v31->_pendingCompanionPasses = (NSArray *)v93;

      v95 = objc_msgSend(v118, "copy");
      hiddenCompanionPasses = v31->_hiddenCompanionPasses;
      v31->_hiddenCompanionPasses = (NSArray *)v95;

    }
  }
  if (v31->_defaultCardIdentifier)
  {
    v97 = objc_loadWeakRetained((id *)&v31->_paymentDataProvider);
    objc_msgSend(v97, "defaultPaymentPassIdentifier");
    v98 = objc_claimAutoreleasedReturnValue();
    defaultCardIdentifier = v31->_defaultCardIdentifier;
    v31->_defaultCardIdentifier = (NSString *)v98;

  }
  -[PKPassbookSettingsController _updateTransitExpressPassIdentifiersWithReload:](v31, "_updateTransitExpressPassIdentifiersWithReload:", 1, v106);
  v31->_hasExpressCapablePass = 0;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v100 = v31->_paymentPasses;
  v101 = -[NSArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v125;
    while (2)
    {
      for (j = 0; j != v102; ++j)
      {
        if (*(_QWORD *)v125 != v103)
          objc_enumerationMutation(v100);
        v105 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
        if ((objc_msgSend(v105, "isAccessPass") & 1) == 0
          && ((-[PKExpressPassController isExpressModeSupportedForPass:](v31->_expressPassController, "isExpressModeSupportedForPass:", v105) & 1) != 0|| -[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](v31->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", v105)))
        {
          v31->_hasExpressCapablePass = 1;
          goto LABEL_127;
        }
      }
      v102 = -[NSArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
      if (v102)
        continue;
      break;
    }
  }
LABEL_127:

}

- (void)refreshPasses
{
  NSMutableDictionary *v3;
  NSMutableDictionary *pairedDeviceSupportsFeatureByAccountID;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pairedDeviceSupportsFeatureByAccountID = self->_pairedDeviceSupportsFeatureByAccountID;
  self->_pairedDeviceSupportsFeatureByAccountID = v3;

  -[PKPassbookSettingsController _refreshPasses](self, "_refreshPasses");
  -[PKPassbookSettingsController _checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary](self, "_checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary");
}

- (void)_refreshPasses
{
  id WeakRetained;
  void *v4;
  id v5;

  -[PKPassbookSettingsController _reloadPassData](self, "_reloadPassData");
  WeakRetained = objc_loadWeakRetained((id *)&self->_expressPassesViewController);
  objc_msgSend(WeakRetained, "setPasses:", self->_paymentPasses);

  -[PKPassbookSettingsController _updateCardsGroupSpecifier](self, "_updateCardsGroupSpecifier");
  -[PKPassbookSettingsController _updateCompanionGroupSpecifier](self, "_updateCompanionGroupSpecifier");
  -[PKPassbookSettingsController _updatePendingCompanionGroupSpecifier](self, "_updatePendingCompanionGroupSpecifier");
  -[PKPassbookSettingsController _updateAddButtonSpecifier](self, "_updateAddButtonSpecifier");
  if (self->_context == 1)
    -[PKPassbookSettingsController _updateCompanionPassesAddButton](self, "_updateCompanionPassesAddButton");
  -[PKPassbookSettingsController _updateDefaultCardsPreferences](self, "_updateDefaultCardsPreferences");
  if (self->_defaultCardIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", self->_availableCards);
    if (self->_unavailableCards)
      objc_msgSend(v4, "addObject:");
    -[PKPaymentPreferencesListViewController setPreferences:](self->_defaultCardsController, "setPreferences:", v4);

  }
  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "settingsControllerRequestsReloadSpecifiers:", self);

}

- (void)refreshDefaultCard
{
  id WeakRetained;
  NSString *v4;
  NSString *defaultCardIdentifier;
  void *v6;
  id v7;

  if (self->_defaultCardIdentifier)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    objc_msgSend(WeakRetained, "defaultPaymentPassIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultCardIdentifier = self->_defaultCardIdentifier;
    self->_defaultCardIdentifier = v4;

  }
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPassbookSettingsController _defaultPaymentSpecifier](self, "_defaultPaymentSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingsController:requestsReloadSpecifier:", self, v6);

}

- (void)refreshExpressTransitCard
{
  -[PKPassbookSettingsController _updateTransitExpressPassIdentifiersWithReload:](self, "_updateTransitExpressPassIdentifiersWithReload:", 1);
}

- (id)_fallbackExpressTransitFooterText
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  id v9;
  int v10;
  NSString *v11;

  if (-[PKExpressPassController deviceUsesAutomaticAuthorization](self->_expressPassController, "deviceUsesAutomaticAuthorization"))
  {
    v3 = CFSTR("SETTINGS_AUTOMATIC_TRANSIT_SECTION_FOOTER");
LABEL_5:
    PKLocalizedPaymentString(&v3->isa);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (self->_context == 1)
  {
    v3 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_WATCH");
    goto LABEL_5;
  }
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    v10 = objc_msgSend(v9, "supportsLowPowerExpressMode");

    if (v10)
    {
      if (PKPearlIsAvailable())
        v3 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_FACEID");
      else
        v3 = CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_TOUCHID");
      goto LABEL_5;
    }
  }
  else
  {

  }
  if (!PKPearlIsAvailable())
  {
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER"), 0);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  PKLocalizedPearlString(CFSTR("SETTINGS_TRANSIT_SECTION_FOOTER_PEARL"));
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;
  return v5;
}

- (void)_updateTransitExpressPassIdentifiersWithReload:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PKPassbookSettingsController *v19;
  id expressTransitSubtitleText;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  id WeakRetained;
  const __CFString *v28;
  id v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  char v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSString *v49;
  void *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  NSString *v55;
  NSString *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSString *v61;
  NSString *v62;
  uint64_t v63;
  NSString *v64;
  NSString *expressTransitSectionFooterText;
  id v66;
  const __CFString *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v3 = a3;
  v83 = *MEMORY[0x1E0C80C00];
  -[PKExpressPassController enabledExpressPasses](self->_expressPassController, "enabledExpressPasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v78 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v11, "passInformation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "cardType");

        if ((unint64_t)(v13 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc_msgSend(v11, "passUniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removeObjectForKey:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  v16 = objc_msgSend(v15, "count");
  v17 = v16;
  if (v16 >= 2)
  {
    PKLocalizedPaymentString(CFSTR("SETTINGS_DEFAULT_EXPRESS_TRANSIT_CELL_SUBTITLE"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = self;
LABEL_15:
    expressTransitSubtitleText = v19->_expressTransitSubtitleText;
    v19->_expressTransitSubtitleText = (NSString *)v18;
    goto LABEL_16;
  }
  v19 = self;
  if (v16 != 1)
  {
    PKLocalizedPaymentString(CFSTR("NONE"));
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  expressTransitSubtitleText = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  objc_msgSend(v15, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(expressTransitSubtitleText, "passWithUniqueID:", v22);
  v23 = v3;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedDescription");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  v26 = self->_expressTransitSubtitleText;
  self->_expressTransitSubtitleText = v25;

  v3 = v23;
LABEL_16:

  WeakRetained = objc_loadWeakRetained((id *)&v19->_paymentDataProvider);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v28 = &stru_1E3E7D690;
    v29 = objc_loadWeakRetained((id *)&v19->_paymentDataProvider);
    v30 = objc_msgSend(v29, "supportsLowPowerExpressMode");

    if (v30)
      v28 = CFSTR("_LPEM");
  }
  else
  {

    v28 = &stru_1E3E7D690;
  }
  if (v17 < 2)
  {
    if (v17 == 1)
    {
      objc_msgSend(v15, "allKeys");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassbookSettingsController passWithUniqueIdentifier:](v19, "passWithUniqueIdentifier:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_ONE_CARD"), "stringByAppendingString:", v28);
      v55 = (NSString *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v36)
        PKLocalizedPaymentString(v55, CFSTR("%@"), v36);
      else
        -[PKPassbookSettingsController _fallbackExpressTransitFooterText](v19, "_fallbackExpressTransitFooterText");
      v57 = objc_claimAutoreleasedReturnValue();
      expressTransitSectionFooterText = v19->_expressTransitSectionFooterText;
      v19->_expressTransitSectionFooterText = (NSString *)v57;

    }
    else
    {
      -[PKPassbookSettingsController _fallbackExpressTransitFooterText](v19, "_fallbackExpressTransitFooterText");
      v58 = objc_claimAutoreleasedReturnValue();
      v36 = v19->_expressTransitSectionFooterText;
      v19->_expressTransitSectionFooterText = (NSString *)v58;
    }
    goto LABEL_64;
  }
  v69 = v3;
  v70 = v5;
  v71 = v4;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v15, "allValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (!v32)
  {

    v36 = 0;
    v35 = 0;
    goto LABEL_54;
  }
  v33 = v32;
  v67 = v28;
  v68 = v15;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = *(_QWORD *)v74;
  do
  {
    v38 = 0;
    do
    {
      if (*(_QWORD *)v74 != v37)
        objc_enumerationMutation(v31);
      v39 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v38);
      objc_msgSend(v39, "passInformation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "cardType");

      if (v35)
        v42 = v41 == 2;
      else
        v42 = 0;
      v43 = v42;
      if (!v35 && v41 == 2)
      {
        objc_msgSend(v39, "passUniqueIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
        v44 = v36;
LABEL_38:
        v45 = v44;

        v36 = v45;
        goto LABEL_39;
      }
      if (v36)
        goto LABEL_37;
      if (v41 != 1)
      {
        v44 = 0;
        goto LABEL_38;
      }
      objc_msgSend(v39, "passUniqueIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
      v34 |= v43;
      ++v38;
    }
    while (v33 != v38);
    v46 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    v33 = v46;
  }
  while (v46);

  if ((v34 & 1) != 0)
  {
    v19 = self;
    -[PKPassbookSettingsController passWithUniqueIdentifier:](self, "passWithUniqueIdentifier:", v36);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_MANY_CARDS"), "stringByAppendingString:", v67);
    v49 = (NSString *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v48)
      PKLocalizedPaymentString(v49, CFSTR("%@"), v48);
    else
      -[PKPassbookSettingsController _fallbackExpressTransitFooterText](self, "_fallbackExpressTransitFooterText");
    v51 = (NSString *)objc_claimAutoreleasedReturnValue();
    v62 = self->_expressTransitSectionFooterText;
    self->_expressTransitSectionFooterText = v51;
    v15 = v68;
    goto LABEL_63;
  }
  v19 = self;
  v28 = v67;
  v15 = v68;
LABEL_54:
  -[PKPassbookSettingsController passWithUniqueIdentifier:](v19, "passWithUniqueIdentifier:", v36);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "localizedDescription");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassbookSettingsController passWithUniqueIdentifier:](v19, "passWithUniqueIdentifier:", v35);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "localizedDescription");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_TWO_CARDS"), "stringByAppendingString:", v28);
  v61 = (NSString *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v48 && v50)
  {
    PKLocalizedPaymentString(v61, CFSTR("%@%@"), v48, v50);
    v63 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPassbookSettingsController _fallbackExpressTransitFooterText](v19, "_fallbackExpressTransitFooterText");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v64 = v19->_expressTransitSectionFooterText;
  v19->_expressTransitSectionFooterText = (NSString *)v63;

LABEL_63:
  v5 = v70;
  v4 = v71;
  v3 = v69;
LABEL_64:

  if (v3)
  {
    v66 = objc_loadWeakRetained((id *)&v19->_delegate);
    objc_msgSend(v66, "settingsControllerRequestsReloadSpecifiers:", v19);

  }
}

- (void)refreshPeerPaymentStatus
{
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;
  id v7;

  -[PKPassbookSettingsController _peerPaymentSwitchSpecifier](self, "_peerPaymentSwitchSpecifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPassbookSettingsController _isPeerPaymentRegistered](self, "_isPeerPaymentRegistered"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", self, v7);

  }
}

- (void)_refreshAccountSpecifiers
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", self);

}

- (id)passWithUniqueIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_paymentPasses;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      objc_msgSend(v10, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        goto LABEL_18;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_otherPasses;
  v13 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
      objc_msgSend(v10, "uniqueID", (_QWORD)v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v4);

      if ((v17 & 1) != 0)
        break;
      if (v13 == (id)++v15)
      {
        v13 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    v13 = v10;
  }
LABEL_19:

  return v13;
}

- (id)rendererStateForPaymentPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController _specifierForPassUniqueID:](self, "_specifierForPassUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D80940]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "rendererState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addCardTapped
{
  int64_t v3;
  void **v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = -[PKPassbookSettingsController _paymentSetupContextForSettingsContext:](self, "_paymentSetupContextForSettingsContext:", self->_context);
  v4 = (void **)MEMORY[0x1E0D698E0];
  if (v3 != 4)
    v4 = (void **)MEMORY[0x1E0D69940];
  v5 = *v4;
  v6 = (void *)MEMORY[0x1E0D66A58];
  v7 = *MEMORY[0x1E0D68858];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v7;
  v8 = *MEMORY[0x1E0D69328];
  v13[0] = *MEMORY[0x1E0D68B18];
  v13[1] = v8;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = v5;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject:sendEvent:", v10, v11);

  -[PKPassbookSettingsController openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:](self, "openPaymentSetupWithMode:referrerIdentifier:allowedFeatureIdentifiers:", 0, 0, 0);
}

- (void)addCardTappedForPaymentPassWithSpecifier:(id)a3
{
  id v4;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80868]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController addCardTappedForPaymentPassWithUniqueID:withCompletion:](self, "addCardTappedForPaymentPassWithUniqueID:withCompletion:", v4, 0);

}

- (void)addCardTappedForPaymentPassWithUniqueID:(id)a3
{
  -[PKPassbookSettingsController addCardTappedForPaymentPassWithUniqueID:withCompletion:](self, "addCardTappedForPaymentPassWithUniqueID:withCompletion:", a3, 0);
}

- (void)addCardTappedForPaymentPassWithUniqueID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_companionPasses;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
      objc_msgSend(v13, "uniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v6);

      if ((v15 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v16 = v13;

    if (v16)
      goto LABEL_21;
  }
  else
  {
LABEL_9:

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = self->_pendingCompanionPasses;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
LABEL_13:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
      objc_msgSend(v22, "uniqueID", (_QWORD)v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v6);

      if ((v24 & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v19)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
    v16 = v22;

    if (!v16)
      goto LABEL_22;
LABEL_21:
    -[PKPassbookSettingsController _performPhoneToWatchProvisioningForPaymentPass:withCompletion:](self, "_performPhoneToWatchProvisioningForPaymentPass:withCompletion:", v16, v7);

  }
  else
  {
LABEL_19:

LABEL_22:
    PKLogFacilityTypeGetObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "No companion payment pass with unique ID %@. Not starting provisioning.", buf, 0xCu);
    }

    if (v7)
      v7[2](v7, 0);
  }

}

- (void)openPeerPaymentSetupWithCurrencyAmount:(id)a3 state:(unint64_t)a4 senderAddress:(id)a5
{
  uint64_t v5;
  _QWORD v6[5];

  if (!self->_registeringForPeerPayment)
  {
    v5 = MEMORY[0x1E0C809B0];
    self->_registeringForPeerPayment = 1;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __91__PKPassbookSettingsController_openPeerPaymentSetupWithCurrencyAmount_state_senderAddress___block_invoke;
    v6[3] = &unk_1E3E62288;
    v6[4] = self;
    -[PKPassbookSettingsController _presentPeerPaymentSetupFlowWithAmount:flowState:senderAddress:completion:](self, "_presentPeerPaymentSetupFlowWithAmount:flowState:senderAddress:completion:", a3, a4, a5, v6);
  }
}

uint64_t __91__PKPassbookSettingsController_openPeerPaymentSetupWithCurrencyAmount_state_senderAddress___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_refreshPasses");
}

- (int64_t)_paymentPreferencesStyle
{
  if (self->_context == 1)
    return 2;
  else
    return 1;
}

- (id)watchPassReaderIdentifiers
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_context != 1)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_paymentPasses;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v8), "pairedTerminalIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_otherPasses;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "pairedTerminalIdentifier", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v3, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v3, "count"))
    v16 = (void *)objc_msgSend(v3, "copy");
  else
    v16 = 0;

  return v16;
}

- (BOOL)canShareCompanionPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  BOOL v9;

  if (self->_context != 1)
    return 0;
  objc_msgSend(a3, "devicePrimaryPaymentApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subcredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "isSharedCredential");
    v8 = 568;
    if (v7)
      v8 = 569;
    v9 = *((_BYTE *)&self->super.isa + v8) != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)openPaymentSetupWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id WeakRetained;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20[2];
  id location;

  v8 = a4;
  v9 = a5;
  -[PKPassbookSettingsController _updateAddButtonSpecifier](self, "_updateAddButtonSpecifier");
  v10 = *MEMORY[0x1E0D80808];
  -[PSSpecifier objectForKeyedSubscript:](self->_addCardButtonSpecifier, "objectForKeyedSubscript:", *MEMORY[0x1E0D80808]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  -[PSSpecifier objectForKeyedSubscript:](self->_addCardButtonSpecifier, "objectForKeyedSubscript:", CFSTR("PKSettingsSpecifierLoadingKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v13 & 1) == 0)
  {
    PKUIStoreDemoGatewayViewController();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "settingsController:requestsPresentViewController:animated:completion:", self, v11, 1, 0);

    }
    else
    {
      -[PSSpecifier setObject:forKeyedSubscript:](self->_addCardButtonSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v10);
      -[PSSpecifier setObject:forKeyedSubscript:](self->_addCardButtonSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PKSettingsSpecifierLoadingKey"));
      -[PKPassbookSettingsController _updateCompanionPassesAddButton](self, "_updateCompanionPassesAddButton");
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "settingsController:requestsReloadSpecifier:", self, self->_addCardButtonSpecifier);

      if (PKUserInterfaceIdiom() == 1
        && PKSafariCredentialProvisioningEnabled()
        && !PKSafariCredentialProvisioningConsented())
      {
        objc_initWeak(&location, self);
        v16 = (void *)MEMORY[0x1E0D675D8];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke;
        v17[3] = &unk_1E3E69300;
        objc_copyWeak(v20, &location);
        v20[1] = (id)a3;
        v18 = v8;
        v19 = v9;
        objc_msgSend(v16, "hasSafariCredentials:", v17);

        objc_destroyWeak(v20);
        objc_destroyWeak(&location);
      }
      -[PKPassbookSettingsController startPreflightWithMode:referrerIdentifier:allowedFeatureIdentifiers:](self, "startPreflightWithMode:referrerIdentifier:allowedFeatureIdentifiers:", a3, v8, v9);
    }
    goto LABEL_10;
  }
LABEL_11:

}

void __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke(id *a1, char a2, uint64_t a3, char a4)
{
  _QWORD block[4];
  id v8;
  id v9;
  id v10[2];
  char v11;
  char v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2;
  block[3] = &unk_1E3E692D8;
  objc_copyWeak(v10, a1 + 6);
  v11 = a2;
  v12 = a4;
  v10[1] = a1[7];
  v8 = a1[4];
  v9 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v10);
}

void __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  PKVirtualCardPrivacyExplanationViewController *v4;
  uint64_t v5;
  PKVirtualCardPrivacyExplanationViewController *v6;
  PKNavigationController *v7;
  PKNavigationController *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *(*v12)(_QWORD *);
  void *v13;
  id *v14;
  id v15;
  id v16;
  uint64_t v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64) && *(_BYTE *)(a1 + 65))
    {
      v4 = [PKVirtualCardPrivacyExplanationViewController alloc];
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3;
      v13 = &unk_1E3E692B0;
      v5 = *(_QWORD *)(a1 + 56);
      v14 = v3;
      v17 = v5;
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      v6 = -[PKVirtualCardPrivacyExplanationViewController initWithContext:referralSource:resultCallback:](v4, "initWithContext:referralSource:resultCallback:", 3, 2, &v10);
      v7 = [PKNavigationController alloc];
      v8 = -[PKNavigationController initWithRootViewController:](v7, "initWithRootViewController:", v6, v10, v11, v12, v13, v14);
      -[PKNavigationController setNavigationBarHidden:](v8, "setNavigationBarHidden:", 1);
      -[PKNavigationController setModalInPresentation:](v8, "setModalInPresentation:", 1);
      -[PKNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
      v9 = objc_loadWeakRetained(v3 + 81);
      objc_msgSend(v9, "settingsController:requestsPresentViewController:animated:completion:", v3, v8, 1, 0);

    }
    else
    {
      objc_msgSend(WeakRetained, "startPreflightWithMode:referrerIdentifier:allowedFeatureIdentifiers:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }

}

void *__102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3(_QWORD *a1)
{
  void *result;

  result = (void *)a1[4];
  if (result)
    return (void *)objc_msgSend(result, "startPreflightWithMode:referrerIdentifier:allowedFeatureIdentifiers:", a1[7], a1[5], a1[6]);
  return result;
}

- (void)startPreflightWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[PKPassbookSettingsController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke;
  v13[3] = &unk_1E3E69350;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  objc_msgSend(WeakRetained, "settingsController:requestsAddCardPreflightWithCompletion:", self, v13);

}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2;
  block[3] = &unk_1E3E69328;
  v20 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v18 = v8;
  v19 = v11;
  v17 = v10;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[4];
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD);
  _QWORD aBlock[5];
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 80))
  {
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v5, "provisioningController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReferrerIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "setAllowedFeatureIdentifiers:", *(_QWORD *)(a1 + 56));
    if (PKIsAltAccountPairedOrPairing() && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 1)
      objc_msgSend(v6, "setIsProvisioningForAltAccount:", 1);
    objc_msgSend(v5, "setCustomFormSheetPresentationStyleForiPad");
    objc_msgSend(v5, "setPaymentSetupMode:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setupDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setupDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSetupDelegate:", v8);

    }
    v29[0] = v2;
    v29[1] = 3221225472;
    v29[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_4;
    v29[3] = &unk_1E3E66EF0;
    v29[4] = *(_QWORD *)(a1 + 32);
    v30 = v5;
    v31 = v3;
    v9 = v5;
    objc_msgSend(v9, "preflightWithCompletion:", v29);

    goto LABEL_21;
  }
  v3[2](v3);
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
    objc_msgSend(v6, "settingsController:requestsPresentViewController:animated:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0);
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 64), "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (!v11)
    goto LABEL_17;
  v12 = objc_msgSend(*(id *)(a1 + 64), "code");
  v13 = *(void **)(a1 + 64);
  if (v12 == 6)
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0D66A58];
    v38[0] = *MEMORY[0x1E0D69950];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D68F50];
    v36[0] = *MEMORY[0x1E0D68AA0];
    v36[1] = v17;
    v18 = *MEMORY[0x1E0D696B8];
    v37[0] = *MEMORY[0x1E0D68C50];
    v37[1] = v18;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v37;
    v21 = v36;
  }
  else
  {
    if (objc_msgSend(v13, "code") != 9)
    {
LABEL_17:
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", *(_QWORD *)(a1 + 64));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      goto LABEL_18;
    }
    v14 = *(id *)(a1 + 64);
    v15 = (void *)MEMORY[0x1E0D66A58];
    v35 = *MEMORY[0x1E0D69950];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D68F50];
    v33[0] = *MEMORY[0x1E0D68AA0];
    v33[1] = v22;
    v23 = *MEMORY[0x1E0D697D0];
    v34[0] = *MEMORY[0x1E0D68C50];
    v34[1] = v23;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v34;
    v21 = v33;
  }
  objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subjects:sendEvent:", v16, v24);

  if (!v14)
    goto LABEL_17;
  v27[1] = 3221225472;
  v27[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_5;
  v27[3] = &unk_1E3E612E8;
  v28 = *(_QWORD *)(a1 + 32);
  v26[0] = v2;
  v26[1] = 3221225472;
  v26[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_6;
  v26[3] = &unk_1E3E612E8;
  v26[4] = v28;
  v27[0] = v2;
  PKAlertForDisplayableErrorWithHandlers(v14, 0, v27, v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  if (v6)
  {
    v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
    objc_msgSend(v25, "settingsController:requestsPresentViewController:animated:completion:", *(_QWORD *)(a1 + 32), v6, 1, 0);

  }
LABEL_21:

}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSettingsSpecifierLoadingKey"));
  objc_msgSend(*(id *)(a1 + 32), "_updateCompanionPassesAddButton");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336));

}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_4(_QWORD *a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 648));
    objc_msgSend(WeakRetained, "settingsController:requestsPresentViewController:animated:completion:", a1[4], a1[5], 1, a1[6]);

  }
}

uint64_t __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endReportingIfNecessary");
}

uint64_t __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endReportingIfNecessary");
}

- (id)_passSpecifiersForPasses:(id)a3
{
  return -[PKPassbookSettingsController _passSpecifiersForPasses:peerPaymentPassUniqueID:showPeerPaymentSetup:](self, "_passSpecifiersForPasses:peerPaymentPassUniqueID:showPeerPaymentSetup:", a3, 0, 0);
}

- (id)_passSpecifiersForPasses:(id)a3 peerPaymentPassUniqueID:(id)a4 showPeerPaymentSetup:(BOOL)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  PKPassbookSettingsController *v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke;
  v29[3] = &unk_1E3E69378;
  v13 = v8;
  v30 = v13;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v12;
  v21 = 3221225472;
  v22 = __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke_2;
  v23 = &unk_1E3E693A0;
  v24 = self;
  v25 = v13;
  v28 = a5;
  v26 = v14;
  v27 = v11;
  v15 = v11;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v20);
  v18 = (void *)objc_msgSend(v15, "copy", v20, v21, v22, v23, v24);

  return v18;
}

uint64_t __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_13:
    objc_msgSend(v5, "ingestedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ingestedDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "compare:", v13);

    goto LABEL_15;
  }
  if (objc_msgSend(v5, "hasAssociatedPeerPaymentAccount"))
  {
    objc_msgSend(v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = 0;
  }
  if (*(_QWORD *)(a1 + 32) && objc_msgSend(v6, "hasAssociatedPeerPaymentAccount"))
  {
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (!v8)
    {
LABEL_12:
      if ((v10 ^ 1 | v8) != 1)
      {
        v11 = 1;
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    v10 = 0;
    if (!v8)
      goto LABEL_12;
  }
  if (v10)
    goto LABEL_12;
  v11 = -1;
LABEL_15:

  return v11;
}

void __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString **v17;
  uint64_t v18;
  PKPassView *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  PKPaymentVerificationController *v29;
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
  void *v40;
  void *v41;
  uint64_t v42;
  char v43;
  void *v44;
  char v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;

  v54 = a2;
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, *(_QWORD *)(a1 + 32), 0, 0, 0, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sel__showCardDetails_;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674E8]), "initWithPass:webService:", v54, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v54, "devicePrimaryPaymentApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(v7, "devicePrimaryPrecursorRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      PKLocalizedPaymentString(CFSTR("PRECURSOR_PASS_CELL_SUBTITLE"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v54, "isAccessPass"))
  {
    if ((objc_msgSend(v54, "hasCredentials") & 1) != 0)
    {
      v9 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v54, "provisioningCredentialHash");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = (_QWORD *)MEMORY[0x1E0D6ADB0];
    else
      v21 = (_QWORD *)MEMORY[0x1E0D6ADB8];
    objc_msgSend(v54, "fieldForKey:", *v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("pkCustomSubTitle"));

    goto LABEL_24;
  }
  if (objc_msgSend(v54, "isStoredValuePass"))
  {
    objc_msgSend(v54, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("pkTransitServerBalance"));

    v12 = *(id **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v12 + 3);
    objc_msgSend(v12, "_reloadBalancesAndTransitPassPropertiesForPass:withDataProvider:", v54, WeakRetained);

LABEL_24:
LABEL_25:
    v9 = 1;
    goto LABEL_26;
  }
  if (!objc_msgSend(v54, "hasAssociatedPeerPaymentAccount"))
    goto LABEL_37;
  objc_msgSend(v54, "uniqueID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(a1 + 40);
  v24 = v22;
  v25 = v23;
  if (v24 == v25)
  {

LABEL_32:
    if (PKStoreDemoModeEnabled())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "currentBalance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "currentBalance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "minimalFormattedStringValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("pkCustomSubTitle"));

      }
      v18 = 0;
      v19 = 0;
      v6 = sel__presentFeatureNotEnabledForDemoForSpecifier_;
      goto LABEL_13;
    }
    if (!*(_BYTE *)(a1 + 64))
    {
      v46 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "state");
      if (v46 == 4)
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETTINGS_ACCOUNT_STATE_CLOSED"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("pkCustomSubTitle"));

        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("pkCustomSubTitleColor"));

        v18 = 0;
        v19 = 0;
        v6 = sel__presentPeerPaymentReOpenCardFlowForSpecifier_;
        goto LABEL_13;
      }
      if (v46 != 3)
      {
        objc_msgSend(v54, "devicePrimaryPaymentApplication");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "state");

        if (v51 == 7)
          goto LABEL_25;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "currentBalance");
        v19 = (PKPassView *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          goto LABEL_50;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "currentBalance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "minimalFormattedStringValue");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("pkCustomSubTitle"));

        goto LABEL_12;
      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETTINGS_ACCOUNT_STATE_LOCKED"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("pkCustomSubTitle"));

      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = PKPassbookCardTableCellCustomSubTitleColorKey;
LABEL_11:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *v17);
LABEL_12:

      v18 = 0;
      v19 = 0;
      goto LABEL_13;
    }
    v6 = sel__presentPeerPaymentSetupFlowForSpecifier_;
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETTINGS_REGISTRATION_NOT_SET_UP"));
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v16 = (void *)v15;
    v17 = PKPassbookCardTableCellCustomSubTitleKey;
    goto LABEL_11;
  }
  v26 = v25;
  if (!v24 || !v25)
  {

    goto LABEL_37;
  }
  v27 = objc_msgSend(v24, "isEqualToString:", v25);

  if (v27)
    goto LABEL_32;
LABEL_37:
  objc_msgSend(v54, "associatedAccountServiceAccountIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (!v42)
  {
    v9 = objc_msgSend(v54, "isIdentityPass") ^ 1;
LABEL_26:
    if (objc_msgSend(v54, "activationState") != 1)
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_30;
    }
LABEL_27:
    v19 = -[PKPassView initWithPass:content:suppressedContent:rendererState:]([PKPassView alloc], "initWithPass:content:suppressedContent:rendererState:", v54, 4, 1527, 0);
LABEL_28:
    v18 = 1;
    v29 = -[PKPaymentVerificationController initWithPaymentPass:passView:webService:context:delegate:setupDelegate:verificationContext:]([PKPaymentVerificationController alloc], "initWithPaymentPass:passView:webService:context:delegate:setupDelegate:verificationContext:", v54, v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), objc_msgSend(*(id *)(a1 + 32), "_paymentSetupContextForSettingsContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)), 0, 0, 1);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    -[PKPaymentVerificationController setProvisioningController:](v29, "setProvisioningController:", v30);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("pkVerificationController"));

    goto LABEL_30;
  }
  if ((PKIsLowEndDevice() & 1) != 0 || objc_msgSend(v54, "associatedAccountFeatureIdentifier") == 3)
  {
    v19 = 0;
  }
  else
  {
    v19 = -[PKPassView initWithPass:content:suppressedContent:rendererState:]([PKPassView alloc], "initWithPass:content:suppressedContent:rendererState:", v54, 4, 1527, 0);
    -[PKPassView setPaused:](v19, "setPaused:", 1);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("pkSnapshotPassView"));
  }
  v43 = objc_msgSend(v54, "isShellPass");
  objc_msgSend(v54, "devicePrimaryPaymentApplication");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "state");
  if (PKPaymentApplicationStateIsPersonalized())
  {

LABEL_48:
    objc_msgSend(*(id *)(a1 + 32), "_updateCardSpecifier:withAccountStateForPaymentPass:", v5, v54);
    goto LABEL_49;
  }
  v45 = objc_msgSend(v54, "isShellPass");

  if ((v45 & 1) != 0)
    goto LABEL_48;
LABEL_49:
  if ((v43 & 1) != 0)
  {
LABEL_50:
    v18 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v54, "activationState") == 1)
  {
    v9 = 1;
    if (v19)
      goto LABEL_28;
    goto LABEL_27;
  }
  v18 = 1;
LABEL_13:
  v9 = 1;
LABEL_30:
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("pkPass"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("pkShowAddButton"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 48), "count") - 1 == a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("pkShowFullSeparatorInset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("pkShowSubTitle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("pkShowState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("pkSettingsContext"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3FAD018, *MEMORY[0x1E0D806E8]);
  +[PKPaymentPassTableCell heightForCellWithMinimum:hasSubTitle:](PKPaymentPassTableCell, "heightForCellWithMinimum:hasSubTitle:", 1, 56.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D80938]);

  objc_msgSend(v54, "uniqueID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D80868]);

  objc_msgSend(v5, "setControllerLoadAction:", v6);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

}

- (id)_paymentPassSpecifiers
{
  NSArray *paymentPassSpecifiers;
  id WeakRetained;
  void *v5;
  NSArray *paymentPasses;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[4];
  id v13;

  paymentPassSpecifiers = self->_paymentPassSpecifiers;
  if (paymentPassSpecifiers)
    return paymentPassSpecifiers;
  if (!self->_paymentPasses)
  {
    paymentPassSpecifiers = 0;
    return paymentPassSpecifiers;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  objc_msgSend(WeakRetained, "peerPaymentPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_registeringForPeerPayment)
  {
    if (v5)
    {
      paymentPasses = self->_paymentPasses;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__PKPassbookSettingsController__paymentPassSpecifiers__block_invoke;
      v12[3] = &unk_1E3E68CF0;
      v13 = v5;
      -[NSArray pk_objectsPassingTest:](paymentPasses, "pk_objectsPassingTest:", v12);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_paymentPasses;
      self->_paymentPasses = v7;

    }
  }
  -[PKPassbookSettingsController _passSpecifiersForPasses:peerPaymentPassUniqueID:showPeerPaymentSetup:](self, "_passSpecifiersForPasses:peerPaymentPassUniqueID:showPeerPaymentSetup:", self->_paymentPasses, v5, -[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution") == 1);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v10 = self->_paymentPassSpecifiers;
  self->_paymentPassSpecifiers = v9;

  return self->_paymentPassSpecifiers;
}

uint64_t __54__PKPassbookSettingsController__paymentPassSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasAssociatedPeerPaymentAccount"))
  {
    objc_msgSend(v3, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_otherPassSpecifiers
{
  NSArray *otherPassSpecifiers;
  NSArray *v4;
  NSArray *v5;

  otherPassSpecifiers = self->_otherPassSpecifiers;
  if (!otherPassSpecifiers)
  {
    if (self->_otherPasses)
    {
      -[PKPassbookSettingsController _passSpecifiersForPasses:](self, "_passSpecifiersForPasses:");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v5 = self->_otherPassSpecifiers;
      self->_otherPassSpecifiers = v4;

      otherPassSpecifiers = self->_otherPassSpecifiers;
    }
    else
    {
      otherPassSpecifiers = 0;
    }
  }
  return otherPassSpecifiers;
}

- (id)_pendingCompanionPassSpecifiers
{
  void *v3;
  NSArray *pendingCompanionPassSpecifiers;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  PKPassbookSettingsController *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pendingCompanionPassSpecifiers = self->_pendingCompanionPassSpecifiers;
  if (!pendingCompanionPassSpecifiers)
  {
    pendingCompanionPassSpecifiers = self->_pendingCompanionPasses;
    if (pendingCompanionPassSpecifiers)
    {
      v5 = (void *)-[NSArray copy](pendingCompanionPassSpecifiers, "copy");
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __63__PKPassbookSettingsController__pendingCompanionPassSpecifiers__block_invoke;
      v14 = &unk_1E3E693C8;
      v15 = self;
      v6 = v3;
      v16 = v6;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);

      v7 = (NSArray *)objc_msgSend(v6, "copy", v11, v12, v13, v14, v15);
      v8 = self->_pendingCompanionPassSpecifiers;
      self->_pendingCompanionPassSpecifiers = v7;

      pendingCompanionPassSpecifiers = self->_pendingCompanionPassSpecifiers;
    }
  }
  v9 = pendingCompanionPassSpecifiers;

  return v9;
}

void __63__PKPassbookSettingsController__pendingCompanionPassSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, *(_QWORD *)(a1 + 32), 0, 0, 0, 3, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  if (objc_msgSend(v3, "isIdentityPass"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = a1;
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 320);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (!v4)
      goto LABEL_46;
    v5 = v4;
    v6 = *(_QWORD *)v39;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
        PKLogFacilityTypeGetObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "state");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v8, "target");
          objc_msgSend(v8, "state");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "country");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v43 = (uint64_t)v10;
          v44 = 2048;
          v45 = v11;
          v46 = 2112;
          v47 = v12;
          v48 = 2112;
          v49 = v13;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Checking for match with config %lu/%lu/%@/%@", buf, 0x2Au);

        }
        if (objc_msgSend(v8, "target") == 2)
        {
          objc_msgSend(v37, "issuerAdministrativeAreaCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "state");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14;
          v17 = v15;
          v18 = v17;
          if (v16 == v17)
          {

            goto LABEL_16;
          }
          if (v16 && v17)
          {
            v19 = objc_msgSend(v16, "caseInsensitiveCompare:", v17);

            if (!v19)
            {
LABEL_16:
              objc_msgSend(v37, "issuerCountryCode");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "country");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v20;
              v23 = v21;
              if (v22 == v23)
              {

                goto LABEL_23;
              }
              v24 = v23;
              if (v22 && v23)
              {
                v25 = objc_msgSend(v22, "caseInsensitiveCompare:", v23);

                if (v25)
                  goto LABEL_30;
LABEL_23:
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  v26 = objc_msgSend(v8, "status");
                  *(_DWORD *)buf = 134217984;
                  v43 = v26;
                  _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Config status %lu", buf, 0xCu);
                }

                v16 = 0;
                v28 = objc_msgSend(v8, "status");
                v27 = CFSTR("CARD_TYPE_IDENTITY_PENDING");
                switch(v28)
                {
                  case 0:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_ACTION_REQUIRED");
                    goto LABEL_42;
                  case 1:
                    goto LABEL_42;
                  case 2:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_READY");
                    goto LABEL_42;
                  case 4:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_AUTH_CODE");
                    goto LABEL_42;
                  case 5:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_RETRY_ADDING");
                    goto LABEL_42;
                  case 6:
                  case 8:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_UNABLE_TO_ADD");
                    goto LABEL_42;
                  case 7:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_CANNOT_ADD");
                    goto LABEL_42;
                  case 9:
                    if (PKUseWLAN())
                      v27 = CFSTR("CARD_TYPE_IDENTITY_WAITING_WLAN");
                    else
                      v27 = CFSTR("CARD_TYPE_IDENTITY_WAITING_WIFI");
                    goto LABEL_42;
                  case 10:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_RETRY_AUTH_CODE");
                    goto LABEL_42;
                  case 12:
                    v27 = CFSTR("CARD_TYPE_IDENTITY_LIVENESS_STEP_UP");
LABEL_42:
                    PKLocalizedIdentityString(&v27->isa);
                    v16 = (id)objc_claimAutoreleasedReturnValue();
                    break;
                  default:
                    break;
                }
                if (objc_msgSend(v16, "length"))
                  objc_msgSend(v35, "setObject:forKeyedSubscript:", v16, CFSTR("pkCustomSubTitle"));
LABEL_29:

                goto LABEL_30;
              }

            }
          }
          else
          {

          }
          goto LABEL_29;
        }
LABEL_30:
        ++v7;
      }
      while (v5 != v7);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      v5 = v29;
      if (!v29)
      {
LABEL_46:

        a1 = v34;
        break;
      }
    }
  }
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("pkPass"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v30, CFSTR("pkShowSubTitle"));

  objc_msgSend(v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("pkShowState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v31, CFSTR("pkSettingsContext"));

  objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E3FAD018, *MEMORY[0x1E0D806E8]);
  +[PKPaymentPassTableCell heightForCellWithMinimum:hasSubTitle:](PKPaymentPassTableCell, "heightForCellWithMinimum:hasSubTitle:", 1, 56.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D80938]);

  objc_msgSend(v37, "uniqueID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D80868]);

  objc_msgSend(v35, "setControllerLoadAction:", sel_addCardTappedForPaymentPassWithSpecifier_);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v35);

}

- (id)_companionPassSpecifiers
{
  NSArray *companionPassSpecifiers;
  void *v4;
  char v5;
  char v6;
  char v7;
  id WeakRetained;
  char v9;
  uint64_t v10;
  NSArray *companionPasses;
  void *v12;
  id v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  PKPassbookSettingsController *v21;
  id v22;
  char v23;
  char v24;
  char v25;
  char v26;
  _QWORD v27[4];
  char v28;

  companionPassSpecifiers = self->_companionPassSpecifiers;
  if (!companionPassSpecifiers)
  {
    if (self->_companionPasses)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = -[PKPassbookSettingsDataSource hasFelicaSecureElement](self->_dataSource, "hasFelicaSecureElement");
      else
        v5 = 0;
      v6 = objc_opt_respondsToSelector() & 1;
      v7 = objc_opt_respondsToSelector() & 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
      v9 = objc_msgSend(WeakRetained, "canAddPaymentPass");

      v10 = MEMORY[0x1E0C809B0];
      companionPasses = self->_companionPasses;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke;
      v27[3] = &__block_descriptor_33_e27_q24__0__PKPass_8__PKPass_16l;
      v28 = v5;
      -[NSArray sortedArrayUsingComparator:](companionPasses, "sortedArrayUsingComparator:", v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v10;
      v18 = 3221225472;
      v19 = __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke_2;
      v20 = &unk_1E3E69410;
      v23 = v5;
      v24 = v6;
      v25 = v7;
      v26 = v9;
      v21 = self;
      v22 = v4;
      v13 = v4;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v17);
      v14 = (NSArray *)objc_msgSend(v13, "copy", v17, v18, v19, v20, v21);
      v15 = self->_companionPassSpecifiers;
      self->_companionPassSpecifiers = v14;

      companionPassSpecifiers = self->_companionPassSpecifiers;
    }
    else
    {
      companionPassSpecifiers = 0;
    }
  }
  return companionPassSpecifiers;
}

uint64_t __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "ingestedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ingestedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v5, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "devicePrimaryPaymentApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "paymentNetworkIdentifier") != 103;

    }
    else
    {
      v13 = 1;
    }
    objc_msgSend(v6, "paymentPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "devicePrimaryPaymentApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "paymentNetworkIdentifier");

      if (v17 == 103 || v13)
        v19 = v9;
      else
        v19 = 1;
      if (v13)
        v9 = -1;
      if (v17 != 103)
        v9 = v19;
    }
    else if (!v13)
    {
      v9 = 1;
    }

  }
  return v9;
}

void __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int IsPersonalized;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  if ((objc_msgSend(v22, "hasAssociatedPeerPaymentAccount") & 1) != 0)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, *(_QWORD *)(a1 + 32), 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "devicePrimaryPaymentApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "paymentNetworkIdentifier");

  if (v5 == 129)
  {
    objc_msgSend(v22, "devicePrimaryContactlessPaymentApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subcredentials");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      goto LABEL_13;
  }
  else if (v5 == 103 && !*(_BYTE *)(a1 + 48))
  {
    goto LABEL_13;
  }
  if (*(_BYTE *)(a1 + 49)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "supportsCredentialType:", v5)
    && (!*(_BYTE *)(a1 + 50)
     || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "supportsAddingPaymentPass:", v22))
    && (!objc_msgSend(v22, "requiresTransferSerialNumberBasedProvisioning")
     || !objc_msgSend(v22, "activationState")))
  {
    v9 = *(_BYTE *)(a1 + 51) != 0;
    goto LABEL_14;
  }
LABEL_13:
  v9 = 0;
LABEL_14:
  v10 = objc_msgSend(v22, "hasCredentials");
  if ((v10 & 1) == 0)
  {
    if (objc_msgSend(v22, "isStoredValuePass"))
    {
      objc_msgSend(v22, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pkTransitServerBalance"));

      objc_msgSend(*(id *)(a1 + 32), "_reloadBalancesAndTransitPassPropertiesForPass:withDataProvider:", v22, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544));
    }
    else
    {
      objc_msgSend(v22, "associatedAccountServiceAccountIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        objc_msgSend(v22, "devicePrimaryPaymentApplication");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "state");
        IsPersonalized = PKPaymentApplicationStateIsPersonalized();

        if (IsPersonalized)
          objc_msgSend(*(id *)(a1 + 32), "_updateCardSpecifier:withAccountStateForPaymentPass:", v3, v22);
      }
    }
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("pkPass"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pkShowAddButton"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 ^ 1u);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pkShowSubTitle"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("pkShowState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("pkSettingsContext"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("pkActionButtonEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3FAD030, *MEMORY[0x1E0D806E8]);
  +[PKPaymentPassTableCell heightForCellWithMinimum:hasSubTitle:](PKPaymentPassTableCell, "heightForCellWithMinimum:hasSubTitle:", 1, 56.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D80938]);

  objc_msgSend(v22, "uniqueID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D80868]);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
LABEL_21:

}

- (id)_specifierForPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  id v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v35 = 0;
    goto LABEL_38;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PKPassbookSettingsController _paymentPassSpecifiers](self, "_paymentPassSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    v9 = *MEMORY[0x1E0D80868];
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
      objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if ((v13 & 1) != 0)
        goto LABEL_35;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[PKPassbookSettingsController _otherPassSpecifiers](self, "_otherPassSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    v17 = *MEMORY[0x1E0D80868];
LABEL_12:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v16)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v18);
      objc_msgSend(v11, "objectForKeyedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v4);

      if ((v20 & 1) != 0)
        goto LABEL_35;
      if (v15 == ++v18)
      {
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        if (v15)
          goto LABEL_12;
        break;
      }
    }
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[PKPassbookSettingsController _companionPassSpecifiers](self, "_companionPassSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v42;
    v24 = *MEMORY[0x1E0D80868];
LABEL_20:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v23)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v25);
      objc_msgSend(v11, "objectForKeyedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", v4);

      if ((v27 & 1) != 0)
        goto LABEL_35;
      if (v22 == ++v25)
      {
        v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        if (v22)
          goto LABEL_20;
        break;
      }
    }
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PKPassbookSettingsController _pendingCompanionPassSpecifiers](self, "_pendingCompanionPassSpecifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v38;
    v31 = *MEMORY[0x1E0D80868];
LABEL_28:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v30)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v32);
      objc_msgSend(v11, "objectForKeyedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", v4);

      if ((v34 & 1) != 0)
        break;
      if (v29 == ++v32)
      {
        v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        if (v29)
          goto LABEL_28;
        goto LABEL_34;
      }
    }
LABEL_35:
    v35 = v11;
    goto LABEL_36;
  }
LABEL_34:
  v35 = 0;
LABEL_36:

LABEL_38:
  return v35;
}

- (id)_credentialCenterSpecifiers
{
  NSArray *credentialCenterSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  credentialCenterSpecifiers = self->_credentialCenterSpecifiers;
  if (!credentialCenterSpecifiers)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", &stru_1E3E7D690);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("CREDENTIAL_CENTER_SETTINGS_CELL_FOOTER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x1E0D80848]);

    v6 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedPaymentString(CFSTR("CREDENTIAL_CENTER_SETTINGS_CELL_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setControllerLoadAction:", sel__presentCredentialCenter_);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v8, 0);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_credentialCenterSpecifiers;
    self->_credentialCenterSpecifiers = v9;

    credentialCenterSpecifiers = self->_credentialCenterSpecifiers;
  }
  return credentialCenterSpecifiers;
}

- (void)_presentCredentialCenter:(id)a3
{
  id WeakRetained;
  PKCredentialCenterViewController *v6;

  v6 = objc_alloc_init(PKCredentialCenterViewController);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "settingsController:requestsPushViewController:animated:", self, v6, a3 != 0);

}

- (id)_expiredPassesSwitchGroupSpecifiers
{
  NSArray *expiredPassesSwitchSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  expiredPassesSwitchSpecifiers = self->_expiredPassesSwitchSpecifiers;
  if (!expiredPassesSwitchSpecifiers)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", &stru_1E3E7D690);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedString(CFSTR("ALLOW_EXPIRED_PASSES_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel__setExpiredPassesSwitchSetting_forSpecifier_, sel__expiredPassesSwitchSettingForSpecifier_, 0, 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v7, 0);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_expiredPassesSwitchSpecifiers;
    self->_expiredPassesSwitchSpecifiers = v8;

    expiredPassesSwitchSpecifiers = self->_expiredPassesSwitchSpecifiers;
  }
  return expiredPassesSwitchSpecifiers;
}

- (void)_setExpiredPassesSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  PKSetExpiredPassesDisabledByUser();
}

- (id)_expiredPassesSwitchSettingForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PKExpiredPassesDisabledByUser() ^ 1);
}

- (id)_handoffSwitchGroupSpecifiers
{
  NSArray *handoffSwitchSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  NSArray *v17;
  NSArray *v18;

  handoffSwitchSpecifiers = self->_handoffSwitchSpecifiers;
  if (!handoffSwitchSpecifiers)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedPaymentString(CFSTR("ALLOW_HANDOFF_PAYMENTS_HEADER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("ALLOW_HANDOFF_PAYMENTS_FOOTER"), self->_context == 1);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D80848]);
    v10 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedPaymentString(CFSTR("ALLOW_HANDOFF_PAYMENTS_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel__setHandoffSwitchSetting_forSpecifier_, sel__handoffSwitchSettingForSpecifier_, 0, 6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setProperty:forKey:", *MEMORY[0x1E0D6A0B8], *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46F90]);

    objc_msgSend(MEMORY[0x1E0D66A60], "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEffectivelyLocked");

    if (v14 && (v16 & 1) == 0)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v7, v12, 0);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = self->_handoffSwitchSpecifiers;
    self->_handoffSwitchSpecifiers = v17;

    handoffSwitchSpecifiers = self->_handoffSwitchSpecifiers;
  }
  return handoffSwitchSpecifiers;
}

- (void)_setHandoffSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v8, "setPaymentHandoffDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);

  }
}

- (id)_handoffSwitchSettingForSpecifier:(id)a3
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    v7 = objc_msgSend(v6, "isPaymentHandoffDisabled") ^ 1;

  }
  else
  {
    v7 = 1;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
}

- (id)_showPayLaterOptionsSpecifiers
{
  BOOL v3;
  char v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSArray *showPayLaterOptionsSpecifiers;
  NSArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  uint8_t buf[8];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = -[PKPassbookSettingsController _deviceRegionSupportsApplePayLater](self, "_deviceRegionSupportsApplePayLater");
  v4 = PKPaymentOffersEligibleInDeviceRegion();
  v5 = PKHideCardBenefitPayLater();
  if (!v3 && (v4 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Pay Later offers switch not being shown in settings because payment offers and apple pay later arent supporte"
           "d in the device region";
LABEL_8:
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Pay Later offers switch not being shown in settings because payment offers were disabled";
      goto LABEL_8;
    }
LABEL_9:

    showPayLaterOptionsSpecifiers = self->_showPayLaterOptionsSpecifiers;
    self->_showPayLaterOptionsSpecifiers = 0;

    return 0;
  }
  v10 = self->_showPayLaterOptionsSpecifiers;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", &stru_1E3E7D690);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("ONLINE_PURCHASES_FOOTER"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D80848]);

    v13 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedCocoonString(CFSTR("SHOW_PAY_LATER_OPTIONS_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel__setShowPayLaterOptionsSwitchSetting_forSpecifier_, sel__showPayLaterOptionsSettingForSpecifier_, 0, 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setProperty:forKey:", *MEMORY[0x1E0D6A180], *MEMORY[0x1E0D80868]);
    objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    v19[0] = v11;
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_showPayLaterOptionsSpecifiers;
    self->_showPayLaterOptionsSpecifiers = v16;

    v10 = self->_showPayLaterOptionsSpecifiers;
  }
  return v10;
}

- (void)_setShowPayLaterOptionsSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v5;
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    -[NSObject setHidePayLaterOptions:](v9, "setHidePayLaterOptions:", objc_msgSend(v5, "BOOLValue") ^ 1);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to setHidePayLaterOptions", v10, 2u);
    }
  }

}

- (id)_showPayLaterOptionsSettingForSpecifier:(id)a3
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v10;
  uint8_t v11[16];

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "hidePayLaterOptions") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to hidePayLaterOptions", v11, 2u);
    }

    return MEMORY[0x1E0C9AAA0];
  }
}

- (BOOL)_deviceRegionSupportsApplePayLater
{
  PKAccount *payLaterAccount;
  void *v5;
  char v6;

  payLaterAccount = self->_payLaterAccount;
  if (!payLaterAccount
    || (-[PKAccount hidePayLaterInPaymentSheet](payLaterAccount, "hidePayLaterInPaymentSheet") & 1) != 0)
  {
    return 0;
  }
  -[PKAccount payLaterDetails](self->_payLaterAccount, "payLaterDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPayLaterSupportedInCurrentRegion");

  return v6;
}

- (id)_cardBenefitSpecifiers
{
  BOOL v3;
  int v4;
  int v5;
  NSObject *v6;
  NSArray *v7;
  NSArray *cardBenefitSpecifiers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  uint8_t buf[16];

  v3 = -[PKPassbookSettingsController _deviceRegionSupportsApplePayLater](self, "_deviceRegionSupportsApplePayLater");
  v4 = PKPaymentOffersEligibleInDeviceRegion();
  v5 = v4;
  if (v3 || (v4 & 1) != 0)
  {
    cardBenefitSpecifiers = self->_cardBenefitSpecifiers;
    if (!cardBenefitSpecifiers)
    {
      v10 = (void *)MEMORY[0x1E0D804E8];
      PKLocalizedPaymentOffersString(CFSTR("CARD_BENEFITS_HEADER"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupSpecifierWithName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("CARD_BENEFITS_FOOTER"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        PKLocalizedPaymentOffersString(CFSTR("CARD_BENEFITS_FOOTER"));
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D80848]);
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = (void *)MEMORY[0x1E0D804E8];
      PKLocalizedPaymentOffersString(CFSTR("CARD_BENEFITS_PAY_LATER"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, sel__setShowCardBenefitPayLaterSwitchSetting_forSpecifier_, sel__showCardBenefitPayLaterSettingForSpecifier_, 0, 6, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *MEMORY[0x1E0D80868];
      objc_msgSend(v18, "setProperty:forKey:", *MEMORY[0x1E0D6A148], *MEMORY[0x1E0D80868]);
      v20 = *MEMORY[0x1E0D80700];
      objc_msgSend(v18, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
      objc_msgSend(v15, "addObject:", v18);

      if (v5)
      {
        v21 = (void *)MEMORY[0x1E0D804E8];
        PKLocalizedPayWithPointsString(CFSTR("CARD_BENEFITS_REWARDS"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, sel__setShowCardBenefitRewardsSwitchSetting_forSpecifier_, sel__showCardBenefitRewardsSettingForSpecifier_, 0, 6, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setProperty:forKey:", *MEMORY[0x1E0D6A158], v19);
        objc_msgSend(v23, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v20);
        objc_msgSend(v15, "addObject:", v23);

      }
      v24 = (NSArray *)objc_msgSend(v15, "count");
      if (v24)
      {
        objc_msgSend(v15, "insertObject:atIndex:", v12, 0);
        v24 = (NSArray *)objc_msgSend(v15, "copy");
      }
      v25 = self->_cardBenefitSpecifiers;
      self->_cardBenefitSpecifiers = v24;

      cardBenefitSpecifiers = self->_cardBenefitSpecifiers;
    }
    return cardBenefitSpecifiers;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Card benefits switch not being shown in settings because payment offers and apple pay later arent supported in the device region", buf, 2u);
    }

    v7 = self->_cardBenefitSpecifiers;
    self->_cardBenefitSpecifiers = 0;

    return 0;
  }
}

- (void)_setShowCardBenefitPayLaterSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    objc_msgSend(v8, "setHideCardBenefitPayLater:", objc_msgSend(v5, "BOOLValue") ^ 1);

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "settingsControllerRequestsReloadSpecifiers:", self);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to setHideCardBenefitPayLater", v11, 2u);
    }

  }
}

- (id)_showCardBenefitPayLaterSettingForSpecifier:(id)a3
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v10;
  uint8_t v11[16];

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "hideCardBenefitPayLater") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to hideCardBenefitPayLater", v11, 2u);
    }

    return MEMORY[0x1E0C9AAA0];
  }
}

- (void)_setShowCardBenefitRewardsSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v5;
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    -[NSObject setHideCardBenefitRewards:](v9, "setHideCardBenefitRewards:", objc_msgSend(v5, "BOOLValue") ^ 1);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to setHideCardBenefitRewards", v10, 2u);
    }
  }

}

- (id)_showCardBenefitRewardsSettingForSpecifier:(id)a3
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v10;
  uint8_t v11[16];

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "hideCardBenefitRewards") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to hideCardBenefitRewards", v11, 2u);
    }

    return MEMORY[0x1E0C9AAA0];
  }
}

- (id)_onlinePaymentsGroupSpecifiers
{
  NSArray *onlinePaymentsSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;

  onlinePaymentsSpecifiers = self->_onlinePaymentsSpecifiers;
  if (!onlinePaymentsSpecifiers)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedVirtualCardString(CFSTR("ALLOW_ONLINE_PAYMENTS_HEADER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedVirtualCardString(CFSTR("ALLOW_ONLINE_PAYMENTS_FOOTER"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D80848]);

    v9 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedVirtualCardString(CFSTR("ALLOW_ONLINE_PAYMENTS_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, sel__setOnlinePaymentsSetting_forSpecifier_, sel__onlinePaymentsSettingForSpecifier_, 0, 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(v11, "setProperty:forKey:", CFSTR("ALLOW_ONLINE_PAYMENTS"), *MEMORY[0x1E0D80868]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v7, v11, 0);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_onlinePaymentsSpecifiers;
    self->_onlinePaymentsSpecifiers = v12;

    onlinePaymentsSpecifiers = self->_onlinePaymentsSpecifiers;
  }
  return onlinePaymentsSpecifiers;
}

- (void)_setOnlinePaymentsSetting:(id)a3 forSpecifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  PKSetSafariCredentialImportConsented();
}

- (id)_onlinePaymentsSettingForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PKSafariCredentialProvisioningConsented() == 1);
}

- (id)_orderManagementGroupSpecifiers
{
  NSArray *orderManagementSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;

  orderManagementSpecifiers = self->_orderManagementSpecifiers;
  if (!orderManagementSpecifiers)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedOrderManagementString(CFSTR("ALLOW_ORDER_MANAGEMENT_HEADER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x1E0D80868];
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("ORDER_TRACKING"), *MEMORY[0x1E0D80868]);
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("ALLOW_ORDER_MANAGEMENT_FOOTER"), 0);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedOrderManagementString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D80848]);
    v11 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedOrderManagementString(CFSTR("ALLOW_ORDER_MANAGEMENT_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel__setOrderManagementSetting_forSpecifier_, sel__orderManagementSettingForSpecifier_, 0, 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x1E0D80700];
    objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(v13, "setProperty:forKey:", *MEMORY[0x1E0D6A678], v8);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, v13, 0);
    if (objc_msgSend(MEMORY[0x1E0D67798], "isWalletVisible"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", &stru_1E3E7D690);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);
      v17 = (void *)MEMORY[0x1E0D804E8];
      PKLocalizedOrderManagementString(CFSTR("ALLOW_ORDER_MANAGEMENT_NOTIFICATIONS_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, sel__setOrderManagementNotificationsSetting_forSpecifier_, sel__orderManagementNotificationsSettingForSpecifier_, 0, 6, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v14);
      objc_msgSend(v15, "addObject:", v19);

    }
    v20 = (NSArray *)objc_msgSend(v15, "copy");
    v21 = self->_orderManagementSpecifiers;
    self->_orderManagementSpecifiers = v20;

    orderManagementSpecifiers = self->_orderManagementSpecifiers;
  }
  return orderManagementSpecifiers;
}

- (void)_setOrderManagementSetting:(id)a3 forSpecifier:(id)a4
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v8, "setOrderManagementDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);

  }
}

- (id)_orderManagementSettingForSpecifier:(id)a3
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    v7 = objc_msgSend(v6, "isOrderManagementDisabled") ^ 1;

  }
  else
  {
    v7 = 1;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
}

- (void)_setOrderManagementNotificationsSetting:(id)a3 forSpecifier:(id)a4
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v8, "setOrderManagementNotificationsDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);

  }
}

- (id)_orderManagementNotificationsSettingForSpecifier:(id)a3
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    v7 = objc_msgSend(v6, "isOrderManagementNotificationsDisabled") ^ 1;

  }
  else
  {
    v7 = 1;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
}

- (id)_bankConnectGroupSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  NSArray *obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_institutionsProviderResponses, "count"))
  {
    v3 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_SETTINGS_CONNECTED_TO_WALLET_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupSpecifierWithName:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v6;
    objc_msgSend(v25, "addObject:", v6);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = self->_institutionsProviderResponses;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v24 = *(_QWORD *)v27;
      v23 = *MEMORY[0x1E0D80780];
      v21 = *MEMORY[0x1E0D80938];
      v22 = *MEMORY[0x1E0D806E8];
      v9 = *MEMORY[0x1E0D80868];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 3, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("pkConnectedInsitution"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_opt_class(), v23);
          objc_msgSend(v11, "institution");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "institutionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("pkBankConnectInstitutionIdentifier"));

          objc_msgSend(v12, "setControllerLoadAction:", sel__showBankConnectInstitutionDetails_);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD018, v22);
          +[PKInsitutionTableCell estimatedHeightForCell](PKInsitutionTableCell, "estimatedHeightForCell");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v21);

          objc_msgSend(v11, "institution");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "institutionIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v9);

          objc_msgSend(v25, "addObject:", v12);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }

  }
  return v25;
}

- (void)_showBankConnectInstitutionDetails:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("pkBankConnectInstitutionIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController showBankConnectManagementForInstitution:accountIdentifier:sender:completion:](self, "showBankConnectManagementForInstitution:accountIdentifier:sender:completion:", v5, 0, v4, 0);

}

- (void)showBankConnectManagementForInstitution:(id)a3 accountIdentifier:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class makeViewControllerWithInstitutionIdentifier:](_MergedGlobals_659(), "makeViewControllerWithInstitutionIdentifier:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "settingsController:requestsPushViewController:animated:", self, v13, a5 != 0);
    if (v10)
    {
      -[objc_class makeViewControllerWithAccountIdentifier:institutionIdentifier:](off_1ED06C4B0(), "makeViewControllerWithAccountIdentifier:institutionIdentifier:", v10, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "settingsController:requestsPushViewController:animated:", self, v14, a5 != 0);

    }
    if (v11)
      v11[2](v11);

  }
  else if (v11)
  {
    v11[2](v11);
  }

}

- (void)showBankConnectAuthorizationFlowWithRedirectURL:(id)a3 completion:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  PKPassbookSettingsDelegate **p_delegate;
  id v9;
  id v10;
  id WeakRetained;

  v5 = a5;
  p_delegate = &self->_delegate;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsPresentAuthorizationFlowWithRedirectURL:animated:completion:", self, v10, v5, v9);

}

- (id)_defaultAppSpecifiers
{
  SESNFCAppSettingsContext *defaultWalletContext;
  NSArray *defaultAppSpecifiers;
  NSArray *v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;

  defaultWalletContext = self->_defaultWalletContext;
  if (defaultWalletContext
    && -[SESNFCAppSettingsContext shouldShowDefaultNFCAppPicker](defaultWalletContext, "shouldShowDefaultNFCAppPicker"))
  {
    defaultAppSpecifiers = self->_defaultAppSpecifiers;
    if (defaultAppSpecifiers)
    {
      v5 = defaultAppSpecifiers;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0D804C8]);
      -[SESNFCAppSettingsContext bundleId](self->_defaultWalletContext, "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithBundleID:delegate:onChange:", v8, self, &__block_literal_global_65);

      if (v9)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", &stru_1E3E7D690);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        objc_msgSend(v10, "addObject:", v9);
        v12 = (NSArray *)objc_msgSend(v10, "copy");
        v13 = self->_defaultAppSpecifiers;
        self->_defaultAppSpecifiers = v12;

        v5 = self->_defaultAppSpecifiers;
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_lockscreenSwitchGroupSpecifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  PSSpecifier *lockscreenSwitchSpecifier;
  NSArray *v12;
  NSArray *lockscreenSwitchSpecifiers;
  SESNFCAppSettingsContext *defaultWalletContext;
  _BOOL8 v15;
  void *v16;
  NSArray *v17;

  if (!self->_lockscreenSwitchSpecifiers)
  {
    if (PKPearlIsAvailable())
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", &stru_1E3E7D690);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPearlString(CFSTR("ALLOW_DOUBLE_CLICK_SIDE_BUTTON_SETTING_TITLE"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPearlString(CFSTR("ALLOW_DOUBLE_CLICK_SIDE_BUTTON_SETTING_FOOTER"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!PKHomeButtonIsAvailable() || !PKSecureElementIsAvailable())
      {
        v17 = 0;
        return v17;
      }
      v6 = (void *)MEMORY[0x1E0D804E8];
      PKLocalizedPaymentString(CFSTR("ALLOW_ACCESS_ON_LOCKSCREEN_SETTING_HEADER"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "groupSpecifierWithName:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("ALLOW_ACCESS_ON_LOCKSCREEN_SETTING_TITLE"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("ALLOW_ACCESS_ON_LOCKSCREEN_SETTING_FOOTER"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D80848]);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel__setDoubleClickSwitchSetting_forSpecifier_, sel__doubleClickSwitchSettingForSpecifier_, 0, 6, 0);
    v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    lockscreenSwitchSpecifier = self->_lockscreenSwitchSpecifier;
    self->_lockscreenSwitchSpecifier = v10;

    -[PSSpecifier setObject:forKeyedSubscript:](self->_lockscreenSwitchSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, self->_lockscreenSwitchSpecifier, 0);
    lockscreenSwitchSpecifiers = self->_lockscreenSwitchSpecifiers;
    self->_lockscreenSwitchSpecifiers = v12;

  }
  defaultWalletContext = self->_defaultWalletContext;
  if (defaultWalletContext)
    v15 = -[SESNFCAppSettingsContext doubleClickToggleVisibilityType](defaultWalletContext, "doubleClickToggleVisibilityType") == 0;
  else
    v15 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setObject:forKeyedSubscript:](self->_lockscreenSwitchSpecifier, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D80808]);

  v17 = self->_lockscreenSwitchSpecifiers;
  return v17;
}

- (void)_setDoubleClickSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  PKSetDoubleClickAllowed();
}

- (id)_doubleClickSwitchSettingForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PKDoubleClickAllowed());
}

- (void)_showCardDetails:(id)a3
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "propertyForKey:", CFSTR("pkPass"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsDetailViewControllerForPass:animated:", self, v5, 1);

}

- (id)_systemPolicyForAppSpecifiers
{
  id v3;
  PSSystemPolicyForApp *v4;
  PSSystemPolicyForApp *systemPolicyForApp;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!self->_systemPolicyForApp)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80510]);
    v4 = (PSSystemPolicyForApp *)objc_msgSend(v3, "initWithBundleIdentifier:", *MEMORY[0x1E0D6B590]);
    systemPolicyForApp = self->_systemPolicyForApp;
    self->_systemPolicyForApp = v4;

  }
  if (PKIsPhone())
    v6 = 0x10000818001;
  else
    v6 = 8486913;
  -[PSSystemPolicyForApp specifiersForPolicyOptions:force:](self->_systemPolicyForApp, "specifiersForPolicyOptions:force:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PKLocalizedPaymentString(CFSTR("ALLOW_WALLET_AND_APPLE_PAY_TO_ACCESS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v10);

  }
  return v7;
}

- (id)_defaultsGroupSpecifiers
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSRange v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPassbookSettingsDataSource deviceSupportsInAppPayments](self->_dataSource, "deviceSupportsInAppPayments");
  v5 = (void *)MEMORY[0x1E0D804E8];
  PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_GROUP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "groupSpecifierWithName:", v6);
  else
    objc_msgSend(v5, "groupSpecifierWithID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0D65188], "pk_privacyFlowForContext:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_FOOTER"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v13, *MEMORY[0x1E0D80818]);

  objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x1E0D80838]);
  v21.location = objc_msgSend(v11, "rangeOfString:", v9);
  NSStringFromRange(v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v14, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v15, *MEMORY[0x1E0D80830]);

  objc_msgSend(v7, "setProperty:forKey:", CFSTR("_openPrivacyLink"), *MEMORY[0x1E0D80820]);
  -[PKPassbookSettingsController _defaultPaymentSpecifier](self, "_defaultPaymentSpecifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  if (v4)
  {
    -[PKPassbookSettingsController _defaultShippingAddressSpecifier](self, "_defaultShippingAddressSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    -[PKPassbookSettingsController _defaultContactEmailSpecifier](self, "_defaultContactEmailSpecifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    -[PKPassbookSettingsController _defaultContactPhoneSpecifier](self, "_defaultContactPhoneSpecifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  return v3;
}

- (id)_currentDefaultPaymentPass
{
  id WeakRetained;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  objc_msgSend(WeakRetained, "defaultPaymentPassIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_paymentPasses;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
      objc_msgSend(v10, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_22;
  }
  else
  {
LABEL_9:

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_otherPasses;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v19, "uniqueID", (_QWORD)v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v4);

        if (v21)
        {
          v13 = v19;
          goto LABEL_21;
        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v16)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_21:

LABEL_22:
  return v13;
}

- (void)_updateDefaultCardsPreferences
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  PKPaymentPreference *v11;
  PKPaymentPreference *availableCards;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  PKPaymentPreferenceCard *unavailableCards;
  PKPaymentPreferenceCard *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PKPassbookSettingsController *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_paymentPasses);
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_376);
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_377);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsAtIndexes:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  objc_msgSend(WeakRetained, "defaultPaymentPassIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke_3;
  v35[3] = &unk_1E3E694C0;
  v8 = v7;
  v36 = v8;
  v9 = objc_msgSend(v3, "indexOfObjectPassingTest:", v35);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_CARD_GROUP_NAME"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (PKPaymentPreference *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671F0]), "initWithTitle:preferences:selectedIndex:readOnly:", v10, v3, v9, 0);
  availableCards = self->_availableCards;
  self->_availableCards = v11;

  if (objc_msgSend(v5, "count"))
  {
    v27 = v10;
    v28 = v8;
    v30 = self;
    PKLocalizedPaymentString(CFSTR("SETTINGS_SET_DEFAULT_PAYMENT_CARD_UNAVAILABLE_CARDS_GROUP_NAME"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v5;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v20 = objc_alloc_init(MEMORY[0x1E0D671F8]);
          objc_msgSend(v20, "setPass:", v19);
          objc_msgSend(v20, "setShouldShowCardUI:", 1);
          objc_msgSend(v20, "setIsSelectable:", 0);
          objc_msgSend(v19, "devicePrimaryPaymentApplication");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "state");

          PKDisplayableStringForPaymentApplicationState();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAvailabilityString:", v22);

          objc_msgSend(v13, "addObject:", v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v16);
    }

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D671F0]), "initWithTitle:preferences:selectedIndex:readOnly:", v26, v13, 0x7FFFFFFFFFFFFFFFLL, 1);
    unavailableCards = v30->_unavailableCards;
    v30->_unavailableCards = (PKPaymentPreferenceCard *)v23;

    v8 = v28;
    v5 = v29;
    v10 = v27;
  }
  else
  {
    v25 = self->_unavailableCards;
    self->_unavailableCards = 0;

  }
}

uint64_t __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "serialNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

BOOL __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "supportsDefaultCardSelection"))
  {
    objc_msgSend(v2, "effectiveContactlessPaymentApplicationState");
    v3 = PKPaymentApplicationStateIsPersonalized() == 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

uint64_t __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_showDefaultPaymentOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKPaymentPreferencesListViewController *v8;
  void *v9;
  PKPaymentPreferencesListViewController *v10;
  PKPaymentPreferencesListViewController *defaultCardsController;
  void *v12;
  id WeakRetained;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[PKPassbookSettingsController _updateDefaultCardsPreferences](self, "_updateDefaultCardsPreferences");
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPassbookSettingsController__showDefaultPaymentOptions___block_invoke;
  aBlock[3] = &unk_1E3E694E8;
  objc_copyWeak(&v16, &location);
  v5 = v4;
  v15 = v5;
  v6 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", self->_availableCards);
  if (self->_unavailableCards)
    objc_msgSend(v7, "addObject:");
  v8 = [PKPaymentPreferencesListViewController alloc];
  PKLocalizedPaymentString(CFSTR("SETTINGS_OPTIONS_PAYMENT_CARD_VC_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentPreferencesListViewController initWithPreferences:title:style:handler:contactFormatValidator:](v8, "initWithPreferences:title:style:handler:contactFormatValidator:", v7, v9, -[PKPassbookSettingsController _paymentPreferencesStyle](self, "_paymentPreferencesStyle"), v6, self->_contactFormatValidator);
  defaultCardsController = self->_defaultCardsController;
  self->_defaultCardsController = v10;

  if (self->_context == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v12, self->_defaultCardsController);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsPushViewController:animated:", self, self->_defaultCardsController, 1);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __59__PKPassbookSettingsController__showDefaultPaymentOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "selectedIndex");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= objc_msgSend(v7, "count"))
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(v7, "count");
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = CFSTR("not found");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v8);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 134218242;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        _os_log_error_impl(&dword_19D178000, v10, OS_LOG_TYPE_ERROR, "Could not get selected pass, count: %lu, selected: %@", buf, 0x16u);
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)

      }
    }
    else
    {
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_handleDefaultPaymentPassChangedTo:withSender:optionsController:canPrompt:", v9, *(_QWORD *)(a1 + 32), 0, 1);

    }
  }

}

- (void)_handleDefaultPaymentPassChangedTo:(id)a3 withSender:(id)a4 optionsController:(id)a5 canPrompt:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  NSString *v26;
  NSString *defaultCardIdentifier;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (objc_msgSend(v10, "isPrivateLabel") && v6)
    {
      objc_msgSend(v10, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("SETTINGS_SET_DEFAULT_PAYMENT_CARD_PRIVATE_LABEL_ALERT_TITLE_FORMAT"), CFSTR("%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("SETTINGS_SET_DEFAULT_PAYMENT_CARD_PRIVATE_LABEL_ALERT_MESSAGE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __106__PKPassbookSettingsController__handleDefaultPaymentPassChangedTo_withSender_optionsController_canPrompt___block_invoke;
      v28[3] = &unk_1E3E638A8;
      v28[4] = self;
      v29 = v10;
      v30 = v11;
      v19 = v12;
      v31 = v19;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addAction:", v20);
      v21 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("CANCEL"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addAction:", v23);
      objc_msgSend(v19, "presentViewController:animated:completion:", v16, 1, 0);

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
      objc_msgSend(v10, "uniqueID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setDefaultPaymentPassIdentifier:", v25);

      if (self->_defaultCardIdentifier)
      {
        objc_msgSend(v10, "uniqueID");
        v26 = (NSString *)objc_claimAutoreleasedReturnValue();
        defaultCardIdentifier = self->_defaultCardIdentifier;
        self->_defaultCardIdentifier = v26;

      }
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "settingsController:requestsReloadSpecifier:", self, v11);
    }

  }
}

uint64_t __106__PKPassbookSettingsController__handleDefaultPaymentPassChangedTo_withSender_optionsController_canPrompt___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDefaultPaymentPassChangedTo:withSender:optionsController:canPrompt:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

- (void)_openPrivacyLink
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  objc_msgSend(MEMORY[0x1E0D65198], "pk_presenterForContext:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
    objc_msgSend(v7, "setModalPresentationStyle:", 2);
  if (self->_context == 1)
  {
    objc_msgSend(v7, "splashController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BPSBridgeTintColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v5);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsControllerRequestsPresentPrivacyWithPresenter:", v7);

}

- (id)_defaultPaymentSpecifier
{
  char *v3;
  void *v4;
  PSSpecifier *defaultPaymentSpecifier;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_defaultPaymentSpecifier)
  {
    v3 = (char *)objc_alloc_init(MEMORY[0x1E0D804E8]);
    *(_QWORD *)&v3[*MEMORY[0x1E0D805B0]] = 2;
    objc_msgSend(v3, "setTarget:", self);
    *(_QWORD *)&v3[*MEMORY[0x1E0D805C0]] = sel__getDefaultPaymentCard;
    objc_msgSend(v3, "setControllerLoadAction:", sel__showDefaultPaymentOptions_);
    PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_PAYMENT_CARD"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v4);

    objc_msgSend(v3, "setProperty:forKey:", CFSTR("SETTINGS_TRANSACTION_DEFAULTS_PAYMENT_CARD"), *MEMORY[0x1E0D80868]);
    defaultPaymentSpecifier = self->_defaultPaymentSpecifier;
    self->_defaultPaymentSpecifier = (PSSpecifier *)v3;

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_paymentPasses;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "contactlessActivationState", (_QWORD)v13))
        {

          if (PKStoreDemoModeEnabled())
            v11 = MEMORY[0x1E0C9AAA0];
          else
            v11 = MEMORY[0x1E0C9AAB0];
          goto LABEL_15;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  v11 = MEMORY[0x1E0C9AAA0];
LABEL_15:
  -[PSSpecifier setProperty:forKey:](self->_defaultPaymentSpecifier, "setProperty:forKey:", v11, *MEMORY[0x1E0D80808], (_QWORD)v13);
  return self->_defaultPaymentSpecifier;
}

- (id)_getDefaultPaymentCard
{
  id WeakRetained;
  NSString *v4;
  NSString *defaultCardIdentifier;
  id v6;
  void *v7;
  __CFString *v8;

  if (!self->_defaultCardIdentifier)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    objc_msgSend(WeakRetained, "defaultPaymentPassIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultCardIdentifier = self->_defaultCardIdentifier;
    self->_defaultCardIdentifier = v4;

  }
  if (-[NSArray count](self->_paymentPasses, "count") && self->_defaultCardIdentifier)
  {
    v6 = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
    objc_msgSend(v6, "passWithUniqueID:", self->_defaultCardIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E3E7D690;
  }
  return v8;
}

- (id)_defaultShippingAddressSpecifier
{
  PSSpecifier *defaultShippingAddressSpecifier;
  char *v4;
  void *v5;
  uint64_t v6;
  PSSpecifier *v7;

  defaultShippingAddressSpecifier = self->_defaultShippingAddressSpecifier;
  if (!defaultShippingAddressSpecifier)
  {
    v4 = (char *)objc_alloc_init(MEMORY[0x1E0D804E8]);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805B0]] = 2;
    objc_msgSend(v4, "setTarget:", self);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805C0]] = sel__getDefaultShippingAddress;
    objc_msgSend(v4, "setControllerLoadAction:", sel__showDefaultShippingAddressOptions_);
    PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_SHIPPING_ADDRESS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(v4, "setProperty:forKey:", CFSTR("SETTINGS_TRANSACTION_DEFAULTS_SHIPPING_ADDRESS"), *MEMORY[0x1E0D80868]);
    if (PKStoreDemoModeEnabled())
      v6 = MEMORY[0x1E0C9AAA0];
    else
      v6 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80808]);
    v7 = self->_defaultShippingAddressSpecifier;
    self->_defaultShippingAddressSpecifier = (PSSpecifier *)v4;

    defaultShippingAddressSpecifier = self->_defaultShippingAddressSpecifier;
  }
  return defaultShippingAddressSpecifier;
}

- (id)_defaultContactEmailSpecifier
{
  PSSpecifier *defaultContactEmailSpecifier;
  char *v4;
  void *v5;
  uint64_t v6;
  PSSpecifier *v7;

  defaultContactEmailSpecifier = self->_defaultContactEmailSpecifier;
  if (!defaultContactEmailSpecifier)
  {
    v4 = (char *)objc_alloc_init(MEMORY[0x1E0D804E8]);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805B0]] = 2;
    objc_msgSend(v4, "setTarget:", self);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805C0]] = sel__getDefaultContactEmail;
    objc_msgSend(v4, "setControllerLoadAction:", sel__showDefaultContactEmailOptions_);
    PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_EMAIL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(v4, "setProperty:forKey:", CFSTR("SETTINGS_TRANSACTION_DEFAULTS_EMAIL"), *MEMORY[0x1E0D80868]);
    if (PKStoreDemoModeEnabled())
      v6 = MEMORY[0x1E0C9AAA0];
    else
      v6 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80808]);
    v7 = self->_defaultContactEmailSpecifier;
    self->_defaultContactEmailSpecifier = (PSSpecifier *)v4;

    defaultContactEmailSpecifier = self->_defaultContactEmailSpecifier;
  }
  return defaultContactEmailSpecifier;
}

- (id)_defaultContactPhoneSpecifier
{
  PSSpecifier *defaultContactPhoneSpecifier;
  char *v4;
  void *v5;
  uint64_t v6;
  PSSpecifier *v7;

  defaultContactPhoneSpecifier = self->_defaultContactPhoneSpecifier;
  if (!defaultContactPhoneSpecifier)
  {
    v4 = (char *)objc_alloc_init(MEMORY[0x1E0D804E8]);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805B0]] = 2;
    objc_msgSend(v4, "setTarget:", self);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805C0]] = sel__getDefaultContactPhone;
    objc_msgSend(v4, "setControllerLoadAction:", sel__showDefaultContactPhoneOptions_);
    PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_PHONE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(v4, "setProperty:forKey:", CFSTR("SETTINGS_TRANSACTION_DEFAULTS_PHONE"), *MEMORY[0x1E0D80868]);
    if (PKStoreDemoModeEnabled())
      v6 = MEMORY[0x1E0C9AAA0];
    else
      v6 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80808]);
    v7 = self->_defaultContactPhoneSpecifier;
    self->_defaultContactPhoneSpecifier = (PSSpecifier *)v4;

    defaultContactPhoneSpecifier = self->_defaultContactPhoneSpecifier;
  }
  return defaultContactPhoneSpecifier;
}

- (void)_showDefaultShippingAddressOptions:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  PKPaymentPreferencesListViewController *v19;
  void *v20;
  PKPaymentPreferencesListViewController *v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  PKPassbookSettingsController *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  objc_msgSend(WeakRetained, "defaultShippingAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safelyAddObject:", v7);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_SHIPPINGADDRESSES_GROUP_NAME"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D67200]);
  if (objc_msgSend(v5, "count"))
    v10 = 0;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = (void *)objc_msgSend(v9, "initWithTitle:preferences:selectedIndex:readOnly:", v8, v5, v10, 0);
  objc_msgSend(v11, "setType:", 1);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_POSTALADDRESSES"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAddNewTitle:", v12);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_POSTALADDRESSES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAddExistingTitle:", v13);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_POSTALADDRESSES"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEditExistingTitle:", v14);

  objc_msgSend(v11, "setContactKey:", *MEMORY[0x1E0C967F0]);
  objc_msgSend(v11, "mergeRecentsAndMeCard");
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(v11, "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
  PKContactFormatAssignFormatErrorsToPreferenceContact();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassbookSettingsController__showDefaultShippingAddressOptions___block_invoke;
  aBlock[3] = &unk_1E3E69510;
  v24 = v11;
  v25 = self;
  v26 = v4;
  v15 = v4;
  v16 = v11;
  v17 = _Block_copy(aBlock);
  PKLocalizedPaymentString(CFSTR("SETTINGS_OPTIONS_SHIPPING_ADDRESS_VC_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [PKPaymentPreferencesListViewController alloc];
  v27[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKPaymentPreferencesListViewController initWithPreferences:title:style:handler:contactFormatValidator:](v19, "initWithPreferences:title:style:handler:contactFormatValidator:", v20, v18, -[PKPassbookSettingsController _paymentPreferencesStyle](self, "_paymentPreferencesStyle"), v17, self->_contactFormatValidator);

  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v22, "settingsController:requestsPushViewController:animated:", self, v21, 1);

}

void __67__PKPassbookSettingsController__showDefaultShippingAddressOptions___block_invoke(uint64_t a1)
{
  void *WeakRetained;
  void *v3;
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
    objc_msgSend(WeakRetained, "setDefaultShippingAddress:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "preferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setContactSource:", 2);
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
    objc_msgSend(v4, "setDefaultShippingAddress:", WeakRetained);

  }
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  objc_msgSend(v5, "settingsController:requestsReloadSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_showDefaultContactEmailOptions:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  PKPaymentPreferencesListViewController *v19;
  void *v20;
  PKPaymentPreferencesListViewController *v21;
  PKHideMyEmailManager *hideMyEmailManager;
  id v23;
  PKPaymentPreferencesListViewController *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  PKPaymentPreferencesListViewController *v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;
  id location;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  objc_msgSend(WeakRetained, "defaultContactEmail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safelyAddObject:", v7);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EMAILADDRESSES_GROUP_NAME"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D67200]);
  if (objc_msgSend(v5, "count"))
    v9 = 0;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = (void *)objc_msgSend(v8, "initWithTitle:preferences:selectedIndex:readOnly:", v26, v5, v9, 0);
  objc_msgSend(v10, "setType:", 1);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_EMAILADDRESSES"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAddNewTitle:", v11);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_EMAILADDRESSES"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAddExistingTitle:", v12);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_EMAILADDRESSES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditExistingTitle:", v13);

  objc_msgSend(v10, "setContactKey:", *MEMORY[0x1E0C966A8]);
  objc_msgSend(v10, "mergeRecentsAndMeCard");
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(v10, "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
  PKContactFormatAssignFormatErrorsToPreferenceContact();
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke;
  aBlock[3] = &unk_1E3E69538;
  objc_copyWeak(&v33, &location);
  v15 = v10;
  v31 = v15;
  v16 = v4;
  v32 = v16;
  v17 = _Block_copy(aBlock);
  PKLocalizedPaymentString(CFSTR("SETTINGS_OPTIONS_CONTACT_VC_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [PKPaymentPreferencesListViewController alloc];
  v35[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKPaymentPreferencesListViewController initWithPreferences:title:style:handler:contactFormatValidator:](v19, "initWithPreferences:title:style:handler:contactFormatValidator:", v20, v18, -[PKPassbookSettingsController _paymentPreferencesStyle](self, "_paymentPreferencesStyle"), v17, self->_contactFormatValidator);

  hideMyEmailManager = self->_hideMyEmailManager;
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_2;
  v27[3] = &unk_1E3E69580;
  v27[4] = self;
  v23 = v15;
  v28 = v23;
  v24 = v21;
  v29 = v24;
  -[PKHideMyEmailManager isAvailable:](hideMyEmailManager, "isAvailable:", v27);
  v25 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v25, "settingsController:requestsPushViewController:animated:", self, v24, 1);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id *v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v15 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = objc_loadWeakRetained(v15 + 4);
      objc_msgSend(v3, "setDefaultContactEmail:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      v6 = v5 - 1;
      if (v5 >= 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "preferences");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isHideMyEmail");

        if (v9)
        {
          v10 = objc_msgSend(*(id *)(a1 + 32), "selectedIndex");
          v11 = objc_loadWeakRetained(v15 + 4);
          objc_msgSend(v11, "setUseHideMyEmail:", v10 == v6);

          if (v10 == v6)
            goto LABEL_9;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      PKContactFormatAssignEmailFormatErrorToPreferenceForContact();
      v13 = objc_loadWeakRetained(v15 + 4);
      objc_msgSend(v13, "setDefaultContactEmail:", v3);

    }
LABEL_9:
    v14 = objc_loadWeakRetained(v15 + 81);
    objc_msgSend(v14, "settingsController:requestsReloadSpecifier:", v15, *(_QWORD *)(a1 + 40));

    WeakRetained = v15;
  }

}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = 1;
  if (!a2)
    v3 = 2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632) = v3;
  if (!a3)
  {
    if (a2)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_3;
      block[3] = &unk_1E3E61400;
      v5 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v7 = v5;
      v8 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_msgSend(WeakRetained, "useHideMyEmail");

  objc_msgSend(*(id *)(a1 + 40), "addHideMyEmailPreference:", v3);
  PKLocalizedHideMyEmailString(CFSTR("HME_SETTINGS_DESCRIPTION_LINK_FORMAT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedHideMyEmailString(CFSTR("HME_SETTINGS_DESCRIPTION_LINK_TEXT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringWithValidatedFormat();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfString:", v5, v5);
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "setFooter:", v6);
  objc_msgSend(*(id *)(a1 + 40), "setFooterLinkRange:", v7, v9);
  objc_msgSend(*(id *)(a1 + 40), "setFooterLinkActionBlock:", &__block_literal_global_455);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67200]), "initWithTitle:preferences:selectedIndex:readOnly:", 0, 0, 0, 1);
  objc_msgSend(v10, "setContactKey:", *MEMORY[0x1E0C966A8]);
  objc_msgSend(*(id *)(a1 + 40), "addNewTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAddNewTitle:", v11);

  objc_msgSend(*(id *)(a1 + 40), "addExistingTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAddExistingTitle:", v12);

  objc_msgSend(*(id *)(a1 + 48), "setPreferenceHasSeparateAddItemsSection:", 1);
  v13 = *(void **)(a1 + 48);
  v15[0] = *(_QWORD *)(a1 + 40);
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferences:", v14);

}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E98]);
  v2 = (id)objc_msgSend(v0, "initWithString:", *MEMORY[0x1E0D6A168]);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "openSensitiveURL:withOptions:", v2, 0);

  }
}

- (void)_showDefaultContactPhoneOptions:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  PKPaymentPreferencesListViewController *v19;
  void *v20;
  PKPaymentPreferencesListViewController *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  objc_msgSend(WeakRetained, "defaultContactPhone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safelyAddObject:", v7);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_PHONENUMBERS_GROUP_NAME"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D67200]);
  if (objc_msgSend(v5, "count"))
    v10 = 0;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = (void *)objc_msgSend(v9, "initWithTitle:preferences:selectedIndex:readOnly:", v8, v5, v10, 0);
  objc_msgSend(v11, "setType:", 1);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_PHONENUMBERS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAddNewTitle:", v12);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_PHONENUMBERS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAddExistingTitle:", v13);

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_PHONENUMBERS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEditExistingTitle:", v14);

  objc_msgSend(v11, "setContactKey:", *MEMORY[0x1E0C967C0]);
  objc_msgSend(v11, "mergeRecentsAndMeCard");
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(v11, "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
  PKContactFormatAssignFormatErrorsToPreferenceContact();
  objc_initWeak(&location, self);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __64__PKPassbookSettingsController__showDefaultContactPhoneOptions___block_invoke;
  v26 = &unk_1E3E69538;
  objc_copyWeak(&v29, &location);
  v15 = v11;
  v27 = v15;
  v16 = v4;
  v28 = v16;
  v17 = _Block_copy(&v23);
  PKLocalizedPaymentString(CFSTR("SETTINGS_OPTIONS_CONTACT_VC_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [PKPaymentPreferencesListViewController alloc];
  v31[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1, v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKPaymentPreferencesListViewController initWithPreferences:title:style:handler:contactFormatValidator:](v19, "initWithPreferences:title:style:handler:contactFormatValidator:", v20, v18, -[PKPassbookSettingsController _paymentPreferencesStyle](self, "_paymentPreferencesStyle"), v17, self->_contactFormatValidator);

  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v22, "settingsController:requestsPushViewController:animated:", self, v21, 1);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __64__PKPassbookSettingsController__showDefaultContactPhoneOptions___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = objc_loadWeakRetained(v7 + 4);
      objc_msgSend(v3, "setDefaultContactPhone:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      PKContactFormatAssignPhoneFormatErrorToPreferenceForContact();
      v5 = objc_loadWeakRetained(v7 + 4);
      objc_msgSend(v5, "setDefaultContactPhone:", v3);

    }
    v6 = objc_loadWeakRetained(v7 + 81);
    objc_msgSend(v6, "settingsController:requestsReloadSpecifier:", v7, *(_QWORD *)(a1 + 40));

    WeakRetained = v7;
  }

}

- (id)_getDefaultShippingAddress
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  objc_msgSend(WeakRetained, "defaultShippingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_DEFAULT_ADDRESS_LABEL"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)_getDefaultContactEmail
{
  id WeakRetained;
  int64_t context;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  if (self->_isHideMyEmailAvailable == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
    if ((objc_msgSend(WeakRetained, "useHideMyEmail") & 1) != 0)
    {
      context = self->_context;

      if (!context)
      {
        PKLocalizedHideMyEmailString(CFSTR("HME_SETTINGS_ROW_TITLE"));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_8;
      }
    }
    else
    {

    }
  }
  v6 = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  objc_msgSend(v6, "defaultContactEmail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "value");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  if (-[__CFString length](v5, "length"))
    v10 = v5;
  else
    v10 = &stru_1E3E7D690;
  v11 = v10;

  return v11;
}

- (id)_getDefaultContactPhone
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  objc_msgSend(WeakRetained, "defaultContactPhone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkFormattedStringValue");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = &stru_1E3E7D690;
  v9 = v8;

  return v9;
}

- (id)_openAccountsGroupSpecifiers
{
  id v3;
  PSSpecifier *openAccountGroupSpecifier;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_openAccounts, "count"))
  {
    openAccountGroupSpecifier = self->_openAccountGroupSpecifier;
    if (!openAccountGroupSpecifier)
    {
      v5 = (void *)MEMORY[0x1E0D804E8];
      PKLocalizedFeatureString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupSpecifierWithName:", v6);
      v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v8 = self->_openAccountGroupSpecifier;
      self->_openAccountGroupSpecifier = v7;

      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setObject:forKeyedSubscript:](self->_openAccountGroupSpecifier, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D80848]);

      -[PSSpecifier setObject:forKeyedSubscript:](self->_openAccountGroupSpecifier, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D67FC0], *MEMORY[0x1E0D80868]);
      openAccountGroupSpecifier = self->_openAccountGroupSpecifier;
    }
    objc_msgSend(v3, "addObject:", openAccountGroupSpecifier);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_openAccounts;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v16, "type", (_QWORD)v19) == 4)
          {
            v17 = v16;

            v13 = v17;
          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);

      if (!v13)
        goto LABEL_17;
      -[PKPassbookSettingsController _accountSpecifierForAccount:](self, "_accountSpecifierForAccount:", v13);
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);
    }
    else
    {
      v13 = 0;
    }

LABEL_17:
  }
  return v3;
}

- (id)_closedAccountsGroupSpecifiers
{
  id v3;
  PSSpecifier *closedAccountGroupSpecifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_closedSavingsAccounts, "count"))
  {
    closedAccountGroupSpecifier = self->_closedAccountGroupSpecifier;
    if (!closedAccountGroupSpecifier)
    {
      v5 = (void *)MEMORY[0x1E0D804E8];
      PKLocalizedFeatureString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupSpecifierWithName:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D80848]);
      v9 = self->_closedAccountGroupSpecifier;
      self->_closedAccountGroupSpecifier = (PSSpecifier *)v7;

      closedAccountGroupSpecifier = self->_closedAccountGroupSpecifier;
    }
    objc_msgSend(v3, "addObject:", closedAccountGroupSpecifier);
    v10 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD018, *MEMORY[0x1E0D806E8]);
    objc_msgSend(v12, "setControllerLoadAction:", sel_showDocumentsForClosedSavingsAccounts_);
    objc_msgSend(v3, "addObject:", v12);

  }
  return v3;
}

- (id)_accountSpecifierForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 4)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3FAD018, *MEMORY[0x1E0D806E8]);
    +[PKAccountTableCell estimatedHeightForCell](PKAccountTableCell, "estimatedHeightForCell");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80938]);

    objc_msgSend(v4, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80868]);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("pkAccount"));
    objc_msgSend(v5, "setControllerLoadAction:", sel__showAccountInfoForSavingsAccountSpecifier_);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)showDocumentsForClosedSavingsAccounts:(id)a3
{
  NSMutableArray *closedSavingsAccounts;
  id v5;
  id v6;

  closedSavingsAccounts = self->_closedSavingsAccounts;
  v5 = a3;
  PKLocalizedFeatureString();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController _showDocumentsForAccounts:title:sender:](self, "_showDocumentsForAccounts:title:sender:", closedSavingsAccounts, v6, v5);

}

- (void)_showDocumentsForAccounts:(id)a3 title:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  PKAccountDocumentsViewController *v10;
  void *v11;
  id WeakRetained;
  PKAccountDocumentsViewInterfaceConfiguration *v13;

  v8 = a4;
  v9 = a3;
  v13 = objc_alloc_init(PKAccountDocumentsViewInterfaceConfiguration);
  -[PKAccountDocumentsViewInterfaceConfiguration setAccounts:](v13, "setAccounts:", v9);

  v10 = -[PKAccountDocumentsViewController initWithConfiguration:]([PKAccountDocumentsViewController alloc], "initWithConfiguration:", v13);
  -[PKAccountDocumentsViewController navigationItem](v10, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "settingsController:requestsPushViewController:animated:", self, v10, a5 != 0);

}

- (void)showSavingsAccount:(id)a3 destination:(unint64_t)a4 transaction:(id)a5 fundingSource:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  PKSavingsAccountDetailsViewController *v21;
  id WeakRetained;
  PKAccountViewInterfaceConfiguration *v23;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  -[PKPassbookSettingsController _updateAccountIfNecessary:](self, "_updateAccountIfNecessary:", v14);
  v23 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
  -[PKAccountViewInterfaceConfiguration setAccount:](v23, "setAccount:", v14);
  -[PKAccountViewInterfaceConfiguration setViewStyle:](v23, "setViewStyle:", 1);
  -[PKAccountViewInterfaceConfiguration setTransaction:](v23, "setTransaction:", v13);

  -[PKAccountViewInterfaceConfiguration setFundingSource:](v23, "setFundingSource:", v12);
  objc_msgSend(v14, "savingsDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "fccStepUpDetails");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "thresholdExceeded");

  if (v12)
    v18 = 0;
  else
    v18 = a4 == 12;
  v19 = 4;
  if (!v18)
    v19 = a4;
  if (v17)
    v20 = 11;
  else
    v20 = v19;
  -[PKAccountViewInterfaceConfiguration setDestination:](v23, "setDestination:", v20);
  v21 = -[PKSavingsAccountDetailsViewController initWithConfiguration:]([PKSavingsAccountDetailsViewController alloc], "initWithConfiguration:", v23);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "settingsController:requestsPushViewController:animated:", self, v21, v7);

}

- (void)_showAccountInfoForSavingsAccountSpecifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pkAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[PKPassbookSettingsController showSavingsAccount:destination:transaction:fundingSource:animated:](self, "showSavingsAccount:destination:transaction:fundingSource:animated:", v4, 1, 0, 0, 1);
    v4 = v5;
  }

}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPassbookSettingsController_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __80__PKPassbookSettingsController_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_defaultPaymentSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", v2, v3);

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKPassbookSettingsController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __99__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(result + 40), "_updateBalancesWithServerBalances:transitPassProperties:forPassWithUniqueIdentifier:", 0, v1, *(_QWORD *)(result + 48));
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __88__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBalancesWithServerBalances:transitPassProperties:forPassWithUniqueIdentifier:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)_peerPaymentWebServiceDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKPassbookSettingsController__peerPaymentWebServiceDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __76__PKPassbookSettingsController__peerPaymentWebServiceDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshPeerPaymentStatus");
}

- (void)_peerPaymentAccountDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPassbookSettingsController__peerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__PKPassbookSettingsController__peerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 448);
  *(_QWORD *)(v4 + 448) = v3;

  objc_msgSend(*(id *)(a1 + 32), "_refreshPasses");
  return objc_msgSend(*(id *)(a1 + 32), "refreshPeerPaymentStatus");
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  PKPassbookSettingsDelegate **p_delegate;
  id v8;
  id WeakRetained;

  v5 = a5;
  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsPresentViewController:animated:completion:", self, v8, v5, 0);

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", self, 1, 0);

}

- (BOOL)_isPeerPaymentRegistered
{
  int v3;
  void *v5;

  if ((PKUseMockSURFServer() & 1) != 0 || (PKStoreDemoModeEnabled() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if ((-[PKPeerPaymentWebService needsRegistration](self->_peerPaymentWebService, "needsRegistration") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "userHasDisabledPeerPayment") ^ 1;

  }
  return v3;
}

- (void)_registerForPeerPaymentWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  PKPassbookPeerPaymentSettingsDelegate *peerPaymentDelegate;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  char v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD aBlock[5];
  id v35;

  v4 = a3;
  self->_registeringForPeerPayment = 1;
  -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userHasDisabledPeerPayment");

  -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserHasDisabledPeerPayment:", 0);

  v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", self, v4);

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke;
  aBlock[3] = &unk_1E3E61388;
  aBlock[4] = self;
  v11 = v4;
  v35 = v11;
  v12 = _Block_copy(aBlock);
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_2;
  v31[3] = &unk_1E3E65388;
  v31[4] = self;
  v13 = v11;
  v32 = v13;
  v14 = v12;
  v33 = v14;
  v15 = _Block_copy(v31);
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_4;
  v28[3] = &unk_1E3E695A8;
  v28[4] = self;
  v30 = v6;
  v16 = v14;
  v29 = v16;
  v17 = _Block_copy(v28);
  peerPaymentDelegate = self->_peerPaymentDelegate;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_5;
  v23[3] = &unk_1E3E69648;
  v23[4] = self;
  v24 = v13;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v19 = v15;
  v20 = v16;
  v21 = v13;
  v22 = v17;
  -[PKPassbookPeerPaymentSettingsDelegate peerPaymentRegistrationStatusHasChanged:completion:](peerPaymentDelegate, "peerPaymentRegistrationStatusHasChanged:completion:", 1, v23);

}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_refreshPasses");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isPeerPaymentRegistered"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", *(_QWORD *)(a1 + 32));

}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_3;
  v3[3] = &unk_1E3E614F0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_presentPeerPaymentSetupFlowForSpecifier:completion:", v2, v3);

}

uint64_t __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_requestDelegatePresentViewController:", v4);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "targetDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserHasDisabledPeerPayment:", 1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_6;
  block[3] = &unk_1E3E69620;
  v17 = a2;
  v11 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = v6;
  v12 = v7;
  v13 = v8;
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_6(uint64_t a1)
{
  int v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id WeakRetained;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  uint8_t buf[8];
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;

  v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "targetDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 448);
    *(_QWORD *)(v16 + 448) = v15;
    v33 = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "setAccount:", v33);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    return;
  }
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D6B2D8];
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6B2D8]))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (!v9)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_TITLE"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_MESSAGE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);
LABEL_8:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_25:
      goto LABEL_26;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D6AD28]) || objc_msgSend(v6, "code") != 9)
  {

LABEL_16:
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", v8) && objc_msgSend(*(id *)(a1 + 32), "code") == 40308)
      {
        v27 = PKIsAltAccountPairedOrPairing();

        if (v27)
        {
          PKLogFacilityTypeGetObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v28, OS_LOG_TYPE_DEFAULT, "A parent tried to turn on apple cash for a childs tinker device.", buf, 2u);
          }

          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_DASHBOARD_FAMILY_SHARING_TITLE"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_DASHBOARD_FAMILY_SHARING_MESSAGE"));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_DASHBOARD_FAMILY_SHARING_BUTTON"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v10, 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_504;
          v34[3] = &unk_1E3E61D68;
          v34[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v11, 0, v34);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAction:", v29);

          v30 = (void *)MEMORY[0x1E0DC3448];
          PKLocalizedString(CFSTR("CANCEL"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAction:", v32);

          goto LABEL_8;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_25;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) == 0)
    goto LABEL_16;
  v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_7;
  v36[3] = &unk_1E3E695F8;
  v22 = *(_QWORD *)(a1 + 40);
  v23 = *(id *)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 40);
  v25 = *(void **)(a1 + 48);
  v37 = v23;
  v38 = v24;
  v39 = v25;
  v40 = *(id *)(a1 + 64);
  v41 = *(id *)(a1 + 56);
  objc_msgSend(v21, "settingsController:requestsPresentSecurityRepairFlowWithSecurityCapabilities:completion:", v22, 72, v36);

  v12 = v37;
LABEL_26:

}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_8;
  v6[3] = &unk_1E3E695D0;
  v12 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesErrorToString(*(_QWORD *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking peer payment security capabilities with upgrade error %@, error %@", (uint8_t *)&v8, 0x16u);

  }
  v5 = *(_QWORD *)(a1 + 72);
  if (v5 == 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_registerForPeerPaymentWithSpecifier:", *(_QWORD *)(a1 + 48));
  }
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_504(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "_appleAccountInformation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aaAlternateDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presenting apple cash family sharing in settings for altDSID %@", (uint8_t *)&v6, 0xCu);
  }

  PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)_presentFeatureNotEnabledForDemoForSpecifier:(id)a3
{
  void *v4;
  id v5;

  PKUIStoreDemoGatewayViewController();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingsController:requestsPresentViewController:animated:completion:", self, v5, 1, 0);

}

- (void)_presentPeerPaymentReOpenCardFlowForSpecifier:(id)a3
{
  if (-[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution", a3) == 4)-[PKPeerPaymentAccountResolutionController presentResolutionForCurrentAccountStateWithCompletion:](self->_peerPaymentAccountResolutionController, "presentResolutionForCurrentAccountStateWithCompletion:", 0);
}

- (void)_presentPeerPaymentSetupFlowForSpecifier:(id)a3
{
  -[PKPassbookSettingsController _presentPeerPaymentSetupFlowForSpecifier:completion:](self, "_presentPeerPaymentSetupFlowForSpecifier:completion:", a3, 0);
}

- (void)_presentPeerPaymentSetupFlowForSpecifier:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  if (-[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution") == 1)
  {
    -[PKPeerPaymentAccountResolutionController presentResolutionForCurrentAccountStateWithCompletion:](self->_peerPaymentAccountResolutionController, "presentResolutionForCurrentAccountStateWithCompletion:", v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (void)_presentPeerPaymentSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 senderAddress:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  if (-[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution") == 1)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D673D8]);
    if (v13)
      objc_msgSend(v12, "setCurrencyAmount:", v13);
    objc_msgSend(v12, "setRegistrationFlowState:", a4);
    if (v10)
      objc_msgSend(v12, "setSenderAddress:", v10);
    -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_peerPaymentAccountResolutionController, "presentFlowForAccountResolution:configuration:completion:", 1, v12, v11);

  }
  else if (v11)
  {
    v11[2](v11, 0);
  }

}

- (void)_unregisterForPeerPaymentWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  _QWORD v66[5];
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  id v71;
  id v72;
  _QWORD v73[5];
  id v74;

  v4 = a3;
  -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "associatedPassUniqueID");
  v7 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  objc_msgSend(WeakRetained, "passWithUniqueID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secureElementPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "hasMerchantTokens");
  -[PKPeerPaymentWebService peerPaymentService](self->_peerPaymentWebService, "peerPaymentService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasRecurringPayments");

  v61 = (void *)v7;
  v63 = v6;
  v59 = v10;
  if (self->_context == 1 && PKIsAltAccountPairedOrPairing())
  {
    v14 = v11;
    v15 = objc_alloc(MEMORY[0x1E0D66D80]);
    objc_msgSend(MEMORY[0x1E0D035F8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedTinkerFamilyMemeber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFAFamilyMember:", v17);

    objc_msgSend(v18, "firstName");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v18, "appleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v18, "firstName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_BRIDGE_APPLE_CASH_FAMILY_TURN_OFF_ALERT_TITLE"), CFSTR("%@"), v22);
        v64 = objc_claimAutoreleasedReturnValue();

        v11 = v14;
        LODWORD(v22) = v14 & v13;
        objc_msgSend(v18, "firstName");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if ((_DWORD)v22 == 1)
        {
          objc_msgSend(v18, "firstName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appleID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_APPLE_CASH_FAMILY_SHEET_MESSAGE"), CFSTR("%@%@%@"), v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_PEER_PAYMENT_ALERT_RECURRING_MESSAGE"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v27, v28);
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v11)
          {
            v32 = v64;
            v27 = (void *)v23;
            if (v13)
            {
              objc_msgSend(v18, "firstName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "appleID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_PEER_PAYMENT_ALERT_FAMILY_MESSAGE"), CFSTR("%@%@%@"), v24, v28, v57);
              v29 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v18, "appleID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_BRIDGE_APPLE_CASH_FAMILY_TURN_OFF_ALERT_MESSAGE"), CFSTR("%@%@"), v24, v28);
              v29 = objc_claimAutoreleasedReturnValue();
            }
LABEL_25:

            v30 = (void *)v29;
            if (v32)
              goto LABEL_19;
            goto LABEL_8;
          }
          objc_msgSend(v18, "firstName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appleID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v24;
          PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_APPLE_CASH_FAMILY_SHEET_MESSAGE"), CFSTR("%@%@%@"), v24, v28, v56);
          v29 = objc_claimAutoreleasedReturnValue();

        }
        v32 = v64;
        goto LABEL_25;
      }
    }

    v30 = 0;
    v11 = v14;
  }
  else
  {
    v30 = 0;
  }
LABEL_8:
  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_TURN_OFF_ALERT_TITLE"), self->_context == 1);
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(v31);
  v32 = objc_claimAutoreleasedReturnValue();

  PKPrimaryAppleAccountFormattedUsername();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if ((v11 & v13) == 1)
  {
    PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_APPLE_CASH_SHEET_MESSAGE"), CFSTR("%@"), v33);
    v35 = objc_claimAutoreleasedReturnValue();

    PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_PEER_PAYMENT_ALERT_RECURRING_MESSAGE"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v36;
    v34 = (void *)v35;
  }
  else
  {
    if (v11)
    {
      PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_APPLE_CASH_SHEET_MESSAGE"), CFSTR("%@"), v33);
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13)
        PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_PEER_PAYMENT_ALERT_MESSAGE"), CFSTR("%@"), v33);
      else
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TURN_OFF_ALERT_MESSAGE"), CFSTR("%@"), v33);
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v37 = v38;
  }

  v30 = (void *)v37;
LABEL_19:
  v58 = v11;
  v60 = v30;
  v65 = (void *)v32;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v32, v30, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = MEMORY[0x1E0C809B0];
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke;
  v73[3] = &unk_1E3E61D90;
  v73[4] = self;
  v43 = v4;
  v74 = v43;
  objc_msgSend(v40, "actionWithTitle:style:handler:", v41, 1, v73);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TURN_OFF_ALERT_BUTTON_TURN_OFF"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v42;
  v69[1] = 3221225472;
  v69[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_2;
  v69[3] = &unk_1E3E638A8;
  v69[4] = self;
  v47 = v43;
  v70 = v47;
  v48 = v59;
  v71 = v48;
  v62 = v61;
  v72 = v62;
  objc_msgSend(v45, "actionWithTitle:style:handler:", v46, 0, v69);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_VIEW_AUTOMATIC_PAYMENTS"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v42;
  v66[1] = 3221225472;
  v66[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_534;
  v66[3] = &unk_1E3E61798;
  v66[4] = self;
  v67 = v47;
  v68 = v48;
  v52 = v48;
  v53 = v47;
  objc_msgSend(v50, "actionWithTitle:style:handler:", v51, 0, v66);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "addAction:", v44);
  objc_msgSend(v39, "addAction:", v49);
  if (v58)
    objc_msgSend(v39, "addAction:", v54);
  objc_msgSend(v39, "setPreferredAction:", v49);
  v55 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v55, "settingsController:requestsPresentViewController:animated:completion:", self, v39, 1, 0);

}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserHasDisabledPeerPayment:", 1);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 408);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_3;
  v6[3] = &unk_1E3E69698;
  v6[4] = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "peerPaymentRegistrationStatusHasChanged:completion:", 0, v6);

}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_4;
  v9[3] = &unk_1E3E69670;
  v15 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72) && !*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      -[NSObject removePass:](WeakRetained, "removePass:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      PKLogFacilityTypeGetObject();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 56);
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19D178000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Unable to remove peer payment pass. Pass library data provider failed to vend pass with uniqueID: %@", (uint8_t *)&v9, 0xCu);
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "_refreshPasses");
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "targetDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUserHasDisabledPeerPayment:", 0);

    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 40), "_requestDelegatePresentViewController:", v4);
  }
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "_isPeerPaymentRegistered"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v7, CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  objc_msgSend(v8, "settingsControllerRequestsReloadSpecifiers:", *(_QWORD *)(a1 + 40));

}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_534(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PKMerchantTokensViewController *v8;
  id v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 648));
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", a1[4], a1[5]);

  v3 = (void *)MEMORY[0x1E0D66A58];
  v12[0] = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68B18];
  v6 = *MEMORY[0x1E0D68858];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v11[0] = v5;
  v11[1] = CFSTR("learnMore");
  v10[2] = *MEMORY[0x1E0D68F50];
  v11[2] = *MEMORY[0x1E0D68FB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subjects:sendEvent:", v4, v7);

  v8 = -[PKMerchantTokensViewController initWithPass:merchantTokensResponse:]([PKMerchantTokensViewController alloc], "initWithPass:merchantTokensResponse:", a1[6], 0);
  v9 = objc_loadWeakRetained((id *)(a1[4] + 648));
  objc_msgSend(v9, "settingsController:requestsPushViewController:animated:", a1[4], v8, 1);

}

- (id)_peerPaymentGroupSpecifiers
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_REGISTRATION_FOOTER_TEXT"), self->_context == 1);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80848]);
  objc_msgSend(v3, "addObject:", v4);
  -[PKPassbookSettingsController _peerPaymentSwitchSpecifier](self, "_peerPaymentSwitchSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (id)_peerPaymentTinkerGroupSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *v9;
  PSSpecifier *peerPaymentTinkerSetupButton;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_BRIDGE_APPLE_CASH_FAMILY_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v4, *MEMORY[0x1E0D80868]);
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_BRIDGE_APPLE_CASH_FAMILY_SECTION_FOOTER_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x1E0D80848]);

  v7 = (void *)MEMORY[0x1E0D804E8];
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_BRIDGE_APPLE_CASH_FAMILY_SETUP_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 13, 0);
  v9 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  peerPaymentTinkerSetupButton = self->_peerPaymentTinkerSetupButton;
  self->_peerPaymentTinkerSetupButton = v9;

  -[PSSpecifier setButtonAction:](self->_peerPaymentTinkerSetupButton, "setButtonAction:", sel_setupPeerPaymentTinkerButtonTapped);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_peerPaymentTinkerSetupButton, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_peerPaymentTinkerSetupButton, "setObject:forKeyedSubscript:", &unk_1E3FAD000, *MEMORY[0x1E0D806F8]);
  objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "addObject:", self->_peerPaymentTinkerSetupButton);

  return v3;
}

- (void)setupPeerPaymentTinkerButtonTapped
{
  id WeakRetained;
  id v4;
  _QWORD v5[5];

  -[PSSpecifier setObject:forKeyedSubscript:](self->_peerPaymentTinkerSetupButton, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  -[PSSpecifier setObject:forKeyedSubscript:](self->_peerPaymentTinkerSetupButton, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PKSettingsSpecifierLoadingKey"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", self, self->_peerPaymentTinkerSetupButton);

  v4 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke;
  v5[3] = &unk_1E3E61E98;
  v5[4] = self;
  objc_msgSend(v4, "familyMembersWithCompletion:", v5);

}

void __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  PKPeerPaymentAssociatedAccountsController *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) == 1)
    v2 = 4;
  else
    v2 = 3;
  v3 = [PKPeerPaymentAssociatedAccountsController alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(v4 + 16));
  v7 = -[PKPeerPaymentAssociatedAccountsController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:](v3, "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", v13, v5, WeakRetained, v2);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 96);
  *(_QWORD *)(v8 + 96) = v7;

  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
    objc_msgSend(v11, "settingsController:requestShowPeerPaymentAssociatedAccountsFlowWithController:withPresentationContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), 0);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSettingsSpecifierLoadingKey"));
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  objc_msgSend(v12, "settingsController:requestsReloadSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432));

}

- (void)_fetchAccounts
{
  PKAccountService *accountService;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  accountService = self->_accountService;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke;
  v4[3] = &unk_1E3E651E8;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[PKAccountService accountsWithCompletion:](accountService, "accountsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSObject *v21;
  void *v22;
  id *from;
  uint64_t v24;
  id *v25;
  char v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  from = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = WeakRetained[73];
    WeakRetained[73] = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = WeakRetained[74];
    v25 = WeakRetained;
    WeakRetained[74] = v5;

    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
    v34 = 0u;
    v24 = a1;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (!v8)
    {

      goto LABEL_37;
    }
    v26 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "feature", from);
        switch(v13)
        {
          case 2:
            objc_msgSend(v12, "creditDetails");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "rewardsDestination") == 3;

            if (v16)
            {
              v32 = 0u;
              v33 = 0u;
              v30 = 0u;
              v31 = 0u;
              v17 = *(id *)(v24 + 32);
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v18)
              {
                v19 = *(_QWORD *)v31;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v31 != v19)
                      objc_enumerationMutation(v17);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "feature") == 5)
                    {

                      goto LABEL_30;
                    }
                  }
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              if ((PKCheckedForSavingsPresence() & 1) == 0)
              {
                PKLogFacilityTypeGetObject();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "Card account rewards destination is set to Savings, but not Savings account present, refreshing accounts", buf, 2u);
                }

                v22 = *(void **)(*(_QWORD *)(v24 + 40) + 472);
                v27[0] = MEMORY[0x1E0C809B0];
                v27[1] = 3221225472;
                v27[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke_554;
                v27[3] = &unk_1E3E696C0;
                objc_copyWeak(&v28, from);
                objc_msgSend(v22, "updateAccountsWithCompletion:", v27);
                objc_destroyWeak(&v28);
              }
            }
            break;
          case 5:
            v14 = objc_msgSend(v12, "state");
            if ((unint64_t)(v14 - 1) >= 3)
            {
              if (v14 == 4)
                objc_msgSend(v25[73], "addObject:", v12);
            }
            else
            {
              objc_msgSend(v25[74], "addObject:", v12);
            }
            v9 = 1;
            break;
          case 3:
            objc_storeStrong(v25 + 31, v12);
            v26 = 1;
            break;
        }
LABEL_30:
        ;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
      objc_msgSend(v25, "_refreshAccountSpecifiers");
    WeakRetained = v25;
    if ((v26 & 1) != 0)
    {
      objc_msgSend(v25, "_refreshPasses");
LABEL_37:
      WeakRetained = v25;
    }
  }

}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke_554(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Refreshed accounts after missing destination account, with error %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke_555;
  v7[3] = &unk_1E3E612C0;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v9);

}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke_555(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (!*(_QWORD *)(a1 + 32))
    PKSetCheckedForSavingsPresence();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_fetchAccounts");
    WeakRetained = v3;
  }

}

- (void)_updateAccountIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PKAccountService *accountService;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastUpdated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (v8 > 300.0)
    {
      accountService = self->_accountService;
      objc_msgSend(v4, "accountIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__PKPassbookSettingsController__updateAccountIfNecessary___block_invoke;
      v11[3] = &unk_1E3E696E8;
      objc_copyWeak(&v13, &location);
      v12 = v4;
      -[PKAccountService updateAccountWithIdentifier:extended:completion:](accountService, "updateAccountWithIdentifier:extended:completion:", v10, 0, v11);

      objc_destroyWeak(&v13);
    }
  }
  objc_destroyWeak(&location);

}

void __58__PKPassbookSettingsController__updateAccountIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4 && WeakRetained && (PKEqualObjects() & 1) == 0)
    objc_msgSend(WeakRetained, "_processAccountChanged:", v4);

}

- (void)_processAccountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPassbookSettingsController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PKPassbookSettingsController__processAccountChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__PKPassbookSettingsController__processAccountChanged___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  result = objc_msgSend(*(id *)(a1 + 32), "feature");
  if (result == 5)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 584);
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__PKPassbookSettingsController__processAccountChanged___block_invoke_2;
    v14[3] = &unk_1E3E69710;
    v15 = v3;
    objc_msgSend(v4, "pk_removeObjectsPassingTest:", v14);
    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 592);
    v9 = v5;
    v10 = 3221225472;
    v11 = __55__PKPassbookSettingsController__processAccountChanged___block_invoke_3;
    v12 = &unk_1E3E69710;
    v13 = v6;
    objc_msgSend(v7, "pk_removeObjectsPassingTest:", &v9);
    v8 = objc_msgSend(*(id *)(a1 + 32), "state", v9, v10, v11, v12);
    if ((unint64_t)(v8 - 1) <= 3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + qword_19DF15AE8[v8 - 1]), "addObject:", *(_QWORD *)(a1 + 32));

    return objc_msgSend(*(id *)(a1 + 40), "_refreshAccountSpecifiers");
  }
  else if (result == 3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 248), *(id *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "_refreshPasses");
  }
  return result;
}

uint64_t __55__PKPassbookSettingsController__processAccountChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __55__PKPassbookSettingsController__processAccountChanged___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)accountRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPassbookSettingsController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PKPassbookSettingsController_accountRemoved___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __47__PKPassbookSettingsController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v2 = objc_msgSend(*(id *)(a1 + 32), "feature");
  if (v2 == 5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 584);
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__PKPassbookSettingsController_accountRemoved___block_invoke_2;
    v18[3] = &unk_1E3E69710;
    v19 = v7;
    objc_msgSend(v8, "pk_removeObjectsPassingTest:", v18);
    v10 = *(void **)(a1 + 32);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 592);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __47__PKPassbookSettingsController_accountRemoved___block_invoke_3;
    v16[3] = &unk_1E3E69710;
    v17 = v10;
    objc_msgSend(v11, "pk_removeObjectsPassingTest:", v16);

    objc_msgSend(*(id *)(a1 + 40), "_refreshAccountSpecifiers");
    return;
  }
  if (v2 != 3)
    return;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  v5 = v4;
  if (v15 == v5)
  {

LABEL_13:
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 248);
    *(_QWORD *)(v13 + 248) = 0;

    objc_msgSend(*(id *)(a1 + 40), "_refreshPasses");
    return;
  }
  if (v15)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {

    return;
  }
  v12 = objc_msgSend(v15, "isEqualToString:", v5);

  if ((v12 & 1) != 0)
    goto LABEL_13;
}

uint64_t __47__PKPassbookSettingsController_accountRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __47__PKPassbookSettingsController_accountRemoved___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary
{
  NSObject *v2;
  NSArray *hiddenCompanionPasses;
  NSArray *v4;
  uint64_t v5;
  char v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  char v13;
  CIDVUIProofingFlowManager *v14;
  CIDVUIProofingFlowManager *coreIDVUIProofingFlowManager;
  uint64_t v16;
  CIDVUIProofingFlowManager *v17;
  NSArray *paymentPasses;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  NSArray *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  uint8_t v39[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSArray *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (self->_context == 1)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      hiddenCompanionPasses = self->_hiddenCompanionPasses;
      *(_DWORD *)buf = 138412290;
      v45 = hiddenCompanionPasses;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) checking companion passes hidden from add %@", buf, 0xCu);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v4 = self->_hiddenCompanionPasses;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v5)
    {
      v6 = 0;
      v7 = 0;
      v8 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v10, "passType") == 1)
          {
            v11 = v10;
            v12 = v11;
            if (!v7)
            {
              objc_msgSend(v11, "associatedAccountServiceAccountIdentifier");
              v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
              if (v7)
              {
                if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v7;
                  _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) found hidden account pass for account %@", buf, 0xCu);
                }

              }
            }
            v13 = objc_msgSend(v12, "isIdentityPass");

            v6 |= v13;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v5);

      if ((v6 & 1) != 0 && !self->_coreIDVUIProofingFlowManager)
      {
        v14 = (CIDVUIProofingFlowManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16AD8]), "initWithDelegate:", self);
        coreIDVUIProofingFlowManager = self->_coreIDVUIProofingFlowManager;
        self->_coreIDVUIProofingFlowManager = v14;

        self->_requiresCIDVUIConfigurations = 1;
      }
    }
    else
    {

      v7 = 0;
    }
    v16 = MEMORY[0x1E0C809B0];
    if (self->_requiresCIDVUIConfigurations)
    {
      self->_requiresCIDVUIConfigurations = 0;
      objc_initWeak((id *)buf, self);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Requesting proofingFlowAvailability", v39, 2u);
      }

      v17 = self->_coreIDVUIProofingFlowManager;
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke;
      v37[3] = &unk_1E3E69760;
      objc_copyWeak(&v38, (id *)buf);
      -[CIDVUIProofingFlowManager proofingFlowAvailability:](v17, "proofingFlowAvailability:", v37);
      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
    if (v7)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        paymentPasses = self->_paymentPasses;
        *(_DWORD *)buf = 138412290;
        v45 = paymentPasses;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) checking payment passes %@", buf, 0xCu);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v19 = self->_paymentPasses;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v34;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            if (objc_msgSend(v23, "passType") == 1)
            {
              v24 = v23;
              objc_msgSend(v24, "associatedAccountServiceAccountIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", v7);

              if (v26)
              {
                if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v7;
                  _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) found account pass with same account ID %@, no need to show the hidden one", buf, 0xCu);
                }

                v27 = 0;
                v7 = 0;
                goto LABEL_44;
              }

            }
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
          if (v20)
            continue;
          break;
        }
      }

      -[NSMutableDictionary objectForKeyedSubscript:](self->_pairedDeviceSupportsFeatureByAccountID, "objectForKeyedSubscript:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
LABEL_44:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v45 = v7;
      v46 = 2112;
      v47 = v27;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) accountIdentifier %@ supports feature %@", buf, 0x16u);
    }

    if (-[NSArray length](v7, "length") && !v27)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v7;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) checking paired device feature support for account %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_562;
      v30[3] = &unk_1E3E69788;
      v30[4] = self;
      v31 = v7;
      v32 = 0;
      objc_msgSend(v28, "accountWithIdentifier:completion:", v31, v30);

    }
  }
}

void __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_2;
  v11[3] = &unk_1E3E69738;
  v14[1] = a2;
  v12 = v7;
  v9 = v7;
  objc_copyWeak(v14, (id *)(a1 + 32));
  v13 = v8;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(v14);
}

void __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id *WeakRetained;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 134218240;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Proofing availability %lu - %lu configurations,", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Could not get proofing availability: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    if (*(_QWORD *)(a1 + 32))
      v7 = *(void **)(a1 + 32);
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong(WeakRetained + 40, v7);
    objc_msgSend(WeakRetained, "_refreshPasses");
  }

}

void __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_562(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  char v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) failed to get account %@ to check feature support %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "targetDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feature");
    v9 = objc_opt_respondsToSelector();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    if ((v9 & 1) != 0)
    {
      -[NSObject supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:](v8, "supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) supportedFeatureIdentifiersForAccountProvisioning %@", buf, 0xCu);
      }

    }
    else
    {
      -[NSObject supportedFeatureIdentifiersWithPaymentWebService:](v8, "supportedFeatureIdentifiersWithPaymentWebService:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PKFeatureIdentifierToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "containsObject:", v14);

    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("NO");
      if (v15)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) target device featureIdentifiers %@ contains feature: %@", buf, 0x16u);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_569;
    v19[3] = &unk_1E3E64E10;
    v18 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v18;
    v22 = v15;
    v21 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
}

uint64_t __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_569(uint64_t a1)
{
  void *v2;
  uint64_t result;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
  v4 = *(unsigned __int8 *)(a1 + 56);
  if (((result ^ (*(_BYTE *)(a1 + 56) == 0)) & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("YES");
      v7 = *(_QWORD *)(a1 + 40);
      if (!v4)
        v6 = CFSTR("NO");
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) feature support for account %@ changed to %@. Refreshing passes", (uint8_t *)&v8, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_refreshPasses");
  }
  return result;
}

- (id)_peerPaymentSwitchSpecifier
{
  PSSpecifier *peerPaymentSwitchSpecifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PSSpecifier *v11;

  peerPaymentSwitchSpecifier = self->_peerPaymentSwitchSpecifier;
  if (!peerPaymentSwitchSpecifier)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETTINGS_REGISTRATION_SWITCH_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPassbookSettingsController _isPeerPaymentRegistered](self, "_isPeerPaymentRegistered"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
    v8 = (void *)MEMORY[0x1E0CB37E8];
    if ((PKUseMockSURFServer() & 1) != 0)
      v9 = 1;
    else
      v9 = PKStoreDemoModeEnabled();
    objc_msgSend(v8, "numberWithInt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("PKSwitchSpinnerTableCellSwitchIsDisabled"));

    v11 = self->_peerPaymentSwitchSpecifier;
    self->_peerPaymentSwitchSpecifier = (PSSpecifier *)v6;

    peerPaymentSwitchSpecifier = self->_peerPaymentSwitchSpecifier;
  }
  return peerPaymentSwitchSpecifier;
}

- (void)switchSpinnerCell:(id)a3 hasToggledSwitch:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  char v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  id v19;

  v4 = a4;
  objc_msgSend(a3, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke;
  aBlock[3] = &unk_1E3E619E0;
  aBlock[4] = self;
  v8 = v6;
  v19 = v8;
  v9 = _Block_copy(aBlock);
  if (v4)
  {
    -[PKPeerPaymentWebService _appleAccountInformation](self->_peerPaymentWebService, "_appleAccountInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appleID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          v13 = objc_loadWeakRetained((id *)&self->_delegate),
          v14 = objc_opt_respondsToSelector(),
          v13,
          v12,
          (v14 & 1) != 0)
      && (PKIsAltAccountPairedOrPairing() & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_3;
      v16[3] = &unk_1E3E614F0;
      v17 = v9;
      objc_msgSend(WeakRetained, "settingsController:requestsAuthenticationChallengeForAppleAccountInformation:completion:", self, v10, v16);

    }
    else
    {
      -[PKPassbookSettingsController _registerForPeerPaymentWithSpecifier:](self, "_registerForPeerPaymentWithSpecifier:", v8);
    }

  }
  else
  {
    -[PKPassbookSettingsController _unregisterForPeerPaymentWithSpecifier:](self, "_unregisterForPeerPaymentWithSpecifier:", v8);
  }

}

void __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_2;
  block[3] = &unk_1E3E64908;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerForPeerPaymentWithSpecifier:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PKSwitchSpinnerTableCellShowSpinner"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isPeerPaymentRegistered"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, CFSTR("PKSwitchSpinnerTableCellSwitchIsOn"));

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
    objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_transitDefaultsGroupSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0D804E8];
  PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSIT_SECTION_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassbookSettingsController _uppercaseGroupSpecifierTitleIfNecessary:](self, "_uppercaseGroupSpecifierTitleIfNecessary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_expressTransitSectionFooterText, *MEMORY[0x1E0D80848]);
  objc_msgSend(v3, "addObject:", v7);
  -[PKPassbookSettingsController _defaultExpressTransitSpecifier](self, "_defaultExpressTransitSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  return v3;
}

- (id)_defaultExpressTransitSpecifier
{
  int v3;
  char *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  PSSpecifier *defaultExpressTransitSpecifier;
  uint64_t v9;

  if (!self->_defaultExpressTransitSpecifier)
  {
    v3 = -[PKExpressPassController deviceUsesAutomaticAuthorization](self->_expressPassController, "deviceUsesAutomaticAuthorization");
    v4 = (char *)objc_alloc_init(MEMORY[0x1E0D804E8]);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805B0]] = 2;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_context);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("pkSettingsContext"));

    objc_msgSend(v4, "setTarget:", self);
    *(_QWORD *)&v4[*MEMORY[0x1E0D805C0]] = sel__defaultExpressTransitPassDescription;
    objc_msgSend(v4, "setControllerLoadAction:", sel__openExpressTransitSettings_);
    if (v3)
      v6 = CFSTR("SETTINGS_DEFAULT_AUTOMATIC_TRANSIT_CELL_TITLE");
    else
      v6 = CFSTR("SETTINGS_DEFAULT_EXPRESS_TRANSIT_CELL_TITLE");
    PKLocalizedPaymentString(&v6->isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v7);

    objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80868]);
    defaultExpressTransitSpecifier = self->_defaultExpressTransitSpecifier;
    self->_defaultExpressTransitSpecifier = (PSSpecifier *)v4;

  }
  if (PKStoreDemoModeEnabled())
    v9 = MEMORY[0x1E0C9AAA0];
  else
    v9 = MEMORY[0x1E0C9AAB0];
  -[PSSpecifier setProperty:forKey:](self->_defaultExpressTransitSpecifier, "setProperty:forKey:", v9, *MEMORY[0x1E0D80808]);
  return self->_defaultExpressTransitSpecifier;
}

- (id)_defaultExpressTransitPassDescription
{
  return self->_expressTransitSubtitleText;
}

- (void)_openExpressTransitSettings:(id)a3
{
  -[PKPassbookSettingsController openExpressTransitSettings:withPassUniqueIdentifier:](self, "openExpressTransitSettings:withPassUniqueIdentifier:", a3, 0);
}

- (void)openExpressTransitSettings:(id)a3 withPassUniqueIdentifier:(id)a4
{
  _BOOL8 v6;
  PKExpressPassesViewController *v7;
  id WeakRetained;
  id v9;
  PKExpressPassesViewController *obj;

  v6 = self->_context != 0;
  v7 = [PKExpressPassesViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  obj = -[PKExpressPassesViewController initWithPaymentDataProvider:controller:style:](v7, "initWithPaymentDataProvider:controller:style:", WeakRetained, self->_expressPassController, v6);

  -[PKExpressPassesViewController setPasses:](obj, "setPasses:", self->_paymentPasses);
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "settingsController:requestsPushViewController:animated:", self, obj, a3 != 0);
  objc_storeWeak((id *)&self->_expressPassesViewController, obj);

}

- (void)openTransactionDefaultsEmailSettings
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[NSArray count](self->_paymentPasses, "count")
    && -[PKPassbookSettingsDataSource deviceSupportsInAppPayments](self->_dataSource, "deviceSupportsInAppPayments"))
  {
    -[PKPassbookSettingsController _showDefaultContactEmailOptions:](self, "_showDefaultContactEmailOptions:", self);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Attempted to open email settings for a device that has no passes or doesn't support payments", v4, 2u);
    }

  }
}

- (void)addButtonPressedForPaymentPass:(id)a3
{
  -[PKPassbookSettingsController _performPhoneToWatchProvisioningForPaymentPass:withCompletion:](self, "_performPhoneToWatchProvisioningForPaymentPass:withCompletion:", a3, 0);
}

- (BOOL)canPresentLaunchPrompts
{
  PKPassbookSettingsDelegate **p_delegate;
  id WeakRetained;
  id v4;
  int v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    v5 = objc_msgSend(v4, "isPresentingViewController") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_regionConfigurationDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPassbookSettingsController__regionConfigurationDidChangeNotification__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__PKPassbookSettingsController__regionConfigurationDidChangeNotification__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateCardsGroupSpecifier");
  return objc_msgSend(*(id *)(a1 + 32), "_updateAddButtonSpecifier");
}

- (void)_presentPaymentSetupViewController:(id)a3 paymentPass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  PKAccountService *accountService;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  PKPassbookSettingsController *v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPassbookSettingsDataSource setupDelegate](self->_dataSource, "setupDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKPassbookSettingsDataSource setupDelegate](self->_dataSource, "setupDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSetupDelegate:", v9);

  }
  objc_msgSend(v6, "setShowsWelcomeViewController:", 0);
  objc_msgSend(v6, "setAllowsManualEntry:", 0);
  objc_msgSend(v6, "setPaymentSetupMode:", 1);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke;
  aBlock[3] = &unk_1E3E697B0;
  v11 = v6;
  v20 = v11;
  v21 = self;
  objc_copyWeak(&v22, &location);
  v12 = _Block_copy(aBlock);
  objc_msgSend(v7, "associatedAccountServiceAccountIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    accountService = self->_accountService;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_4;
    v16[3] = &unk_1E3E697D8;
    v17 = v7;
    v18 = v12;
    -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v13, v16);

    v15 = v17;
  }
  else
  {
    if (objc_msgSend(v7, "isHomeKeyPass"))
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DD0]), "initWithPaymentPass:", v7);
    else
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67168]), "initWithPaymentPass:", v7);
    (*((void (**)(void *, void *))v12 + 2))(v12, v15);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v4, "setPaymentDataProvider:", WeakRetained);

  if (PKIsAltAccountPairedOrPairing() && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) == 1)
    objc_msgSend(v4, "setIsProvisioningForAltAccount:", 1);
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_2;
  v7[3] = &unk_1E3E625E8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "associateCredentials:withCompletionHandler:", v6, v7);

  objc_destroyWeak(&v9);
}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || !a2)
    {
      objc_msgSend(WeakRetained, "_handleProvisioningError:viewController:", v5, 0);
      objc_msgSend(v7, "_setCardAddProvisioningButtonEnabled:forPaymentPass:", 1, 0);
    }
    else
    {
      v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_3;
      v9[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v8, "preflightWithCompletion:", v9);

      objc_destroyWeak(&v11);
    }
  }

}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_requestDelegatePresentViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_setCardAddProvisioningButtonEnabled:forPaymentPass:", 1, 0);
    WeakRetained = v3;
  }

}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_5;
  block[3] = &unk_1E3E65388;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "feature") == 4)
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67168]), "initWithPaymentPass:", *(_QWORD *)(a1 + 40));
  else
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66840]), "initWithAccount:", *(_QWORD *)(a1 + 32));
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_invitationFromCredential:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
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

  v4 = (objc_class *)MEMORY[0x1E0D66AA0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "partnerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brandIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairedReaderIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v6, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v7, v8, v9, v11, objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v5, "supportedRadioTechnologies"));

  objc_msgSend(v5, "sharingSessionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSharingSessionIdentifier:", v15);

  objc_msgSend(v5, "originatorIDSHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setOriginatorIDSHandle:", v16);
  return v14;
}

- (id)_matchingInvitationForPass:(id)a3 withInvitations:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = a4;
  objc_msgSend(a3, "devicePrimaryPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subcredentials");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D66AA0]);
  objc_msgSend(v8, "partnerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brandIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairedReaderIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entitlement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v9, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v10, v11, v12, v14, objc_msgSend(v16, "unsignedIntegerValue"), objc_msgSend(v8, "supportedRadioTechnologies"));

  objc_msgSend(v8, "sharingSessionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSharingSessionIdentifier:", v18);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v32;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
      if ((objc_msgSend(v17, "isSameInvitationAsInvitation:", v24) & 1) != 0)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v21)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    objc_msgSend(v17, "setSharingSessionIdentifier:", 0);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v19;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (!v26)
    {
      v30 = 0;
      goto LABEL_19;
    }
    v27 = v26;
    v28 = *(_QWORD *)v34;
LABEL_11:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v28)
        objc_enumerationMutation(v25);
      v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v29);
      if ((objc_msgSend(v17, "isSameInvitationAsInvitation:", v24) & 1) != 0)
        break;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        v30 = 0;
        if (v27)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
  }
  v30 = v24;
LABEL_19:

  return v30;
}

- (void)_credentialPairingContextForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PKSubcredentialPairingFlowControllerContext *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  PKPaymentWebService *webService;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  PKSubcredentialPairingFlowControllerContext *v32;
  id v33;
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (self->_context == 1)
    {
      objc_msgSend(v6, "devicePrimaryPaymentApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subcredentials");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[PKSubcredentialPairingFlowControllerContext initWithFlowType:referralSource:]([PKSubcredentialPairingFlowControllerContext alloc], "initWithFlowType:referralSource:", 3, 7);
      -[PKPaymentDataProvider paymentWebService](self->_companionPaymentDataProvider, "paymentWebService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSubcredentialProvisioningFlowControllerContext setLocalDeviceWebService:](v11, "setLocalDeviceWebService:", v12);

      -[PKSubcredentialProvisioningFlowControllerContext setRemoteDeviceWebService:](v11, "setRemoteDeviceWebService:", self->_webService);
      -[PKSubcredentialProvisioningFlowControllerContext setProvisionedPass:](v11, "setProvisionedPass:", v6);
      v13 = objc_alloc_init(MEMORY[0x1E0D66A08]);
      objc_msgSend(v13, "setSupportedRadioTechnologies:", objc_msgSend(v10, "supportedRadioTechnologies"));
      objc_msgSend(v10, "manufacturerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "brandIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (void *)v15;
      else
        v17 = v14;
      objc_msgSend(v13, "setIssuerIdentifier:", v17);

      objc_msgSend(v13, "setManufacturerIdentifier:", v14);
      -[PKSubcredentialPairingFlowControllerContext setConfiguration:](v11, "setConfiguration:", v13);
      if (objc_msgSend(v10, "isSharedCredential"))
      {
        objc_initWeak(&location, self);
        -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = objc_opt_respondsToSelector();
          PKLogFacilityTypeGetObject();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if ((v19 & 1) != 0)
          {
            if (v21)
            {
              *(_DWORD *)buf = 138412290;
              v38 = v13;
              _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Checking if device can add SE pass with configuration: %@", buf, 0xCu);
            }

            webService = self->_webService;
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke;
            v28[3] = &unk_1E3E69850;
            objc_copyWeak(&v35, &location);
            v34 = v7;
            v28[4] = self;
            v29 = v10;
            v30 = v18;
            v31 = v6;
            v32 = v11;
            v33 = v13;
            objc_msgSend(v30, "paymentWebService:canAddSecureElementPassWithConfiguration:completion:", webService, v33, v28);

            objc_destroyWeak(&v35);
          }
          else
          {
            if (v21)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Unable to load invitations", buf, 2u);
            }

            PKDisplayableErrorForCommonType();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v27);

          }
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Unable to determine whether we can add secure element passes with configuration", buf, 2u);
          }

          PKDisplayableErrorForCommonType();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v26);

        }
        objc_destroyWeak(&location);
      }
      else
      {
        -[PKSubcredentialPairingFlowControllerContext setCredentialToShare:](v11, "setCredentialToShare:", v10);
        +[PKSubcredentialPairingFlowController sharingRequestForContext:withCredential:](PKSubcredentialPairingFlowController, "sharingRequestForContext:withCredential:", v11, v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSubcredentialPairingFlowControllerContext setRemoteDeviceSharingRequest:](v11, "setRemoteDeviceSharingRequest:", v24);
        (*((void (**)(id, PKSubcredentialPairingFlowControllerContext *, _QWORD))v7 + 2))(v7, v11, 0);

      }
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v23);

    }
  }

}

void __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invitationFromCredential:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 48);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_2;
      v16[3] = &unk_1E3E69828;
      v10 = v7;
      v17 = v10;
      v23 = *(id *)(a1 + 80);
      v11 = *(id *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v18 = v11;
      v19 = v12;
      objc_copyWeak(&v24, (id *)(a1 + 88));
      v20 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 40);
      v22 = *(id *)(a1 + 64);
      objc_msgSend(v8, "paymentWebService:canAcceptInvitation:withCompletionV2:", v9, v10, v16);

      objc_destroyWeak(&v24);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138412546;
        v26 = v15;
        v27 = 2112;
        v28 = v5;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Device cannot add secure element pass with configuration %@. Error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
  }
  else
  {
    PKDisplayableErrorForCommonType();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

void __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Device cannot accept invitations similar to %@. Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_600;
    v8[3] = &unk_1E3E69800;
    objc_copyWeak(&v14, (id *)(a1 + 88));
    v13 = *(id *)(a1 + 80);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 72);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v6, "paymentWebService:subcredentialInvitationsWithCompletion:", v7, v8);

    objc_destroyWeak(&v14);
  }

}

void __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_600(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Invitations on watch: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(WeakRetained, "_matchingInvitationForPass:withInvitations:", *(_QWORD *)(a1 + 32), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        v12 = 138412802;
        v13 = v6;
        v14 = 2112;
        v15 = v8;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Found matching invite (%@) for pass (%@) with credential: %@", (uint8_t *)&v12, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 48), "setRemoteDeviceInvitation:", v6);
    }
    else
    {
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "No matching invite for pass (%@) found", (uint8_t *)&v12, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 48), "setRemoteDeviceInvitation:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 48), "setShouldRequestInvitation:", 1);
    }
    objc_msgSend(*(id *)(a1 + 48), "setDeclineRelatedInvitations:", 1);
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    PKDisplayableErrorForCommonType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v10();

}

- (void)_presentCredentialSetupViewControllerForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  PKPaymentSetupDismissibleNavigationController *v18;
  void *v19;
  uint64_t v20;
  PKPaymentSetupDismissibleNavigationController *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t *v29;
  id v30;
  _QWORD v31[4];
  PKPaymentSetupDismissibleNavigationController *v32;
  id v33;
  uint8_t *v34;
  id v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  char v39;
  id location;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((PKV2SharingFlowEnabled() & 1) != 0)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Using v2 share flow", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "requestParentNavigationControllerWithSettingsController:", self);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_11;
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "navigationController");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;

    if (v15)
    {
      objc_msgSend(v6, "devicePrimaryPaymentApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subcredentials");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67160]), "initWithPaymentPass:credentialToShare:", v6, v26);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", self->_webService);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 4, v25, 0);
      v18 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 4);
      objc_initWeak(&location, self);
      *(_QWORD *)buf = 0;
      v37 = buf;
      v38 = 0x2020000000;
      v39 = 0;
      v41[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke;
      v31[3] = &unk_1E3E69878;
      objc_copyWeak(&v35, &location);
      v34 = buf;
      v21 = v18;
      v32 = v21;
      v22 = v7;
      v33 = v22;
      v27[0] = v20;
      v27[1] = 3221225472;
      v27[2] = __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_3;
      v27[3] = &unk_1E3E698A0;
      objc_copyWeak(&v30, &location);
      v29 = buf;
      v28 = v22;
      +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:](PKProvisioningFlowBridge, "startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:", v21, v23, v19, v15, v31, v27);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v35);
      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&location);

LABEL_12:
      goto LABEL_13;
    }
LABEL_11:
    PKDisplayableErrorForCommonType();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);
    goto LABEL_12;
  }
  -[PKPassbookSettingsController _presentLegacyCredentialSetupViewControllerForPaymentPass:withCompletion:](self, "_presentLegacyCredentialSetupViewControllerForPaymentPass:withCompletion:", v6, v7);
LABEL_13:

}

void __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v4 = objc_loadWeakRetained(WeakRetained + 81);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2;
    v6[3] = &unk_1E3E61590;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "settingsController:requestsPresentViewController:animated:completion:", v3, v5, 1, v6);

  }
}

uint64_t __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v3 = objc_loadWeakRetained(WeakRetained + 81);
      objc_msgSend(v3, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", v5, 1, 0);
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 32);
      PKDisplayableErrorForCommonType();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);
    }

    WeakRetained = v5;
  }

}

- (void)_presentLegacyCredentialSetupViewControllerForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke;
  v9[3] = &unk_1E3E698C8;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[PKPassbookSettingsController _credentialPairingContextForPass:withCompletion:](self, "_credentialPairingContextForPass:withCompletion:", v6, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2;
  v10[3] = &unk_1E3E670F8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v11 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  PKSubcredentialPairingFlowController *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v3 = -[PKSubcredentialPairingFlowController initWithDelegate:]([PKSubcredentialPairingFlowController alloc], "initWithDelegate:", WeakRetained);
      -[PKSubcredentialPairingFlowController startingViewControllerForContext:](v3, "startingViewControllerForContext:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
        v6 = objc_loadWeakRetained(WeakRetained + 81);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_612;
        v10[3] = &unk_1E3E61590;
        v11 = *(id *)(a1 + 48);
        objc_msgSend(v6, "settingsController:requestsPresentViewController:animated:completion:", WeakRetained, v5, 1, v10);

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Unable to share pass", buf, 2u);
        }

        if (!*(_QWORD *)(a1 + 48))
          goto LABEL_16;
        PKDisplayableErrorForCommonType();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

LABEL_16:
      goto LABEL_17;
    }
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Unable to create provisioning context from pass", buf, 2u);
    }

    if (*(_QWORD *)(a1 + 48))
    {
      PKDisplayableErrorForCommonType();
      v3 = (PKSubcredentialPairingFlowController *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_17:

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(a1 + 32));
  }

}

uint64_t __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_612(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_handleProvisioningError:(id)a3 viewController:(id)a4
{
  id v5;

  if (a4)
  {
    -[PKPassbookSettingsController _requestDelegatePresentViewController:](self, "_requestDelegatePresentViewController:", a4);
  }
  else
  {
    +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPassbookSettingsController _requestDelegatePresentViewController:](self, "_requestDelegatePresentViewController:", v5);

  }
}

- (void)_requestDelegatePresentViewController:(id)a3
{
  -[PKPassbookSettingsController _requestDelegatePresentViewController:completion:](self, "_requestDelegatePresentViewController:completion:", a3, 0);
}

- (void)_requestDelegatePresentViewController:(id)a3 completion:(id)a4
{
  PKPassbookSettingsDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  if (a3)
  {
    p_delegate = &self->_delegate;
    v7 = a4;
    v8 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "settingsController:requestsPresentViewController:animated:completion:", self, v8, 1, v7);

  }
}

- (void)_setCardAddProvisioningButtonEnabled:(BOOL)a3 forPaymentPass:(id)a4
{
  _BOOL8 v4;
  void *v6;
  NSString *v7;
  NSString *provisioningPassIdentifier;
  id WeakRetained;
  id v10;

  v4 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setObject:forKeyedSubscript:](self->_addCardButtonSpecifier, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D80808]);

  if (v10)
  {
    objc_msgSend(v10, "uniqueID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    provisioningPassIdentifier = self->_provisioningPassIdentifier;
    self->_provisioningPassIdentifier = v7;
  }
  else
  {
    provisioningPassIdentifier = self->_provisioningPassIdentifier;
    self->_provisioningPassIdentifier = 0;
  }

  -[PKPassbookSettingsController _updateCompanionPassesAddButton](self, "_updateCompanionPassesAddButton");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsController:requestsReloadSpecifier:", self, self->_addCardButtonSpecifier);

}

- (void)_performPhoneToWatchProvisioningForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PKPassbookSettingsController _setCardAddProvisioningButtonEnabled:forPaymentPass:](self, "_setCardAddProvisioningButtonEnabled:forPaymentPass:", 0, v6);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke;
  aBlock[3] = &unk_1E3E698F0;
  objc_copyWeak(&v18, &location);
  v9 = v7;
  v17 = v9;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2;
  v12[3] = &unk_1E3E69A58;
  v12[4] = self;
  v10 = _Block_copy(aBlock);
  v14 = v10;
  v11 = v6;
  v13 = v11;
  objc_copyWeak(&v15, &location);
  -[PKPassbookSettingsController _transitPropertiesForPaymentPass:withCompletion:](self, "_transitPropertiesForPaymentPass:withCompletion:", v11, v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  uint64_t result;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_setCardAddProvisioningButtonEnabled:forPaymentPass:", 1, 0);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD *v30;
  uint8_t *v31;
  _QWORD *v32;
  id v33;
  id location;
  _QWORD v35[5];
  id v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  uint8_t *v40;
  _QWORD *v41;
  _QWORD v42[8];
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isEnRoute"))
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is in transit.", buf, 2u);
      }

      v6 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("CARD_IN_TRANSIT"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("CARD_IN_TRANSIT_MESSAGE_TRANSFER_CARD");
LABEL_10:
      PKLocalizedPaymentString(&v8->isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v14);

      objc_msgSend(a1[4], "_requestDelegatePresentViewController:", v11);
      (*((void (**)(void))a1[6] + 2))();
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(v4, "isBlocked"))
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is blacklisted.", buf, 2u);
      }

      v6 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("COULD_NOT_ADD_CARD_MESSAGE");
      goto LABEL_10;
    }
  }
  if (objc_msgSend(a1[5], "isCarKeyPass"))
  {
    v15 = a1[4];
    v16 = a1[5];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_623;
    v58[3] = &unk_1E3E642D0;
    objc_copyWeak(&v60, a1 + 7);
    v59 = a1[6];
    objc_msgSend(v15, "_presentCredentialSetupViewControllerForPaymentPass:withCompletion:", v16, v58);

    objc_destroyWeak(&v60);
  }
  else
  {
    if (!objc_msgSend(a1[5], "isIdentityPass"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0D66B90]);
      *(_QWORD *)buf = 0;
      v48 = buf;
      v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__13;
      v51 = __Block_byref_object_dispose__13;
      v52 = 0;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x3032000000;
      v45[3] = __Block_byref_object_copy__13;
      v45[4] = __Block_byref_object_dispose__13;
      v46 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x3032000000;
      v43[3] = __Block_byref_object_copy__13;
      v43[4] = __Block_byref_object_dispose__13;
      v44 = 0;
      v22 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_627;
      v42[3] = &unk_1E3E636B0;
      v42[4] = a1[4];
      v42[5] = v43;
      v42[6] = buf;
      v42[7] = v45;
      objc_msgSend(v11, "addOperation:", v42);
      v38[0] = v22;
      v38[1] = 3221225472;
      v38[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3_632;
      v38[3] = &unk_1E3E699B8;
      v23 = a1[5];
      v38[4] = a1[4];
      v40 = buf;
      v41 = v43;
      v39 = v23;
      objc_msgSend(v11, "addOperation:", v38);
      v35[0] = v22;
      v35[1] = 3221225472;
      v35[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_5;
      v35[3] = &unk_1E3E63610;
      v24 = a1[5];
      v35[4] = a1[4];
      v36 = v24;
      v37 = v43;
      objc_msgSend(v11, "addOperation:", v35);
      objc_initWeak(&location, a1[4]);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v22;
      v27[1] = 3221225472;
      v27[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_7;
      v27[3] = &unk_1E3E69A30;
      objc_copyWeak(&v33, &location);
      v30 = v43;
      v31 = buf;
      v32 = v45;
      v29 = a1[6];
      v28 = a1[5];
      v26 = (id)objc_msgSend(v11, "evaluateWithInput:completion:", v25, v27);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(v45, 8);

      _Block_object_dispose(buf, 8);
      goto LABEL_16;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", *((_QWORD *)a1[4] + 10));
    objc_initWeak((id *)buf, a1[4]);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_624;
    v53[3] = &unk_1E3E69940;
    objc_copyWeak(&v57, (id *)buf);
    v18 = a1[6];
    v19 = a1[4];
    v20 = a1[5];
    v56 = v18;
    v53[4] = v19;
    v54 = v20;
    v21 = v17;
    v55 = v21;
    objc_msgSend(v21, "preflightWithRequirements:completionRequirements:completion:", 13, 13, v53);

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);

  }
LABEL_17:

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_623(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Unable to present credential setup. Error: %@.", (uint8_t *)&v9, 0xCu);
    }

    v8 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    objc_msgSend(WeakRetained, "_requestDelegatePresentViewController:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_624(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;
  id v9;
  void *v10;
  PKPaymentSetupDismissibleNavigationController *v11;
  void *v12;
  uint64_t v13;
  PKPaymentSetupDismissibleNavigationController *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id v24;
  _QWORD v25[4];
  PKPaymentSetupDismissibleNavigationController *v26;
  id v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained(WeakRetained + 81);
    if (v5 || (a2 & 1) == 0)
    {
      if (v5)
      {
        v9 = v5;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v9;
      v18 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
      objc_msgSend(v8, "settingsController:requestsPresentViewController:animated:completion:", v7, v18, 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      goto LABEL_16;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "requestParentNavigationControllerWithSettingsController:", *(_QWORD *)(a1 + 32));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      objc_msgSend(v8, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v20)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67168]), "initWithPaymentPass:", *(_QWORD *)(a1 + 40));
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 4, *(_QWORD *)(a1 + 48), 0);
      v11 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 4);
      -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v11, "useStandardPlatformPresentationStyle");
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v31 = 0;
      v32[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_625;
      v25[3] = &unk_1E3E69878;
      objc_copyWeak(&v29, (id *)(a1 + 64));
      v28 = v30;
      v14 = v11;
      v26 = v14;
      v27 = *(id *)(a1 + 56);
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4;
      v21[3] = &unk_1E3E698A0;
      objc_copyWeak(&v24, (id *)(a1 + 64));
      v23 = v30;
      v22 = *(id *)(a1 + 56);
      +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:](PKProvisioningFlowBridge, "startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:", v14, v19, v12, v20, v25, v21);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v29);
      _Block_object_dispose(v30, 8);

LABEL_16:
      goto LABEL_17;
    }
LABEL_13:
    PKDisplayableErrorForCommonType();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = PKAlertForDisplayableErrorWithHandlers(v15, 0, 0, 0);

    objc_msgSend(v8, "settingsController:requestsPresentViewController:animated:completion:", v7, v16, 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    goto LABEL_16;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_17:

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_625(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v4 = objc_loadWeakRetained(WeakRetained + 81);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3;
    v8[3] = &unk_1E3E69918;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v4, "settingsController:requestsPresentViewController:animated:completion:", v3, v5, 1, v8);

  }
}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 1);
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v3 = objc_loadWeakRetained(WeakRetained + 81);
      objc_msgSend(v3, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", v4, 1, 0);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    WeakRetained = v4;
  }

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_627(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
    v11 = *(_QWORD *)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_630;
    v12[3] = &unk_1E3E69968;
    v15 = *(_OWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 56);
    v14 = v7;
    v13 = v6;
    objc_msgSend(v10, "settingsController:requestsAddLocalCardPreflightWithCompletion:", v11, v12);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_630(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = a1[7];
  else
    v9 = a1[8];
  objc_storeStrong((id *)(*(_QWORD *)(v9 + 8) + 40), a3);
  if (a2)
    v10 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) != 0;
  else
    v10 = 1;
  (*(void (**)(_QWORD, _QWORD, _BOOL8))(a1[5] + 16))(a1[5], a1[4], v10);

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3_632(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "provisioningController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4_633;
    v10[3] = &unk_1E3E69990;
    v14 = *(_QWORD *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    v13 = v8;
    v12 = v6;
    objc_msgSend(v9, "requestExternalizedAuthForWatchWithVisibleViewController:completion:", 0, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4_633(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6 && a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "devicePrimaryContactlessPaymentApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "paymentNetworkIdentifier");

    if (v8 == 130)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D69DC8];
      v17[0] = *MEMORY[0x1E0CB2D50];
      PKLocalizedPaymentString(CFSTR("WATCH_ON_WRIST_REQUIREMENTS_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      v17[1] = *MEMORY[0x1E0CB2D80];
      PKLocalizedPaymentString(CFSTR("WATCH_ON_WRIST_REQUIREMENTS_MESSAGE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 60000, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0);

}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fidoProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "relyingPartyIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_6;
    v12[3] = &unk_1E3E699E0;
    v15 = *(_QWORD *)(a1 + 48);
    v14 = v7;
    v13 = v6;
    objc_msgSend(v8, "checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", v10, v11, 0, v12);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_6(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0D69DC8];
    v12[0] = *MEMORY[0x1E0CB2D50];
    PKLocalizedPaymentString(CFSTR("BRIDGE_SERIAL_BASED_PROVISIONING_MISSING_KEY_MATERIAL_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v12[1] = *MEMORY[0x1E0CB2D80];
    PKLocalizedPaymentString(CFSTR("BRIDGE_SERIAL_BASED_PROVISIONING_MISSING_KEY_MATERIAL_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 60000, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_8;
    v4[3] = &unk_1E3E69A08;
    v8 = *(_OWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 64);
    v5 = WeakRetained;
    v7 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t (*v2)(void);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    goto LABEL_2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentPaymentSetupViewController:paymentPass:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v2();
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "_handleProvisioningError:viewController:");
  v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  return v2();
}

- (void)_transitPropertiesForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKPassbookSettingsDefaultBehavior *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PKPassbookSettingsController *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devicePrimaryPaymentApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(PKPassbookSettingsDefaultBehavior);
    -[PKPassbookSettingsDefaultBehavior paymentDataProvider](v10, "paymentDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke;
      v12[3] = &unk_1E3E69AA8;
      v13 = v9;
      v14 = v6;
      v15 = self;
      v16 = v8;
      v17 = v7;
      objc_msgSend(v11, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v16, v13, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
}

void __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke_2;
  v8[3] = &unk_1E3E69A80;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_updateBalancesWithServerBalances:transitPassProperties:forPassWithUniqueIdentifier:", 0, v2, *(_QWORD *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (int64_t)_paymentSetupContextForSettingsContext:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (!a3)
    return 3;
  if (a3 == 1)
    return 4;
  v8 = v3;
  v9 = v4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_19D178000, v6, OS_LOG_TYPE_ERROR, "Context case not mapped", v7, 2u);
  }

  return 0;
}

- (void)_reloadBalancesAndTransitPassPropertiesForPass:(id)a3 withDataProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__PKPassbookSettingsController__reloadBalancesAndTransitPassPropertiesForPass_withDataProvider___block_invoke;
  v9[3] = &unk_1E3E69AD0;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  -[PKPassbookSettingsController _fetchBalancesAndTransitPassPropertiesForPass:withDataProvider:completion:](self, "_fetchBalancesAndTransitPassPropertiesForPass:withDataProvider:completion:", v8, v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __96__PKPassbookSettingsController__reloadBalancesAndTransitPassPropertiesForPass_withDataProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateBalancesWithServerBalances:transitPassProperties:forPassWithUniqueIdentifier:", v7, v6, v8);

}

- (void)_fetchBalancesAndTransitPassPropertiesForPass:(id)a3 withDataProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__13;
  v33[4] = __Block_byref_object_dispose__13;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__13;
  v31[4] = __Block_byref_object_dispose__13;
  v32 = 0;
  objc_msgSend(v7, "devicePrimaryPaymentApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v11);
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke;
  v26[3] = &unk_1E3E69088;
  v30 = v33;
  v14 = v12;
  v27 = v14;
  v15 = v7;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  objc_msgSend(v8, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v10, v14, v26);
  dispatch_group_enter(v16);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_2;
  v23[3] = &unk_1E3E690B0;
  v25 = v31;
  v17 = v16;
  v24 = v17;
  objc_msgSend(v8, "balancesForPaymentPassWithUniqueIdentifier:completion:", v10, v23);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_4;
  block[3] = &unk_1E3E637C8;
  v20 = v9;
  v21 = v31;
  v22 = v33;
  v18 = v9;
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

void __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_3;
  block[3] = &unk_1E3E69AF8;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 forPassWithUniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = a3;
    -[PKPassbookSettingsController _specifierForPassUniqueID:](self, "_specifierForPassUniqueID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pkPass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_latestTransitBalanceModel, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    if (!v13)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v11);
    objc_msgSend(v13, "setTransitProperties:", v15);
    objc_msgSend(v13, "setDynamicBalances:", v9);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_latestTransitBalanceModel, "setObject:forKeyedSubscript:", v13, v8);
    if ((PKEqualObjects() & 1) == 0)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("pkTransitServerBalance"));
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D80940]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateSubtitleForTransitProperties");

    }
  }

}

- (id)_subtitleTextForActiveAccount:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = a3;
  v4 = objc_msgSend(v3, "feature");
  if (v4 == 4)
  {
    objc_msgSend(v3, "appleBalanceDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentBalance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currencyCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "formattedStringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v4 == 2)
  {
    objc_msgSend(v3, "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "accessLevel") != 1)
    {
      objc_msgSend(v5, "accountSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "altDSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountUserActivityForAccountUserAltDSID:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "totalSpending");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currencyCode");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = 0;
      if (v6)
      {
        if (v17)
        {
          PKCurrencyAmountMake();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "amount");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "compare:", v21);

          if (v22 == -1)
          {
            objc_msgSend(v19, "negativeValue");
            v23 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v23;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "components:fromDate:", 8, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "month");

      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "formattedStringValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(v27, CFSTR("%@"), v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    objc_msgSend(v5, "cardBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    if (v9 == -1)
    {
      objc_msgSend(v6, "negativeValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "formattedStringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v29;
    }
    else
    {
      objc_msgSend(v6, "formattedStringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (void)_updateCardSpecifier:(id)a3 withAccountStateForPaymentPass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PKPassbookSettingsController *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "associatedAccountServiceAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke;
  v16 = &unk_1E3E69B20;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v10 = _Block_copy(&v13);
  v11 = objc_msgSend(v7, "isAppleBalancePass", v13, v14, v15, v16, v17);

  if (v11)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountWithIdentifier:completion:", v8, v10);

  }
  else
  {
    -[PKAccountService accountWithIdentifier:completion:](self->_accountService, "accountWithIdentifier:completion:", v8, v10);
  }

}

void __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke_2(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(a1[4], "state");
  v3 = objc_msgSend(a1[4], "feature");
  switch(v2)
  {
    case 1:
      objc_msgSend(a1[5], "_subtitleTextForActiveAccount:", a1[4]);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 3:
    case 4:
      PKLocalizedFeatureString();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v4, CFSTR("pkCustomSubTitleColor"));

      break;
    default:
      v8 = 0;
      break;
  }
  if (v3 == 2)
  {
    objc_msgSend(a1[4], "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "requiresDebtCollectionNotices"))
    {

      v8 = 0;
    }

  }
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v8, CFSTR("pkCustomSubTitle"));
  objc_msgSend(a1[6], "objectForKeyedSubscript:", *MEMORY[0x1E0D80940]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSubtitle");

}

- (void)paymentSetupDidFinish:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", self, 1, 0);

  -[PKPassbookSettingsController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69950]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if ((PKAnalyticsSessionEnabled() & 1) == 0)
  {
    self->_didBeginWalletProvisioningSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69950]);
  }
}

- (void)_fetchInstitutions
{
  FKBankConnectInstitutionsProvider *institutionsDataProvider;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  institutionsDataProvider = self->_institutionsDataProvider;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PKPassbookSettingsController__fetchInstitutions__block_invoke;
  v4[3] = &unk_1E3E61BE0;
  objc_copyWeak(&v5, &location);
  -[FKBankConnectInstitutionsProvider connectedInstitutionsWithCompletion:](institutionsDataProvider, "connectedInstitutionsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PKPassbookSettingsController__fetchInstitutions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PKPassbookSettingsController__fetchInstitutions__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __50__PKPassbookSettingsController__fetchInstitutions__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 37, *(id *)(a1 + 32));
    v3 = objc_loadWeakRetained(v4 + 81);
    objc_msgSend(v3, "settingsControllerRequestsReloadSpecifiers:", v4);

    WeakRetained = v4;
  }

}

- (void)connectedInstitutionsDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PKPassbookSettingsController_connectedInstitutionsDidChange___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __63__PKPassbookSettingsController_connectedInstitutionsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 648));
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", *(_QWORD *)(a1 + 32));

}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  PKPassbookSettingsDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", self, 1, 0);

  }
  if (a4)
    -[PKPassbookSettingsController _refreshPasses](self, "_refreshPasses");
}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  PKPassbookSettingsDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", self, 1, 0);

  }
}

- (void)_refreshCIDVUIConfigurations
{
  if (self->_context == 1)
  {
    self->_requiresCIDVUIConfigurations = 1;
    -[PKPassbookSettingsController refreshPasses](self, "refreshPasses");
  }
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPassbookSettingsController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke;
  v7[3] = &unk_1E3E61388;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Proofing completed with error %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_refreshCIDVUIConfigurations");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 648));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke_669;
    v8[3] = &unk_1E3E61388;
    v6 = WeakRetained;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v6, "requestDismissingPresentedViewControllerWithSettingsController:animated:completion:", v5, 1, v8);

  }
}

uint64_t __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke_669(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "requestResetToRootWithSettingsController:animated:", *(_QWORD *)(a1 + 40), 1);
  return result;
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPassbookSettingsController_proofingFlowManager_didChangeActiveConfigurations___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __82__PKPassbookSettingsController_proofingFlowManager_didChangeActiveConfigurations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshCIDVUIConfigurations");
}

- (void)willHandleURL
{
  -[PKLaunchAuthorizationPromptController disableLaunchPromptsForSession](self->_launchAuthorizationPromptController, "disableLaunchPromptsForSession");
}

- (void)reloadSpecifiers
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "settingsControllerRequestsReloadSpecifiers:", self);

}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  NSObject *v8;
  int v9;
  PKPassbookSettingsController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "settingsController:requestsForcedPresentViewController:animated:completion:", self, v6, v4, 0);
    else
      objc_msgSend(WeakRetained, "settingsController:requestsPresentViewController:animated:completion:", self, v6, v4, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218498;
      v10 = self;
      v11 = 2048;
      v12 = v6;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookSettingsController (%p): dropping request to show view controller (%p): %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (PKPassbookSettingsDelegate)delegate
{
  return (PKPassbookSettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultWalletContext, 0);
  objc_storeStrong((id *)&self->_hideMyEmailManager, 0);
  objc_storeStrong((id *)&self->_systemPolicyForApp, 0);
  objc_storeStrong((id *)&self->_openAccountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_closedAccountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_openAccounts, 0);
  objc_storeStrong((id *)&self->_closedSavingsAccounts, 0);
  objc_storeStrong((id *)&self->_launchAuthorizationPromptController, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_companionPaymentDataProvider, 0);
  objc_storeStrong((id *)&self->_latestTransitBalanceModel, 0);
  objc_destroyWeak((id *)&self->_expressPassesViewController);
  objc_storeStrong((id *)&self->_defaultExpressTransitSpecifier, 0);
  objc_storeStrong((id *)&self->_expressTransitSectionFooterText, 0);
  objc_storeStrong((id *)&self->_expressTransitSubtitleText, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_pairedDeviceSupportsFeatureByAccountID, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentTinkerSetupButton, 0);
  objc_storeStrong((id *)&self->_peerPaymentSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentDelegate, 0);
  objc_storeStrong((id *)&self->_defaultContactPhoneSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultContactEmailSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultShippingAddressSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultPaymentSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingCompanionCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_companionCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_otherCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_paymentCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_addCardButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_activeCIDVUIConfigurations, 0);
  objc_storeStrong((id *)&self->_coreIDVUIProofingFlowManager, 0);
  objc_storeStrong((id *)&self->_bankConnectSpecifiers, 0);
  objc_storeStrong((id *)&self->_institutionsProviderResponses, 0);
  objc_storeStrong((id *)&self->_orderManagementSpecifiers, 0);
  objc_storeStrong((id *)&self->_onlinePaymentsSpecifiers, 0);
  objc_storeStrong((id *)&self->_expiredPassesSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_credentialCenterSpecifiers, 0);
  objc_storeStrong((id *)&self->_cardBenefitSpecifiers, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_showPayLaterOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_handoffSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_lockscreenSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_lockscreenSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_defaultAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_pendingCompanionPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_companionPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_pendingCompanionPasses, 0);
  objc_storeStrong((id *)&self->_hiddenCompanionPasses, 0);
  objc_storeStrong((id *)&self->_companionPasses, 0);
  objc_storeStrong((id *)&self->_otherPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_paymentPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_otherPasses, 0);
  objc_storeStrong((id *)&self->_paymentPasses, 0);
  objc_storeStrong((id *)&self->_provisioningPassIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultCardIdentifier, 0);
  objc_storeStrong((id *)&self->_institutionsDataProvider, 0);
  objc_storeStrong((id *)&self->_inboxDataSource, 0);
  objc_storeStrong((id *)&self->_associatedAccountController, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_unavailableCards, 0);
  objc_storeStrong((id *)&self->_availableCards, 0);
  objc_storeStrong((id *)&self->_defaultCardsController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_destroyWeak((id *)&self->_optionsDelegate);
  objc_destroyWeak((id *)&self->_paymentDataProvider);
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
