@implementation ICQPreferencesRemoteUIDelegate

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  ICQPreferencesRemoteUIDelegate *v8;

  v4 = (void *)MEMORY[0x24BDB4398];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:](self, "initWithNavigationController:initialAction:account:", v5, 0, v7);

  return v8;
}

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 initialAction:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  ICQPreferencesRemoteUIDelegate *v11;

  v6 = (void *)MEMORY[0x24BDB4398];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aa_primaryAppleAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:](self, "initWithNavigationController:initialAction:account:", v8, v7, v10);

  return v11;
}

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 buyStorageFlow:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  ICQPreferencesRemoteUIDelegate *v11;

  if (a4)
    v6 = (id)*MEMORY[0x24BE75820];
  else
    v6 = 0;
  v7 = (void *)MEMORY[0x24BDB4398];
  v8 = a3;
  objc_msgSend(v7, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aa_primaryAppleAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:](self, "initWithNavigationController:initialAction:account:", v8, v6, v10);

  return v11;
}

- (ICQPreferencesRemoteUIDelegate)initWithNavigationController:(id)a3 initialAction:(id)a4 account:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICQPreferencesRemoteUIDelegate *v12;
  ICQPreferencesRemoteUIDelegate *v13;
  ICQPreferencesFreshmintManager *v14;
  ICQPreferencesFreshmintManager *freshmintManager;
  void *v16;
  void *v17;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *v18;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *recommendationAnalyticsHelper;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ICQPreferencesRemoteUIDelegate;
  v12 = -[ICQPreferencesRemoteUIDelegate init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_navigationController, a3);
    objc_storeStrong((id *)&v13->_initialAction, a4);
    objc_storeStrong((id *)&v13->_account, a5);
    v14 = objc_alloc_init(ICQPreferencesFreshmintManager);
    freshmintManager = v13->_freshmintManager;
    v13->_freshmintManager = v14;

    -[ICQPreferencesFreshmintManager setDelegate:](v13->_freshmintManager, "setDelegate:", v13);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel_willShowController_, *MEMORY[0x24BE75BC8], v13->_navigationController);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v13, sel__reloadQuotaInfo, CFSTR("QuotaInformationChanged"), 0);

    v18 = -[RecommendationAnalyticsHelper initWithAccount:]([_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper alloc], "initWithAccount:", v13->_account);
    recommendationAnalyticsHelper = v13->_recommendationAnalyticsHelper;
    v13->_recommendationAnalyticsHelper = v18;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  char isKindOfClass;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UINavigationController presentedViewController](self->_navigationController, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", 0, 0);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_deleteLoaders, "enumerateObjectsUsingBlock:", &__block_literal_global_15);
  -[RUILoader setDelegate:](self->_loader, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)ICQPreferencesRemoteUIDelegate;
  -[ICQPreferencesRemoteUIDelegate dealloc](&v6, sel_dealloc);
}

uint64_t __41__ICQPreferencesRemoteUIDelegate_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (void)willShowController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE75BD0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE75BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if (v8 == 2)
    {
      -[NSMutableArray lastObject](self->_objectModels, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "defaultPages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v5);

      if (v11)
      {
        -[ICQPreferencesRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
        -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
      }
    }
  }

}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_navigationController;
}

- (void)cancelRemoteUI
{
  -[ICQPreferencesRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
  self->_cancelled = 1;
}

- (void)cleanupLoader
{
  id WeakRetained;
  RUILoader *loader;
  ICQUICloudStorageOffersManager *storageOffersManager;

  if (-[RUILoader isLoading](self->_loader, "isLoading"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "loadFailed:withError:", self, 0);

  }
  -[RUILoader cancel](self->_loader, "cancel");
  -[RUILoader setDelegate:](self->_loader, "setDelegate:", 0);
  loader = self->_loader;
  self->_loader = 0;

  if (!self->_modalNavigationController)
  {
    storageOffersManager = self->_storageOffersManager;
    self->_storageOffersManager = 0;

  }
}

- (void)loadURL:(id)a3 postBody:(id)a4 additionalHeaders:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  const __CFString *requestContentType;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  uint64_t v54;
  void *v55;
  RUILoader *v56;
  RUILoader *loader;
  id WeakRetained;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICQPreferencesRemoteUIDelegate nextSignpostId](self, "nextSignpostId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MANAGE"));

  if (v12)
  {
    _ICQSignpostLogSystem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = _ICQSignpostCreateWithObject();
    v17 = v16;

    _ICQSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21F2CC000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "iOSManageStorageLoad", " enableTelemetry=YES ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:].cold.1(v15, v20, v21, v22, v23, v24, v25, v26);

    self->_signpost.identifier = v15;
    self->_signpost.timestamp = v17;
    -[RecommendationAnalyticsHelper sendManageStorageDisplayedEventWithCompletionHandler:](self->_recommendationAnalyticsHelper, "sendManageStorageDisplayedEventWithCompletionHandler:", &__block_literal_global_76);
  }
  else
  {
    -[ICQPreferencesRemoteUIDelegate nextSignpostId](self, "nextSignpostId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("MANAGE_DRILLDOWN"));

    if (v28)
    {
      _ICQSignpostLogSystem();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_opt_new();
      v31 = _ICQSignpostCreateWithObject();
      v33 = v32;

      _ICQSignpostLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21F2CC000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v31, "iOSManageStorageDrilldownLoad", " enableTelemetry=YES ", buf, 2u);
      }

      _ICQSignpostLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:].cold.2(v31, v36, v37, v38, v39, v40, v41, v42);

      self->_signpost.identifier = v31;
      self->_signpost.timestamp = v33;
    }
    else
    {
      -[ICQPreferencesRemoteUIDelegate nextSignpostId](self, "nextSignpostId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        _ICQGetLogSystem();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          -[ICQPreferencesRemoteUIDelegate nextSignpostId](self, "nextSignpostId");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v66 = v45;
          _os_log_impl(&dword_21F2CC000, v44, OS_LOG_TYPE_DEFAULT, "Unknown signpost id %@", buf, 0xCu);

        }
      }
    }
  }
  -[ICQPreferencesRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
  self->_cancelled = 0;
  ICQUSLogForCategory(0);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v10;
    _os_log_impl(&dword_21F2CC000, v46, OS_LOG_TYPE_DEFAULT, "additional headers: %@", buf, 0xCu);
  }

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v8, 1, 30.0);
  objc_msgSend(v47, "ak_addAnisetteHeaders");
  objc_msgSend(v47, "ak_addDeviceUDIDHeader");
  if (v9)
  {
    objc_msgSend(v47, "setHTTPBody:", v9);
    objc_msgSend(v47, "setHTTPMethod:", CFSTR("POST"));
    if (self->_requestContentType)
      requestContentType = (const __CFString *)self->_requestContentType;
    else
      requestContentType = CFSTR("text/html");
    objc_msgSend(v47, "addValue:forHTTPHeaderField:", requestContentType, CFSTR("Content-Type"));
  }
  objc_msgSend(v47, "aa_addMultiUserDeviceHeaderIfEnabled");
  +[ICQUsageQuotaRequest addHeadersToRequest:forAccount:](ICQQuotaInfoRequest, "addHeadersToRequest:forAccount:", v47, self->_account);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v49 = v10;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v61 != v52)
          objc_enumerationMutation(v49);
        v54 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v49, "objectForKey:", v54, (_QWORD)v60);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addValue:forHTTPHeaderField:", v55, v54);

      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v51);
  }

  if (!self->_loader)
  {
    v56 = (RUILoader *)objc_alloc_init(MEMORY[0x24BE7EDC8]);
    loader = self->_loader;
    self->_loader = v56;

    -[RUILoader setDelegate:](self->_loader, "setDelegate:", self);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v59 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v59, "loadStarted:", self);

  }
  -[RUILoader loadXMLUIWithRequest:](self->_loader, "loadXMLUIWithRequest:", v47, (_QWORD)v60);

}

