@implementation SSDownloadManagerBookShim2

- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSDownloadManagerBookShim2;
  v5 = -[SSDownloadManager _copyDownloadsForMessage:downloadIDs:](&v8, sel__copyDownloadsForMessage_downloadIDs_, a3, a4);
  -[SSDownloadManagerBookShim2 __book_getAllDownloads](self, "__book_getAllDownloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  return v5;
}

- (id)__book_getAllDownloads
{
  void *v3;
  void *v4;

  -[SSBookDownloadQueue downloads](self->_downloadQueue, "downloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDownloadManagerBookShim2 __book_downloadsForStati:overrideFinished:overrideFailed:](self, "__book_downloadsForStati:overrideFinished:overrideFailed:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)__book_downloadsForStati:(id)a3 overrideFinished:(BOOL)a4 overrideFailed:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  __CFString **v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  SSBookDownload *v18;
  SSBookDownload *v19;
  SSBookDownload *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    v13 = v6 || v5;
    if (v6)
      v14 = SSDownloadPhaseFinished;
    else
      v14 = &SSDownloadPhaseFailed;
    v15 = *v14;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
        v18 = [SSBookDownload alloc];
        v19 = -[SSBookDownload initWithDownloadStatus:](v18, "initWithDownloadStatus:", v17, (_QWORD)v23);
        v20 = v19;
        if (v19)
        {
          if (v13)
            -[SSBookDownload setDownloadPhaseIdentifierOverride:](v19, "setDownloadPhaseIdentifierOverride:", v15);
          objc_msgSend(v8, "addObject:", v20);
        }

        ++v16;
      }
      while (v11 != v16);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_msgSend(v8, "copy");
  return v21;
}

- (SSDownloadManagerBookShim2)initWithManagerOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SSDownloadManagerBookShim2 *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  SSBookDownloadQueue *downloadQueue;
  SSBookDownloadQueue *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v41;
  uint64_t v42;
  objc_super v43;
  int v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    v7 &= 2u;
  if (v7)
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    v44 = 138543618;
    v45 = v9;
    v46 = 2114;
    v47 = (id)objc_opt_class();
    v11 = v47;
    LODWORD(v42) = 22;
    v41 = &v44;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v44, v42);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v5, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v8);
  }

LABEL_12:
  v43.receiver = self;
  v43.super_class = (Class)SSDownloadManagerBookShim2;
  v19 = -[SSDownloadManager initWithManagerOptions:](&v43, sel_initWithManagerOptions_, v4);

  if (v19)
  {
    v20 = SSVBookAssetDaemonFramework();
    v21 = SSVWeakLinkedClassForString(CFSTR("BLDownloadQueue"), v20);
    if (v21)
    {
      objc_msgSend(v21, "sharedInstance");
      v22 = objc_claimAutoreleasedReturnValue();
      downloadQueue = v19->_downloadQueue;
      v19->_downloadQueue = (SSBookDownloadQueue *)v22;

      v24 = v19->_downloadQueue;
      if (v24)
      {
        -[SSBookDownloadQueue addObserver:](v24, "addObserver:", v19);
        return v19;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v29 = objc_msgSend(v25, "shouldLog", v41);
      if (objc_msgSend(v25, "shouldLogToDisk"))
        v30 = v29 | 2;
      else
        v30 = v29;
      objc_msgSend(v25, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        v30 &= 2u;
      if (!v30)
        goto LABEL_35;
    }
    else
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v26 = objc_msgSend(v25, "shouldLog", v41);
      if (objc_msgSend(v25, "shouldLogToDisk"))
        v27 = v26 | 2;
      else
        v27 = v26;
      objc_msgSend(v25, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        v27 &= 2u;
      if (!v27)
        goto LABEL_35;
    }
    v31 = (void *)objc_opt_class();
    v44 = 138543362;
    v45 = v31;
    v32 = v31;
    LODWORD(v42) = 12;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (!v33)
    {
LABEL_36:

      return v19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v33, 4, &v44, v42);
    v28 = objc_claimAutoreleasedReturnValue();
    free(v33);
    SSFileLog(v25, CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v28);
LABEL_35:

    goto LABEL_36;
  }
  return v19;
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *accessQueue;
  int *v33;
  uint64_t v34;
  _QWORD block[4];
  id v36;
  SSDownloadManagerBookShim2 *v37;
  int v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    v8 &= 2u;
  if (v8)
  {
    v38 = 138543618;
    v39 = (id)objc_opt_class();
    v40 = 2112;
    v41 = v5;
    v10 = v39;
    LODWORD(v34) = 22;
    v33 = &v38;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v38, v34);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v9);
  }

