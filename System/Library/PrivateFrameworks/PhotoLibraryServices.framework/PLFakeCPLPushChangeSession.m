@implementation PLFakeCPLPushChangeSession

- (id)forwardingTargetForSelector:(SEL)a3
{
  fileTTRForUnimplementedSelector(a3);
  return 0;
}

- (PLFakeCPLPushChangeSession)initWithLibraryManager:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  PLFakeCPLPushChangeSession *v8;
  PLFakeCPLPushChangeSession *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLFakeCPLPushChangeSession;
  v8 = -[PLFakeCPLPushChangeSession init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_libraryManager, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (void)commitChangeBatch:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *queue;
  id v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PLFakeCPLPushChangeSession *v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v18 = v7;
  v10 = v7;
  dispatch_async(queue, block);
  v11 = dispatch_time(0, 1000000000);
  v12 = self->_queue;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke_2;
  v14[3] = &unk_1E3677C18;
  v15 = v6;
  v16 = self;
  v13 = v6;
  dispatch_after(v11, v12, v14);

}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v12 = v4;
  v7 = v4;
  dispatch_async(queue, block);
  v8 = dispatch_time(0, 3000000000);
  v9 = self->_queue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E3677AA0;
  v10[4] = self;
  dispatch_after(v8, v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

uint64_t __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__PLFakeCPLPushChangeSession_finalizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "fakeBaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("resetevents.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "fileExistsAtPath:", v26);

  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("pending"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if (v10)
      {
        v11 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("pending"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("endDate"));

        v13 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v13, "removeLastObject");
        objc_msgSend(v13, "addObject:", v11);
        objc_msgSend(v13, "writeToFile:atomically:", v26, 1);
        v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v14, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v15, "libraryManagerHasChangesToPull:", v16);

      }
    }

  }
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v17, "syncStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "initialSyncDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v21, "syncStatus");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInitialSyncDate:", v20);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v24, "syncStatus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLastSuccessfulSyncDate:", v23);

}

void __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v1 + 16))(v1, 0, 0, v2);

}

void __66__PLFakeCPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v20 = v2;
        v3 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v2);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v3, "resources");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v22;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v22 != v7)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
              v10 = objc_alloc(MEMORY[0x1E0D11450]);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "UUIDString");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)objc_msgSend(v10, "initWithResource:taskIdentifier:", v9, v12);

              WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
              objc_msgSend(WeakRetained, "resourceProgressDelegate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
              objc_msgSend(v15, "libraryManager:uploadDidFinishForResourceTransferTask:withError:", v16, v13, 0);

              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v6);
        }

        v2 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  fileTTRForUnimplementedSelector(a3);
  return 0;
}

@end
