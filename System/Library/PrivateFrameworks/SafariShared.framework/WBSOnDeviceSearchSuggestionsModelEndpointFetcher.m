@implementation WBSOnDeviceSearchSuggestionsModelEndpointFetcher

- (WBSOnDeviceSearchSuggestionsModelEndpointFetcher)init
{
  WBSOnDeviceSearchSuggestionsModelEndpointFetcher *v2;
  void *v3;
  uint64_t v4;
  NSURLSession *urlSession;
  WBSOnDeviceSearchSuggestionsModelEndpointFetcher *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSOnDeviceSearchSuggestionsModelEndpointFetcher;
  v2 = -[WBSOnDeviceSearchSuggestionsModelEndpointFetcher init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "safari_ephemeralSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setURLCache:", 0);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)fetchModelEndpointURLsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *modelEndpointInfos;
  void *v7;
  void *v8;
  NSURLSession *urlSession;
  NSURLSessionDataTask *v10;
  NSURLSessionDataTask *dataTask;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = v4;
  modelEndpointInfos = self->_modelEndpointInfos;
  if (modelEndpointInfos)
  {
    (*((void (**)(id, NSDictionary *, _QWORD))v4 + 2))(v4, modelEndpointInfos, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://ssl.gstatic.com/suggest-dev/external/head-suggest/model_config.txt"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:cachePolicy:timeoutInterval:", v7, 1, 2.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    urlSession = self->_urlSession;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __96__WBSOnDeviceSearchSuggestionsModelEndpointFetcher_fetchModelEndpointURLsWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E4B3D410;
    objc_copyWeak(&v14, &location);
    v13 = v5;
    -[NSURLSession dataTaskWithRequest:completionHandler:](urlSession, "dataTaskWithRequest:completionHandler:", v8, v12);
    v10 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
    dataTask = self->_dataTask;
    self->_dataTask = v10;

    -[NSURLSessionDataTask resume](self->_dataTask, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __96__WBSOnDeviceSearchSuggestionsModelEndpointFetcher_fetchModelEndpointURLsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6 || !WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
    objc_msgSend(v8, "_parseEndpointsFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v10, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSOnDeviceSearchSuggestionsModelEndpointFetcherErrorDomain"), 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
    v14 = (void *)v8[2];
    v8[2] = v10;
    v15 = v10;

    v16 = (void *)v8[1];
    v8[1] = 0;

  }
}

- (id)_parseEndpointsFromString:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WBSOnDeviceModelEndpointInfo *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  WBSOnDeviceModelEndpointInfo *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf;
  _BYTE v46[15];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("\n"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    v38 = *(_QWORD *)v48;
    while (2)
    {
      v8 = 0;
      v40 = v6;
      do
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
        objc_msgSend(v9, "safari_stringByTrimmingWhitespace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length") && objc_msgSend(v10, "characterAtIndex:", 0) != 35)
        {
          objc_msgSend(v9, "safari_stringByRemovingWrappingParenthesis");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "safari_indexOfFirstAppearanceOfCharacter:", 44);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_22;
          v13 = v12;
          objc_msgSend(v11, "substringToIndex:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "safari_stringByRemovingWrappingSingleQuotes");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = v11;
          objc_msgSend(v11, "substringFromIndex:", v13 + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "safari_stringByTrimmingWhitespace");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v16;
          objc_msgSend(v16, "safari_stringByRemovingWrappingParenthesis");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(","));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "safari_mapObjectsUsingBlock:", &__block_literal_global_76);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count") != 3)
          {
            v35 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[WBSOnDeviceSearchSuggestionsModelEndpointFetcher _parseEndpointsFromString:].cold.2((uint64_t)v9, v35);

            v11 = v44;
LABEL_22:

LABEL_23:
            v34 = 0;
            v33 = v39;
            goto LABEL_24;
          }
          v20 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "safari_stringByRemovingWrappingSingleQuotes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "URLWithString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = [WBSOnDeviceModelEndpointInfo alloc];
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "integerValue");
            objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "safari_stringByRemovingWrappingSingleQuotes");
            v41 = v17;
            v28 = v4;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[WBSOnDeviceModelEndpointInfo initWithEndpointURL:sizeInBytes:checksumString:](v24, "initWithEndpointURL:sizeInBytes:checksumString:", v23, v26, v29);
            v31 = v43;
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v30, v43);

            v4 = v28;
            v17 = v41;

            v7 = v38;
            v6 = v40;
          }
          else
          {
            v32 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            v6 = v40;
            v31 = v43;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[WBSOnDeviceSearchSuggestionsModelEndpointFetcher _parseEndpointsFromString:].cold.1(&buf, v46, v32);
          }

          if (!v23)
            goto LABEL_23;
        }
        else
        {

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v6)
        continue;
      break;
    }
  }

  v33 = v39;
  v34 = (void *)objc_msgSend(v39, "copy");
LABEL_24:

  return v34;
}

id __78__WBSOnDeviceSearchSuggestionsModelEndpointFetcher__parseEndpointsFromString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "safari_stringByTrimmingWhitespace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringByRemovingWrappingSingleQuotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_modelEndpointInfos, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (void)_parseEndpointsFromString:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to parse a valid endpoint URL.", buf, 2u);
}

- (void)_parseEndpointsFromString:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Unexpected model endpoint configuration file format: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
