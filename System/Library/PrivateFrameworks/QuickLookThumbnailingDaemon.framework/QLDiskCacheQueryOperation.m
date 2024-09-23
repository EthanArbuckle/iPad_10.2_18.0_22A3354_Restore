@implementation QLDiskCacheQueryOperation

uint64_t __33__QLDiskCacheQueryOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestBatch");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setThumbnailRequestBatch:", 0);
}

void __52__QLDiskCacheQueryOperation_appendThumbnailRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isReady"))
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestBatch");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      v4 = objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestCount");

      if (v4 <= 19)
      {
        objc_msgSend(*(id *)(a1 + 40), "request");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fileIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fileIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestBatch");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestBatch");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

          }
          -[NSObject addObject:](v9, "addObject:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 32), "setThumbnailRequestCount:", objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestCount") + 1);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          v11 = MEMORY[0x1E0CD3398];
          v12 = *(NSObject **)(MEMORY[0x1E0CD3398] + 16);
          if (!v12)
          {
            QLTInitLogging();
            v12 = *(NSObject **)(v11 + 16);
          }
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            goto LABEL_13;
          v13 = *(void **)(a1 + 40);
          v9 = v12;
          objc_msgSend(v13, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "could not get pathID for %@", (uint8_t *)&v15, 0xCu);

        }
LABEL_13:

      }
    }
  }
}

- (NSMutableDictionary)thumbnailRequestBatch
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (int64_t)thumbnailRequestCount
{
  return self->_thumbnailRequestCount;
}

- (void)setThumbnailRequestCount:(int64_t)a3
{
  self->_thumbnailRequestCount = a3;
}

void __33__QLDiskCacheQueryOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  os_activity_scope_state_s state;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cacheThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diskCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorForThumbnailRequests:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  objc_msgSend(v4, "nextThumbnailRequestWithThumbnailData:", &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;
  v8 = v6;
  if (v5)
  {
    v9 = MEMORY[0x1E0CD3398];
    *(_QWORD *)&v7 = 138412546;
    v24 = v7;
    do
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v5, "activity", v24);
      v10 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v10, &state);

      objc_msgSend(v5, "setDidCheckCache:", 1);
      if (objc_msgSend(v5, "cancelled"))
      {
        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_thumbnailHasBeenCancelled:", v5);
      }
      else if (v8)
      {
        v12 = *(void **)(v9 + 16);
        if (!v12)
        {
          QLTInitLogging();
          v12 = *(void **)(v9 + 16);
        }
        v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "request");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fileIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v28 = v14;
          v29 = 2112;
          v30 = v16;
          _os_log_impl(&dword_1D54AE000, v13, OS_LOG_TYPE_INFO, "Thumbnail found in disk cache for request:%@ fi: %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_sendThumbnailData:forThumbnailRequest:", v8, v5);
      }
      else
      {
        v17 = *(void **)(v9 + 16);
        if (!v17)
        {
          QLTInitLogging();
          v17 = *(void **)(v9 + 16);
        }
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "request");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "request");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fileIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v28 = v19;
          v29 = 2112;
          v30 = v21;
          _os_log_impl(&dword_1D54AE000, v18, OS_LOG_TYPE_INFO, "No thumbnail found in disk cache for request: %@ fi: %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_dispatchThumbnailRequestInServerThread:", v5);
      }

      os_activity_scope_leave(&state);
      v26 = v8;
      objc_msgSend(v4, "nextThumbnailRequestWithThumbnailData:", &v26);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v26;

      v8 = v23;
      v5 = (void *)v22;
    }
    while (v22);
  }
  else
  {
    v23 = v6;
  }

}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_getProperty(self, a2, 264, 1);
}