void __69__ICQPreferencesRemoteUIDelegate_loadURL_postBody_additionalHeaders___block_invoke()
{
  NSObject *v0;

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __69__ICQPreferencesRemoteUIDelegate_loadURL_postBody_additionalHeaders___block_invoke_cold_1(v0);

}

- (void)loadURL:(id)a3 postBody:(id)a4
{
  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](self, "loadURL:postBody:additionalHeaders:", a3, a4, 0);
}

- (void)reloadTopControllerWithAdditionalHeaders:(id)a3
{
  NSMutableArray *objectModels;
  id v5;
  void *v6;
  id v7;

  objectModels = self->_objectModels;
  v5 = a3;
  -[NSMutableArray lastObject](objectModels, "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  self->_forceActionSignal = 3;
  objc_msgSend(v7, "sourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](self, "loadURL:postBody:additionalHeaders:", v6, 0, v5);

}

- (void)popAndReloadFromRemoteUI:(BOOL)a3 additionalHeaders:(id)a4
{
  uint64_t v6;
  NSMutableArray *objectModels;
  id v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  if (a3)
  {
    v6 = -1;
  }
  else
  {
    objectModels = self->_objectModels;
    v8 = objc_alloc_init(MEMORY[0x24BE7EDE0]);
    -[NSMutableArray addObject:](objectModels, "addObject:", v8);

    v6 = -2;
  }
  -[NSMutableArray objectAtIndex:](self->_objectModels, "objectAtIndex:", -[NSMutableArray count](self->_objectModels, "count") + v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("manageStorageBackup"));

  v12 = 4;
  if (v11)
    v12 = 8;
  self->_forceActionSignal = v12;
  objc_msgSend(v9, "sourceURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](self, "loadURL:postBody:additionalHeaders:", v13, 0, v14);

}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  __objc2_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  UINavigationController *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[ICQPreferencesRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Action taken at PrefRUIDelegate: %@", buf, 0xCu);
  }

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("localBackup")))
  {
    v10 = ICQLocalBackupController;
LABEL_7:
    -[__objc2_class specifierForAccount:](v10, "specifierForAccount:", self->_account);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = v11;
    objc_msgSend(v11, "setProperty:forKey:", v8, CFSTR("attributes"));
    objc_msgSend(v12, "setProperty:forKey:", self, CFSTR("remoteDelegate"));
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("remoteBackup")))
  {
    v10 = ICQRemoteBackupController;
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("buyStorage")))
  {
    v15 = *MEMORY[0x24BE75820];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __71__ICQPreferencesRemoteUIDelegate_objectModel_pressedButton_attributes___block_invoke;
    v21[3] = &unk_24E3F35E8;
    v21[4] = self;
    -[ICQPreferencesRemoteUIDelegate _presentCloudStorageOffersFlowWithAction:completion:](self, "_presentCloudStorageOffersFlowWithAction:completion:", v15, v21);
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("afuiSettings")))
    {
      +[ICQPreferencesRemoteUIDelegate afuiSettingsSpecifier](ICQPreferencesRemoteUIDelegate, "afuiSettingsSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("messagesSettings")))
    {
      +[ICQPreferencesRemoteUIDelegate messagesSettingsSpecifier](ICQPreferencesRemoteUIDelegate, "messagesSettingsSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("healthSettings")))
    {
      +[ICQPreferencesRemoteUIDelegate healthSettingsSpecifier](ICQPreferencesRemoteUIDelegate, "healthSettingsSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v12 = 0;
LABEL_9:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("action"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("launchPlanManagement")) & 1) == 0)
  {
    _ICQStringForAction();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v14))
    {

    }
    else
    {
      _ICQStringForAction();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "isEqualToString:", v16);

      if (!v17)
        goto LABEL_17;
    }
  }
  -[ICQPreferencesRemoteUIDelegate freshmintManager](self, "freshmintManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShouldShowFreshmint:", 1);

  self->_icqAction = _ICQActionForString();
LABEL_17:
  if (v12)
  {
    v19 = self->_navigationController;
    CreateDetailControllerInstanceWithClass();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setParentController:", 0);
    objc_msgSend(v20, "setRootController:", v19);
    objc_msgSend(v20, "setSpecifier:", v12);
    -[UINavigationController showViewController:sender:](v19, "showViewController:sender:", v20, self);

  }
}

uint64_t __71__ICQPreferencesRemoteUIDelegate_objectModel_pressedButton_attributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "buyFlowCompletionDidSucceed:error:", a2, a3);
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void (**v17)(void *, uint64_t, _QWORD);
  void *v18;
  int v19;
  void *v20;
  _BOOL4 v21;
  ICQUIPreferencesLiftUIDelegate *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *requestContentType;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  id linkCompletionBlock;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, void *);
  void *v43;
  id v44;
  ICQPreferencesRemoteUIDelegate *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "linkURL: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v40 = MEMORY[0x24BDAC760];
  v41 = 3221225472;
  v42 = __80__ICQPreferencesRemoteUIDelegate_objectModel_pressedLink_httpMethod_completion___block_invoke;
  v43 = &unk_24E3F4B60;
  v15 = v11;
  v44 = v15;
  objc_copyWeak(&v47, (id *)buf);
  v16 = v13;
  v45 = self;
  v46 = v16;
  v17 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v40);
  if ((-[RUILoader isLoading](self->_loader, "isLoading", v40, v41, v42, v43) & 1) == 0
    && !-[ICQPreferencesRemoteUIDelegate _loadNativeURL:](self, "_loadNativeURL:", v15))
  {
    objc_msgSend(v12, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("liftui"));

    if (v19)
    {
      -[ICQPreferencesRemoteUIDelegate liftUIDelegate](self, "liftUIDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (v21)
      {
        v22 = -[ICQUIPreferencesLiftUIDelegate initWithNavigationController:account:]([ICQUIPreferencesLiftUIDelegate alloc], "initWithNavigationController:account:", self->_navigationController, self->_account);
        -[ICQPreferencesRemoteUIDelegate setLiftUIDelegate:](self, "setLiftUIDelegate:", v22);

        -[ICQPreferencesRemoteUIDelegate liftUIDelegate](self, "liftUIDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDelegate:", self);

      }
      -[ICQPreferencesRemoteUIDelegate liftUIDelegate](self, "liftUIDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "loadURL:", v15);

      v17[2](v17, 1, 0);
    }
    else
    {
      objc_msgSend(v12, "lowercaseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("post"));

      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "defaultPages");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "populatePostbackDictionary:", v27);

        if (v27)
        {
          objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v27, 100, 0, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          requestContentType = self->_requestContentType;
          self->_requestContentType = (NSString *)CFSTR("application/x-plist");

        }
        else
        {
          objc_msgSend(v10, "postbackData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v38 = _Block_copy(v17);
        linkCompletionBlock = self->_linkCompletionBlock;
        self->_linkCompletionBlock = v38;

        -[ICQPreferencesRemoteUIDelegate loadURL:postBody:](self, "loadURL:postBody:", v15, v30);
      }
      else
      {
        -[ICQPreferencesRemoteUIDelegate freshmintManager](self, "freshmintManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "shouldShowFreshmint");

        if (v33)
        {
          -[ICQPreferencesRemoteUIDelegate _freshmintStorageUpgradeWithCompletion:withURL:](self, "_freshmintStorageUpgradeWithCompletion:withURL:", v17, v15);
        }
        else
        {
          if (-[ICQPreferencesRemoteUIDelegate isManageStorage](self, "isManageStorage"))
          {
            objc_msgSend(v10, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("iCloudManageStorage"));

            if (v35)
              -[ICQPreferencesRemoteUIDelegate setNextSignpostId:](self, "setNextSignpostId:", CFSTR("MANAGE_DRILLDOWN"));
          }
          v36 = _Block_copy(v17);
          v37 = self->_linkCompletionBlock;
          self->_linkCompletionBlock = v36;

          -[ICQPreferencesRemoteUIDelegate loadURL:postBody:](self, "loadURL:postBody:", v15, 0);
        }
      }
    }
  }

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);

}

void __80__ICQPreferencesRemoteUIDelegate_objectModel_pressedLink_httpMethod_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "icqui_isStopFamilySharingURL"))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "icqui_isJoinOrLeaveFamilySharingURL"))
      goto LABEL_11;
    goto LABEL_10;
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[1], "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "isNativeManageStorage");

      if ((v7 & 1) == 0)
        v8 = (id)objc_msgSend(v5[1], "popViewControllerAnimated:", 1);
    }
    else
    {

    }
