@implementation VUIJSNetworkInterface

- (void)fetchConfiguration:(BOOL)a3 :(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id buf[2];

  v6 = a4;
  WLKNetworkingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Begin initconfig", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v6, v9);
  if (a3)
  {
    v10 = 3;
  }
  else
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "launchConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "useConfigCacheIgnoreExpiry");

    if (v13)
      v10 = 5;
    else
      v10 = 0;
  }
  -[VUIJSNetworkInterface setSuppressServerConfigNotifications:](self, "setSuppressServerConfigNotifications:", 1);
  objc_initWeak(buf, self);
  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke;
  v16[3] = &unk_1E9F9E428;
  objc_copyWeak(&v18, buf);
  v15 = v9;
  v17 = v15;
  objc_msgSend(v14, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, v10, 0, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);

}

- (void)setSuppressServerConfigNotifications:(BOOL)a3
{
  self->_suppressServerConfigNotifications = a3;
}

- (VUIJSNetworkInterface)initWithAppContext:(id)a3
{
  VUIJSNetworkInterface *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIJSNetworkInterface;
  v3 = -[VUIJSObject initWithAppContext:](&v7, sel_initWithAppContext_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleAppLibChange_, *MEMORY[0x1E0DC88B8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__handleServerConfigChange_, *MEMORY[0x1E0DC88E8], 0);

  }
  return v3;
}

void __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WLKNetworkingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - initconfig: WLK returned", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke_82;
  v12[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v13 = *(id *)(a1 + 32);
  v10 = v5;
  v14 = v10;
  v11 = v6;
  v15 = v11;
  objc_msgSend(v9, "evaluate:", v12);

  objc_destroyWeak(&v16);
}

void __58__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WLKNetworkSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "WLKUIRequest.bridge", ", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isValid"))
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 64));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallback___block_invoke_89;
    v12[3] = &unk_1E9F9E450;
    v17[1] = *(id *)(a1 + 72);
    v11 = v10;
    v13 = v11;
    v14 = v4;
    objc_copyWeak(v17, (id *)(a1 + 56));
    v15 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v9, "evaluate:", v12);

    objc_destroyWeak(v17);
  }
  else
  {
    WLKNetworkingLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - VUIAppContext is not valid. Process stopped calling appContext completionBlock", buf, 2u);
    }
  }

}

void __46__VUIJSNetworkInterface_upNextItemsReceived::__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0DC8790]);
        v10 = (void *)objc_msgSend(v9, "initWithDictionary:context:", v8, 0, (_QWORD)v11);
        objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0DC8798], "donateMediaItems:", v2);
}

- (void)upNextItemsReceived:(id)a3 :(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", *MEMORY[0x1E0DC88F8], 0);

  WLKNetworkingLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2048;
    v16 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Received UpNext update: donating media items [from %@, %ld items]", buf, 0x16u);
  }

  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VUIJSNetworkInterface_upNextItemsReceived::__block_invoke;
  block[3] = &unk_1E9F98DF0;
  v12 = v5;
  v10 = v5;
  dispatch_async(v9, block);

}

