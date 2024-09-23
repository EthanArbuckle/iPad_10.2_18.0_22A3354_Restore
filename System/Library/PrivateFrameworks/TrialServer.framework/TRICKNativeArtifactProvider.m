@implementation TRICKNativeArtifactProvider

+ (BOOL)isActivityDeferralError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C947D8];
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {
      v10 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v7 = objc_msgSend(v4, "code");

    if (v7 == 20)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v6))
        v10 = objc_msgSend(v5, "code") == 131;
      else
        v10 = 0;

      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)fetchRetryDateFromErrorAndOptions:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 hasRetryableErrorCode;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("TRICKNativeArtifactProvider.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    if (v6)
      goto LABEL_3;
LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  if (!v6)
    goto LABEL_15;
LABEL_3:
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__17;
  v29 = __Block_byref_object_dispose__17;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C94940];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __73__TRICKNativeArtifactProvider_fetchRetryDateFromErrorAndOptions_options___block_invoke;
    v24[3] = &unk_1E9331CF0;
    v24[4] = &v25;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v24);

  }
  hasRetryableErrorCode = _hasRetryableErrorCode(v6);
  v15 = objc_msgSend(v7, "discretionaryBehavior");
  +[TRIFetchRetryUtils fetchRetryDateFromRetryAfterSeconds:isDeferral:isRetryable:isNonDiscretionary:](TRIFetchRetryUtils, "fetchRetryDateFromRetryAfterSeconds:isDeferral:isRetryable:isNonDiscretionary:", v26[5], objc_msgSend(a1, "isActivityDeferralError:", v6), hasRetryableErrorCode, v15 == 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    v18 = 1;
  else
    v18 = hasRetryableErrorCode;
  if ((v18 & 1) != 0)
  {
    v19 = v16;
  }
  else
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v6;
      _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "During download from CK, encountered non-retryable error %{public}@", buf, 0xCu);
    }

    v19 = 0;
  }

  _Block_object_dispose(&v25, 8);
LABEL_16:

  return v19;
}

void __73__TRICKNativeArtifactProvider_fetchRetryDateFromErrorAndOptions_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (obj)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_QWORD *)(v6 + 40))
    {
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), obj);
      v5 = obj;
      goto LABEL_6;
    }
    v7 = objc_msgSend(obj, "compare:");
    v5 = obj;
    if (v7 == 1)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (id)configurationFromOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "downloadOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "discretionaryBehavior");
  if (!v7)
    goto LABEL_9;
  if (v7 == 2)
  {
    objc_msgSend(v6, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "activity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setXPCActivity:", v9);

      goto LABEL_10;
    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    LOWORD(v22) = 0;
    v11 = "discretionary specified, but xpc activity not present, defaulting to non-discretionary";
    goto LABEL_19;
  }
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v22) = 0;
    v11 = "un-supported download option - defaulting to non-discretionary";
LABEL_19:
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v22, 2u);
  }
LABEL_8:

LABEL_9:
  objc_msgSend(v5, "setQualityOfService:", 17, v22);
LABEL_10:
  v12 = 1;
  objc_msgSend(v5, "setPreferAnonymousRequests:", 1);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v6, "allowsExpensiveNetworkAccess"));
  if (objc_msgSend(v6, "discretionaryBehavior") == 2)
  {
    objc_msgSend(v6, "activity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 == 0;

  }
  -[TRICKNativeArtifactProvider zoneID](self, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v12)
    objc_msgSend(v5, "setTimeoutIntervalForRequest:", 300.0);
  -[TRICKNativeArtifactProvider zoneID](self, "zoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v23 = CFSTR("X-Trial-ZoneID");
    -[TRICKNativeArtifactProvider zoneID](self, "zoneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "zoneName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdditionalRequestHTTPHeaders:", v18);

  }
  objc_msgSend(v5, "setApplicationBundleIdentifierOverrideForContainerAccess:", CFSTR("com.apple.triald"));
  -[TRICKNativeArtifactProvider bundleId](self, "bundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v19);

  objc_msgSend(v4, "cacheDeleteAvailableSpaceClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCacheDeleteAvailableSpaceClass:", v20);

  return v5;
}

- (id)queryOperationForRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 desiredKeys:(id)a6 options:(id)a7 recordMatchedBlock:(id)a8 queryCompletionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a7;
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  -[TRICKNativeArtifactProvider queryLog](self, "queryLog");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logQueryWithRecordType:predicate:sortDescriptors:", v21, v15, v20);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", v21, v15);
  objc_msgSend(v23, "setSortDescriptors:", v20);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v23);
  -[TRICKNativeArtifactProvider zoneID](self, "zoneID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setZoneID:", v25);

  objc_msgSend(v24, "setDesiredKeys:", v19);
  objc_msgSend(v24, "setRecordMatchedBlock:", v18);

  objc_msgSend(v24, "setQueryCompletionBlock:", v17);
  objc_msgSend(v24, "setFetchAllResults:", 1);
  -[TRICKNativeArtifactProvider configurationFromOptions:](self, "configurationFromOptions:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConfiguration:", v26);

  TRILogCategory_Server();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    -[TRICKNativeArtifactProvider zoneID](self, "zoneID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "zoneName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412546;
    v34 = v15;
    v35 = 2114;
    v36 = v29;
    _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "created cloudkit query with predicate {%@} zoneID:%{public}@", (uint8_t *)&v33, 0x16u);

  }
  objc_msgSend(v16, "downloadOptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKOperationGroupFactory groupForDownloadOptions:](TRICKOperationGroupFactory, "groupForDownloadOptions:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setGroup:", v31);

  return v24;
}

- (id)queryOperationForRecordType:(id)a3 predicate:(id)a4 desiredKeys:(id)a5 options:(id)a6 recordMatchedBlock:(id)a7 queryCompletionBlock:(id)a8
{
  return -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", a3, a4, 0, a5, a6, a7, a8);
}

+ (id)providerForContainer:(int)a3 teamId:(id)a4 bundleId:(id)a5 dateProvider:(id)a6 namespaceDescriptorProvider:(id)a7 serverContext:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  TRICKNativeArtifactProvider *v21;

  v12 = *(_QWORD *)&a3;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  +[TRICKNativeArtifactProvider cloudkitIdentifierForContainer:](TRICKNativeArtifactProvider, "cloudkitIdentifierForContainer:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKNativeArtifactProvider containerForIdentifier:serverContext:](TRICKNativeArtifactProvider, "containerForIdentifier:serverContext:", v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRICKNativeArtifactProvider recordZoneForContainerIdentifier:teamId:](TRICKNativeArtifactProvider, "recordZoneForContainerIdentifier:teamId:", v18, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TRICKNativeArtifactProvider initWithCloudKitContainer:zoneId:teamId:bundleId:dateProvider:namespaceDescriptorProvider:]([TRICKNativeArtifactProvider alloc], "initWithCloudKitContainer:zoneId:teamId:bundleId:dateProvider:namespaceDescriptorProvider:", v19, v20, v17, v16, v15, v14);

  return v21;
}

- (TRICKNativeArtifactProvider)initWithCloudKitContainer:(id)a3 zoneId:(id)a4 teamId:(id)a5 bundleId:(id)a6 dateProvider:(id)a7 namespaceDescriptorProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  TRICKNativeArtifactProvider *v19;
  TRICKNativeArtifactProvider *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  id v29;
  void *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v29 = a5;
  v16 = a6;
  v17 = a7;
  obj = a8;
  v18 = a8;
  v30 = v14;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 439, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneId"));

  if (v16)
  {
LABEL_4:
    if (v17)
      goto LABEL_5;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateProvider"));

    if (v18)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  if (!v17)
    goto LABEL_14;
LABEL_5:
  if (v18)
    goto LABEL_6;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceDescriptorProvider"));

LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)TRICKNativeArtifactProvider;
  v19 = -[TRICKNativeArtifactProvider init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_container, a3);
    objc_storeStrong((id *)&v20->_zoneID, a4);
    objc_storeStrong((id *)&v20->_teamId, a5);
    objc_storeStrong((id *)&v20->_bundleId, a6);
    objc_storeStrong((id *)&v20->_dateProvider, a7);
    objc_storeStrong((id *)&v20->_namespaceDescriptorProvider, obj);
    if (qword_1EFC74228 != -1)
      dispatch_once(&qword_1EFC74228, &__block_literal_global_77);
    objc_storeStrong((id *)&v20->_queryLog, (id)_MergedGlobals_36);
  }

  return v20;
}

void __121__TRICKNativeArtifactProvider_initWithCloudKitContainer_zoneId_teamId_bundleId_dateProvider_namespaceDescriptorProvider___block_invoke()
{
  void *v0;
  TRICKQueryLog *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = [TRICKQueryLog alloc];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[TRICKQueryLog initWithPaths:](v1, "initWithPaths:", v2);
  v4 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = v3;

  objc_autoreleasePoolPop(v0);
}

- (id)queryOperationWithCursor:(id)a3 desiredKeys:(id)a4 options:(id)a5 recordMatchedBlock:(id)a6 queryCompletionBlock:(id)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (objc_class *)MEMORY[0x1E0C95038];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = (void *)objc_msgSend([v13 alloc], "initWithCursor:", v12);
  objc_msgSend(v18, "setDesiredKeys:", v17);

  objc_msgSend(v18, "setRecordMatchedBlock:", v15);
  objc_msgSend(v18, "setQueryCompletionBlock:", v14);

  objc_msgSend(v18, "setFetchAllResults:", 1);
  -[TRICKNativeArtifactProvider configurationFromOptions:](self, "configurationFromOptions:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConfiguration:", v19);

  objc_msgSend(v16, "downloadOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRICKOperationGroupFactory groupForDownloadOptions:](TRICKOperationGroupFactory, "groupForDownloadOptions:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setGroup:", v21);

  TRILogCategory_Server();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v12;
    _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "created cloudkit query with cursor {%@}", (uint8_t *)&v24, 0xCu);
  }

  return v18;
}

+ (id)containerForIdentifier:(id)a3 serverContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternalBuild");

  if (!v9)
  {
    v13 = 1;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C94C28], "containerIDForContainerIdentifier:environment:", v6, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v11);
    goto LABEL_14;
  }
  objc_msgSend(v7, "failureInjectionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0DC0E08]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    switch(v15)
    {
      case 2:
        goto LABEL_10;
      case 5:
        objc_msgSend(a1, "mockSQLiteContainerWithIdentifier:serverContext:failureInjectionDelegate:", v6, v7, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      case 4:
LABEL_10:
        v13 = 2;
        break;
      default:
LABEL_11:
        v13 = 1;
        break;
    }

    goto LABEL_13;
  }
  objc_msgSend(v7, "failureInjectionDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mockSQLiteContainerWithIdentifier:serverContext:failureInjectionDelegate:", v6, v7, v11);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v16 = (void *)v12;
LABEL_15:

  return v16;
}

