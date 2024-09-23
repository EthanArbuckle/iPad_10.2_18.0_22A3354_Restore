@implementation SLDCloudDocsService

+ (id)sharedService
{
  if (sharedService_onceToken_1 != -1)
    dispatch_once(&sharedService_onceToken_1, &__block_literal_global_4);
  return (id)sharedService_sService_1;
}

+ (id)remoteObjectProtocol
{
  return &unk_1EE391AC8;
}

- (SLDCloudDocsService)init
{
  SLDCloudDocsService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *cloudDocsAccessQueue;
  SLHighlightCenter *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SLDCloudDocsService;
  v2 = -[SLDRemoteRenderingService init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.sociallaterd.cloudDocsHighlightsCache", v3);
    cloudDocsAccessQueue = v2->_cloudDocsAccessQueue;
    v2->_cloudDocsAccessQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SLHighlightCenter);
    -[SLDCloudDocsService setHighlightCenter:](v2, "setHighlightCenter:", v6);

    -[SLDCloudDocsService highlightCenter](v2, "highlightCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v2);

    -[SLDCloudDocsService fetchHighlights](v2, "fetchHighlights");
  }
  return v2;
}

void __36__SLDCloudDocsService_sharedService__block_invoke()
{
  SLDCloudDocsService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDCloudDocsService);
  v1 = (void *)sharedService_sService_1;
  sharedService_sService_1 = (uint64_t)v0;

}

- (void)prepareConnectionWithReply:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)shareURLForFileURL:(id)a3 sandboxTokenData:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  NSObject *v12;
  int64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  SLDCloudDocsService *v25;
  void (**v26)(id, _QWORD);
  _BYTE *v27;
  id v28;
  _BYTE buf[24];
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SLDCloudDocsService shareURLForFileURL:sandboxTokenData:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v30 = (int64_t)v9;
    _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "%s fileURL: %@ sandboxTokenData: %@", buf, 0x20u);
  }

  if (v8 && v9)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v30 = 0;
    v28 = 0;
    v13 = -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:](self, "_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:", v9, v8, v11, &v28);
    v14 = v28;
    v15 = v14;
    v30 = v13;
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == -1)
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCloudDocsService"), 1, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10[2](v10, 0);
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x1E0D10EF8]);
      objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithFileURL:documentType:", v8, v17);

      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke;
      v24 = &unk_1E3794B70;
      v25 = self;
      v27 = buf;
      v26 = v10;
      objc_msgSend(v18, "setCopyShareURLCompletionBlock:", &v21);
      v19 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v19, "setMaxConcurrentOperationCount:", 1, v21, v22, v23, v24, v25);
      objc_msgSend(v19, "addOperation:", v18);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SLDaemonLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v30 = (int64_t)v9;
      _os_log_error_impl(&dword_199EFF000, v20, OS_LOG_TYPE_ERROR, "[SLDCloudDocsService: %p] invalid fileURL/sandboxTokenData passed in: %@, %@", buf, 0x20u);
    }

    v10[2](v10, 0);
  }

}

void __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_releaseSandboxHandle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!v5 || v6)
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke_cold_1((_QWORD *)(a1 + 32), (uint64_t)v6, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    SLURLMinusFragmentForCKURLs(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)getCollaborationHighlightForShareURL:(id)a3 fileURL:(id)a4 sandboxTokenData:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  NSObject *v15;
  void *v16;
  int64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  SLDCloudDocsService *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v31 = (SLDCloudDocsService *)"-[SLDCloudDocsService getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:]";
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v12;
    _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_DEFAULT, "%s shareURL: %@ fileURL: %@ sandboxTokenData: %@", buf, 0x2Au);
  }

  if (v11 && v10 && v12)
  {
    SLURLMinusFragmentForCKURLs(v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v17 = -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:](self, "_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:", v12, v11, v14, &v29);
    v18 = v29;
    v19 = v18;
    if (v17 == -1)
    {
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCloudDocsService"), 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13[2](v13, 0);
    }
    else
    {
      v28 = v14;
      v20 = v16;
      -[SLDCloudDocsService highlightCenter](self, "highlightCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "highlights");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        -[SLDCloudDocsService urlToCollaborationHighlightCache](self, "urlToCollaborationHighlightCache");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v20;
        objc_msgSend(v24, "objectForKey:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(id, void *))v13)[2](v13, v25);
      }
      else
      {
        SLDaemonLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        v16 = v20;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[SLDCloudDocsService getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:].cold.1();

        v13[2](v13, 0);
      }
      v14 = v28;
    }

  }
  else
  {
    SLDaemonLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      v31 = self;
      v32 = 2112;
      v33 = v10;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      _os_log_error_impl(&dword_199EFF000, v26, OS_LOG_TYPE_ERROR, "[SLDCloudDocsService: %p] invalid shareURL/fileURL/sandboxTokenData passed in: %@, %@, %@", buf, 0x2Au);
    }

    v13[2](v13, 0);
  }

}

