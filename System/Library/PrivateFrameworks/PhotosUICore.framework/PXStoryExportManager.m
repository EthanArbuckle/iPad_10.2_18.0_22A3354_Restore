@implementation PXStoryExportManager

+ (id)collectAnalyticsForExportBeginWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D09910];
  v5 = a3;
  v6 = objc_msgSend(v4, "startSignpost");
  v11[0] = CFSTR("signpost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("payload");
  v12[0] = v7;
  objc_msgSend(a1, "_defaultPayloadForConfiguration:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)collectAnalyticsForFixationWithAppleMusicAsset:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD block[6];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryExportManager+Analytics.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appleMusicAsset != nil"));

  }
  objc_msgSend(v8, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "contentProvider");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      PLStoryGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v12;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Music asset with identifier %{public}@ missing contentProvider", buf, 0xCu);

      }
      v10 = CFSTR("unknown");
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__PXStoryExportManager_Analytics__collectAnalyticsForFixationWithAppleMusicAsset_configuration___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (collectAnalyticsForFixationWithAppleMusicAsset_configuration__onceToken != -1)
      dispatch_once(&collectAnalyticsForFixationWithAppleMusicAsset_configuration__onceToken, block);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("ActivityType"));
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("AdamID"));

    if ((objc_msgSend((id)collectAnalyticsForFixationWithAppleMusicAsset_configuration__topCPIDSet, "containsObject:", v10) & 1) == 0)
    {

      v10 = CFSTR("other");
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("CPID"));
    objc_msgSend(a1, "_appleIDCountry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v15 != 0;
    if (v15)
    {
      objc_msgSend(v15, "uppercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("AppleIDCountry"));

      v19 = (void *)collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromDate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("DayOfEvent"));

      v22 = (void *)MEMORY[0x1E0D09910];
      v23 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v22, "sendEvent:withPayload:", CFSTR("com.apple.photos.memory.appleMusicFixation"), v23);

    }
  }
  else
  {
    PXAssertGetLog();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Missing activityType", buf, 2u);
    }
    v17 = 0;
  }

  return v17;
}

+ (id)_appleIDCountry
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t v28[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_appleIDCountry_onceToken != -1)
    dispatch_once(&_appleIDCountry_onceToken, &__block_literal_global_195079);
  if (_appleIDCountry_bag)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__195081;
    v26 = __Block_byref_object_dispose__195082;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__195081;
    v20 = __Block_byref_object_dispose__195082;
    v21 = 0;
    v2 = dispatch_semaphore_create(0);
    objc_msgSend((id)_appleIDCountry_bag, "stringForKey:", CFSTR("countryCode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PXStoryExportManager_Analytics___appleIDCountry__block_invoke_220;
    v12[3] = &unk_1E5134500;
    v14 = buf;
    v15 = &v16;
    v4 = v2;
    v13 = v4;
    objc_msgSend(v3, "valueWithCompletion:", v12);

    v5 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v4, v5);
    v6 = (void *)*((_QWORD *)v23 + 5);
    if (!v6)
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = v17[5];
        *(_DWORD *)v28 = 138412290;
        v29 = v11;
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "could not get appleIDCountry %@", v28, 0xCu);
      }

      v6 = (void *)*((_QWORD *)v23 + 5);
    }
    v8 = v6;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "could not get apple music bag", buf, 2u);
    }

    v8 = 0;
  }
  return v8;
}

+ (void)collectDataContinuationAnalyticsForExportWithConfiguration:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v19 = a3;
  v8 = a5;
  objc_msgSend(a1, "_defaultPayloadForConfiguration:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = (id *)MEMORY[0x1E0D09730];
LABEL_10:
    v14 = *v10;
    goto LABEL_11;
  }
  if (!v8)
  {
LABEL_9:
    v10 = (id *)MEMORY[0x1E0D09728];
    goto LABEL_10;
  }
  objc_msgSend(v8, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(v8, "code") == 3072)
  {

    goto LABEL_9;
  }
  objc_msgSend(v8, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PXStoryErrorDomain")) & 1) != 0)
  {
    v13 = objc_msgSend(v8, "code");

    if (v13 == 11)
      goto LABEL_9;
  }
  else
  {

  }
  v14 = (id)*MEMORY[0x1E0D09738];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D09838]);