+ (id)mockSQLiteContainerWithIdentifier:(id)a3 serverContext:(id)a4 failureInjectionDelegate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "ensureFakeCKDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v7);

  +[TRISQLiteCKDatabase mockContainerWithIdentifier:database:](TRISQLiteCKDatabase, "mockContainerWithIdentifier:database:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)recordZoneForContainerIdentifier:(id)a3 teamId:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC0BC0]))
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRICKNativeArtifactProvider.m"), 517, CFSTR("team id required for container %@"), v7);

    }
    v9 = objc_alloc(MEMORY[0x1E0C95098]);
    objc_msgSend(CFSTR("Zone-"), "stringByAppendingString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithZoneName:ownerName:", v10, *MEMORY[0x1E0C94730]);

  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC0BC8]))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("com.apple.triald.testing.ck.zone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0C95098]);
    if (v13)
    {
      v15 = *MEMORY[0x1E0C94730];
      v16 = v13;
    }
    else
    {
      v16 = (void *)*MEMORY[0x1E0C94A30];
      v15 = *MEMORY[0x1E0C94730];
    }
    v11 = (void *)objc_msgSend(v14, "initWithZoneName:ownerName:", v16, v15);

  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0C95098]);
    v11 = (void *)objc_msgSend(v17, "initWithZoneName:ownerName:", *MEMORY[0x1E0C94A30], *MEMORY[0x1E0C94730]);
  }

  return v11;
}

- (void)_fetchExperimentWithExperimentId:(id)a3 deploymentId:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  TRICKNativeArtifactProvider *v62;
  id v63;
  int v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _QWORD v69[5];
  void *v70;
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[TRICKNativeArtifactProvider container](self, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v14);

  if (v15)
  {
    v49 = v15;
    v54 = v12;
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0D10], v10);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithValue:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v53 = v13;
    v56 = v11;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0CE8], v11);
      v18 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = v16;
    }
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "populationType");

    v22 = (void *)MEMORY[0x1E0CB3880];
    v23 = *MEMORY[0x1E0DC0CF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), v23, v25);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *MEMORY[0x1E0DC0D28];
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K != %@"), *MEMORY[0x1E0DC0D28], &unk_1E9363C30);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K != %@"), v26, &unk_1E9363C48);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3528];
    v69[0] = v55;
    v69[1] = v18;
    v51 = (void *)v18;
    v69[2] = v47;
    v69[3] = v46;
    v69[4] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)objc_opt_new();
    v31 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke;
    v65[3] = &unk_1E9331D38;
    v52 = v10;
    v32 = v10;
    v66 = v32;
    v33 = v56;
    v67 = v33;
    v34 = v30;
    v68 = v34;
    v35 = (void *)MEMORY[0x1D8232C48](v65);
    v57[0] = v31;
    v57[1] = 3221225472;
    v57[2] = __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_104;
    v57[3] = &unk_1E9331D88;
    v36 = v32;
    v58 = v36;
    v59 = v33;
    v37 = v54;
    v60 = v37;
    v13 = v53;
    v62 = self;
    v63 = v53;
    v61 = v34;
    v64 = v49;
    v50 = v34;
    v38 = (void *)MEMORY[0x1D8232C48](v57);
    v39 = *MEMORY[0x1E0DC0CD0];
    +[TRIClientExperimentArtifact allReferencedCKRecordKeys](TRIClientExperimentArtifact, "allReferencedCKRecordKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v39, v29, v40, v37, v35, v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v36;
    v10 = v52;
    +[TRICKOperationGroupFactory groupForExperimentId:](TRICKOperationGroupFactory, "groupForExperimentId:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setGroup:", v43);

    -[TRICKNativeArtifactProvider container](self, "container");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "publicCloudDatabase");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addOperation:", v41);

    v12 = v54;
    v11 = v56;
  }
  else
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v10;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "failed to fetch experiment %@ (unknown container)", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0, 0);
  }

}

void __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "recordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "received experiment notification for deployment %@.%@ ckRecordID %@", (uint8_t *)&v9, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }

}

void __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[4];
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v22 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "finished fetchExperiment query for deployment %@.%@ error %@", buf, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, uint64_t, _QWORD, void *, uint64_t (*)(uint64_t, uint64_t)))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 2 * (v11 != 0), 0, v11, v6);
  }
  else
  {
    v12 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("deploymentDate"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortUsingDescriptors:", v14);

    objc_msgSend(*(id *)(a1 + 56), "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v22 = __Block_byref_object_copy__17;
    v23 = __Block_byref_object_dispose__17;
    v24 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 4;
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 64), "namespaceDescriptorProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(unsigned int *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 64), "teamId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_107;
      v19[3] = &unk_1E9331D60;
      v19[4] = buf;
      v19[5] = v20;
      +[TRIClientExperimentArtifact artifactFromCKRecordResult:withNamespaceDescriptorProvider:container:teamId:requireDeploymentId:completion:](TRIClientExperimentArtifact, "artifactFromCKRecordResult:withNamespaceDescriptorProvider:container:teamId:requireDeploymentId:completion:", v11, v15, v16, v17, 0, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    _Block_object_dispose(v20, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_107(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (!a2)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)fetchExperimentWithExperimentDeployment:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 611, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

    v11 = 0;
  }
  if ((objc_msgSend(v11, "hasDeploymentId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment.hasDeploymentId"));

  }
  objc_msgSend(v16, "experimentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "deploymentId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRICKNativeArtifactProvider _fetchExperimentWithExperimentId:deploymentId:options:completion:](self, "_fetchExperimentWithExperimentId:deploymentId:options:completion:", v12, v13, v9, v10);

}

- (void)fetchExperimentWithLatestDeploymentForExperimentId:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v14;
  v12 = v10;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 623, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId"));

    v11 = 0;
  }
  -[TRICKNativeArtifactProvider _fetchExperimentWithExperimentId:deploymentId:options:completion:](self, "_fetchExperimentWithExperimentId:deploymentId:options:completion:", v11, 0, v9, v12);

}

- (void)_fetchExperimentsWithCursor:(id)a3 withNamespaceNames:(id)a4 sinceDate:(id)a5 fetchRollbacksOnly:(BOOL)a6 options:(id)a7 resultsHandler:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  TRICKNativeArtifactProvider *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a6;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = (void *)objc_opt_new();
  if (v10)
  {
    -[TRICKNativeArtifactProvider _fetchNotificationsWithQueryType:withCursor:withNamespaceNames:sinceDate:options:resultsHandler:](self, "_fetchNotificationsWithQueryType:withCursor:withNamespaceNames:sinceDate:options:resultsHandler:", 1, 0, v13, v14, v15, v16);
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke;
    v18[3] = &unk_1E9331DD8;
    v24 = v16;
    v19 = v17;
    v20 = self;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    -[TRICKNativeArtifactProvider _fetchNotificationsWithQueryType:withCursor:withNamespaceNames:sinceDate:options:resultsHandler:](self, "_fetchNotificationsWithQueryType:withCursor:withNamespaceNames:sinceDate:options:resultsHandler:", 0, 0, v21, v22, v23, v18);

  }
}

void __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(void);
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
    case 2:
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
      goto LABEL_6;
    case 1:
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unexpected code path for fetchExperimentsWithCursor. The operation is not cancellable.", buf, 2u);
      }

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_6:
      v12();
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v9);
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v9);
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke_116;
      v18[3] = &unk_1E9331DB0;
      v21 = *(id *)(a1 + 72);
      v19 = v11;
      v20 = *(id *)(a1 + 32);
      objc_msgSend(v14, "_fetchNotificationsWithQueryType:withCursor:withNamespaceNames:sinceDate:options:resultsHandler:", 1, 0, v15, v16, v17, v18);

      break;
    default:
      break;
  }

}

void __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke_116(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(void);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
    case 2:
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_8;
    case 1:
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unexpected code path for _fetchNotificationsWithQueryType. The operation is not cancellable.", v17, 2u);
      }

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_8;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);
      v14 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0DC0CD8], 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortUsingDescriptors:", v16);

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_8:
      v12();
      break;
    default:
      break;
  }

}

- (void)_fetchNotificationsWithQueryType:(unint64_t)a3 withCursor:(id)a4 withNamespaceNames:(id)a5 sinceDate:(id)a6 options:(id)a7 resultsHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  TRICKNativeArtifactProvider *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  TRIDateProviding *dateProvider;
  void *v42;
  NSObject *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  TRICKNativeArtifactProvider *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  unint64_t v80;
  _QWORD v81[4];
  id v82;
  void *v83;
  uint8_t buf[4];
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v71 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (id)*MEMORY[0x1E0DC0CD8];
  v19 = (void *)objc_opt_new();
  v20 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke;
  v81[3] = &unk_1E9331E00;
  v21 = v19;
  v82 = v21;
  v22 = (void *)MEMORY[0x1D8232C48](v81);
  v72[0] = v20;
  v72[1] = 3221225472;
  v72[2] = __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_118;
  v72[3] = &unk_1E9331E90;
  v69 = v21;
  v73 = v69;
  v23 = v16;
  v74 = v23;
  v24 = v17;
  v25 = v18;
  v68 = v24;
  v79 = v24;
  v80 = a3;
  v26 = a3;
  v27 = self;
  v75 = self;
  v76 = v25;
  v28 = v25;
  v29 = v15;
  v30 = v71;
  v31 = v29;
  v77 = v29;
  v32 = v14;
  v78 = v32;
  v33 = (void *)MEMORY[0x1D8232C48](v72);
  +[TRIClientExperimentArtifact allReferencedCKRecordKeys](TRIClientExperimentArtifact, "allReferencedCKRecordKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v32;
  if (v71)
  {
    v67 = v31;
    -[TRICKNativeArtifactProvider queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](v27, "queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v71, v34, v23, v22, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v23;
    goto LABEL_17;
  }
  v66 = v28;
  v64 = v23;
  v65 = v22;
  if (v31)
  {
    v37 = v31;
    v38 = (void *)objc_opt_new();
LABEL_6:
    TRILogCategory_Server();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      formatLoggingDate(v37);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v85 = v44;
      _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "CKNative checking for new experiments since %{public}@", buf, 0xCu);

    }
    v45 = 0x1E0CB3000uLL;
    v67 = v37;
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K > %@"), v28, v37);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v46);

    goto LABEL_9;
  }
  -[TRICKNativeArtifactProvider container](v27, "container");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v39);

  dateProvider = v27->_dateProvider;
  -[TRICKNativeArtifactProvider teamId](v27, "teamId");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDateProviding lastFetchDateWithType:container:teamId:](dateProvider, "lastFetchDateWithType:container:teamId:", 0, v40, v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)objc_opt_new();
  if (v37)
    goto LABEL_6;
  v67 = 0;
  v45 = 0x1E0CB3000;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "populationType");

  v49 = *(void **)(v45 + 2176);
  v50 = *MEMORY[0x1E0DC0CF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), v50, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v53);

  if (v26)
  {
    objc_msgSend(*(id *)(v45 + 2176), "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0D28], &unk_1E9363C30);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v54);
    v22 = v65;
    v28 = v66;
  }
  else
  {
    objc_msgSend(v70, "allObjects");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v65;
    if (objc_msgSend(v54, "count"))
    {
      objc_msgSend(*(id *)(v45 + 2176), "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), *MEMORY[0x1E0DC0D40], v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v55);

    }
    objc_msgSend(*(id *)(v45 + 2176), "triLoggablePredicateWithFormat:", CFSTR("%K IN %@"), *MEMORY[0x1E0DC0D28], &unk_1E9363780);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v56);

    v28 = v66;
  }

  -[TRICKNativeArtifactProvider container](v27, "container");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "containerIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isEqualToString:", *MEMORY[0x1E0DC0BC0]);

  if ((v59 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K IN %@"), *MEMORY[0x1E0DC0CE0], &unk_1E9363798);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v60);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v38);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v64;
  -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](v27, "queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0CD0], v61, v34, v64, v22, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
LABEL_17:
  -[TRICKNativeArtifactProvider container](v27, "container");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "publicCloudDatabase");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addOperation:", v35);

}

