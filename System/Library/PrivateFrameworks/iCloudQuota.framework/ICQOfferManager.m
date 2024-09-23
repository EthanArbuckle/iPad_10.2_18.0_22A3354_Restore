@implementation ICQOfferManager

- (id)_refreshOfferWithDaemonOfferDict:(id)a3 offerRequestType:(int64_t)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  ICQOfferManager *v25;
  _QWORD block[6];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 5:
      objc_opt_class();
      break;
    default:
      break;
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = (void *)objc_msgSend([v10 alloc], "initWithDictionary:", v8);
  objc_msgSend(v11, "serverDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v25 = self;
    -[objc_class isEqual:](v10, "isEqual:", objc_opt_class());
    v13 = (objc_class *)objc_opt_class();
    objc_msgSend(v11, "appLaunchLinkForBundleID:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [v13 alloc];
    objc_msgSend(v11, "serverDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountAltDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "retrievalDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callbackInterval");
    v12 = (void *)objc_msgSend(v15, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:", v16, v17, v18, v19, v14, v9);

    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "Fetched offer type: %@", buf, 0xCu);

    }
    if (a4 != 4)
      -[ICQOfferManager setCachedOfferForType:daemonOffer:bundleIdentifier:](v25, "setCachedOfferForType:daemonOffer:bundleIdentifier:", a4, v11, v9);
    if (objc_msgSend(v11, "failedToFetchFromServer"))
    {
      _ICQGetLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "failureDetails");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, "failed to fetch offer from server; details: %@",
          buf,
          0xCu);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__ICQOfferManager__refreshOfferWithDaemonOfferDict_offerRequestType_bundleId___block_invoke;
      block[3] = &unk_1E8B38B88;
      block[4] = v25;
      block[5] = a4;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
  return v12;
}

- (NSMutableDictionary)cachedOffers
{
  return self->_cachedOffers;
}

- (void)setCachedOffers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOffers, a3);
}

- (ICQUnfairLock)cachedOffersLock
{
  return self->_cachedOffersLock;
}

- (void)_registerForDarwinNotification:(id)a3
{
  __CFString *v4;
  ICQOfferManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v12;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[ICQOfferManager registeredDarwinNotifications](v5, "registeredDarwinNotifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      -[ICQOfferManager setRegisteredDarwinNotifications:](v5, "setRegisteredDarwinNotifications:", v7);

    }
    -[ICQOfferManager registeredDarwinNotifications](v5, "registeredDarwinNotifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 || (objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      _ICQGetLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "registering for darwin notification %@", (uint8_t *)&v13, 0xCu);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handlePushReceivedDarwinNotification, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      -[ICQOfferManager registeredDarwinNotifications](v5, "registeredDarwinNotifications");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);

    }
  }
  objc_sync_exit(v5);

}

- (NSMutableDictionary)registeredDarwinNotifications
{
  return self->_registeredDarwinNotifications;
}

- (void)setRegisteredDarwinNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_registeredDarwinNotifications, a3);
}

void __37__ICQOfferManager_sharedOfferManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedOfferManager_sOfferManager;
  sharedOfferManager_sOfferManager = (uint64_t)v0;

}

- (ICQOfferManager)init
{
  ICQOfferManager *v2;
  ICQUnfairLock *v3;
  ICQUnfairLock *cachedOffersLock;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQOfferManager;
  v2 = -[ICQOfferManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICQUnfairLock);
    cachedOffersLock = v2->_cachedOffersLock;
    v2->_cachedOffersLock = v3;

    v5 = (id)objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  }
  return v2;
}

- (void)getOfferWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager getOfferForBundleIdentifier:completion:](self, "getOfferForBundleIdentifier:completion:", v5, v4);

}

+ (id)defaultBundleIdentifier
{
  if (defaultBundleIdentifier_onceToken != -1)
    dispatch_once(&defaultBundleIdentifier_onceToken, &__block_literal_global_8);
  return (id)defaultBundleIdentifier_sDefaultBundleIdentifier;
}

- (void)getOfferForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ICQOfferManager_getOfferForBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E8B389E0;
  v9 = v6;
  v7 = v6;
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", a3, 0, 0, v8);

}

