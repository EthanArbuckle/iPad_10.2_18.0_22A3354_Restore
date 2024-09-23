@implementation SKUIJSITunesStore

- (SKUIJSITunesStore)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SKUIJSITunesStore *v8;
  SKUIJSITunesStore *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSITunesStore initWithAppContext:clientContext:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIJSITunesStore;
  v8 = -[IKJSITunesStore initWithAppContext:](&v14, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__purchaseRequestDidSucceedNotification_, 0x1E73AA450, 0);

    v12 = SKUIMediaPlayerFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), v12), "setFilteringDisabled:", 1);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, 0x1E73AA450, 0);

  v5.receiver = self;
  v5.super_class = (Class)SKUIJSITunesStore;
  -[IKJSITunesStore dealloc](&v5, sel_dealloc);
}

- (void)sendApplicationDidEnterBackground
{
  id v2;

  v2 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("applicationDidEnterBackground"), 0);
}

- (void)sendApplicationWillEnterForeground
{
  id v2;

  v2 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("applicationWillEnterForeground"), 0);
}

- (void)sendOnNavigationStackWillPop:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("isInteractive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onNavigationStackWillPop"), v6);

}

- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKUIJSFakeXMLHTTPRequest *v14;
  void *v15;
  SKUIJSFakeXMLHTTPRequest *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [SKUIJSFakeXMLHTTPRequest alloc];
  -[IKJSObject appContext](self, "appContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SKUIJSFakeXMLHTTPRequest initWithAppContext:data:URLResponse:performanceMetrics:](v14, "initWithAppContext:data:URLResponse:performanceMetrics:", v15, v12, v11, v10);

  objc_msgSend(v13, "valueForKey:", CFSTR("jsDocument"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v17;
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onPageResponse"), v18);

}

- (BOOL)sendOnXEventWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CBE108];
  v5 = a3;
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithObject:inContext:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "hasProperty:", CFSTR("onXEvent"));
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onXEvent"), v9);
  return (char)v4;
}

- (BOOL)sendAppPreviewStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v3 = a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  self->_isAppPreview = a3;
  v5 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithObject:inContext:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "hasProperty:", CFSTR("onAppPreviewStateChanged"));
  v15 = CFSTR("isPreview");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onAppPreviewStateChanged"), v11);

  return (char)v6;
}

- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "sk_dictionaryWithSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onWindowSizeDidUpdate"), v5);

}

- (BOOL)sendOnShowPageEventType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithObject:inContext:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hasProperty:", CFSTR("onShowPage"));
  v19 = CFSTR("type");
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v7)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("data"));
  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onShowPage"), v15);

  return v12;
}

- (int64_t)applicationIconBadgeNumber
{
  int64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKUIJSITunesStore_applicationIconBadgeNumber__block_invoke;
  block[3] = &unk_1E73A20C8;
  block[4] = &v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __47__SKUIJSITunesStore_applicationIconBadgeNumber__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "applicationIconBadgeNumber");

}

- (BOOL)areVideosCloudPurchasesEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("VideosShowCloudMediaEnabledSetting"), CFSTR("com.apple.mobileipod"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)attemptLocalAskToBuyApproval:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v4 = SKUIAskPermissionFramework();
  v5 = SKUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v4);
  v6 = (void *)SKUIAskPermissionFramework();
  objc_msgSend(v5, "_requestQueueForIdentifier:", *(_QWORD *)SKUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "longLongValue");

  objc_msgSend(v8, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v7, 0);
}

- (void)buy:(id)a3
{
  id v4;
  SKUIItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SKUIClientContext *clientContext;
  _QWORD *v11;
  id *v12;
  SKUIClientContext *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  SKUIItem *v19;
  SKUIJSITunesStore *v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  id location;

  v4 = a3;
  v5 = -[SKUIItem initWithLookupDictionary:]([SKUIItem alloc], "initWithLookupDictionary:", v4);
  -[SKUIItem primaryItemOffer](v5, "primaryItemOffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_initWeak(&location, self);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    if (SKUIItemKindIsToneKind(-[SKUIItem itemKind](v5, "itemKind")))
    {
      -[IKJSObject appContext](self, "appContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __25__SKUIJSITunesStore_buy___block_invoke;
      v18[3] = &unk_1E73A28A8;
      v19 = v5;
      v20 = self;
      objc_copyWeak(&v23, &location);
      v21 = v4;
      v22 = &v24;
      objc_msgSend(v8, "evaluateDelegateBlockSync:", v18);

      objc_destroyWeak(&v23);
    }
    if (*((_BYTE *)v25 + 24))
    {
      if (SKUIItemStateCenterUseAppstoredPurchases(v5))
      {
        +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        clientContext = self->_clientContext;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __25__SKUIJSITunesStore_buy___block_invoke_3;
        v16[3] = &unk_1E73A28D0;
        v11 = v16;
        v12 = &v17;
        objc_copyWeak(&v17, &location);
        v16[4] = v4;
        objc_msgSend(v9, "purchaseSoftwareItem:offer:clientContext:completionBlock:", v5, v6, clientContext, v16);
      }
      else
      {
        +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self->_clientContext;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __25__SKUIJSITunesStore_buy___block_invoke_4;
        v14[3] = &unk_1E73A2880;
        v11 = v14;
        v12 = &v15;
        objc_copyWeak(&v15, &location);
        v14[4] = v4;
        objc_msgSend(v9, "purchaseItem:offer:clientContext:completionBlock:", v5, v6, v13, v14);
      }

      objc_destroyWeak(v12);
    }
    _Block_object_dispose(&v24, 8);
    objc_destroyWeak(&location);
  }

}

void __25__SKUIJSITunesStore_buy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SKUITonePurchaseController *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "presentationViewControllerForAppContext:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[SKUITonePurchaseController initWithItem:]([SKUITonePurchaseController alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
      -[SKUITonePurchaseController setClientContext:](v7, "setClientContext:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
      -[SKUITonePurchaseController setParentViewController:](v7, "setParentViewController:", v6);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __25__SKUIJSITunesStore_buy___block_invoke_2;
      v8[3] = &unk_1E73A2880;
      objc_copyWeak(&v10, (id *)(a1 + 64));
      v9 = *(id *)(a1 + 48);
      -[SKUITonePurchaseController showPurchaseFlowWithCompletionBlock:](v7, "showPurchaseFlowWithCompletionBlock:", v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

      objc_destroyWeak(&v10);
    }
  }

}