void __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "received experiment notification for ckRecordID %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  BOOL v56;
  BOOL v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  _QWORD v65[5];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  void *v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218498;
    v74 = v8;
    v75 = 2112;
    v76 = v5;
    v77 = 2114;
    v78 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "finished fetchExperiment query with %tu results cursor %@ error %{public}@", buf, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_58;
  }
  v60 = v5;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("deploymentDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortUsingDescriptors:", v13);

  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v74 = v15;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "received %lu experiment records from CloudKit", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v16);

  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v61 = (void *)objc_opt_new();
  v62 = (void *)objc_opt_new();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = *(id *)(a1 + 32);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v68;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v68 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v21);
        objc_msgSend(*(id *)(a1 + 48), "namespaceDescriptorProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "teamId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIClientExperimentArtifact artifactFromCKRecordResult:withNamespaceDescriptorProvider:container:teamId:requireDeploymentId:completion:](TRIClientExperimentArtifact, "artifactFromCKRecordResult:withNamespaceDescriptorProvider:container:teamId:requireDeploymentId:completion:", v22, v23, v17, v24, *(_QWORD *)(a1 + 88) == 0, &__block_literal_global_122);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (!v26)
        {
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          objc_msgSend(v25, "experimentId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v74 = (uint64_t)v32;
          v33 = v30;
          v34 = "received CloudKit record without deployment date for experiment %@";
          v35 = 12;
          goto LABEL_25;
        }
        if (*(_QWORD *)(a1 + 64) && objc_msgSend(v26, "compare:") == -1)
        {
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          objc_msgSend(v25, "experimentId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(void **)(a1 + 64);
          *(_DWORD *)buf = 138412802;
          v74 = (uint64_t)v32;
          v75 = 2112;
          v76 = v27;
          v77 = 2112;
          v78 = v37;
          v33 = v30;
          v34 = "received CloudKit record with too old deployment date for experiment %@: %@ < %@";
          v35 = 32;
LABEL_25:
          _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, v34, buf, v35);
LABEL_26:

          goto LABEL_30;
        }
        if (!v25
          || (objc_msgSend(v25, "experimentId"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v28,
              !v28))
        {
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          objc_msgSend(v22, "recordID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "experimentId");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v74 = (uint64_t)v32;
          v75 = 2112;
          v76 = v36;
          _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "unable to construct artifact from CKRecord %@ for experiment %@", buf, 0x16u);

          goto LABEL_26;
        }
        objc_msgSend(v25, "experimentId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "experimentType") == 5)
        {
          v31 = v62;
LABEL_29:
          objc_msgSend(v31, "addObject:", v25);
          goto LABEL_30;
        }
        if (*(_QWORD *)(a1 + 88) == 1)
        {
          v31 = v61;
          goto LABEL_29;
        }
        if (!v30)
        {
          objc_msgSend(v25, "experimentId");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v25, v38);

          TRILogCategory_Server();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v25, "experimentId");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v74 = (uint64_t)v40;
            _os_log_debug_impl(&dword_1D207F000, v39, OS_LOG_TYPE_DEBUG, "generated artifact for experiment %@", buf, 0xCu);

          }
          v30 = 0;
        }
LABEL_30:

        ++v21;
      }
      while (v19 != v21);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      v19 = v41;
    }
    while (v41);
  }

  v10 = v63;
  objc_msgSend(v63, "allValues");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "allObjects");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "arrayByAddingObjectsFromArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "allObjects");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "arrayByAddingObjectsFromArray:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = *(_QWORD *)(a1 + 80);
  v5 = v60;
  if (v60)
    v48 = 3;
  else
    v48 = 4;
  v49 = (void *)objc_msgSend(v46, "copy");
  (*(void (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(v47 + 16))(v47, v48, v49, 0, 0);

  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 604800.0);
  v51 = *(void **)(a1 + 32);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_124;
  v65[3] = &unk_1E9331E68;
  v65[4] = *(_QWORD *)(a1 + 56);
  v52 = v50;
  v66 = v52;
  v53 = objc_msgSend(v51, "indexOfObjectPassingTest:", v65);
  if (v53 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v54 = *(id *)(a1 + 64);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!*(_QWORD *)(a1 + 88))
  {
    if (*(_QWORD *)(a1 + 64))
      v56 = objc_msgSend(v54, "compare:") != 1;
    else
      v56 = 0;
    v57 = (_DWORD)v17 == 2 && *(_QWORD *)(a1 + 72) != 0;
    if (!v54)
      v56 = 1;
    if (!v56 && !v57)
    {
      objc_msgSend(*(id *)(a1 + 48), "dateProvider");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "teamId");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setLastFetchDate:type:container:teamId:", v54, 0, v17, v59);

    }
  }
  if (v60)
    objc_msgSend(*(id *)(a1 + 48), "_fetchNotificationsWithQueryType:withCursor:withNamespaceNames:sinceDate:options:resultsHandler:", *(_QWORD *)(a1 + 88), v60, *(_QWORD *)(a1 + 72), v54, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));

  v6 = 0;
LABEL_58:

}

BOOL __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_124(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 40)) == -1;
  else
    v5 = 0;

  return v5;
}

- (void)fetchExperimentNotificationsForLimitedCarryExperimentWithManager:(id)a3 options:(id)a4 rollbacksOnly:(BOOL)a5 completion:(id)a6
{
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  _BOOL4 v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  TRICKNativeArtifactProvider *v77;
  id v78;
  id v79;
  id v80;
  uint8_t *v81;
  int v82;
  uint8_t buf[8];
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;
  _QWORD v92[3];

  v59 = a5;
  v92[1] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v52 = a4;
  v54 = a6;
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "fetching limited carry experiments", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "populationType");

  if (v10 != 3)
  {
    TRILogCategory_Server();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Unable to fetch limited carry experiments, user must be member of INTERNAL population", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch limited carry experiments, user must be member of INTERNAL population"));
    v53 = (id)objc_claimAutoreleasedReturnValue();
    v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v91 = *MEMORY[0x1E0CB2D50];
    v92[0] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v47);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v54 + 2))(v54, 0, 0, 0, v50);
    goto LABEL_32;
  }
  -[TRICKNativeArtifactProvider container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v11);

  v53 = (id)*MEMORY[0x1E0DC0CD8];
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke;
  v87[3] = &unk_1E9331E00;
  v16 = v14;
  v88 = v16;
  v64 = (void *)MEMORY[0x1D8232C48](v87);
  *(_QWORD *)buf = 0;
  v84 = buf;
  v85 = 0x2020000000;
  v86 = 0;
  v74[0] = v15;
  v74[1] = 3221225472;
  v74[2] = __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke_138;
  v74[3] = &unk_1E9331ED8;
  v48 = v16;
  v75 = v48;
  v60 = v52;
  v76 = v60;
  v17 = v54;
  v80 = v17;
  v82 = v12;
  v77 = self;
  v78 = v53;
  v50 = v13;
  v79 = v50;
  v81 = buf;
  v63 = (void *)MEMORY[0x1D8232C48](v74);
  objc_msgSend(v51, "lcExperiments");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v49, "count"))
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 4, MEMORY[0x1E0C9AA60], 0, 0);
    v44 = v49;
    goto LABEL_31;
  }
  v58 = (void *)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v18 = v49;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
  if (!v19)
    goto LABEL_19;
  v62 = *(_QWORD *)v71;
  v61 = *MEMORY[0x1E0DC0CF8];
  v57 = *MEMORY[0x1E0DC0D10];
  v55 = *MEMORY[0x1E0DC0CE8];
  v56 = *MEMORY[0x1E0DC0D28];
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v71 != v62)
        objc_enumerationMutation(v18);
      v21 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v20);
      v22 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v18, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), v61, &unk_1E93637B0, v48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v25);

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ExperimentID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DeploymentID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "integerValue"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), v57, v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v29);

        if (v59)
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), v56, &unk_1E9363C30);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);
          goto LABEL_15;
        }
        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), v55, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);
LABEL_15:

        }
        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObject:", v31);

      }
      objc_autoreleasePoolPop(v22);
      ++v20;
    }
    while (v19 != v20);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
  }
  while (v19);
LABEL_19:

  v32 = objc_msgSend(v58, "count");
  *((_QWORD *)v84 + 3) += v32;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v33 = v58;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v89, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v67;
    v36 = *MEMORY[0x1E0DC0CD0];
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v67 != v35)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v37);
        v39 = (void *)MEMORY[0x1D8232A5C]();
        +[TRIClientExperimentArtifact allReferencedCKRecordKeys](TRIClientExperimentArtifact, "allReferencedCKRecordKeys");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v36, v38, v40, v60, v64, v63);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[TRICKNativeArtifactProvider container](self, "container");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "publicCloudDatabase");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addOperation:", v41);

        objc_autoreleasePoolPop(v39);
        ++v37;
      }
      while (v34 != v37);
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v89, 16);
    }
    while (v34);
  }

  v44 = v49;
LABEL_31:

  _Block_object_dispose(buf, 8);
LABEL_32:

}