LABEL_12:
  -[SSDownloadManagerBookShim2 __book_downloadsForStati:overrideFinished:overrideFailed:](self, "__book_downloadsForStati:overrideFinished:overrideFailed:", v5, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog", v33);
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    v21 &= 2u;
  if (v21)
  {
    v23 = (void *)objc_opt_class();
    v38 = 138543618;
    v39 = v23;
    v40 = 2112;
    v41 = v18;
    v24 = v23;
    LODWORD(v34) = 22;
    v25 = (void *)_os_log_send_and_compose_impl();

    if (!v25)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v38, v34);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v25);
    SSFileLog(v19, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v22);
  }

LABEL_23:
  if (objc_msgSend(v18, "count"))
  {
    accessQueue = self->super._accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SSDownloadManagerBookShim2_downloadQueue_downloadStatesDidChange___block_invoke;
    block[3] = &unk_1E47B8768;
    v36 = v18;
    v37 = self;
    dispatch_async(accessQueue, block);

  }
}

void __68__SSDownloadManagerBookShim2_downloadQueue_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  int8x16_t v12;
  _QWORD block[4];
  id v14;
  int8x16_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_resetAllDownloads");
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 40) + 80);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v2, "addObject:", v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SSDownloadManagerBookShim2_downloadQueue_downloadStatesDidChange___block_invoke_2;
    block[3] = &unk_1E47B87B8;
    v14 = v2;
    v12 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v12.i64[0];
    v15 = vextq_s8(v12, v12, 8uLL);
    v11 = v2;
    dispatch_async(v9, block);

  }
}

void __68__SSDownloadManagerBookShim2_downloadQueue_downloadStatesDidChange___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy", (_QWORD)v10);
        objc_msgSend(v7, "downloadManager:downloadStatesDidChange:", v8, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *accessQueue;
  int *v35;
  uint64_t v36;
  _QWORD block[5];
  id v38;
  int v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    v10 &= 2u;
  if (v10)
  {
    v39 = 138543618;
    v40 = (id)objc_opt_class();
    v41 = 2112;
    v42 = v7;
    v12 = v40;
    LODWORD(v36) = 22;
    v35 = &v39;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v39, v36);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
  }

LABEL_12:
  -[SSDownloadManagerBookShim2 __book_downloadsForStati:overrideFinished:overrideFailed:](self, "__book_downloadsForStati:overrideFinished:overrideFailed:", v7, a5 == 0, a5 != 0, v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = objc_msgSend(v21, "shouldLog");
  if (objc_msgSend(v21, "shouldLogToDisk"))
    v23 = v22 | 2;
  else
    v23 = v22;
  objc_msgSend(v21, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    v23 &= 2u;
  if (v23)
  {
    v25 = (void *)objc_opt_class();
    v39 = 138543618;
    v40 = v25;
    v41 = 2112;
    v42 = v20;
    v26 = v25;
    LODWORD(v36) = 22;
    v27 = (void *)_os_log_send_and_compose_impl();

    if (!v27)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v39, v36);
    v24 = objc_claimAutoreleasedReturnValue();
    free(v27);
    SSFileLog(v21, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v24);
  }

LABEL_23:
  if (objc_msgSend(v20, "count"))
  {
    accessQueue = self->super._accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__SSDownloadManagerBookShim2_downloadQueue_downloadStates_didCompleteWithError___block_invoke;
    block[3] = &unk_1E47B8768;
    block[4] = self;
    v38 = v20;
    dispatch_async(accessQueue, block);

  }
}

