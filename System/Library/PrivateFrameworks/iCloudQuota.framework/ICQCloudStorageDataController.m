@implementation ICQCloudStorageDataController

+ (id)_requestQueue
{
  if (_requestQueue_onceToken_0 != -1)
    dispatch_once(&_requestQueue_onceToken_0, &__block_literal_global_16);
  return (id)_requestQueue_requestQueue_0;
}

void __46__ICQCloudStorageDataController__requestQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.quota.storage.request", v0);
  v2 = (void *)_requestQueue_requestQueue_0;
  _requestQueue_requestQueue_0 = (uint64_t)v1;

}

- (ICQCloudStorageDataController)initWithAccount:(id)a3
{
  id v5;
  ICQCloudStorageDataController *v6;
  ICQCloudStorageDataController *v7;
  uint64_t v8;
  _TtC11iCloudQuota26RecommendationsDataFetcher *recommendationsDataFetcher;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQCloudStorageDataController;
  v6 = -[ICQCloudStorageDataController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    +[RecommendationsDataFetcher shared](_TtC11iCloudQuota26RecommendationsDataFetcher, "shared");
    v8 = objc_claimAutoreleasedReturnValue();
    recommendationsDataFetcher = v7->_recommendationsDataFetcher;
    v7->_recommendationsDataFetcher = (_TtC11iCloudQuota26RecommendationsDataFetcher *)v8;

    v7->_shouldIgnoreCache = 0;
  }

  return v7;
}

- (void)fetchStorageSummaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_requestQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke;
    block[3] = &unk_1E8B396D0;
    block[4] = self;
    v11 = v4;
    v10 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:].cold.1();

    ICQCreateError(12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  os_signpost_id_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreCache");
    *(_DWORD *)buf = 67109120;
    v30 = v3;
    _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "Should ignore cache: %d", buf, 8u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreCache") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedStorageSummary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Returning cached cloud storage summary result.", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "No cache exist. Reaching out to daemon to fetch the result from server.", buf, 2u);
    }

  }
  _ICQSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = _ICQSignpostCreateWithObject(v7, v8);
  v11 = v10;

  _ICQSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "StorageSummaryRequest", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_cold_1();

  v4 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18;
  v25[3] = &unk_1E8B38758;
  v27 = v9;
  v28 = v11;
  v26 = *(id *)(a1 + 48);
  objc_msgSend(v4, "synchronousDaemonWithErrorHandler:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "refreshCacheFor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v17 = *(void **)(a1 + 40);
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_20;
  v19[3] = &unk_1E8B39D90;
  v23 = v9;
  v24 = v11;
  v20 = v17;
  v18 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = v18;
  objc_msgSend(v16, "fetchStorageSummaryForAltDSID:completion:", v20, v19);

LABEL_17:
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18_cold_2();

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "StorageSummaryRequest", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Cloud storage summary request has been completed.", buf, 2u);
  }

  _ICQSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StorageSummaryRequest", ", v16, 2u);
  }

  _ICQSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18_cold_1();

  if (v5)
  {
    +[ICQCloudStorageSummaryCache sharedInstance](ICQCloudStorageSummaryCache, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStorageSummary:forAltDSID:", v5, *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_20_cold_1();

    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "cachedStorageSummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v6);

  }
}

- (id)cachedStorageSummary
{
  void *v3;
  void *v4;
  void *v5;

  +[ICQCloudStorageSummaryCache sharedInstance](ICQCloudStorageSummaryCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storageSummaryForAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ICQiCloudDetailsPageInfo)cachediCloudDetailsPage
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  +[ICQCloudStorageSummaryCache sharedInstance](ICQCloudStorageSummaryCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDisplayedDetailsPage");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ICQCloudStorageDataController cachedStorageSummary](self, "cachedStorageSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iCloudDetailsPageInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (ICQiCloudDetailsPageInfo *)v5;
}

- (BOOL)iCloudDetailsPageShown
{
  void *v2;
  char v3;

  +[ICQCloudStorageSummaryCache sharedInstance](ICQCloudStorageSummaryCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDisplayedDetailsPage");

  return v3;
}

- (void)setICloudDetailsPageShown:(BOOL)a3
{
  id v3;

  +[ICQCloudStorageSummaryCache sharedInstance](ICQCloudStorageSummaryCache, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasDisplayedDetailsPage:", 1);

}

- (void)fetchStorageAppsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  os_signpost_id_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  os_signpost_id_t v25;
  uint64_t v26;
  uint8_t buf[16];

  v4 = a3;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _ICQSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = _ICQSignpostCreateWithObject(v6, v7);
    v10 = v9;

    _ICQSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StorageAppsRequest", " enableTelemetry=YES ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICQCloudStorageDataController fetchStorageAppsWithCompletion:].cold.2();

    v14 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke;
    v23[3] = &unk_1E8B38758;
    v25 = v8;
    v26 = v10;
    v16 = v4;
    v24 = v16;
    objc_msgSend(v14, "daemonWithErrorHandler:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_23;
    v19[3] = &unk_1E8B39DB8;
    v21 = v8;
    v22 = v10;
    v20 = v16;
    objc_msgSend(v17, "fetchStorageAppsForAltDSID:completion:", v5, v19);

  }
  else
  {
    _ICQGetLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:].cold.1();

    ICQCreateError(12);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v14);
  }

}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_2();

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "StorageAppsRequest", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_23(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Cloud storage apps request has been completed.", buf, 2u);
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StorageAppsRequest", ", v13, 2u);
  }

  _ICQSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_1();

  if (!v5)
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_23_cold_1();

  }
  (*(void (**)(void))(a1[4] + 16))();

}

