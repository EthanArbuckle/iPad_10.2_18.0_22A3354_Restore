@implementation WKWebView

void __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_cold_1();
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 64) & 2) != 0)
    {
      v6 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9;
      v11[3] = &unk_1E54412C8;
      v15 = *(id *)(a1 + 56);
      v7 = *(id *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 32);
      v12 = v7;
      v13 = v8;
      v9 = *(id *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 72);
      v14 = v9;
      v16 = v10;
      objc_msgSend(v6, "takeSnapshotWithConfiguration:completionHandler:", 0, v11);

      goto LABEL_8;
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v5();
LABEL_8:

}

void __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9(uint64_t a1, UIImage *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  char v18;
  id v19;
  void (*v20)(void);
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9_cold_3();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    UIImagePNGRepresentation(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("capture.png"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 0, &v24);
    v6 = v24;

    if ((v10 & 1) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0D8A158]);
      objc_msgSend(*(id *)(a1 + 40), "_committedURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUrl:", v12);

      objc_msgSend(*(id *)(a1 + 40), "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPageTitle:", v13);

      objc_msgSend(*(id *)(a1 + 40), "_userAgent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUserAgent:", v14);

      objc_msgSend(*(id *)(a1 + 40), "frame");
      objc_msgSend(v11, "setViewportSize:", v15, v16);
      objc_msgSend(v11, "setIndexFileName:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v11, "setScreenCaptureFileName:", CFSTR("capture.png"));
      objc_msgSend(v11, "setCollectionMethod:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("safari_collection_metadata.json"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v6;
      v18 = objc_msgSend(v11, "writeMetadataJSONToURL:error:", v17, &v23);
      v19 = v23;

      if ((v18 & 1) != 0)
      {
        v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      }
      else
      {
        v22 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9_cold_1();
        v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      }
      v20();

      v6 = v19;
    }
    else
    {
      v21 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9_cold_2();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A840B000, v0, v1, "Failed to save web page: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A840B000, v0, v1, "Failed to write collection metadata with error: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A840B000, v0, v1, "Failed to write page snapshot with error: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_9_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A840B000, v0, v1, "Failed to snapshot webpage: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
