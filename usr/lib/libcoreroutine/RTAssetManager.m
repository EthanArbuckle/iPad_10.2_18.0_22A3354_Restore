@implementation RTAssetManager

- (RTAssetManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_assetProcessor_xpcActivityManager_);
}

- (RTAssetManager)initWithDefaultsManager:(id)a3 assetProcessor:(id)a4 xpcActivityManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  RTAssetManager *v14;
  id *p_isa;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  RTAssetManager *v23;
  NSObject *v24;
  const char *v25;
  _QWORD v27[4];
  id v28[2];
  id location[2];
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(location[0]) = 0;
    v25 = "Invalid parameter not satisfying: defaultsManager";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)location, 2u);
    goto LABEL_16;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(location[0]) = 0;
    v25 = "Invalid parameter not satisfying: assetProcessor";
    goto LABEL_15;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      v25 = "Invalid parameter not satisfying: xpcActivityManager";
      goto LABEL_15;
    }
LABEL_16:

    v23 = 0;
    goto LABEL_17;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTAssetManager;
  v14 = -[RTNotifier init](&v30, sel_init);
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_defaultsManager, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 7, a5);
    objc_msgSend(p_isa[5], "objectForKey:", CFSTR("LastAssetContentVersionDownloaded"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("contentVersion"));
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = (void *)objc_msgSend(v18, "initWithCString:encoding:", RTAnalyticsEventAssetContentVersion, 1);
      log_analytics_submission(v19, v17);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

    }
    objc_msgSend(p_isa, "defaultXPCActivityCriteria");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, p_isa);
    v22 = p_isa[7];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke;
    v27[3] = &unk_1E9297790;
    v28[1] = (id)a2;
    objc_copyWeak(v28, location);
    objc_msgSend(v22, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.assets"), v21, v27);
    objc_msgSend(p_isa, "setupRoutineConfigAssetChangedNotification");
    objc_destroyWeak(v28);
    objc_destroyWeak(location);

  }
  self = p_isa;
  v23 = self;
LABEL_17:

  return v23;
}

void __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  void (**v11)(id, id);
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke_190;
      v10[3] = &unk_1E9297568;
      v11 = v5;
      objc_msgSend(WeakRetained, "copyRoutineAssetFromCoreLocationConfigWithHandler:", v10);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

uint64_t __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke_190(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)copyRoutineAssetFromCoreLocationConfigWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__RTAssetManager_copyRoutineAssetFromCoreLocationConfigWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __68__RTAssetManager_copyRoutineAssetFromCoreLocationConfigWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copyRoutineAssetFromCoreLocationConfig:", *(_QWORD *)(a1 + 40));
}

- (void)setupRoutineConfigAssetChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTAssetManager_setupRoutineConfigAssetChangedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__RTAssetManager_setupRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupRoutineConfigAssetChangedNotification");
}

- (void)_setupRoutineConfigAssetChangedNotification
{
  RTDarwinNotificationHelper *v3;
  RTDarwinNotificationHelper *notificationHelper;
  RTDarwinNotificationHelper *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = (RTDarwinNotificationHelper *)objc_opt_new();
  notificationHelper = self->_notificationHelper;
  self->_notificationHelper = v3;

  objc_initWeak(&location, self);
  v5 = self->_notificationHelper;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__RTAssetManager__setupRoutineConfigAssetChangedNotification__block_invoke;
  v6[3] = &unk_1E92983E8;
  objc_copyWeak(&v7, &location);
  -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v5, "addObserverForNotificationName:handler:", CFSTR("kRoutineConfigAssetChangedNotification"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__RTAssetManager__setupRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleRoutineConfigAssetChangedNotification");
    WeakRetained = v2;
  }

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTXPCActivityManager unregisterActivityWithIdentifier:handler:](self->_xpcActivityManager, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.assets"), 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)_copyRoutineAssetFromCoreLocationConfig:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  RTDefaultsManager *defaultsManager;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  _BYTE v28[10];
  __int16 v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  v24 = 0;
  v6 = (void *)CLCopyRoutineAssetSettings();
  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v9;
      v27 = 1024;
      *(_DWORD *)v28 = HIDWORD(v24);
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v24;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@ compatibilityVersion %d, contentVersion %d, received RoutineAsset, %@, ", buf, 0x22u);

    }
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", CFSTR("defaults.plist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v13 = objc_msgSend(v6, "writeToURL:error:", v12, &v23);
    v14 = v23;
    if ((v13 & 1) != 0)
    {
      defaultsManager = self->_defaultsManager;
      objc_msgSend(v12, "path");
      v16 = objc_claimAutoreleasedReturnValue();
      -[RTDefaultsManager addDomain:](defaultsManager, "addDomain:", v16);
      v17 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v22;
        v27 = 2112;
        *(_QWORD *)v28 = v14;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, Encountered error in creating assets defaults.plist file: %@", buf, 0x16u);

      }
      v17 = v14;
    }

    ((void (**)(id, id))v5)[2](v5, v17);
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, Received a NULL  CFDictionaryRef routineAssetSettingsDict", buf, 0xCu);

    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D18598];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("CFDictionaryRef routineAssetSettingsDict from CL is NULL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *))v5)[2](v5, v6);
  }

}

- (void)handleRoutineConfigAssetChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTAssetManager_handleRoutineConfigAssetChangedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __61__RTAssetManager_handleRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRoutineConfigAssetChangedNotification");
}

- (void)_handleRoutineConfigAssetChangedNotification
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityDefaults);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "received Routine Config Asset change notification", buf, 2u);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__RTAssetManager__handleRoutineConfigAssetChangedNotification__block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v5[4] = a2;
  -[RTAssetManager _copyRoutineAssetFromCoreLocationConfig:](self, "_copyRoutineAssetFromCoreLocationConfig:", v5);
}

void __62__RTAssetManager__handleRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, error %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)performUpdateOfAssetsWithTypeAssetType:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2;
  v3[3] = &unk_1E9299358;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performUpdateOfAssetsWithTypeAssetType:handler:", v2, v3);

}

void __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_finalizeAssetUpdateOperationWithError:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)_performUpdateOfAssetsWithTypeAssetType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  void (**v24)(_QWORD, _QWORD);
  uint64_t v25;
  char *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTAssetManager _performUpdateOfAssetsWithTypeAssetType:handler:]";
    v29 = 1024;
    LODWORD(v30) = 226;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetType (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTAssetManager _performUpdateOfAssetsWithTypeAssetType:handler:]";
      v29 = 1024;
      LODWORD(v30) = 227;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("LastAssetUpdateDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("LastSuccessfulAssetUpdateDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "stringFromDate");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "Checking for new assets to download, date of last attempt, %@, last success, %@", buf, 0x16u);

  }
  if (v8)
  {
    if (v6)
    {
      -[RTAssetManager defaultCatalogDownloadOptions](self, "defaultCatalogDownloadOptions");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "Starting catalog download.", buf, 2u);
      }

      v18 = (void *)MEMORY[0x1E0D4E038];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke;
      v22[3] = &unk_1E9299CD0;
      v22[4] = self;
      v23 = v6;
      v24 = v8;
      objc_msgSend(v18, "startCatalogDownload:options:then:", v23, v16, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset type is nil, returning."));
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v25 = *MEMORY[0x1E0CB2D50];
      v26 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v21);

    }
  }

}

void __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2;
  v6[3] = &unk_1E9297590;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v9 = a2;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

}

uint64_t __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCatalogDownloadWithType:downloadResult:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)defaultXPCActivityCriteria
{
  return -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 0, 0, 0, 1, 0, 86400.0, 43200.0);
}

- (id)defaultCatalogDownloadOptions
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDiscretionary:", 0);
  return v2;
}

- (id)defaultAssetDownloadOptions
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAllowsCellularAccess:", 0);
  objc_msgSend(v2, "setDiscretionary:", 0);
  return v2;
}

- (BOOL)nonUserInitiatedDownloadsAllowed
{
  return MANonUserInitiatedDownloadsAllowed();
}

- (void)_handleCatalogDownloadWithType:(id)a3 downloadResult:(int64_t)a4 handler:(id)a5
{
  char *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  NSObject *v28;
  void (**v29)(_QWORD, _QWORD);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTAssetManager _handleCatalogDownloadWithType:downloadResult:handler:]";
      v38 = 1024;
      v39 = 312;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetType (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset type is nil, returning."));
      v11 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (const char *)v11;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v34 = *MEMORY[0x1E0CB2D50];
      v35 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 1;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!v9)
  {
LABEL_14:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTAssetManager _handleCatalogDownloadWithType:downloadResult:handler:]";
      v38 = 1024;
      v39 = 313;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_25;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The catalog download for asset type, %@, failed with result, %lu."), v8, a4);
    v11 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = (const char *)v11;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v32 = *MEMORY[0x1E0CB2D50];
    v33 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 4;
