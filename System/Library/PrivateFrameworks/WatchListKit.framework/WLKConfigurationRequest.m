@implementation WLKConfigurationRequest

uint64_t __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "_fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)fetchWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 wlkCachePolicy:(unint64_t)a5 extendedCacheExpireDuration:(double)a6 sessionConfiguration:(id)a7 queryParameters:(id)a8 fileStorage:(id)a9 completion:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  double v31;
  id v32;
  int64_t v33;
  unint64_t v34;
  uint8_t buf[8];
  _QWORD v36[4];
  id v37;
  id v38;

  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke;
  v36[3] = &unk_1E68A9250;
  v21 = v19;
  v37 = v21;
  v22 = v20;
  v38 = v22;
  v23 = (void *)MEMORY[0x1B5E47FF4](v36);
  if (a4 == 1 || !v21)
  {
    objc_msgSend(a1, "_fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:", a3, a4, v17, v18, v23);
  }
  else
  {
    WLKStartupSignpostLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheRead", ", buf, 2u);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_6;
    v25[3] = &unk_1E68A92A0;
    v30 = a5;
    v31 = a6;
    v28 = v22;
    v32 = a1;
    v33 = a3;
    v34 = a4;
    v26 = v17;
    v27 = v18;
    v29 = v23;
    objc_msgSend(v21, "read:", v25);

  }
}

void __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "requiredRequestKeyValuePairsDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8 != 0;

    if (!v6 && v8)
    {
      WLKStartupSignpostLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B515A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheWrite", ", buf, 2u);
      }

      v11 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_3;
      v14[3] = &unk_1E68A9228;
      v15 = v5;
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v11, "write:completion:", v15, v14);

      goto LABEL_11;
    }
  }
  else
  {
    v9 = 0;
  }
  WLKNetworkingLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v13;
    v19 = 1024;
    v20 = v9;
    _os_log_impl(&dword_1B515A000, v12, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Not persisting config on disk. Error:%@; isResponseValid:%d",
      buf,
      0x12u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

}

void __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WLKNetworkingLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Wrote to disk. Exp:%@ Success:%d err:%@", (uint8_t *)&v9, 0x1Cu);

  }
  WLKStartupSignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheWrite", ", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WLKStartupSignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.DiskCacheRead", ", buf, 2u);
  }

  objc_msgSend(v5, "setFromDiskCache:", 1);
  v7 = *(_QWORD *)(a1 + 64);
  if ((unint64_t)(v7 - 1) < 2)
    goto LABEL_7;
  if (v7 == 4)
  {
    if (objc_msgSend(v5, "isValidIgnoringExpiration"))
      goto LABEL_7;
  }
  else if (v7 == 5)
  {
    if ((objc_msgSend(v5, "isValidWithinExtendedExpiration:", *(double *)(a1 + 72)) & 1) != 0)
    {
LABEL_7:
      WLKNetworkingLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Disk cache hit", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
  }
  else if ((objc_msgSend(v5, "isValid") & 1) != 0)
  {
    goto LABEL_7;
  }
  if (v5 && !a3)
  {
    WLKNetworkingLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "expirationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKConfigurationRequest - Disk cache is invalid. Expiration:%@", buf, 0xCu);

    }
  }
  dispatch_get_global_queue(17, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __159__WLKConfigurationRequest_fetchWithOptions_cachePolicy_wlkCachePolicy_extendedCacheExpireDuration_sessionConfiguration_queryParameters_fileStorage_completion___block_invoke_7;
  v12[3] = &unk_1E68A9278;
  v16 = *(_QWORD *)(a1 + 80);
  v17 = *(_OWORD *)(a1 + 88);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 56);
  dispatch_async(v11, v12);

LABEL_17:
}