LABEL_10:
    v9 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v9, "_postQuotaDidChangeNotification");

  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)deleteAllDocuments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  ++self->_deleteAllDocumentsAttemptCount;
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("deleteAllURL"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:](self, "loadURL:postBody:", v8, 0);

}

- (void)confirmDeleteAll
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
  _QWORD v19[5];

  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("header"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_24E400750, CFSTR("CloudGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_PROMPT"), &stru_24E400750, CFSTR("CloudGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL_EXPLAINATION"), &stru_24E400750, CFSTR("CloudGroup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __50__ICQPreferencesRemoteUIDelegate_confirmDeleteAll__block_invoke;
  v19[3] = &unk_24E3F3610;
  v19[4] = self;
  -[ICQPreferencesRemoteUIDelegate confirmDeleteWithTitle:prompt:explanation:confirmationAction:](self, "confirmDeleteWithTitle:prompt:explanation:confirmationAction:", v11, v13, v17, v19);

}

uint64_t __50__ICQPreferencesRemoteUIDelegate_confirmDeleteAll__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "deleteAllDocuments");
}

- (void)confirmDeleteWithTitle:(id)a3 prompt:(id)a4 explanation:(id)a5 confirmationAction:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v10 = a6;
  v11 = (void *)MEMORY[0x24BEBD538];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sf_isiPad");

  if (v16)
    v17 = v13;
  else
    v17 = v12;
  if (v16)
    v18 = v12;
  else
    v18 = 0;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v17, v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("CloudGroup"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v23);

  v24 = (void *)MEMORY[0x24BEBD3A8];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __95__ICQPreferencesRemoteUIDelegate_confirmDeleteWithTitle_prompt_explanation_confirmationAction___block_invoke;
  v27[3] = &unk_24E3F4B88;
  v28 = v10;
  v25 = v10;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v14, 2, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addAction:", v26);
  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v19, 1, 0);

}

uint64_t __95__ICQPreferencesRemoteUIDelegate_confirmDeleteWithTitle_prompt_explanation_confirmationAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)objectModel:(id)a3 page:(id)a4 toggledEditing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  ICQPreferencesRemoteUIDelegateTableCellButton *button;
  ICQPreferencesRemoteUIDelegateTableCellButton *v12;
  void *v13;
  void *v14;
  ICQPreferencesRemoteUIDelegateTableCellButton *v15;
  ICQPreferencesRemoteUIDelegateTableCellButton *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
  {
    button = self->_button;
    if (!button)
    {
      v12 = [ICQPreferencesRemoteUIDelegateTableCellButton alloc];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_24E400750, CFSTR("CloudGroup"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[ICQPreferencesRemoteUIDelegateTableCellButton initWithName:target:action:](v12, "initWithName:target:action:", v14, self, sel_confirmDeleteAll);
      v16 = self->_button;
      self->_button = v15;

      button = self->_button;
    }
    -[ICQPreferencesRemoteUIDelegateTableCellButton setAlpha:](button, "setAlpha:", 0.0);
    objc_msgSend(v10, "tableViewOM");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTableFooterView:", self->_button);

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke;
    v23[3] = &unk_24E3F3610;
    v23[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v23, 0.3);
  }
  else
  {
    v19 = (void *)MEMORY[0x24BEBDB00];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_2;
    v22[3] = &unk_24E3F3610;
    v22[4] = self;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_3;
    v20[3] = &unk_24E3F3540;
    v21 = v9;
    objc_msgSend(v19, "animateWithDuration:animations:completion:", v22, v20, 0.3);

  }
}

uint64_t __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setAlpha:", 1.0);
}

uint64_t __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setAlpha:", 0.0);
}

void __66__ICQPreferencesRemoteUIDelegate_objectModel_page_toggledEditing___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableViewOM");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTableFooterView:", 0);

}

- (BOOL)objectModel:(id)a3 page:(id)a4 deletedTableRow:(id)a5 atIndexPath:(id)a6 withURL:(id)a7 httpMethod:(id)a8
{
  void *v13;
  id v14;
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
  id v25;
  void *v27;
  _QWORD v29[4];
  id v30;
  ICQPreferencesRemoteUIDelegate *v31;

  v13 = (void *)MEMORY[0x24BDBCE70];
  v14 = a5;
  objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", a3, CFSTR("objectModel"), a4, CFSTR("page"), v14, CFSTR("row"), a6, CFSTR("indexPath"), a7, CFSTR("url"), a8, CFSTR("httpMethod"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETE_ITEM"), &stru_24E400750, CFSTR("CloudGroup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_ITEM_PROMPT"), &stru_24E400750, CFSTR("CloudGroup"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DELETE_ITEM_EXPLAINATION"), &stru_24E400750, CFSTR("CloudGroup"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectForKey:", CFSTR("label"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __98__ICQPreferencesRemoteUIDelegate_objectModel_page_deletedTableRow_atIndexPath_withURL_httpMethod___block_invoke;
  v29[3] = &unk_24E3F34D8;
  v30 = v15;
  v31 = self;
  v25 = v15;
  -[ICQPreferencesRemoteUIDelegate confirmDeleteWithTitle:prompt:explanation:confirmationAction:](self, "confirmDeleteWithTitle:prompt:explanation:confirmationAction:", v16, v18, v24, v29);

  return 0;
}

void __98__ICQPreferencesRemoteUIDelegate_objectModel_page_deletedTableRow_atIndexPath_withURL_httpMethod___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("httpMethod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("post"));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("objectModel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postbackData");
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  v6 = objc_alloc(MEMORY[0x24BDD16B0]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:cachePolicy:timeoutInterval:", v7, 1, 30.0);

  objc_msgSend(v8, "setHTTPBody:", v23);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "addValue:forHTTPHeaderField:", CFSTR("text/html"), CFSTR("Content-Type"));
  +[ICQUsageQuotaRequest addHeadersToRequest:forAccount:](ICQQuotaInfoRequest, "addHeadersToRequest:forAccount:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  v9 = objc_alloc_init(MEMORY[0x24BE7EDC8]);
  objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));
  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 56);
    *(_QWORD *)(v12 + 56) = v11;

    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  }
  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(v9, "loadXMLUIWithRequest:", v8);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("page"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tableViewOM");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("indexPath"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v16, "section"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "removeRowAtIndex:", objc_msgSend(v16, "row"));
  objc_msgSend(v19, "rows");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
    objc_msgSend(*(id *)(a1 + 40), "setLastDocumentDeleteLoader:", v9);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteRowsAtIndexPaths:withRowAnimation:", v22, 100);

}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  id v12;

  v3 = a3;
  if (!-[NSMutableArray count](self->_objectModels, "count"))
    -[ICQPreferencesRemoteUIDelegate _popObjectModelAnimated:].cold.1();
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
  objc_msgSend(v12, "defaultPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;
  if (v6 >= 0)
  {
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController topViewController](self->_navigationController, "topViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v7)
      {
        if (v6)
          v9 = 0;
        else
          v9 = v3;
        v10 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", v9);
      }

    }
    while (v6-- > 0);
  }

}

