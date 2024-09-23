@implementation VSAppSettingsViewModel

- (VSAppSettingsViewModel)initWithApplicationWorkspace:(id)a3
{
  id v5;
  VSAppSettingsViewModel *v6;
  VSAppSettingsViewModel *v7;
  NSString *displayName;
  NSString *bundleID;
  NSString *buyParams;
  VSOptional *v11;
  VSOptional *voucher;
  NSObject *v13;
  id v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VSAppSettingsViewModel;
  v6 = -[VSAppSettingsViewModel init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspace, a3);
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)&stru_24FE1B848;

    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)&stru_24FE1B848;

    buyParams = v7->_buyParams;
    v7->_buyParams = (NSString *)&stru_24FE1B848;

    v11 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    voucher = v7->_voucher;
    v7->_voucher = v11;

    objc_msgSend(v5, "addObserver:", v7);
    objc_initWeak(&location, v7);
    v13 = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC9B8];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __55__VSAppSettingsViewModel_initWithApplicationWorkspace___block_invoke;
    v25[3] = &unk_24FE1A0E0;
    objc_copyWeak(&v26, &location);
    v15 = notify_register_dispatch("com.apple.tcc.access.changed", &v7->_registrationToken, v13, v25);

    if (v15)
    {
      VSErrorLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[VSAppSettingsViewModel initWithApplicationWorkspace:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __55__VSAppSettingsViewModel_initWithApplicationWorkspace___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "TCC access changed notification received.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePrivacyState");

}

- (VSAppSettingsViewModel)init
{
  void *v3;
  VSAppSettingsViewModel *v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VSAppSettingsViewModel initWithApplicationWorkspace:](self, "initWithApplicationWorkspace:", v3);

  return v4;
}

- (VSAppSettingsViewModel)initWithBundle:(id)a3 restrictionsCenter:(id)a4 privacyFacade:(id)a5 adamID:(id)a6
{
  id v11;
  VSAppSettingsViewModel *v12;
  VSAppSettingsViewModel *v13;

  v11 = a6;
  v12 = -[VSAppSettingsViewModel initWithBundle:restrictionsCenter:privacyFacade:](self, "initWithBundle:restrictionsCenter:privacyFacade:", a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_adamID, a6);

  return v13;
}