- (void)_getOfferForBundleIdentifier:(id)a3 options:(id)a4 offerContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "aa_primaryAppleAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__ICQOfferManager__getOfferForBundleIdentifier_options_offerContext_completion___block_invoke;
    v16[3] = &unk_1E8B38AE8;
    v17 = v14;
    v18 = v13;
    -[ICQOfferManager _getOfferForAccount:bundleIdentifier:options:offerContext:completion:](self, "_getOfferForAccount:bundleIdentifier:options:offerContext:completion:", v15, v10, v11, v12, v16);

  }
  else
  {
    -[ICQOfferManager removeCachedOfferForType:](self, "removeCachedOfferForType:", +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", v11, v10, objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.purplebuddy"))));
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

}

uint64_t __58__ICQOfferManager_getOfferForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__ICQOfferManager_defaultBundleIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
    v2 = (__CFString *)v0;
  else
    v2 = &stru_1E8B3C468;
  objc_storeStrong((id *)&defaultBundleIdentifier_sDefaultBundleIdentifier, v2);

}

+ (id)sharedOfferManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICQOfferManager_sharedOfferManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedOfferManager_onceToken != -1)
    dispatch_once(&sharedOfferManager_onceToken, block);
  return (id)sharedOfferManager_sOfferManager;
}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void (*v19)(void);
  NSObject *v20;
  uint64_t v21;
  double v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[24];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _ICQSignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0CB3940];
    if (v6)
      v14 = v6;
    else
      v14 = &stru_1E8B3C468;
    v15 = v11;
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v34 = v12;
    *(_WORD *)&v34[8] = 2112;
    *(_QWORD *)&v34[10] = v16;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "GetOffer", "%@ %@", buf, 0x16u);

  }
  _ICQSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v22 = (double)Nanoseconds / 1000000000.0;
    v23 = *(unsigned __int16 *)(a1 + 64);
    v24 = (void *)objc_opt_class();
    v25 = v24;
    v26 = (void *)MEMORY[0x1E0CB3940];
    if (v6)
      v27 = v6;
    else
      v27 = &stru_1E8B3C468;
    v28 = v24;
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v34 = v23;
    *(_WORD *)&v34[4] = 2048;
    *(double *)&v34[6] = v22;
    *(_WORD *)&v34[14] = 2112;
    *(_QWORD *)&v34[16] = v25;
    v35 = 2112;
    v36 = v29;
    _os_log_debug_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) GetOffer %@ %@", buf, 0x26u);

  }
  if (!v5
    || v6
    || !objc_msgSend(*(id *)(a1 + 32), "_shouldUseOffer:forBundleIdentifier:", v5, *(_QWORD *)(a1 + 40)))
  {
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_15:
    v19();
    goto LABEL_16;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_offerTypeMatchesRequestOptions:offer:", *(_QWORD *)(a1 + 48), v5) & 1) == 0)
  {
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_cold_1((uint64_t *)(a1 + 48), v20, v21);

    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_15;
  }
  if (!objc_msgSend(v5, "showsPhotoVideoCounts"))
  {
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_15;
  }
  v18 = *(_QWORD *)(a1 + 40);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_39;
  v30[3] = &unk_1E8B38B10;
  v31 = v5;
  v32 = *(id *)(a1 + 56);
  +[_ICQDeviceInfo getInfoWithBundleId:completion:](_ICQDeviceInfo, "getInfoWithBundleId:completion:", v18, v30);

LABEL_16:
}

uint64_t __80__ICQOfferManager__getOfferForBundleIdentifier_options_offerContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__ICQOfferManager__refreshOfferWithDaemonOfferDict_offerRequestType_bundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownInvalidationTimerForRequestType:", *(_QWORD *)(a1 + 40));
}

void __65__ICQOfferManager_getPremiumOfferForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v7;
  else
    v6 = 0;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, v5);

}

void __62__ICQOfferManager__setupTimerForRegularOfferInvalidationDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_teardownRegularOfferInvalidationTimer");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel__firedRegularOfferInvalidationTimer_, 0, 0, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v6;

}

void __62__ICQOfferManager__setupTimerForPremiumOfferInvalidationDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_teardownPremiumOfferInvalidationTimer");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel__firedPremiumOfferInvalidationTimer_, 0, 0, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

}

void __38__ICQOfferManager_cachedOfferForType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedOffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "offer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)getPremiumOfferForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ICQOfferManager _premiumOptions](self, "_premiumOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ICQOfferManager_getPremiumOfferForBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E8B389E0;
  v11 = v6;
  v9 = v6;
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", v7, v8, 0, v10);

}

- (void)getDefaultOfferWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("isDefaultOffer");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", v5, v6, 0, v4);

}

