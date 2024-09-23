@implementation VSAppSettingsFacade

- (VSAppSettingsFacade)initWithStorage:(id)a3 restrictionsCenter:(id)a4 accountChannelsCenter:(id)a5 appsOperationClass:(Class)a6
{
  id v11;
  id v12;
  id v13;
  VSAppSettingsFacade *v14;
  VSAppSettingsFacade *v15;
  NSOperationQueue *v16;
  NSOperationQueue *privateQueue;
  NSObject *v18;
  id v19;
  id v20;
  uint32_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSArray *knownAppBundles;
  void *v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *appSections;
  _QWORD handler[4];
  id v32;
  id v33;
  id location;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  VSRequireMainThread();
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The storage parameter must not be nil."));
    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The restrictionsCenter parameter must not be nil."));
LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)VSAppSettingsFacade;
  v14 = -[VSAppSettingsFacade init](&v35, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_storage, a3);
    objc_storeStrong((id *)&v15->_restrictionsCenter, a4);
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v15->_privateQueue;
    v15->_privateQueue = v16;

    -[NSOperationQueue setName:](v15->_privateQueue, "setName:", CFSTR("VSAppSettingsFacade"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v15->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    objc_initWeak(&location, v15);
    v18 = MEMORY[0x24BDAC9B8];
    v19 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __99__VSAppSettingsFacade_initWithStorage_restrictionsCenter_accountChannelsCenter_appsOperationClass___block_invoke;
    handler[3] = &unk_24FE1B208;
    objc_copyWeak(&v33, &location);
    v20 = v11;
    v32 = v20;
    v21 = notify_register_dispatch("com.apple.tcc.access.changed", &v15->_registrationToken, v18, handler);

    if (v21)
    {
      VSErrorLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[VSAppSettingsFacade initWithStorage:restrictionsCenter:accountChannelsCenter:appsOperationClass:].cold.1(v22);

    }
    objc_msgSend(v20, "privacyFacade");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "knownAppBundles");
    v24 = objc_claimAutoreleasedReturnValue();
    knownAppBundles = v15->_knownAppBundles;
    v15->_knownAppBundles = (NSArray *)v24;

    objc_storeStrong((id *)&v15->_accountChannelsCenter, a5);
    objc_storeStrong((id *)&v15->_appsOperationClass, a6);
    objc_msgSend(v20, "voucherLockbox");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    VSMainConcurrencyBindingOptions();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAppSettingsFacade vs_bind:toObject:withKeyPath:options:](v15, "vs_bind:toObject:withKeyPath:options:", CFSTR("unredeemedVouchers"), v26, CFSTR("unredeemedVouchers"), v27);

    v28 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    appSections = v15->_appSections;
    v15->_appSections = v28;

    -[VSAppSettingsFacade updateDecidedApps](v15, "updateDecidedApps");
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __99__VSAppSettingsFacade_initWithStorage_restrictionsCenter_accountChannelsCenter_appsOperationClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "TCC access changed notification received.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "privacyFacade");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "knownAppBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setKnownAppBundles:", v5);

}

- (VSAppSettingsFacade)initWithStorage:(id)a3 restrictionsCenter:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  VSAppSettingsFacade *v10;

  v6 = (void *)MEMORY[0x24BDF8B68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VSAppSettingsFacade initWithStorage:restrictionsCenter:accountChannelsCenter:appsOperationClass:](self, "initWithStorage:restrictionsCenter:accountChannelsCenter:appsOperationClass:", v8, v7, v9, objc_opt_class());

  return v10;
}

- (VSAppSettingsFacade)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  if (notify_is_valid_token(self->_registrationToken))
    notify_cancel(self->_registrationToken);
  v3.receiver = self;
  v3.super_class = (Class)VSAppSettingsFacade;
  -[VSAppSettingsFacade dealloc](&v3, sel_dealloc);
}

