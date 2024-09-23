@implementation VUIMediaLibraryFetchMediaEntitiesOperation

void __63__VUIMediaLibraryFetchMediaEntitiesOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    if (v8)
      objc_msgSend(v7, "setResponses:");
    else
      objc_msgSend(v7, "setError:", v5);
    objc_msgSend(v7, "finishExecutionIfPossible");
  }

}

- (void)setResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)responses
{
  return self->_responses;
}

- (NSArray)requests
{
  return self->_requests;
}

- (VUIMediaLibraryFetchMediaEntitiesOperation)initWithMediaLibrary:(id)a3 requests:(id)a4
{
  id v6;
  VUIMediaLibraryFetchMediaEntitiesOperation *v7;
  uint64_t v8;
  NSArray *requests;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaLibraryFetchMediaEntitiesOperation;
  v7 = -[VUIMediaLibraryOperation initWithMediaLibrary:](&v11, sel_initWithMediaLibrary_, a3);
  if (v7)
  {
    objc_msgSend(v6, "vui_deepCopy");
    v8 = objc_claimAutoreleasedReturnValue();
    requests = v7->_requests;
    v7->_requests = (NSArray *)v8;

  }
  return v7;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[VUIMediaLibraryOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryFetchMediaEntitiesOperation requests](self, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __63__VUIMediaLibraryFetchMediaEntitiesOperation_executionDidBegin__block_invoke;
  v9 = &unk_1E9F99F70;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "enqueueFetchRequests:completionHandler:", v4, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaLibraryOperation setAsyncWorkToken:](self, "setAsyncWorkToken:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (VUIMediaLibraryFetchMediaEntitiesOperation)initWithMediaLibrary:(id)a3
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

- (void)setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_responses, 0);
}

@end
