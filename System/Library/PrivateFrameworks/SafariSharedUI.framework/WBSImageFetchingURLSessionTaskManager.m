@implementation WBSImageFetchingURLSessionTaskManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_18);
  return (id)sharedManager_sharedManager;
}

void __54__WBSImageFetchingURLSessionTaskManager_sharedManager__block_invoke()
{
  WBSImageFetchingURLSessionTaskManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSImageFetchingURLSessionTaskManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (WBSImageFetchingURLSessionTaskManager)init
{
  WBSImageFetchingURLSessionTaskManager *v2;
  uint64_t v3;
  NSMutableDictionary *urlSessionsByType;
  WBSImageFetchingURLSessionTaskManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSImageFetchingURLSessionTaskManager;
  v2 = -[WBSImageFetchingURLSessionTaskManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    urlSessionsByType = v2->_urlSessionsByType;
    v2->_urlSessionsByType = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)downloadFirstValidImageWithURLs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  NSObject *v40;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    -[WBSImageFetchingURLSessionTaskManager _urlSessionWithOptions:](self, "_urlSessionWithOptions:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_group_create();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__7;
    v37[4] = __Block_byref_object_dispose__7;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__7;
    v35[4] = __Block_byref_object_dispose__7;
    v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__7;
    v33[4] = __Block_byref_object_dispose__7;
    v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__7;
    v31[4] = __Block_byref_object_dispose__7;
    v32 = 0;
    dispatch_group_enter(v12);
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2;
    v25[3] = &unk_1E54441F8;
    v27 = v37;
    v28 = v35;
    v29 = v33;
    v30 = v31;
    v14 = v12;
    v26 = v14;
    -[WBSImageFetchingURLSessionTaskManager _downloadFirstValidImageWithURLs:inURLSession:failedURLDownloadsToErrorsDictionary:completionHandler:](self, "_downloadFirstValidImageWithURLs:inURLSession:failedURLDownloadsToErrorsDictionary:completionHandler:", v8, v10, v11, v25);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2;
    block[3] = &unk_1E5444220;
    v21 = v37;
    v22 = v35;
    v23 = v33;
    v24 = v31;
    v19 = v11;
    v20 = v9;
    v15 = v11;
    v16 = v9;
    dispatch_group_notify(v14, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

    v17 = v10;
  }
  else
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke;
    v39[3] = &unk_1E54423D0;
    v40 = v9;
    v17 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v39);
    v14 = v40;
  }

}

uint64_t __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;
  v24 = v9;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v10;
  v17 = v10;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v11;
  v20 = v11;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v12;
  v23 = v12;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __99__WBSImageFetchingURLSessionTaskManager_downloadFirstValidImageWithURLs_options_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), a1[4]);
}

- (void)downloadImageWithURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v15[0] = a3;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandler___block_invoke;
  v13[3] = &unk_1E5444248;
  v14 = v8;
  v12 = v8;
  -[WBSImageFetchingURLSessionTaskManager downloadFirstValidImageWithURLs:options:completionHandler:](self, "downloadFirstValidImageWithURLs:options:completionHandler:", v11, a4, v13);

}

uint64_t __88__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadImageWithURL:(id)a3 options:(unint64_t)a4 completionHandlerIncludingErrors:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v15[0] = a3;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandlerIncludingErrors___block_invoke;
  v13[3] = &unk_1E5444248;
  v14 = v8;
  v12 = v8;
  -[WBSImageFetchingURLSessionTaskManager downloadFirstValidImageWithURLs:options:completionHandler:](self, "downloadFirstValidImageWithURLs:options:completionHandler:", v11, a4, v13);

}

uint64_t __103__WBSImageFetchingURLSessionTaskManager_downloadImageWithURL_options_completionHandlerIncludingErrors___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_downloadFirstValidImageWithURLs:(id)a3 inURLSession:(id)a4 failedURLDownloadsToErrorsDictionary:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  WBSImageFetchingURLSessionTaskManager *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(a3, "copy");
  v14 = objc_msgSend(v13, "count");
  objc_msgSend(v13, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke;
  v23[3] = &unk_1E5444298;
  v24 = v11;
  v25 = v15;
  v29 = v12;
  v30 = v14;
  v26 = self;
  v27 = v13;
  v28 = v10;
  v17 = v10;
  v18 = v13;
  v19 = v12;
  v20 = v15;
  v21 = v11;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v16, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resume");

}

void __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v7);
  if (v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 80);
    if (v11 > 1)
    {
      v12 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "subarrayWithRange:", 1, v11 - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_downloadFirstValidImageWithURLs:inURLSession:failedURLDownloadsToErrorsDictionary:completionHandler:", v13, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke_2;
      block[3] = &unk_1E5444270;
      v19 = *(id *)(a1 + 72);
      v15 = 0;
      v16 = v7;
      v17 = *(id *)(a1 + 40);
      v18 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __142__WBSImageFetchingURLSessionTaskManager__downloadFirstValidImageWithURLs_inURLSession_failedURLDownloadsToErrorsDictionary_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (id)_urlSessionWithOptions:(unint64_t)a3
{
  NSMutableDictionary *urlSessionsByType;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  urlSessionsByType = self->_urlSessionsByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](urlSessionsByType, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "safari_ephemeralSessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsCellularAccess:", a3 & 1);
    if ((a3 & 2) != 0)
      objc_msgSend(v9, "setHTTPCookieStorage:", 0);
    if ((a3 & 4) != 0)
      objc_msgSend(v9, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.Passwords.PRIconFetching"));
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v9, self, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_urlSessionsByType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

    v8 = v10;
  }

  return v8;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a6;
  if (objc_msgSend(a5, "previousFailureCount") < 1)
    v7 = 1;
  else
    v7 = 3;
  v8[2](v8, v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSessionsByType, 0);
}

@end