void __80__SSDownloadManagerBookShim2_downloadQueue_downloadStates_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_resetAllDownloads");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sendDownloadsChanged:", v3);

}

- (void)__book_dispatchBlock:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SSDownloadManagerBookShim2___book_dispatchBlock_withError___block_invoke;
    v8[3] = &unk_1E47B8A98;
    v10 = v5;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

uint64_t __61__SSDownloadManagerBookShim2___book_dispatchBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)__book_filterDownloads:(id)a3 withResult:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
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
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v7;
        else
          v15 = v8;
        objc_msgSend(v15, "addObject:", v14, (_QWORD)v18);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  v17 = (void *)objc_msgSend(v8, "copy");
  v6[2](v6, v16, v17);

}

- (void)cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SSDownloadManagerBookShim2_cancelDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E47BFF80;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSDownloadManagerBookShim2 __book_filterDownloads:withResult:](self, "__book_filterDownloads:withResult:", a3, v8);

}

void __62__SSDownloadManagerBookShim2_cancelDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SSDownloadManagerBookShim2_cancelDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E47BFF58;
    objc_copyWeak(&v12, &location);
    v11 = *(id *)(a1 + 40);
    v10 = v5;
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerBookShim2;
    objc_msgSendSuper2(&v8, sel_cancelDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__book_cancelDownloads:completionBlock:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __62__SSDownloadManagerBookShim2_cancelDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), v5);
  else
    objc_msgSend(WeakRetained, "__book_cancelDownloads:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char IsBookToShimKind;
  void *v13;
  char v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "valueForProperty:", CFSTR("1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IsBookToShimKind = SSDownloadKindIsBookToShimKind((uint64_t)v11);

  objc_msgSend(v9, "valueForProperty:", CFSTR("1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SSDownloadKindIsBookToShimKind((uint64_t)v13);

  if ((IsBookToShimKind & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerBookShim2;
    -[SSDownloadManager moveDownload:afterDownload:completionBlock:](&v15, sel_moveDownload_afterDownload_completionBlock_, v8, v9, v10);
  }

}

- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char IsBookToShimKind;
  void *v13;
  char v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "valueForProperty:", CFSTR("1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IsBookToShimKind = SSDownloadKindIsBookToShimKind((uint64_t)v11);

  objc_msgSend(v9, "valueForProperty:", CFSTR("1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SSDownloadKindIsBookToShimKind((uint64_t)v13);

  if ((IsBookToShimKind & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerBookShim2;
    -[SSDownloadManager moveDownload:beforeDownload:completionBlock:](&v15, sel_moveDownload_beforeDownload_completionBlock_, v8, v9, v10);
  }

}

- (void)resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SSDownloadManagerBookShim2_resumeDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E47BFF80;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSDownloadManagerBookShim2 __book_filterDownloads:withResult:](self, "__book_filterDownloads:withResult:", a3, v8);

}

void __62__SSDownloadManagerBookShim2_resumeDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SSDownloadManagerBookShim2_resumeDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E47BFF58;
    objc_copyWeak(&v12, &location);
    v11 = *(id *)(a1 + 40);
    v10 = v5;
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerBookShim2;
    objc_msgSendSuper2(&v8, sel_resumeDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__book_resumeDownloads:completionBlock:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __62__SSDownloadManagerBookShim2_resumeDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), v5);
  else
    objc_msgSend(WeakRetained, "__book_resumeDownloads:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)restartDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SSDownloadManagerBookShim2_restartDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E47BFF80;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSDownloadManagerBookShim2 __book_filterDownloads:withResult:](self, "__book_filterDownloads:withResult:", a3, v8);

}

void __63__SSDownloadManagerBookShim2_restartDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__SSDownloadManagerBookShim2_restartDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E47BACE0;
    objc_copyWeak(&v11, &location);
    v10 = *(id *)(a1 + 40);
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerBookShim2;
    objc_msgSendSuper2(&v8, sel_restartDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __63__SSDownloadManagerBookShim2_restartDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__SSDownloadManagerBookShim2__pauseDownloads_forced_completionBlock___block_invoke;
  v10[3] = &unk_1E47BFFA8;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[SSDownloadManagerBookShim2 __book_filterDownloads:withResult:](self, "__book_filterDownloads:withResult:", a3, v10);

}

void __69__SSDownloadManagerBookShim2__pauseDownloads_forced_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__SSDownloadManagerBookShim2__pauseDownloads_forced_completionBlock___block_invoke_2;
    v10[3] = &unk_1E47BFF58;
    objc_copyWeak(&v13, &location);
    v12 = *(id *)(a1 + 40);
    v11 = v5;
    v9.receiver = v7;
    v9.super_class = (Class)SSDownloadManagerBookShim2;
    objc_msgSendSuper2(&v9, sel__pauseDownloads_forced_completionBlock_, v6, v8, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__book_pauseDownloads:completionBlock:", v5, *(_QWORD *)(a1 + 40));
  }

}

void __69__SSDownloadManagerBookShim2__pauseDownloads_forced_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), v5);
  else
    objc_msgSend(WeakRetained, "__book_pauseDownloads:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)__book_cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSBookDownloadQueue *downloadQueue;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(obj);
          downloadQueue = self->_downloadQueue;
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "downloadID", v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __69__SSDownloadManagerBookShim2___book_cancelDownloads_completionBlock___block_invoke;
          v17[3] = &unk_1E47BFFD0;
          v17[4] = self;
          v18 = v7;
          -[SSBookDownloadQueue cancelDownloadWithID:withCompletion:](downloadQueue, "cancelDownloadWithID:withCompletion:", v14, v17);

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v6 = v15;
  }
  else
  {
    -[SSDownloadManagerBookShim2 __book_dispatchBlock:withError:](self, "__book_dispatchBlock:withError:", v7, 0);
  }

}

