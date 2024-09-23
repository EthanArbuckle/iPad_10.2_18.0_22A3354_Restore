@implementation ATXConfiguredModeService

- (ATXConfiguredModeService)init
{
  ATXConfiguredModeService *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  ATXGenericFileBasedCache *cache;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXConfiguredModeService;
  v2 = -[ATXConfiguredModeService init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CF94C0]);
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("DNDModeConfigurationsCache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_modes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithCacheFilePath:loggingHandle:debugName:", v4, v5, CFSTR("mode configurations"));
    cache = v2->_cache;
    v2->_cache = (ATXGenericFileBasedCache *)v6;

    -[ATXConfiguredModeService _createServiceIfNeeded](v2, "_createServiceIfNeeded");
    v8 = -[ATXConfiguredModeService _cacheAndReturnDNDModeConfigurationDictionary](v2, "_cacheAndReturnDNDModeConfigurationDictionary");
  }
  return v2;
}

- (void)_createServiceIfNeeded
{
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, a1, a3, "ATXConfiguredModeService: Could not reference DNDModeConfigurationService", a5, a6, a7, a8, 0);
}

void __50__ATXConfiguredModeService__createServiceIfNeeded__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__ATXConfiguredModeService__createServiceIfNeeded__block_invoke_cold_1();

  }
}

- (id)_cacheAndReturnDNDModeConfigurationDictionary
{
  void *v3;
  uint64_t v5;

  v5 = 0;
  -[ATXConfiguredModeService _modeConfigurationsReturningError:](self, "_modeConfigurationsReturningError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[ATXConfiguredModeService _cacheDNDModeConfigurationDictionary:](self, "_cacheDNDModeConfigurationDictionary:", v3);
  return v3;
}

- (void)_cacheDNDModeConfigurationDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x1D82448B0]();
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_INFO, "ATXConfiguredModeService: Caching DND mode configs as a backup", v7, 2u);
  }

  if (v4)
    -[ATXGenericFileBasedCache storeSecureCodedObject:error:](self->_cache, "storeSecureCodedObject:error:", v4, 0);
  objc_autoreleasePoolPop(v5);

}

- (id)_retrieveCachedDNDModeConfigurationDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v3 = (void *)getDNDModeConfigurationClass_softClass;
  v22 = getDNDModeConfigurationClass_softClass;
  if (!getDNDModeConfigurationClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getDNDModeConfigurationClass_block_invoke;
    v18[3] = &unk_1E942DF08;
    v18[4] = &v19;
    __getDNDModeConfigurationClass_block_invoke((uint64_t)v18);
    v3 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v19, 8);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D82448B0]();
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, v4, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v5);
    -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:](self->_cache, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, 0, 2419200.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXConfiguredModeService _retrieveCachedDNDModeConfigurationDictionary].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

- (BOOL)isActivityTypeConfigured:(unint64_t)a3
{
  return -[ATXConfiguredModeService isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:](self, "isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:", a3, 0, 0, 0);
}

- (BOOL)isActivityTypeConfigured:(unint64_t)a3 uuid:(id *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6
{
  void *v11;

  -[ATXConfiguredModeService _modeConfigurationsReturningError:](self, "_modeConfigurationsReturningError:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[ATXConfiguredModeService _isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:](self, "_isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:", a3, a4, a5, a6, v11);

  return (char)a6;
}

- (BOOL)_isActivityTypeConfigured:(unint64_t)a3 uuid:(id *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6 dndConfigs:(id)a7
{
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v11 = a7;
  if (v11)
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ATXConfiguredModeService _isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:].cold.1();

    ATXActivityTypeToModeSemanticType(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "integerValue");
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__6;
      v33 = __Block_byref_object_dispose__6;
      v34 = 0;
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__6;
      v27 = __Block_byref_object_dispose__6;
      v28 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __100__ATXConfiguredModeService__isActivityTypeConfigured_uuid_allowsSmartEntry_userModeName_dndConfigs___block_invoke;
      v18[3] = &unk_1E942E080;
      v18[4] = &v29;
      v18[5] = &v23;
      v18[6] = &v19;
      v18[7] = v15;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v18);
      if (a4)
        *a4 = objc_retainAutorelease((id)v30[5]);
      if (a6)
        *a6 = objc_retainAutorelease((id)v24[5]);
      if (a5)
        *a5 = *((_BYTE *)v20 + 24);
      v16 = v30[5] != 0;
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __100__ATXConfiguredModeService__isActivityTypeConfigured_uuid_allowsSmartEntry_userModeName_dndConfigs___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "semanticType");
  v8 = a1[7];

  if (v7 == v8)
  {
    objc_msgSend(v18, "mode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[4] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v18, "mode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[5] + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v18, "allowSmartEntry") == 2;
    *a4 = 1;
  }

}