- (BOOL)appendThumbnailRequest:(id)a3
{
  id v4;
  QLDiskCacheQueryOperation *v5;
  NSObject *queue;
  char v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = self;
  objc_sync_enter(v5);
  queue = v5->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__QLDiskCacheQueryOperation_appendThumbnailRequest___block_invoke;
    block[3] = &unk_1E99D30C0;
    block[4] = v5;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(queue, block);

  }
  objc_sync_exit(v5);

  v7 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (QLDiskCacheQueryOperation)initWithCacheThread:(id)a3
{
  id v5;
  QLDiskCacheQueryOperation *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableDictionary *thumbnailRequestBatch;

  v5 = a3;
  v6 = -[QLDiskCacheQueryOperation init](self, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("quicklookd.memoreycacheoperation", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
    thumbnailRequestBatch = v6->_thumbnailRequestBatch;
    v6->_thumbnailRequestBatch = (NSMutableDictionary *)v9;

    v6->_thumbnailRequestCount = 0;
    objc_storeStrong((id *)&v6->_cacheThread, a3);
  }

  return v6;
}

- (void)dealloc
{
  QLDiskCacheQueryOperation *v2;
  OS_dispatch_queue *queue;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  v2->_queue = 0;

  objc_sync_exit(v2);
  v4.receiver = v2;
  v4.super_class = (Class)QLDiskCacheQueryOperation;
  -[QLDiskCacheQueryOperation dealloc](&v4, sel_dealloc);
}

- (void)main
{
  QLDiskCacheQueryOperation *v2;
  NSObject *queue;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[6];
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  v4 = MEMORY[0x1E0C809B0];
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__QLDiskCacheQueryOperation_main__block_invoke;
    block[3] = &unk_1E99D3098;
    block[4] = v2;
    block[5] = &v21;
    dispatch_sync(queue, block);
  }
  objc_sync_exit(v2);

  if (v22[5])
  {
    -[_QLCacheThread diskCache](v2->_cacheThread, "diskCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __33__QLDiskCacheQueryOperation_main__block_invoke_2;
    v19[3] = &unk_1E99D30E8;
    v19[4] = v2;
    v19[5] = &v21;
    v6 = objc_msgSend(v5, "doReading:", v19);

    if ((v6 & 1) == 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend((id)v22[5], "allValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
      if (v8)
      {
        v9 = 0;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          v12 = v9;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v11);

            -[_QLCacheThread _dispatchThumbnailRequestInServerThread:](v2->_cacheThread, "_dispatchThumbnailRequestInServerThread:", v9);
            ++v11;
            v12 = v9;
          }
          while (v8 != v11);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
        }
        while (v8);

      }
    }
  }
  -[_QLCacheThread serverThread](v2->_cacheThread, "serverThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __33__QLDiskCacheQueryOperation_main__block_invoke_25;
  v14[3] = &unk_1E99D2B88;
  v14[4] = v2;
  objc_msgSend(v13, "perform:", v14);

  _Block_object_dispose(&v21, 8);
}

- (void)setThumbnailRequestBatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

uint64_t __33__QLDiskCacheQueryOperation_main__block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "updateMode");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_thumbnailRequestBatch, 0);
}

- (void)cancel
{
  QLDiskCacheQueryOperation *v2;
  NSObject *queue;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _QWORD v19[5];
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__QLDiskCacheQueryOperation_cancel__block_invoke;
    block[3] = &unk_1E99D3098;
    block[4] = v2;
    block[5] = &v30;
    dispatch_sync(queue, block);
  }
  objc_sync_exit(v2);

  if (v31[5])
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    v25 = 0u;
    objc_msgSend((id)v31[5], "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v17)
    {
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v5 = v4;
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v38, 16);
          if (v6)
          {
            v7 = *(_QWORD *)v22;
            do
            {
              v8 = 0;
              do
              {
                if (*(_QWORD *)v22 != v7)
                  objc_enumerationMutation(v5);
                v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
                v10 = *(void **)(MEMORY[0x1E0CD3398] + 16);
                if (!v10)
                {
                  QLTInitLogging();
                  v10 = *(void **)(MEMORY[0x1E0CD3398] + 16);
                }
                v11 = v10;
                if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v9, "request");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "fileIdentifier");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v37 = v13;
                  _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Disk cache request cancel, sending the thumbnail request to the server thread (%@)", buf, 0xCu);

                }
                -[_QLCacheThread _dispatchThumbnailRequestInServerThread:](v2->_cacheThread, "_dispatchThumbnailRequestInServerThread:", v9);
                ++v8;
              }
              while (v6 != v8);
              v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v38, 16);
            }
            while (v6);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      }
      while (v17);
    }

  }
  v20.receiver = v2;
  v20.super_class = (Class)QLDiskCacheQueryOperation;
  -[QLDiskCacheQueryOperation cancel](&v20, sel_cancel, obj);
  -[_QLCacheThread serverThread](v2->_cacheThread, "serverThread");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35__QLDiskCacheQueryOperation_cancel__block_invoke_26;
  v19[3] = &unk_1E99D2B88;
  v19[4] = v2;
  objc_msgSend(v14, "perform:", v19);

  _Block_object_dispose(&v30, 8);
}

uint64_t __35__QLDiskCacheQueryOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestBatch");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setThumbnailRequestBatch:", 0);
}

uint64_t __35__QLDiskCacheQueryOperation_cancel__block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "updateMode");
}

- (void)setCacheThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

@end