- (VSAppSettingsViewModel)initWithBundle:(id)a3 restrictionsCenter:(id)a4 privacyFacade:(id)a5
{
  id v9;
  id v10;
  id v11;
  VSAppSettingsViewModel *v12;
  void *v13;
  uint64_t v14;
  UIImage *icon;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  VSAppInstallMetadata *v21;
  void *v22;
  uint64_t v23;
  NSString *artistName;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The bundle parameter must not be nil."));
    if (v10)
    {
LABEL_3:
      if (v11)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The restrictionsCenter parameter must not be nil."));
  if (!v11)
LABEL_4:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The privacyFacade parameter must not be nil."));
LABEL_5:
  v12 = -[VSAppSettingsViewModel init](self, "init");
  if (v12)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    commonInit_0(v12, v10, v11, v13);
    objc_storeStrong((id *)&v12->_bundle, a3);
    v12->_installState = 4;
    v12->_decided = 1;
    VSIconForBundleWithIdentifier(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    icon = v12->_icon;
    v12->_icon = (UIImage *)v14;

    objc_msgSend(v11, "knownAppBundles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v9);

    if (v17)
    {
      v18 = objc_msgSend(v11, "isAccessGrantedForBundleID:", v13);
      v19 = 1;
      if (!v18)
        v19 = 2;
      v12->_privacyState = v19;
    }
    objc_msgSend(MEMORY[0x24BDC1540], "vs_applicationRecordWithBundleIdentifier:", v12->_bundleID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[VSAppInstallMetadata initWithApplicationRecord:]([VSAppInstallMetadata alloc], "initWithApplicationRecord:", v20);
    v12->_installSource = -[VSAppInstallMetadata installSource](v21, "installSource");
    objc_msgSend(v20, "iTunesMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "artistName");
    v23 = objc_claimAutoreleasedReturnValue();
    artistName = v12->_artistName;
    v12->_artistName = (NSString *)v23;

  }
  return v12;
}

- (VSAppSettingsViewModel)initWithAppDescription:(id)a3 privacyVoucher:(id)a4 restrictionsCenter:(id)a5 privacyFacade:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VSAppSettingsViewModel *v15;
  VSAppSettingsViewModel *v16;
  uint64_t v17;
  VSOptional *voucher;
  uint64_t v19;
  UIImage *icon;
  void *v21;
  uint64_t v22;
  NSString *storeName;
  void *v24;
  uint64_t v25;
  NSString *displayName;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *adamID;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  uint64_t v36;
  UIImage *v37;
  uint64_t v38;
  NSBundle *bundle;
  uint64_t v40;
  NSBundle *v41;
  uint64_t v42;
  NSString *buyParams;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The restrictionsCenter parameter must not be nil."));
    if (v14)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The appDescription parameter must not be nil."));
  if (!v13)
    goto LABEL_11;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The privacyFacade parameter must not be nil."));
LABEL_4:
  v15 = -[VSAppSettingsViewModel init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appDescription, a3);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDF8C38]), "initWithObject:", v12);
    voucher = v16->_voucher;
    v16->_voucher = (VSOptional *)v17;

    objc_msgSend(v11, "icon");
    v19 = objc_claimAutoreleasedReturnValue();
    icon = v16->_icon;
    v16->_icon = (UIImage *)v19;

    objc_msgSend(v11, "sellerName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    storeName = v16->_storeName;
    v16->_storeName = (NSString *)v22;

    objc_msgSend(v11, "shortenedDisplayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v25;

    objc_msgSend(v11, "adamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    adamID = v16->_adamID;
    v16->_adamID = (NSString *)v29;

    objc_msgSend(v11, "bundleID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31 && objc_msgSend(v31, "length"))
    {
      v33 = v32;
      commonInit_0(v16, v13, v14, v33);
      -[VSAppSettingsViewModel workspace](v16, "workspace");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "applicationIsInstalled:", v33);

      if (v35)
      {
        VSIconForBundleWithIdentifier(v33);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v16->_icon;
        v16->_icon = (UIImage *)v36;

        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v33);
        v38 = objc_claimAutoreleasedReturnValue();
        bundle = v16->_bundle;
        v16->_bundle = (NSBundle *)v38;
        v40 = 4;
      }
      else
      {
        objc_msgSend(v11, "buyParams");
        v41 = (NSBundle *)objc_claimAutoreleasedReturnValue();
        bundle = v41;
        if (v41 && -[NSBundle length](v41, "length"))
        {
          v42 = -[NSBundle copy](bundle, "copy");
          buyParams = v16->_buyParams;
          v16->_buyParams = (NSString *)v42;

          v40 = 2;
        }
        else
        {
          v40 = 1;
        }
      }

      v16->_installState = v40;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to create an app settings view model from an app description that lacks a bundle identifier."));
    }

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_registrationToken))
    notify_cancel(self->_registrationToken);
  -[LSApplicationWorkspace removeObserver:](self->_workspace, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VSAppSettingsViewModel;
  -[VSAppSettingsViewModel dealloc](&v3, sel_dealloc);
}

- (void)_updatePrivacyState
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  -[VSAppSettingsViewModel privacyFacade](self, "privacyFacade");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsViewModel bundle](self, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v9, "knownAppBundles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    if (v5)
    {
      objc_msgSend(v3, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isAccessGrantedForBundleID:", v6);

      if (v7)
        v8 = 1;
      else
        v8 = 2;
      -[VSAppSettingsViewModel setPrivacyState:](self, "setPrivacyState:", v8);
    }
  }

}

