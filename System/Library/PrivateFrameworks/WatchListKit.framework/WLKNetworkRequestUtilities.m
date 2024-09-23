@implementation WLKNetworkRequestUtilities

void __61__WLKNetworkRequestUtilities__defaultAppSessionConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_defaultAppSessionConfiguration___appSessionConfiguration;
  _defaultAppSessionConfiguration___appSessionConfiguration = v0;

  objc_msgSend((id)_defaultAppSessionConfiguration___appSessionConfiguration, "setHTTPShouldUsePipelining:", 1);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C50]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0x100000, 52428800, 0);
  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134218240;
    v5 = objc_msgSend(v2, "memoryCapacity");
    v6 = 2048;
    v7 = objc_msgSend(v2, "diskCapacity");
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Using TV App custom URL cache: mem capacity %lu disk capacity %lu", (uint8_t *)&v4, 0x16u);
  }

  objc_msgSend((id)_defaultAppSessionConfiguration___appSessionConfiguration, "setURLCache:", v2);
}

+ (BOOL)isGDPRAccepted
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CFD9C0], "acknowledgementNeededForPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - is GDPR needed? [%d]", (uint8_t *)v5, 8u);
  }

  return v2 ^ 1;
}

+ (id)defaultSessionConfiguration
{
  if (WLKIsTVApp())
    objc_msgSend(a1, "_defaultAppSessionConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultAppSessionConfiguration
{
  if (_defaultAppSessionConfiguration_onceToken != -1)
    dispatch_once(&_defaultAppSessionConfiguration_onceToken, &__block_literal_global_3);
  return (id)_defaultAppSessionConfiguration___appSessionConfiguration;
}

+ (void)startNetworkRequest:(id)a3 account:(id)a4 sessionConfiguration:(id)a5 options:(int64_t)a6 completion:(id)a7
{
  int v8;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  WLKURLResponseDecoder *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  void (**v43)(id, _QWORD, id);
  uint8_t buf[16];
  id v45;
  id v46;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, id))a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CFDC80]);
  objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithBag:", v17);

  if ((v8 & 1) != 0)
    objc_msgSend(v18, "setDialogOptions:", 1);
  if ((v8 & 4) != 0)
  {
    v20 = (void *)objc_msgSend(v11, "mutableCopy");
    v46 = 0;
    v21 = v11;
    v22 = +[WLKMescal signNetworkRequest:error:](WLKMescal, "signNetworkRequest:error:", v20, &v46);
    v23 = v46;
    if (v22)
    {
      v11 = v20;

    }
    else
    {
      v14[2](v14, 0, v23);
      v11 = v21;
    }
    v19 = (void *)v15;

  }
  else
  {
    v19 = (void *)v15;
  }
  objc_msgSend(v18, "setIncludeClientVersions:", 0);
  if (+[WLKNetworkRequestUtilities isGDPRAccepted](WLKNetworkRequestUtilities, "isGDPRAccepted")
    || (*(_QWORD *)&v8 & 0x200000) != 0)
  {
    if (v12)
    {
      v24 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ams_activeiTunesAccount");
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v18, "setAccount:", v24);

  }
  v39 = v11;
  objc_msgSend(v18, "requestByEncodingRequest:parameters:", v11, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v26, "resultWithError:", &v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v45;
  if (v27)
  {
    v38 = v12;
    v29 = v13;
    +[WLKLaunchConfiguration sharedInstance](WLKLaunchConfiguration, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "useSharedURLSession");

    if (v31)
    {
      WLKNetworkingLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B515A000, v32, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Request uses shared urlSession", buf, 2u);
      }

      +[WLKURLSessionManager sharedInstance](WLKURLSessionManager, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "urlSession");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v29)
      {
        v35 = v29;
      }
      else
      {
        +[WLKNetworkRequestUtilities defaultSessionConfiguration](WLKNetworkRequestUtilities, "defaultSessionConfiguration");
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v35;
      objc_msgSend(MEMORY[0x1E0CFDCA0], "minimalSessionUsing:", v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_alloc_init(WLKURLResponseDecoder);
      objc_msgSend(v34, "setResponseDecoder:", v36);

    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __98__WLKNetworkRequestUtilities_startNetworkRequest_account_sessionConfiguration_options_completion___block_invoke;
    v40[3] = &unk_1E68A7D10;
    v41 = v19;
    v42 = v27;
    v43 = v14;
    objc_msgSend(v34, "dataTaskWithRequest:completionHandler:", v42, v40);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "resume");

    v13 = v29;
    v12 = v38;
  }
  else
  {
    v14[2](v14, 0, v28);
  }

}

void __98__WLKNetworkRequestUtilities_startNetworkRequest_account_sessionConfiguration_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v9 = v8;

  if (v6)
  {
    objc_msgSend(v6, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E68AA228;
  }
  WLKNetworkingLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v5, "responseStatusCode");
    objc_msgSend(v5, "logUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "HTTPMethod");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "relativePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134219266;
    v18 = v12;
    v19 = 2048;
    v20 = v9;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Request status: %lu elapsed time: %.5f id: %@ url: %@ %@ %@", (uint8_t *)&v17, 0x3Eu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)configurationBaseURLString
{
  return (id)+[WLKConfigurationRequest _configURLString](WLKConfigurationRequest, "_configURLString");
}

+ (id)_sharedCacheSessionConfiguration
{
  if (_sharedCacheSessionConfiguration_onceToken != -1)
    dispatch_once(&_sharedCacheSessionConfiguration_onceToken, &__block_literal_global_19);
  return (id)_sharedCacheSessionConfiguration___sessionConfiguration;
}

void __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  __CFDictionary *Mutable;
  const void *v10;
  const void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedCacheSessionConfiguration___sessionConfiguration;
  _sharedCacheSessionConfiguration___sessionConfiguration = v0;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v30[0] = CPSharedResourcesDirectory();
  v30[1] = CFSTR("Library");
  v30[2] = CFSTR("Caches");
  v30[3] = CFSTR("sharedCaches");
  v30[4] = CFSTR("com.apple.WatchListKit.NSURLCache");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WLKNetworkingLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v4;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestUtilities - Using shared cache path: %@", (uint8_t *)&v28, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWritableFileAtPath:", v4);

  if ((v8 & 1) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C930A0], (const void *)*MEMORY[0x1E0C9AE50]);
    v10 = (const void *)_CFURLStorageSessionCreate();
    CFRelease(Mutable);
    if (v10)
    {
      v11 = (const void *)_CFURLStorageSessionCopyCache();
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C50]), "_initWithExistingCFURLCache:", v11);
      objc_msgSend((id)_sharedCacheSessionConfiguration___sessionConfiguration, "setURLCache:", v12);
      CFRelease(v10);
      CFRelease(v11);
      goto LABEL_11;
    }
  }
  else
  {
    WLKNetworkingLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  WLKNetworkingLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_1(v12, v21, v22, v23, v24, v25, v26, v27);
LABEL_11:

}

void __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B515A000, a1, a3, "WLKNetworkRequestUtilities - Failed to create URL Storage Session", a5, a6, a7, a8, 0);
}

void __62__WLKNetworkRequestUtilities__sharedCacheSessionConfiguration__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B515A000, a1, a3, "WLKNetworkRequestUtilities - Failed to write to shared URL cache folder. Process is likely missing WLK private entitlement.", a5, a6, a7, a8, 0);
}

@end