- (id)cachedOfferForType:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  -[ICQOfferManager cachedOffersLock](self, "cachedOffersLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ICQOfferManager_cachedOfferForType___block_invoke;
  v8[3] = &unk_1E8B38BB0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v5, "synchronized:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_teardownRegularOfferInvalidationTimer
{
  NSTimer *regularOfferInvalidationTimer;

  if (-[NSTimer isValid](self->_regularOfferInvalidationTimer, "isValid"))
    -[NSTimer invalidate](self->_regularOfferInvalidationTimer, "invalidate");
  regularOfferInvalidationTimer = self->_regularOfferInvalidationTimer;
  self->_regularOfferInvalidationTimer = 0;

}

- (void)_teardownPremiumOfferInvalidationTimer
{
  NSTimer *premiumOfferInvalidationTimer;

  if (-[NSTimer isValid](self->_premiumOfferInvalidationTimer, "isValid"))
    -[NSTimer invalidate](self->_premiumOfferInvalidationTimer, "invalidate");
  premiumOfferInvalidationTimer = self->_premiumOfferInvalidationTimer;
  self->_premiumOfferInvalidationTimer = 0;

}

- (void)_teardownInvalidationTimerForRequestType:(int64_t)a3
{
  if (a3 == 2)
  {
    -[ICQOfferManager _teardownPremiumOfferInvalidationTimer](self, "_teardownPremiumOfferInvalidationTimer");
  }
  else if (a3 == 3)
  {
    -[ICQOfferManager _teardownRegularOfferInvalidationTimer](self, "_teardownRegularOfferInvalidationTimer");
  }
}

- (BOOL)_shouldUseOffer:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = objc_msgSend(a3, "offerType") != 1
    || !objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow"))
    || +[ICQDaemonOfferConditions isPhotosCloudEnabled](ICQDaemonOfferConditions, "isPhotosCloudEnabled");

  return v6;
}

- (void)_setupTimerForRegularOfferInvalidationDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ICQOfferManager__setupTimerForRegularOfferInvalidationDate___block_invoke;
  v6[3] = &unk_1E8B38C50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_setupTimerForPremiumOfferInvalidationDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ICQOfferManager__setupTimerForPremiumOfferInvalidationDate___block_invoke;
  v6[3] = &unk_1E8B38C50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_setupTimerForInvalidationDate:(id)a3 forType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = v6;
    -[ICQOfferManager _setupTimerForPremiumOfferInvalidationDate:](self, "_setupTimerForPremiumOfferInvalidationDate:", v6);
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v7 = v6;
    -[ICQOfferManager _setupTimerForRegularOfferInvalidationDate:](self, "_setupTimerForRegularOfferInvalidationDate:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (id)_premiumOptions
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("isPremiumOffer");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_offerTypeMatchesRequestOptions:(id)a3 offer:(id)a4
{
  id v5;
  int64_t v6;
  char isKindOfClass;

  if (!a4)
    return 1;
  v5 = a4;
  v6 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", a3, 0, 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return v6 == 2;
  else
    return v6 != 2;
}

- (void)_getOfferForAccount:(id)a3 bundleIdentifier:(id)a4 options:(id)a5 offerContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(void *, void *, _QWORD);
  uint64_t v30;
  int64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  void (**v43)(void *, void *, _QWORD);
  int64_t v44;
  _QWORD aBlock[5];
  id v46;
  id v47;
  id v48;
  os_signpost_id_t v49;
  uint64_t v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  _ICQSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  v19 = _ICQSignpostCreateWithObject(v17, v18);
  v21 = v20;

  _ICQSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v19, "GetOffer", " enableTelemetry=YES options: %@", buf, 0xCu);
  }
  v24 = v12;

  _ICQSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[ICQOfferManager _getOfferForAccount:bundleIdentifier:options:offerContext:completion:].cold.1(v19, (uint64_t)v14, v25);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke;
  aBlock[3] = &unk_1E8B38B38;
  v49 = v19;
  v50 = v21;
  aBlock[4] = self;
  v26 = v13;
  v46 = v26;
  v27 = v14;
  v47 = v27;
  v28 = v16;
  v48 = v28;
  v29 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  v30 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.purplebuddy"));
  v31 = +[_ICQHelperFunctions _getOfferRequestTypeFromOptions:bundleId:isBuddy:](_ICQHelperFunctions, "_getOfferRequestTypeFromOptions:bundleId:isBuddy:", v27, v26, v30);
  if ((v30 & 1) == 0)
  {
    -[ICQOfferManager cachedOfferForType:](self, "cachedOfferForType:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32 && (objc_msgSend(v32, "isExpired") & 1) == 0)
    {
      objc_msgSend(v33, "bundleIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v40, "isEqualToString:", v26) & 1) != 0)
      {
        objc_msgSend(v33, "accountAltDSID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "aa_altDSID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v39, "isEqualToString:", v37);

        if (v38)
        {
          _ICQGetLogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", v31);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = v35;
            _os_log_impl(&dword_1CDEBD000, v34, OS_LOG_TYPE_DEFAULT, "Returning cached offer %@", buf, 0xCu);

          }
          v29[2](v29, v33, 0);
          goto LABEL_24;
        }
      }
      else
      {

      }
    }
    -[ICQOfferManager removeCachedOfferForType:](self, "removeCachedOfferForType:", v31);

  }
  if (v27)
    v36 = (void *)objc_msgSend(v27, "mutableCopy");
  else
    v36 = (void *)objc_opt_new();
  v33 = v36;
  if (v26)
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v26, CFSTR("bundleIdentifier"));
  if (v15)
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v15, CFSTR("contextDictionary"));
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_41;
  v41[3] = &unk_1E8B38B60;
  v41[4] = self;
  v44 = v31;
  v42 = v26;
  v43 = v29;
  -[ICQOfferManager _funnelCloudServerOfferForAccount:options:completion:](self, "_funnelCloudServerOfferForAccount:options:completion:", v12, v33, v41);