- (void)updateDecidedApps
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VSAppSettingsViewModel *v10;
  void *v11;
  void *v12;
  void *v13;
  VSAppSettingsViewModel *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[VSAppSettingsFacade appSections](self, "appSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v3, "mutableCopy");

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[VSAppSettingsFacade knownAppBundles](self, "knownAppBundles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = [VSAppSettingsViewModel alloc];
        -[VSAppSettingsFacade restrictionsCenter](self, "restrictionsCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAppSettingsFacade storage](self, "storage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "privacyFacade");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[VSAppSettingsViewModel initWithBundle:restrictionsCenter:privacyFacade:](v10, "initWithBundle:restrictionsCenter:privacyFacade:", v9, v11, v13);

        objc_msgSend(v4, "addObject:", v14);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("displayName"), 1, sel_localizedStandardCompare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingDescriptors:", v16);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v4, CFSTR("decided"));
  -[VSAppSettingsFacade setAppSections:](self, "setAppSections:", v17);

}

- (void)_updateApps
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id from;
  _QWORD v20[7];
  id v21;
  id location;
  _QWORD v23[3];
  char v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  VSRequireMainThread();
  -[VSAppSettingsFacade setNeedsUpdateApps:](self, "setNeedsUpdateApps:", 0);
  -[VSAppSettingsFacade updateDecidedApps](self, "updateDecidedApps");
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__5;
  v27[4] = __Block_byref_object_dispose__5;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__5;
  v25[4] = __Block_byref_object_dispose__5;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDD1478];
  v4 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __34__VSAppSettingsFacade__updateApps__block_invoke;
  v20[3] = &unk_24FE1B230;
  objc_copyWeak(&v21, &location);
  v20[4] = v23;
  v20[5] = v27;
  v20[6] = v25;
  objc_msgSend(v3, "blockOperationWithBlock:", v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsFacade identityProvider](self, "identityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VSAppSettingsFacade identityProvider](self, "identityProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self identityProvider] parameter must not be nil."));
    -[VSAppSettingsFacade identityProvider](self, "identityProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAppSettingsFacade privateQueue](self, "privateQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(-[VSAppSettingsFacade appsOperationClass](self, "appsOperationClass"));
    -[VSAppSettingsFacade accountChannels](self, "accountChannels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithIdentityProvider:accountChannels:", v8, v11);

    objc_initWeak(&from, v12);
    v15 = v4;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    v16 = v8;
    VSMainThreadOperationWithBlock();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDependency:", v13, v15, 3221225472, __34__VSAppSettingsFacade__updateApps__block_invoke_2, &unk_24FE1B258);
    objc_msgSend(v9, "addOperation:", v12);
    objc_msgSend(v9, "addOperation:", v13);
    objc_msgSend(v13, "addDependency:", v12);
    objc_msgSend(v5, "addDependency:", v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);

  }
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v5);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

void __34__VSAppSettingsFacade__updateApps__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(WeakRetained, "appSections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("decided"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("decided"));

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v5 = CFSTR("upgrade");
    else
      v5 = CFSTR("available");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("subscribed"));
    objc_msgSend(WeakRetained, "setAppSections:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("VSAppSettingsFacadeAppsDidChangeNotification"), WeakRetained);

  }
}