LABEL_11:
  objc_msgSend(v19, "activityType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v19, "activityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("activityType"));

  }
  objc_msgSend(v19, "activityCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v19, "activityCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("activityCategory"));

  }
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v14, v9);

}

+ (void)collectAnalyticsForExportEndWithConfiguration:(id)a3 analyticsToken:(id)a4 model:(id)a5 withSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;

  v8 = a6;
  v48 = a3;
  v12 = a5;
  v13 = a7;
  v14 = a4;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("signpost"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "CPAnalyticsSignpostIDValue");

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("payload"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("interactiveMemoryExportSucceeded"));

  objc_msgSend(v48, "activityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("com.apple"));
  objc_msgSend(v48, "activityType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("activityType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20 ^ 1u);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("isThirdPartyShareDestination"));

  }
  objc_msgSend(v48, "activityCategory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v48, "activityCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("activityCategory"));

  }
  objc_msgSend(v48, "videoOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "resolution");
  v27 = v26;
  v29 = v28;

  if (v27 <= v29)
    v30 = CFSTR("portrait");
  else
    v30 = CFSTR("landscape");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("Orientation"));
  objc_msgSend(a1, "_aspectDescriptionFromSize:", v27, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v31, CFSTR("AspectRatio"));

  objc_msgSend(v48, "storyConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "assetCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v34 = v33;
  else
    v34 = 0;
  v35 = v34;
  if (!v8)
  {
    objc_msgSend(v13, "domain");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v12;
    if (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(v13, "code") == 3072)
    {
      v40 = v16;

LABEL_20:
      v38 = CFSTR("com.apple.photos.memory.interactiveMemoryExportCancelled");
      v43 = CFSTR("com.apple.photos.memory.interactiveMemoryExportCancelled");
LABEL_23:
      v45 = (void *)MEMORY[0x1E0D09910];
      v37 = (void *)objc_msgSend(v17, "copy", v46);
      objc_msgSend(v45, "sendEvent:withPayload:", v38, v37);
      v16 = v40;
      v12 = v47;
      goto LABEL_24;
    }
    objc_msgSend(v13, "domain", v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("PXStoryErrorDomain")) & 1) != 0)
    {
      v40 = v16;
      v42 = objc_msgSend(v13, "code");

      if (v42 == 11)
        goto LABEL_20;
    }
    else
    {
      v40 = v16;

    }
    v38 = CFSTR("com.apple.photos.memory.interactiveMemoryExportFailed");
    v44 = CFSTR("com.apple.photos.memory.interactiveMemoryExportFailed");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D09838]);
    goto LABEL_23;
  }
  v36 = CFSTR("com.apple.photos.memory.interactiveMemoryExportSucceeded");
  if (v35)
    objc_msgSend(a1, "_incrementShareCountForMemory:", v33);
  v37 = (void *)objc_msgSend(v17, "copy");
  +[PXStoryAnalyticsController sendMemoryEvent:model:payload:](PXStoryAnalyticsController, "sendMemoryEvent:model:payload:", CFSTR("com.apple.photos.memory.interactiveMemoryExported"), v12, v37);
  v38 = CFSTR("com.apple.photos.memory.interactiveMemoryExportSucceeded");
LABEL_24:

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D09850]);
  objc_msgSend(MEMORY[0x1E0D09910], "endSignpost:forEventName:withPayload:", v16, *MEMORY[0x1E0D09708], v17);

}

+ (id)_aspectDescriptionFromSize:(CGSize)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
    return CFSTR("16:9");
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
    return CFSTR("9:16");
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
    return CFSTR("4:3");
  if (PXFloatApproximatelyEqualToFloat())
    return CFSTR("3:4");
  return CFSTR("Original");
}

+ (id)_defaultPayloadForConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", 3);
  objc_msgSend(v4, "storyConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D09818]);

  return v5;
}