uint64_t __69__SSDownloadManagerBookShim2___book_cancelDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), a2);
}

- (void)__book_pauseDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSBookDownloadQueue *downloadQueue;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(obj);
          downloadQueue = self->_downloadQueue;
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "downloadID", v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __68__SSDownloadManagerBookShim2___book_pauseDownloads_completionBlock___block_invoke;
          v17[3] = &unk_1E47BFFD0;
          v17[4] = self;
          v18 = v7;
          -[SSBookDownloadQueue pauseDownloadWithID:withCompletion:](downloadQueue, "pauseDownloadWithID:withCompletion:", v14, v17);

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v6 = v15;
  }
  else
  {
    -[SSDownloadManagerBookShim2 __book_dispatchBlock:withError:](self, "__book_dispatchBlock:withError:", v7, 0);
  }

}

uint64_t __68__SSDownloadManagerBookShim2___book_pauseDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), a2);
}

- (void)__book_resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSBookDownloadQueue *downloadQueue;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(obj);
          downloadQueue = self->_downloadQueue;
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "downloadID", v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __69__SSDownloadManagerBookShim2___book_resumeDownloads_completionBlock___block_invoke;
          v17[3] = &unk_1E47BFFD0;
          v17[4] = self;
          v18 = v7;
          -[SSBookDownloadQueue resumeDownloadWithID:withCompletion:](downloadQueue, "resumeDownloadWithID:withCompletion:", v14, v17);

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v6 = v15;
  }
  else
  {
    -[SSDownloadManagerBookShim2 __book_dispatchBlock:withError:](self, "__book_dispatchBlock:withError:", v7, 0);
  }

}

uint64_t __69__SSDownloadManagerBookShim2___book_resumeDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__book_dispatchBlock:withError:", *(_QWORD *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadQueue, 0);
}

@end