LABEL_24:
}

- (void)_funnelCloudServerOfferForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Getting offer from ind with options %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = objc_alloc_init((Class)getINDaemonConnectionClass());
  objc_msgSend(v11, "iCloudServerOfferForAccount:options:completion:", v9, v7, v8);

}

- (void)dealloc
{
  objc_super v3;

  -[ICQOfferManager _teardownRegularOfferInvalidationTimer](self, "_teardownRegularOfferInvalidationTimer");
  -[ICQOfferManager _teardownPremiumOfferInvalidationTimer](self, "_teardownPremiumOfferInvalidationTimer");
  -[ICQOfferManager _unregisterForAllDarwinNotifications](self, "_unregisterForAllDarwinNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICQOfferManager;
  -[ICQOfferManager dealloc](&v3, sel_dealloc);
}

- (id)currentOffer
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager currentOfferForBundleIdentifier:](self, "currentOfferForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentPremiumOffer
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager currentPremiumOfferForBundleIdentifier:](self, "currentPremiumOfferForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentDefaultOffer
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("isDefaultOffer");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager _currentOfferForBundleIdentifier:options:](self, "_currentOfferForBundleIdentifier:options:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentOfferForBundleIdentifier:(id)a3
{
  return -[ICQOfferManager _currentOfferForBundleIdentifier:options:](self, "_currentOfferForBundleIdentifier:options:", a3, 0);
}

- (id)currentPremiumOfferForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICQOfferManager _premiumOptions](self, "_premiumOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager _currentOfferForBundleIdentifier:options:](self, "_currentOfferForBundleIdentifier:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Received incorrect class %@ when requesting currentPremiumOffer for bundle ID %@", (uint8_t *)&v12, 0x16u);

      }
    }
    else if (v9)
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Offer received was nil when requesting currentPremiumOffer for bundle ID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (void)getPremiumOfferWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager getPremiumOfferForBundleIdentifier:completion:](self, "getPremiumOfferForBundleIdentifier:completion:", v5, v4);

}

- (void)getPremiumOfferAndOpportunityBubbleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager getPremiumOfferAndOpportunityBubbleForBundleIdentifier:completion:](self, "getPremiumOfferAndOpportunityBubbleForBundleIdentifier:completion:", v5, v4);

}

- (void)getPremiumOfferAndOpportunityBubbleForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Requested a premium offer with an opportunity bubble.", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E8B38A30;
  v11 = v6;
  v9 = v6;
  -[ICQOfferManager getPremiumOfferForBundleIdentifier:completion:](self, "getPremiumOfferForBundleIdentifier:completion:", v7, v10);

}

void __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke_2;
  v9[3] = &unk_1E8B38A08;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "shouldShowOpportunityBubbleWithCompletion:", v9);

}

void __85__ICQOfferManager_getPremiumOfferAndOpportunityBubbleForBundleIdentifier_completion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "opportunityBubble");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Returning premium offer %@, opportunity bubble %@, error %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)postBackupRestoredOffer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = CFSTR("backupRestoreComplete");
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ICQOfferManager_postBackupRestoredOffer___block_invoke;
  v7[3] = &unk_1E8B389E0;
  v8 = v4;
  v6 = v4;
  -[ICQOfferManager getEventOfferWithOptions:completion:](self, "getEventOfferWithOptions:completion:", v5, v7);

}

