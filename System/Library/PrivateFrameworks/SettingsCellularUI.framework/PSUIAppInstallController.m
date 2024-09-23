@implementation PSUIAppInstallController

- (PSUIAppInstallController)initWithAppID:(id)a3 carrierMoreAppsURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSURL *v14;
  void *moreAppsURL;
  NSURL *v16;
  NSURL *v17;
  PSUIAppInstallController *v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)&self->_appID, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("http")))
  {
    v14 = v12;
    moreAppsURL = self->_moreAppsURL;
    self->_moreAppsURL = v14;
  }
  else
  {
    objc_msgSend(v12, "scheme");
    moreAppsURL = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(moreAppsURL, "isEqualToString:", CFSTR("https")))
      v16 = v12;
    else
      v16 = 0;
    v17 = self->_moreAppsURL;
    self->_moreAppsURL = v16;

  }
  v18 = -[PSUIAppInstallController initWithBundleID:](self, "initWithBundleID:", v11);

  return v18;
}

- (PSUIAppInstallController)initWithBundleIDAndOpenAppURL:(id)a3 openAppURL:(id)a4
{
  id v6;
  NSURL *v7;
  NSURL *openAppURL;
  PSUIAppInstallController *v9;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    openAppURL = self->_openAppURL;
    self->_openAppURL = v7;

  }
  v9 = -[PSUIAppInstallController initWithBundleID:](self, "initWithBundleID:", v6);

  return v9;
}

- (PSUIAppInstallController)initWithBundleID:(id)a3
{
  id v5;
  PSUIAppInstallController *v6;
  PSUIAppInstallController *v7;
  void *v8;
  uint64_t v9;
  NSURLSession *session;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSUIAppInstallController;
  v6 = -[PSUIAppInstallController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v7->_overrideLocalAppDescription = 1;
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeoutIntervalForRequest:", 4.0);
    objc_msgSend(v8, "setTimeoutIntervalForResource:", 4.0);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    session = v7->_session;
    v7->_session = (NSURLSession *)v9;

  }
  return v7;
}

- (void)setOverrideLocalAppDescription:(BOOL)a3
{
  PSUIAppInstallController *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_overrideLocalAppDescription = a3;
  objc_sync_exit(obj);

}

- (void)load
{
  NSString *v3;
  void *v4;
  PSUIAppInstallController *v5;
  id *p_appDescription;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[8];

  v3 = self->_bundleID;
  objc_msgSend((id)objc_opt_class(), "lookupAppDescriptionForInstalledApp:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  p_appDescription = (id *)&v5->_appDescription;
  if (v5->_appDescription && v5->_installState == (v4 != 0))
  {
LABEL_7:
    objc_sync_exit(v5);

    goto LABEL_11;
  }
  objc_sync_exit(v5);

  if (v4)
  {
    v5 = v5;
    objc_sync_enter(v5);
    if (v5->_overrideLocalAppDescription)
      objc_storeStrong(p_appDescription, v4);
    v5->_installState = 1;
    goto LABEL_7;
  }
  -[PSUIAppInstallController getLogger](v5, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Attempt to load from app store", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v5);
  v8 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__PSUIAppInstallController_load__block_invoke;
  v9[3] = &unk_24D501BD0;
  v9[4] = v5;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v8, "lookupAppFromStore:completionHandler:", v3, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
LABEL_11:

}

void __32__PSUIAppInstallController_load__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  v15 = a2;
  if (v15)
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v15, "iconURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadIconFromURL:session:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIcon:", v6);

    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
    objc_msgSend(v15, "installURL");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

    objc_msgSend((id)objc_opt_class(), "saveAppDescriptionToCache:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_sync_exit(v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "loadingCompletionBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "loadingCompletionBlock");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, BOOL))v14)[2](v14, v15 != 0);

    }
  }

}

+ (id)lookupAppDescriptionForInstalledApp:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  PSUIAppDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[PSUIAppInstallController lookupAppDescriptionForInstalledApp:]";
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s requesting launch services bundle enumeration for %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __64__PSUIAppInstallController_lookupAppDescriptionForInstalledApp___block_invoke;
  v16 = &unk_24D501BF8;
  v6 = v3;
  v17 = v6;
  v18 = &v19;
  objc_msgSend(v5, "enumerateBundlesOfType:block:", 1, &v13);

  if (v20[5])
  {
    v7 = objc_alloc_init(PSUIAppDescription);
    objc_msgSend((id)v20[5], "localizedNameForContext:", 0, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setName:](v7, "setName:", v8);

    objc_msgSend((id)v20[5], "vendorName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setPublisher:](v7, "setPublisher:", v9);

    -[PSUIAppDescription setBundleID:](v7, "setBundleID:", v6);
    v10 = (void *)MEMORY[0x24BEBD640];
    ScreenScale();
    objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setIcon:](v7, "setIcon:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"), v13, v14, v15, v16);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[PSUIAppInstallController lookupAppDescriptionForInstalledApp:]";
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "%s failed to retrieve bundle enumeration for %@", buf, 0x16u);
    }
    v7 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v7;
}