void __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "received experiment notification for limited carry ckRecordID %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  void *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218498;
    v49 = v8;
    v50 = 2112;
    v51 = v5;
    v52 = 2114;
    v53 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "finished fetchExperiment query with %tu results cursor %@ error %{public}@", buf, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  v39 = v5;
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("deploymentDate"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortUsingDescriptors:", v14);

  TRILogCategory_Server();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v49 = v16;
    _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "received %lu experiment records from CloudKit", buf, 0xCu);
  }

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = *(id *)(a1 + 32);
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(*(id *)(a1 + 48), "namespaceDescriptorProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(unsigned int *)(a1 + 88);
        objc_msgSend(*(id *)(a1 + 48), "teamId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIClientExperimentArtifact artifactFromCKRecordResult:withNamespaceDescriptorProvider:container:teamId:requireDeploymentId:completion:](TRIClientExperimentArtifact, "artifactFromCKRecordResult:withNamespaceDescriptorProvider:container:teamId:requireDeploymentId:completion:", v21, v23, v24, v25, 1, &__block_literal_global_140);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          objc_msgSend(v26, "experimentId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = (uint64_t)v33;
          _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "received CloudKit record without deployment date for experiment %@", buf, 0xCu);
          goto LABEL_26;
        }
        if (!v26
          || (objc_msgSend(v26, "experimentId"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v28,
              !v28))
        {
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          objc_msgSend(v21, "recordID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "experimentId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = (uint64_t)v33;
          v50 = 2112;
          v51 = v34;
          _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "unable to construct artifact from CKRecord %@ for experiment %@", buf, 0x16u);

LABEL_26:
          goto LABEL_23;
        }
        objc_msgSend(v26, "experimentId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          objc_msgSend(v26, "experimentId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v26, v31);

          TRILogCategory_Server();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v26, "experimentId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = (uint64_t)v35;
            _os_log_debug_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEBUG, "generated artifact for experiment %@", buf, 0xCu);

          }
          v30 = 0;
        }
LABEL_23:

        objc_autoreleasePoolPop(v22);
        ++v20;
      }
      while (v18 != v20);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v18 = v36;
    }
    while (v36);
  }

  v37 = *(void **)(a1 + 64);
  v10 = v40;
  objc_msgSend(v40, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObjectsFromArray:", v38);

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v5 = v39;
  if (v39)
  {
    v6 = 0;
    goto LABEL_31;
  }
  v6 = 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    goto LABEL_31;
  v11 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_5:
  v11();
LABEL_31:

}

- (void)fetchExperimentNotificationsWithNamespaceNames:(id)a3 rollbacksOnly:(BOOL)a4 lastFetchDateOverride:(id)a5 options:(id)a6 completion:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  TRIDateProviding *dateProvider;
  void *v18;
  void *v19;
  id v20;

  v10 = a4;
  v20 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[TRICKNativeArtifactProvider container](self, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v15);

  if (v12)
  {
    -[TRICKNativeArtifactProvider _fetchExperimentsWithCursor:withNamespaceNames:sinceDate:fetchRollbacksOnly:options:resultsHandler:](self, "_fetchExperimentsWithCursor:withNamespaceNames:sinceDate:fetchRollbacksOnly:options:resultsHandler:", 0, v20, v12, v10, v13, v14);
  }
  else
  {
    dateProvider = self->_dateProvider;
    -[TRICKNativeArtifactProvider teamId](self, "teamId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIDateProviding lastFetchDateWithType:container:teamId:](dateProvider, "lastFetchDateWithType:container:teamId:", 0, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider _fetchExperimentsWithCursor:withNamespaceNames:sinceDate:fetchRollbacksOnly:options:resultsHandler:](self, "_fetchExperimentsWithCursor:withNamespaceNames:sinceDate:fetchRollbacksOnly:options:resultsHandler:", 0, v20, v19, v10, v13, v14);

  }
}

+ (id)cloudkitIdentifierForContainer:(int)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  id v7;

  if (a3 == 2)
  {
    v6 = (id *)MEMORY[0x1E0DC0BC0];
  }
  else
  {
    if (a3 != 1)
    {
      v7 = 0;
      return v7;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0DC0E08]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    v6 = (id *)MEMORY[0x1E0DC0BD0];
    if (v5 == 4)
      v6 = (id *)MEMORY[0x1E0DC0BC8];
  }
  v7 = *v6;
  return v7;
}

+ (int)containerFromCkContainer:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  char v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC0BD0]);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "containerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC0BC0]);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(v3, "containerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC0BC8]);

    }
  }

  return v6;
}

- (id)fetchTreatmentWithId:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRICancelableCKOperation *v12;
  uint64_t v13;
  id v14;
  void *v15;
  TRICancelableCKOperation *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TRICancelableCKOperation *v27;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *context;
  _QWORD v34[4];
  TRICancelableCKOperation *v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1038, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1036, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v12 = -[TRICancelableCKOperation initWithOperation:]([TRICancelableCKOperation alloc], "initWithOperation:", 0);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__17;
  v49[4] = __Block_byref_object_dispose__17;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__17;
  v47[4] = __Block_byref_object_dispose__17;
  v48 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v13 = MEMORY[0x1E0C809B0];
  v46[3] = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke;
  v41[3] = &unk_1E9331F00;
  v43 = v47;
  v14 = v9;
  v42 = v14;
  v44 = v49;
  v45 = v46;
  v15 = (void *)MEMORY[0x1D8232C48](v41);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke_153;
  v34[3] = &unk_1E9331F28;
  v16 = v12;
  v35 = v16;
  v32 = v11;
  v37 = v32;
  v38 = v46;
  v17 = v10;
  v36 = v17;
  v39 = v49;
  v40 = v47;
  v18 = (void *)MEMORY[0x1D8232C48](v34);
  context = (void *)MEMORY[0x1D8232A5C]();
  v19 = *MEMORY[0x1E0DC0DF8];
  objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0DF8], v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC0DE8];
  v51[0] = v19;
  v51[1] = v21;
  v22 = *MEMORY[0x1E0DC0DE0];
  v51[2] = *MEMORY[0x1E0DC0DF0];
  v51[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0DC8], v20, v23, v17, v15, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRICKNativeArtifactProvider container](self, "container");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "publicCloudDatabase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOperation:", v24);

  -[TRICancelableCKOperation addOperation:](v16, "addOperation:", v24);
  v27 = v16;

  objc_autoreleasePoolPop(context);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(v49, 8);
  return v27;
}

void __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = a1[4];
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "recordName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v11;
        v21 = 2114;
        v22 = v12;
        _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Multiple records retrieved for treatmentId: %{public}@. Picking the first one (CKRecordId: %{public}@)", (uint8_t *)&v19, 0x16u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC0EA8], "treatmentFromCKRecord:treatmentSize:", v8, *(_QWORD *)(a1[7] + 8) + 24);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[5] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
        objc_msgSend(v8, "recordID");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1[6] + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

      }
    }
  }

}

void __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke_153(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(void);
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (_isUserCancellation(v7, *(void **)(a1 + 32)))
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_6:
    v4();
    goto LABEL_7;
  }
  if (!v7)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_7:

}

- (id)fetchAssetsWithIndexes:(id)a3 fromTreatmentWithRecordId:(id)a4 options:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TRICancelableCKOperation *v18;
  uint64_t v19;
  void *v20;
  TRICancelableCKOperation *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  TRICancelableCKOperation *v37;
  TRICancelableCKOperation *v38;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *context;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  TRICancelableCKOperation *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = v17;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIndexes"));

    v17 = v40;
    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = v17;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

      v17 = v44;
      if (v44)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = v17;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  v17 = v42;
  if (!v15)
    goto LABEL_13;
LABEL_4:
  if (v17)
    goto LABEL_5;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = v17;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  v17 = v46;
LABEL_5:
  v18 = -[TRICancelableCKOperation initWithOperation:]([TRICancelableCKOperation alloc], "initWithOperation:", 0);
  if (objc_msgSend(v13, "count"))
  {
    v60[0] = MEMORY[0x1E0C809B0];
    v19 = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke;
    v60[3] = &unk_1E9331F50;
    v51 = v16;
    v61 = v16;
    v20 = (void *)MEMORY[0x1D8232C48](v60);
    v54[0] = v19;
    v54[1] = 3221225472;
    v54[2] = __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2;
    v54[3] = &unk_1E9331F78;
    v21 = v18;
    v55 = v21;
    v49 = v17;
    v59 = v17;
    v52 = v15;
    v22 = v15;
    v56 = v22;
    v53 = v14;
    v23 = v14;
    v57 = v23;
    v50 = v13;
    v24 = v13;
    v58 = v24;
    v25 = (void *)MEMORY[0x1D8232C48](v54);
    context = (void *)MEMORY[0x1D8232A5C]();
    v26 = objc_alloc(MEMORY[0x1E0C94E18]);
    v64 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithRecordIDs:", v27);

    objc_msgSend(v28, "setPerRecordProgressBlock:", v20);
    objc_msgSend(v28, "setFetchRecordsCompletionBlock:", v25);
    -[TRICKNativeArtifactProvider configurationFromOptions:](self, "configurationFromOptions:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setConfiguration:", v29);

    v30 = v24;
    v31 = (void *)objc_opt_new();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2_163;
    v62[3] = &unk_1E9331FA0;
    v32 = v31;
    v63 = v32;
    objc_msgSend(v30, "enumerateRangesUsingBlock:", v62);

    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v32;
      _os_log_debug_impl(&dword_1D207F000, v33, OS_LOG_TYPE_DEBUG, "desiredKeysForAssetIndexes: %@", buf, 0xCu);
    }

    objc_msgSend(v32, "arrayByAddingObject:", *MEMORY[0x1E0DC0DE0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDesiredKeys:", v34);

    -[TRICKNativeArtifactProvider container](self, "container");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "publicCloudDatabase");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addOperation:", v28);

    -[TRICancelableCKOperation addOperation:](v21, "addOperation:", v28);
    v37 = v21;

    objc_autoreleasePoolPop(context);
    v15 = v52;
    v14 = v53;
    v16 = v51;
    v17 = v49;
    v13 = v50;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 4, MEMORY[0x1E0C9AA70], 0, 0);
    v38 = v18;
  }

  return v18;
}

uint64_t __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_isUserCancellation(v6, *(void **)(a1 + 32)))
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC0EA8], "assetURLsFromCKRecord:assetIndexes:", v8, *(_QWORD *)(a1 + 56));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

        goto LABEL_8;
      }
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 48);
        v13 = 138412290;
        v14 = v12;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "CKFetchRecordsOperation did not return a record with recordId %@.", (uint8_t *)&v13, 0xCu);
      }

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v9();
LABEL_8:

    goto LABEL_9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_9:

}