void __43__ICQOfferManager_postBackupRestoredOffer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Backup restore offer found: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__ICQOfferManager_postBackupRestoredOffer___block_invoke_cold_1((uint64_t)v6, v8, v9);

    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Reverting to original backup restore notification", (uint8_t *)&v10, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getOfferForBundleIdentifier:(id)a3 offerContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ICQOfferManager_getOfferForBundleIdentifier_offerContext_completion___block_invoke;
  v10[3] = &unk_1E8B389E0;
  v11 = v8;
  v9 = v8;
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", a3, 0, a4, v10);

}

uint64_t __71__ICQOfferManager_getOfferForBundleIdentifier_offerContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPremiumOfferForBundleIdentifier:(id)a3 offerContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICQOfferManager _premiumOptions](self, "_premiumOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__ICQOfferManager_getPremiumOfferForBundleIdentifier_offerContext_completion___block_invoke;
  v13[3] = &unk_1E8B389E0;
  v14 = v8;
  v12 = v8;
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", v10, v11, v9, v13);

}

void __78__ICQOfferManager_getPremiumOfferForBundleIdentifier_offerContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v7;
  else
    v6 = 0;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, v5);

}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("iCloudAppLaunchLinkPresentationDate"));

  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICQOfferManager appLaunchLinkDidPresentForBundleIdentifier:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  -[ICQOfferManager cachedOffersLock](self, "cachedOffersLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke;
  v18[3] = &unk_1E8B38A58;
  v18[4] = self;
  objc_msgSend(v15, "synchronized:", v18);

  _ICQGetLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "Sending AppLaunch event to ind with bundleId %@", buf, 0xCu);
  }

  v17 = objc_alloc_init((Class)getINDaemonConnectionClass());
  objc_msgSend(v17, "appLaunchLinkDidPresentForBundleIdentifier:completion:", v4, &__block_literal_global_24);

}

uint64_t __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCachedOffers:", 0);
}

void __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_22_cold_2(v2, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_22_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (BOOL)shouldPresentAppLaunchLink:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v3 = a3;
  if (!v3)
    goto LABEL_3;
  v4 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", CFSTR("iCloudAppLaunchLinkPresentationDate"));
  v6 = (void *)objc_msgSend(v4, "initWithTimeIntervalSince1970:");

  objc_msgSend(v3, "minDisplayIntervalDays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v6, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "day");

  if (v8 <= v12)
    v13 = 1;
  else
LABEL_3:
    v13 = 0;

  return v13;
}

- (void)getEventOfferWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "defaultBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v9 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isEventOffer"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke;
  aBlock[3] = &unk_1E8B389E0;
  v15 = v7;
  v11 = v7;
  v12 = _Block_copy(aBlock);
  v13 = (void *)objc_msgSend(v10, "copy");
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", v8, v13, 0, v12);

}

void __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "offer: %@ and error: %@", (uint8_t *)&v20, 0x16u);

  }
  if (v5
    && (objc_msgSend(v5, "offerId"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", &stru_1E8B3C468),
        v9,
        v10))
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v19();

}

- (id)_currentOfferForBundleIdentifier:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v8 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__ICQOfferManager__currentOfferForBundleIdentifier_options___block_invoke;
  v12[3] = &unk_1E8B38AC0;
  v14 = &v15;
  v9 = v8;
  v13 = v9;
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", v6, v7, 0, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__ICQOfferManager__currentOfferForBundleIdentifier_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch offer. Error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setDeviceInfo:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Fetch offer completed with error: (%@)", (uint8_t *)&v12, 0xCu);
  }

  v8 = 0;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_refreshOfferWithDaemonOfferDict:offerRequestType:bundleId:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppVersionId:", v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeCachedOfferForType:(int64_t)a3
{
  -[ICQOfferManager setCachedOfferForType:daemonOffer:bundleIdentifier:](self, "setCachedOfferForType:daemonOffer:bundleIdentifier:", a3, 0, 0);
}

