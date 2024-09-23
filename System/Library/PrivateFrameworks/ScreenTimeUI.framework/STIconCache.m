@implementation STIconCache

+ (STIconCache)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_1);
  return (STIconCache *)(id)sharedCache_sharedCache;
}

void __26__STIconCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = v0;

}

- (STIconCache)init
{
  STIconCache *v2;
  uint64_t v3;
  NSCache *iconByKeyCache;
  uint64_t v5;
  NSMutableSet *bundleIdentifiersWithPendingRequests;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *lookupQueue;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSURLSession *urlSession;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)STIconCache;
  v2 = -[STIconCache init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    iconByKeyCache = v2->_iconByKeyCache;
    v2->_iconByKeyCache = (NSCache *)v3;

    -[NSCache setName:](v2->_iconByKeyCache, "setName:", CFSTR("com.apple.screentime.icon-cache"));
    v5 = objc_opt_new();
    bundleIdentifiersWithPendingRequests = v2->_bundleIdentifiersWithPendingRequests;
    v2->_bundleIdentifiersWithPendingRequests = (NSMutableSet *)v5;

    v7 = (const char *)objc_msgSend(CFSTR("com.apple.screentime.icon-cache"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v7, v9);
    lookupQueue = v2->_lookupQueue;
    v2->_lookupQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1800], "sharedURLCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setURLCache:", v13);

    objc_msgSend(v12, "setRequestCachePolicy:", 2);
    objc_msgSend(v12, "setHTTPShouldUsePipelining:", 1);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setName:", CFSTR("com.apple.screentime.icon-cache"));
    objc_msgSend(v14, "setUnderlyingQueue:", v2->_lookupQueue);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v12, 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v15;

    objc_msgSend(v14, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSession setSessionDescription:](v2->_urlSession, "setSessionDescription:", v17);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)STIconCache;
  -[STIconCache dealloc](&v3, sel_dealloc);
}

- (UIImage)imageForBlankApplicationIcon
{
  void *v3;

  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", CFSTR("blank-app-icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "blankIcon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v3, CFSTR("blank-app-icon"), 0);
  }
  return (UIImage *)v3;
}

- (void)imageForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  void (**v32)(id, void *);
  id v33;
  _QWORD block[4];
  id v35;
  void (**v36)(id, void *);
  id v37;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bundle-id.%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appInfoForBundleIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "platform");
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.compass")))
      goto LABEL_9;
    if (objc_msgSend(v12, "source") == 2)
    {
      v14 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v12, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iconWithAppBundleID:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[STIconCache imageForBundleIdentifier:completionHandler:].cold.1();
LABEL_25:

        -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_10:
      -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v10, v8, 10);
      v7[2](v7, v10);
LABEL_11:

      goto LABEL_12;
    }
    if (objc_msgSend(v12, "source") == 1)
    {
LABEL_9:
      v17 = (void *)MEMORY[0x24BDF6AC8];
      +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageNamed:inBundle:", v6, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "iconFromPrecomposedImage:platform:", 0, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    if (objc_msgSend(v12, "source") == 3)
    {
      objc_msgSend(v12, "artworkURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[STIconCache imageForBundleIdentifier:completionHandler:].cold.2();
        goto LABEL_25;
      }
      objc_initWeak(&location, self);
      -[STIconCache lookupQueue](self, "lookupQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke;
      block[3] = &unk_24CED40A0;
      objc_copyWeak(&v37, &location);
      v35 = v12;
      v36 = v7;
      dispatch_async(v21, block);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
LABEL_22:
      v10 = 0;
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "source") != 4)
      goto LABEL_22;
    objc_msgSend(v12, "artworkData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "_initWithData:preserveScale:", v22, 1);
      objc_msgSend(v23, "iconFromPrecomposedImage:platform:", 0, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_32:
        -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v10, v8, 10);
        v7[2](v7, v10);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[STIconCache imageForBundleIdentifier:completionHandler:].cold.4();

    }
    else
    {
      objc_msgSend(v12, "artworkURL");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        v27 = _os_feature_enabled_impl();

        if (v27)
        {
          objc_initWeak(&location, self);
          -[STIconCache lookupQueue](self, "lookupQueue");
          v28 = objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke_47;
          v30[3] = &unk_24CED40A0;
          objc_copyWeak(&v33, &location);
          v31 = v12;
          v32 = v7;
          dispatch_async(v28, v30);

          objc_destroyWeak(&v33);
          objc_destroyWeak(&location);
        }
      }
    }
    objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[STIconCache imageForBundleIdentifier:completionHandler:].cold.3();

    -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v10 = (void *)v9;
  v7[2](v7, (void *)v9);