+ (void)_fetchV3WithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 sessionConfiguration:(id)a5 queryParameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  id v46;
  uint8_t buf[8];
  id v48;

  v42 = a5;
  v12 = a6;
  v13 = a7;
  if (!v13)
    +[WLKConfigurationRequest _fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:].cold.1();
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  v48 = 0;
  objc_msgSend(a1, "_configURLString:", &v48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v48;
  if (objc_msgSend(v15, "length"))
  {
    v39 = a3;
    v40 = v16;
    WLKStartupSignpostLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.RequestCreation", ", buf, 2u);
    }

    +[WLKUserEnvironment currentEnvironment](WLKUserEnvironment, "currentEnvironment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v18, "_queryParametersV3");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithDictionary:", v20);

    v41 = v12;
    objc_msgSend(v21, "addEntriesFromDictionary:", v12);
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("caller"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("wlk"), CFSTR("caller"));
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v15);
    objc_msgSend(MEMORY[0x1E0C99E98], "wlk_sortedQueryItemsFromDictionary:", v21);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setQueryItems:");
    v24 = objc_alloc(MEMORY[0x1E0C92C28]);
    objc_msgSend(v23, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithURL:cachePolicy:timeoutInterval:", v25, a4, 10.0);

    objc_msgSend(v18, "_queryPostV3");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v27, 0, &v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v46;
    if (!v28)
    {
      WLKNetworkingLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[WLKConfigurationRequest _fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:].cold.2((uint64_t)v29, v30);

    }
    v37 = v15;
    objc_msgSend(v26, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v26, "setHTTPBody:", v28);
    objc_msgSend(v26, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    WLKStartupSignpostLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.RequestCreation", ", buf, 2u);
    }
    v32 = v29;

    WLKStartupSignpostLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.NetworkRequest", ", buf, 2u);
    }

    v34 = (void *)objc_msgSend(v26, "copy");
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __107__WLKConfigurationRequest__fetchV3WithOptions_cachePolicy_sessionConfiguration_queryParameters_completion___block_invoke;
    v43[3] = &unk_1E68A92C8;
    v44 = v18;
    v45 = v14;
    v35 = v18;
    v36 = v42;
    +[WLKNetworkRequestUtilities startNetworkRequest:account:sessionConfiguration:options:completion:](WLKNetworkRequestUtilities, "startNetworkRequest:account:sessionConfiguration:options:completion:", v34, 0, v42, v39, v43);

    v16 = v40;
    v12 = v41;
    v15 = v37;
  }
  else
  {
    WLKError(100, v16, CFSTR("WLKConfigurationRequest: Error: UTS init/config (v3) not available in the URL bag."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v21);
    v36 = v42;
  }

}

void __107__WLKConfigurationRequest__fetchV3WithOptions_cachePolicy_sessionConfiguration_queryParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  WLKDictionaryResponseProcessor *v9;
  void *v10;
  void *v11;
  WLKServerConfigurationResponse *v12;
  NSObject *v13;
  uint8_t v14[8];
  id v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WLKStartupSignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.NetworkRequest", ", buf, 2u);
  }

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WLKStartupSignpostLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.ResponseParse", ", v16, 2u);
    }

    v9 = objc_alloc_init(WLKDictionaryResponseProcessor);
    -[WLKDictionaryResponseProcessor setDictionaryKeyPath:](v9, "setDictionaryKeyPath:", CFSTR("data"));
    objc_msgSend(v5, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    -[WLKDictionaryResponseProcessor processResponseData:error:](v9, "processResponseData:error:", v10, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;

    v12 = -[WLKServerConfigurationResponse initWithServerResponseDictionary:expirationDate:environmentHash:]([WLKServerConfigurationResponse alloc], "initWithServerResponseDictionary:expirationDate:environmentHash:", v11, 0, objc_msgSend(*(id *)(a1 + 32), "hash"));
    WLKStartupSignpostLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.ResponseParse", ", v14, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)_configURLString:(id *)a3
{
  void *v4;
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = 0;
  WLKBaseURLReturningError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v6 = kBagKeyUVSearchRoutesInitConfigPathV3;
    WLKStartupSignpostLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.initConfigEndpointFromBag", ", v15, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DB1840], "app");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedStringForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WLKStartupSignpostLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.initConfigEndpointFromBag", ", v15, 2u);
    }

    if (objc_msgSend(v9, "length"))
    {
      v11 = v9;
    }
    else
    {
      if (a3)
        *a3 = 0;
      v11 = CFSTR("uts/v3/configurations");
    }
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wlk_stringByAppendingPathComponents:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }

  return v12;
}

+ (void)_fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:.cold.1()
{
  __assert_rtn("+[WLKConfigurationRequest _fetchV3WithOptions:cachePolicy:sessionConfiguration:queryParameters:completion:]", "WLKConfigurationRequest.m", 128, "completion");
}

+ (void)_fetchV3WithOptions:(uint64_t)a1 cachePolicy:(NSObject *)a2 sessionConfiguration:queryParameters:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B515A000, a2, OS_LOG_TYPE_ERROR, "WLKConfigurationRequest - Failed to construct POST payload... continuing with empty body.%@", (uint8_t *)&v2, 0xCu);
}

@end