- (void)setCachedOfferForType:(int64_t)a3 daemonOffer:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  ICQOfferManager *v20;
  id v21;
  id v22;
  int64_t v23;
  uint8_t buf[4];
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager cachedOffersLock](self, "cachedOffersLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __70__ICQOfferManager_setCachedOfferForType_daemonOffer_bundleIdentifier___block_invoke;
  v19 = &unk_1E8B38BD8;
  v20 = self;
  v23 = a3;
  v12 = v8;
  v21 = v12;
  v13 = v9;
  v22 = v13;
  objc_msgSend(v11, "synchronized:", &v16);

  +[_ICQHelperFunctions _darwinNotificationNameForRequestType:](_ICQHelperFunctions, "_darwinNotificationNameForRequestType:", a3, v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICQOfferManager _registerForDarwinNotification:](self, "_registerForDarwinNotification:", v14);
    if (v10)
LABEL_3:
      -[ICQOfferManager _setupTimerForInvalidationDate:forType:](self, "_setupTimerForInvalidationDate:forType:", v10, a3);
  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = a3;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "Found no notification to observe for offerRequestType: %ld", buf, 0xCu);
    }

    if (v10)
      goto LABEL_3;
  }

}

void __70__ICQOfferManager_setCachedOfferForType_daemonOffer_bundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  ICQOfferCacheObject *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cachedOffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setCachedOffers:", v3);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[ICQOfferCacheObject initWithDaemonOffer:bundleIdentifier:]([ICQOfferCacheObject alloc], "initWithDaemonOffer:bundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "cachedOffers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

- (void)_refetchRegularOffer
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  -[ICQOfferManager cachedOfferForType:](self, "cachedOfferForType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQOfferManager removeCachedOfferForType:](self, "removeCachedOfferForType:", 3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__ICQOfferManager__refetchRegularOffer__block_invoke;
  aBlock[3] = &unk_1E8B38C00;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v4)
    -[ICQOfferManager getOfferForBundleIdentifier:completion:](self, "getOfferForBundleIdentifier:completion:", v4, v5);
  else
    -[ICQOfferManager getOfferWithCompletion:](self, "getOfferWithCompletion:", v5);

}

void __39__ICQOfferManager__refetchRegularOffer__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICQOfferManager__refetchRegularOffer__block_invoke_2;
  block[3] = &unk_1E8B38A58;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __39__ICQOfferManager__refetchRegularOffer__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICQCurrentOfferChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_refetchPremiumOffer
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  -[ICQOfferManager cachedOfferForType:](self, "cachedOfferForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQOfferManager removeCachedOfferForType:](self, "removeCachedOfferForType:", 2);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__ICQOfferManager__refetchPremiumOffer__block_invoke;
  aBlock[3] = &unk_1E8B38C28;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v4)
    -[ICQOfferManager getPremiumOfferForBundleIdentifier:completion:](self, "getPremiumOfferForBundleIdentifier:completion:", v4, v5);
  else
    -[ICQOfferManager getPremiumOfferWithCompletion:](self, "getPremiumOfferWithCompletion:", v5);

}

void __39__ICQOfferManager__refetchPremiumOffer__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICQOfferManager__refetchPremiumOffer__block_invoke_2;
  block[3] = &unk_1E8B38A58;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __39__ICQOfferManager__refetchPremiumOffer__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICQCurrentPremiumOfferChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_refetchDefaultOffer
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[ICQOfferManager cachedOfferForType:](self, "cachedOfferForType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQOfferManager removeCachedOfferForType:](self, "removeCachedOfferForType:", 1);
  v7 = CFSTR("isDefaultOffer");
  v8[0] = &unk_1E8B51720;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__ICQOfferManager__refetchDefaultOffer__block_invoke;
  v6[3] = &unk_1E8B38C00;
  v6[4] = self;
  -[ICQOfferManager _getOfferForBundleIdentifier:options:offerContext:completion:](self, "_getOfferForBundleIdentifier:options:offerContext:completion:", v4, v5, 0, v6);

}

void __39__ICQOfferManager__refetchDefaultOffer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch offer. Error: %@", buf, 0xCu);
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__ICQOfferManager__refetchDefaultOffer__block_invoke_55;
    block[3] = &unk_1E8B38A58;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __39__ICQOfferManager__refetchDefaultOffer__block_invoke_2;
  v7[3] = &unk_1E8B38A58;
  v7[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __39__ICQOfferManager__refetchDefaultOffer__block_invoke_55(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICQCurrentDefaultOfferChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __39__ICQOfferManager__refetchDefaultOffer__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICQCurrentDefaultOfferChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)fetchOfferIfNeeded
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke;
  v3[3] = &unk_1E8B38C00;
  v3[4] = self;
  -[ICQOfferManager getOfferWithCompletion:](self, "getOfferWithCompletion:", v3);
  return 1;
}

