@implementation WKWebView(WBSWKWebViewExtras)

- (void)saveWebpageCompleteToURL:()WBSWKWebViewExtras withCollectionMethod:collectionOptions:completionHandler:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = v10;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v32);
  v15 = v32;

  if ((v14 & 1) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.html"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(MEMORY[0x1E0CEF690]);
    objc_msgSend(v19, "setDirectory:", v12);
    objc_msgSend(v19, "setSuggestedFileName:", v18);
    if ((a5 & 4) != 0)
    {
      v25 = a4;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF698]), "initWithElementLocalName:attributeLocalNames:attributeValues:", CFSTR("script"), 0, 0);
      v33[0] = v20;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF698]), "initWithElementLocalName:attributeLocalNames:attributeValues:", CFSTR("noscript"), 0, 0);
      v33[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setExclusionRules:", v22);

      a4 = v25;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __115__WKWebView_WBSWKWebViewExtras__saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke;
    v26[3] = &unk_1E54412F0;
    v29 = v11;
    v30 = a5;
    v26[4] = a1;
    v27 = v12;
    v28 = v18;
    v31 = a4;
    v23 = v18;
    objc_msgSend(a1, "_archiveWithConfiguration:completionHandler:", v19, v26);

  }
  else
  {
    v24 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[WKWebView(WBSWKWebViewExtras) saveWebpageCompleteToURL:withCollectionMethod:collectionOptions:completionHandler:].cold.1();
    (*((void (**)(id, id))v11 + 2))(v11, v15);
  }

}

- (void)saveWebpageCompleteToURL:()WBSWKWebViewExtras withCollectionMethod:collectionOptions:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v3 = 2113;
  v4 = v0;
  _os_log_error_impl(&dword_1A840B000, v1, OS_LOG_TYPE_ERROR, "Failed to create directory at %{private}@: %{private}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