void __25__SKUIJSITunesStore_buy___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishPurchaseForOptions:purchaseResponse:", *(_QWORD *)(a1 + 32), v4);

}

void __25__SKUIJSITunesStore_buy___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishSoftwarePurchaseForOptions:purchaseResponse:", *(_QWORD *)(a1 + 32), v4);

}

void __25__SKUIJSITunesStore_buy___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_finishPurchaseForOptions:purchaseResponse:", *(_QWORD *)(a1 + 32), v4);

}

- (void)approveInPerson:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  SKUIJSITunesStore *v27;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = SKUIAskPermissionFramework();
  v13 = SKUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v12);
  v14 = (void *)SKUIAskPermissionFramework();
  v15 = *(id *)SKUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v14);
  objc_msgSend(v13, "_requestQueueForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "longLongValue");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __38__SKUIJSITunesStore_approveInPerson::__block_invoke;
  v22[3] = &unk_1E73A2920;
  v23 = v8;
  v24 = v9;
  v25 = v6;
  v26 = v11;
  v27 = self;
  v18 = v11;
  v19 = v6;
  v20 = v9;
  v21 = v8;
  objc_msgSend(v16, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v17, v22);

}

void __38__SKUIJSITunesStore_approveInPerson::__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SKUIJSITunesStore_approveInPerson::__block_invoke_2;
  v8[3] = &unk_1E73A28F8;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v13 = a3;
  v10 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v12 = v7;
  objc_msgSend(v5, "evaluate:completionBlock:", v8, 0);

}

void __38__SKUIJSITunesStore_approveInPerson::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64), CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("adamId");
  v8[0] = v3;
  v8[1] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)clearToggleStateItems
{
  id v2;

  +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAll");

}

- (void)download:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0DAF4F8];
  v4 = a3;
  v8 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4B0]), "initWithDownloadMetadata:", v8);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
  if (objc_msgSend(v6, "count"))
  {
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDownloads:", v6);

  }
}

- (void)downloadExistsFor:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = (void *)objc_msgSend(v6, "longLongValue");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DAF4C8], "IPodDownloadManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__SKUIJSITunesStore_downloadExistsFor::__block_invoke;
  v17[3] = &unk_1E73A2998;
  objc_copyWeak(v21, &location);
  v21[1] = v12;
  v14 = v8;
  v18 = v14;
  v15 = v9;
  v19 = v15;
  v16 = v11;
  v20 = v16;
  objc_msgSend(v13, "getDownloadsUsingBlock:", v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

void __40__SKUIJSITunesStore_downloadExistsFor::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__SKUIJSITunesStore_downloadExistsFor::__block_invoke_2;
  v17[3] = &unk_1E73A2948;
  v6 = *(_QWORD *)(a1 + 64);
  v17[4] = &v18;
  v17[5] = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v17);
  v22 = CFSTR("exists");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v19 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__SKUIJSITunesStore_downloadExistsFor::__block_invoke_3;
  v12[3] = &unk_1E73A2970;
  v9 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v10 = v8;
  v14 = v10;
  v15 = *(id *)(a1 + 48);
  v11 = WeakRetained;
  v16 = v11;
  objc_msgSend(v9, "evaluate:completionBlock:", v12, 0);

  _Block_object_dispose(&v18, 8);
}

void __40__SKUIJSITunesStore_downloadExistsFor::__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF9D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (*(_QWORD *)(a1 + 40) == v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __40__SKUIJSITunesStore_downloadExistsFor::__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)exit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__SKUIJSITunesStore_exit___block_invoke;
  v7[3] = &unk_1E73A29C0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

}

void __26__SKUIJSITunesStore_exit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:didExitWithOptions:", v4, *(_QWORD *)(a1 + 32));

}