void __34__VSAppSettingsFacade__updateApps__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  VSNonChannelAppDecider *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  void *v83;
  void *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "identityProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v64 = v3;
      objc_msgSend(v3, "result");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setHasChannelApps:", objc_msgSend(v5, "hasChannelApps"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "hasUserChannelList");
      objc_msgSend(WeakRetained, "storage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nonChannelApps");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "availableApps");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subscribedApps");
      v9 = objc_claimAutoreleasedReturnValue();
      v63 = v6;
      objc_msgSend(v6, "accountStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = v11;
      objc_msgSend(v11, "preferredAppID");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF8BD8], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringForAMSDeviceFamilies");
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc_init(VSNonChannelAppDecider);
      -[VSNonChannelAppDecider setAppDescriptions:](v15, "setAppDescriptions:", v7);
      v59 = (void *)v12;
      -[VSNonChannelAppDecider setPreferredAppBundleOrAdamID:](v15, "setPreferredAppBundleOrAdamID:", v12);
      v58 = (void *)v14;
      -[VSNonChannelAppDecider setPreferredDeviceFamily:](v15, "setPreferredDeviceFamily:", v14);
      -[VSNonChannelAppDecider decidedNonChannelApps](v15, "decidedNonChannelApps");
      v16 = objc_claimAutoreleasedReturnValue();

      v61 = (void *)v9;
      v62 = (void *)v8;
      v57 = (void *)v16;
      objc_msgSend(WeakRetained, "viewModelsForAvailableAppDescriptions:subscribedAppDescriptions:andNonChannelAppDescriptions:", v8, v9, v16);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "nonChannelAppViewModels");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF8B38], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "hasAccount") & 1) != 0)
      {

      }
      else
      {
        v19 = objc_msgSend(*(id *)(a1 + 32), "isSetTopBoxSupported");

        if (v19)
        {
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v20 = v17;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v79;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v79 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "setForceDSIDlessInstall:", 1);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
            }
            while (v22);
          }

        }
      }
      objc_msgSend(v17, "firstObject", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setMvpdAppSettingsViewModel:", v25);

      v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v65, "availableAppViewModels");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v75 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
            if ((objc_msgSend(v34, "isDecided") & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v34);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
        }
        while (v31);
      }

      v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v35;

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v65, "subscribedAppViewModels");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v71 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
            if ((objc_msgSend(v43, "isDecided") & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v43);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
        }
        while (v40);
      }

      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("displayName"), 1, sel_localizedStandardCompare_);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v84 = v44;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "sortUsingDescriptors:", v46);

      v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v83 = v44;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "sortUsingDescriptors:", v48);

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v49 = v56;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v67;
        do
        {
          for (m = 0; m != v51; ++m)
          {
            if (*(_QWORD *)v67 != v52)
              objc_enumerationMutation(v49);
            v54 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * m);
            if ((objc_msgSend(v54, "isDecided") & 1) == 0)
            {
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
                v55 = *(_QWORD *)(a1 + 56);
              else
                v55 = *(_QWORD *)(a1 + 48);
              objc_msgSend(*(id *)(*(_QWORD *)(v55 + 8) + 40), "insertObject:atIndex:", v54, 0);
            }
          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v51);
      }

    }
    else
    {

    }
  }

}

- (id)viewModelsForAvailableAppDescriptions:(id)a3 subscribedAppDescriptions:(id)a4 andNonChannelAppDescriptions:(id)a5
{
  VSAppSettingsViewModelResult *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  VSAppSettingsFacade *v35;
  void *v36;
  void *v37;
  void *v38;
  VSAppSettingsViewModelResult *v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v41 = a4;
  v40 = a5;
  v8 = objc_alloc_init(VSAppSettingsViewModelResult);
  -[VSAppSettingsFacade restrictionsCenter](self, "restrictionsCenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsFacade storage](self, "storage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "privacyFacade");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsFacade identityProvider](self, "identityProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self identityProvider] parameter must not be nil."));
  v39 = v8;
  -[VSAppSettingsFacade identityProvider](self, "identityProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forceUnwrapObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSAppSettingsFacade unredeemedVouchers](self, "unredeemedVouchers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v20, "providerID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v12);

        if (v22)
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v17);
  }

  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v35 = self;
  -[VSAppSettingsFacade knownAppBundles](self, "knownAppBundles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v29, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend(v23, "setObject:forKey:", v29, v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v26);
  }

  -[VSAppSettingsFacade viewModelsForAppDescriptions:bundleByBundleID:vouchersForProvider:restrictionsCenter:privacyFacade:](v35, "viewModelsForAppDescriptions:bundleByBundleID:vouchersForProvider:restrictionsCenter:privacyFacade:", v40, v23, v14, v38, v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsFacade viewModelsForAppDescriptions:bundleByBundleID:vouchersForProvider:restrictionsCenter:privacyFacade:](v35, "viewModelsForAppDescriptions:bundleByBundleID:vouchersForProvider:restrictionsCenter:privacyFacade:", v42, v23, v14, v38, v36);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsFacade viewModelsForAppDescriptions:bundleByBundleID:vouchersForProvider:restrictionsCenter:privacyFacade:](v35, "viewModelsForAppDescriptions:bundleByBundleID:vouchersForProvider:restrictionsCenter:privacyFacade:", v41, v23, v14, v38, v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppSettingsViewModelResult setNonChannelAppViewModels:](v39, "setNonChannelAppViewModels:", v31);
  -[VSAppSettingsViewModelResult setSubscribedAppViewModels:](v39, "setSubscribedAppViewModels:", v33);
  -[VSAppSettingsViewModelResult setAvailableAppViewModels:](v39, "setAvailableAppViewModels:", v32);

  return v39;
}