- (NSURL)appStoreURL
{
  void *v2;
  void *v3;

  -[VSAppSettingsViewModel appDescription](self, "appDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appStoreURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)iconURLForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  -[VSAppSettingsViewModel appDescription](self, "appDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconURLForSize:", width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canRevokeVoucher
{
  void *v2;
  void *v3;

  -[VSAppSettingsViewModel voucher](self, "voucher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)revokeVoucher
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[VSAppSettingsViewModel privacyFacade](self, "privacyFacade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voucherLockbox");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[VSAppSettingsViewModel voucher](self, "voucher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "redeemVoucher:", v5);

}

- (void)installApp
{
  void *v3;
  unint64_t v4;
  VSWLKAppInstallationOperation *v5;
  VSWLKAppInstallationOperation *v6;
  void *v7;

  -[VSAppSettingsViewModel buyParams](self, "buyParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to install an app without buy params."));
  v4 = -[VSAppSettingsViewModel installState](self, "installState");
  if (v4 <= 5 && ((0x3Bu >> v4) & 1) != 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], off_24FE1A148[v4]);
  -[VSAppSettingsViewModel setInstallState:](self, "setInstallState:", 3);
  v5 = objc_alloc_init(VSWLKAppInstallationOperation);
  -[VSWLKAppInstallationOperation setInstallable:](v5, "setInstallable:", self);
  -[VSAsyncOperation start](v5, "start");
  v6 = v5;
  VSMainThreadOperationWithBlock();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDependency:", v6);
  VSEnqueueCompletionOperation();

}

void __36__VSAppSettingsViewModel_installApp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 40), "setInstallState:", *(_QWORD *)(a1 + 48));
}

- (void)launchApp
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Failed to open application.", a5, a6, a7, a8, 0);
}