- (void)findApps:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SKUIJSITunesStore *v21;

  v7 = a4;
  v8 = a3;
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "virtualMachine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addManagedReference:withOwner:", v10, self);
  v13 = objc_alloc_init(MEMORY[0x1E0DAF640]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __32__SKUIJSITunesStore_findApps_::__block_invoke;
  v17[3] = &unk_1E73A29E8;
  v18 = v9;
  v19 = v10;
  v20 = v12;
  v21 = self;
  v14 = v12;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v13, "getLibraryItemForBundleIdentifiers:completionBlock:", v8, v17);

}

void __32__SKUIJSITunesStore_findApps_::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  SKUILibraryItemState *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v24 = a1;
  v39 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v25 = a3;
  v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v9 = *MEMORY[0x1E0DAFCE8];
    v26 = *(_QWORD *)v35;
    v27 = *MEMORY[0x1E0DAFD08];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1BCCE6C7C]();
        objc_msgSend(v11, "valueForProperty:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && (objc_msgSend(v11, "isPlaceholder") & 1) == 0 && (objc_msgSend(v11, "isBeta") & 1) == 0)
        {
          v14 = -[SKUILibraryItemState initWithApplication:]([SKUILibraryItemState alloc], "initWithApplication:", v11);
          v15 = -[SKUILibraryItemState newJavaScriptRepresentation](v14, "newJavaScriptRepresentation");
          objc_msgSend(v11, "valueForProperty:", v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "stringValue");
            v18 = v5;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v19, 0x1E73ADB50);

            v5 = v18;
            v8 = v26;
          }
          objc_msgSend(v28, "setObject:forKey:", v15, v13, v24, v25);

        }
        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v7);
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __32__SKUIJSITunesStore_findApps_::__block_invoke_2;
  v29[3] = &unk_1E73A2970;
  v20 = *(void **)(v24 + 32);
  v30 = *(id *)(v24 + 40);
  v31 = v28;
  v21 = *(id *)(v24 + 48);
  v22 = *(_QWORD *)(v24 + 56);
  v32 = v21;
  v33 = v22;
  v23 = v28;
  objc_msgSend(v20, "evaluate:completionBlock:", v29, 0);

}

void __32__SKUIJSITunesStore_findApps_::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)findLibraryItems:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SKUIJSITunesStore *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "virtualMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addManagedReference:withOwner:", v12, self);
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__SKUIJSITunesStore_findLibraryItems_::__block_invoke;
  v19[3] = &unk_1E73A2A10;
  v20 = v11;
  v21 = v12;
  v22 = v14;
  v23 = self;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  objc_msgSend(v15, "findLibraryItemsForContentIdentifiers:options:completionBlock:", v10, v8, v19);

}

void __40__SKUIJSITunesStore_findLibraryItems_::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SKUIJSITunesStore_findLibraryItems_::__block_invoke_2;
  v8[3] = &unk_1E73A2970;
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v4, "evaluate:completionBlock:", v8, 0);

}

void __40__SKUIJSITunesStore_findLibraryItems_::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)findOwnedItems:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  SKUIStoreIdentifier *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  SKUIJSITunesStore *v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  SKUIJSITunesStore *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v28 = v7;
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v10;
  v25 = (void *)v8;
  v26 = self;
  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v15, "longLongValue"));
        v17 = v16;
        v18 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", objc_msgSend(v16, "longLongValue"));
        if (v18)
        {
          +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stateForItemWithStoreIdentifier:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v20, "state") & 8) != 0)
            objc_msgSend(v29, "addObject:", v15);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __37__SKUIJSITunesStore_findOwnedItems::__block_invoke;
  v31[3] = &unk_1E73A2970;
  v32 = v25;
  v33 = v29;
  v34 = v24;
  v35 = v26;
  v21 = v24;
  v22 = v29;
  v23 = v25;
  objc_msgSend(v27, "evaluate:completionBlock:", v31, 0);

}

void __37__SKUIJSITunesStore_findOwnedItems::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)findToggleStateForItem:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SKUIJSITunesStore *v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "virtualMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
    +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemForIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = objc_msgSend(v13, "toggled");
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setValue:forKey:", v6, CFSTR("itemID"));
    if ((_DWORD)v12 == 1)
      v15 = MEMORY[0x1E0C9AAB0];
    else
      v15 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("toggled"));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __45__SKUIJSITunesStore_findToggleStateForItem::__block_invoke;
    v19[3] = &unk_1E73A2970;
    v20 = v9;
    v21 = v14;
    v22 = v11;
    v23 = self;
    v16 = v11;
    v17 = v14;
    v18 = v9;
    objc_msgSend(v8, "evaluate:completionBlock:", v19, 0);

  }
}

void __45__SKUIJSITunesStore_findToggleStateForItem::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)getBookSample:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0DAF4F8];
  v4 = a3;
  v7 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  objc_msgSend(v7, "primaryAssetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addManifestDownloadWithURL:placeholderMetadata:", v5, v7);

  }
}