- (void)fetchStorageByApp:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void (**v24)(id, id, _QWORD);
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  void (**v29)(id, id, _QWORD);
  os_signpost_id_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  os_signpost_id_t v34;
  uint64_t v35;
  uint8_t buf[4];
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v37 = -[ICQCloudStorageDataController shouldIgnoreCache](self, "shouldIgnoreCache");
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Should ignore cache: %d", buf, 8u);
    }

    if (!-[ICQCloudStorageDataController shouldIgnoreCache](self, "shouldIgnoreCache"))
    {
      +[ICQAppCloudStorageCache sharedInstance](ICQAppCloudStorageCache, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudStorageByApp:forAltDSID:", v6, v8);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Returning cached app cloud storage result.", buf, 2u);
        }

        v7[2](v7, v12, 0);
        goto LABEL_21;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "No cache exist. Reaching out to daemon to fetch the result from server.", buf, 2u);
      }

    }
    _ICQSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    v17 = _ICQSignpostCreateWithObject(v15, v16);
    v19 = v18;

    _ICQSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "StorageByAppRequest", " enableTelemetry=YES ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[ICQCloudStorageDataController fetchStorageByApp:completion:].cold.2();

    v12 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke;
    v32[3] = &unk_1E8B38758;
    v34 = v17;
    v35 = v19;
    v24 = v7;
    v33 = v24;
    objc_msgSend(v12, "daemonWithErrorHandler:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_26;
    v26[3] = &unk_1E8B39DE0;
    v30 = v17;
    v31 = v19;
    v27 = v6;
    v28 = v8;
    v29 = v24;
    objc_msgSend(v25, "fetchStorageByApp:forAltDSID:completion:", v27, v28, v26);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:].cold.1();

    ICQCreateError(12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id))v7)[2](v7, 0, v12);
  }
LABEL_21:

}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_2();

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "StorageByAppRequest", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_26(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "App cloud storage request has been completed.", buf, 2u);
  }

  _ICQSignpostGetNanoseconds(a1[7], a1[8]);
  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[7];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StorageByAppRequest", ", v16, 2u);
  }

  _ICQSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_1();

  if (v5)
  {
    +[ICQAppCloudStorageCache sharedInstance](ICQAppCloudStorageCache, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCloudStorage:byApp:forAltDSID:", v5, a1[4], a1[5]);

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_26_cold_1();

    +[ICQAppCloudStorageCache sharedInstance](ICQAppCloudStorageCache, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cloudStorageByApp:forAltDSID:", a1[4], a1[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)fetchBackupinfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  os_signpost_id_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  uint8_t buf[16];

  v4 = a3;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Reaching out to daemon to fetch backup info.", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v10 = _ICQSignpostCreateWithObject(v8, v9);
    v12 = v11;

    _ICQSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BackupInfoRequest", " enableTelemetry=YES ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ICQCloudStorageDataController fetchBackupinfoWithCompletion:].cold.2();

    v16 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke;
    v25[3] = &unk_1E8B38758;
    v18 = v4;
    v26 = v18;
    v27 = v10;
    v28 = v12;
    objc_msgSend(v16, "daemonWithErrorHandler:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_28;
    v21[3] = &unk_1E8B39E08;
    v23 = v10;
    v24 = v12;
    v22 = v18;
    objc_msgSend(v19, "fetchBackupInfoForAltDSID:completion:", v20, v21);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:].cold.1();

    ICQCreateError(12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v16);
  }

}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_2();

  (*(void (**)(void))(a1[4] + 16))();
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "BackupInfoRequest", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_1();

}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_28(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "fetchBackupInfo request completed.", buf, 2u);
  }

  if (v5)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_28_cold_2();

  }
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[5];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v10, OS_SIGNPOST_INTERVAL_END, v11, "BackupInfoRequest", ", v13, 2u);
  }

  _ICQSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)sendTipState:(int64_t)a3 forTip:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD aBlock[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  os_signpost_id_t v33;
  uint64_t v34;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Reaching out to daemon to send tip state.", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = _ICQSignpostCreateWithObject(v13, v14);
    v17 = v16;

    _ICQSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "TipStateRequest", " enableTelemetry=YES ", buf, 2u);
    }

    _ICQSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ICQCloudStorageDataController sendTipState:forTip:completion:].cold.2();

    v21 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v22 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke;
    v31[3] = &unk_1E8B38758;
    v33 = v15;
    v34 = v17;
    v23 = v9;
    v32 = v23;
    objc_msgSend(v21, "daemonWithErrorHandler:", v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = v22;
    aBlock[1] = 3221225472;
    aBlock[2] = __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_30;
    aBlock[3] = &unk_1E8B38758;
    v29 = v15;
    v30 = v17;
    v28 = v23;
    v25 = _Block_copy(aBlock);
    if (a3 == 1)
    {
      -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendTipDismissedNetworkRequestForAltDSID:tip:completion:", v26, v8, v25);
    }
    else
    {
      if (a3)
      {
LABEL_17:

        goto LABEL_18;
      }
      -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendTipDisplayedNetworkRequestForAltDSID:tip:completion:", v26, v8, v25);
    }

    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:].cold.1();

  ICQCreateError(12);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))v9 + 2))(v9, v21);