- (BOOL)isActivityWithUUIDConfigured:(id)a3
{
  return -[ATXConfiguredModeService isActivityWithUUIDConfigured:activityType:allowsSmartEntry:userModeName:](self, "isActivityWithUUIDConfigured:activityType:allowsSmartEntry:userModeName:", a3, 0, 0, 0);
}

- (BOOL)isActivityWithUUIDConfigured:(id)a3 activityType:(unint64_t *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[ATXConfiguredModeService DNDModeConfigurationForActivityWithUUID:](self, "DNDModeConfigurationForActivityWithUUID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!a4)
  {
LABEL_4:
    if (!a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v9)
  {
    objc_msgSend(v9, "mode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = DNDModeSemanticTypeToATXActivityType(objc_msgSend(v11, "semanticType"));

    goto LABEL_4;
  }
  *a4 = 0;
  if (a5)
LABEL_5:
    *a5 = objc_msgSend(v10, "allowSmartEntry") == 2;
LABEL_6:
  if (a6)
  {
    objc_msgSend(v10, "mode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10 != 0;
}

- (BOOL)_isActivityWithUUIDConfigured:(id)a3 activityType:(unint64_t *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6 dndConfigs:(id)a7
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[ATXConfiguredModeService _DNDModeConfigurationForActivityWithUUID:dndConfigs:](self, "_DNDModeConfigurationForActivityWithUUID:dndConfigs:", a3, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!a4)
  {
LABEL_4:
    if (!a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v10)
  {
    objc_msgSend(v10, "mode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = DNDModeSemanticTypeToATXActivityType(objc_msgSend(v12, "semanticType"));

    goto LABEL_4;
  }
  *a4 = 0;
  if (a5)
LABEL_5:
    *a5 = objc_msgSend(v11, "allowSmartEntry") == 2;
LABEL_6:
  if (a6)
  {
    objc_msgSend(v11, "mode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11 != 0;
}

- (id)DNDModeConfigurationForActivityWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXConfiguredModeService _modeConfigurationsReturningError:](self, "_modeConfigurationsReturningError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXConfiguredModeService _DNDModeConfigurationForActivityWithUUID:dndConfigs:](self, "_DNDModeConfigurationForActivityWithUUID:dndConfigs:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_DNDModeConfigurationForActivityWithUUID:(id)a3 dndConfigs:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ATXConfiguredModeService _isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:].cold.1();

    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    v18 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__ATXConfiguredModeService__DNDModeConfigurationForActivityWithUUID_dndConfigs___block_invoke;
    v10[3] = &unk_1E942E0A8;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __80__ATXConfiguredModeService__DNDModeConfigurationForActivityWithUUID_dndConfigs___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)_checkIfConfigurationOfCurrentModeChangedWithDNDConfigs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ATXUserFocusInferredMode currentMode](ATXUserFocusInferredMode, "currentMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "isAutomationEnabled") & 1) != 0)
    goto LABEL_15;
  v35 = 0;
  objc_msgSend(v6, "modeIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = BMUserFocusInferredModeTypeToActivity(objc_msgSend(v6, "modeType"));
  v34 = v8;
  objc_msgSend(v6, "userModeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7)
  {
    v31 = v9;
    v32 = 0;
    -[ATXConfiguredModeService _isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:](self, "_isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:", v8, &v32, &v35, &v31, v4);
    v7 = v32;
    v14 = v31;
    v12 = v10;
LABEL_9:

    v12 = v14;
    goto LABEL_10;
  }
  v33 = v9;
  v11 = -[ATXConfiguredModeService _isActivityWithUUIDConfigured:activityType:allowsSmartEntry:userModeName:dndConfigs:](self, "_isActivityWithUUIDConfigured:activityType:allowsSmartEntry:userModeName:dndConfigs:", v7, &v34, &v35, &v33, v4);
  v12 = v33;

  if (!v11)
  {
    __atxlog_handle_modes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2C00000, v13, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: mode is no longer configured, updating suggestion to have nil modeUUID and userModeName", buf, 2u);
    }

    v14 = 0;
    v7 = 0;
    goto LABEL_9;
  }
LABEL_10:
  if (v35)
  {
    v30 = v12;
    v15 = ATXActivityTypeToBMUserFocusInferredModeType(v34);
    __atxlog_handle_modes();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v7;
      v38 = 2048;
      v39 = (int)v15;
      _os_log_impl(&dword_1D2C00000, v16, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: New mode (modeUUID: %{public}@, type: %lu) was updated to now allow smart trigger. Updating mode inference with smart entry enabled", buf, 0x16u);
    }

    v29 = objc_msgSend(v6, "origin");
    objc_msgSend(v6, "originAnchorType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "confidenceScore");
    v19 = v18;
    objc_msgSend(v6, "serializedTriggers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    v22 = v35;
    BiomeLibrary();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UserFocus");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "InferredMode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v27) = v22;
    v12 = v30;
    v26 = +[ATXModeClassifier updateModeWithUUID:userModeName:modeType:modeOrigin:originAnchorType:originBundleId:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:currentMode:stream:](ATXModeClassifier, "updateModeWithUUID:userModeName:modeType:modeOrigin:originAnchorType:originBundleId:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:currentMode:stream:", v7, v30, v21, v29, v28, v17, v19, 1, v20, v27, v6, v25);

  }
LABEL_15:

}

- (id)_modeConfigurationsReturningError:(id *)a3
{
  DNDModeConfigurationService *service;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  id v13;

  -[ATXConfiguredModeService _createServiceIfNeeded](self, "_createServiceIfNeeded");
  service = self->_service;
  v13 = 0;
  -[DNDModeConfigurationService modeConfigurationsReturningError:](service, "modeConfigurationsReturningError:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXConfiguredModeService _modeConfigurationsReturningError:].cold.1();

    -[ATXConfiguredModeService _retrieveCachedDNDModeConfigurationDictionary](self, "_retrieveCachedDNDModeConfigurationDictionary");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v6;
}

- (void)_updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99EA0];
    v4 = a3;
    v5 = [v3 alloc];
    v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    v7 = *MEMORY[0x1E0CF9538];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF9538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)objc_opt_new();
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__ATXConfiguredModeService__updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs___block_invoke;
    v13[3] = &unk_1E942E0D0;
    v10 = v9;
    v14 = v10;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);

    __atxlog_handle_modes();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1D2C00000, v11, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: historically configured mode semantic types: %@", buf, 0xCu);
    }

    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v12, v7);

  }
}

void __83__ATXConfiguredModeService__updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "semanticType");

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)_updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  ATXConfiguredModeService *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99EA0];
    v5 = a3;
    v6 = [v4 alloc];
    v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    v8 = *MEMORY[0x1E0CF9540];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF9540]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)objc_opt_new();
    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __91__ATXConfiguredModeService__updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs___block_invoke;
    v17 = &unk_1E942E0F8;
    v18 = self;
    v11 = v10;
    v19 = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v14);

    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_1D2C00000, v12, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: smart activation was enabled at some point for these modes: %@", buf, 0xCu);
    }

    objc_msgSend(v11, "allObjects", v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, v8);

  }
}

