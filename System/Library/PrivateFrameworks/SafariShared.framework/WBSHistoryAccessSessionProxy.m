@implementation WBSHistoryAccessSessionProxy

- (WBSHistoryAccessSessionProxy)init
{
  WBSHistoryAccessSessionProxy *v2;
  WBSHistoryConnectionProxy *v3;
  WBSHistoryConnectionProxy *historyConnectionProxy;
  dispatch_queue_t v5;
  OS_dispatch_queue *historyAccessSessionAccessQueue;
  WBSHistoryAccessSessionProxy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryAccessSessionProxy;
  v2 = -[WBSHistoryAccessSessionProxy init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSHistoryConnectionProxy);
    historyConnectionProxy = v2->_historyConnectionProxy;
    v2->_historyConnectionProxy = v3;

    v5 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryAccessSessionProxy", 0);
    historyAccessSessionAccessQueue = v2->_historyAccessSessionAccessQueue;
    v2->_historyAccessSessionAccessQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)getHistoryItemsVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__WBSHistoryAccessSessionProxy_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke;
  v14[3] = &unk_1E4B3AE70;
  v16 = v9;
  v17 = v10;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[WBSHistoryAccessSessionProxy _getHistoryAccessSessionWithCompletionHandler:](self, "_getHistoryAccessSessionWithCompletionHandler:", v14);

}

uint64_t __93__WBSHistoryAccessSessionProxy_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "getHistoryItemsVisitedAfterDate:beforeDate:completionHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)getHistoryVisitsAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__WBSHistoryAccessSessionProxy_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke;
  v14[3] = &unk_1E4B3AE70;
  v16 = v9;
  v17 = v10;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[WBSHistoryAccessSessionProxy _getHistoryAccessSessionWithCompletionHandler:](self, "_getHistoryAccessSessionWithCompletionHandler:", v14);

}

uint64_t __87__WBSHistoryAccessSessionProxy_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "getHistoryVisitsAfterDate:beforeDate:completionHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_getHistoryAccessSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *historyAccessSessionAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  historyAccessSessionAccessQueue = self->_historyAccessSessionAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(historyAccessSessionAccessQueue, v7);

}

void __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__18;
    v23 = __Block_byref_object_dispose__18;
    v24 = 0;
    v2 = dispatch_semaphore_create(0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke_3;
    v15 = &unk_1E4B3AE98;
    v16 = v3;
    v18 = &v19;
    v5 = v2;
    v17 = v5;
    objc_msgSend(v4, "beginHistoryAccessSession:", &v12);
    v6 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v12, v13, v14, v15, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryAccessSessionProxyErrorDomain"), 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v20[5];
      v20[5] = v10;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    _Block_object_dispose(&v19, 8);
  }
}

void __78__WBSHistoryAccessSessionProxy__getHistoryAccessSessionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyAccessSessionAccessQueue, 0);
  objc_storeStrong((id *)&self->_historyAccessSession, 0);
  objc_storeStrong((id *)&self->_historyConnectionProxy, 0);
}

@end