void __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke_2;
  block[3] = &unk_1E8B38A58;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__ICQOfferManager_fetchOfferIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICQCurrentOfferChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_unregisterForDarwinNotification:(id)a3
{
  __CFString *v4;
  ICQOfferManager *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ICQOfferManager registeredDarwinNotifications](v5, "registeredDarwinNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "unregistering for darwin notification %@", (uint8_t *)&v12, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v5, v4, 0);
    -[ICQOfferManager registeredDarwinNotifications](v5, "registeredDarwinNotifications");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v4);

  }
  objc_sync_exit(v5);

}

- (void)_unregisterForAllDarwinNotifications
{
  -[ICQOfferManager _unregisterForDarwinNotification:](self, "_unregisterForDarwinNotification:", CFSTR("ICQDaemonOfferChangedDueToPushDarwinNotificationRegular"));
  -[ICQOfferManager _unregisterForDarwinNotification:](self, "_unregisterForDarwinNotification:", CFSTR("ICQDaemonOfferChangedDueToPushDarwinNotificationPremium"));
  -[ICQOfferManager _unregisterForDarwinNotification:](self, "_unregisterForDarwinNotification:", CFSTR("ICQDaemonOfferChangedDueToPushDarwinNotificationDefault"));
}

- (void)_handlePushReceivedDarwinNotificationRequestType:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.RemoteiCloudQuotaUI"));

  if (a3 == 1 || (v7 & 1) == 0)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "push received -- refetching offer type %@", (uint8_t *)&v10, 0xCu);

    }
    switch(a3)
    {
      case 1:
        -[ICQOfferManager _refetchDefaultOffer](self, "_refetchDefaultOffer");
        break;
      case 2:
        -[ICQOfferManager _refetchPremiumOffer](self, "_refetchPremiumOffer");
        break;
      case 3:
        -[ICQOfferManager _refetchRegularOffer](self, "_refetchRegularOffer");
        break;
    }
  }
}

- (void)_firedRegularOfferInvalidationTimer:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "offer expired -- refetching", v5, 2u);
  }

  -[ICQOfferManager _teardownRegularOfferInvalidationTimer](self, "_teardownRegularOfferInvalidationTimer");
  -[ICQOfferManager _refetchRegularOffer](self, "_refetchRegularOffer");
}

- (void)_firedPremiumOfferInvalidationTimer:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Premium offer expired -- refetching", v5, 2u);
  }

  -[ICQOfferManager _teardownPremiumOfferInvalidationTimer](self, "_teardownPremiumOfferInvalidationTimer");
  -[ICQOfferManager _refetchPremiumOffer](self, "_refetchPremiumOffer");
}

- (void)setCachedOffersLock:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOffersLock, a3);
}

- (NSMutableDictionary)dismissedRecommendations
{
  return self->_dismissedRecommendations;
}

- (void)setDismissedRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_dismissedRecommendations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedRecommendations, 0);
  objc_storeStrong((id *)&self->_cachedOffersLock, 0);
  objc_storeStrong((id *)&self->_registeredDarwinNotifications, 0);
  objc_storeStrong((id *)&self->_cachedOffers, 0);
  objc_storeStrong((id *)&self->_premiumOfferInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_regularOfferInvalidationTimer, 0);
}

+ (id)defaultPlaceholderKeys
{
  return +[ICQDaemonOffer defaultPlaceholderKeys](ICQDaemonOffer, "defaultPlaceholderKeys");
}

+ (id)stringWithPlaceholderFormat:(id)a3 alternateString:(id)a4
{
  return +[ICQDaemonOffer stringWithPlaceholderFormat:alternateString:](ICQDaemonOffer, "stringWithPlaceholderFormat:alternateString:", a3, a4);
}

- (void)clearFollowups
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearFollowupsOfferType:completion:", 3, 0);

}

- (void)updateOfferId:(id)a3 buttonId:(id)a4 info:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "aa_primaryAppleAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = v14;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "account:%@ updateOfferId:%@ buttonId:%@ info:%@", buf, 0x2Au);
  }

  if (v14)
  {
    v16 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__ICQOfferManager_Private__updateOfferId_buttonId_info_completion___block_invoke;
    v17[3] = &unk_1E8B38C78;
    v18 = v13;
    v19 = v12;
    objc_msgSend(v16, "updateOfferForAccount:offerId:buttonId:info:completion:", v14, v9, v10, v11, v17);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

uint64_t __67__ICQOfferManager_Private__updateOfferId_buttonId_info_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissRecommendationForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ICQOfferManager dismissedRecommendations](self, "dismissedRecommendations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[ICQOfferManager setDismissedRecommendations:](self, "setDismissedRecommendations:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQOfferManager dismissedRecommendations](self, "dismissedRecommendations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v4);

}

