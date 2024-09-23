@implementation WBSOnDeviceSearchSuggestionsModelDownloader

- (WBSOnDeviceSearchSuggestionsModelDownloader)init
{
  WBSOnDeviceSearchSuggestionsModelDownloader *v2;
  WBSOnDeviceSearchSuggestionsModelEndpointFetcher *v3;
  WBSOnDeviceSearchSuggestionsModelEndpointFetcher *endpointFetcher;
  void *v5;
  uint64_t v6;
  NSURLSession *urlSession;
  WBSOnDeviceSearchSuggestionsModelDownloader *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSOnDeviceSearchSuggestionsModelDownloader;
  v2 = -[WBSOnDeviceSearchSuggestionsModelDownloader init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSOnDeviceSearchSuggestionsModelEndpointFetcher);
    endpointFetcher = v2->_endpointFetcher;
    v2->_endpointFetcher = v3;

    objc_msgSend(MEMORY[0x1E0C92CA0], "safari_ephemeralSessionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setURLCache:", 0);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)_cancelPendingDownload
{
  NSURLSessionDownloadTask *downloadTask;
  id v4;

  -[NSURLSessionDownloadTask cancel](self->_downloadTask, "cancel");
  downloadTask = self->_downloadTask;
  self->_downloadTask = 0;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSOnDeviceSearchSuggestionsModelDownloaderErrorDomain"), 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSOnDeviceSearchSuggestionsModelDownloader _callCompletionHandlerWithError:](self, "_callCompletionHandlerWithError:", v4);

}

- (void)_callCompletionHandlerWithError:(id)a3
{
  void (**completionHandler)(id, id);
  id v5;
  NSURLSessionDownloadTask *downloadTask;

  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

    downloadTask = self->_downloadTask;
    self->_downloadTask = 0;

  }
}

- (void)downloadOnDeviceSearchSuggestionsModelForLocale:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id completionHandler;
  void *v10;
  WBSOnDeviceSearchSuggestionsModelEndpointFetcher *endpointFetcher;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[WBSOnDeviceSearchSuggestionsModelDownloader _cancelPendingDownload](self, "_cancelPendingDownload");
  v8 = (void *)objc_msgSend(v7, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v8;

  +[WBSOnDeviceSearchSuggestionsModelManager sharedManager](WBSOnDeviceSearchSuggestionsModelManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  endpointFetcher = self->_endpointFetcher;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E4B3D3B8;
  objc_copyWeak(&v17, &location);
  v12 = v6;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  -[WBSOnDeviceSearchSuggestionsModelEndpointFetcher fetchModelEndpointURLsWithCompletionHandler:](endpointFetcher, "fetchModelEndpointURLsWithCompletionHandler:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void **v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "_callCompletionHandlerWithError:", v6);
      goto LABEL_19;
    }
    v9 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, "Model endpoint successfully fetched", buf, 2u);
    }
    v10 = a1 + 4;
    objc_msgSend(a1[4], "safari_localeStringInOfflineSearchModelFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = a1[5];
    objc_msgSend(v5, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateSupportedModelLocales:", v14);

    if (v12)
    {
      if ((unint64_t)objc_msgSend(v12, "sizeInBytes") > 0xA00000)
      {
        v15 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke_cold_1(v10, v15, v12);
        goto LABEL_18;
      }
      objc_msgSend(a1[5], "currentChecksumForModelWithLocale:", a1[4]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "checksumString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v16);

      if (!v20)
      {
        objc_msgSend(v8, "_downloadModelAtEndpoint:forLocale:", v12, *v10);
        goto LABEL_17;
      }
      v21 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1A3D90000, v21, OS_LOG_TYPE_DEFAULT, "No new model for the given checksum", v22, 2u);
      }
      v17 = v8;
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSOnDeviceSearchSuggestionsModelDownloaderErrorDomain"), 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v8;
      v18 = v16;
    }
    objc_msgSend(v17, "_callCompletionHandlerWithError:", v18);
LABEL_17:

LABEL_18:
  }
LABEL_19:

}

