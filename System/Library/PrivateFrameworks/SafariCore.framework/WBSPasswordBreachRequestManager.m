@implementation WBSPasswordBreachRequestManager

- (WBSPasswordBreachRequestManager)initWithContext:(id)a3
{
  id v5;
  WBSPasswordBreachRequestManager *v6;
  WBSPasswordBreachRequestManager *v7;
  NSOperationQueue *v8;
  NSOperationQueue *fetchOperationQueue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURLSession *session;
  WBSPasswordBreachRequestManager *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSPasswordBreachRequestManager;
  v6 = -[WBSPasswordBreachRequestManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    fetchOperationQueue = v7->_fetchOperationQueue;
    v7->_fetchOperationQueue = v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p.operationQueue"), objc_opt_class(), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v7->_fetchOperationQueue, "setName:", v10);

    v11 = (void *)MEMORY[0x1E0C92C98];
    objc_msgSend(v5, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "urlSessionConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v13, 0, v7->_fetchOperationQueue);
    v14 = objc_claimAutoreleasedReturnValue();
    session = v7->_session;
    v7->_session = (NSURLSession *)v14;

    v16 = v7;
  }

  return v7;
}

- (void)_fetchBucketAtURL:(id)a3 withClientBlindedHash:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v16 = CFSTR("x-req-p");
    objc_msgSend(MEMORY[0x1E0CB3940], "safari_stringAsHexWithData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke;
  v14[3] = &unk_1E649DB90;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[WBSPasswordBreachRequestManager _buildRequestWithURL:headers:completionHandler:](self, "_buildRequestWithURL:headers:completionHandler:", v8, v12, v14);

}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2;
  v6[3] = &unk_1E649DB68;
  v7 = v3;
  objc_msgSend(v4, "downloadTaskWithRequest:completionHandler:", a2, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  WBSPasswordBreachBloomFilter *v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_6(v11, v10);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    if (objc_msgSend(v10, "safari_statusCodeGroup") == 2)
    {
      v44 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, &v44);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v44;
      if (v12)
      {
        v14 = -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:]([WBSPasswordBreachBloomFilter alloc], "initWithSerializedRepresentation:", v12);
        if (v14)
        {
          objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("x-res-p"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "safari_dataWithHexString:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length"))
            {
              v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
            }
            else
            {
              v36 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_3(v36, v37, v38, v39, v40, v41, v42, v43);
              v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
            }
            v17();

          }
          else
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          }

        }
        else
        {
          v28 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }

      }
      else
      {
        v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_1(v27, v13);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }

      goto LABEL_5;
    }
    v26 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_4(v26, v10);
LABEL_4:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_5:

    goto LABEL_6;
  }
  v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_5(v18, v19, v20, v21, v22, v23, v24, v25);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_6:

}

- (void)_buildRequestWithURL:(id)a3 headers:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v8[2](v8, v9);
}

- (void)fetchHighFrequencyBucketWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highFrequencyBucketURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__WBSPasswordBreachRequestManager_fetchHighFrequencyBucketWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E649DBB8;
  v9 = v4;
  v7 = v4;
  -[WBSPasswordBreachRequestManager _fetchBucketAtURL:withClientBlindedHash:completionHandler:](self, "_fetchBucketAtURL:withClientBlindedHash:completionHandler:", v6, 0, v8);

}

uint64_t __81__WBSPasswordBreachRequestManager_fetchHighFrequencyBucketWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_time_t v26;
  void (**v27)(id, void *);
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id obj;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  NSObject *v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = (void (**)(id, void *))a4;
  v7 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verboseSensitiveLoggingEnabled");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v38;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10);
        v12 = v7;
        dispatch_group_enter(v7);
        objc_msgSend(obj, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            v21 = v14;
            objc_msgSend(v13, "second");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "safari_stringAsHexWithData:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "first");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138740483;
            v42 = v11;
            v43 = 2117;
            v44 = v23;
            v45 = 2117;
            v46 = v24;
            _os_log_debug_impl(&dword_1B2621000, v21, OS_LOG_TYPE_DEBUG, "Looking up password with UUID %{sensitive}@, client-blinded hash %{sensitive}@ in bucket %{sensitive}@", buf, 0x20u);

          }
        }
        -[WBSPasswordBreachContext configuration](self->_context, "configuration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lowFrequencyBucketURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "first");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLByAppendingPathComponent:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "second");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke;
        v32[3] = &unk_1E649DBE0;
        v36 = v9;
        v33 = v29;
        v34 = v11;
        v7 = v12;
        v35 = v12;
        -[WBSPasswordBreachRequestManager _fetchBucketAtURL:withClientBlindedHash:completionHandler:](self, "_fetchBucketAtURL:withClientBlindedHash:completionHandler:", v18, v19, v32);

        ++v10;
      }
      while (v30 != v10);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v30);
  }

  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = dispatch_time(0, 1000000000 * objc_msgSend(v25, "lowFrequencyBucketFetchTimeout"));
  dispatch_group_wait(v7, v26);

  v27[2](v27, v29);
}

void __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  WBSPair *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(v6, "length"))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke_cold_1(v8, (uint64_t)v7);
    }
  }
  v9 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v5, v7);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to map downloaded data: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Failed to read bloom filter.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Failed to parse server blinded data.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_4(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "statusCode");
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Received non 2xx status code response: %d", (uint8_t *)v4, 8u);

}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Response was not an NSHTTPURLResponse.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __93__WBSPasswordBreachRequestManager__fetchBucketAtURL_withClientBlindedHash_completionHandler___block_invoke_2_cold_6(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to fetch bucket with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

void __120__WBSPasswordBreachRequestManager_fetchLowFrequencyBucketsForBucketIdentifiersAndClientBlindedHashes_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1;
  objc_msgSend(v3, "safari_stringAsHexWithData:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138739971;
  v7 = v5;
  _os_log_debug_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEBUG, "\tReceived server-client-blinded hash %{sensitive}@", (uint8_t *)&v6, 0xCu);

}

@end
