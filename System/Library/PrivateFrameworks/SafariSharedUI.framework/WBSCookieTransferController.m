@implementation WBSCookieTransferController

+ (WBSCookieTransferController)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WBSCookieTransferController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (WBSCookieTransferController *)(id)sharedController_controller;
}

void __47__WBSCookieTransferController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v1;

}

- (WBSCookieTransferController)init
{
  WBSCookieTransferController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  WBSCookieTransferController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSCookieTransferController;
  v2 = -[WBSCookieTransferController init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.SafariShared.cookieTransferQueue", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)copyCookiesFromWebView:(id)a3 intoFolderAtURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *internalQueue;
  _QWORD block[4];
  id v25;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "websiteDataStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "httpCookieStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safari_highLevelDomainFromHost");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v16, "safari_stringByRemovingWwwDotPrefix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(&unk_1E547BD30, "containsObject:", v17);

    if (!v18)
    {
      -[WBSCookieTransferController _copyCookiesFromCookieStore:matchingDomain:intoFolderAtURL:completionHandler:](self, "_copyCookiesFromCookieStore:matchingDomain:intoFolderAtURL:completionHandler:", v13, v16, v8, v9);
      goto LABEL_9;
    }
    v19 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v19, OS_LOG_TYPE_INFO, "Skipping cookie copying due to quirks", buf, 2u);
    }
  }
  else
  {
    v20 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[WBSCookieTransferController copyCookiesFromWebView:intoFolderAtURL:completionHandler:].cold.1(v20, v21, v22);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__WBSCookieTransferController_copyCookiesFromWebView_intoFolderAtURL_completionHandler___block_invoke;
  block[3] = &unk_1E54423D0;
  v25 = v9;
  dispatch_async(internalQueue, block);

LABEL_9:
}

uint64_t __88__WBSCookieTransferController_copyCookiesFromWebView_intoFolderAtURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_copyCookiesFromCookieStore:(id)a3 matchingDomain:(id)a4 intoFolderAtURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_ensureDirectoryExists:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke;
    v16[3] = &unk_1E5442420;
    v16[4] = self;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    objc_msgSend(v10, "getAllCookies:", v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2;
  v7[3] = &unk_1E54423F8;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "safari_belongsToCookieDomain:", v9);

        if ((_DWORD)v8)
        {
          v10 = *(void **)(a1 + 48);
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.plist"), v13);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URLByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "properties");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          LOBYTE(v14) = objc_msgSend(v16, "writeToURL:error:", v15, &v20);
          v17 = v20;

          if ((v14 & 1) == 0)
          {
            v18 = WBS_LOG_CHANNEL_PREFIXWebApps();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v17;
              _os_log_error_impl(&dword_1A840B000, v18, OS_LOG_TYPE_ERROR, "Unable to write cookie to plist: %{public}@", buf, 0xCu);
            }
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)copyCookiesFromFolderAtURL:(id)a3 intoDataStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  char v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t v42;
  _BYTE v43[7];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  unsigned __int8 v50;
  _BYTE v51[16];
  _BYTE v52[16];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v50);
  v10 = v50;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v49 = 0;
    objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, &v49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v49;
    if (v13)
    {
      v14 = v13;
      v15 = WBS_LOG_CHANNEL_PREFIXWebApps();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.5(v15, v14);
    }
    else
    {
      v39 = v7;
      v36 = v6;
      v37 = v5;
      objc_msgSend(v6, "httpCookieStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v35 = v12;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v20 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v46 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v22, "pathExtension", v35);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("plist"));

            if (v24)
            {
              v44 = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v22, &v44);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v44;

              if (v25)
              {
                objc_msgSend(MEMORY[0x1E0C92C00], "cookieWithProperties:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  objc_msgSend(v38, "setCookie:completionHandler:", v27, 0);
                  v41 = v26;
                  v28 = objc_msgSend(v39, "removeItemAtURL:error:", v22, &v41);
                  v29 = v41;

                  if ((v28 & 1) != 0)
                  {
                    v26 = v29;
                  }
                  else
                  {
                    v32 = WBS_LOG_CHANNEL_PREFIXWebApps();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                      -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.4((uint64_t)v51, v32);

                    v26 = 0;
                  }
                }
                else
                {
                  v31 = WBS_LOG_CHANNEL_PREFIXWebApps();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.3(&v42, v43, v31);
                }

              }
              else
              {
                v30 = WBS_LOG_CHANNEL_PREFIXWebApps();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.2((uint64_t)v52, v30);
              }

              v19 = v26;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v18);
      }
      else
      {
        v19 = 0;
      }

      v40 = v19;
      v7 = v39;
      v5 = v37;
      v33 = objc_msgSend(v39, "removeItemAtURL:error:", v37, &v40);
      v14 = v40;

      if ((v33 & 1) == 0)
      {
        v34 = WBS_LOG_CHANNEL_PREFIXWebApps();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.1(v34, v14);
      }

      v12 = v35;
      v6 = v36;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)copyCookiesFromWebView:(NSObject *)a1 intoFolderAtURL:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_5(&dword_1A840B000, a1, a3, "Unable to find cookie store", v3);
}

- (void)copyCookiesFromFolderAtURL:(void *)a1 intoDataStore:(void *)a2 .cold.1(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Unable to remove staged cookie directory: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)copyCookiesFromFolderAtURL:(uint64_t)a1 intoDataStore:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_0_6(&dword_1A840B000, v7, v8, "Unable to read cookie plist: %{public}@");

  OUTLINED_FUNCTION_4_3();
}

- (void)copyCookiesFromFolderAtURL:(NSObject *)a3 intoDataStore:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_5(&dword_1A840B000, a3, (uint64_t)a3, "Unable to initialize cookie with plist", a1);
}

- (void)copyCookiesFromFolderAtURL:(uint64_t)a1 intoDataStore:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_0_6(&dword_1A840B000, v7, v8, "Unable to remove cookie plist: %{public}@");

  OUTLINED_FUNCTION_4_3();
}

- (void)copyCookiesFromFolderAtURL:(void *)a1 intoDataStore:(void *)a2 .cold.5(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Unable to enumerate staged cookies directory: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