- (void)getAdminStatus:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SKUIJSITunesStore *v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CBE0F8];
  v8 = a4;
  objc_msgSend(v7, "managedValueWithValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "objectForKey:", CFSTR("ignoreCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SKUIMediaSocialAdminPermissionsOptionIgnoreCache"));
  -[IKJSObject appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SKUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__SKUIJSITunesStore_getAdminStatus::__block_invoke;
  v19[3] = &unk_1E73A1AD8;
  v20 = v14;
  v21 = v9;
  v22 = v11;
  v23 = self;
  v16 = v11;
  v17 = v9;
  v18 = v14;
  objc_msgSend(v15, "getAdminStatusWithOptions:resultBlock:", v6, v19);

}

void __37__SKUIJSITunesStore_getAdminStatus::__block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  if (a3)
  {
    objc_msgSend(a3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DAFA30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)(objc_msgSend(v6, "integerValue") - 500) <= 0x62)
    {
      +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SKUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastKnownAdminStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        a2 = objc_msgSend(v8, "BOOLValue");

    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__SKUIJSITunesStore_getAdminStatus::__block_invoke_2;
  v12[3] = &unk_1E73A1AB0;
  v9 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v16 = a2;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v14 = v10;
  v15 = v11;
  objc_msgSend(v9, "evaluate:completionBlock:", v12, 0);

}

uint64_t __37__SKUIJSITunesStore_getAdminStatus::__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C9AAB0];
  if (!*(_BYTE *)(a1 + 56))
    v3 = MEMORY[0x1E0C9AAA0];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (NSString)hostApp
{
  void *v3;
  void *v4;

  if (-[SKUIClientContext conformsToProtocol:](self->_clientContext, "conformsToProtocol:", &unk_1EF4C5E20))
  {
    -[SKUIClientContext hostApplicationIdentifier](self->_clientContext, "hostApplicationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)isAppPreview
{
  return self->_isAppPreview;
}

- (id)documentSizeForNavigationDocument:(id)a3
{
  SKUIClientContext *clientContext;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  clientContext = self->_clientContext;
  v4 = a3;
  -[SKUIClientContext applicationController](clientContext, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeForNavigationDocument:", v4);
  v7 = v6;
  v9 = v8;

  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "sk_dictionaryWithSize:", v7, v9);
}

- (void)getProfilePermissions:(id)a3 :(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SKUIJSITunesStore *v23;

  v6 = (void *)MEMORY[0x1E0CBE0F8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "objectForKey:", CFSTR("ignoreCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "BOOLValue"))
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SKUIMediaSocialAdminPermissionsOptionIgnoreCache"));
  -[IKJSObject appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SKUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__SKUIJSITunesStore_getProfilePermissions::__block_invoke;
  v19[3] = &unk_1E73A29E8;
  v20 = v14;
  v21 = v9;
  v22 = v11;
  v23 = self;
  v16 = v11;
  v17 = v9;
  v18 = v14;
  objc_msgSend(v15, "getAuthorsWithOptions:authorsBlock:", v12, v19);

}

void __44__SKUIJSITunesStore_getProfilePermissions::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SKUIJSMediaSocialAuthor *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DAFA30]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)(objc_msgSend(v9, "integerValue") - 500) <= 0x62)
    {
      +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SKUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastKnownAuthors");
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v11;
    }

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = -[SKUIJSMediaSocialAuthor initWithSKUIMediaSocialAuthor:]([SKUIJSMediaSocialAuthor alloc], "initWithSKUIMediaSocialAuthor:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17));
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __44__SKUIJSITunesStore_getProfilePermissions::__block_invoke_2;
  v23[3] = &unk_1E73A2970;
  v19 = *(void **)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v25 = v12;
  v20 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v26 = v20;
  v27 = v21;
  v22 = v12;
  objc_msgSend(v19, "evaluate:completionBlock:", v23, 0);

}

uint64_t __44__SKUIJSITunesStore_getProfilePermissions::__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  return objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)isInstalledApp:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SKUIJSITunesStore *v21;
  char v22;

  v6 = a4;
  v7 = a3;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_msgSend(v7, "unsignedIntegerValue");

  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stateForItemWithIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = ((unint64_t)objc_msgSend(v14, "state") >> 2) & 1;
  else
    LOBYTE(v15) = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __37__SKUIJSITunesStore_isInstalledApp::__block_invoke;
  v18[3] = &unk_1E73A1AB0;
  v22 = v15;
  v19 = v9;
  v20 = v11;
  v21 = self;
  v16 = v11;
  v17 = v9;
  objc_msgSend(v8, "evaluate:completionBlock:", v18, 0);

}

void __37__SKUIJSITunesStore_isInstalledApp::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)isRemovedSystemApp:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x1E0DAF640]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__SKUIJSITunesStore_isRemovedSystemApp::__block_invoke;
  v17[3] = &unk_1E73A2A38;
  v17[4] = self;
  v18 = v6;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v12, "isRemovedSystemApplicationWithBundleIdentifier:completionBlock:", v16, v17);

}

void __41__SKUIJSITunesStore_isRemovedSystemApp::__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      v23 = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      v12 = v10;
      LODWORD(v17) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v23, v17);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__SKUIJSITunesStore_isRemovedSystemApp::__block_invoke_170;
  v18[3] = &unk_1E73A1AB0;
  v14 = *(void **)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v22 = a2;
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 32);
  v20 = v15;
  v21 = v16;
  objc_msgSend(v14, "evaluate:completionBlock:", v18, 0);

}