- (BOOL)didDismissRecommendationForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[ICQOfferManager dismissedRecommendations](self, "dismissedRecommendations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[ICQOfferManager dismissedRecommendations](self, "dismissedRecommendations"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKeyedSubscript:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[ICQOfferManager dismissedRecommendations](self, "dismissedRecommendations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)buddyOfferMightNeedPresenting
{
  return 0;
}

+ (BOOL)_legacyBuddyOfferMightNeedPresenting
{
  BOOL v2;
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = +[ICQDaemonOfferConditions isCachedCloudQuotaAlmostFullOrFull](ICQDaemonOfferConditions, "isCachedCloudQuotaAlmostFullOrFull");
  v3 = +[ICQDaemonOfferConditions isDeviceStorageNearLowButNotLow](ICQDaemonOfferConditions, "isDeviceStorageNearLowButNotLow");
  v4 = v3 & !+[ICQDaemonOfferConditions isPhotosCloudEnabled](ICQDaemonOfferConditions, "isPhotosCloudEnabled");
  if (v2)
    v5 = 1;
  else
    v5 = v4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NERP");
    if (v5)
      v7 = CFSTR("YASE");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "mini-buddy might need to run: %@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)forcePostFollowup
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forcePostFollowup");

}

- (void)postOfferType:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postOfferType:", v3);

}

- (void)postBuddyOfferType:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postBuddyOfferType:", v3);

}

- (void)teardownCachedOffer
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "teardownCachedOffer");

}

- (void)teardownCachedBuddyOffer
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "teardownCachedBuddyOffer");

}

- (void)teardownCachedPremiumOffer
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDownCachedPremiumOffer");

}

- (void)teardownCachedEventOffer
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDownCachedEventOffer");

}

- (void)teardownCachedOffers
{
  id v2;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "teardownCachedOffers");

}

+ (id)ckBackupDeviceID
{
  return +[ICQDaemonOfferManager ckBackupDeviceID](ICQDaemonOfferManager, "ckBackupDeviceID");
}

- (BOOL)isDeviceStorageAlmostFull
{
  return +[ICQDaemonOfferConditions isDeviceStorageAlmostFull](ICQDaemonOfferConditions, "isDeviceStorageAlmostFull");
}

- (BOOL)isSimulatedDeviceStorageAlmostFull
{
  void *v2;
  char v3;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSimulatedDeviceStorageAlmostFull");

  return v3;
}

- (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimulatedDeviceStorageAlmostFull:", v3);

}

- (id)simulatedPhotosLibrarySize
{
  void *v2;
  void *v3;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulatedPhotosLibrarySize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSimulatedPhotosLibrarySize:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimulatedPhotosLibrarySize:", v3);

}

- (id)photosLibrarySize
{
  return +[ICQDaemonOfferConditions photosLibrarySize](ICQDaemonOfferConditions, "photosLibrarySize");
}

- (BOOL)isBuddyOfferEnabled
{
  void *v2;
  char v3;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBuddyOfferEnabled");

  return v3;
}

- (void)setBuddyOfferEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuddyOfferEnabled:", v3);

}

void __43__ICQOfferManager_postBackupRestoredOffer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1CDEBD000, a2, a3, "Backup restore offer not found with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0_0();
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CDEBD000, a1, a3, "Removing offer cache because app launch link was presented", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_22_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CDEBD000, a1, a3, "Finished sending AppLaunch event to ind", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__ICQOfferManager_appLaunchLinkDidPresentForBundleIdentifier___block_invoke_22_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_5(&dword_1CDEBD000, a2, v4, "Failed to send AppLaunch event to ind with error: %@", (uint8_t *)&v5);

}

void __55__ICQOfferManager_getEventOfferWithOptions_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CDEBD000, a1, a3, "Event offer did not have an ID, this usually means no backup offer was fetched and we got a placeholder instead", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_getOfferForAccount:(os_log_t)log bundleIdentifier:options:offerContext:completion:.cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: GetOffer  enableTelemetry=YES options: %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0_0();
}

void __88__ICQOfferManager__getOfferForAccount_bundleIdentifier_options_offerContext_completion___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_5(&dword_1CDEBD000, a2, a3, "Returned offer doesn't match the requested offer type. Requested options: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0_0();
}

@end
