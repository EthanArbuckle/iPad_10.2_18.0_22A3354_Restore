@implementation TUCallProviderManager

- (TUCallProviderManager)init
{
  return -[TUCallProviderManager initWithType:](self, "initWithType:", 0);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUCallProviderManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TUCallProviderManager_addDelegate_queue___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)providerForFavoritesEntry:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallProviderManager providerForFavoritesEntryActionBundleIdentifier:](self, "providerForFavoritesEntryActionBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)providerForFavoritesEntryActionBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C965E8]))
  {
    -[TUCallProviderManager telephonyProvider](self, "telephonyProvider");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C965C0]))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__TUCallProviderManager_providerForFavoritesEntryActionBundleIdentifier___block_invoke;
      v9[3] = &unk_1E38A3580;
      v10 = v4;
      -[TUCallProviderManager providersPassingTest:](self, "providersPassingTest:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[TUCallProviderManager faceTimeProvider](self, "faceTimeProvider");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (TUCallProviderManager)initWithType:(unint64_t)a3
{
  TUCallProviderManagerXPCClient *v5;
  dispatch_queue_t v6;
  TUCallProviderManager *v7;

  v5 = objc_alloc_init(TUCallProviderManagerXPCClient);
  v6 = dispatch_queue_create("com.apple.telephonyutilities.callprovidermanager", 0);
  v7 = -[TUCallProviderManager initWithDataSource:type:queue:](self, "initWithDataSource:type:queue:", v5, a3, v6);

  return v7;
}

- (TUCallProviderManager)initWithDataSource:(id)a3 type:(unint64_t)a4 queue:(id)a5
{
  id v9;
  id v10;
  TUCallProviderManager *v11;
  TUCallProviderManager *v12;
  uint64_t v13;
  NSMapTable *delegateToQueue;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUCallProviderManager;
  v11 = -[TUCallProviderManager init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a5);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_dataSource, a3);
    -[TUCallProviderManagerDataSource setDelegate:](v12->_dataSource, "setDelegate:", v12);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v12->_delegateToQueue;
    v12->_delegateToQueue = (NSMapTable *)v13;

  }
  return v12;
}

void __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TUCallProviderManagerProvidersChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (TUCallProvider)telephonyProvider
{
  NSObject *v3;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (TUShouldUseSuperboxTelephonyProvider())
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = CFSTR("TUShouldUseSuperBoxTelephonyProvider");
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Because this is an internal install and the %@ default is set, com.apple.Superbox (aka Speakerbox)                     is acting as the telephony provider", (uint8_t *)&v7, 0xCu);
    }

    -[TUCallProviderManager superboxProvider](self, "superboxProvider");
    return (TUCallProvider *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUCallProviderManager providersByIdentifier](self, "providersByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.coretelephony"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return (TUCallProvider *)v6;
  }
}