LABEL_12:

}

void __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_fetchImageForAppInfoIfNeeded:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __58__STIconCache_imageForBundleIdentifier_completionHandler___block_invoke_47(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_fetchImageForAppInfoIfNeeded:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_fetchImageForAppInfoIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  -[STIconCache lookupQueue](self, "lookupQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "artworkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[STIconCache urlSession](self, "urlSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __63__STIconCache__fetchImageForAppInfoIfNeeded_completionHandler___block_invoke;
  v17 = &unk_24CED40C8;
  objc_copyWeak(&v20, &location);
  v11 = v6;
  v18 = v11;
  v12 = v7;
  v19 = v12;
  objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v9, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "resume", v14, v15, v16, v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __63__STIconCache__fetchImageForAppInfoIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleiTunesResponseForAppInfo:response:data:error:completionHandler:", *(_QWORD *)(a1 + 32), v9, v10, v8, *(_QWORD *)(a1 + 40));

}

- (void)_handleiTunesResponseForAppInfo:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[STIconCache lookupQueue](self, "lookupQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  objc_msgSend(v11, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bundle-id.%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || v13)
  {
    objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:].cold.1();

    -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v22, v17, 10);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke;
    block[3] = &unk_24CED40F0;
    v35 = v14;
    v23 = v22;
    v34 = v23;
    v24 = v14;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v12);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "iconFromPrecomposedImage:platform:", 0, objc_msgSend(v11, "platform"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:].cold.2();

      -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v20, v17, 15);
    objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v16;
      _os_log_impl(&dword_212E1A000, v26, OS_LOG_TYPE_INFO, "Added an icon for %@ to the cache", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke_49;
    v28[3] = &unk_24CED4118;
    v31 = v14;
    v23 = v20;
    v29 = v23;
    v27 = v14;
    objc_copyWeak(&v32, (id *)buf);
    v30 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

}

uint64_t __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__STIconCache__handleiTunesResponseForAppInfo_response_data_error_completionHandler___block_invoke_49(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateCacheWithImage:bundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)imageForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bundle-id.%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appInfoForBundleIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "platform");
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.compass")))
      goto LABEL_11;
    if (objc_msgSend(v8, "source") == 2)
    {
      v10 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v8, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "iconWithAppBundleID:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[STIconCache imageForBundleIdentifier:completionHandler:].cold.1();

        -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "source") == 1)
    {
LABEL_11:
      v13 = (void *)MEMORY[0x24BDF6AC8];
      +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageNamed:inBundle:", v4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "iconFromPrecomposedImage:platform:", 0, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v6, v5, 10);
LABEL_13:

      goto LABEL_14;
    }
    if (objc_msgSend(v8, "source") == 3)
    {
      objc_msgSend(v8, "artworkURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[STIconCache imageForBundleIdentifier:completionHandler:].cold.2();

        -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_os_feature_enabled_impl() & 1) != 0)
          goto LABEL_13;
        goto LABEL_12;
      }
      objc_initWeak(&location, self);
      -[STIconCache lookupQueue](self, "lookupQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __40__STIconCache_imageForBundleIdentifier___block_invoke;
      block[3] = &unk_24CED4140;
      objc_copyWeak(&v33, &location);
      v32 = v8;
      dispatch_async(v18, block);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
LABEL_25:
      v6 = 0;
      goto LABEL_13;
    }
    if (objc_msgSend(v8, "source") != 4)
      goto LABEL_25;
    objc_msgSend(v8, "artworkData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "_initWithData:preserveScale:", v19, 1);
      objc_msgSend(v20, "iconFromPrecomposedImage:platform:", 0, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
LABEL_36:
        -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v6, v5, 10);

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[STIconCache imageForBundleIdentifier:completionHandler:].cold.4();

    }
    else
    {
      objc_msgSend(v8, "artworkURL");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        v25 = _os_feature_enabled_impl();

        if (v25)
        {
          objc_initWeak(&location, self);
          -[STIconCache lookupQueue](self, "lookupQueue");
          v26 = objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __40__STIconCache_imageForBundleIdentifier___block_invoke_50;
          v28[3] = &unk_24CED4140;
          objc_copyWeak(&v30, &location);
          v29 = v8;
          dispatch_async(v26, v28);

          objc_destroyWeak(&v30);
          objc_destroyWeak(&location);
        }
      }
    }
    objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[STIconCache imageForBundleIdentifier:completionHandler:].cold.3();

    -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v6 = 0;
