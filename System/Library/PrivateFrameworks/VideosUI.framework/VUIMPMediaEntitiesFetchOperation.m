@implementation VUIMPMediaEntitiesFetchOperation

void __53__VUIMPMediaEntitiesFetchOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(WeakRetained, "requests", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "response");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {

            v3 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v3, "addObject:", v12);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

    objc_msgSend(WeakRetained, "setResponses:", v3);
    objc_msgSend(WeakRetained, "setError:", v13);
    objc_msgSend(WeakRetained, "finishExecutionIfPossible");

  }
}

- (void)setResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)responses
{
  return self->_responses;
}

- (NSArray)requests
{
  return self->_requests;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (VUIMPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIMPMediaEntitiesFetchOperation)initWithMediaLibrary:(id)a3 requests:(id)a4
{
  id v7;
  id v8;
  void *v9;
  VUIMPMediaEntitiesFetchOperation *v10;
  uint64_t v11;
  NSArray *requests;
  NSOperationQueue *v13;
  NSOperationQueue *privateQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requests"));
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)VUIMPMediaEntitiesFetchOperation;
  v10 = -[VUIMPMediaEntitiesFetchOperation init](&v16, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "vui_deepCopy");
    v11 = objc_claimAutoreleasedReturnValue();
    requests = v10->_requests;
    v10->_requests = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_mediaLibrary, a3);
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v10->_privateQueue;
    v10->_privateQueue = v13;

  }
  return v10;
}

- (void)executionDidBegin
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  VUIMPMediaEntitiesSingleFetchOperation *v12;
  void *v13;
  VUIMPMediaEntitiesSingleFetchOperation *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0CB34C8];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__VUIMPMediaEntitiesFetchOperation_executionDidBegin__block_invoke;
  v22[3] = &unk_1E9F9A938;
  objc_copyWeak(&v24, &location);
  v5 = v3;
  v23 = v5;
  objc_msgSend(v4, "blockOperationWithBlock:", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[VUIMPMediaEntitiesFetchOperation requests](self, "requests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = [VUIMPMediaEntitiesSingleFetchOperation alloc];
        -[VUIMPMediaEntitiesFetchOperation mediaLibrary](self, "mediaLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[VUIMPMediaEntitiesSingleFetchOperation initWithMediaLibrary:request:](v12, "initWithMediaLibrary:request:", v13, v11);

        objc_msgSend(v11, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, v15);

        objc_msgSend(v6, "addDependency:", v14);
        -[VUIMPMediaEntitiesFetchOperation privateQueue](self, "privateQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addOperation:", v14);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }

  -[VUIMPMediaEntitiesFetchOperation privateQueue](self, "privateQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v6);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (NSError)error
{
  return self->_error;
}

- (VUIMPMediaEntitiesFetchOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