- (id)viewModelsForAppDescriptions:(id)a3 bundleByBundleID:(id)a4 vouchersForProvider:(id)a5 restrictionsCenter:(id)a6 privacyFacade:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  VSAppSettingsViewModel *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  VSAppSettingsViewModel *v24;
  id v25;
  uint64_t v26;
  VSAppSettingsViewModel *j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  VSAppSettingsViewModel *v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v41 = a5;
  v45 = a6;
  v13 = a7;
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v14 = v11;
  v47 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v53;
    v39 = v13;
    v40 = v12;
    v38 = v14;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v53 != v46)
          objc_enumerationMutation(v14);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v16, "bundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v12, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = [VSAppSettingsViewModel alloc];
            objc_msgSend(v16, "adamID");
            v20 = i;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringValue");
            v22 = v17;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[VSAppSettingsViewModel initWithBundle:restrictionsCenter:privacyFacade:adamID:](v19, "initWithBundle:restrictionsCenter:privacyFacade:adamID:", v18, v45, v13, v23);

            v17 = v22;
            i = v20;
            objc_msgSend(v44, "addObject:", v24);
            objc_msgSend(v12, "removeObjectForKey:", v22);
          }
          else
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v25 = v41;
            v24 = (VSAppSettingsViewModel *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v24)
            {
              v42 = v17;
              v43 = i;
              v26 = *(_QWORD *)v49;
              while (2)
              {
                for (j = 0; j != v24; j = (VSAppSettingsViewModel *)((char *)j + 1))
                {
                  if (*(_QWORD *)v49 != v26)
                    objc_enumerationMutation(v25);
                  v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v16, "adamID");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "stringValue");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v30)
                  {
                    v31 = v30;
                    objc_msgSend(v28, "appAdamID");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "isEqualToString:", v31);

                    if ((v33 & 1) != 0)
                    {
                      v24 = v28;

                      goto LABEL_21;
                    }

                  }
                }
                v24 = (VSAppSettingsViewModel *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                if (v24)
                  continue;
                break;
              }
LABEL_21:
              v13 = v39;
              v12 = v40;
              v34 = v45;
              v14 = v38;
              v17 = v42;
              i = v43;
            }
            else
            {
              v34 = v45;
            }

            v35 = -[VSAppSettingsViewModel initWithAppDescription:privacyVoucher:restrictionsCenter:privacyFacade:]([VSAppSettingsViewModel alloc], "initWithAppDescription:privacyVoucher:restrictionsCenter:privacyFacade:", v16, v24, v34, v13);
            objc_msgSend(v44, "addObject:", v35);

            v18 = 0;
          }

        }
      }
      v47 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v47);
  }

  v36 = (void *)objc_msgSend(v44, "copy");
  return v36;
}

- (void)_setNeedsUpdateApps
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  VSRequireMainThread();
  if (!-[VSAppSettingsFacade needsUpdateApps](self, "needsUpdateApps"))
  {
    -[VSAppSettingsFacade setNeedsUpdateApps:](self, "setNeedsUpdateApps:", 1);
    objc_initWeak(&location, self);
    -[VSAppSettingsFacade accountChannelsCenter](self, "accountChannelsCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __42__VSAppSettingsFacade__setNeedsUpdateApps__block_invoke;
    v4[3] = &unk_24FE1B060;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "fetchAccountChannelsWithCompletionHandler:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __42__VSAppSettingsFacade__setNeedsUpdateApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__VSAppSettingsFacade__setNeedsUpdateApps__block_invoke_2;
  v5[3] = &unk_24FE19B80;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __42__VSAppSettingsFacade__setNeedsUpdateApps__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setAccountChannels:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_updateApps");
    WeakRetained = v3;
  }

}