- (id)makeRequest:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "wlk_stringForKey:", CFSTR("endpoint"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_stringForKey:", CFSTR("serverRoute"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("headers"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("queryParameters"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_stringForKey:", CFSTR("httpMethod"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_stringForKey:", CFSTR("postBody"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dataUsingEncoding:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_numberForKey:", CFSTR("timeout"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wlk_stringForKey:", CFSTR("caller"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIJSNetworkInterface _requestOptionsFromJSOptions:](self, "_requestOptionsFromJSOptions:", v6);
  v28 = (void *)v9;
  v25 = (void *)v10;
  v26 = (void *)v8;
  v24 = (void *)v11;
  if (v8)
  {
    objc_msgSend(v6, "wlk_numberForKey:", CFSTR("apiVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC8870], "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", v8, v11, v12, v30, v10, v13, v29, v15, v14, v11, v10, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC8870], "requestPropertiesWithServerRoute:queryParameters:httpMethod:httpBody:headers:caller:timeout:options:", v9, v11, v12, v30, v10, v13, v29, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8878]), "initWithRequestProperties:", v16);
  objc_msgSend(v17, "setAuthenticationDelegate:", self);
  -[VUIJSNetworkInterface _enqueueNetworkOp:withJSCallback:](self, "_enqueueNetworkOp:withJSCallback:", v17, v7);

  v18 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v17, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIJSObject appContext](self, "appContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "jsContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueWithObject:inContext:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (int64_t)_requestOptionsFromJSOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("suppressAuthentication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("encodeQueryParams"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("nonPersonalized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ignoreLocalCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8 = objc_msgSend(v4, "BOOLValue");
    if (!v5)
      goto LABEL_5;
  }
  else
  {
    v8 = 0;
    if (!v5)
      goto LABEL_5;
  }
  if (!objc_msgSend(v5, "BOOLValue"))
    v8 |= 2uLL;
LABEL_5:
  if (objc_msgSend(v6, "BOOLValue"))
    v8 |= 0x10uLL;
  if (objc_msgSend(v7, "BOOLValue"))
    v8 |= 8uLL;

  return v8;
}

- (void)_enqueueNetworkOp:(id)a3 withJSCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  VUIScopedBackgroundTask *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25[2];
  id location;
  _QWORD v27[5];
  VUIScopedBackgroundTask *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringToIndex:", (int)fmin((double)(unint64_t)(objc_msgSend(v8, "length") - 1), 7.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__10;
  v27[4] = __Block_byref_object_dispose__10;
  v10 = [VUIScopedBackgroundTask alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VUIJSNetOp-%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[VUIScopedBackgroundTask initWithIdentifier:expirationHandler:](v10, "initWithIdentifier:expirationHandler:", v11, 0);

  WLKNetworkingLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2048;
    v32 = v7;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Request start: %@ %p", buf, 0x16u);
  }

  WLKNetworkSignpostLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (char *)os_signpost_id_make_with_pointer(v13, v8);

  WLKNetworkSignpostLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "WLKUIRequest.total", ", buf, 2u);
  }

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v8);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v6);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallback___block_invoke;
  v20[3] = &unk_1E9F9E478;
  v23 = v27;
  v25[1] = v14;
  objc_copyWeak(&v24, (id *)buf);
  objc_copyWeak(v25, &location);
  v17 = v8;
  v21 = v17;
  v18 = v7;
  v22 = v18;
  objc_msgSend(v6, "setCompletionBlock:", v20);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v6);

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(v27, 8);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIJSNetworkInterface;
  -[VUIJSNetworkInterface dealloc](&v4, sel_dealloc);
}

- (id)makeStoreRequest:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[VUIJSNetworkInterface _createURLRequestFromJSOptionsDictionary:](self, "_createURLRequestFromJSOptionsDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VUIJSNetworkInterface _requestOptionsFromJSOptions:](self, "_requestOptionsFromJSOptions:", v7);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC87D8]), "initWithURLRequest:options:", v8, v9);
  objc_msgSend(v10, "setAuthenticationDelegate:", self);
  -[VUIJSNetworkInterface _enqueueNetworkOp:withJSCallback:](self, "_enqueueNetworkOp:withJSCallback:", v10, v6);

  v11 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueWithObject:inContext:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)makeMediaApiRequest:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a4;
  -[VUIJSNetworkInterface _createURLRequestFromJSOptionsDictionary:](self, "_createURLRequestFromJSOptionsDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier](VUIMediaAPIClient, "initializeWithAppleTVClientIdentifier");
    +[VUIMediaAPIClient sharedInstance](VUIMediaAPIClient, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke;
    v19 = &unk_1E9F9E400;
    v20 = v10;
    v21 = v6;
    objc_msgSend(v11, "fetchContentForUrl:completion:", v7, &v16);

  }
  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v6, v9, v16, v17, v18, v19);
  v12 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v10, "jsContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueWithObject:inContext:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
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
  v10[2] = __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke_2;
  v10[3] = &unk_1E9F9E3D8;
  v11 = v5;
  v12 = v6;
  v7 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "evaluate:", v10);

}

void __46__VUIJSNetworkInterface_makeMediaApiRequest::__block_invoke_2(id *a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", 3);
  objc_msgSend(a1[4], "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "statusCode");
  else
    v8 = 0;
  WLKNetworkingLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v8;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - VUIJSNetworkInterface::Media API response returned with statusCode %ld", buf, 0xCu);
  }

  if (a1[5])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1[5], "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v10, "setObject:forKey:", v11, CFSTR("code"));

    objc_msgSend(a1[5], "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v10, "setObject:forKey:", v12, CFSTR("domain"));

    objc_msgSend(a1[5], "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v10, "setObject:forKey:", v13, CFSTR("description"));

    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("error"));
LABEL_8:

    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1[4], "object");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    WLKNetworkingLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - VUIJSNetworkInterface::Parsing Media API Fetch with no object dictionary", buf, 2u);
    }
    goto LABEL_8;
  }
  objc_msgSend(a1[4], "object");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("statusCode"));

  if (v14)
  {
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("response"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("response"));

  }
  objc_msgSend(a1[6], "context");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(a1[7], "isValid");

  if (v20 && v19 == v4)
  {
    v21 = a1[6];
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v21, "callWithArguments:", v22);

  }
}