void __41__SKUIJSITunesStore_isRemovedSystemApp::__block_invoke_170(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)launchICloudFamilySettings
{
  id v2;

  -[IKJSObject appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluateDelegateBlockSync:", &__block_literal_global_7);

}

void __47__SKUIJSITunesStore_launchICloudFamilySettings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "presentationViewControllerForAppContext:", v7);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = SKUIFamilyCircleFramework();
      v6 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("FAFamilySettings"), v5));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setPresentingViewController:", v4);
        objc_msgSend(v6, "launchiCloudFamilySettings");
      }

    }
  }

}

- (void)loadGratisContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  SKUIJSITunesStore *v19;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadGratisEligibilityWithBundleIdentifiers:clientContext:", 0, self->_clientContext);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__SKUIJSITunesStore_loadGratisContent___block_invoke;
  v14[3] = &unk_1E73A2AA0;
  v15 = v9;
  v16 = v5;
  v17 = v6;
  v18 = v8;
  v19 = self;
  v10 = v8;
  v11 = v6;
  v12 = v5;
  v13 = v9;
  objc_msgSend(v13, "finishLoadingWithCompletionBlock:", v14);

}

void __39__SKUIJSITunesStore_loadGratisContent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "gratisEligibleItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SKUIJSITunesStore_loadGratisContent___block_invoke_2;
  v7[3] = &unk_1E73A2970;
  v3 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v2;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v10 = v4;
  v11 = v5;
  v6 = v2;
  objc_msgSend(v3, "evaluate:completionBlock:", v7, 0);

}

void __39__SKUIJSITunesStore_loadGratisContent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)log:(id)a3
{
  NSLog(CFSTR("[JS]: %@"), a2, a3);
}

- (void)headsUp:(id)a3 :(id)a4
{
  NSLog(CFSTR("[HeadsUp]: %@"), a2, a3, a4, a3);
}

- (SKUIJSAppleAccount)primaryAppleAccount
{
  uint64_t v2;
  id v3;
  SKUIJSAppleAccount *v4;
  void *v5;
  SKUIJSAppleAccount *v6;

  v2 = SKUIAccountsFramework();
  v3 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("ACAccountStore"), v2));
  v4 = [SKUIJSAppleAccount alloc];
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKUIJSAppleAccount initWithACAccount:](v4, "initWithACAccount:", v5);

  return v6;
}

- (SKUIJSRestrictions)restrictions
{
  SKUIJSRestrictions *v3;
  void *v4;
  SKUIJSRestrictions *v5;

  v3 = [SKUIJSRestrictions alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKUIJSRestrictions initWithAppContext:clientContext:](v3, "initWithAppContext:clientContext:", v4, self->_clientContext);

  return v5;
}

- (void)resetStateForActiveDocument
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SKUIStoreDialogControllerPurchaseRequestDidSucceedNotification"), v5);

}

- (BOOL)resourceExists:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
  else
    v4 = 0;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("resource")))
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = SKUIImageExistsWithResourceName(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)restoreRemovedSystemApp:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "virtualMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
  v12 = objc_alloc_init(MEMORY[0x1E0DAF640]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__SKUIJSITunesStore_restoreRemovedSystemApp::__block_invoke;
  v17[3] = &unk_1E73A2A38;
  v17[4] = self;
  v18 = v6;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v12, "restoreRemovedSystemApplicationWithBundleIdentifier:completionBlock:", v16, v17);

}

void __46__SKUIJSITunesStore_restoreRemovedSystemApp::__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      v23 = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      v12 = v10;
      LODWORD(v17) = 32;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v23, v17);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__SKUIJSITunesStore_restoreRemovedSystemApp::__block_invoke_186;
  v18[3] = &unk_1E73A1AB0;
  v14 = *(void **)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v22 = a2;
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 32);
  v20 = v15;
  v21 = v16;
  objc_msgSend(v14, "evaluate:completionBlock:", v18, 0);

}

void __46__SKUIJSITunesStore_restoreRemovedSystemApp::__block_invoke_186(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)setApplicationIconBadgeNumber:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SKUIJSITunesStore_setApplicationIconBadgeNumber___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__SKUIJSITunesStore_setApplicationIconBadgeNumber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setApplicationIconBadgeNumber:", *(_QWORD *)(a1 + 32));

}

- (void)setPreviewOverlay:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(MEMORY[0x1E0D3A5E8], "instancesRespondToSelector:", sel_initWithAppContext_document_owner_))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A5E8]), "initWithAppContext:document:owner:", v8, v6, self);
  }
  else
  {
    v9 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__SKUIJSITunesStore_setPreviewOverlay::__block_invoke;
  v12[3] = &unk_1E73A2AC8;
  v13 = v9;
  v14 = v7;
  v10 = v7;
  v11 = v9;
  objc_msgSend(v8, "evaluateDelegateBlockSync:", v12);

}