LABEL_15:

  return v6;
}

void __40__STIconCache_imageForBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchImageForAppInfoIfNeeded:", *(_QWORD *)(a1 + 32));

}

void __40__STIconCache_imageForBundleIdentifier___block_invoke_50(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchImageForAppInfoIfNeeded:", *(_QWORD *)(a1 + 32));

}

- (void)_fetchImageForAppInfoIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[STIconCache lookupQueue](self, "lookupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIconCache bundleIdentifiersWithPendingRequests](self, "bundleIdentifiersWithPendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0 && v7)
  {
    objc_msgSend(v8, "addObject:", v6);
    objc_initWeak(&location, self);
    -[STIconCache urlSession](self, "urlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __45__STIconCache__fetchImageForAppInfoIfNeeded___block_invoke;
    v11[3] = &unk_24CED4168;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __45__STIconCache__fetchImageForAppInfoIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleiTunesResponseForAppInfo:response:data:error:", *(_QWORD *)(a1 + 32), v9, v10, v8);

}

- (void)_handleiTunesResponseForAppInfo:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[STIconCache lookupQueue](self, "lookupQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(v9, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIconCache bundleIdentifiersWithPendingRequests](self, "bundleIdentifiersWithPendingRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v13);

  if (!v10 || v11)
  {
    objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:].cold.1();
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v10);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bundle-id.%@"), v13);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v15, "iconFromPrecomposedImage:platform:", 0, objc_msgSend(v9, "platform"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[STIconCache _handleiTunesResponseForAppInfo:response:data:error:completionHandler:].cold.2();

      -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v17, v16, 15);
    objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_212E1A000, v19, OS_LOG_TYPE_INFO, "Added an icon for %@ to the cache", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__STIconCache__handleiTunesResponseForAppInfo_response_data_error___block_invoke;
    block[3] = &unk_24CED4190;
    objc_copyWeak(&v24, (id *)buf);
    v22 = v17;
    v23 = v13;
    v20 = v17;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

}

void __67__STIconCache__handleiTunesResponseForAppInfo_response_data_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateCacheWithImage:bundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)imageForCategoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSCache *iconByKeyCache;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("category.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE15798]) & 1) != 0)
    {
      v7 = CFSTR("Games");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157C8]) & 1) != 0)
    {
      v7 = CFSTR("SocialNetworking");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE15790]) & 1) != 0)
    {
      v7 = CFSTR("Entertainment");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE15780]) & 1) != 0)
    {
      v7 = CFSTR("Creativity");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157B0]) & 1) != 0)
    {
      v7 = CFSTR("Productivity");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE15788]) & 1) != 0)
    {
      v7 = CFSTR("Education");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157B8]) & 1) != 0)
    {
      v7 = CFSTR("BooksNewsInformation");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157A0]) & 1) != 0)
    {
      v7 = CFSTR("HealthFitness");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157F0]) & 1) != 0)
    {
      v7 = CFSTR("Utilities");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157C0]) & 1) != 0)
    {
      v7 = CFSTR("ShoppingAndFood");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157E8]) & 1) != 0)
    {
      v7 = CFSTR("Travel");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE157A8]) & 1) != 0)
    {
      v7 = CFSTR("Other");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE847F8]) & 1) != 0
           || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84808]) & 1) != 0
           || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84800]) & 1) != 0)
    {
      v7 = CFSTR("AllApps");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84810]))
      {
        -[STIconCache blankSpaceImageWithSize:](self, "blankSpaceImageWithSize:", 29.0, 29.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        iconByKeyCache = self->_iconByKeyCache;
        v11 = v6;
        v12 = v5;
        v13 = 0;
        goto LABEL_31;
      }
      v7 = CFSTR("Websites");
    }
    v8 = (void *)MEMORY[0x24BDF6AC8];
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:", v7, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    iconByKeyCache = self->_iconByKeyCache;
    v11 = v6;
    v12 = v5;
    v13 = 10;
