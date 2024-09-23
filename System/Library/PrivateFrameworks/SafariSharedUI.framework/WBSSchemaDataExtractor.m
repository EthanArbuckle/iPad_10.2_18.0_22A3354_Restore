@implementation WBSSchemaDataExtractor

+ (void)fetchDataFromWebView:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource;
  if (!fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = objc_msgSend(v8, "initWithBytesNoCopy:length:encoding:freeWhenDone:", schemaDataExtractorSource, schemaDataExtractorSourceLength, 4, 0);
    v10 = (void *)fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource;
    fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource = v9;

    v7 = fetchDataFromWebView_completionHandler__schemaDataFetcherScriptSource;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke;
  v12[3] = &unk_1E5443E30;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v5, "_evaluateJavaScriptWithoutUserGesture:completionHandler:", v7, v12);

}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_3(v7, v6);
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    if (objc_msgSend(v5, "count") == 2)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v17 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                  __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_1(v13, v17, v18);
                (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

                goto LABEL_20;
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            continue;
          break;
        }
      }

      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void (**)(uint64_t))(v14 + 16);
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_2(v16);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void (**)(uint64_t))(v14 + 16);
    }
    v15(v14);
  }
LABEL_20:

}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138477827;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a2, a3, "Fetching schema data returned unexpected result: %{private}@", (uint8_t *)&v3);
}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Fetching schema data returned nil result", v1, 2u);
}

void __65__WBSSchemaDataExtractor_fetchDataFromWebView_completionHandler___block_invoke_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, v3, v5, "Fetching schema data failed with error: %{public}@", (uint8_t *)&v6);

}

@end
