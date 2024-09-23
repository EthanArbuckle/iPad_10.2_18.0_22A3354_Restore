@implementation QLMemoryCacheQueryOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_generatorRequest, 0);
}

- (void)setGeneratorRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

uint64_t __35__QLMemoryCacheQueryOperation_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "updateMode");
}

- (QLMemoryCacheQueryOperation)initWithThumbnailRequest:(id)a3 cacheThread:(id)a4
{
  id v7;
  id v8;
  QLMemoryCacheQueryOperation *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;

  v7 = a3;
  v8 = a4;
  v9 = -[QLMemoryCacheQueryOperation init](self, "init");
  if (v9)
  {
    v10 = dispatch_queue_create("quicklookd.memorycacheoperation", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_generatorRequest, a3);
    objc_storeStrong((id *)&v9->_cacheThread, a4);
  }

  return v9;
}

- (void)main
{
  NSObject *queue;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  _QLCacheThread *cacheThread;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  os_activity_scope_state_s state;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__QLMemoryCacheQueryOperation_main__block_invoke;
  block[3] = &unk_1E99D3098;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(queue, block);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend((id)v26[5], "activity");
  v5 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v5, &state);

  v6 = (void *)v26[5];
  if (v6)
  {
    v7 = objc_msgSend(v6, "cancelled");
    cacheThread = self->_cacheThread;
    if (v7)
    {
      -[_QLCacheThread _thumbnailHasBeenCancelled:](cacheThread, "_thumbnailHasBeenCancelled:", v26[5]);
    }
    else
    {
      -[_QLCacheThread memoryCache](cacheThread, "memoryCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "sendThumbnailDataForThumbnailRequest:withCacheThread:", v26[5], self->_cacheThread);

      if (v10)
      {
        v11 = MEMORY[0x1E0CD3398];
        v12 = *(void **)(MEMORY[0x1E0CD3398] + 16);
        if (!v12)
        {
          QLTInitLogging();
          v12 = *(void **)(v11 + 16);
        }
        v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)v26[5], "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fileIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v15;
          _os_log_impl(&dword_1D54AE000, v13, OS_LOG_TYPE_INFO, "Did find thumbnail in memory cache %@", buf, 0xCu);

        }
      }
      else
      {
        v16 = MEMORY[0x1E0CD3398];
        v17 = *(void **)(MEMORY[0x1E0CD3398] + 16);
        if (!v17)
        {
          QLTInitLogging();
          v17 = *(void **)(v16 + 16);
        }
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)v26[5], "request");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fileIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v20;
          _os_log_impl(&dword_1D54AE000, v18, OS_LOG_TYPE_INFO, "No thumbnail found in memory cache %@", buf, 0xCu);

        }
        -[_QLCacheThread _addThumbnailRequestIntoDiskCacheQueryQueue:](self->_cacheThread, "_addThumbnailRequestIntoDiskCacheQueryQueue:", v26[5]);
      }
    }
  }
  -[_QLCacheThread serverThread](self->_cacheThread, "serverThread");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __35__QLMemoryCacheQueryOperation_main__block_invoke_2;
  v22[3] = &unk_1E99D2B88;
  v22[4] = self;
  objc_msgSend(v21, "perform:", v22);

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v25, 8);

}

uint64_t __35__QLMemoryCacheQueryOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "generatorRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setGeneratorRequest:", 0);
}

- (QLTGeneratorThumbnailRequest)generatorRequest
{
  return (QLTGeneratorThumbnailRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)cancel
{
  NSObject *queue;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__QLMemoryCacheQueryOperation_cancel__block_invoke;
  block[3] = &unk_1E99D3098;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(queue, block);
  if (v15[5])
  {
    v5 = MEMORY[0x1E0CD3398];
    v6 = *(void **)(MEMORY[0x1E0CD3398] + 16);
    if (!v6)
    {
      QLTInitLogging();
      v6 = *(void **)(v5 + 16);
    }
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)v15[5], "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_1D54AE000, v7, OS_LOG_TYPE_INFO, "Memory cache request cancel, sending the thumbnail request to the disk cache (%@)", buf, 0xCu);

    }
    -[_QLCacheThread _dispatchThumbnailRequestInServerThread:](self->_cacheThread, "_dispatchThumbnailRequestInServerThread:", v15[5]);
  }
  v12.receiver = self;
  v12.super_class = (Class)QLMemoryCacheQueryOperation;
  -[QLMemoryCacheQueryOperation cancel](&v12, sel_cancel);
  -[_QLCacheThread serverThread](self->_cacheThread, "serverThread");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __37__QLMemoryCacheQueryOperation_cancel__block_invoke_3;
  v11[3] = &unk_1E99D2B88;
  v11[4] = self;
  objc_msgSend(v10, "perform:", v11);

  _Block_object_dispose(&v14, 8);
}

uint64_t __37__QLMemoryCacheQueryOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "generatorRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setGeneratorRequest:", 0);
}

uint64_t __37__QLMemoryCacheQueryOperation_cancel__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "updateMode");
}

@end