- (void)objectModelPressedBack:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[ICQPreferencesRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    if (v6)
    {
      objc_msgSend(v9, "defaultPages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v6);

      if (v8)
        -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t identifier;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSString *nextSignpostId;
  void *v19;
  id WeakRetained;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void (*v51)(id, id *);
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  ICQPreferencesRemoteUIDelegate *v56;
  void (**linkCompletionBlock)(id, uint64_t, _QWORD);
  id v58;
  uint64_t v59;
  unint64_t forceActionSignal;
  uint64_t v61;
  id v62;
  id v63;
  NSMutableArray *objectModels;
  NSMutableArray *v65;
  NSMutableArray *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id *v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  ICQPreferencesRemoteUIDelegate *v98;
  NSString *initialAction;
  NSString *v100;
  NSString *v101;
  NSString *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  id obj;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id *location;
  id v126;
  ICQPreferencesRemoteUIDelegate *v127;
  _QWORD aBlock[4];
  id v129;
  ICQPreferencesRemoteUIDelegate *v130;
  _QWORD v131[5];
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  void *v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint8_t v161[128];
  __int128 buf;
  void *(*v163)(uint64_t);
  void *v164;
  uint64_t *v165;
  uint64_t v166;

  v166 = *MEMORY[0x24BDAC8D0];
  v120 = a3;
  v126 = a4;
  v117 = a5;
  v127 = self;
  -[ICQPreferencesRemoteUIDelegate nextSignpostId](self, "nextSignpostId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v8, "isEqualToString:", CFSTR("MANAGE"));

  if ((_DWORD)a4)
  {
    _ICQSignpostGetNanoseconds();
    _ICQSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    identifier = v127->_signpost.identifier;
    if (identifier - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_21F2CC000, v10, OS_SIGNPOST_INTERVAL_END, identifier, "iOSManageStorageLoad", ", (uint8_t *)&buf, 2u);
    }

    _ICQSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICQPreferencesRemoteUIDelegate loader:receivedObjectModel:topActionSignal:].cold.2();
  }
  else
  {
    -[ICQPreferencesRemoteUIDelegate nextSignpostId](self, "nextSignpostId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("MANAGE_DRILLDOWN"));

    if (!v14)
      goto LABEL_14;
    _ICQSignpostGetNanoseconds();
    _ICQSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v127->_signpost.identifier;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_21F2CC000, v16, OS_SIGNPOST_INTERVAL_END, v17, "iOSManageStorageDrilldownLoad", ", (uint8_t *)&buf, 2u);
    }

    _ICQSignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICQPreferencesRemoteUIDelegate loader:receivedObjectModel:topActionSignal:].cold.3();
  }

LABEL_14:
  nextSignpostId = v127->_nextSignpostId;
  v127->_nextSignpostId = 0;

  -[ICQPreferencesRemoteUIDelegate lastDocumentDeleteLoader](v127, "lastDocumentDeleteLoader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v19, "isEqual:", v120);

  location = (id *)&v127->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&v127->_delegate);
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    objc_msgSend(v126, "allPages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v150;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v150 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i);
          v27 = objc_loadWeakRetained(location);
          objc_msgSend(v27, "remoteUIDelegate:didCreatePage:forAccount:inObjectModel:", v127, v26, v127->_account, v126);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      }
      while (v23);
    }
  }
  else
  {
    v28 = objc_loadWeakRetained(location);
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) == 0)
      goto LABEL_32;
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    objc_msgSend(v126, "allPages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v146;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v146 != v31)
            objc_enumerationMutation(v22);
          v33 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j);
          v34 = objc_loadWeakRetained(location);
          objc_msgSend(v34, "remoteUIDelegate:didCreatePage:inObjectModel:", v127, v33, v126);

        }
        v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
      }
      while (v30);
    }
  }