- (NSDictionary)providersByIdentifier
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[TUCallProviderManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentProcessCanAccessInitialState");

  if (v4)
  {
    -[TUCallProviderManager dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blockUntilInitialStateReceived");

  }
  -[TUCallProviderManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providersByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TUCallProviderManager type](self, "type");
  if (v8 == 2)
  {
    -[TUCallProviderManager dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pairedHostDeviceProvidersByIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    -[TUCallProviderManager dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localProvidersByIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;

    v7 = v11;
  }
  return (NSDictionary *)v7;
}

- (TUCallProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)providersPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[TUCallProviderManager providers](self, "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TUCallProviderManager providers](self, "providers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v4[2](v4, v13))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

- (NSArray)providers
{
  void *v2;
  void *v3;
  void *v4;

  -[TUCallProviderManager providersByIdentifier](self, "providersByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

uint64_t __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "providersChangedForProviderManager:", *(_QWORD *)(a1 + 40));
}

- (void)providersChangedForDataSource:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[TUCallProviderManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TUCallProviderManager_providersChangedForDataSource___block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __43__TUCallProviderManager_addDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_QWORD *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = MEMORY[0x1E0C80D38];
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

void __55__TUCallProviderManager_providersChangedForDataSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD block[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_2;
        block[3] = &unk_1E38A1388;
        v10 = *(_QWORD *)(a1 + 32);
        block[4] = v7;
        block[5] = v10;
        dispatch_async(v9, block);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_3;
  v11[3] = &unk_1E38A1360;
  v11[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v11);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

+ (NSArray)defaultProviders
{
  void *v2;
  TUCallProvider *v3;
  void *v4;
  TUCallProvider *v5;
  void *v6;
  void *v7;
  TUCallProvider *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[TUCallProvider initWithIdentifier:]([TUCallProvider alloc], "initWithIdentifier:", CFSTR("com.apple.coretelephony"));
  -[TUCallProvider setBundleIdentifier:](v3, "setBundleIdentifier:", CFSTR("com.apple.mobilephone"));
  -[TUCallProvider setLocalizedName:](v3, "setLocalizedName:", CFSTR("Telephony"));
  -[TUCallProvider setSupportsAudioOnly:](v3, "setSupportsAudioOnly:", 1);
  -[TUCallProvider setSupportsEmergency:](v3, "setSupportsEmergency:", 1);
  -[TUCallProvider setSupportsVoicemail:](v3, "setSupportsVoicemail:", 1);
  -[TUCallProvider setSupportsRecents:](v3, "setSupportsRecents:", 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E38E93A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallProvider setSupportedHandleTypes:](v3, "setSupportedHandleTypes:", v4);

  objc_msgSend(v2, "addObject:", v3);
  v5 = -[TUCallProvider initWithIdentifier:]([TUCallProvider alloc], "initWithIdentifier:", CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"));
  TUPreferredFaceTimeBundleIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallProvider setBundleIdentifier:](v5, "setBundleIdentifier:", v6);

  -[TUCallProvider setLocalizedName:](v5, "setLocalizedName:", CFSTR("FaceTime"));
  -[TUCallProvider setSupportsAudioOnly:](v5, "setSupportsAudioOnly:", 1);
  -[TUCallProvider setSupportsAudioAndVideo:](v5, "setSupportsAudioAndVideo:", 1);
  -[TUCallProvider setSupportsRecents:](v5, "setSupportsRecents:", 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E38E93A0, &unk_1E38E93B8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallProvider setSupportedHandleTypes:](v5, "setSupportedHandleTypes:", v7);

  objc_msgSend(v2, "addObject:", v5);
  if (TUShouldCreateSuperboxProvider())
  {
    v8 = -[TUCallProvider initWithIdentifier:]([TUCallProvider alloc], "initWithIdentifier:", CFSTR("com.apple.Superbox"));
    -[TUCallProvider setLocalizedName:](v8, "setLocalizedName:", CFSTR("Superbox"));
    -[TUCallProvider setSupportsAudioOnly:](v8, "setSupportsAudioOnly:", 1);
    -[TUCallProvider setSupportsEmergency:](v8, "setSupportsEmergency:", 1);
    -[TUCallProvider setSupportsAudioAndVideo:](v8, "setSupportsAudioAndVideo:", 1);
    -[TUCallProvider setSupportsRecents:](v8, "setSupportsRecents:", 1);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E38E93A0, &unk_1E38E93B8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallProvider setSupportedHandleTypes:](v8, "setSupportedHandleTypes:", v9);

    objc_msgSend(v2, "addObject:", v8);
  }
  v10 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v10;
}

- (id)providerForRecentCall:(id)a3
{
  id v4;
  void **v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (!providerForRecentCall___kCHServiceProviderTelephony)
  {
    v5 = (void **)CUTWeakLinkSymbol();
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&providerForRecentCall___kCHServiceProviderTelephony, v6);
  }
  if (!providerForRecentCall___kCHServiceProviderFaceTime)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7)
      v8 = *v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&providerForRecentCall___kCHServiceProviderFaceTime, v8);
  }
  objc_msgSend(v4, "serviceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (providerForRecentCall___kCHServiceProviderTelephony && objc_msgSend(v9, "isEqualToString:"))
  {
    -[TUCallProviderManager telephonyProvider](self, "telephonyProvider");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (providerForRecentCall___kCHServiceProviderFaceTime && objc_msgSend(v10, "isEqualToString:"))
  {
    -[TUCallProviderManager faceTimeProvider](self, "faceTimeProvider");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUCallProviderManager providerWithIdentifier:](self, "providerWithIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (TUCallProvider)faceTimeProvider
{
  void *v2;
  void *v3;

  -[TUCallProviderManager providersByIdentifier](self, "providersByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCallProvider *)v3;
}

- (id)providerWithIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.private.expanse")) & 1) != 0)
    v5 = CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider");
  else
    v5 = (__CFString *)v4;
  -[TUCallProviderManager providersByIdentifier](self, "providersByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TUCallProviderManagerDataSource invalidate](self->_dataSource, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUCallProviderManager;
  -[TUCallProviderManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (TUCallProviderManager)initWithLocalProviders
{
  return -[TUCallProviderManager initWithType:](self, "initWithType:", 1);
}

- (TUCallProviderManager)initWithPairedHostDeviceProviders
{
  return -[TUCallProviderManager initWithType:](self, "initWithType:", 2);
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUCallProviderManager providers](self, "providers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p providers=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (TUCallProvider)superboxProvider
{
  void *v2;
  void *v3;

  -[TUCallProviderManager providersByIdentifier](self, "providersByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.Superbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCallProvider *)v3;
}

- (TUCallProvider)tinCanProvider
{
  void *v2;
  void *v3;

  -[TUCallProviderManager providersByIdentifier](self, "providersByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.telephonyutilities.callservicesd.TinCan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCallProvider *)v3;
}

- (id)providerWithService:(int)a3 video:(BOOL *)a4
{
  BOOL v5;
  void *v6;

  if (a3 == 3)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        -[TUCallProviderManager telephonyProvider](self, "telephonyProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        if (!a4)
          return v6;
      }
      else
      {
        v6 = 0;
        if (!a4)
          return v6;
      }
      goto LABEL_8;
    }
  }
  -[TUCallProviderManager faceTimeProvider](self, "faceTimeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_8:
    *a4 = v5;
  return v6;
}

+ (int)serviceForProvider:(id)a3 video:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  int v10;
  int v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.coretelephony"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"));

    if (v4)
      v11 = 3;
    else
      v11 = 2;
    if (v10)
      v8 = v11;
    else
      v8 = 0;
  }

  return v8;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[TUCallProviderManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__TUCallProviderManager_removeDelegate___block_invoke;
  block[3] = &unk_1E38A1388;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __40__TUCallProviderManager_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

uint64_t __73__TUCallProviderManager_providerForFavoritesEntryActionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUCallProviderManager dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "donateUserIntentForProviderWithIdentifier:", v4);

}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "isValid"))
  {
    objc_msgSend(v6, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSystemProvider");

    if (!v10)
    {
      -[TUCallProviderManager dataSource](self, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke;
      v20[3] = &unk_1E38A1448;
      v21 = v7;
      objc_msgSend(v19, "launchAppForDialRequest:completion:", v6, v20);

      v7 = 0;
      v18 = 0;
      goto LABEL_14;
    }
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Opening URL because dial request is using a system provider", buf, 2u);
    }

    v12 = objc_msgSend(v6, "dialType") == 1;
    -[TUCallProviderManager dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v13, "openURL:isSensitive:error:", v14, v12, &v22);
    v15 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot launch app for invalid dial request: %@"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TUDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TUCallProviderManager launchAppForDialRequest:completion:].cold.1((uint64_t)v13, v16);

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.TelephonyUtilities"), 1, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v15;

  if (v7)
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
LABEL_14:

}

void __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke_2;
    v6[3] = &unk_1E38A1FC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setDelegateToQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateToQueue, a3);
}

- (id)dialRequestForRecentCall:(id)a3
{
  id v4;
  void *v5;
  TUDialRequest *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned __int8 v20;
  __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallProviderManager providerForRecentCall:](self, "providerForRecentCall:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[TUDialRequest initWithProvider:]([TUDialRequest alloc], "initWithProvider:", v5);
    objc_msgSend(v4, "validRemoteParticipantHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v4, "validRemoteParticipantHandles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "type") == 2 && objc_msgSend(v5, "isTelephonyProvider"))
      {
        v20 = 0;
        objc_msgSend(v4, "isoCountryCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = TUNumberToDialOptionsSuppressLocalAssistKey;
        v22[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        TUNumberToDial(v12, v11, 0, v13, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUDialRequest setDialAssisted:](v6, "setDialAssisted:", v20);
        +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v14, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUDialRequest setHandle:](v6, "setHandle:", v15);

      }
      else
      {
        +[TUHandle handlesForCHRecentCall:validHandlesOnly:](TUHandle, "handlesForCHRecentCall:validHandlesOnly:", v4, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUDialRequest setHandles:](v6, "setHandles:", v17);

      }
    }
    objc_msgSend(v4, "outgoingLocalParticipantUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUDialRequest setLocalSenderIdentityAccountUUID:](v6, "setLocalSenderIdentityAccountUUID:", v18);

    -[TUDialRequest setPerformDialAssist:](v6, "setPerformDialAssist:", 0);
    -[TUDialRequest setPerformLocalDialAssist:](v6, "setPerformLocalDialAssist:", 0);
    -[TUDialRequest setTtyType:](v6, "setTtyType:", +[TUDialRequest dialRequestTTYTypeForCHRecentCallTTYType:](TUDialRequest, "dialRequestTTYTypeForCHRecentCallTTYType:", objc_msgSend(v4, "ttyType")));
    -[TUDialRequest setVideo:](v6, "setVideo:", objc_msgSend(v4, "mediaType") == 2);
    -[TUDialRequest setOriginatingUIType:](v6, "setOriginatingUIType:", 8);
  }
  else
  {
    TUDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TUCallProviderManager(CallHistoryAdditions) dialRequestForRecentCall:].cold.1((uint64_t)v4, v16);

    v6 = 0;
  }

  return v6;
}

