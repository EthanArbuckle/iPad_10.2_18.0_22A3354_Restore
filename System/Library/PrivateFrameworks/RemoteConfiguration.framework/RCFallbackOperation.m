@implementation RCFallbackOperation

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;

  -[RCFallbackOperation requestKey](self, "requestKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCFallbackOperation validateOperation].cold.2();
  -[RCFallbackOperation fallbackURL](self, "fallbackURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCFallbackOperation validateOperation].cold.1();
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  RCSharedLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCFallbackOperation fallbackURL](self, "fallbackURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A1FB5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform operation to fetch config with fallback URL: %@", (uint8_t *)&v9, 0x16u);

  }
  -[RCFallbackOperation fallbackURL](self, "fallbackURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCFallbackOperation requestKey](self, "requestKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RCFallbackOperation enableExtraLogs](self, "enableExtraLogs");
  -[RCFallbackOperation fallbackTimeoutDuration](self, "fallbackTimeoutDuration");
  -[RCFallbackOperation _fetchConfigurationWithURL:requestKey:enableExtraLogs:fallbackTimeoutDuration:](self, "_fetchConfigurationWithURL:requestKey:enableExtraLogs:fallbackTimeoutDuration:", v6, v7, v8);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[RCFallbackOperation completionQueue](self, "completionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    RCDispatchQueueForQualityOfService(-[RCFallbackOperation qualityOfService](self, "qualityOfService"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[RCFallbackOperation configurationCompletionHandler](self, "configurationCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__RCFallbackOperation_operationWillFinishWithError___block_invoke;
    v10[3] = &unk_1E470DE50;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v8, v10);

  }
}

void __52__RCFallbackOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "configurationCompletionHandler");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configurationResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, *(_QWORD *)(a1 + 40));

}

- (void)_fetchConfigurationWithURL:(id)a3 requestKey:(id)a4 enableExtraLogs:(BOOL)a5 fallbackTimeoutDuration:(double)a6
{
  id v10;
  id v11;
  RCURLFetchOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *, void *, void *);
  void *v31;
  RCFallbackOperation *v32;
  id v33;
  id v34;
  BOOL v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(RCURLFetchOperation);
  -[RCURLFetchOperation setURL:](v12, "setURL:", v10);
  -[RCURLFetchOperation setHTTPMethod:](v12, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v10, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setLoggingKey:](v12, "setLoggingKey:", v13);

  -[RCURLFetchOperation setURLRequestTimeoutDuration:](v12, "setURLRequestTimeoutDuration:", a6);
  -[RCFallbackOperation networkEventHandler](self, "networkEventHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setNetworkEventHandler:](v12, "setNetworkEventHandler:", v14);

  -[RCFallbackOperation cachedConfigurationResource](self, "cachedConfigurationResource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCFallbackOperation cachedConfigurationResource](self, "cachedConfigurationResource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastModifiedFallbackString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCFallbackOperation cachedConfigurationResource](self, "cachedConfigurationResource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "lastModifiedFallbackString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("If-Modified-Since");
LABEL_6:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v22);

    goto LABEL_7;
  }
  objc_msgSend(v19, "etag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[RCFallbackOperation cachedConfigurationResource](self, "cachedConfigurationResource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "etag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("If-None-Match");
    goto LABEL_6;
  }
LABEL_7:
  -[RCURLFetchOperation setAdditionalRequestHTTPHeaders:](v12, "setAdditionalRequestHTTPHeaders:", v16);
  RCSharedLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v25;
    v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_1A1FB5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ sending additional headers with URL fetch operation: %@", buf, 0x16u);

  }
LABEL_10:
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke;
  v31 = &unk_1E470DEA0;
  v32 = self;
  v33 = v10;
  v34 = v11;
  v35 = a5;
  v26 = v11;
  v27 = v10;
  -[RCURLFetchOperation setConfigurationCompletionHandler:](v12, "setConfigurationCompletionHandler:", &v28);
  -[RCOperation associateChildOperation:](self, "associateChildOperation:", v12, v28, v29, v30, v31, v32);
  -[RCOperation start](v12, "start");

}