void __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2_163(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C95048], "keyForListField:withIndexRange:", *MEMORY[0x1E0DC0DD8], a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C95048], "keyForListField:withIndexRange:", *MEMORY[0x1E0DC0DD0], a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)fetchRolloutNotificationsDateAscendingWithOptions:(id)a3 lastFetchDateOverride:(id)a4 namespaceNames:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  TRIDateProviding *dateProvider;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[TRICKNativeArtifactProvider container](self, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v13);

  if (v10)
  {
    -[TRICKNativeArtifactProvider _fetchRolloutNotificationsWithCursor:options:sinceDate:namespaceNames:resultsHandler:](self, "_fetchRolloutNotificationsWithCursor:options:sinceDate:namespaceNames:resultsHandler:", 0, v18, v10, v11, v12);
  }
  else
  {
    dateProvider = self->_dateProvider;
    -[TRICKNativeArtifactProvider teamId](self, "teamId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIDateProviding lastFetchDateWithType:container:teamId:](dateProvider, "lastFetchDateWithType:container:teamId:", 1, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider _fetchRolloutNotificationsWithCursor:options:sinceDate:namespaceNames:resultsHandler:](self, "_fetchRolloutNotificationsWithCursor:options:sinceDate:namespaceNames:resultsHandler:", 0, v18, v17, v11, v12);

  }
}

- (void)_fetchRolloutNotificationsWithCursor:(id)a3 options:(id)a4 sinceDate:(id)a5 namespaceNames:(id)a6 resultsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  TRIDateProviding *dateProvider;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  TRICKNativeArtifactProvider *v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[4];
  _QWORD v63[5];
  id v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__17;
  v63[4] = __Block_byref_object_dispose__17;
  v64 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v16 = MEMORY[0x1E0C809B0];
  v62[3] = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke;
  v57[3] = &unk_1E9331FC8;
  v57[4] = self;
  v17 = v13;
  v58 = v17;
  v60 = v63;
  v18 = v15;
  v59 = v18;
  v61 = v62;
  v46 = (void *)MEMORY[0x1D8232C48](v57);
  v49[0] = v16;
  v49[1] = 3221225472;
  v49[2] = __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke_168;
  v49[3] = &unk_1E9331FF0;
  v55 = v62;
  v19 = v12;
  v50 = v19;
  v45 = v18;
  v54 = v45;
  v51 = self;
  v20 = v17;
  v52 = v20;
  v56 = v63;
  v21 = v14;
  v53 = v21;
  v48 = (void *)MEMORY[0x1D8232C48](v49);
  +[TRIClientRolloutArtifact allReferencedCKRecordKeys](TRIClientRolloutArtifact, "allReferencedCKRecordKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    -[TRICKNativeArtifactProvider queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v47, v22, v19, v46, v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v20)
    {
      -[TRICKNativeArtifactProvider container](self, "container");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v24);

      dateProvider = self->_dateProvider;
      -[TRICKNativeArtifactProvider teamId](self, "teamId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIDateProviding lastFetchDateWithType:container:teamId:](dateProvider, "lastFetchDateWithType:container:teamId:", 1, v25, v27);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    v44 = (void *)objc_opt_new();
    if (v20)
    {
      TRILogCategory_Server();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        formatLoggingDate(v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v29;
        _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "CKNative checking for new rollouts since %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K > %@"), *MEMORY[0x1E0DC0D88], v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v30);

    }
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "populationType");

    v33 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), *MEMORY[0x1E0DC0DA0], v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v36);

    objc_msgSend(v21, "allObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), *MEMORY[0x1E0DC0D98], v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v38);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v44);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0D80], v39, v41, v22, v19, v46, v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[TRICKNativeArtifactProvider container](self, "container");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "publicCloudDatabase");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addOperation:", v23);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v63, 8);

}

void __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v11;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Received RolloutNotification with CKRecordID %{public}@", (uint8_t *)&v31, 0xCu);

    }
    v12 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(*(id *)(a1 + 32), "namespaceDescriptorProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIClientRolloutArtifact artifactFromCKRecord:namespaceDescriptorProvider:error:](TRIClientRolloutArtifact, "artifactFromCKRecord:namespaceDescriptorProvider:error:", v8, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_9;
    objc_msgSend(v14, "deploymentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    v17 = objc_msgSend(v15, "compare:", v16);

    if (v17 == 1)
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "deployment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDesc");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deploymentDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v29;
        v33 = 2112;
        v34 = v30;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Received record with future deployment date for rollout %{public}@: %@", (uint8_t *)&v31, 0x16u);

      }
LABEL_8:

LABEL_9:
      objc_autoreleasePoolPop(v12);
      goto LABEL_18;
    }
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v14, "deploymentDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "compare:", *(_QWORD *)(a1 + 40));

      if (v20 == -1)
      {
        TRILogCategory_Server();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "deployment");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "shortDesc");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deploymentDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *(_QWORD *)(a1 + 40);
          v31 = 138543874;
          v32 = v25;
          v33 = 2112;
          v34 = v26;
          v35 = 2112;
          v36 = v27;
          _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Received CloudKit record with too old deployment date for rollout %{public}@: %@ < %@", (uint8_t *)&v31, 0x20u);

        }
        goto LABEL_8;
      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 604800.0);
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0D88]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22 && objc_msgSend(v22, "compare:", v21) == -1)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v23);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    objc_autoreleasePoolPop(v12);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
LABEL_18:

}

void __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v18 = 134218498;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchRolloutNotifications query with %tu results cursor %@ error %{public}@", (uint8_t *)&v18, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v11);

    v13 = (void *)MEMORY[0x1D8232A5C]();
    if (v5)
      v14 = 3;
    else
      v14 = 4;
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v14, 0, 0, 0);
    objc_autoreleasePoolPop(v13);
    if (!*(_QWORD *)(a1 + 48) || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "compare:") == 1)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Not setting lastFetchDate since we're only fetching a subset of the namespaces.", (uint8_t *)&v18, 2u);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "dateProvider");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 40), "teamId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setLastFetchDate:type:container:teamId:](v15, "setLastFetchDate:type:container:teamId:", v16, 1, v12, v17);

      }
    }
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "_fetchRolloutNotificationsWithCursor:options:sinceDate:namespaceNames:resultsHandler:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

- (void)fetchRolloutNotificationsDateDescendingWithOptions:(id)a3 completion:(id)a4
{
  -[TRICKNativeArtifactProvider _fetchRolloutNotificationsWithCursor:options:completion:](self, "_fetchRolloutNotificationsWithCursor:options:completion:", 0, a3, a4);
}

- (void)_fetchRolloutNotificationsWithCursor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *context;
  id v31;
  _QWORD v32[4];
  id v33;
  TRICKNativeArtifactProvider *v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[4];
  void *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a4;
  v9 = a5;
  context = (void *)MEMORY[0x1D8232A5C]();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v43 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke;
  v38[3] = &unk_1E9332018;
  v38[4] = self;
  v11 = v9;
  v39 = v11;
  v40 = v42;
  v41 = v44;
  v12 = (void *)MEMORY[0x1D8232C48](v38);
  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke_169;
  v32[3] = &unk_1E9332040;
  v36 = v44;
  v13 = v8;
  v33 = v13;
  v14 = v11;
  v37 = v42;
  v34 = self;
  v35 = v14;
  v15 = (void *)MEMORY[0x1D8232C48](v32);
  +[TRIClientRolloutArtifact allReferencedCKRecordKeys](TRIClientRolloutArtifact, "allReferencedCKRecordKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[TRICKNativeArtifactProvider queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v31, v16, v13, v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "populationType");

    v20 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), *MEMORY[0x1E0DC0DA0], v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("deploymentDate"), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0D80], v24, v26, v16, v13, v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[TRICKNativeArtifactProvider container](self, "container");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "publicCloudDatabase");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addOperation:", v17);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  objc_autoreleasePoolPop(context);

}

void __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Received RolloutNotification with CKRecordID %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v12 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(*(id *)(a1 + 32), "namespaceDescriptorProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIClientRolloutArtifact artifactFromCKRecord:namespaceDescriptorProvider:error:](TRIClientRolloutArtifact, "artifactFromCKRecord:namespaceDescriptorProvider:error:", v8, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      objc_autoreleasePoolPop(v12);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    else
    {
      objc_autoreleasePoolPop(v12);
    }
  }

}

void __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v13 = 134218498;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchRolloutNotifications query with %tu results cursor %@ error %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = (void *)MEMORY[0x1D8232A5C]();
    if (v5)
      v12 = 3;
    else
      v12 = 4;
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12, 0, 0, 0, 0);
    objc_autoreleasePoolPop(v11);
    if (v5 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 40), "_fetchRolloutNotificationsWithCursor:options:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)fetchRolloutNotificationWithDeployment:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "rolloutId");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v10, "deploymentId");

  objc_msgSend(v11, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRICKNativeArtifactProvider _fetchRolloutNotificationWithRolloutId:deploymentId:options:completion:](self, "_fetchRolloutNotificationWithRolloutId:deploymentId:options:completion:", v14, v13, v9, v8);

}

- (void)fetchRolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 options:(id)a4 completion:(id)a5
{
  -[TRICKNativeArtifactProvider _fetchRolloutNotificationWithRolloutId:deploymentId:options:completion:](self, "_fetchRolloutNotificationWithRolloutId:deploymentId:options:completion:", a3, 0, a4, a5);
}

- (void)_fetchRolloutNotificationWithRolloutId:(id)a3 deploymentId:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  TRICKNativeArtifactProvider *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  TRICKNativeArtifactProvider *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  void *v63;
  _QWORD v64[3];
  void *v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v50 = a5;
  v51 = a6;
  -[TRICKNativeArtifactProvider container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v12);

  if ((_DWORD)a6)
  {
    v47 = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0DC0], v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0D90], v11);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithValue:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "populationType");

    v18 = (void *)MEMORY[0x1E0CB3880];
    v19 = *MEMORY[0x1E0DC0DA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), v19, v21);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3528];
    v64[0] = v13;
    v64[1] = v15;
    v46 = (void *)v15;
    v64[2] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_opt_new();
    v44 = (void *)v13;
    v25 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke;
    v59[3] = &unk_1E9331D38;
    v26 = v10;
    v27 = v10;
    v60 = v27;
    v28 = v11;
    v61 = v28;
    v29 = v24;
    v62 = v29;
    v48 = (void *)MEMORY[0x1D8232C48](v59);
    v52[0] = v25;
    v52[1] = 3221225472;
    v52[2] = __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke_170;
    v52[3] = &unk_1E9332090;
    v42 = v27;
    v53 = v42;
    v54 = v28;
    v30 = v50;
    v55 = v30;
    v56 = v29;
    v57 = v47;
    v58 = v51;
    v43 = v29;
    v31 = MEMORY[0x1D8232C48](v52);
    v32 = *MEMORY[0x1E0DC0D80];
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("deploymentDate"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIClientRolloutArtifact allReferencedCKRecordKeys](TRIClientRolloutArtifact, "allReferencedCKRecordKeys");
    v35 = v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v31;
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](v47, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v32, v49, v34, v36, v30, v48, v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v26;
    v11 = v35;

    +[TRICKOperationGroupFactory groupForRolloutId:](TRICKOperationGroupFactory, "groupForRolloutId:", v42);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setGroup:", v39);

    -[TRICKNativeArtifactProvider container](v47, "container");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "publicCloudDatabase");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addOperation:", v38);

  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v67 = v10;
      v68 = 2112;
      v69 = v11;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "failed to fetch rollout %{public}@.%@ (unknown container)", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v51 + 2))(v51, 0, 0, 0, 0);
  }

}