void __40__SKUIJSITunesStore_setPreviewOverlay::__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:setPreviewOverlayDocument:withOptions:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updateToggleStateForItem:(id)a3 toggled:(BOOL)a4 :(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SKUIJSITunesStore *v25;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToggled:", v5);
  objc_msgSend(v10, "updateItem:", v11);
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "virtualMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addManagedReference:withOwner:", v13, self);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setValue:forKey:", v9, CFSTR("itemID"));

  if (v5)
    v17 = MEMORY[0x1E0C9AAB0];
  else
    v17 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("toggled"));
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__SKUIJSITunesStore_updateToggleStateForItem_toggled::__block_invoke;
  v21[3] = &unk_1E73A2970;
  v22 = v13;
  v23 = v16;
  v24 = v15;
  v25 = self;
  v18 = v15;
  v19 = v16;
  v20 = v13;
  objc_msgSend(v12, "evaluate:completionBlock:", v21, 0);

}

void __55__SKUIJSITunesStore_updateToggleStateForItem_toggled::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)loadRentals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v4, v6);
  -[IKJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);

  objc_initWeak(&from, self);
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__SKUIJSITunesStore_loadRentals___block_invoke;
  v10[3] = &unk_1E73A2B18;
  v10[4] = self;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __33__SKUIJSITunesStore_loadRentals___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v2 = SKUIMediaPlayerFramework();
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), v2), "movieRentalsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)SKUIMediaPlayerFramework();
  v5 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalExpirationDate", v4);
  v6 = SKUIMediaPlayerFramework();
  v7 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), v6);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithValue:forProperty:comparisonType:", v9, v5, 101);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFilterPredicate:", v10);

  objc_msgSend(v3, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(a1[4], "_rentalInfoFromMediaItems:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__SKUIJSITunesStore_loadRentals___block_invoke_2;
  v15[3] = &unk_1E73A2AF0;
  objc_copyWeak(&v18, a1 + 7);
  v16 = a1[5];
  v14 = v12;
  v17 = v14;
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v15, 0);

  objc_destroyWeak(&v18);
}

void __33__SKUIJSITunesStore_loadRentals___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "callWithArguments:", v4);

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
}

- (void)loadRental:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SKUIJSITunesStore *v16;
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, v9);
  -[IKJSObject appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  objc_initWeak(&from, self);
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__SKUIJSITunesStore_loadRental::__block_invoke;
  v14[3] = &unk_1E73A2B40;
  v12 = v6;
  v15 = v12;
  v16 = self;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v13 = v9;
  v17 = v13;
  objc_msgSend(v11, "addOperationWithBlock:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __33__SKUIJSITunesStore_loadRental::__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = SKUIMediaPlayerFramework();
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), v2), "movieRentalsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SKUIMediaPlayerFramework();
  v5 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), v4);
  v6 = (void *)SKUIMediaPlayerFramework();
  v7 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v6);
  objc_msgSend(v5, "predicateWithValue:forProperty:", *(_QWORD *)(a1 + 32), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFilterPredicate:", v8);

  objc_msgSend(v3, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_rentalInfoFromMediaItems:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __33__SKUIJSITunesStore_loadRental::__block_invoke_2;
  v17[3] = &unk_1E73A2AF0;
  objc_copyWeak(&v20, (id *)(a1 + 64));
  v18 = *(id *)(a1 + 48);
  v16 = v14;
  v19 = v16;
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v17, 0);

  objc_destroyWeak(&v20);
}

void __33__SKUIJSITunesStore_loadRental::__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "callWithArguments:", v4);

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
}

