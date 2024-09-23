@implementation VUIMediaItemEntityTypesFetchController

- (VUIMediaItemEntityTypesFetchController)initWithMediaLibrary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMediaItemEntityTypesFetchController;
  return -[VUIMediaLibraryFetchController initWithMediaLibrary:](&v4, sel_initWithMediaLibrary_, a3);
}

- (void)cancelFetch
{
  objc_super v3;

  -[VUIMediaItemEntityTypesFetchController setResponse:](self, "setResponse:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaItemEntityTypesFetchController;
  -[VUIMediaLibraryFetchController cancelFetch](&v3, sel_cancelFetch);
}

- (id)_fetchOperationForFetchReason:(int64_t)a3
{
  VUIMediaItemEntityTypesFetchControllerOperation *v5;
  void *v6;
  VUIMediaItemEntityTypesFetchControllerOperation *v7;
  void *v8;

  v5 = [VUIMediaItemEntityTypesFetchControllerOperation alloc];
  -[VUIMediaLibraryFetchController mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMediaItemEntityTypesFetchControllerOperation initWithMediaLibrary:fetchReason:](v5, "initWithMediaLibrary:fetchReason:", v6, a3);

  if (a3 == 1)
  {
    -[VUIMediaItemEntityTypesFetchController response](self, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaItemEntityTypesFetchControllerOperation setCurrentFetchResponse:](v7, "setCurrentFetchResponse:", v8);

  }
  return v7;
}

- (void)_didCompleteFetchOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "result");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fetchReason");

  if (v6)
    -[VUIMediaItemEntityTypesFetchController _handleContentsChangeFetchControllerOperationDidCompleteWithResult:error:](self, "_handleContentsChangeFetchControllerOperationDidCompleteWithResult:error:", v7, v5);
  else
    -[VUIMediaItemEntityTypesFetchController _handleInitialFetchControllerOperationDidCompleteWithResult:error:](self, "_handleInitialFetchControllerOperationDidCompleteWithResult:error:", v7, v5);

}

- (void)_handleInitialFetchControllerOperationDidCompleteWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[VUIMediaItemEntityTypesFetchController _updateResponseWithResult:replaceContentsOnNilChanges:](self, "_updateResponseWithResult:replaceContentsOnNilChanges:", v6, 1);
    -[VUIMediaItemEntityTypesFetchController _notifyFetchDidCompleteWithResult:](self, "_notifyFetchDidCompleteWithResult:", v6);
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VUIMediaItemEntityTypesFetchController _handleInitialFetchControllerOperationDidCompleteWithResult:error:].cold.1((uint64_t)v7, v8);

    -[VUIMediaItemEntityTypesFetchController _notifyFetchDidFailWithError:](self, "_notifyFetchDidFailWithError:", v7);
  }

}

- (void)_handleContentsChangeFetchControllerOperationDidCompleteWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (-[VUIMediaItemEntityTypesFetchController _updateResponseWithResult:replaceContentsOnNilChanges:](self, "_updateResponseWithResult:replaceContentsOnNilChanges:", v6, 0))
    {
      -[VUIMediaItemEntityTypesFetchController _notifyFetchDidCompleteWithResult:](self, "_notifyFetchDidCompleteWithResult:", v6);
    }
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Contents change media category types fetch failed with error (%@)", (uint8_t *)&v9, 0xCu);
    }

    -[VUIMediaItemEntityTypesFetchController _notifyFetchDidFailWithError:](self, "_notifyFetchDidFailWithError:", v7);
  }

}

- (void)_notifyDelegateWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[VUIMediaItemEntityTypesFetchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryFetchController mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "completionDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__VUIMediaItemEntityTypesFetchController__notifyDelegateWithBlock___block_invoke;
  v11[3] = &unk_1E9F99420;
  v12 = v5;
  v13 = v4;
  v9 = v5;
  v10 = v4;
  dispatch_async(v8, v11);

}

uint64_t __67__VUIMediaItemEntityTypesFetchController__notifyDelegateWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_notifyFetchDidCompleteWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__VUIMediaItemEntityTypesFetchController__notifyFetchDidCompleteWithResult___block_invoke;
  v6[3] = &unk_1E9FA06F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VUIMediaItemEntityTypesFetchController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v6);

}

void __76__VUIMediaItemEntityTypesFetchController__notifyFetchDidCompleteWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "controller:fetchDidCompleteWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyFetchDidFailWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__VUIMediaItemEntityTypesFetchController__notifyFetchDidFailWithError___block_invoke;
  v6[3] = &unk_1E9FA06F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VUIMediaItemEntityTypesFetchController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v6);

}

void __71__VUIMediaItemEntityTypesFetchController__notifyFetchDidFailWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "controller:fetchDidFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_updateResponseWithResult:(id)a3 replaceContentsOnNilChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a4;
  v6 = a3;
  -[VUIMediaItemEntityTypesFetchController response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "fetchChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "_updateWithResponse:changes:replaceContentsOnNilChanges:", v8, v9, v4);

  }
  else
  {
    -[VUIMediaItemEntityTypesFetchController setResponse:](self, "setResponse:", v8);
    v10 = 1;
  }

  return v10;
}

- (VUIMediaItemEntityTypesFetchControllerDelegate)delegate
{
  return (VUIMediaItemEntityTypesFetchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIMediaItemEntityTypesFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleInitialFetchControllerOperationDidCompleteWithResult:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Initial media category types fetch failed with error (%@)", (uint8_t *)&v2, 0xCu);
}

@end