void __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "recordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Received rollout notification for deployment %{public}@.%@ ckRecordID %@", (uint8_t *)&v9, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }

}

void __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke_170(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Finished fetchRolloutNotification query for deployment %{public}@.%@ error %@", buf, 0x20u);
  }

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (v9)
    {
      +[TRIClientRolloutArtifact artifactFromCKRecord:namespaceDescriptorProvider:error:](TRIClientRolloutArtifact, "artifactFromCKRecord:namespaceDescriptorProvider:error:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
    }
    else
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v21 = v13;
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find rollout ID %{public}@. Please verify rollout id is valid.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find rollout"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v16);
      v17 = v11;

      v10 = 0;
    }
    (*(void (**)(_QWORD, uint64_t, void *, _QWORD, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 4 * (v11 == 0), v10, 0, v11);

  }
}

- (void)fetchFactorPackSetWithId:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  TRICKNativeArtifactProvider *v30;
  id v31;
  _QWORD *v32;
  SEL v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v13 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke;
  v34[3] = &unk_1E9331E00;
  v14 = v12;
  v35 = v14;
  v15 = (void *)MEMORY[0x1D8232C48](v34);
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke_173;
  v26[3] = &unk_1E9332068;
  v16 = v9;
  v27 = v16;
  v17 = v14;
  v28 = v17;
  v18 = v10;
  v29 = v18;
  v19 = v11;
  v32 = v36;
  v33 = a2;
  v30 = self;
  v31 = v19;
  v20 = (void *)MEMORY[0x1D8232C48](v26);
  objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0D70], v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFactorPackSet allReferencedCKRecordKeys](TRIFactorPackSet, "allReferencedCKRecordKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0D58], v21, v22, v18, v15, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRICKNativeArtifactProvider container](self, "container");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "publicCloudDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addOperation:", v23);

  _Block_object_dispose(v36, 8);
}

void __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Received FactorPackSet with CKRecordID %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138544130;
    v35 = v8;
    v36 = 2048;
    v37 = v9;
    v38 = 2112;
    v39 = v5;
    v40 = 2114;
    v41 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchFactorPackSetId %{public}@ with %tu results cursor %@ error %{public}@", buf, 0x2Au);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_22:

    goto LABEL_23;
  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortUsingDescriptors:", v14);

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 2)
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v35 = v25;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Unexpectedly matched multiple records with FactorPackSetId %{public}@ (selecting most recent).", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), CFSTR("TRICKNativeArtifactProvider.m"), 1512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mostRecentlyModifiedRecord"));

    }
    +[TRIFactorPackSet artifactFromCKRecord:](TRIFactorPackSet, "artifactFromCKRecord:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "values");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), CFSTR("TRICKNativeArtifactProvider.m"), 1516, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("mostRecentlyModifiedRecord.values"));

    }
    objc_msgSend(v17, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0D68], 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "length");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v20);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    goto LABEL_22;
  }
  TRILogCategory_Server();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v35 = v24;
    _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "No records found matching FactorPackSetId %{public}@.", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_23:

}

- (id)fetchRecordIdsForAssetsWithIds:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  TRICancelableCKOperation *v13;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
  v13 = -[TRICancelableCKOperation initWithOperation:]([TRICancelableCKOperation alloc], "initWithOperation:", 0);
  if (objc_msgSend(v8, "count"))
    -[TRICKNativeArtifactProvider _fetchRecordIdsForAssetsWithIds:options:cursor:cancelableOp:resultBuffer:completion:](self, "_fetchRecordIdsForAssetsWithIds:options:cursor:cancelableOp:resultBuffer:completion:", v8, v9, 0, v13, v12, v11);
  else
    (*((void (**)(id, uint64_t, void *, _QWORD, _QWORD))v11 + 2))(v11, 4, v12, 0, 0);

  return v13;
}

- (void)_fetchRecordIdsForAssetsWithIds:(id)a3 options:(id)a4 cursor:(id)a5 cancelableOp:(id)a6 resultBuffer:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  TRICKNativeArtifactProvider *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke;
  v49[3] = &unk_1E9331E00;
  v21 = v18;
  v50 = v21;
  v40 = MEMORY[0x1D8232C48](v49);
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke_181;
  v42[3] = &unk_1E9332090;
  v22 = v21;
  v43 = v22;
  v23 = v17;
  v44 = v23;
  v39 = v19;
  v48 = v39;
  v24 = v15;
  v45 = v24;
  v46 = self;
  v25 = v14;
  v47 = v25;
  v41 = (void *)MEMORY[0x1D8232C48](v42);
  v26 = *MEMORY[0x1E0DC0C30];
  v52[0] = *MEMORY[0x1E0DC0C30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v16;
  v38 = v25;
  if (v16)
  {
    v29 = v16;
    v30 = (void *)v40;
    -[TRICKNativeArtifactProvider queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v29, v27, v24, v40, v41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDesiredKeys:", v32);

    objc_msgSend(v23, "addOperation:", v31);
    -[TRICKNativeArtifactProvider container](self, "container");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "publicCloudDatabase");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addOperation:", v31);
  }
  else
  {
    objc_msgSend(v25, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sortedArrayUsingSelector:", sel_compare_);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K IN %@"), v26, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0BE8], v33, v27, v24, v40, v41);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v34);
    -[TRICKNativeArtifactProvider container](self, "container");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "publicCloudDatabase");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addOperation:", v34);

    v30 = (void *)v40;
  }

}

void __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Received partial Asset record with CKRecordID %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0C30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      TRIValidateAssetId();
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "recordID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v8);

      }
    }
    else
    {
      TRILogCategory_Server();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "recordID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "No assetId found in CKRecord %{public}@", (uint8_t *)&v11, 0xCu);

      }
    }

  }
}

void __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218498;
    v28 = v8;
    v29 = 2112;
    v30 = (uint64_t)v5;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Finished Asset record fetch with %tu results cursor %@ error %{public}@", buf, 0x20u);
  }

  if (_isUserCancellation(v6, *(void **)(a1 + 40)))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_5:
    v9();
    goto LABEL_25;
  }
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_25;
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "_fetchRecordIdsForAssetsWithIds:options:cursor:cancelableOp:resultBuffer:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
    goto LABEL_25;
  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v12 == objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = *(id *)(a1 + 64);
  v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17, (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v14 = v17;
          goto LABEL_22;
        }
      }
      v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_22:

  TRILogCategory_Server();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend(*(id *)(a1 + 64), "count");
    v21 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218498;
    v28 = v20;
    v29 = 2048;
    v30 = v21;
    v31 = 2114;
    v32 = v14;
    _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Unable to find Asset record in CloudKit for all requested assetIds (requested: %tu, found: %tu). Example missing assetId: %{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_25:

}

- (id)fetchAssetsWithRecordIds:(id)a3 options:(id)a4 perRecordProgress:(id)a5 perRecordCompletionBlockOnSuccess:(id)a6 perRecordCompletionBlockOnError:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  TRICancelableCKOperation *v19;
  uint64_t v20;
  void *v21;
  TRICancelableCKOperation *v22;
  id v23;
  void *v24;
  void *v25;
  TRIPeekEnumerator *v26;
  void *v27;
  TRIPeekEnumerator *v28;
  TRIPeekEnumerator *v29;
  id v30;
  id v31;
  TRICancelableCKOperation *v32;
  uint64_t v33;
  void *v34;
  TRICancelableCKOperation *v35;
  TRICancelableCKOperation *v36;
  void *v38;
  TRICancelableCKOperation *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v46[4];
  TRIPeekEnumerator *v47;
  TRICKNativeArtifactProvider *v48;
  id v49;
  id v50;
  TRICancelableCKOperation *v51;
  id v52;
  id v53;
  id v54;
  SEL v55;
  _QWORD v56[4];
  TRICancelableCKOperation *v57;
  id v58;
  id v59;
  uint64_t *v60;
  _QWORD *v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = -[TRICancelableCKOperation initWithOperation:]([TRICancelableCKOperation alloc], "initWithOperation:", 0);
  if (objc_msgSend(v13, "count"))
  {
    v43 = v15;
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__184;
    v71 = __Block_byref_object_dispose__185;
    v72 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke;
    v64[3] = &unk_1E93320B8;
    v41 = v17;
    v65 = v17;
    v42 = v16;
    v66 = v16;
    v21 = (void *)MEMORY[0x1D8232C48](v64);
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__17;
    v62[4] = __Block_byref_object_dispose__17;
    v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v56[0] = v20;
    v56[1] = 3221225472;
    v56[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_187;
    v56[3] = &unk_1E9332130;
    v60 = &v67;
    v59 = v18;
    v39 = v19;
    v22 = v19;
    v57 = v22;
    v40 = v14;
    v23 = v14;
    v58 = v23;
    v61 = v62;
    v24 = (void *)MEMORY[0x1D8232C48](v56);
    v25 = (void *)MEMORY[0x1D8232A5C]();
    v26 = [TRIPeekEnumerator alloc];
    objc_msgSend(v13, "keyEnumerator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[TRIPeekEnumerator initWithEnumerator:](v26, "initWithEnumerator:", v27);

    objc_autoreleasePoolPop(v25);
    v46[0] = v20;
    v46[1] = 3221225472;
    v46[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2_193;
    v46[3] = &unk_1E9332158;
    v29 = v28;
    v55 = a2;
    v47 = v29;
    v48 = self;
    v49 = v13;
    v50 = v23;
    v15 = v43;
    v52 = v43;
    v30 = v21;
    v53 = v30;
    v31 = v24;
    v54 = v31;
    v32 = v22;
    v51 = v32;
    v33 = MEMORY[0x1D8232C48](v46);
    v34 = (void *)v68[5];
    v68[5] = v33;

    if ((*(unsigned __int8 (**)(void))(v68[5] + 16))())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRICKNativeArtifactProvider.m"), 1775, CFSTR("initial asset batch was unexpectedly empty"));

    }
    v35 = v51;
    v36 = v32;

    _Block_object_dispose(v62, 8);
    _Block_object_dispose(&v67, 8);

    v14 = v40;
    v17 = v41;
    v16 = v42;
    v19 = v39;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v18 + 2))(v18, 4, MEMORY[0x1E0C9AA70], 0, 0);
  }

  return v19;
}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Error receiving Asset record with CKRecord %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0C30]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Received Asset record with CKRecordID %{public}@, assetId %{public}@", (uint8_t *)&v15, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v7, v8);
  }

}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_187(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void (*v13)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD);
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  _QWORD v18[5];
  uint8_t buf[16];
  _QWORD v20[4];
  __int128 v21;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2;
  v20[3] = &unk_1E93320E0;
  v17 = *(_OWORD *)(a1 + 48);
  v8 = (id)v17;
  v21 = v17;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v20);
  if (_isUserCancellation(v6, *(void **)(a1 + 32)))
  {
    ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD, id))v9)[2](v9, 1, 0, 0, v6);
  }
  else
  {
    if (!v6)
    {
      if (v5)
      {
        v18[0] = v7;
        v18[1] = 3221225472;
        v18[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_189;
        v18[3] = &unk_1E9332108;
        v18[4] = *(_QWORD *)(a1 + 64);
        objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v18);
        if ((*(unsigned __int8 (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))() != 1)
          goto LABEL_12;
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v13 = v9[2];
        v14 = v9;
        v15 = 4;
      }
      else
      {
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Unexpected nil recordsByRecordId for fetchAssetsWithRecordIds", buf, 2u);
        }

        v13 = v9[2];
        v14 = v9;
        v15 = 0;
        v12 = 0;
      }
      v13(v14, v15, v12, 0, 0);
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, uint64_t, _QWORD, void *, id))v9)[2](v9, 2 * (v11 != 0), 0, v11, v6);
  }