LABEL_32:
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  objc_msgSend(v126, "allPages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
  if (v118)
  {
    v35 = *(_QWORD *)v142;
    v114 = *(_QWORD *)v142;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v142 != v35)
        {
          v37 = v36;
          objc_enumerationMutation(obj);
          v36 = v37;
        }
        v116 = v36;
        v38 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v36);
        v137 = 0u;
        v138 = 0u;
        v139 = 0u;
        v140 = 0u;
        objc_msgSend(v38, "tableViewOM");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sections");
        v121 = (id)objc_claimAutoreleasedReturnValue();

        v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
        if (v123)
        {
          v122 = *(_QWORD *)v138;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v138 != v122)
              {
                v41 = v40;
                objc_enumerationMutation(v121);
                v40 = v41;
              }
              v124 = v40;
              v42 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v40);
              v133 = 0u;
              v134 = 0u;
              v135 = 0u;
              v136 = 0u;
              objc_msgSend(v42, "rows");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
              if (v44)
              {
                v45 = *(_QWORD *)v134;
                do
                {
                  for (k = 0; k != v44; ++k)
                  {
                    if (*(_QWORD *)v134 != v45)
                      objc_enumerationMutation(v43);
                    v47 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * k);
                    objc_msgSend(v47, "attributes");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("encryptedFile"));
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v49)
                    {
                      v132 = 0;
                      v50 = v49;
                      v153 = 0;
                      v154 = &v153;
                      v155 = 0x2020000000;
                      v51 = (void (*)(id, id *))getBRGetFileNameFromServerInfoBlobSymbolLoc_ptr;
                      v156 = getBRGetFileNameFromServerInfoBlobSymbolLoc_ptr;
                      if (!getBRGetFileNameFromServerInfoBlobSymbolLoc_ptr)
                      {
                        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
                        *((_QWORD *)&buf + 1) = 3221225472;
                        v163 = __getBRGetFileNameFromServerInfoBlobSymbolLoc_block_invoke;
                        v164 = &unk_24E3F3868;
                        v165 = &v153;
                        __getBRGetFileNameFromServerInfoBlobSymbolLoc_block_invoke((uint64_t)&buf);
                        v51 = (void (*)(id, id *))v154[3];
                      }
                      _Block_object_dispose(&v153, 8);
                      if (!v51)
                        -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:].cold.1();
                      v51(v50, &v132);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();

                      v53 = v132;
                      if (v52)
                      {
                        objc_msgSend(v47, "attributes");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        v55 = objc_msgSend(v54, "mutableCopy");

                        -[NSObject setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v52, CFSTR("label"));
                        objc_msgSend(v47, "setAttributes:", v55);
                      }
                      else
                      {
                        _ICQGetLogSystem();
                        v55 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(buf) = 138412290;
                          *(_QWORD *)((char *)&buf + 4) = v53;
                          _os_log_error_impl(&dword_21F2CC000, v55, OS_LOG_TYPE_ERROR, "Error decrypting data blob: %@", (uint8_t *)&buf, 0xCu);
                        }
                      }

                    }
                  }
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
                }
                while (v44);
              }

              v40 = v124 + 1;
            }
            while (v124 + 1 != v123);
            v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
          }
          while (v123);
        }

        v36 = v116 + 1;
        v35 = v114;
      }
      while (v116 + 1 != v118);
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
      v35 = v114;
    }
    while (v118);
  }

  if (!-[NSMutableArray containsObject:](v127->_deleteLoaders, "containsObject:", v120)
    || (-[NSMutableArray removeObject:](v127->_deleteLoaders, "removeObject:", v120), v115))
  {
    -[ICQPreferencesRemoteUIDelegate setLastDocumentDeleteLoader:](v127, "setLastDocumentDeleteLoader:", 0);
    objc_msgSend(v126, "setDelegate:", v127);
    v56 = v127;
    linkCompletionBlock = (void (**)(id, uint64_t, _QWORD))v127->_linkCompletionBlock;
    if (linkCompletionBlock)
    {
      linkCompletionBlock[2](linkCompletionBlock, 1, 0);
      v58 = v127->_linkCompletionBlock;
      v127->_linkCompletionBlock = 0;

      v56 = v127;
    }
    if (!v56->_cancelled)
    {
      v59 = objc_msgSend(v117, "topSignal");
      forceActionSignal = v127->_forceActionSignal;
      if (forceActionSignal)
      {
        v127->_forceActionSignal = 0;
        v61 = forceActionSignal;
      }
      else
      {
        v61 = v59;
      }
      v62 = objc_loadWeakRetained(location);

      if (v62)
      {
        v63 = objc_loadWeakRetained(location);
        objc_msgSend(v63, "loadFinished:", v127);

      }
      objectModels = v127->_objectModels;
      if (!objectModels)
      {
        v65 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v66 = v127->_objectModels;
        v127->_objectModels = v65;

        objectModels = v127->_objectModels;
      }
      if (!-[NSMutableArray count](objectModels, "count"))
      {
        if (v61 == 3)
        {
          if (-[ICQPreferencesRemoteUIDelegate isNativeManageStorage](v127, "isNativeManageStorage"))
            v61 = 0;
          else
            v61 = 2;
        }
        else if (v61 == 4)
        {
          v61 = 0;
        }
      }
      objc_msgSend(v126, "defaultPages");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "lastObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61 == 2 && v68)
      {
        -[NSMutableArray addObject:](v127->_objectModels, "addObject:", v126);
        -[UINavigationController showViewController:sender:](v127->_navigationController, "showViewController:sender:", v68);
        -[UINavigationController setToolbarHidden:animated:](v127->_navigationController, "setToolbarHidden:animated:", 1, 0);
      }
      else if (v61 == 3 && v68)
      {
        -[UINavigationController viewControllers](v127->_navigationController, "viewControllers");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)objc_msgSend(v69, "mutableCopy");

        -[NSMutableArray removeLastObject](v127->_objectModels, "removeLastObject");
        objc_msgSend(v70, "removeLastObject");
        objc_msgSend(v70, "addObject:", v68);
        -[NSMutableArray addObject:](v127->_objectModels, "addObject:", v126);
        -[UINavigationController setViewControllers:animated:](v127->_navigationController, "setViewControllers:animated:", v70, 0);

      }
      else if (v61 == 4)
      {
        if (v68)
        {
          objc_msgSend(v126, "clientInfo");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("shouldRefreshStorageGraph"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[ICQPreferencesRemoteUIDelegate isNativeManageStorage](v127, "isNativeManageStorage")
            && objc_msgSend(v72, "isEqualToString:", CFSTR("true")))
          {
            v73 = -[UINavigationController popViewControllerAnimated:](v127->_navigationController, "popViewControllerAnimated:", 1);
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v74 = objc_claimAutoreleasedReturnValue();
            -[NSObject postNotificationName:object:](v74, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);
          }
          else if ((unint64_t)-[NSMutableArray count](v127->_objectModels, "count") > 1)
          {
            +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "noteQuotaInfoChanged");

            -[UINavigationController topViewController](v127->_navigationController, "topViewController");
            v74 = objc_claimAutoreleasedReturnValue();
            -[NSMutableArray removeLastObject](v127->_objectModels, "removeLastObject");
            -[NSMutableArray removeLastObject](v127->_objectModels, "removeLastObject");
            -[UINavigationController viewControllers](v127->_navigationController, "viewControllers");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = (void *)objc_msgSend(v76, "mutableCopy");

            objc_msgSend(v77, "removeLastObject");
            objc_msgSend(v77, "removeLastObject");
            -[NSMutableArray addObject:](v127->_objectModels, "addObject:", v126);
            objc_msgSend(v77, "addObject:", v68);
            objc_msgSend(v77, "addObject:", v74);
            -[UINavigationController setViewControllers:animated:](v127->_navigationController, "setViewControllers:animated:", v77, 0);
            v78 = -[UINavigationController popViewControllerAnimated:](v127->_navigationController, "popViewControllerAnimated:", 1);

          }
          else
          {
            ICQUSLogForCategory(0);
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_21F2CC000, v74, OS_LOG_TYPE_DEFAULT, "Pop + Replace requires at least 2 existing object models.", (uint8_t *)&buf, 2u);
            }
          }

        }
        else
        {
          -[ICQPreferencesRemoteUIDelegate _popObjectModelAnimated:](v127, "_popObjectModelAnimated:", 1);
        }
      }

      v56 = v127;
    }
    -[ICQPreferencesRemoteUIDelegate cleanupLoader](v56, "cleanupLoader");
  }
  objc_msgSend(v126, "clientInfo");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("action"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v80, "isEqualToString:", CFSTR("remoteAction:launchApp")))
  {
    v81 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v126, "clientInfo");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("remoteLaunchUrl"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "URLWithString:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQPreferencesRemoteUIDelegate _loadNativeURL:](v127, "_loadNativeURL:", v84);
  }
  v85 = objc_msgSend(v80, "isEqualToString:", CFSTR("buyStorage"));
  v86 = (id *)MEMORY[0x24BE75820];
  if ((_DWORD)v85)
  {
    __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(v85, v126);
    v87 = *v86;
    v131[0] = MEMORY[0x24BDAC760];
    v131[1] = 3221225472;
    v131[2] = __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_2;
    v131[3] = &unk_24E3F35E8;
    v131[4] = v127;
    -[ICQPreferencesRemoteUIDelegate _presentCloudStorageOffersFlowWithAction:completion:](v127, "_presentCloudStorageOffersFlowWithAction:completion:", v87, v131);
    goto LABEL_111;
  }
  v88 = objc_msgSend(v80, "isEqualToString:", CFSTR("launchPlanManagement"));
  if ((v88 & 1) != 0)
    goto LABEL_109;
  _ICQStringForAction();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v80, "isEqualToString:", v89))
  {

    goto LABEL_109;
  }
  _ICQStringForAction();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v80, "isEqualToString:", v90);

  if (v91)
  {
LABEL_109:
    __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(v88, v126);
    objc_msgSend(v126, "clientInfo");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("planManagementUrl"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      v127->_icqAction = _ICQActionForString();
      v94 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v126, "clientInfo");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("planManagementUrl"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "URLWithString:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICQPreferencesRemoteUIDelegate _freshmintStorageUpgradeWithCompletion:withURL:](v127, "_freshmintStorageUpgradeWithCompletion:withURL:", 0, v97);
    }
    goto LABEL_111;
  }
  if (objc_msgSend(v80, "isEqualToString:", CFSTR("UNIFIED_MESSAGING")))
  {
    objc_msgSend(v126, "clientInfo");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("storageChangeNotice"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
      objc_msgSend(MEMORY[0x24BEC72C0], "sendEventFor:withBundleID:link:", 2, CFSTR("com.apple.mobileslideshow"), 0);
  }
  else
  {
    objc_msgSend(v126, "identifier");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v111, "isEqualToString:", CFSTR("manageStorageBackup"));

    if (v112)
      __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(v113, v126);
  }
