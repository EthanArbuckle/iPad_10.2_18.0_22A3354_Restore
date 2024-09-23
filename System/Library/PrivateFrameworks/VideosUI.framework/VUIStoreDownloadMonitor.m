@implementation VUIStoreDownloadMonitor

+ (void)initialize
{
  if (initialize_onceToken_2 != -1)
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_31);
}

void __37__VUIStoreDownloadMonitor_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIStoreDownloadMonitor");
  v1 = (void *)sLogObject_4;
  sLogObject_4 = (uint64_t)v0;

}

- (VUIStoreDownloadMonitor)initWithDownload:(id)a3 downloadManager:(id)a4
{
  id v7;
  id v8;
  VUIStoreDownloadMonitor *v9;
  VUIStoreDownloadMonitor *v10;
  NSMutableArray *v11;
  NSMutableArray *completionHandlers;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  TVPStateMachine *stateMachine;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VUIStoreDownloadMonitor;
  v9 = -[VUIStoreDownloadMonitor init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_download, a3);
    objc_storeStrong((id *)&v10->_downloadManager, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = v11;

    v13 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v14 = objc_opt_class();
    v15 = initWithDownload_downloadManager__instanceNumber++;
    v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@ %ld"), v14, v15);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v16, CFSTR("Idle"), 0);
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = (TVPStateMachine *)v17;

    -[TVPStateMachine setLogObject:](v10->_stateMachine, "setLogObject:", sLogObject_4);
    -[VUIStoreDownloadMonitor _registerStateMachineHandlers](v10, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v10->_stateMachine, "setShouldAcceptEvents:", 1);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VUIStoreDownloadMonitor;
  -[VUIStoreDownloadMonitor dealloc](&v3, sel_dealloc);
}

- (void)waitForDownloadToBecomePlayableWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = CFSTR("CompletionHandlerKey");
    v4 = (void *)objc_msgSend(a3, "copy");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[VUIStoreDownloadMonitor stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Wait for download to become playable"), 0, v5);

}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  TVPPerformBlockOnMainThreadIfNeeded();

}

void __67__VUIStoreDownloadMonitor_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
      objc_msgSend(*(id *)(a1 + 40), "download", (_QWORD)v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "vui_isEqualToDownload:", v8);

      if ((v9 & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      return;
    objc_msgSend(v10, "downloadPhaseIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v19 = CFSTR("DownloadPhaseKey");
      v20 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postEvent:withContext:userInfo:", CFSTR("Download phase did change"), 0, v13);

  }
  else
  {
LABEL_9:
    v10 = v2;
  }

}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  TVPPerformBlockOnMainThreadIfNeeded();
}

void __61__VUIStoreDownloadMonitor_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "downloadManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
      objc_msgSend(*(id *)(a1 + 32), "download");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "vui_isEqualToDownload:", v9);

      if ((v10 & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v8;

    if (v11)
      goto LABEL_20;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(*(id *)(a1 + 32), "download");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "downloadPhaseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Download has been removed.  Download's terminal phase is %@.", buf, 0xCu);
  }
  v15 = (void *)*MEMORY[0x1E0DAF8A8];
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF8A8]) & 1) == 0
    && (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF8A0]) & 1) == 0
    && (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF888]) & 1) == 0)
  {
    v16 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Since terminal state isn't failed or cancelled, swizzling terminal state to SSDownloadPhaseFinished", buf, 2u);
    }
    v17 = v15;

    v13 = v17;
  }
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("DownloadPhaseKey");
  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postEvent:withContext:userInfo:", CFSTR("Download phase did change"), 0, v19);

  v11 = 0;
LABEL_20:

}