LABEL_12:

}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;
  v10 = a5;
  v11 = a4;
  v12 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_189(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = 0;
  +[TRISignedAssetURL assetURLFromCKRecord:assetId:](TRISignedAssetURL, "assetURLFromCKRecord:assetId:", a3, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v8, v11);

  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    *a4 = 1;
  }

}

uint64_t __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2_193(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Creating new batch of assets for next query.", buf, 2u);
  }

  v5 = 0;
  v6 = 0;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "nextObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      break;
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), CFSTR("TRICKNativeArtifactProvider.m"), 1747, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("recordIdsForAssetIds[assetId]"));

    }
    v6 += objc_msgSend(v9, "downloadSize");
    objc_msgSend(v9, "recordId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    objc_msgSend(*(id *)(a1 + 32), "peekNextObject");
    v11 = objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v3, "count") <= 0x63 && v11)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), CFSTR("TRICKNativeArtifactProvider.m"), 1755, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("recordIdsForAssetIds[peek]"));

      }
      v13 = objc_msgSend(v12, "downloadSize") + v6;

      v5 = (void *)v11;
      if (v13 < 0x5F5E101)
        continue;
    }
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 134218240;
      v26 = v17;
      v27 = 2048;
      v28 = (double)v6 / 1000000.0;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Asset batch: %tu assets of cumulative size %.2f MB", buf, 0x16u);
    }

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v3);
    +[TRISignedAssetURL allReferencedCKRecordKeys](TRISignedAssetURL, "allReferencedCKRecordKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDesiredKeys:", v19);

    objc_msgSend(*(id *)(a1 + 40), "configurationFromOptions:", *(_QWORD *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConfiguration:", v20);

    objc_msgSend(v18, "setPerRecordProgressBlock:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v18, "setPerRecordCompletionBlock:", *(_QWORD *)(a1 + 80));
    objc_msgSend(v18, "setFetchRecordsCompletionBlock:", *(_QWORD *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 40), "container");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "publicCloudDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addOperation:", v18);

    objc_msgSend(*(id *)(a1 + 64), "addOperation:", v18);
    v23 = 0;
    v5 = (void *)v11;
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), CFSTR("TRICKNativeArtifactProvider.m"), 1743, CFSTR("terminating with nonempty batch which will not be processed"));
    v23 = 1;
LABEL_15:

    goto LABEL_18;
  }
  v23 = 1;
LABEL_18:

  objc_autoreleasePoolPop(v2);
  return v23;
}

- (id)fetchDiffSourceRecordIdsWithTargetAssetIds:(id)a3 isAcceptableSourceAssetId:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  TRICancelableCKOperation *v30;
  id v31;
  void *v32;
  TRICancelableCKOperation *v33;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  TRICancelableCKOperation *v45;
  uint64_t v46;
  NSObject *group;
  _QWORD block[4];
  id v50;
  TRICancelableCKOperation *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t v56;
  NSObject *v57;
  _QWORD *v58;
  _QWORD v59[5];
  id v60;
  _QWORD *v61;
  _QWORD v62[5];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  _QWORD v69[2];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v44 = a4;
  v43 = a5;
  v10 = a6;
  v45 = -[TRICancelableCKOperation initWithOperation:]([TRICancelableCKOperation alloc], "initWithOperation:", 0);
  v36 = v9;
  if (objc_msgSend(v9, "count"))
  {
    v35 = v10;
    v11 = (_QWORD *)objc_opt_new();
    v12 = objc_opt_new();
    v13 = (void *)v11[1];
    v11[1] = v12;

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v11);
    group = dispatch_group_create();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v9;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v46)
    {
      v41 = *(_QWORD *)v65;
      v40 = *MEMORY[0x1E0DC0C10];
      v14 = *MEMORY[0x1E0DC0C08];
      v38 = *MEMORY[0x1E0DC0BF0];
      v39 = *MEMORY[0x1E0DC0C18];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v65 != v41)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x1D8232A5C]();
          dispatch_group_enter(group);
          v62[0] = 0;
          v62[1] = v62;
          v62[2] = 0x3032000000;
          v62[3] = __Block_byref_object_copy__17;
          v62[4] = __Block_byref_object_dispose__17;
          v63 = 0;
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke;
          v59[3] = &unk_1E93322B0;
          v61 = v62;
          v18 = v44;
          v59[4] = v16;
          v60 = v18;
          v19 = (void *)MEMORY[0x1D8232C48](v59);
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_205;
          v53[3] = &unk_1E93321A8;
          v54 = v42;
          v20 = v43;
          v55 = v20;
          v56 = v16;
          v58 = v62;
          v57 = group;
          v21 = (void *)MEMORY[0x1D8232C48](v53);
          objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), v40, v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = v39;
          v69[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v14, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v38, v22, v25, v23, v20, v19, v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[TRICKNativeArtifactProvider container](self, "container");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "publicCloudDatabase");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addOperation:", v26);

          -[TRICancelableCKOperation addOperation:](v45, "addOperation:", v26);
          _Block_object_dispose(v62, 8);

          objc_autoreleasePoolPop(v17);
          ++v15;
        }
        while (v46 != v15);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v46);
    }

    dispatch_get_global_queue(17, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_207;
    block[3] = &unk_1E93321D0;
    v50 = v42;
    v30 = v45;
    v51 = v30;
    v52 = v35;
    v31 = v42;
    dispatch_group_notify(group, v29, block);

    v32 = v52;
    v33 = v30;

    v10 = v35;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 4, MEMORY[0x1E0C9AA70], 0, 0);
  }

  return v45;
}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  TRISizedCKRecordID *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8 && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v10 = *MEMORY[0x1E0DC0C18];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0C18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = *MEMORY[0x1E0DC0C08];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0C08]);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        TRIValidateAssetId();
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14 && (*(unsigned int (**)(void))(a1[5] + 16))())
        {
          TRILogCategory_Server();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (void *)a1[4];
            v24 = 138543618;
            v25 = v16;
            v26 = 2114;
            v27 = v14;
            _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ can be constructed by patching asset %{public}@, which is already on disk.", (uint8_t *)&v24, 0x16u);
          }

          v17 = [TRISizedCKRecordID alloc];
          objc_msgSend(v8, "recordID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[TRISizedCKRecordID initWithRecordId:downloadSize:](v17, "initWithRecordId:downloadSize:", v18, -[NSObject unsignedLongLongValue](v13, "unsignedLongLongValue"));
          v20 = *(_QWORD *)(a1[6] + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

        }
      }
      else
      {
        TRILogCategory_Server();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "recordID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138412546;
          v25 = v23;
          v26 = 2112;
          v27 = v12;
          _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "CKRecord %@ is missing key %@.", (uint8_t *)&v24, 0x16u);

        }
      }

    }
    else
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v22;
        v26 = 2112;
        v27 = v10;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "CKRecord %@ is missing key %@.", (uint8_t *)&v24, 0x16u);

      }
    }

  }
}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_205(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_2;
  v9[3] = &unk_1E9332180;
  v10 = v4;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 64);
  v8 = v4;
  objc_msgSend(v5, "runWithLockAcquired:", v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = 0;

    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch diff source for asset ID %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    if (!v7 || !*((_QWORD *)v4 + 3))
    {
      objc_storeStrong((id *)v4 + 2, v7);
      objc_storeStrong((id *)v4 + 3, *(id *)(a1 + 32));
    }

  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v10 = (void *)v3[1];
    if (v10)
      objc_msgSend(v10, "setObject:forKeyedSubscript:");
  }

}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_207(uint64_t a1)
{
  void (*v2)(void);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "unsafeGuardedData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (_isUserCancellation(*((void **)v3 + 3), *(void **)(a1 + 40)))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else if (*((_QWORD *)v3 + 2))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else if (*((_QWORD *)v3 + 3) || !*((_QWORD *)v3 + 1))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v2();

}

- (id)fetchDiffsWithRecordIds:(id)a3 options:(id)a4 perRecordProgress:(id)a5 perRecordCompletionBlockOnSuccess:(id)a6 perRecordCompletionBlockOnError:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  TRICancelableCKOperation *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  TRICKNativeArtifactProvider *v30;
  void *v31;
  void *v32;
  void *v33;
  TRICancelableCKOperation *v34;
  void *v35;
  TRICKNativeArtifactProvider *v36;
  void *v37;
  void *v38;
  TRICancelableCKOperation *v39;
  TRICancelableCKOperation *v40;
  void *context;
  TRICancelableCKOperation *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  TRICancelableCKOperation *v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;

  v14 = a3;
  v47 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = -[TRICancelableCKOperation initWithOperation:]([TRICancelableCKOperation alloc], "initWithOperation:", 0);
  if (objc_msgSend(v14, "count"))
  {
    v20 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke;
    v53[3] = &unk_1E93320B8;
    v54 = v17;
    v55 = v16;
    v21 = MEMORY[0x1D8232C48](v53);
    v48[0] = v20;
    v48[1] = 3221225472;
    v48[2] = __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_208;
    v48[3] = &unk_1E9332220;
    v43 = v19;
    v49 = v43;
    v52 = v18;
    v44 = v17;
    v22 = v47;
    v50 = v22;
    v45 = v16;
    v23 = v14;
    v51 = v23;
    v24 = MEMORY[0x1D8232C48](v48);
    context = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v23, "allValues");
    v46 = v14;
    v25 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_213);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v27);
    +[TRIAssetDiffArtifact allReferencedCKRecordKeys](TRIAssetDiffArtifact, "allReferencedCKRecordKeys");
    v29 = v18;
    v30 = self;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDesiredKeys:", v31);

    -[TRICKNativeArtifactProvider configurationFromOptions:](v30, "configurationFromOptions:", v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setConfiguration:", v32);

    objc_msgSend(v28, "setPerRecordProgressBlock:", v25);
    v33 = (void *)v21;
    objc_msgSend(v28, "setPerRecordCompletionBlock:", v21);
    v34 = v19;
    v35 = (void *)v24;
    objc_msgSend(v28, "setFetchRecordsCompletionBlock:", v24);
    v36 = v30;
    v18 = v29;
    -[TRICKNativeArtifactProvider container](v36, "container");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "publicCloudDatabase");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addOperation:", v28);

    v17 = v44;
    -[TRICancelableCKOperation addOperation:](v43, "addOperation:", v28);
    v39 = v43;

    v15 = v25;
    v14 = v46;

    v16 = v45;
    objc_autoreleasePoolPop(context);

    v19 = v34;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v18 + 2))(v18, 4, MEMORY[0x1E0C9AA70], 0, 0);
    v40 = v19;
  }

  return v19;
}