+ (void)_incrementShareCountForMemory:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke;
  v9[3] = &unk_1E5149198;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke_2;
  v7[3] = &unk_1E5148B78;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "performChanges:completionHandler:", v9, v7);

}

void __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "incrementShareCount");

}

void __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLMemoriesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to bump share count of memory %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __50__PXStoryExportManager_Analytics___appleIDCountry__block_invoke_220(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v8 = 40;
  if (v13)
  {
    v9 = v13;
  }
  else
  {
    v8 = 48;
    v9 = v7;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + v8) + 8);
  v11 = v9;
  v12 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__PXStoryExportManager_Analytics___appleIDCountry__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("Photos"), CFSTR("1"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_appleIDCountry_bag;
  _appleIDCountry_bag = v0;

}

void __96__PXStoryExportManager_Analytics__collectAnalyticsForFixationWithAppleMusicAsset_configuration___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter;
  collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter = (uint64_t)v0;

  objc_msgSend((id)collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E53EA140);
  v3 = (void *)collectAnalyticsForFixationWithAppleMusicAsset_configuration__topCPIDSet;
  collectAnalyticsForFixationWithAppleMusicAsset_configuration__topCPIDSet = v2;

}

- (PXStoryExportManager)init
{
  PXStoryExportManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryExportManager;
  v2 = -[PXStoryExportManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    v2->_qualityOfService = -1;
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", -1);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.PXStoryExportManager.operationQueue"));
  }
  return v2;
}

- (id)requestExportWithDestinationURL:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PXStoryExportOperation *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[_PXStoryExportOperation initWithURL:configuration:qualityOfService:progressHandler:]([_PXStoryExportOperation alloc], "initWithURL:configuration:qualityOfService:progressHandler:", v10, v11, -[PXStoryExportManager qualityOfService](self, "qualityOfService"), v12);
  objc_initWeak(&location, v14);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__PXStoryExportManager_requestExportWithDestinationURL_configuration_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E5146480;
  objc_copyWeak(&v20, &location);
  v15 = v13;
  v19 = v15;
  -[_PXStoryExportOperation setCompletionBlock:](v14, "setCompletionBlock:", v18);
  -[PXStoryExportManager operationQueue](self, "operationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

- (int64_t)maxConcurrentExportCount
{
  void *v2;
  int64_t v3;

  -[PXStoryExportManager operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxConcurrentOperationCount");

  return v3;
}

- (void)setQualityOfService:(int64_t)a3
{
  id v4;

  if (self->_qualityOfService != a3)
  {
    self->_qualityOfService = a3;
    -[PXStoryExportManager operationQueue](self, "operationQueue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQualityOfService:", a3);

  }
}

- (void)setMaxConcurrentExportCount:(int64_t)a3
{
  int64_t v3;
  id v4;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  -[PXStoryExportManager operationQueue](self, "operationQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxConcurrentOperationCount:", v3);

}

- (void)cancelAllExports
{
  id v2;

  -[PXStoryExportManager operationQueue](self, "operationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __104__PXStoryExportManager_requestExportWithDestinationURL_configuration_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "status");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (OS_os_log)frequentSignpostLog
{
  if (frequentSignpostLog_onceToken != -1)
    dispatch_once(&frequentSignpostLog_onceToken, &__block_literal_global_227560);
  return (OS_os_log *)(id)frequentSignpostLog_log;
}

void __43__PXStoryExportManager_frequentSignpostLog__block_invoke()
{
  void *v0;
  int v1;
  os_log_t v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "launchedToTest");

  if (v1)
  {
    v2 = os_log_create((const char *)*MEMORY[0x1E0D744D8], "FrequentStoryExportSignPost");
  }
  else
  {
    v2 = (os_log_t)MEMORY[0x1E0C81030];
    v3 = MEMORY[0x1E0C81030];
  }
  v4 = (void *)frequentSignpostLog_log;
  frequentSignpostLog_log = (uint64_t)v2;

}

@end