- (void)_downloadModelAtEndpoint:(id)a3 forLocale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSURLSession *urlSession;
  id v12;
  id v13;
  NSURLSessionDownloadTask *v14;
  NSURLSessionDownloadTask *downloadTask;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  id location;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  objc_msgSend(v6, "endpointURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v9, 1, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3042000000;
  v25 = __Block_byref_object_copy__28;
  v26 = __Block_byref_object_dispose__28;
  v27 = 0;
  objc_initWeak(&location, self);
  urlSession = self->_urlSession;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke;
  v16[3] = &unk_1E4B3D3E0;
  objc_copyWeak(&v20, &location);
  v19 = &v22;
  v12 = v7;
  v17 = v12;
  v13 = v6;
  v18 = v13;
  -[NSURLSession downloadTaskWithRequest:completionHandler:](urlSession, "downloadTaskWithRequest:completionHandler:", v10, v16);
  v14 = (NSURLSessionDownloadTask *)objc_claimAutoreleasedReturnValue();
  downloadTask = self->_downloadTask;
  self->_downloadTask = v14;

  objc_storeWeak(v23 + 5, v14);
  -[NSURLSessionDownloadTask resume](self->_downloadTask, "resume");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v27);

}

void __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[8];
  id v44;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      objc_msgSend(WeakRetained, "_callCompletionHandlerWithError:", v7);
    }
    else
    {
      v10 = (id)WeakRetained[1];
      if (v10)
      {
        v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

        if (v10 == v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "fileSize");

          if (v15 <= 0xA00000)
          {
            v17 = (void *)MEMORY[0x1E0C99D50];
            objc_msgSend(v6, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0;
            objc_msgSend(v17, "dataWithContentsOfFile:options:error:", v18, 8, &v44);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v44;

            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v19, "safari_SHA1Hash");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "safari_stringAsHexWithData:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "checksumString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "caseInsensitiveCompare:", v24);

            v26 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            v27 = v26;
            if (v25)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_2((uint64_t)v23, (void **)(a1 + 40), v27);
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSOnDeviceSearchSuggestionsModelDownloaderErrorDomain"), 2, 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "_callCompletionHandlerWithError:", v28);
            }
            else
            {
              v40 = v19;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A3D90000, v27, OS_LOG_TYPE_DEFAULT, "Succeeded in downloading new model data", buf, 2u);
              }
              +[WBSOnDeviceSearchSuggestionsModelManager sharedManager](WBSOnDeviceSearchSuggestionsModelManager, "sharedManager");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = *(_QWORD *)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "checksumString");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addOrUpdateModelForLocale:withChecksum:", v29, v30);

              objc_msgSend(v28, "fileURLForModelWithLocale:", *(_QWORD *)(a1 + 32));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v31;
              objc_msgSend(v31, "path");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v31) = objc_msgSend(v32, "fileExistsAtPath:", v33);

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if ((_DWORD)v31)
              {
                v42 = v20;
                v36 = v39;
                objc_msgSend(v34, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v39, v6, 0, 1, 0, &v42);
                v37 = v42;
                v19 = v40;
              }
              else
              {
                objc_msgSend(v28, "fileURLForModelWithLocale:", *(_QWORD *)(a1 + 32));
                v38 = objc_claimAutoreleasedReturnValue();
                v41 = v20;
                objc_msgSend(v35, "copyItemAtURL:toURL:error:", v6, v38, &v41);
                v37 = v41;

                v20 = (id)v38;
                v19 = v40;
                v36 = v39;
              }

              objc_msgSend(v9, "_callCompletionHandlerWithError:", v37);
              v20 = v37;
            }

          }
          else
          {
            v16 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_1(a1, v16);
          }
        }
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_endpointFetcher, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
}

void __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke_cold_1(void **a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "safari_localeStringInOfflineSearchModelFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "checksumString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "sizeInBytes");
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_6(&dword_1A3D90000, v8, v9, "Model for locale: %{private}@ with checksum: %{public}@ reports size: %ld which exceeds maximum (10 MB)", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_2_8();
}

void __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "safari_localeStringInOfflineSearchModelFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "checksumString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sizeInBytes");
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_6(&dword_1A3D90000, v7, v8, "Downloaded model for locale: %{private}@ with checksum: %{public}@ has size: %ld which exceeds maximum (10 MB)", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_8();
}

void __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_2(uint64_t a1, void **a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = a3;
  objc_msgSend(v4, "checksumString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Computed SHA1 checksum: %{public}@ does not the expected checksum: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