- (id)joinConversationRequestForRecentCall:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TUConversationMember *v13;
  void *v14;
  TUConversationMember *v15;
  TUJoinConversationRequest *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "validRemoteParticipantHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[TUHandle handlesForCHRecentCall:validHandlesOnly:](TUHandle, "handlesForCHRecentCall:validHandlesOnly:", v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (v12)
        {
          v13 = [TUConversationMember alloc];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[TUConversationMember initWithHandles:](v13, "initWithHandles:", v14);

          objc_msgSend(v6, "addObject:", v15);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v6, "count"))
  {
    v16 = -[TUJoinConversationRequest initWithRemoteMembers:]([TUJoinConversationRequest alloc], "initWithRemoteMembers:", v6);
    -[TUJoinConversationRequest setVideo:](v16, "setVideo:", objc_msgSend(v3, "mediaType") == 2);
    -[TUJoinConversationRequest setVideoEnabled:](v16, "setVideoEnabled:", objc_msgSend(v3, "mediaType") == 2);
    -[TUCallProviderManager faceTimeProvider](self, "faceTimeProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "outgoingLocalParticipantUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "senderIdentityForAccountUUID:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[NSObject handle](v19, "handle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUJoinConversationRequest setCallerID:](v16, "setCallerID:", v20);

    }
    +[TUCallProviderManager invitationPreferencesForRecentCall](TUCallProviderManager, "invitationPreferencesForRecentCall");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest setInvitationPreferences:](v16, "setInvitationPreferences:", v21);

  }
  else
  {
    TUDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v3;
      _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Could not create join request for recent call: %@", buf, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

+ (NSSet)invitationPreferencesForRecentCall
{
  TUConversationInvitationPreference *v2;
  TUConversationInvitationPreference *v3;
  TUConversationInvitationPreference *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 2, 6);
  v3 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 3, 6, v2);
  v8[1] = v3;
  v4 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 1, 6);
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  return (NSSet *)v6;
}

- (void)launchAppForDialRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