void __64__PSUIAppInstallController_lookupAppDescriptionForInstalledApp___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 136315394;
        v11 = "+[PSUIAppInstallController lookupAppDescriptionForInstalledApp:]_block_invoke";
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s successfully retrieved bundle enumeration for %@", (uint8_t *)&v10, 0x16u);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }

  }
}

+ (void)lookupAppFromStore:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(MEMORY[0x24BE08238], "bagSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08238], "bagSubProfileVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bagForProfile:profileVersion:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08238]), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.telephony.CellularSettings"), CFSTR("1"), v10);
  v24[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBundleIdentifiers:", v12);

  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "+[PSUIAppInstallController lookupAppFromStore:completionHandler:]";
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "%s requesting store info for %@", buf, 0x16u);
  }

  objc_msgSend(v11, "perform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__PSUIAppInstallController_lookupAppFromStore_completionHandler___block_invoke;
  v17[3] = &unk_24D501C20;
  v18 = v5;
  v19 = v6;
  v15 = v6;
  v16 = v5;
  objc_msgSend(v14, "addFinishBlock:", v17);

}

void __65__PSUIAppInstallController_lookupAppFromStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  PSUIAppDescription *v9;
  void *v10;
  PSUIAppDescription *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v14 = 136315650;
      v15 = "+[PSUIAppInstallController lookupAppFromStore:completionHandler:]_block_invoke";
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s failed to retrieve store info for %@ (error = %@)", (uint8_t *)&v14, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "responseDataItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = [PSUIAppDescription alloc];
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PSUIAppDescription initWithAMSMediaResponseDictionary:](v9, "initWithAMSMediaResponseDictionary:", v10);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 136315394;
        v15 = "+[PSUIAppInstallController lookupAppFromStore:completionHandler:]_block_invoke";
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s failed to retrieve store info for %@ (No error, but no items returned.)", (uint8_t *)&v14, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

+ (id)loadIconFromURL:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:cachePolicy:timeoutInterval:", v5, 2, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__PSUIAppInstallController_loadIconFromURL_session___block_invoke;
  v15[3] = &unk_24D501C48;
  v9 = v5;
  v16 = v9;
  v18 = &v19;
  v10 = v7;
  v17 = v10;
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v8, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[PSUIAppInstallController loadIconFromURL:session:]";
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s requesting app icon from %@", buf, 0x16u);
  }

  objc_msgSend(v11, "resume");
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __52__PSUIAppInstallController_loadIconFromURL_session___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6 || v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 136315650;
      v18 = "+[PSUIAppInstallController loadIconFromURL:session:]_block_invoke";
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "%s failed to retrieve app icon from %@ (error = %@)", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "+[PSUIAppInstallController loadIconFromURL:session:]_block_invoke";
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "%s successfully retrieved app icon from %@", (uint8_t *)&v17, 0x16u);
    }

    v11 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject scale](v9, "scale");
    objc_msgSend(v11, "imageWithData:scale:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_applicationIconImageForFormat:precomposed:", 2, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)iconLocalCacheURLFromKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CarrierAppIcon-%@"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)saveAppDescriptionToCache:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
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
  UIImage *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  if (v4 && (objc_msgSend(v4, "bundleID"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_AppDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject dictionaryForKey:](v7, "dictionaryForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("AppIconFilenameKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_opt_class();
        -[NSObject stringForKey:](v7, "stringForKey:", CFSTR("AppIconFilenameKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "iconLocalCacheURLFromKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeItemAtURL:error:", v16, 0);

      }
    }
    objc_msgSend((id)objc_opt_class(), "iconLocalCacheURLFromKey:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v19 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "writeToURL:atomically:", v18, 1);

    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("AppNameKey"));

    }
    objc_msgSend(v4, "publisher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "publisher");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("AppPublisherKey"));

    }
    objc_msgSend(v4, "bundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "bundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("AppBundleIDKey"));

    }
    if (v12)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, CFSTR("AppIconFilenameKey"));
    objc_msgSend(v4, "subtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "subtitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("AppSubtitleKey"));

    }
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v21, v9);
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315906;
      v32 = "+[PSUIAppInstallController saveAppDescriptionToCache:]";
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v21;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_2161C6000, v30, OS_LOG_TYPE_DEFAULT, "%s writing to cache, %@: %@, icon filename: %@", (uint8_t *)&v31, 0x2Au);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Null description!!", (uint8_t *)&v31, 2u);
    }
  }

  objc_sync_exit(v5);
}

