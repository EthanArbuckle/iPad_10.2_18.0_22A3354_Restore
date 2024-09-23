@implementation WBSHistoryDatabaseAccessBroker

- (WBSHistoryDatabaseAccessBroker)init
{

  return 0;
}

- (WBSHistoryDatabaseAccessBroker)initWithHistoryDatabaseURL:(id)a3
{
  id v4;
  WBSHistoryDatabaseAccessBroker *v5;
  uint64_t v6;
  NSURL *historyDatabaseURL;
  dispatch_queue_t v8;
  OS_dispatch_queue *writeRequestQueue;
  WBSHistoryDatabaseAccessBroker *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryDatabaseAccessBroker;
  v5 = -[WBSHistoryDatabaseAccessBroker init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    historyDatabaseURL = v5->_historyDatabaseURL;
    v5->_historyDatabaseURL = (NSURL *)v6;

    v8 = dispatch_queue_create("com.apple.SafariShared.History", 0);
    writeRequestQueue = v5->_writeRequestQueue;
    v5->_writeRequestQueue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__WBSHistoryDatabaseAccessBroker_requestAccessType_onQueue_completionHandler___block_invoke;
  v10[3] = &unk_1E4B3B260;
  v11 = v8;
  v9 = v8;
  -[WBSHistoryDatabaseAccessBroker requestAccessType:onQueue:completionHandlerWithInvalidationHandler:](self, "requestAccessType:onQueue:completionHandlerWithInvalidationHandler:", a3, a4, v10);

}

void __78__WBSHistoryDatabaseAccessBroker_requestAccessType_onQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(_QWORD);
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8[2](v8);

}

- (void)requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandlerWithInvalidationHandler:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id flagsa;
  void *flags;

  flagsa = a4;
  v8 = a5;
  v9 = (uint64_t)flagsa;
  v10 = v8;
  if (!flagsa)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  flags = (void *)v9;
  if ((unint64_t)(a3 - 2) < 2)
  {
    -[WBSHistoryDatabaseAccessBroker _requestReadWriteAccessOnQueue:completionHandler:](self, "_requestReadWriteAccessOnQueue:completionHandler:", v9, v10);
  }
  else if ((unint64_t)a3 <= 1)
  {
    -[WBSHistoryDatabaseAccessBroker _requestReadOnlyAccessOnQueue:completionHandler:](self, "_requestReadOnlyAccessOnQueue:completionHandler:", v9, v10);
  }

}

- (void)_requestReadOnlyAccessOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WBSHistoryDatabaseAccessBroker__requestReadOnlyAccessOnQueue_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(v9, block);

}

uint64_t __82__WBSHistoryDatabaseAccessBroker__requestReadOnlyAccessOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestAccessType:onQueue:completionHandler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_requestReadWriteAccessOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *writeRequestQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSHistoryDatabaseAccessBroker *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  writeRequestQueue = self->_writeRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeRequestQueue, block);

}

void __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int8x16_t v3;
  _QWORD block[4];
  int8x16_t v5;
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B2B178;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  dispatch_sync(v2, block);

}

uint64_t __83__WBSHistoryDatabaseAccessBroker__requestReadWriteAccessOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestAccessType:onQueue:completionHandler:", 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_requestAccessType:(int64_t)a3 onQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v14 = 0;
  -[WBSHistoryDatabaseAccessBroker _openDatabaseWithAccessType:onQueue:error:](self, "_openDatabaseWithAccessType:onQueue:error:", a3, v8, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__WBSHistoryDatabaseAccessBroker__requestAccessType_onQueue_completionHandler___block_invoke;
    v12[3] = &unk_1E4B2A2C8;
    v13 = v10;
    (*((void (**)(id, id, _QWORD, _QWORD *))v9 + 2))(v9, v13, 0, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id, void *))v9 + 2))(v9, 0, v11, &__block_literal_global_59);
  }

}

uint64_t __79__WBSHistoryDatabaseAccessBroker__requestAccessType_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (id)_openDatabaseWithAccessType:(int64_t)a3 onQueue:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC0]), "initWithURL:queue:", self->_historyDatabaseURL, v8);
  if ((objc_msgSend(v9, "openWithAccessType:error:", a3, a5) & 1) != 0)
  {
    SafariShared::WBSSQLiteDatabaseFetch<>(v9, CFSTR("PRAGMA user_version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intAtIndex:", 0);

    objc_msgSend(v10, "statement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    if (v12 == 16)
    {
      v14 = v9;
    }
    else
    {
      if (a5)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2D50];
        v19[0] = CFSTR("History database does not have the correct schema version. Run Safari once to upgrade it.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v9, "close");
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)databaseLastModifiedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D89CC0], "writeAheadLogURLForDatabaseURL:", self->_historyDatabaseURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CB2A88];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[NSURL path](self->_historyDatabaseURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v12;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeRequestQueue, 0);
  objc_storeStrong((id *)&self->_historyDatabaseURL, 0);
}

@end