LABEL_13:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), v15, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v18);

    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Catalog download finished.", buf, 2u);
  }

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", v8);
  if (v20)
  {
    v21 = (void *)v20;
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "Querying metadata for asset type %@.", buf, 0xCu);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke;
    v27[3] = &unk_1E9299CD0;
    v27[4] = self;
    v11 = v21;
    v28 = v11;
    v29 = v10;
    -[NSObject queryMetaData:](v11, "queryMetaData:", v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid asset query."));
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v23;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v30 = *MEMORY[0x1E0CB2D50];
    v31 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 2, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v26);

    v11 = 0;
  }
LABEL_25:

}

void __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke_2;
  v6[3] = &unk_1E9297590;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v9 = a2;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

}

uint64_t __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMetadataQueryResult:assetQuery:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleMetadataQueryResult:(int64_t)a3 assetQuery:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v8)
  {
    if (v9)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The asset query failed with result, %lu"), a3);
        v11 = objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityAsset);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (const char *)v11;
          _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v31 = *MEMORY[0x1E0CB2D50];
        v32 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = 5;
      }
      else
      {
        objc_msgSend(v8, "results");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          objc_msgSend(v8, "results");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTAssetManager latestAssetFromAssets:](self, "latestAssetFromAssets:", v21);
          v11 = objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            -[NSObject attributes](v11, "attributes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityAsset);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v36 = (const char *)objc_msgSend(v13, "unsignedIntegerValue");
              _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "Chose asset with version number %lu", buf, 0xCu);
            }

            -[RTAssetManager _downloadAsset:handler:](self, "_downloadAsset:handler:", v11, v10);
            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No assets available to download."));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityAsset);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = (const char *)v13;
            _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          v27 = *MEMORY[0x1E0CB2D50];
          v28 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 8, v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v10)[2](v10, v26);

LABEL_14:
LABEL_15:

          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No results for query."));
        v11 = objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityAsset);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (const char *)v11;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v29 = *MEMORY[0x1E0CB2D50];
        v30 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = 8;
      }
LABEL_13:
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), v15, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v18);
      goto LABEL_14;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTAssetManager _handleMetadataQueryResult:assetQuery:handler:]";
      v37 = 1024;
      v38 = 374;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetQuery (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid asset query."));
      v11 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (const char *)v11;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v33 = *MEMORY[0x1E0CB2D50];
      v34 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 2;
      goto LABEL_13;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTAssetManager _handleMetadataQueryResult:assetQuery:handler:]";
    v37 = 1024;
    v38 = 375;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_18:

}

- (id)latestAssetFromAssets:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __40__RTAssetManager_latestAssetFromAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D4DEE8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "compare:", v9);
  return v10;
}

- (void)_finalizeAssetUpdateOperationWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", v5, CFSTR("LastAssetUpdateDate"));
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Error while updating assets, %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", v5, CFSTR("LastSuccessfulAssetUpdateDate"));
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("LastSuccessfulAssetUpdateDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Finished asset update, date of last attempt, %@, last success, %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_downloadAsset:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(_QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTAssetManager _downloadAsset:handler:]";
      v35 = 1024;
      v36 = 473;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: asset (in %s:%d)", buf, 0x12u);
    }

    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "An asset must be provided to download.", buf, 2u);
      }

      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("An asset must be provided to download.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 0;
      goto LABEL_19;
    }
LABEL_14:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTAssetManager _downloadAsset:handler:]";
      v35 = 1024;
      v36 = 474;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_20;
  }
  if (!v7)
    goto LABEL_14;
  if (!-[RTAssetManager nonUserInitiatedDownloadsAllowed](self, "nonUserInitiatedDownloadsAllowed"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "User disallwed non-user initiated downloads.", buf, 2u);
    }

    v29 = *MEMORY[0x1E0CB2D68];
    v30 = CFSTR("User disallwed non-user initiated downloads.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 7;
LABEL_19:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), v15, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v17);