+ (id)tryLoadAppDescriptionFromCacheForBundleId:(id)a3
{
  PSUIAppDescription *v4;
  id v5;
  void *v6;
  void *v7;
  PSUIAppDescription *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PSUIAppDescription *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  PSUIAppDescription *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (PSUIAppDescription *)a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppDescription stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("_AppDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(PSUIAppDescription);
    objc_msgSend(v7, "objectForKey:", CFSTR("AppNameKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setName:](v8, "setName:", v9);

    objc_msgSend(v7, "objectForKey:", CFSTR("AppPublisherKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setPublisher:](v8, "setPublisher:", v10);

    objc_msgSend(v7, "objectForKey:", CFSTR("AppBundleIDKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setBundleID:](v8, "setBundleID:", v11);

    objc_msgSend(v7, "objectForKey:", CFSTR("AppIconFilenameKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)objc_opt_class(), "iconLocalCacheURLFromKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v30 = "+[PSUIAppInstallController tryLoadAppDescriptionFromCacheForBundleId:]";
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "%s reading from cache, app description: %@, icon filename: %@", buf, 0x20u);

      }
      v16 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend((id)objc_opt_class(), "iconLocalCacheURLFromKey:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithContentsOfFile:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_applicationIconImageForFormat:precomposed:", 2, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIAppDescription setIcon:](v8, "setIcon:", v20);

      objc_msgSend(v7, "objectForKey:", CFSTR("AppSubtitleKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIAppDescription setSubtitle:](v8, "setSubtitle:", v21);

      -[PSUIAppDescription name](v8, "name");
      v22 = (PSUIAppDescription *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_16;
      -[PSUIAppDescription publisher](v8, "publisher");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[PSUIAppDescription bundleID](v8, "bundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[PSUIAppDescription icon](v8, "icon");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25 == 0;

          if (!v26)
          {
            v22 = v8;
LABEL_16:

            goto LABEL_17;
          }
        }
        else
        {

        }
      }
      else
      {

      }
    }
    v22 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
  v8 = (PSUIAppDescription *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "+[PSUIAppInstallController tryLoadAppDescriptionFromCacheForBundleId:]";
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_2161C6000, &v8->super, OS_LOG_TYPE_DEFAULT, "%s could not find info from cache for bundleid: %@", buf, 0x16u);
  }
  v22 = 0;
LABEL_17:

  objc_sync_exit(v5);
  return v22;
}

- (void)installButtonTapped:(id)a3
{
  id v4;
  PSUIAppInstallController *v5;
  int installState;
  PSUIAppDescription *v7;
  NSURL *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSURL *openAppURL;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t buf[16];
  uint64_t v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  installState = v5->_installState;
  v7 = v5->_appDescription;
  v8 = v5->_installURL;
  objc_sync_exit(v5);

  v9 = installState == 1;
  -[PSUIAppInstallController getLogger](v5, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[PSUIAppInstallController installButtonTapped:]";
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s Open button pressed", buf, 0xCu);
    }

    PSAnalyticsSendEvent(CFSTR("com.apple.Preferences.CarrierSpaceServicesAppOpenEvent"));
    -[PSUIAppDescription bundleID](v7, "bundleID");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!qword_253E97010)
    {
      *(_OWORD *)buf = xmmword_24D501C80;
      v23 = 0;
      qword_253E97010 = _sl_dlopen();
    }
    if (!qword_253E97010)
    {
      -[PSUIAppInstallController getLogger](v5, "getLogger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2161C6000, v19, OS_LOG_TYPE_ERROR, "MobileStoreUI Framework unavailable. Not sending app launch metric.", buf, 2u);
      }

      goto LABEL_24;
    }
    if (v5->_openAppURL)
    {
      -[PSUIAppInstallController getLogger](v5, "getLogger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[NSURL absoluteString](v5->_openAppURL, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Launch app with URL: %@", buf, 0xCu);

      }
      openAppURL = v5->_openAppURL;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      v23 = 0x2020000000;
      v16 = off_253E97020;
      v24 = off_253E97020;
      if (!off_253E97020)
      {
        v17 = (void *)MobileStoreUILibrary();
        v16 = dlsym(v17, "SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v16;
        off_253E97020 = v16;
      }
      _Block_object_dispose(buf, 8);
      if (v16)
      {
        ((void (*)(id, NSURL *, _QWORD, _QWORD, _QWORD))v16)(v12, openAppURL, 0, 0, 0);
LABEL_24:
        CFRelease(v12);
        goto LABEL_25;
      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      v23 = 0x2020000000;
      v20 = off_253E97018;
      v24 = off_253E97018;
      if (!off_253E97018)
      {
        v21 = (void *)MobileStoreUILibrary();
        v20 = dlsym(v21, "SUUIMetricsLaunchApplicationWithIdentifier");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v20;
        off_253E97018 = v20;
      }
      _Block_object_dispose(buf, 8);
      if (v20)
      {
        ((void (*)(id, _QWORD))v20)(v12, 0);
        goto LABEL_24;
      }
    }
    dlerror();
    abort_report_np();
    __break(1u);
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PSUIAppInstallController installButtonTapped:]";
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s Install button pressed", buf, 0xCu);
  }

  PSAnalyticsSendEvent(CFSTR("com.apple.Preferences.CarrierSpaceServicesAppInstallEvent"));
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "openURL:options:completionHandler:", v8, MEMORY[0x24BDBD1B8], 0);

LABEL_25:
}

- (BOOL)moreAppsAvailable
{
  return self->_moreAppsURL != 0;
}

- (void)moreAppsButtonTapped:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", self->_moreAppsURL, MEMORY[0x24BDBD1B8], 0);

}

- (id)specifierWithDescriptionParameters:(id)a3 completion:(id)a4
{
  id v6;
  PSUIAppDescription *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSString *v12;
  NSObject *v13;
  PSUIAppDescription *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  PSUIAppDescription *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PSUIAppInstallController setLoadingCompletionBlock:](self, "setLoadingCompletionBlock:", a4);
  -[PSUIAppInstallController load](self, "load");
  v7 = self->_appDescription;
  if (v7)
  {
    if (!v6)
    {
LABEL_23:
      -[PSUIAppDescription setInstalled:](v7, "setInstalled:", self->_installState == 1);
      +[PSUIAppInstallCell specifierForAppWithDescription:target:action:](PSUIAppInstallCell, "specifierForAppWithDescription:target:action:", v7, self, sel_installButtonTapped_);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_3:
    -[PSUIAppInstallController getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Update description with override text", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v6, "publisher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", &stru_24D5028C8);

    if (v10)
    {
      -[PSUIAppInstallController loadTextForPublisher:](self, "loadTextForPublisher:", v7);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "publisher");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_21;
      objc_msgSend(v6, "publisher");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v11;
    -[PSUIAppDescription setPublisher:](v7, "setPublisher:", v11);

LABEL_21:
    objc_msgSend(v6, "installedLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v6, "installedLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIAppDescription setInstalledLabel:](v7, "setInstalledLabel:", v23);

    }
    goto LABEL_23;
  }
  v12 = self->_bundleID;
  -[PSUIAppInstallController getLogger](self, "getLogger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "App description not yet loaded from app store, attempt to load from cache.", (uint8_t *)&v25, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "tryLoadAppDescriptionFromCacheForBundleId:", v12);
  v14 = (PSUIAppDescription *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v14)
  {
    -[PSUIAppDescription bundleID](v14, "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", self->_bundleID);

    if (v16)
    {
      -[PSUIAppInstallController getLogger](self, "getLogger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v7;
        _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "App description found in cache; using cached description: %@",
          (uint8_t *)&v25,
          0xCu);
      }

      if (!v6)
        goto LABEL_23;
      goto LABEL_3;
    }
  }
  -[PSUIAppInstallController getLogger](self, "getLogger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find app description in cache.", (uint8_t *)&v25, 2u);
  }

  v19 = 0;
LABEL_24:

  return v19;
}

- (id)loadTextForPublisher:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallController tryLoadSubTitleForBundleId:](self, "tryLoadSubTitleForBundleId:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v4, "publisher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)tryLoadSubTitleForBundleId:(id)a3
{
  id v4;
  PSUIAppInstallController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("_AppDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("AppSubtitleKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallController"));
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)installState
{
  return self->_installState;
}

- (PSUIAppDescription)appDescription
{
  return (PSUIAppDescription *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURL)installURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInstallURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURL)openAppURL
{
  return self->_openAppURL;
}

- (void)setOpenAppURL:(id)a3
{
  objc_storeStrong((id *)&self->_openAppURL, a3);
}

- (NSURL)moreAppsURL
{
  return self->_moreAppsURL;
}

- (void)setMoreAppsURL:(id)a3
{
  objc_storeStrong((id *)&self->_moreAppsURL, a3);
}

- (BOOL)overrideLocalAppDescription
{
  return self->_overrideLocalAppDescription;
}

- (id)loadingCompletionBlock
{
  return self->_loadingCompletionBlock;
}

- (void)setLoadingCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_moreAppsURL, 0);
  objc_storeStrong((id *)&self->_openAppURL, 0);
  objc_storeStrong((id *)&self->_installURL, 0);
  objc_storeStrong((id *)&self->_appDescription, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