LABEL_111:
  v98 = v127;
  initialAction = v127->_initialAction;
  if (initialAction)
  {
    v100 = initialAction;
    v101 = v127->_initialAction;
    v102 = (NSString *)*MEMORY[0x24BE75838];
    if (v101 != (NSString *)*MEMORY[0x24BE75838])
    {
      v127->_initialAction = 0;

      v98 = v127;
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_3;
    aBlock[3] = &unk_24E3F4BB0;
    v103 = v126;
    v129 = v103;
    v130 = v98;
    v104 = _Block_copy(aBlock);
    if (v100 == *v86 || v100 == (NSString *)*MEMORY[0x24BE75828])
    {
      -[ICQPreferencesRemoteUIDelegate _presentCloudStorageOffersFlowWithAction:completion:](v127, "_presentCloudStorageOffersFlowWithAction:completion:", v100, v104);
    }
    else if (v100 == (NSString *)*MEMORY[0x24BE75830])
    {
      v105 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v103, "clientInfo");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "URLWithString:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICQPreferencesRemoteUIDelegate _freshmintStorageUpgradeWithCompletion:withURL:](v127, "_freshmintStorageUpgradeWithCompletion:withURL:", v104, v108);
    }
    else if (v100 == (NSString *)*MEMORY[0x24BE75840])
    {
      -[ICQPreferencesRemoteUIDelegate _activatePhotosElementForObjectModel:completion:](v127, "_activatePhotosElementForObjectModel:completion:", v103, v104);
    }
    else if (v100 == v102)
    {
      -[ICQPreferencesRemoteUIDelegate _activateBackupsElementForObjectModel:completion:](v127, "_activateBackupsElementForObjectModel:completion:", v103, v104);
    }

  }
}

void __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "clientInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "clientInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setSourceURL:", v7);
  }

}

uint64_t __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "buyFlowCompletionDidSucceed:error:", a2, a3);
}

void __77__ICQPreferencesRemoteUIDelegate_loader_receivedObjectModel_topActionSignal___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 176);
      if (v9 == (void *)*MEMORY[0x24BE75838])
      {
        *(_QWORD *)(v8 + 176) = 0;

        goto LABEL_11;
      }
    }
    ICQUSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Initial action successful; refreshing manage storage pane",
        (uint8_t *)&v11,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_reloadQuotaInfo");
  }
  else
  {
    ICQUSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Initial action failed with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
LABEL_11:

}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**linkCompletionBlock)(id, BOOL, id);
  id v12;
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
  int deleteAllDocumentsAttemptCount;
  NSObject *v29;
  int v30;
  NSObject *v31;
  id WeakRetained;
  int v33;
  _DWORD v34[7];

  *(_QWORD *)&v34[5] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  linkCompletionBlock = (void (**)(id, BOOL, id))self->_linkCompletionBlock;
  if (linkCompletionBlock)
  {
    linkCompletionBlock[2](linkCompletionBlock, v9 == 0, v9);
    v12 = self->_linkCompletionBlock;
    self->_linkCompletionBlock = 0;

  }
  if (!v9)
    goto LABEL_18;
  if (!-[NSMutableArray containsObject:](self->_deleteLoaders, "containsObject:", v8))
  {
    -[NSMutableArray lastObject](self->_objectModels, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "defaultPages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tableViewOM");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("deleteAllURL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPreferencesRemoteUIDelegate cleanupLoader](self, "cleanupLoader");
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqual:", v27))
    {
      deleteAllDocumentsAttemptCount = self->_deleteAllDocumentsAttemptCount;

      if (deleteAllDocumentsAttemptCount <= 2)
      {
        ICQUSLogForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_deleteAllDocumentsAttemptCount;
          v33 = 67109378;
          v34[0] = v30;
          LOWORD(v34[1]) = 2112;
          *(_QWORD *)((char *)&v34[1] + 2) = v9;
          _os_log_impl(&dword_21F2CC000, v29, OS_LOG_TYPE_DEFAULT, "Failed to delete all documents on attempt #%i: %@", (uint8_t *)&v33, 0x12u);
        }

        -[ICQPreferencesRemoteUIDelegate deleteAllDocuments](self, "deleteAllDocuments");
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
    ICQUSLogForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412290;
      *(_QWORD *)v34 = v9;
      _os_log_impl(&dword_21F2CC000, v31, OS_LOG_TYPE_DEFAULT, "RUILoader failed: %@", (uint8_t *)&v33, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "loadFailed:withError:", self, v9);

    goto LABEL_16;
  }
  -[NSMutableArray removeObject:](self->_deleteLoaders, "removeObject:", v8);
  if ((unint64_t)-[NSMutableArray count](self->_objectModels, "count") >= 2)
  {
    -[ICQPreferencesRemoteUIDelegate _popObjectModelAnimated:](self, "_popObjectModelAnimated:", 1);
    v13 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DELETE_ERROR"), &stru_24E400750, CFSTR("CloudGroup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v15, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E400750, CFSTR("CloudGroup"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v20);

    -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v16, 1, 0);
LABEL_17:

  }
LABEL_18:

}

- (void)objectModelDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[ICQPreferencesRemoteUIDelegate objectModelDidChange:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s, current delegate %@", (uint8_t *)&v7, 0x16u);

  }
  -[ICQPreferencesRemoteUIDelegate _processObjectModel:](self, "_processObjectModel:", v4);

}

- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ICQPreferencesRemoteUIDelegate objectModel:configureTableRow:page:]";
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[ICQPreferencesRemoteUIDelegate _processTableRow:](self, "_processTableRow:", v6);
}

- (void)_processObjectModel:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "subElementWithID:", CFSTR("substituteRowSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "rows", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ICQPreferencesRemoteUIDelegate _processTableRow:](self, "_processTableRow:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_processTableRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasSubstitutions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("index"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");
  -[ICQPreferencesRemoteUIDelegate dataclassSubstitutions](self, "dataclassSubstitutions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 > v9)
  {
    objc_msgSend(v4, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v12, "mutableCopy");

    -[ICQPreferencesRemoteUIDelegate dataclassSubstitutions](self, "dataclassSubstitutions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("index"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v15, "intValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BE00EF8];
    v21[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v18, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("label"));

    objc_msgSend(MEMORY[0x24BE75590], "acui_iconForDataclass:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v20);

    objc_msgSend(v4, "setAttributes:", v5);
LABEL_5:

  }
}

- (void)_reloadQuotaInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke_cold_1((uint64_t)v1, v5);

  objc_msgSend(*((id *)*v1 + 1), "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ICQUSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4 == v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "reloading manage storage pane", buf, 2u);
    }

    +[ICQCloudStorageInfo backupInfoHeadersForAccount:](ICQCloudStorageInfo, "backupInfoHeadersForAccount:", *((_QWORD *)*v1 + 14));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "reloadTopControllerWithAdditionalHeaders:", v7);
  }
  else if (v8)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "not reloading manage storage pane since it's not on top", v9, 2u);
  }

}