LABEL_20:
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "state") == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Asset is present on disk, attempting to install now.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[RTAssetManager _installAsset:fileManager:handler:](self, "_installAsset:fileManager:handler:", v6, v10, v8);
  }
  else
  {
    v26 = 0;
    if ((objc_msgSend(v6, "spaceCheck:", &v26) & 1) != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v34 = v26;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "Space check succeeded, requires %ld bytes.", buf, 0xCu);
      }

      objc_msgSend(v6, "attachProgressCallBack:", &__block_literal_global_235);
      -[RTAssetManager defaultAssetDownloadOptions](self, "defaultAssetDownloadOptions");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Asset is not present on disk, starting download now.", buf, 2u);
      }

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __41__RTAssetManager__downloadAsset_handler___block_invoke_236;
      v23[3] = &unk_1E9299CD0;
      v23[4] = self;
      v24 = v6;
      v25 = v8;
      objc_msgSend(v24, "startDownload:then:", v10, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Insufficient space to download the asset, requires %ld bytes."), v26);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      v27 = *MEMORY[0x1E0CB2D50];
      v28 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 6, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v22);

    }
  }

LABEL_21:
}

void __41__RTAssetManager__downloadAsset_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "expectedTimeRemaining");
  if (v3 > 0.0)
  {
    v4 = (double)objc_msgSend(v2, "totalWritten");
    v5 = v4 / (double)objc_msgSend(v2, "totalExpected");
    if (v5 > 0.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 134217984;
        v8 = v5;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "progress: %lf", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

void __41__RTAssetManager__downloadAsset_handler___block_invoke_236(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__RTAssetManager__downloadAsset_handler___block_invoke_2;
  v6[3] = &unk_1E9297590;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v9 = a2;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

}

uint64_t __41__RTAssetManager__downloadAsset_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAssetDownloadResult:asset:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleAssetDownloadResult:(int64_t)a3 asset:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTAssetManager _handleAssetDownloadResult:asset:handler:]";
      v26 = 1024;
      v27 = 553;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: asset (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An asset must be provided to download."));
      v11 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = (const char *)v11;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      v22 = *MEMORY[0x1E0CB2D50];
      v23 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 0;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!v9)
  {
LABEL_14:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTAssetManager _handleAssetDownloadResult:asset:handler:]";
      v26 = 1024;
      v27 = 554;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_19;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The asset downlaod failed with result, %ld"), a3);
    v11 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityAsset);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = (const char *)v11;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v20 = *MEMORY[0x1E0CB2D50];
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 4;
LABEL_13:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), v15, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v18);

    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Asset finished downloaded, attempting to install now.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = objc_claimAutoreleasedReturnValue();
  -[RTAssetManager _installAsset:fileManager:handler:](self, "_installAsset:fileManager:handler:", v8, v11, v10);
LABEL_19:

}