void __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v9 || v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v12);
  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    if (objc_msgSend(v11, "statusCode") == 304)
    {
      objc_msgSend(*(id *)(a1 + 32), "cachedConfigurationResource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(*(id *)(a1 + 32), "setConfigurationResource:", v15);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "configurationResource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLastFetchedDate:", v16);

      RCSharedLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v19;
        _os_log_impl(&dword_1A1FB5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ the config has not changed since we last downloaded it (HTTP 304)", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v11, "allHeaderFields");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ETag"));
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "allHeaderFields");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *(void **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(unsigned __int8 *)(a1 + 56);
      v27[1] = 3221225472;
      v27[2] = __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_18;
      v27[3] = &unk_1E470DE78;
      v27[4] = v23;
      v27[5] = &v28;
      v27[0] = MEMORY[0x1E0C809B0];
      objc_msgSend(v23, "_parseFallbackResponse:fallbackURL:requestKey:enableExtraLogs:maxAge:etag:lastModifiedString:completion:", v9, v24, v25, v26, v10, v18, v22, v27);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v29[5]);
    _Block_object_dispose(&v28, 8);

  }
}

void __101__RCFallbackOperation__fetchConfigurationWithURL_requestKey_enableExtraLogs_fallbackTimeoutDuration___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setConfigurationResource:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)_parseFallbackResponse:(id)a3 fallbackURL:(id)a4 requestKey:(id)a5 enableExtraLogs:(BOOL)a6 maxAge:(id)a7 etag:(id)a8 lastModifiedString:(id)a9 completion:(id)a10
{
  id v14;
  void (**v15)(id, RCConfigurationResource *, _QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  RCConfigurationResource *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  RCFallbackOperation *v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  RCFallbackOperation *v49;
  id v50;
  id v51;
  void *v52;
  _BOOL4 v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[7];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v53 = a6;
  v76 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v58 = a5;
  v57 = a7;
  v56 = a8;
  v55 = a9;
  v15 = (void (**)(id, RCConfigurationResource *, _QWORD))a10;
  objc_msgSend(v14, "rc_gzipInflate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v14;
  v59[6] = 0;
  v54 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "rc_dictionaryFromData:error:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  if (v20)
  {
    RCSharedLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v22 = v19;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v23;
      v62 = 2114;
      v63 = v20;
      _os_log_impl(&dword_1A1FB5000, v21, OS_LOG_TYPE_ERROR, "%{public}@ parseFallbackResponse - JSON parsing failed with error: %{public}@", buf, 0x16u);

      v19 = v22;
    }

  }
  if (v19)
  {
    v24 = objc_alloc_init(RCConfigurationResource);
    -[RCConfigurationResource setRequestKey:](v24, "setRequestKey:", v58);
    v52 = v17;
    if (v17)
    {
      -[RCConfigurationResource setGzippedConfigurationData:](v24, "setGzippedConfigurationData:", v14);
    }
    else
    {
      objc_msgSend(v14, "rc_gzipDeflate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource setGzippedConfigurationData:](v24, "setGzippedConfigurationData:", v25);

    }
    +[RCUserSegmentationConfiguration userSegmentationConfigurationWithConfigDict:environment:](RCUserSegmentationConfiguration, "userSegmentationConfigurationWithConfigDict:environment:", v19, -[RCFallbackOperation environment](self, "environment"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCConfigurationResource setUserSegmentationConfiguration:](v24, "setUserSegmentationConfiguration:", v26);

    -[RCConfigurationResource setTreatmentIDs:](v24, "setTreatmentIDs:", 0);
    -[RCConfigurationResource setSegmentSetIDs:](v24, "setSegmentSetIDs:", 0);
    -[RCFallbackOperation userID](self, "userID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCConfigurationResource setUserID:](v24, "setUserID:", v27);

    -[RCFallbackOperation storefrontID](self, "storefrontID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCConfigurationResource setStorefrontID:](v24, "setStorefrontID:", v28);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCConfigurationResource setLastFetchedDate:](v24, "setLastFetchedDate:", v29);

    -[RCConfigurationResource setFallbackMaxAge:](v24, "setFallbackMaxAge:", v57);
    v30 = (void *)objc_msgSend(v56, "copy");
    -[RCConfigurationResource setEtag:](v24, "setEtag:", v30);

    v31 = (void *)objc_msgSend(v55, "copy");
    -[RCConfigurationResource setLastModifiedFallbackString:](v24, "setLastModifiedFallbackString:", v31);

    RCSharedLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[RCOperation shortOperationDescription](self, "shortOperationDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource lastFetchedDate](v24, "lastFetchedDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource fallbackMaxAge](v24, "fallbackMaxAge");
      v51 = v14;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource etag](v24, "etag");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource lastModifiedFallbackString](v24, "lastModifiedFallbackString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource treatmentIDs](v24, "treatmentIDs");
      v50 = v20;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "rc_description");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCConfigurationResource segmentSetIDs](v24, "segmentSetIDs");
      v49 = self;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rc_description");
      v38 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v61 = v48;
      v62 = 2112;
      v63 = v58;
      v64 = 2112;
      v65 = v46;
      v66 = 2112;
      v67 = v33;
      v68 = 2112;
      v69 = v34;
      v70 = 2112;
      v71 = v35;
      v72 = 2112;
      v73 = v47;
      v74 = 2112;
      v75 = v38;
      v39 = (void *)v38;
      _os_log_impl(&dword_1A1FB5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ fallback: received configuration with requestKey: %@ lastFetchedDate: %@ maxAge: %@ etag: %@ lastModified: %@ treatmentIDs: %@ segmentSetIDs: %@", buf, 0x52u);

      self = v49;
      v20 = v50;

      v14 = v51;
    }

    v17 = v52;
    if (v53)
    {
      v40 = self;
      v41 = v20;
      v42 = v19;
      RCSharedLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        -[RCOperation shortOperationDescription](v40, "shortOperationDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v54, 4);
        *(_DWORD *)buf = 138543618;
        v61 = v44;
        v62 = 2112;
        v63 = v45;
        _os_log_impl(&dword_1A1FB5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ CloudKit JSON response: %@", buf, 0x16u);

        v17 = v52;
      }

      v19 = v42;
      v20 = v41;
    }
    v15[2](v15, v24, 0);
  }
  else
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __127__RCFallbackOperation__parseFallbackResponse_fallbackURL_requestKey_enableExtraLogs_maxAge_etag_lastModifiedString_completion___block_invoke;
    v59[3] = &unk_1E470DEC8;
    v59[4] = v20;
    v59[5] = v15;
    v24 = (RCConfigurationResource *)v20;
    __127__RCFallbackOperation__parseFallbackResponse_fallbackURL_requestKey_enableExtraLogs_maxAge_etag_lastModifiedString_completion___block_invoke((uint64_t)v59);
  }

}

void __127__RCFallbackOperation__parseFallbackResponse_fallbackURL_requestKey_enableExtraLogs_maxAge_etag_lastModifiedString_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "rc_parsingError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)requestKey
{
  return self->_requestKey;
}

- (void)setRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_requestKey, a3);
}

- (NSURL)fallbackURL
{
  return self->_fallbackURL;
}

- (void)setFallbackURL:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackURL, a3);
}

- (RCConfigurationResource)cachedConfigurationResource
{
  return self->_cachedConfigurationResource;
}

- (void)setCachedConfigurationResource:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfigurationResource, a3);
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (BOOL)enableExtraLogs
{
  return self->_enableExtraLogs;
}

- (void)setEnableExtraLogs:(BOOL)a3
{
  self->_enableExtraLogs = a3;
}

- (id)configurationCompletionHandler
{
  return self->_configurationCompletionHandler;
}

- (void)setConfigurationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (double)fallbackTimeoutDuration
{
  return self->_fallbackTimeoutDuration;
}

- (void)setFallbackTimeoutDuration:(double)a3
{
  self->_fallbackTimeoutDuration = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontID, a3);
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (void)setNetworkEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (RCConfigurationResource)configurationResource
{
  return self->_configurationResource;
}

- (void)setConfigurationResource:(id)a3
{
  objc_storeStrong((id *)&self->_configurationResource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationResource, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_configurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedConfigurationResource, 0);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("the fallback operation must have valid requestKey"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_1();
}

@end
