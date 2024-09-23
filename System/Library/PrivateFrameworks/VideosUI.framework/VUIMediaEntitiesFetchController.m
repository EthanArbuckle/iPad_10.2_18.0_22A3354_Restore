@implementation VUIMediaEntitiesFetchController

void __78__VUIMediaEntitiesFetchController__notifyFetchRequests_didCompleteWithResult___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "controller:fetchRequests:didCompleteWithResult:", a1[4], a1[5], a1[6]);

}

uint64_t __60__VUIMediaEntitiesFetchController__notifyDelegateWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)responses
{
  return self->_responses;
}

- (NSArray)requests
{
  return self->_requests;
}

- (VUIMediaEntitiesFetchController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4
{
  id v6;
  VUIMediaEntitiesFetchController *v7;
  uint64_t v8;
  NSArray *requests;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaEntitiesFetchController;
  v7 = -[VUIMediaLibraryFetchController initWithMediaLibrary:](&v11, sel_initWithMediaLibrary_, a3);
  if (v7)
  {
    objc_msgSend(v6, "vui_deepCopy");
    v8 = objc_claimAutoreleasedReturnValue();
    requests = v7->_requests;
    v7->_requests = (NSArray *)v8;

  }
  return v7;
}

- (VUIMediaEntitiesFetchControllerDelegate)delegate
{
  return (VUIMediaEntitiesFetchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_updateResponseWithResult:(id)a3 replaceContentsOnNilChanges:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[VUIMediaEntitiesFetchController responses](self, "responses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__VUIMediaEntitiesFetchController__updateResponseWithResult_replaceContentsOnNilChanges___block_invoke;
    v11[3] = &unk_1E9F9F238;
    v14 = a4;
    v12 = v6;
    v13 = &v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
    v8 = v12;
  }
  else
  {
    objc_msgSend(v6, "fetchResponses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntitiesFetchController setResponses:](self, "setResponses:", v8);
    *((_BYTE *)v16 + 24) = 1;
  }

  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)_notifyFetchRequests:(id)a3 didCompleteWithResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__VUIMediaEntitiesFetchController__notifyFetchRequests_didCompleteWithResult___block_invoke;
  v10[3] = &unk_1E9F9F260;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VUIMediaEntitiesFetchController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v10);

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
  -[VUIMediaEntitiesFetchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryFetchController mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "completionDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__VUIMediaEntitiesFetchController__notifyDelegateWithBlock___block_invoke;
  v11[3] = &unk_1E9F99420;
  v12 = v5;
  v13 = v4;
  v9 = v5;
  v10 = v4;
  dispatch_async(v8, v11);

}

- (void)_handleManualFetchControllerOperationDidComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VUIMediaEntitiesFetchController _updateResponseWithResult:replaceContentsOnNilChanges:](self, "_updateResponseWithResult:replaceContentsOnNilChanges:", v6, 1);
    -[VUIMediaEntitiesFetchController _notifyFetchRequests:didCompleteWithResult:](self, "_notifyFetchRequests:didCompleteWithResult:", v5, v6);
  }
  else
  {
    objc_msgSend(v4, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VUIMediaEntitiesFetchController _handleManualFetchControllerOperationDidComplete:].cold.1((uint64_t)v7, (uint64_t)v5, v8);

    -[VUIMediaEntitiesFetchController _notifyFetchRequests:didFailWithError:](self, "_notifyFetchRequests:didFailWithError:", v5, v7);
  }

}

- (id)_fetchOperationForFetchReason:(int64_t)a3
{
  VUIMediaEntitiesFetchControllerOperation *v5;
  void *v6;
  void *v7;
  VUIMediaEntitiesFetchControllerOperation *v8;
  void *v9;

  v5 = [VUIMediaEntitiesFetchControllerOperation alloc];
  -[VUIMediaLibraryFetchController mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntitiesFetchController requests](self, "requests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIMediaEntitiesFetchControllerOperation initWithMediaLibrary:fetchReason:requests:](v5, "initWithMediaLibrary:fetchReason:requests:", v6, a3, v7);

  if (a3 == 1)
  {
    -[VUIMediaEntitiesFetchController responses](self, "responses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntitiesFetchControllerOperation setCurrentFetchResponses:](v8, "setCurrentFetchResponses:", v9);

  }
  return v8;
}

- (void)_didCompleteFetchOperation:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "fetchReason"))
    -[VUIMediaEntitiesFetchController _handleContentsChangeFetchControllerOperationDidComplete:](self, "_handleContentsChangeFetchControllerOperationDidComplete:", v4);
  else
    -[VUIMediaEntitiesFetchController _handleManualFetchControllerOperationDidComplete:](self, "_handleManualFetchControllerOperationDidComplete:", v4);

}

- (VUIMediaEntitiesFetchController)initWithMediaLibrary:(id)a3
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

- (void)cancelFetch
{
  objc_super v3;

  -[VUIMediaEntitiesFetchController setResponses:](self, "setResponses:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaEntitiesFetchController;
  -[VUIMediaLibraryFetchController cancelFetch](&v3, sel_cancelFetch);
}

- (void)_handleContentsChangeFetchControllerOperationDidComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (-[VUIMediaEntitiesFetchController _updateResponseWithResult:replaceContentsOnNilChanges:](self, "_updateResponseWithResult:replaceContentsOnNilChanges:", v6, 0))
    {
      -[VUIMediaEntitiesFetchController _notifyFetchRequests:didCompleteWithResult:](self, "_notifyFetchRequests:didCompleteWithResult:", v5, v6);
    }
  }
  else
  {
    objc_msgSend(v4, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Contents change media entity fetch failed with error (%@) for requests: %@", (uint8_t *)&v9, 0x16u);
    }

    -[VUIMediaEntitiesFetchController _notifyFetchRequests:didFailWithError:](self, "_notifyFetchRequests:didFailWithError:", v5, v7);
  }

}

void __89__VUIMediaEntitiesFetchController__updateResponseWithResult_replaceContentsOnNilChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fetchResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "fetchResponseChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "hasDataForCheckHasItemsOption");
  if ((_DWORD)v7 != objc_msgSend(v6, "hasDataForCheckHasItemsOption")
    || objc_msgSend(v9, "_updateWithResponse:changes:replaceContentsOnNilChanges:", v6, v8, *(unsigned __int8 *)(a1 + 48)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)_notifyFetchRequests:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__VUIMediaEntitiesFetchController__notifyFetchRequests_didFailWithError___block_invoke;
  v10[3] = &unk_1E9F9F260;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VUIMediaEntitiesFetchController _notifyDelegateWithBlock:](self, "_notifyDelegateWithBlock:", v10);

}

void __73__VUIMediaEntitiesFetchController__notifyFetchRequests_didFailWithError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "controller:fetchRequests:didFailWithError:", a1[4], a1[5], a1[6]);

}

- (void)setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (VUIMediaEntityFetchResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleManualFetchControllerOperationDidComplete:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Manual media entity fetch failed with error (%@) for requests: %@", (uint8_t *)&v3, 0x16u);
}

@end