LABEL_31:
    -[NSCache setObject:forKey:cost:](iconByKeyCache, "setObject:forKey:cost:", v11, v12, v13);
  }

  return v6;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 bundleIdentifier:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a3;
  objc_msgSend(v8, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IconCacheDidUpdateApplicationImage-%@"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v9, a4, v11, self);

}

- (void)removeObserver:(id)a3 bundleIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IconCacheDidUpdateApplicationImage-%@"), v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", v7, v9, self);

}

- (id)blankSpaceImageWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  v6 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSize(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("blank-image.%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "blankSpaceImageWithSize:", width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v9, v8, 0);
  }

  return v9;
}

- (void)_updateCacheWithImage:(id)a3 dsid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[STIconCache _updateCacheWithImage:dsid:].cold.1();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("person-icon.%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v7, v8, 15);
  v12[0] = CFSTR("STIconCacheUpdateDSIDKey");
  v12[1] = CFSTR("STIconCacheUpdateImageKey");
  v13[0] = v6;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("STIconCacheDidUpdatePersonImageNotificationName"), self, v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("STIconCacheDidUpdateNotificationName"), self, 0);
}

- (void)_updateCacheWithImage:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BE845E0], "appInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[STIconCache _updateCacheWithImage:bundleIdentifier:].cold.1();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bundle-id.%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v6, v9, 15);
  v14[0] = CFSTR("STIconCacheUpdateBundleIdentifierKey");
  v14[1] = CFSTR("STIconCacheUpdateImageKey");
  v15[0] = v7;
  v15[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IconCacheDidUpdateApplicationImage-%@"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", v12, self, v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("STIconCacheDidUpdateNotificationName"), self, 0);

}

- (id)circleImageWithFillColor:(id)a3 fillDiameter:(double)a4 outlineColor:(id)a5 outlineWidth:(double)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("circle-image.%@-%f-%@-%f"), v10, *(_QWORD *)&a4, v11, *(_QWORD *)&a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = -[STIconCache _newCircleImageWithFillColor:fillDiameter:outlineColor:outlineWidth:](self, "_newCircleImageWithFillColor:fillDiameter:outlineColor:outlineWidth:", v10, v11, a4, a6);
    -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v13, v12, 0);
  }

  return v13;
}

- (id)_newCircleImageWithFillColor:(id)a3 fillDiameter:(double)a4 outlineColor:(id)a5 outlineWidth:(double)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", a4 + a6 * 2.0, a4 + a6 * 2.0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__STIconCache__newCircleImageWithFillColor_fillDiameter_outlineColor_outlineWidth___block_invoke;
  v16[3] = &unk_24CED41B8;
  v19 = a6;
  v20 = a4;
  v17 = v9;
  v18 = v10;
  v21 = a4 + a6 * 2.0;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "imageWithActions:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __83__STIconCache__newCircleImageWithFillColor_fillDiameter_outlineColor_outlineWidth___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  CGRect v5;
  CGRect v6;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v5.origin.x = *(CGFloat *)(a1 + 48);
  v5.size.width = *(CGFloat *)(a1 + 56);
  v5.origin.y = v5.origin.x;
  v5.size.height = v5.size.width;
  CGContextFillEllipseInRect(v3, v5);
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(objc_retainAutorelease(v4), "CGColor"));
    CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 48));
    v6.origin.x = *(double *)(a1 + 48) * 0.5;
    v6.size.width = *(CGFloat *)(a1 + 64);
    v6.origin.y = 0.0;
    v6.size.height = v6.size.width;
    CGContextStrokeEllipseInRect(v3, v6);
  }
}

- (id)roundedImageForImageWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("rounded-image.%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "iconFromPrecomposedImage:platform:", 1, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v10, v6, 10);

  return v10;
}

- (id)personImageWithDSID:(id)a3 fullName:(id)a4
{
  return -[STIconCache _personImageWithDSID:fullName:appleID:forceFetch:completionHandler:](self, "_personImageWithDSID:fullName:appleID:forceFetch:completionHandler:", a3, a4, 0, 0, 0);
}

- (void)fetchPersonImageWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 forceFetch:(BOOL)a6 completionHandler:(id)a7
{
  id v7;

  v7 = -[STIconCache _personImageWithDSID:fullName:appleID:forceFetch:completionHandler:](self, "_personImageWithDSID:fullName:appleID:forceFetch:completionHandler:", a3, a4, a5, a6, a7);
}