- (void)_registerStateMachineHandlers
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  id location;
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke;
  aBlock[3] = &unk_1E9F9B870;
  objc_copyWeak(&v28, &location);
  v3 = _Block_copy(aBlock);
  v4 = objc_loadWeakRetained(&location);
  objc_msgSend(v4, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  v24[1] = 3221225472;
  v24[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3;
  v24[3] = &unk_1E9F9B898;
  objc_copyWeak(&v26, &location);
  v6 = v3;
  v25 = v6;
  objc_msgSend(v5, "registerHandlerForEvent:onState:withBlock:", CFSTR("Wait for download to become playable"), CFSTR("Idle"), v24);

  v7 = objc_loadWeakRetained(&location);
  objc_msgSend(v7, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v2;
  v22[1] = 3221225472;
  v22[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_30;
  v22[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v8, "registerHandlerForEvent:onState:withBlock:", CFSTR("Wait for download to become playable"), CFSTR("Waiting for download to become playable"), v22);

  v9 = objc_loadWeakRetained(&location);
  objc_msgSend(v9, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("Waiting for download to become playable");
  v30[1] = CFSTR("Waiting for download token");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v19[1] = 3221225472;
  v19[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2_31;
  v19[3] = &unk_1E9F9B898;
  objc_copyWeak(&v21, &location);
  v12 = v6;
  v20 = v12;
  objc_msgSend(v10, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Download phase did change"), v11, v19);

  v13 = objc_loadWeakRetained(&location);
  objc_msgSend(v13, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_34;
  v16[3] = &unk_1E9F9B898;
  objc_copyWeak(&v18, &location);
  v15 = v12;
  v17 = v15;
  objc_msgSend(v14, "registerHandlerForEvent:onState:withBlock:", CFSTR("Asset download token timer did fire"), CFSTR("Waiting for download token"), v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];

  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2;
  v10[3] = &unk_1E9F9B848;
  objc_copyWeak(v12, v6);
  v12[1] = a2;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v8, "executeBlockAfterCurrentStateTransition:", v10);

  objc_destroyWeak(v12);
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "downloadManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "removeObserver:", v4);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "completionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "completionHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

const __CFString *__56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  const __CFString *v34;
  NSObject *v35;
  id v36;
  void *v37;
  uint64_t v39;
  _QWORD v40[4];
  id v41;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("CompletionHandlerKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "completionHandlers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _Block_copy(v13);
    objc_msgSend(v15, "addObject:", v16);

  }
  v17 = (id *)(a1 + 40);
  v18 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v18, "download");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    v39 = a1;
    v22 = v13;
    v23 = v12;
    v24 = v11;
    v25 = v10;
    v26 = v9;
    v27 = v21;
    objc_msgSend(v21, "downloadManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v26;
    v10 = v25;
    v11 = v24;
    v12 = v23;
    v13 = v22;
    a1 = v39;

    if (v28)
    {
      v29 = objc_loadWeakRetained(v17);
      objc_msgSend(v29, "downloadManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_loadWeakRetained(v17);
      objc_msgSend(v30, "addObserver:", v31);

      v32 = objc_loadWeakRetained(v17);
      objc_msgSend(v32, "stateMachine");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_27;
      v40[3] = &unk_1E9F99C98;
      objc_copyWeak(&v41, v17);
      objc_msgSend(v33, "executeBlockAfterCurrentStateTransition:", v40);

      objc_destroyWeak(&v41);
      v34 = CFSTR("Waiting for download to become playable");
      goto LABEL_10;
    }
  }
  else
  {

  }
  v35 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_ERROR))
    __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3_cold_1(v35);
  v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v37 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123003, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v34 = CFSTR("Idle");
LABEL_10:

  return v34;
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_27(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "download");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadPhaseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v20 = CFSTR("DownloadPhaseKey");
    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Download phase did change"), 0, v5);

  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAF8C0]))
  {
    v8 = (void *)sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = objc_loadWeakRetained(v1);
      objc_msgSend(v10, "download");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Resuming download %@", buf, 0xCu);

    }
    v12 = objc_loadWeakRetained(v1);
    objc_msgSend(v12, "downloadManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained(v1);
    objc_msgSend(v14, "download");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resumeDownloads:completionBlock:", v16, 0);

  }
}

id __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_30(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("CompletionHandlerKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "completionHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _Block_copy(v8);
    objc_msgSend(v10, "addObject:", v11);

  }
  objc_msgSend(v7, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

const __CFString *__56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_2_31(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  char v29;
  NSObject *v30;
  dispatch_time_t v31;
  NSObject *v32;
  _QWORD block[4];
  id v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("DownloadPhaseKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = sLogObject_4;
  if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Download phase did change to %@", buf, 0xCu);
  }
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DAF888]) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DAF8A0]))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "download");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "failureError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v35 = *MEMORY[0x1E0CB3388];
      v36 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123002, v13);
    v16 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v15;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Download failed or cancelled: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_11:
    v17 = CFSTR("Idle");
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DAF8A8]))
  {
    v19 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Download is finished and ready to play from local URL", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DAF890]))
  {
    v20 = (id *)(a1 + 40);
    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v21, "download");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "assetsForType:", *MEMORY[0x1E0DAF7C8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "valueForProperty:", *MEMORY[0x1E0DAF7A0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && !objc_msgSend(v25, "isEqual:", &unk_1EA0B9298))
    {
      v32 = sLogObject_4;
      if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "Download token exists - download is ready to play", buf, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v17 = CFSTR("Idle");
    }
    else
    {
      v27 = sLogObject_4;
      if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "Download token does not yet exist even though phase is SSDownloadPhaseDownloading", buf, 2u);
      }
      objc_msgSend(v7, "currentState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("Waiting for download token");
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("Waiting for download token"));

      if ((v29 & 1) == 0)
      {
        v30 = sLogObject_4;
        if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "Waiting for download token", buf, 2u);
        }
        v31 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_33;
        block[3] = &unk_1E9F99C98;
        objc_copyWeak(&v34, v20);
        dispatch_after(v31, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v34);
        v17 = CFSTR("Waiting for download token");
      }
    }

  }
  else
  {
    v17 = CFSTR("Waiting for download to become playable");
  }
LABEL_12:

  return v17;
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "stateMachine");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postEvent:", CFSTR("Asset download token timer did fire"));

    WeakRetained = v3;
  }

}

const __CFString *__56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_34(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "download");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsForType:", *MEMORY[0x1E0DAF7C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0DAF7A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "isEqual:", &unk_1EA0B9298))
  {
    v11 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Download token exists after recheck - download is ready to play", (uint8_t *)&v13, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123002, 0);
    v10 = sLogObject_4;
    if (os_log_type_enabled((os_log_t)sLogObject_4, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Download token is still missing after recheck - failing with error %@", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  return CFSTR("Idle");
}

- (SSDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (SSDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
  objc_storeStrong((id *)&self->_download, a3);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

void __56__VUIStoreDownloadMonitor__registerStateMachineHandlers__block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Missing download or download manager", v1, 2u);
}

@end