- (id)makeUpNextRequest:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "wlk_dictionaryForKey:", CFSTR("queryParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8798]), "initWithQueryParameters:", v7);
  objc_msgSend(v8, "setAuthenticationDelegate:", self);
  -[VUIJSNetworkInterface _enqueueNetworkOp:withJSCallback:](self, "_enqueueNetworkOp:withJSCallback:", v8, v6);

  v9 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithObject:inContext:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)cancelRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v3);

          if (v12)
            objc_msgSend(v10, "cancel");
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __45__VUIJSNetworkInterface_fetchConfiguration::__block_invoke_82(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WLKNetworkingLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - initconfig success.", (uint8_t *)&v12, 2u);
      }

      objc_msgSend(v5, "addObject:", v6);
    }
    else
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 48);
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - initconfig error. %@", (uint8_t *)&v12, 0xCu);
      }

    }
    v10 = (id)objc_msgSend(v4, "callWithArguments:", v5);
    objc_msgSend(v3, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setSuppressServerConfigNotifications:", 0);
    WLKNetworkingLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - End initconfig", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)invalidateConfiguration
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invalidateCache");

}

void __58__VUIJSNetworkInterface__enqueueNetworkOp_withJSCallback___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
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
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKNetworkSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v5, OS_SIGNPOST_INTERVAL_END, v6, "WLKUIRequest.bridge", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "httpResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0DC87A0]);
  objc_msgSend(v40, "processResponseData:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v3;
  if (!v11 && v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  objc_msgSend(v9, "allHeaderFields");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "responseStatusCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("statusCode"));

  if (v11)
  {
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("response"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("response"));

  }
  if (v44)
  {
    objc_msgSend(v12, "setObject:forKey:", v44, CFSTR("headers"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("headers"));

  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("primaryDataResponseStartTime"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("primaryDataResponseEndTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "resourceFetchType") == 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("isPrimaryDataResponseCached"));

  if (!v9 && v8)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("code"));

    objc_msgSend(v8, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("domain"));

    objc_msgSend(v8, "debugDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v24, CFSTR("description"));

    objc_msgSend(v12, "setObject:forKey:", v21, CFSTR("error"));
  }
  v42 = v9;
  v43 = v8;
  v25 = v7;
  WLKNetworkSignpostLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v28 = *(_QWORD *)(a1 + 72);
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v27, OS_SIGNPOST_INTERVAL_END, v28, "WLKUIRequest.total", ", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 48));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "appContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isValid");

  WLKNetworkingLogObject();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (!v33 || v31 != v41)
  {
    if ((v33 & 1) != 0)
    {
      if (!v35)
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v39 = "VUIJSNetworkInterface - context of localCallBack does not match with context of AppContext";
    }
    else
    {
      if (!v35)
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v39 = "VUIJSNetworkInterface - VUIAppContext is not valid inside AppContext evalue completionBlock";
    }
    _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
    goto LABEL_30;
  }
  if (v35)
  {
    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v47 = v36;
    v48 = 2048;
    v49 = v37;
    _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - Request end: %@ %p", buf, 0x16u);
  }

  v45 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v34 = objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v30, "callWithArguments:", v34);
LABEL_30:

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 48));
}

- (id)_createURLRequestFromJSOptionsDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;

  v3 = a3;
  objc_msgSend(v3, "wlk_stringForKey:", CFSTR("url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_stringForKey:", CFSTR("httpMethod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_stringForKey:", CFSTR("postBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_dictionaryForKey:", CFSTR("headers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_dictionaryForKey:", CFSTR("queryParameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_numberForKey:", CFSTR("timeout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("POST"));
  v11 = objc_msgSend(v3, "wlk_BOOLForKey:defaultValue:", CFSTR("encodeQueryParams"), 1);

  if (v4 && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v23 = v6;
    objc_msgSend(MEMORY[0x1E0C99E98], "vui_sortedQueryItemsFromDictionary:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v13, 0);
    if (objc_msgSend(v14, "count"))
    {
      if (v11)
        objc_msgSend(v15, "setPercentEncodedQueryItems:", v14);
      else
        objc_msgSend(v15, "setQueryItems:", v14);
      objc_msgSend(v15, "URL");
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    v18 = objc_alloc(MEMORY[0x1E0CB37A8]);
    objc_msgSend(v9, "doubleValue");
    v19 = (void *)objc_msgSend(v18, "initWithURL:cachePolicy:timeoutInterval:", v13, 0);
    v20 = v19;
    if (v5)
      objc_msgSend(v19, "setHTTPMethod:", v5);
    if (v10)
    {
      objc_msgSend(v23, "dataUsingEncoding:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHTTPBody:", v21);

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__VUIJSNetworkInterface__createURLRequestFromJSOptionsDictionary___block_invoke;
    v24[3] = &unk_1E9F9E4A0;
    v16 = v20;
    v25 = v16;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v24);

    v6 = v23;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __66__VUIJSNetworkInterface__createURLRequestFromJSOptionsDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v7 = a5;
  v8 = a6;
  WLKNetworkingLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleDialogRequest begin", buf, 2u);
  }

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDE0]), "initWithRequest:presentingViewController:", v7, v10);
    -[NSObject present](v11, "present");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__VUIJSNetworkInterface_AMSURLSession_task_handleDialogRequest_completion___block_invoke;
    v13[3] = &unk_1E9F9B378;
    v14 = v8;
    objc_msgSend(v12, "addFinishBlock:", v13);

  }
  else
  {
    WLKNetworkingLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - failed to handle dialog request because there is no presenting view controller", buf, 2u);
    }
  }

}

void __75__VUIJSNetworkInterface_AMSURLSession_task_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  WLKNetworkingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleDialogRequest end", v9, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v7 = a5;
  v8 = a6;
  WLKNetworkingLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleAuthenticateRequest begin", buf, 2u);
  }

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDF0]), "initWithRequest:presentingViewController:", v7, v10);
    -[NSObject performAuthentication](v11, "performAuthentication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__VUIJSNetworkInterface_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke;
    v13[3] = &unk_1E9F9B350;
    v14 = v8;
    objc_msgSend(v12, "addFinishBlock:", v13);

  }
  else
  {
    WLKNetworkingLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - failed to handle authenticate request because there is no presenting view controller", buf, 2u);
    }
  }

}

