@implementation VUIMediaEntitiesFetchControllerOperation

void __76__VUIMediaEntitiesFetchControllerOperation__startMediaLibraryFetchOperation__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (objc_msgSend(v2, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v2, "responses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleCompletdFetchWithResponses:error:", v3, v4);

  }
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setCurrentSubOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentSubOperation, a3);
}

- (VUIMediaEntitiesFetchControllerResult)result
{
  return self->_result;
}

- (NSArray)requests
{
  return self->_requests;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIMediaEntitiesFetchControllerOperation)initWithMediaLibrary:(id)a3 fetchReason:(int64_t)a4 requests:(id)a5
{
  id v9;
  id v10;
  VUIMediaEntitiesFetchControllerOperation *v11;
  VUIMediaEntitiesFetchControllerOperation *v12;
  uint64_t v13;
  NSArray *requests;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIMediaEntitiesFetchControllerOperation;
  v11 = -[VUIMediaEntitiesFetchControllerOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibrary, a3);
    v12->_fetchReason = a4;
    objc_msgSend(v10, "vui_deepCopy");
    v13 = objc_claimAutoreleasedReturnValue();
    requests = v12->_requests;
    v12->_requests = (NSArray *)v13;

  }
  return v12;
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (NSArray)currentFetchResponses
{
  return self->_currentFetchResponses;
}

- (void)_startMediaLibraryFetchOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  VUIMediaLibraryFetchMediaEntitiesOperation *v10;
  void *v11;
  void *v12;
  VUIMediaLibraryFetchMediaEntitiesOperation *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaEntitiesFetchControllerOperation mediaLibrary](self, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntitiesFetchControllerOperation mediaLibrary](self, "mediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaEntitiesFetchControllerOperation:: start fetch with media library id %@ # title %@", buf, 0x16u);

  }
  -[VUIMediaEntitiesFetchControllerOperation mediaLibrary](self, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIMediaEntitiesFetchControllerOperationDomain"), 0, 0);
    v13 = (VUIMediaLibraryFetchMediaEntitiesOperation *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntitiesFetchControllerOperation _handleCompletdFetchWithResponses:error:](self, "_handleCompletdFetchWithResponses:error:", 0, v13);
  }
  else
  {
    v10 = [VUIMediaLibraryFetchMediaEntitiesOperation alloc];
    -[VUIMediaEntitiesFetchControllerOperation mediaLibrary](self, "mediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntitiesFetchControllerOperation requests](self, "requests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUIMediaLibraryFetchMediaEntitiesOperation initWithMediaLibrary:requests:](v10, "initWithMediaLibrary:requests:", v11, v12);

    objc_initWeak((id *)buf, v13);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__VUIMediaEntitiesFetchControllerOperation__startMediaLibraryFetchOperation__block_invoke;
    v14[3] = &unk_1E9F9A8E8;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, (id *)buf);
    -[VUIMediaLibraryFetchMediaEntitiesOperation setCompletionBlock:](v13, "setCompletionBlock:", v14);
    -[VUIMediaEntitiesFetchControllerOperation setCurrentSubOperation:](self, "setCurrentSubOperation:", v13);
    -[VUIAsynchronousOperation start](v13, "start");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

- (id)_resultWithResponses:(id)a3
{
  id v4;
  VUIMediaEntitiesFetchControllerResult *v5;

  v4 = a3;
  v5 = -[VUIMediaEntitiesFetchControllerResult initWithFetchReason:fetchResponses:]([VUIMediaEntitiesFetchControllerResult alloc], "initWithFetchReason:fetchResponses:", -[VUIMediaEntitiesFetchControllerOperation fetchReason](self, "fetchReason"), v4);

  return v5;
}

- (void)_handleCompletdFetchWithResponses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[VUIMediaEntitiesFetchControllerOperation currentFetchResponses](self, "currentFetchResponses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[VUIMediaEntitiesFetchControllerOperation _startChangesOperationWithMediaEntityFetchResponses:currentFetchResponses:](self, "_startChangesOperationWithMediaEntityFetchResponses:currentFetchResponses:", v6, v8);
    }
    else
    {
      -[VUIMediaEntitiesFetchControllerOperation _resultWithResponses:](self, "_resultWithResponses:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntitiesFetchControllerOperation setResult:](self, "setResult:", v11);
      -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

    }
  }
  else
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIMediaEntitiesFetchControllerOperation requests](self, "requests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Media entity fetch failed with error (%@) for requests: %@", (uint8_t *)&v12, 0x16u);

    }
    -[VUIMediaEntitiesFetchControllerOperation setError:](self, "setError:", v7);
    -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMediaEntitiesFetchControllerOperation;
  -[VUIMediaEntitiesFetchControllerOperation cancel](&v4, sel_cancel);
  -[VUIMediaEntitiesFetchControllerOperation currentSubOperation](self, "currentSubOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)_startChangesOperationWithMediaEntityFetchResponses:(id)a3 currentFetchResponses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VUIMediaEntityFetchResponseChangesOperation *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  -[VUIMediaEntitiesFetchControllerOperation _resultWithResponses:](self, "_resultWithResponses:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VUIMediaEntityFetchResponseChangesOperation initWithLatestFetchResponses:currentFetchResponses:]([VUIMediaEntityFetchResponseChangesOperation alloc], "initWithLatestFetchResponses:currentFetchResponses:", v6, v7);
  objc_initWeak(&location, v9);
  objc_initWeak(&from, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __118__VUIMediaEntitiesFetchControllerOperation__startChangesOperationWithMediaEntityFetchResponses_currentFetchResponses___block_invoke;
  v11[3] = &unk_1E9F9C168;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  v10 = v8;
  v12 = v10;
  -[VUIMediaEntityFetchResponseChangesOperation setCompletionBlock:](v9, "setCompletionBlock:", v11);
  -[VUIMediaEntitiesFetchControllerOperation setCurrentSubOperation:](self, "setCurrentSubOperation:", v9);
  -[VUIAsynchronousOperation start](v9, "start");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __118__VUIMediaEntitiesFetchControllerOperation__startChangesOperationWithMediaEntityFetchResponses_currentFetchResponses___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2 && (objc_msgSend(v2, "isCancelled") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v2, "fetchResponseChanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFetchResponseChanges:", v4);

    objc_msgSend(WeakRetained, "setResult:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
  }

}

- (void)setFetchReason:(int64_t)a3
{
  self->_fetchReason = a3;
}

- (void)setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setCurrentFetchResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (NSOperation)currentSubOperation
{
  return self->_currentSubOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSubOperation, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_currentFetchResponses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
