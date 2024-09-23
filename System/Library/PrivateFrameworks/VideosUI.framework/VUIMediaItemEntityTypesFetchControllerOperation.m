@implementation VUIMediaItemEntityTypesFetchControllerOperation

- (VUIMediaItemEntityTypesFetchControllerOperation)initWithMediaLibrary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VUIMediaItemEntityTypesFetchControllerOperation)initWithMediaLibrary:(id)a3 fetchReason:(int64_t)a4
{
  VUIMediaItemEntityTypesFetchControllerOperation *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMediaItemEntityTypesFetchControllerOperation;
  result = -[VUIMediaLibraryOperation initWithMediaLibrary:](&v6, sel_initWithMediaLibrary_, a3);
  if (result)
    result->_fetchReason = a4;
  return result;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[VUIMediaLibraryOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __68__VUIMediaItemEntityTypesFetchControllerOperation_executionDidBegin__block_invoke;
  v8 = &unk_1E9F9EEC8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "enqueueMediaItemEntityTypesFetchWithCompletionHandler:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaLibraryOperation setAsyncWorkToken:](self, "setAsyncWorkToken:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__VUIMediaItemEntityTypesFetchControllerOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VUIMediaItemEntityTypesFetchResponseChanges *v15;
  NSObject *v16;
  VUIMediaItemEntityTypesFetchControllerResult *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    if (v5)
    {
      objc_msgSend(v8, "currentFetchResponse");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "mediaItemEntityTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mediaItemEntityTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_changeSetFromMediaItemEntityTypes:toMediaItemEntityTypes:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[VUIMediaItemEntityTypesFetchResponseChanges initWithMediaItemEntityTypesChangeSet:localMediaItemsAvailableDidChange:]([VUIMediaItemEntityTypesFetchResponseChanges alloc], "initWithMediaItemEntityTypesChangeSet:localMediaItemsAvailableDidChange:", v14, objc_msgSend(v9, "areLocalMediaItemsAvailable") ^ objc_msgSend(v5, "areLocalMediaItemsAvailable"));

      }
      else
      {
        v15 = 0;
      }
      v17 = -[VUIMediaItemEntityTypesFetchControllerResult initWithFetchReason:fetchResponse:]([VUIMediaItemEntityTypesFetchControllerResult alloc], "initWithFetchReason:fetchResponse:", objc_msgSend(v8, "fetchReason"), v5);
      -[VUIMediaItemEntityTypesFetchControllerResult setFetchChanges:](v17, "setFetchChanges:", v15);
      objc_msgSend(v8, "setResult:", v17);

    }
    else
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Media item entity types fetch failed with error (%@)", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(v8, "setError:", v6);
    }
    objc_msgSend(v8, "finishExecutionIfPossible");
  }

}

+ (id)_changeSetFromMediaItemEntityTypes:(id)a3 toMediaItemEntityTypes:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0DC6998];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "changeSetFromObjects:toObjects:identifierBlock:isEqualBlock:", v7, v6, &__block_literal_global_80, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __109__VUIMediaItemEntityTypesFetchControllerOperation__changeSetFromMediaItemEntityTypes_toMediaItemEntityTypes___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (void)setFetchReason:(int64_t)a3
{
  self->_fetchReason = a3;
}

- (VUIMediaItemEntityTypesFetchResponse)currentFetchResponse
{
  return self->_currentFetchResponse;
}

- (void)setCurrentFetchResponse:(id)a3
{
  objc_storeStrong((id *)&self->_currentFetchResponse, a3);
}

- (VUIMediaItemEntityTypesFetchControllerResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_currentFetchResponse, 0);
}

@end