void __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Error receiving diffable asset record with CKRecord %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0C30]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Received diffable asset record with CKRecordID %{public}@, assetId %{public}@", (uint8_t *)&v15, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v7, v8);
  }

}

void __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a2;
  v6 = a3;
  if (_isUserCancellation(v6, *(void **)(a1 + 32)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "downloadOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__17;
    v17 = __Block_byref_object_dispose__17;
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v9 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2;
    v10[3] = &unk_1E93321F8;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 4, v14[5], 0);

    _Block_object_dispose(&v13, 8);
  }

}

void __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v8, "recordId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[TRIAssetDiffArtifact artifactFromCKRecord:](TRIAssetDiffArtifact, "artifactFromCKRecord:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    if (v12)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v7);
    }
    else
    {
      *(_QWORD *)(v13 + 40) = 0;

      *a4 = 1;
    }

  }
  else
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "recordId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v18;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch CKRecordID %@ for asset diff with target assetId %{public}@", (uint8_t *)&v19, 0x16u);

    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    *a4 = 1;
  }

}

uint64_t __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_211(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordId");
}

- (void)fetchBMLTCatalogNotificationWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[16];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TRICKNativeArtifactProvider container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "populationType");

    v12 = (void *)MEMORY[0x1E0CB3880];
    v13 = *MEMORY[0x1E0DC0C60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), v13, v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0CB8], &unk_1E9363C60);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v43[0] = v35;
    v43[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_opt_new();
    v19 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke;
    v40[3] = &unk_1E9331E00;
    v20 = v18;
    v41 = v20;
    v21 = (void *)MEMORY[0x1D8232C48](v40);
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke_214;
    v36[3] = &unk_1E9332288;
    v22 = v6;
    v37 = v22;
    v38 = v20;
    v39 = v7;
    v23 = v20;
    v24 = v6;
    v25 = (void *)MEMORY[0x1D8232C48](v36);
    v26 = *MEMORY[0x1E0DC0C48];
    +[TRIClientBMLTCatalogArtifact allReferencedCKRecordKeys](TRIClientBMLTCatalogArtifact, "allReferencedCKRecordKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v26, v17, 0, v27, v22, v21, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "downloadOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKOperationGroupFactory groupForDownloadOptions:](TRICKOperationGroupFactory, "groupForDownloadOptions:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setGroup:", v30);

    -[TRICKNativeArtifactProvider container](self, "container");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "publicCloudDatabase");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addOperation:", v28);

    v6 = v24;
  }
  else
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "failed to fetch BMLT catalog (unknown container)", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);
  }

}

void __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Received BMLT catalog notification ckRecordID %@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke_214(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t v14[16];
  uint64_t v15;
  void *v16;
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Finished fetchBMLTCatalogNotification query error %@", buf, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    if (v7)
    {
      +[TRIClientBMLTCatalogArtifact artifactFromCKRecord:error:](TRIClientBMLTCatalogArtifact, "artifactFromCKRecord:error:", v7, buf);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)buf;
    }
    else
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch BMLT catalog notification", v14, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch BMLT catalog notification"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v13);
      *(_QWORD *)buf = v9;

      v8 = 0;
    }
    (*(void (**)(_QWORD, uint64_t, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 4 * (v9 == 0), v8, 0, v9);

  }
}

- (void)fetchBMLTNotificationsWithOptions:(id)a3 completion:(id)a4
{
  -[TRICKNativeArtifactProvider _fetchBMLTNotificationsWithCursor:options:completion:](self, "_fetchBMLTNotificationsWithCursor:options:completion:", 0, a3, a4);
}

- (void)fetchBMLTNotificationWithDeployment:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  TRICKNativeArtifactProvider *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v51 = a4;
  v9 = a5;
  -[TRICKNativeArtifactProvider container](self, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = +[TRICKNativeArtifactProvider containerFromCkContainer:](TRICKNativeArtifactProvider, "containerFromCkContainer:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "deploymentId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a5)
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    v13 = *MEMORY[0x1E0DC0C80];
    v50 = v8;
    objc_msgSend(v8, "backgroundMLTaskId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v49 = v11;
    if (v11)
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0C90], v11);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithValue:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "populationType");

    v20 = (void *)MEMORY[0x1E0CB3880];
    v21 = *MEMORY[0x1E0DC0CA8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), v21, v23);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0CB8], &unk_1E9363C60);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3528];
    v47 = (void *)v17;
    v48 = (void *)v15;
    v63[0] = v15;
    v63[1] = v17;
    v63[2] = v46;
    v63[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)objc_opt_new();
    v28 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke;
    v59[3] = &unk_1E9331D38;
    v29 = v50;
    v60 = v29;
    v30 = v11;
    v61 = v30;
    v31 = v27;
    v62 = v31;
    v32 = (void *)MEMORY[0x1D8232C48](v59);
    v52[0] = v28;
    v52[1] = 3221225472;
    v52[2] = __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke_218;
    v52[3] = &unk_1E9332090;
    v33 = v29;
    v53 = v33;
    v54 = v30;
    v34 = v51;
    v55 = v34;
    v57 = self;
    v58 = v9;
    v56 = v31;
    v44 = v31;
    v35 = (void *)MEMORY[0x1D8232C48](v52);
    v36 = *MEMORY[0x1E0DC0C78];
    +[TRIClientBMLTArtifact allReferencedCKRecordKeys](TRIClientBMLTArtifact, "allReferencedCKRecordKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v36, v26, MEMORY[0x1E0C9AA60], v37, v34, v32, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "backgroundMLTaskId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKOperationGroupFactory groupForBMLTId:](TRICKOperationGroupFactory, "groupForBMLTId:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setGroup:", v40);

    -[TRICKNativeArtifactProvider container](self, "container");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "publicCloudDatabase");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addOperation:", v38);

    v11 = v49;
    v8 = v50;
  }
  else
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "backgroundMLTaskId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v43;
      v67 = 2112;
      v68 = v11;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "failed to fetch BMLT %{public}@.%@ (unknown container)", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0, 0);
  }

}

void __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "recordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Received BMLT notification for deployment %{public}@.%@ ckRecordID %@", (uint8_t *)&v9, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }

}

void __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke_218(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Finished fetchBMLTNotification query for deployment %{public}@.%@ error %@", buf, 0x20u);

  }
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (v9)
    {
      +[TRIClientBMLTArtifact artifactFromCKRecord:namespaceDescriptorProvider:error:](TRIClientBMLTArtifact, "artifactFromCKRecord:namespaceDescriptorProvider:error:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
    }
    else
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v13;
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find BMLT ID %{public}@. Please verify BMLT id is valid.", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find BMLT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v16);
      v17 = v11;

      v10 = 0;
    }
    (*(void (**)(_QWORD, uint64_t, void *, _QWORD, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 4 * (v11 == 0), v10, 0, v11);

  }
}

- (void)_fetchBMLTNotificationsWithCursor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *context;
  _QWORD v31[4];
  id v32;
  TRICKNativeArtifactProvider *v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x1D8232A5C]();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v39[3] = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke;
  v36[3] = &unk_1E93322B0;
  v36[4] = self;
  v12 = v10;
  v37 = v12;
  v38 = v39;
  v13 = (void *)MEMORY[0x1D8232C48](v36);
  v31[0] = v11;
  v31[1] = 3221225472;
  v31[2] = __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke_222;
  v31[3] = &unk_1E93322D8;
  v35 = v39;
  v14 = v9;
  v32 = v14;
  v29 = v12;
  v33 = self;
  v34 = v29;
  v15 = (void *)MEMORY[0x1D8232C48](v31);
  +[TRIClientBMLTArtifact allReferencedCKRecordKeys](TRIClientBMLTArtifact, "allReferencedCKRecordKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[TRICKNativeArtifactProvider queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationWithCursor:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", v8, v16, v14, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "populationType");

    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "triLoggablePredicateWithFormat:", CFSTR("ANY %K IN %@"), *MEMORY[0x1E0DC0CA8], v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3880], "triLoggablePredicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DC0CB8], &unk_1E9363C60);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRICKNativeArtifactProvider queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:](self, "queryOperationForRecordType:predicate:sortDescriptors:desiredKeys:options:recordMatchedBlock:queryCompletionBlock:", *MEMORY[0x1E0DC0C78], v26, MEMORY[0x1E0C9AA60], v16, v14, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[TRICKNativeArtifactProvider container](self, "container");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "publicCloudDatabase");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addOperation:", v17);

  _Block_object_dispose(v39, 8);
  objc_autoreleasePoolPop(context);

}

void __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Received BMLTNotification with CKRecordID %{public}@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "namespaceDescriptorProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIClientBMLTArtifact artifactFromCKRecord:namespaceDescriptorProvider:error:](TRIClientBMLTArtifact, "artifactFromCKRecord:namespaceDescriptorProvider:error:", v4, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }

  }
}

void __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v13 = 134218498;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchBMLTNotifications query with %tu results cursor %@ error %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = (void *)MEMORY[0x1D8232A5C]();
    if (v5)
      v12 = 3;
    else
      v12 = 4;
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12, 0, 0, 0);
    objc_autoreleasePoolPop(v11);
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "_fetchBMLTNotificationsWithCursor:options:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (CKContainer)container
{
  return self->_container;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (TRIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (TRINamespaceDescriptorProviding)namespaceDescriptorProvider
{
  return self->_namespaceDescriptorProvider;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (TRICKQueryLog)queryLog
{
  return self->_queryLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLog, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_namespaceDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