LABEL_18:

}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_2();

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TipStateRequest", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_30(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_30_cold_2();

  }
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TipStateRequest", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)fetchAppsSyncingToiCloudDriveWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_requestQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke;
    block[3] = &unk_1E8B393F8;
    block[4] = self;
    v10 = v5;
    v11 = v4;
    dispatch_async(v6, block);

  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:].cold.1();

    ICQCreateError(12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreCache");
    *(_DWORD *)buf = 67109120;
    v29 = v3;
    _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "Should ignore cache: %d", buf, 8u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreCache") & 1) == 0)
  {
    +[ICQAppsSyncingToDriveCache sharedInstance](ICQAppsSyncingToDriveCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appsSyncingToDriveforAltDSID:", *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Returning cached apps syncing to drive result.", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_23;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "No cache exist. Reaching out to daemon to fetch the result from server.", buf, 2u);
    }

  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Reaching out to daemon to fetch apps syncing to icloud drive", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = _ICQSignpostCreateWithObject(v9, v10);
  v13 = v12;

  _ICQSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AppsSyncingToiCloudDrive", " enableTelemetry=YES ", buf, 2u);
  }

  _ICQSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_2();

  v5 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_32;
  v24[3] = &unk_1E8B38758;
  v26 = v11;
  v27 = v13;
  v25 = *(id *)(a1 + 48);
  objc_msgSend(v5, "daemonWithErrorHandler:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = *(void **)(a1 + 40);
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_35;
    v21[3] = &unk_1E8B39E30;
    v22 = v19;
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v18, "fetchAppsSyncingToiCloudDriveForAltDSID:completion:", v22, v21);

    v20 = v22;
  }
  else
  {
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_1();
  }

LABEL_23:
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_32(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_32_cold_2();

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  _ICQSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CDEBD000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AppsSyncingToiCloudDrive", ", v9, 2u);
  }

  _ICQSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_32_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[ICQAppsSyncingToDriveCache sharedInstance](ICQAppsSyncingToDriveCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAppsSyncingToDrive:forAltDSID:", v5, *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_35_cold_1();

    v9 = *(_QWORD *)(a1 + 40);
    +[ICQAppsSyncingToDriveCache sharedInstance](ICQAppsSyncingToDriveCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appsSyncingToDriveforAltDSID:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v6);

  }
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationsDataFetcher, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)fetchStorageSummaryWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "Invalid account. No altDSID found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: StorageSummaryRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) StorageSummaryRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_18_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "XPC Error while fetching storage summary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to fetch cloud storage summary with error: %@. Returning cached results.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)fetchStorageAppsWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: StorageAppsRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) StorageAppsRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "XPC Error while fetching storage apps: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to fetch cloud storage apps with error: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)fetchStorageByApp:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: StorageByAppRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) StorageByAppRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "XPC Error while fetching storage detail.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to fetch app cloud storage with error: %@, returning cached result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)fetchBackupinfoWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: BackupInfoRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) BackupInfoRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "XPC Error while backup info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_28_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to fetch backup info with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)sendTipState:forTip:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: TipStateRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) TipStateRequest ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "XPC Error while reaching out to daemon to send tip state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_30_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to send tip state with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "Method [INDaemon fetchAppsSyncingToiCloudDriveForAltDSID] not implemented yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_1CDEBD000, v0, v1, "SIGNPOST BEGIN [id: %hu]: AppsSyncingToiCloudDrive  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CDEBD000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) AppsSyncingToiCloudDrive ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_32_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, v0, v1, "XPC Error while reaching out to daemon to fetch apps syncing to iCloud Drive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, v0, v1, "Failed to fetch Apps Syncing to iCloud Drive with error: %@ returning cached result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