- (void)setKnownAppBundles:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *knownAppBundles;
  NSArray *v7;

  v7 = (NSArray *)a3;
  VSRequireMainThread();
  v4 = v7;
  if (self->_knownAppBundles != v7)
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    knownAppBundles = self->_knownAppBundles;
    self->_knownAppBundles = v5;

    -[VSAppSettingsFacade _setNeedsUpdateApps](self, "_setNeedsUpdateApps");
    v4 = v7;
  }

}

- (void)setUnredeemedVouchers:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *unredeemedVouchers;
  NSArray *v7;

  v7 = (NSArray *)a3;
  VSRequireMainThread();
  v4 = v7;
  if (self->_unredeemedVouchers != v7)
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    unredeemedVouchers = self->_unredeemedVouchers;
    self->_unredeemedVouchers = v5;

    -[VSAppSettingsFacade _setNeedsUpdateApps](self, "_setNeedsUpdateApps");
    v4 = v7;
  }

}

- (void)setIdentityProvider:(id)a3
{
  VSIdentityProvider *v5;

  v5 = (VSIdentityProvider *)a3;
  VSRequireMainThread();
  if (self->_identityProvider != v5)
  {
    objc_storeStrong((id *)&self->_identityProvider, a3);
    -[VSAppSettingsFacade _setNeedsUpdateApps](self, "_setNeedsUpdateApps");
  }

}

- (BOOL)shouldShowMVPDAppInstallPromptFromViewController:(id)a3
{
  -[VSAppSettingsFacade setMvpdInstallPromptPresentingViewController:](self, "setMvpdInstallPromptPresentingViewController:", a3);
  return -[VSAppSettingsFacade shouldShowMVPDAppInstallPrompt](self, "shouldShowMVPDAppInstallPrompt");
}

- (BOOL)shouldShowMVPDAppInstallPrompt
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  id v14;

  -[VSAppSettingsFacade mvpdAppSettingsViewModel](self, "mvpdAppSettingsViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VSAppSettingsFacade identityProvider](self, "identityProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSetTopBoxSupported");

    v7 = v4;
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v7, 0, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    v10 = v9;
    v11 = 0;
    if (!v8)
    {
      if (v9)
      {
        VSErrorLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[VSAppSettingsFacade shouldShowMVPDAppInstallPrompt].cold.1((uint64_t)v7, v10, v12);

      }
      v11 = v6;
    }

  }
  else
  {
    -[VSAppSettingsFacade setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:](self, "setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:", 1);
    v11 = 0;
  }

  return v11;
}

- (void)presentMVPDAppInstallPromptFromViewController:(id)a3
{
  id v4;
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
  VSAppSettingsFacade *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v4 = a3;
  -[VSAppSettingsFacade mvpdAppSettingsViewModel](self, "mvpdAppSettingsViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "name");
    v24 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v26 = v4;
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("INSTALL_APP_TITLE_PROMPT_FORMAT"), 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v25, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("INSTALL_APP_TITLE_FORMAT"), 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v23, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INSTALL_APP_MESSAGE_FORMAT"), 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v22, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v21, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE04478], "tvProviderLockupRequestWithAdamID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBFED0], "ascAppInstallerViewControllerWithTitle:subtitle:request:forceDSIDlessInstall:onFlowCompletion:", v20, v13, v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setModalPresentationStyle:", 2);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v16);
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    v4 = v26;
    objc_msgSend(v17, "setModalPresentationStyle:", 2);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __69__VSAppSettingsFacade_presentMVPDAppInstallPromptFromViewController___block_invoke;
    v27[3] = &unk_24FE19778;
    v27[4] = v24;
    objc_msgSend(v26, "presentViewController:animated:completion:", v17, 1, v27);

  }
}

uint64_t __69__VSAppSettingsFacade_presentMVPDAppInstallPromptFromViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMvpdAppSettingsViewModel:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMvpdInstallPromptPresentingViewController:", 0);
}