- (NSArray)highlights
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[SLDCloudDocsService cloudDocsAccessQueue](self, "cloudDocsAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SLDCloudDocsService_highlights__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __33__SLDCloudDocsService_highlights__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setHighlights:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SLDCloudDocsService highlights](self, "highlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if ((v6 & 1) == 0)
  {
    -[SLDCloudDocsService cloudDocsAccessQueue](self, "cloudDocsAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__SLDCloudDocsService_setHighlights___block_invoke;
    v8[3] = &unk_1E37942C0;
    v8[4] = self;
    v9 = v4;
    dispatch_barrier_async(v7, v8);

  }
}

void __37__SLDCloudDocsService_setHighlights___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (NSCache)urlToCollaborationHighlightCache
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[SLDCloudDocsService cloudDocsAccessQueue](self, "cloudDocsAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SLDCloudDocsService_urlToCollaborationHighlightCache__block_invoke;
  v6[3] = &unk_1E37942E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSCache *)v4;
}

void __55__SLDCloudDocsService_urlToCollaborationHighlightCache__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)setUrlToCollaborationHighlightCache:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SLDCloudDocsService urlToCollaborationHighlightCache](self, "urlToCollaborationHighlightCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[SLDCloudDocsService cloudDocsAccessQueue](self, "cloudDocsAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__SLDCloudDocsService_setUrlToCollaborationHighlightCache___block_invoke;
    v8[3] = &unk_1E37942C0;
    v8[4] = self;
    v9 = v4;
    dispatch_barrier_async(v7, v8);

  }
}

void __59__SLDCloudDocsService_setUrlToCollaborationHighlightCache___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)generateURLToCollaborationHighlightCache
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SLDCloudDocsService urlToCollaborationHighlightCache](self, "urlToCollaborationHighlightCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[SLDCloudDocsService highlights](self, "highlights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SLDCloudDocsService highlights](self, "highlights", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            objc_msgSend(v15, "resourceURL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            SLURLMinusFragmentForCKURLs(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v15, v17);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    -[SLDCloudDocsService setUrlToCollaborationHighlightCache:](self, "setUrlToCollaborationHighlightCache:", v8);
  }
}

- (void)fetchHighlights
{
  void *v3;
  _QWORD v4[5];

  -[SLDCloudDocsService highlightCenter](self, "highlightCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__SLDCloudDocsService_fetchHighlights__block_invoke;
  v4[3] = &unk_1E3794B98;
  v4[4] = self;
  objc_msgSend(v3, "fetchHighlights:", v4);

}

void __38__SLDCloudDocsService_fetchHighlights__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHighlights:", a2);
    objc_msgSend(*(id *)(a1 + 32), "generateURLToCollaborationHighlightCache");
  }
  else
  {
    SLDaemonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38__SLDCloudDocsService_fetchHighlights__block_invoke_cold_1(a1, v3);

  }
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  NSObject *v5;
  int v6;
  SLDCloudDocsService *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[%p] Handling highlightCenter:didRemoveHighlights: delegate callback", (uint8_t *)&v6, 0xCu);
  }

  -[NSCache removeAllObjects](self->_urlToCollaborationHighlightCache, "removeAllObjects");
  -[SLDCloudDocsService fetchHighlights](self, "fetchHighlights");
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  NSObject *v4;
  int v5;
  SLDCloudDocsService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "[%p] Handling highlightCenterDidAddHighlights: delegate callback", (uint8_t *)&v5, 0xCu);
  }

  -[NSCache removeAllObjects](self->_urlToCollaborationHighlightCache, "removeAllObjects");
  -[SLDCloudDocsService fetchHighlights](self, "fetchHighlights");
}