- (BOOL)canChangePrivacyAccess
{
  void *v3;
  void *v4;
  BOOL v5;

  -[VSAppSettingsViewModel restrictionsCenter](self, "restrictionsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAcountModificationAllowed"))
  {
    -[VSAppSettingsViewModel bundle](self, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingAccessGranted
{
  if (keyPathsForValuesAffectingAccessGranted___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingAccessGranted___vs_lazy_init_predicate, &__block_literal_global_7);
  return (id)keyPathsForValuesAffectingAccessGranted___vs_lazy_init_variable;
}

void __65__VSAppSettingsViewModel_keyPathsForValuesAffectingAccessGranted__block_invoke()
{
  uint64_t v0;
  void *v1;

  __65__VSAppSettingsViewModel_keyPathsForValuesAffectingAccessGranted__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingAccessGranted___vs_lazy_init_variable;
  keyPathsForValuesAffectingAccessGranted___vs_lazy_init_variable = v0;

}

id __65__VSAppSettingsViewModel_keyPathsForValuesAffectingAccessGranted__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v0, "addObject:", CFSTR("privacyState"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (BOOL)isAccessGranted
{
  return -[VSAppSettingsViewModel privacyState](self, "privacyState") == 1;
}

- (void)setAccessGranted:(BOOL)a3
{
  if (a3)
    -[VSAppSettingsViewModel _grantPrivacyAccess](self, "_grantPrivacyAccess");
  else
    -[VSAppSettingsViewModel _denyPrivacyAccess](self, "_denyPrivacyAccess");
}

- (void)_grantPrivacyAccess
{
  int64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[VSAppSettingsViewModel installState](self, "installState");
  v4 = (_QWORD *)MEMORY[0x24BDBCAB8];
  if (v3 != 4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to grant privacy access to an app that is not installed."));
  if (-[VSAppSettingsViewModel privacyState](self, "privacyState") != 2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("Attempt to grant access to an app that had not been previously denied access."));
  if (!-[VSAppSettingsViewModel canChangePrivacyAccess](self, "canChangePrivacyAccess"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("Attempt to grant access to an app when access cannot be changed."));
  -[VSAppSettingsViewModel privacyFacade](self, "privacyFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsViewModel bundle](self, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessGranted:forBundleID:", 1, v7);

  -[VSAppSettingsViewModel setPrivacyState:](self, "setPrivacyState:", 1);
}

- (void)_denyPrivacyAccess
{
  int64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[VSAppSettingsViewModel installState](self, "installState");
  v4 = (_QWORD *)MEMORY[0x24BDBCAB8];
  if (v3 != 4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to deny privacy access to an app that is not installed."));
  if (-[VSAppSettingsViewModel privacyState](self, "privacyState") != 1)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("Attempt to deny access to an app that had not been previously granted access."));
  if (!-[VSAppSettingsViewModel canChangePrivacyAccess](self, "canChangePrivacyAccess"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("Attempt to deny access to an app when access cannot be changed."));
  -[VSAppSettingsViewModel privacyFacade](self, "privacyFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsViewModel bundle](self, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessGranted:forBundleID:", 0, v7);

  -[VSAppSettingsViewModel setPrivacyState:](self, "setPrivacyState:", 2);
}

- (void)applicationsWillInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsViewModel bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
          VSPerformBlockOnMainThread();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __50__VSAppSettingsViewModel_applicationsWillInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 3);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "bundleIdentifier", v12, v13, v14, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsViewModel bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          v12 = MEMORY[0x24BDAC760];
          v13 = 3221225472;
          v14 = __49__VSAppSettingsViewModel_applicationsDidInstall___block_invoke;
          v15 = &unk_24FE19E30;
          v16 = v9;
          VSPerformBlockOnMainThread();

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

void __49__VSAppSettingsViewModel_applicationsDidInstall___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setBundle:", v3);
  VSIconForBundleWithIdentifier(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIcon:", v2);
  setDisplayNameIfAvailable(*(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setInstallState:", 4);

}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsViewModel bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
          VSPerformBlockOnMainThread();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __55__VSAppSettingsViewModel_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 2);
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsViewModel bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
          VSPerformBlockOnMainThread();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __52__VSAppSettingsViewModel_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 5);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsViewModel bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
          VSPerformBlockOnMainThread();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __51__VSAppSettingsViewModel_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setBundle:", 0);
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsViewModel bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
          VSPerformBlockOnMainThread();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __57__VSAppSettingsViewModel_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 4);
}

- (NSString)description
{
  id v3;
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
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[VSAppSettingsViewModel adamID](self, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("adamID"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[VSAppSettingsViewModel bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("bundleID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[VSAppSettingsViewModel displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("displayName"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[VSAppSettingsViewModel voucher](self, "voucher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("voucher"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  v21.receiver = self;
  v21.super_class = (Class)VSAppSettingsViewModel;
  -[VSAppSettingsViewModel description](&v21, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %@>"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (id)appBundleIDs
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[VSAppSettingsViewModel bundleID](self, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appAdamIDs
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[VSAppSettingsViewModel adamID](self, "adamID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)forceDSIDlessInstall
{
  return self->_forceDSIDlessInstall;
}

- (void)setForceDSIDlessInstall:(BOOL)a3
{
  self->_forceDSIDlessInstall = a3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)storeName
{
  return self->_storeName;
}

- (int64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(int64_t)a3
{
  self->_installState = a3;
}

- (int64_t)privacyState
{
  return self->_privacyState;
}

- (void)setPrivacyState:(int64_t)a3
{
  self->_privacyState = a3;
}

- (VSOptional)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (BOOL)isDecided
{
  return self->_decided;
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void)setPrivacyFacade:(id)a3
{
  objc_storeStrong((id *)&self->_privacyFacade, a3);
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_workspace, a3);
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionsCenter, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (VSAppDescription)appDescription
{
  return self->_appDescription;
}

- (void)setAppDescription:(id)a3
{
  objc_storeStrong((id *)&self->_appDescription, a3);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)installSource
{
  return self->_installSource;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_artistName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_appDescription, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_privacyFacade, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

- (void)initWithApplicationWorkspace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Error registering for TCC notification.", a5, a6, a7, a8, 0);
}

@end
