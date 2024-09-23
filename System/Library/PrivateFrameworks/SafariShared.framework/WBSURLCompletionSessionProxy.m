@implementation WBSURLCompletionSessionProxy

- (WBSURLCompletionSessionProxy)init
{
  WBSURLCompletionSessionProxy *v2;
  WBSHistoryConnectionProxy *v3;
  WBSHistoryConnectionProxy *historyConnectionProxy;
  dispatch_queue_t v5;
  OS_dispatch_queue *completionSessionAccessQueue;
  WBSURLCompletionSessionProxy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSURLCompletionSessionProxy;
  v2 = -[WBSURLCompletionSessionProxy init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSHistoryConnectionProxy);
    historyConnectionProxy = v2->_historyConnectionProxy;
    v2->_historyConnectionProxy = v3;

    v5 = dispatch_queue_create("com.apple.SafariShared.WBSURLCompletionSessionProxy", 0);
    completionSessionAccessQueue = v2->_completionSessionAccessQueue;
    v2->_completionSessionAccessQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)_completionSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *completionSessionAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  completionSessionAccessQueue = self->_completionSessionAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(completionSessionAccessQueue, v7);

}

void __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__34;
    v22 = __Block_byref_object_dispose__34;
    v23 = 0;
    v2 = dispatch_semaphore_create(0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke_2;
    v14 = &unk_1E4B405C0;
    v15 = v3;
    v17 = &v18;
    v5 = v2;
    v16 = v5;
    objc_msgSend(v4, "beginURLCompletionSession:", &v11);
    v6 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      v24 = *MEMORY[0x1E0CB2D50];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1, v11, v12, v13, v14, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSURLCompletionSessionProxyErrorDomain"), 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v19[5];
      v19[5] = v9;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    _Block_object_dispose(&v18, 8);
  }
}

void __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  WBSURLCompletionSessionProxy *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  unint64_t v29;
  int64_t v30;
  _QWORD v31[5];
  WBSURLCompletionSessionProxy *v32;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__34;
  v31[4] = __Block_byref_object_dispose__34;
  v18 = self;
  v32 = v18;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke;
  v23[3] = &unk_1E4B40610;
  v19 = v17;
  v27 = v19;
  v20 = v14;
  v24 = v20;
  v21 = v15;
  v25 = v21;
  v29 = a5;
  v30 = a6;
  v22 = v16;
  v26 = v22;
  v28 = v31;
  -[WBSURLCompletionSessionProxy _completionSessionWithCompletionHandler:](v18, "_completionSessionWithCompletionHandler:", v23);

  _Block_object_dispose(v31, 8);
}

void __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v14 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_cold_1(v14, v6);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 80);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_9;
    v15[3] = &unk_1E4B405E8;
    v18 = v9;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    v16 = v12;
    v17 = v13;
    objc_msgSend(a2, "getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:limit:forQueryID:withSearchParameters:completionHandler:", v7, v8, v9, v10, v11, v15);

  }
}

void __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_9(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v7);
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v8);
  v11 = objc_msgSend(v10, "count");
  v12 = a1[6];
  if (v11 > v12)
    objc_msgSend(v10, "removeObjectsInRange:", v12, objc_msgSend(v10, "count") - a1[6]);
  (*(void (**)(void))(a1[4] + 16))();
  v13 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v17 = 134217984;
    v18 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_INFO, "Returning %zi matches", (uint8_t *)&v17, 0xCu);

  }
  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSessionAccessQueue, 0);
  objc_storeStrong((id *)&self->_completionSession, 0);
  objc_storeStrong((id *)&self->_historyConnectionProxy, 0);
}

void __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Failed to obtain a completion session: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