- (int64_t)_acquireSandboxHandleData:(id)a3 ForFileProviderDocumentURL:(id)a4 clientConnection:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  uint64_t v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  SLDCloudDocsService *v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v10, "length"))
  {
    SLDaemonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:].cold.2();
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v10, "getBytes:range:", buf, objc_msgSend(v10, "length") - 1, 1);
  if (buf[0])
  {
    SLDaemonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:].cold.3();
LABEL_7:

LABEL_8:
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:].cold.1();

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCloudDocsService"), 2, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_12:
    v15 = -1;
    goto LABEL_13;
  }
  objc_msgSend(objc_retainAutorelease(v10), "bytes");
  v17 = sandbox_extension_consume();
  if (v17 == -1)
    goto LABEL_8;
  v15 = v17;
  if (!-[SLDCloudDocsService _connection:hasPermissionForFileURL:](self, "_connection:hasPermissionForFileURL:", v12, v11))
  {
    SLDaemonLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2112;
      v27 = (int64_t)v11;
      v28 = 2112;
      v29 = v12;
      _os_log_error_impl(&dword_199EFF000, v22, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but the xpc connection (%@) does not have permission to access the file. Releasing sandbox handle.", buf, 0x20u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCloudDocsService"), 4, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SLDCloudDocsService _releaseSandboxHandle:](self, "_releaseSandboxHandle:", v15);
    goto LABEL_12;
  }
  v23 = 0;
  v18 = -[SLDCloudDocsService _fileURLHasFileProvider:error:](self, "_fileURLHasFileProvider:error:", v11, &v23);
  v19 = v23;
  SLDaemonLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2112;
      v27 = (int64_t)v11;
      v28 = 2112;
      v29 = v19;
      _os_log_error_impl(&dword_199EFF000, v21, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but could not find a valid FPItem for that file. This file might not be managed by a FileProvider. Releasing sandbox handle. FileProvider error: %@", buf, 0x20u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCloudDocsService"), 3, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SLDCloudDocsService _releaseSandboxHandle:](self, "_releaseSandboxHandle:", v15);

    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = self;
    v26 = 2048;
    v27 = v15;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_199EFF000, v21, OS_LOG_TYPE_DEFAULT, "[%p] _acquireSandboxHandleData: acquired a new handle: %lld for file: %@", buf, 0x20u);
  }

LABEL_13:
  return v15;
}

- (BOOL)_fileURLHasFileProvider:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CAAC80];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemForURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (BOOL)_connection:(id)a3 hasPermissionForFileURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (v5
    && (objc_msgSend(v5, "auditToken"), objc_msgSend(v6, "isFileURL"))
    && (objc_msgSend(v6, "path"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    objc_msgSend(v5, "auditToken");
    objc_msgSend(v6, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "fileSystemRepresentation");
    v10 = sandbox_check_by_audit_token() == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_releaseSandboxHandle:(int64_t)a3
{
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  SLDCloudDocsService *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = sandbox_extension_release();
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDCloudDocsService _releaseSandboxHandle:].cold.1((uint64_t)self, a3, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "[%p] _releaseSandboxHandle: released handle: %lld", (uint8_t *)&v8, 0x16u);
  }

}

- (OS_dispatch_queue)cloudDocsAccessQueue
{
  return self->_cloudDocsAccessQueue;
}

- (SLHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (void)setHighlightCenter:(id)a3
{
  objc_storeStrong((id *)&self->_highlightCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);
  objc_storeStrong((id *)&self->_urlToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_cloudDocsAccessQueue, 0);
}

void __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, a2, a3, "[SLDCloudDocsService: %p] failed to get url with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[SLDCloudDocsService: %p] no highlights to check against a highlight for URL: %@");
  OUTLINED_FUNCTION_5();
}

void __38__SLDCloudDocsService_fetchHighlights__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[%p] fetchHighlights: failed to fetch highlights", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[%p] _acquireSandboxHandleData: failed to consume sandbox token for file: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[%p] _acquireSandboxHandleData: tokenData for file (%@) was empty.");
  OUTLINED_FUNCTION_5();
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, v0, v1, "[%p] _acquireSandboxHandleData: sandbox token for file (%@) was not null-terminated.");
  OUTLINED_FUNCTION_5();
}

- (void)_releaseSandboxHandle:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, a2, a3, "[%p] _releaseSandboxHandle: unable to release sandbox extension handle: %lld. Sandbox extensions are a limited resource and this should be investigated!", (const void *)v3, *((_QWORD *)&v3 + 1));
  OUTLINED_FUNCTION_5();
}

@end