- (void)buyFlowCompletionDidSucceed:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  ICQUSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "buy storage successful; refreshing manage storage pane",
        (uint8_t *)&v9,
        2u);
    }

    -[ICQPreferencesRemoteUIDelegate _reloadQuotaInfo](self, "_reloadQuotaInfo");
    -[ICQPreferencesRemoteUIDelegate _postQuotaDidChangeNotification](self, "_postQuotaDidChangeNotification");
  }
  else
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "buy storage failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (BOOL)_loadNativeURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsString:", CFSTR("prefs")))
  {

  }
  else
  {
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ams-ui"));

    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v3, 0);

  v8 = 1;
LABEL_6:

  return v8;
}

- (void)_presentCloudStorageOffersFlowWithAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  UINavigationController *v10;
  UINavigationController *modalNavigationController;
  void *v12;
  id storageOffersFlowCompletion;
  ICQUICloudStorageOffersManager *storageOffersManager;
  ICQUICloudStorageOffersManager *v15;
  ICQUICloudStorageOffersManager *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
  }

  v9 = objc_alloc_init(MEMORY[0x24BE04DB0]);
  v10 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
  modalNavigationController = self->_modalNavigationController;
  self->_modalNavigationController = v10;

  -[UINavigationController setModalPresentationStyle:](self->_modalNavigationController, "setModalPresentationStyle:", 2);
  -[UINavigationController setModalTransitionStyle:](self->_modalNavigationController, "setModalTransitionStyle:", 0);
  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", self->_modalNavigationController, 1, 0);
  v12 = (void *)objc_msgSend(v7, "copy");

  storageOffersFlowCompletion = self->_storageOffersFlowCompletion;
  self->_storageOffersFlowCompletion = v12;

  storageOffersManager = self->_storageOffersManager;
  if (!storageOffersManager)
  {
    v15 = objc_alloc_init(ICQUICloudStorageOffersManager);
    v16 = self->_storageOffersManager;
    self->_storageOffersManager = v15;

    -[ICQUICloudStorageOffersManager setDelegate:](self->_storageOffersManager, "setDelegate:", self);
    storageOffersManager = self->_storageOffersManager;
  }
  -[ICQUICloudStorageOffersManager setShouldOfferDeviceOffers:](storageOffersManager, "setShouldOfferDeviceOffers:", *MEMORY[0x24BE75828] == (_QWORD)v6);
  -[ICQUICloudStorageOffersManager beginFlowWithNavigationController:modally:](self->_storageOffersManager, "beginFlowWithNavigationController:modally:", self->_modalNavigationController, 0);

}

- (void)_activateBackupsElementForObjectModel:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  ICQUSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to launch backup page", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = CFSTR("backups");
  else
    v9 = CFSTR("currentDeviceBackUp");
  objc_msgSend(v5, "subElementWithID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICQUSLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "found element - activating %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v5, "activateElement:completion:", v10, v6);
  }
  else
  {
    if (v12)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Unable to launch backup page - element is nil", (uint8_t *)&v13, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)_activatePhotosElementForObjectModel:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  ICQUSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to launch photos page", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(v5, "subElementWithID:", CFSTR("photos"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICQUSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "found element - activating %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(v5, "activateElement:completion:", v8, v6);
  }
  else
  {
    if (v10)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Unable to launch photos page - element is nil", (uint8_t *)&v11, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)_freshmintStorageUpgradeWithCompletion:(id)a3 withURL:(id)a4
{
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;

  if (self->_icqAction == 121)
  {
    self->_icqAction = 0;
    v6 = 121;
  }
  else
  {
    v6 = 120;
  }
  v7 = (objc_class *)MEMORY[0x24BEC72E0];
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_msgSend([v7 alloc], "initWithAction:url:", v6, v8);

  -[ICQPreferencesRemoteUIDelegate _freshmintStorageUpgradeWithICQLink:completion:](self, "_freshmintStorageUpgradeWithICQLink:completion:", v10, v9);
}

- (void)_freshmintStorageUpgradeWithICQLink:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint8_t buf[16];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICQUSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Request for Freshmint storage offer", buf, 2u);
  }

  v10 = dispatch_time(0, 10000000000);
  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke;
  block[3] = &unk_24E3F4BD8;
  v26 = &v28;
  block[4] = self;
  v12 = v8;
  v24 = v12;
  v13 = v7;
  v25 = v13;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
  v29[3] = 1;
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_215;
  v18[3] = &unk_24E3F4C28;
  v22 = &v28;
  v18[4] = self;
  v15 = v12;
  v19 = v15;
  v16 = v6;
  v20 = v16;
  v17 = v13;
  v21 = v17;
  objc_msgSend(v14, "getOfferWithCompletion:", v18);

  _Block_object_dispose(&v28, 8);
}

void __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_QWORD *)(v1 + 24) != 2)
  {
    *(_QWORD *)(v1 + 24) = 3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    ICQUSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3 == v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Timeout fetching Freshmint offer; presenting legacy offer",
          buf,
          2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_presentCloudStorageOffersFlowWithAction:completion:", *MEMORY[0x24BE75820], *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Timeout fetching Freshmint offer, but not presenting legacy offer since user navigated away", v7, 2u);
      }

    }
  }
}

void __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_215(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_2;
  v7[3] = &unk_24E3F4C00;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 64);
  v7[4] = v4;
  v7[1] = 3221225472;
  v8 = v5;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __81__ICQPreferencesRemoteUIDelegate__freshmintStorageUpgradeWithICQLink_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v1 = *(_QWORD *)(a1[9] + 8);
  if (*(_QWORD *)(v1 + 24) != 3)
  {
    *(_QWORD *)(v1 + 24) = 2;
    objc_msgSend(*(id *)(a1[4] + 8), "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)a1[5];

    if (v3 == v4)
    {
      objc_msgSend(*(id *)(a1[4] + 208), "setOffer:", a1[6]);
      objc_msgSend(*(id *)(a1[4] + 208), "setDelegate:");
      objc_msgSend(*(id *)(a1[4] + 208), "beginFlowWithICQLink:presenter:completion:", a1[7], a1[5], a1[8]);
    }
    else
    {
      ICQUSLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Freshmint storage offer not presented since user navigated away", v6, 2u);
      }

    }
  }
}