- (void)setMvpdAppSettingsViewModel:(id)a3
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_mvpdAppSettingsViewModel, a3);
  if (v10)
  {
    if (-[VSAppSettingsFacade needsPresentationOfMVPDAppInstallPromptIfAvailable](self, "needsPresentationOfMVPDAppInstallPromptIfAvailable"))
    {
      -[VSAppSettingsFacade mvpdInstallPromptPresentingViewController](self, "mvpdInstallPromptPresentingViewController");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = -[VSAppSettingsFacade shouldShowMVPDAppInstallPrompt](self, "shouldShowMVPDAppInstallPrompt");

        if (v7)
        {
          -[VSAppSettingsFacade mvpdInstallPromptPresentingViewController](self, "mvpdInstallPromptPresentingViewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self mvpdInstallPromptPresentingViewController] parameter must not be nil."));
          -[VSAppSettingsFacade mvpdInstallPromptPresentingViewController](self, "mvpdInstallPromptPresentingViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSAppSettingsFacade presentMVPDAppInstallPromptFromViewController:](self, "presentMVPDAppInstallPromptFromViewController:", v9);

        }
      }
    }
  }

}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (NSDictionary)appSections
{
  return self->_appSections;
}

- (void)setAppSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasChannelApps
{
  return self->_hasChannelApps;
}

- (void)setHasChannelApps:(BOOL)a3
{
  self->_hasChannelApps = a3;
}

- (VSAccountChannelsCenter)accountChannelsCenter
{
  return self->_accountChannelsCenter;
}

- (void)setAccountChannelsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_accountChannelsCenter, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionsCenter, a3);
}

- (VSAccountChannels)accountChannels
{
  return self->_accountChannels;
}

- (void)setAccountChannels:(id)a3
{
  objc_storeStrong((id *)&self->_accountChannels, a3);
}

- (NSArray)knownAppBundles
{
  return self->_knownAppBundles;
}

- (NSArray)unredeemedVouchers
{
  return self->_unredeemedVouchers;
}

- (BOOL)needsUpdateApps
{
  return self->_needsUpdateApps;
}

- (void)setNeedsUpdateApps:(BOOL)a3
{
  self->_needsUpdateApps = a3;
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (VSAppSettingsViewModel)mvpdAppSettingsViewModel
{
  return self->_mvpdAppSettingsViewModel;
}

- (BOOL)needsPresentationOfMVPDAppInstallPromptIfAvailable
{
  return self->_needsPresentationOfMVPDAppInstallPromptIfAvailable;
}

- (void)setNeedsPresentationOfMVPDAppInstallPromptIfAvailable:(BOOL)a3
{
  self->_needsPresentationOfMVPDAppInstallPromptIfAvailable = a3;
}

- (UIViewController)mvpdInstallPromptPresentingViewController
{
  return self->_mvpdInstallPromptPresentingViewController;
}

- (void)setMvpdInstallPromptPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mvpdInstallPromptPresentingViewController, a3);
}

- (Class)appsOperationClass
{
  return self->_appsOperationClass;
}

- (void)setAppsOperationClass:(Class)a3
{
  objc_storeStrong((id *)&self->_appsOperationClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsOperationClass, 0);
  objc_storeStrong((id *)&self->_mvpdInstallPromptPresentingViewController, 0);
  objc_storeStrong((id *)&self->_mvpdAppSettingsViewModel, 0);
  objc_storeStrong((id *)&self->_unredeemedVouchers, 0);
  objc_storeStrong((id *)&self->_knownAppBundles, 0);
  objc_storeStrong((id *)&self->_accountChannels, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_accountChannelsCenter, 0);
  objc_storeStrong((id *)&self->_appSections, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

- (void)initWithStorage:(os_log_t)log restrictionsCenter:accountChannelsCenter:appsOperationClass:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "Error registering for TCC notification.", v1, 2u);
}

- (void)shouldShowMVPDAppInstallPrompt
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_2303C5000, a3, OS_LOG_TYPE_ERROR, "shouldShowMVPDAppInstallPrompt - Error finding bundle record for bundleID %@ : %@", (uint8_t *)&v6, 0x16u);

}

@end