void __91__ATXConfiguredModeService__updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticType");

  LODWORD(v5) = objc_msgSend(*(id *)(a1 + 32), "_isSmartActivationEnabled:", v4);
  if ((_DWORD)v5)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (BOOL)_isSmartActivationEnabled:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v11 = a3;
  objc_msgSend(v11, "triggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v17 = 0;
        v18 = &v17;
        v19 = 0x2050000000;
        v8 = (void *)getDNDModeConfigurationSmartTriggerClass_softClass;
        v20 = getDNDModeConfigurationSmartTriggerClass_softClass;
        if (!getDNDModeConfigurationSmartTriggerClass_softClass)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __getDNDModeConfigurationSmartTriggerClass_block_invoke;
          v16[3] = &unk_1E942DF08;
          v16[4] = &v17;
          __getDNDModeConfigurationSmartTriggerClass_block_invoke((uint64_t)v16);
          v8 = (void *)v18[3];
        }
        v9 = objc_retainAutorelease(v8);
        _Block_object_dispose(&v17, 8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v4) = objc_msgSend(v7, "enabledSetting") == 2;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: mode configuration did change. Checking if this affects the current mode and if any new modes were added", v7, 2u);
  }

  -[ATXConfiguredModeService _cacheAndReturnDNDModeConfigurationDictionary](self, "_cacheAndReturnDNDModeConfigurationDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXConfiguredModeService _updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs:](self, "_updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs:", v6);
  -[ATXConfiguredModeService _updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs:](self, "_updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs:", v6);
  -[ATXConfiguredModeService _checkIfConfigurationOfCurrentModeChangedWithDNDConfigs:](self, "_checkIfConfigurationOfCurrentModeChangedWithDNDConfigs:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

void __50__ATXConfiguredModeService__createServiceIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1D2C00000, v0, v1, "ATXConfiguredModeService: Adding a listener failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_retrieveCachedDNDModeConfigurationDictionary
{
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, a1, a3, "ATXConfiguredModeService: Could not get DNDModeConfiguration class", a5, a6, a7, a8, 0);
}

- (void)_isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_1D2C00000, v0, v1, "ATXConfiguredModeService: configured modes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_modeConfigurationsReturningError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1D2C00000, v0, v1, "ATXConfiguredModeService: Could not obtain DND mode configurations with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