- (id)_rentalInfoFromMediaItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v86;
    v68 = *(_QWORD *)v86;
    do
    {
      v7 = 0;
      v69 = v5;
      do
      {
        if (*(_QWORD *)v86 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isRental"))
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
          v10 = (void *)SKUIMediaPlayerFramework();
          v11 = *(id *)SKUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalStartDate", v10);
          v12 = (void *)SKUIMediaPlayerFramework();
          v13 = *(id *)SKUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPeriod", v12);
          v14 = (void *)SKUIMediaPlayerFramework();
          v84 = *(id *)SKUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPlaybackStartDate", v14);
          v15 = (void *)SKUIMediaPlayerFramework();
          v16 = *(id *)SKUIWeakLinkedSymbolForString("AVFileProcessorAttribute_RentalPlaybackPeriod", v15);
          v17 = (void *)SKUIMediaPlayerFramework();
          v79 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v17);
          objc_msgSend(v8, "valueForProperty:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v19 = objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("item-id"));
          v20 = (void *)SKUIMediaPlayerFramework();
          v77 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v20);
          objc_msgSend(v8, "valueForProperty:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = SKUIMediaPlayerFramework();
          objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("MPStoreDownloadManager"), v22), "sharedManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "downloadForMediaItem:", v8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = v24;
          v76 = v21;
          v82 = v16;
          v83 = v9;
          v81 = v11;
          v78 = (void *)v19;
          if (objc_msgSend(v21, "length"))
          {
            v25 = SKUICelestialFramework();
            objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("AVFileProcessor"), v25), "fileProcessor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "rentalInfo:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else if (v24)
          {
            objc_msgSend(v24, "rentalInformation");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)SKUIMediaPlayerFramework();
            v30 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalPlaybackStartTime", v29);
            v31 = (void *)SKUIMediaPlayerFramework();
            v73 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalPlaybackDuration", v31);
            v32 = (void *)SKUIMediaPlayerFramework();
            v71 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalStartTime", v32);
            v33 = (void *)SKUIMediaPlayerFramework();
            v34 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyRentalDuration", v33);
            v66 = v30;
            objc_msgSend(v8, "valueForProperty:", v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v35, "isEqualToNumber:", &unk_1E749B4B0) & 1) == 0)
            {
              v36 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v35, "doubleValue");
              objc_msgSend(v36, "dateWithTimeIntervalSinceReferenceDate:");
              v37 = objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v38 = (void *)v37;
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, v84);

              }
            }
            v39 = v13;
            objc_msgSend(v8, "valueForProperty:", v73);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, v82);
            objc_msgSend(v8, "valueForProperty:", v71);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v41, "isEqualToNumber:", &unk_1E749B4B0) & 1) == 0)
            {
              v42 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v41, "doubleValue");
              objc_msgSend(v42, "dateWithTimeIntervalSinceReferenceDate:");
              v43 = objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                v44 = (void *)v43;
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v43, v81);

              }
            }
            objc_msgSend(v8, "valueForProperty:", v34);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, v39);
            v46 = v28;
            v27 = (void *)objc_msgSend(v28, "copy");

            v11 = v81;
            v16 = v82;
            v13 = v39;
          }
          objc_msgSend(v27, "objectForKey:", v11);
          v47 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v13);
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v48;
          v50 = 0;
          v80 = v13;
          if (v47 && v48)
          {
            v51 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v49, "doubleValue");
            v50 = objc_msgSend(v51, "initWithTimeInterval:sinceDate:", v47);
          }
          objc_msgSend(v27, "objectForKey:", v84);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v16);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v53;
          v55 = 0;
          if (v52 && v53)
          {
            v56 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v54, "doubleValue");
            v55 = objc_msgSend(v56, "initWithTimeInterval:sinceDate:", v52);
          }
          objc_msgSend(v27, "objectForKey:", CFSTR("expiration-date"));
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v57;
          v72 = v54;
          v74 = (void *)v47;
          if (v50 && v55)
          {
            objc_msgSend((id)v50, "earlierDate:", v55);
            v59 = (id)objc_claimAutoreleasedReturnValue();
            if (!v59)
            {
              v60 = v49;
LABEL_41:
              objc_msgSend(v8, "title");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v62)
                objc_msgSend(v83, "setObject:forKey:", v62, CFSTR("title"));
              if (objc_msgSend(v83, "count"))
                objc_msgSend(v67, "addObject:", v83);

              v6 = v68;
              v5 = v69;
              goto LABEL_46;
            }
          }
          else
          {
            if (v55)
              v61 = (void *)v55;
            else
              v61 = (void *)v50;
            if (!(v55 | v50))
            {
              v61 = (void *)v57;
              if (!v57)
              {
                v60 = v49;
                v59 = 0;
                goto LABEL_41;
              }
            }
            v59 = v61;
          }
          v60 = v49;
          objc_msgSend(v83, "setObject:forKey:", v59, CFSTR("expiration-date"));
          goto LABEL_41;
        }
LABEL_46:
        ++v7;
      }
      while (v5 != v7);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      v5 = v63;
    }
    while (v63);
  }

  v64 = (void *)objc_msgSend(v67, "copy");
  return v64;
}

- (void)fetchTemplates:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SKUITemplateLoader *v24;
  SKUITemplateLoader *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  SKUIJSITunesStore *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v13));
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v26 = (id)objc_msgSend(v7, "callWithArguments:", &unk_1E749BAD0);

            goto LABEL_12;
          }
          v15 = (void *)v14;
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[IKJSObject appContext](self, "appContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "virtualMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addManagedReference:withOwner:", v17, self);
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __37__SKUIJSITunesStore_fetchTemplates::__block_invoke;
    v31 = &unk_1E73A2B90;
    v32 = v16;
    v33 = v17;
    v34 = v19;
    v35 = self;
    v20 = v19;
    v21 = v17;
    v22 = v16;
    v23 = _Block_copy(&v28);
    v24 = [SKUITemplateLoader alloc];
    v25 = -[SKUITemplateLoader initWithURLs:completionBlock:](v24, "initWithURLs:completionBlock:", v8, v23, v28, v29, v30, v31);
    -[SKUITemplateLoader load](v25, "load");

LABEL_12:
  }
  else
  {
    v27 = (id)objc_msgSend(v7, "callWithArguments:", &unk_1E749BAB8);
  }

}

void __37__SKUIJSITunesStore_fetchTemplates::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__SKUIJSITunesStore_fetchTemplates::__block_invoke_2;
  v12[3] = &unk_1E73A2B68;
  v13 = v6;
  v7 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = v5;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "evaluate:completionBlock:", v12, 0);

}

uint64_t __37__SKUIJSITunesStore_fetchTemplates::__block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32) == 0;
  objc_msgSend(*(id *)(a1 + 40), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v9[0] = v4;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "callWithArguments:", v6);

  return objc_msgSend(*(id *)(a1 + 56), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)fetchMSOProviderStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SKUIJSITunesStore *v18;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  v9 = SKUIVideoSubscriberAccountFramework();
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("VSAccountChannelsCenter"), v9), "sharedCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__SKUIJSITunesStore_fetchMSOProviderStatus___block_invoke;
  v14[3] = &unk_1E73A2BB8;
  v15 = v5;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v11 = v8;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "fetchAccountChannelsWithCompletionHandler:", v14);

}