- (id)_personImageWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 forceFetch:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, uint64_t);
  BOOL v26;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, uint64_t))a7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("person-icon.%@"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("monogram-icon.%@"), v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v19);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      -[STIconCache personNameComponentsFormatter](self, "personNameComponentsFormatter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personNameComponentsFromString:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[STIconCache monogramImageForNameComponents:](self, "monogramImageForNameComponents:", v21);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v18, v19, 5);

    }
    goto LABEL_9;
  }
  v18 = (id)v17;
  if (v15)
    v15[2](v15, v17);
  if (v8)
  {
LABEL_9:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[STIconCache _personImageWithDSID:fullName:appleID:forceFetch:completionHandler:].cold.1();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __82__STIconCache__personImageWithDSID_fullName_appleID_forceFetch_completionHandler___block_invoke;
    v23[3] = &unk_24CED41E0;
    v26 = v15 != 0;
    v25 = v15;
    v18 = v18;
    v24 = v18;
    -[STIconCache _fetchFamilyPhotoWithDSID:fullName:appleID:completionHandler:](self, "_fetchFamilyPhotoWithDSID:fullName:appleID:completionHandler:", v12, v13, v14, v23);

  }
  return v18;
}

uint64_t __82__STIconCache__personImageWithDSID_fullName_appleID_forceFetch_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_BYTE *)(result + 48))
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 40);
    if (!a2)
      a2 = *(_QWORD *)(v2 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  return result;
}

- (void)_fetchFamilyPhotoWithDSID:(id)a3 fullName:(id)a4 appleID:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  STIconCache *v15;
  id v16;

  v8 = a3;
  v9 = a6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A90]), "initWithFamilyMemberDSID:size:localFallback:", v8, 1, 1);
  objc_msgSend(v10, "setMonogramDiameter:", 40.0);
  objc_msgSend(v10, "setBackgroundType:", 1);
  objc_msgSend(v10, "setUseMonogramAsLastResort:", 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke;
  v13[3] = &unk_24CED4258;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "startRequestWithCompletionHandler:", v13);

}

void __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  int8x16_t v24;
  _QWORD v25[4];
  id v26;
  int8x16_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138478083;
      v32 = v9;
      v33 = 2112;
      v34 = v7;
      v10 = MEMORY[0x24BDACB70];
      v11 = "failed to retrieve image for %{private}@: %@";
      v12 = 22;
LABEL_16:
      _os_log_impl(&dword_212E1A000, v10, OS_LOG_TYPE_INFO, v11, buf, v12);
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_17;
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138477827;
    v32 = v19;
    v10 = MEMORY[0x24BDACB70];
    v11 = "there was no image for %{private}@";
LABEL_15:
    v12 = 12;
    goto LABEL_16;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v6);
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_17;
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138477827;
    v32 = v20;
    v10 = MEMORY[0x24BDACB70];
    v11 = "unable to deserialize the image for %{private}@";
    goto LABEL_15;
  }
  v14 = v13;
  objc_msgSend(v13, "size");
  if (v16 != 40.0 || v15 != 40.0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", 40.0, 40.0);
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_98;
    v29[3] = &unk_24CED4208;
    v30 = v14;
    objc_msgSend(v18, "imageWithActions:", v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_2;
  v25[3] = &unk_24CED4230;
  v26 = v14;
  v24 = *(int8x16_t *)(a1 + 32);
  v22 = (id)v24.i64[0];
  v27 = vextq_s8(v24, v24, 8uLL);
  v28 = *(id *)(a1 + 48);
  v23 = v14;
  objc_msgSend(v21, "addOperationWithBlock:", v25);

}

uint64_t __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, 40.0, 40.0);
}

uint64_t __76__STIconCache__fetchFamilyPhotoWithDSID_fullName_appleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_updateCacheWithImage:dsid:", v2, *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (CNMonogrammer)monogrammer
{
  CNMonogrammer *monogrammer;
  CNMonogrammer *v4;
  CNMonogrammer *v5;

  monogrammer = self->_monogrammer;
  if (!monogrammer)
  {
    v4 = (CNMonogrammer *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEB8]), "initWithStyle:diameter:", 0, 40.0);
    v5 = self->_monogrammer;
    self->_monogrammer = v4;

    monogrammer = self->_monogrammer;
  }
  return monogrammer;
}