void __81__VUIJSNetworkInterface_AMSURLSession_task_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  WLKNetworkingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIJSNetworkInterface - AMSURLProtocolDelegate handleAuthenticateRequest end", v9, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)_handleAppLibChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id from;
  id location;

  v4 = a3;
  NSLog(CFSTR("VUIJSNetworkInterface - _handleAppLibChange"));
  -[VUIJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  objc_initWeak(&from, self);
  v6 = objc_loadWeakRetained(&location);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__VUIJSNetworkInterface__handleAppLibChange___block_invoke;
  v7[3] = &unk_1E9F9E340;
  objc_copyWeak(&v8, &from);
  objc_msgSend(v6, "evaluate:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __45__VUIJSNetworkInterface__handleAppLibChange___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", WeakRetained, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasProperty:", CFSTR("onEntitlementsChange")))
  {
    NSLog(CFSTR("VUIJSNetworkInterface - _handleAppLibChange - calling JS"));
    objc_msgSend(MEMORY[0x1E0DC8750], "defaultAppLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)

    v10 = (id)objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("onEntitlementsChange"), v9);
  }

}

- (void)_handleServerConfigChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  v4 = a3;
  NSLog(CFSTR("VUIJSNetworkInterface - _handleServerConfigChange"));
  if (self->_suppressServerConfigNotifications)
  {
    NSLog(CFSTR("VUIJSNetworkInterface - _handleServerConfigChange - notifications are suppressed"));
  }
  else
  {
    -[VUIJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);

    objc_initWeak(&from, self);
    v6 = objc_loadWeakRetained(&location);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__VUIJSNetworkInterface__handleServerConfigChange___block_invoke;
    v7[3] = &unk_1E9F9CBA8;
    objc_copyWeak(&v9, &from);
    v8 = v4;
    objc_msgSend(v6, "evaluate:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __51__VUIJSNetworkInterface__handleServerConfigChange___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasProperty:", CFSTR("onConfigurationChange")))
  {
    NSLog(CFSTR("VUIJSNetworkInterface - _handleServerConfigChange - calling JS"));
    objc_msgSend(*(id *)(a1 + 32), "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)

    v10 = (id)objc_msgSend(v6, "invokeMethod:withArguments:", CFSTR("onConfigurationChange"), v9);
  }

}

- (BOOL)suppressServerConfigNotifications
{
  return self->_suppressServerConfigNotifications;
}

@end