+ (id)afuiSettingsSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIRI_LABEL"), &stru_24E400750, CFSTR("CloudGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v6 = (void *)getAFUICloudStorageViewControllerClass_softClass;
  v14 = getAFUICloudStorageViewControllerClass_softClass;
  if (!getAFUICloudStorageViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getAFUICloudStorageViewControllerClass_block_invoke;
    v10[3] = &unk_24E3F3868;
    v10[4] = &v11;
    __getAFUICloudStorageViewControllerClass_block_invoke((uint64_t)v10);
    v6 = (void *)v12[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, 0, v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)healthSettingsSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH_LABEL"), &stru_24E400750, CFSTR("CloudGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v6 = (void *)getHKHealthManageStorageViewControllerClass_softClass;
  v14 = getHKHealthManageStorageViewControllerClass_softClass;
  if (!getHKHealthManageStorageViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getHKHealthManageStorageViewControllerClass_block_invoke;
    v10[3] = &unk_24E3F3868;
    v10[4] = &v11;
    __getHKHealthManageStorageViewControllerClass_block_invoke((uint64_t)v10);
    v6 = (void *)v12[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, 0, v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)messagesSettingsSpecifier
{
  objc_msgSend(a1, "_loadCKStoragePluginSettingsBundleIfNeeded");
  return (id)-[objc_class specifier](NSClassFromString(CFSTR("CKCloudMessagesDetailController")), "specifier");
}

- (void)_postQuotaDidChangeNotification
{
  NSObject *v2;
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("QuotaDidChange");
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "ICQPreferencesRemoteUIDelegate posting %@ notification.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);

}

- (void)managerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  id storageOffersFlowCompletion;
  uint8_t v7[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did cancel.", v7, 2u);
  }

  if (self->_storageOffersFlowCompletion)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.cloud-storage-offers"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_storageOffersFlowCompletion + 2))();
    storageOffersFlowCompletion = self->_storageOffersFlowCompletion;
    self->_storageOffersFlowCompletion = 0;

  }
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void (**storageOffersFlowCompletion)(id, _BOOL8, id);
  void *v8;
  _BOOL8 v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did complete with error: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  storageOffersFlowCompletion = (void (**)(id, _BOOL8, id))self->_storageOffersFlowCompletion;
  if (storageOffersFlowCompletion)
  {
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Preferences.cloud-storage-offers")))
        v9 = objc_msgSend(v5, "code") == 2;
      else
        v9 = 0;

      storageOffersFlowCompletion = (void (**)(id, _BOOL8, id))self->_storageOffersFlowCompletion;
    }
    else
    {
      v9 = 1;
    }
    storageOffersFlowCompletion[2](storageOffersFlowCompletion, v9, v5);
    v10 = self->_storageOffersFlowCompletion;
    self->_storageOffersFlowCompletion = 0;

  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  ICQUSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Freshmint upgradeFlowManagerDidCancel:", v4, 2u);
  }

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  ICQUSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Freshmint upgradeFlowManagerDidComplete:", v5, 2u);
  }

  -[ICQPreferencesRemoteUIDelegate _reloadQuotaInfo](self, "_reloadQuotaInfo");
  -[ICQPreferencesRemoteUIDelegate _postQuotaDidChangeNotification](self, "_postQuotaDidChangeNotification");
}

+ (void)_loadCKStoragePluginSettingsBundleIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  MEMORY[0x2207C868C](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("System/Library/PreferenceBundles/StoragePlugins"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("CKStoragePlugin.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isLoaded") & 1) == 0)
  {
    ICQUSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "CKStoragePlugin settings bundle not loaded. Loading...", v7, 2u);
    }

    objc_msgSend(v5, "load");
  }

}

- (void)beginLegacyFlow
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = *MEMORY[0x24BE75820];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__ICQPreferencesRemoteUIDelegate_beginLegacyFlow__block_invoke;
  v3[3] = &unk_24E3F35E8;
  v3[4] = self;
  -[ICQPreferencesRemoteUIDelegate _presentCloudStorageOffersFlowWithAction:completion:](self, "_presentCloudStorageOffersFlowWithAction:completion:", v2, v3);
}

uint64_t __49__ICQPreferencesRemoteUIDelegate_beginLegacyFlow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "buyFlowCompletionDidSucceed:error:", a2, a3);
}

- (DelayedPushDelegate)delegate
{
  return (DelayedPushDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)initialAction
{
  return self->_initialAction;
}

- (void)setInitialAction:(id)a3
{
  objc_storeStrong((id *)&self->_initialAction, a3);
}

- (NSArray)dataclassSubstitutions
{
  return self->_dataclassSubstitutions;
}

- (void)setDataclassSubstitutions:(id)a3
{
  objc_storeStrong((id *)&self->_dataclassSubstitutions, a3);
}

- (BOOL)isManageStorage
{
  return self->_isManageStorage;
}

- (void)setIsManageStorage:(BOOL)a3
{
  self->_isManageStorage = a3;
}

- (BOOL)isNativeManageStorage
{
  return self->_isNativeManageStorage;
}

- (void)setIsNativeManageStorage:(BOOL)a3
{
  self->_isNativeManageStorage = a3;
}

- (NSString)nextSignpostId
{
  return self->_nextSignpostId;
}

- (void)setNextSignpostId:(id)a3
{
  objc_storeStrong((id *)&self->_nextSignpostId, a3);
}

- (RUILoader)lastDocumentDeleteLoader
{
  return (RUILoader *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastDocumentDeleteLoader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (ICQPreferencesFreshmintManager)freshmintManager
{
  return self->_freshmintManager;
}

- (void)setFreshmintManager:(id)a3
{
  objc_storeStrong((id *)&self->_freshmintManager, a3);
}

- (ICQUIPreferencesLiftUIDelegate)liftUIDelegate
{
  return self->_liftUIDelegate;
}

- (void)setLiftUIDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_liftUIDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftUIDelegate, 0);
  objc_storeStrong((id *)&self->_freshmintManager, 0);
  objc_storeStrong((id *)&self->_lastDocumentDeleteLoader, 0);
  objc_storeStrong((id *)&self->_nextSignpostId, 0);
  objc_storeStrong((id *)&self->_dataclassSubstitutions, 0);
  objc_storeStrong((id *)&self->_initialAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowManager, 0);
  objc_storeStrong((id *)&self->_recommendationAnalyticsHelper, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong(&self->_linkCompletionBlock, 0);
  objc_storeStrong((id *)&self->_requestContentType, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_deleteQueue, 0);
  objc_storeStrong((id *)&self->_deleteLoaders, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong(&self->_storageOffersFlowCompletion, 0);
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)loadURL:(uint64_t)a3 postBody:(uint64_t)a4 additionalHeaders:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_21F2CC000, a2, a3, "SIGNPOST BEGIN [id: %hu]: iOSManageStorageLoad  enableTelemetry=YES ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)loadURL:(uint64_t)a3 postBody:(uint64_t)a4 additionalHeaders:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_21F2CC000, a2, a3, "SIGNPOST BEGIN [id: %hu]: iOSManageStorageDrilldownLoad  enableTelemetry=YES ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __69__ICQPreferencesRemoteUIDelegate_loadURL_postBody_additionalHeaders___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "Sending ManageStorage displayed event.", v1, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_popObjectModelAnimated:.cold.1()
{
  __assert_rtn("-[ICQPreferencesRemoteUIDelegate _popObjectModelAnimated:]", "ICQPreferencesRemoteUIDelegate.m", 578, "0");
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3(&dword_21F2CC000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) iOSManageStorageLoad ", v2, v3, v4, v5, v6);
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3(&dword_21F2CC000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) iOSManageStorageDrilldownLoad ", v2, v3, v4, v5, v6);
}

void __50__ICQPreferencesRemoteUIDelegate__reloadQuotaInfo__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)a1 + 8), "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_DEBUG, "[_navigationController topViewController]: %@", (uint8_t *)&v4, 0xCu);

}

@end