- (void)_installAsset:(id)a3 fileManager:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  char *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  char *v58;
  id v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  NSObject *v75;
  char *v76;
  void *v77;
  void *v78;
  void *v79;
  RTAssetProcessor *assetProcessor;
  RTDefaultsManager *defaultsManager;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[RTAssetManager _installAsset:fileManager:handler:]";
      v93 = 1024;
      LODWORD(v94) = 594;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v92 = "-[RTAssetManager _installAsset:fileManager:handler:]";
    v93 = 1024;
    LODWORD(v94) = 595;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: asset (in %s:%d)", buf, 0x12u);
  }

  if (v10)
  {
LABEL_4:
    if (!v11)
      goto LABEL_44;
LABEL_15:
    if (v9)
    {
      if (!v10)
      {
        v45 = (void *)MEMORY[0x1E0CB35C8];
        v103 = *MEMORY[0x1E0CB2D50];
        v104 = CFSTR("fileManager cannot be nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 7, v46);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityAsset);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v58 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v92 = v58;
          v93 = 2112;
          v94 = v15;
          _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v11[2](v11, v15);
        goto LABEL_43;
      }
      objc_msgSend(v9, "getLocalFileUrl");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.MobileAsset.routined.defaults"));

      if (v17)
      {
        objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("defaults.plist"));
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v18;
      }
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "path");
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");
        *(_DWORD *)buf = 138412546;
        v92 = v20;
        v93 = 1024;
        LODWORD(v94) = v23;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Asset, located at %@, with content version %u is downloaded, installing now.", buf, 0x12u);

      }
      objc_msgSend(v15, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "fileExistsAtPath:", v24) & 1) != 0)
      {
        objc_msgSend(v15, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v10, "isReadableFileAtPath:", v25);

        if (v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", CFSTR("assets.plist"));
          v27 = (char *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityAsset);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v27;
            _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "Path to raw assets in cache directory: %@", buf, 0xCu);
          }

          if (!v27)
          {
            _rt_log_facility_get_os_log(RTLogFacilityAsset);
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v92 = CFSTR("assets.plist");
              _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "pathToRawAssetsInCacheDirectory is nil for file name: %@, cannot continue with install.", buf, 0xCu);
            }

            v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v101 = *MEMORY[0x1E0CB2D50];
            v102 = CFSTR("pathToRawAssetsInCacheDirectory is nil");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v52, "initWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 9, v30);
            v11[2](v11, v32);
            goto LABEL_68;
          }
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v27, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            objc_msgSend(v29, "path");
            v31 = objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              _rt_log_facility_get_os_log(RTLogFacilityAsset);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v92 = v27;
                _os_log_fault_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_FAULT, "urlToRawAssetsInCacheDirectory.path is nil for asset path: %@, cannot continue with install.", buf, 0xCu);
              }

              v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v97 = *MEMORY[0x1E0CB2D50];
              v98 = CFSTR("urlToRawAssetsInCacheDirectory.path is nil");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
              v41 = (id)objc_claimAutoreleasedReturnValue();
              v57 = (void *)objc_msgSend(v56, "initWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 9, v41);
              v11[2](v11, v57);

              v32 = 0;
              goto LABEL_67;
            }
            v32 = (void *)v31;
            if (objc_msgSend(v10, "fileExistsAtPath:", v31))
            {
              v84 = v32;
              v33 = (void *)MEMORY[0x1E0C99D50];
              objc_msgSend(v30, "absoluteString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "dataWithContentsOfFile:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v36 = (void *)MEMORY[0x1E0C99D50];
              objc_msgSend(v15, "path");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "dataWithContentsOfFile:", v37);
              v38 = objc_claimAutoreleasedReturnValue();

              v77 = (void *)v38;
              v79 = v35;
              LODWORD(v37) = objc_msgSend(v35, "isEqualToData:", v38);
              _rt_log_facility_get_os_log(RTLogFacilityAsset);
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
              if ((_DWORD)v37)
              {
                if (v40)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "Data for the asset to be installed matched what was on disk, skipping installation", buf, 2u);
                }

                v11[2](v11, 0);
                v41 = 0;
                v32 = v84;
LABEL_60:

LABEL_67:
LABEL_68:

                goto LABEL_42;
              }
              if (v40)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "Data for the asset to be installed did NOT match what was on disk, continuing installation", buf, 2u);
              }

              v88 = 0;
              v32 = v84;
              objc_msgSend(v10, "removeItemAtPath:error:", v84, &v88);
              v59 = v88;
              if (v59)
              {
                v41 = v59;
                _rt_log_facility_get_os_log(RTLogFacilityAsset);
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v92 = (const char *)v84;
                  v93 = 2112;
                  v94 = v41;
                  _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "Could not delete asset at path, %@, error, %@.", buf, 0x16u);
                }

                v11[2](v11, v41);
                goto LABEL_60;
              }

            }
            objc_msgSend(v15, "path");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = 0;
            objc_msgSend(v10, "copyItemAtPath:toPath:error:", v61, v32, &v87);
            v41 = v87;

            if (!v41)
            {
              v63 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", CFSTR("defaults.plist"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "fileURLWithPath:isDirectory:", v64, 0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();

              assetProcessor = self->_assetProcessor;
              v85 = v65;
              objc_msgSend(v65, "path");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = 0;
              -[RTAssetProcessor processAssetsAtPath:intoPath:outError:](assetProcessor, "processAssetsAtPath:intoPath:outError:", v32, v66, &v86);
              v41 = v86;

              if (v41)
              {
                v67 = v85;
                _rt_log_facility_get_os_log(RTLogFacilityAsset);
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v85, "path");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v92 = (const char *)v32;
                  v93 = 2112;
                  v94 = v83;
                  v95 = 2112;
                  v96 = v41;
                  _os_log_error_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_ERROR, "Error processing asset at path, %@, into path, %@, error, %@.", buf, 0x20u);

                }
                v11[2](v11, v41);
              }
              else
              {
                defaultsManager = self->_defaultsManager;
                objc_msgSend(v85, "path");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTDefaultsManager addDomain:](defaultsManager, "addDomain:", v69);

                objc_msgSend(v9, "attributes");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "objectForKey:", *MEMORY[0x1E0D4DEE8]);
                v82 = objc_claimAutoreleasedReturnValue();

                v71 = (void *)v82;
                -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", v82, CFSTR("LastAssetContentVersionDownloaded"));
                if (v82)
                {
                  v78 = (void *)objc_opt_new();
                  objc_msgSend(v78, "setObject:forKeyedSubscript:", v82, CFSTR("contentVersion"));
                  v72 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v73 = (void *)objc_msgSend(v72, "initWithCString:encoding:", RTAnalyticsEventAssetContentVersion, 1);
                  log_analytics_submission(v73, v78);
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v73);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  AnalyticsSendEvent();

                  v71 = (void *)v82;
                }
                _rt_log_facility_get_os_log(RTLogFacilityAsset);
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_INFO, "Asset installed.", buf, 2u);
                }

                v11[2](v11, 0);
                v67 = v85;
              }

              goto LABEL_67;
            }
            _rt_log_facility_get_os_log(RTLogFacilityAsset);
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "path");
              v76 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v92 = v76;
              v93 = 2112;
              v94 = v32;
              v95 = 2112;
              v96 = v41;
              _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "Could not copy asset at path, %@, to path, %@, error, %@.", buf, 0x20u);

            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityAsset);
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v92 = v27;
              _os_log_fault_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_FAULT, "urlToRawAssetsInCacheDirectory is nil for asset path: %@, cannot continue with install.", buf, 0xCu);
            }

            v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v99 = *MEMORY[0x1E0CB2D50];
            v100 = CFSTR("urlToRawAssetsInCacheDirectory is nil");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 9, v32);
          }
          v11[2](v11, v41);
          goto LABEL_67;
        }
      }
      else
      {

      }
      v89 = *MEMORY[0x1E0CB2D50];
      v48 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "path");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("File not readable or path does not exist, %@."), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v27 = (char *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)MEMORY[0x1E0CB35C8];
      v44 = 3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An asset must be provided to download."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v92 = (const char *)v15;
        _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v105 = *MEMORY[0x1E0CB2D50];
      v106[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v44 = 0;
    }
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), v44, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v30);
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v92 = "-[RTAssetManager _installAsset:fileManager:handler:]";
    v93 = 1024;
    LODWORD(v94) = 596;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fileManager (in %s:%d)", buf, 0x12u);
  }

  if (v11)
    goto LABEL_15;
LABEL_44:

}

- (void)forceUpdateAssetMetadataWithHandler:(id)a3
{
  -[RTAssetManager performUpdateOfAssetsWithTypeAssetType:handler:](self, "performUpdateOfAssetsWithTypeAssetType:handler:", CFSTR("com.apple.MobileAsset.routined.defaults"), a3);
}

- (void)updateAssetServerURL:(id)a3 assetType:(id)a4 handler:(id)a5
{
  id v7;
  char *v8;
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (char *)a4;
  v9 = (void (**)(id, void *))a5;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[RTAssetManager updateAssetServerURL:assetType:handler:]";
      v21 = 1024;
      LODWORD(v22) = 752;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetType (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid asset type."));
      v15 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityAsset);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = (const char *)v15;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }

      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTAssetManagerErrorDomain"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v18);

      goto LABEL_18;
    }
LABEL_16:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[RTAssetManager updateAssetServerURL:assetType:handler:]";
      v21 = 1024;
      LODWORD(v22) = 753;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }
LABEL_18:

    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v19 = 136315394;
    v20 = "-[RTAssetManager updateAssetServerURL:assetType:handler:]";
    v21 = 1024;
    LODWORD(v22) = 751;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url (in %s:%d)", (uint8_t *)&v19, 0x12u);
  }

  if (!v8)
    goto LABEL_10;
LABEL_3:
  if (!v9)
    goto LABEL_16;
  objc_msgSend(v7, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1D823147C](v8, v10);

  _rt_log_facility_get_os_log(RTLogFacilityAsset);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v19 = 138412546;
    v20 = v8;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Setting mobile asset server to %@, status, %lld", (uint8_t *)&v19, 0x16u);
  }

  v9[2](v9, 0);
LABEL_19:

}

- (RTAssetProcessor)assetProcessor
{
  return self->_assetProcessor;
}

- (void)setAssetProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_assetProcessor, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_assetProcessor, 0);
}

@end