- (NSPersonNameComponentsFormatter)personNameComponentsFormatter
{
  NSPersonNameComponentsFormatter *personNameComponentsFormatter;
  NSPersonNameComponentsFormatter *v4;
  NSPersonNameComponentsFormatter *v5;

  personNameComponentsFormatter = self->_personNameComponentsFormatter;
  if (!personNameComponentsFormatter)
  {
    v4 = (NSPersonNameComponentsFormatter *)objc_opt_new();
    v5 = self->_personNameComponentsFormatter;
    self->_personNameComponentsFormatter = v4;

    -[NSPersonNameComponentsFormatter set_ignoresFallbacks:](self->_personNameComponentsFormatter, "set_ignoresFallbacks:", 1);
    -[NSPersonNameComponentsFormatter setStyle:](self->_personNameComponentsFormatter, "setStyle:", 4);
    personNameComponentsFormatter = self->_personNameComponentsFormatter;
  }
  return personNameComponentsFormatter;
}

- (id)monogramImageForNameComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  if (v4)
  {
    -[STIconCache personNameComponentsFormatter](self, "personNameComponentsFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromPersonNameComponents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v6, "length"))
  {
    -[STIconCache monogrammer](self, "monogrammer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "silhouetteMonogram");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("monogram-icon.%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_9:
    v14 = (id)v8;
    goto LABEL_12;
  }
  -[STIconCache monogrammer](self, "monogrammer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "monogramForPersonWithFirstName:lastName:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[STIconCache monogrammer](self, "monogrammer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "silhouetteMonogram");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v14, v7, 5);
LABEL_12:

  return v14;
}

- (id)monogramImageForInitial:(id)a3 useDarkColors:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = CFSTR("light");
    if (v4)
      v7 = CFSTR("dark");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("monogram-icon.%@.%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSCache objectForKey:](self->_iconByKeyCache, "objectForKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
LABEL_12:

        goto LABEL_16;
      }
    }
    if (v4)
      v11 = 3;
    else
      v11 = 2;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEB8]), "initWithStyle:diameter:", v11, 29.0);
    objc_msgSend(v12, "monogramForPersonWithFirstName:lastName:", v6, &stru_24CED4A80);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v10 = (void *)v13;
      -[NSCache setObject:forKey:cost:](self->_iconByKeyCache, "setObject:forKey:cost:", v13, v8, 5);

      goto LABEL_12;
    }

  }
  -[STIconCache imageForBlankApplicationIcon](self, "imageForBlankApplicationIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[STIconCache monogramImageForInitial:useDarkColors:].cold.1();
LABEL_16:

  return v10;
}

- (void)setMonogrammer:(id)a3
{
  objc_storeStrong((id *)&self->_monogrammer, a3);
}

- (void)setPersonNameComponentsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_personNameComponentsFormatter, a3);
}

- (OS_dispatch_queue)lookupQueue
{
  return self->_lookupQueue;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (NSMutableSet)bundleIdentifiersWithPendingRequests
{
  return self->_bundleIdentifiersWithPendingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersWithPendingRequests, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
  objc_storeStrong((id *)&self->_personNameComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_iconByKeyCache, 0);
}

- (void)imageForBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "STIconCache failed to get icon from launch services for app %@ ; using blank image",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

- (void)imageForBundleIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "STIconCache found no artworkURL for App Store app %@ ; using blank image",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

- (void)imageForBundleIdentifier:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "STIconCache failed to get icon for synced app %@ ; using blank image",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

- (void)imageForBundleIdentifier:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "STIconCache failed to get icon from artworkData for synced app %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleiTunesResponseForAppInfo:response:data:error:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_212E1A000, v0, v1, "Artwork lookup of %@ from store failed: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleiTunesResponseForAppInfo:response:data:error:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Artwork lookup of %@ from store failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateCacheWithImage:dsid:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "successfully retrieved image for %{private}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)_updateCacheWithImage:bundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_212E1A000, v0, v1, "successfully retrieved image for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_personImageWithDSID:fullName:appleID:forceFetch:completionHandler:.cold.1()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v2 = 2113;
  v3 = v0;
  _os_log_debug_impl(&dword_212E1A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "no entry for %{private}@ (%{private}@), queueing one up", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)monogramImageForInitial:useDarkColors:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "Failed to provide monogram for initial: %@. Returning blank icon.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