void __44__SKUIJSITunesStore_fetchMSOProviderStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("providerId"));
  objc_msgSend(v3, "channelIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("providedAppTitles"));
  objc_msgSend(v3, "providerInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("providerInfo"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__SKUIJSITunesStore_fetchMSOProviderStatus___block_invoke_2;
  v13[3] = &unk_1E73A2970;
  v9 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v16 = v10;
  v17 = v11;
  v12 = v4;
  objc_msgSend(v9, "evaluate:completionBlock:", v13, 0);

}

void __44__SKUIJSITunesStore_fetchMSOProviderStatus___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "callWithArguments:", v3);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)itemStateCenterMediaLibrariesDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[IKJSObject appContext](self, "appContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SKUIJSITunesStore_itemStateCenterMediaLibrariesDidChange___block_invoke;
  v5[3] = &unk_1E73A2BE0;
  v5[4] = self;
  objc_msgSend(v4, "evaluate:completionBlock:", v5, 0);

}

id __60__SKUIJSITunesStore_itemStateCenterMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", CFSTR("onLibraryChange"), 0);
}

- (void)_finishPurchaseForOptions:(id)a3 purchaseResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SKUIJSITunesStore *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__SKUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke;
    v18[3] = &unk_1E73A29C0;
    v19 = v9;
    objc_msgSend(v8, "evaluateDelegateBlockSync:", v18);

  }
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__SKUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke_2;
  v14[3] = &unk_1E73A1B00;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v8, "evaluate:completionBlock:", v14, 0);

}

void __64__SKUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:didCompletePurchase:", v4, *(_QWORD *)(a1 + 32));

}

void __64__SKUIJSITunesStore__finishPurchaseForOptions_purchaseResponse___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
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
  id v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("options"));
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("result"));

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAFA28]))
  {
    v8 = objc_msgSend(v5, "code") == 134;

  }
  else
  {

    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("error"));

  objc_msgSend(*(id *)(a1 + 40), "responseMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;
  v25[0] = CFSTR("requestStartTime");
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
  objc_msgSend(v13, "_millisecondsFromTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("responseStartTime");
  v15 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseStartTime");
  objc_msgSend(v15, "_millisecondsFromTimeInterval:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v25[2] = CFSTR("responseEndTime");
  v17 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseEndTime");
  objc_msgSend(v17, "_millisecondsFromTimeInterval:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("performanceMetrics"));
  v20 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("metrics"));

  v21 = *(void **)(a1 + 48);
  v24 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "invokeMethod:withArguments:", CFSTR("onBuy"), v22);

}

- (void)_finishSoftwarePurchaseForOptions:(id)a3 purchaseResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SKUIJSITunesStore *v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[IKJSObject appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__SKUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke;
    v18[3] = &unk_1E73A29C0;
    v19 = v9;
    objc_msgSend(v8, "evaluateDelegateBlockSync:", v18);

  }
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __72__SKUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke_2;
  v14[3] = &unk_1E73A1B00;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v8, "evaluate:completionBlock:", v14, 0);

}

void __72__SKUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appContext:didCompleteSoftwarePurchase:", v4, *(_QWORD *)(a1 + 32));

}

void __72__SKUIJSITunesStore__finishSoftwarePurchaseForOptions_purchaseResponse___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
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
  id v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("options"));
  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("result"));

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAFA28]))
  {
    v8 = objc_msgSend(v5, "code") == 134;

  }
  else
  {

    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("error"));

  objc_msgSend(*(id *)(a1 + 40), "responseMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;
  v25[0] = CFSTR("requestStartTime");
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
  objc_msgSend(v13, "_millisecondsFromTimeInterval:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("responseStartTime");
  v15 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseStartTime");
  objc_msgSend(v15, "_millisecondsFromTimeInterval:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v25[2] = CFSTR("responseEndTime");
  v17 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "responseEndTime");
  objc_msgSend(v17, "_millisecondsFromTimeInterval:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("performanceMetrics"));
  v20 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("metrics"));

  v21 = *(void **)(a1 + 48);
  v24 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "invokeMethod:withArguments:", CFSTR("onBuy"), v22);

}

- (void)_displayWifiConnectionRequiredAlert
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_251);
}

void __56__SKUIJSITunesStore__displayWifiConnectionRequiredAlert__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0DC3458]);
  SKUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("PENDING_RENTAL_NETWORK_ERROR_MESSAGE_WIFI_ONLY"), &stru_1E73A9FB0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessage:", v1);

  SKUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PENDING_RENTAL_NETWORK_ERROR_TITLE_WIFI_ONLY"), &stru_1E73A9FB0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v3);

  SKUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E73A9FB0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButtonWithTitle:", v5);

  objc_msgSend(v6, "show");
}

- (id)_millisecondsFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(a3 * 1000.0));
}

- (void)_purchaseRequestDidSucceedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", 0x1E73AA470);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[SKUIJSITunesStore _finishPurchaseForOptions:purchaseResponse:](self, "_finishPurchaseForOptions:purchaseResponse:", 0, v6);
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithAppContext:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSITunesStore initWithAppContext:clientContext:]";
}

@end
