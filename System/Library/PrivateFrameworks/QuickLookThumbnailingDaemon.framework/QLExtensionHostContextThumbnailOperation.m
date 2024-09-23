@implementation QLExtensionHostContextThumbnailOperation

- (QLExtensionHostContextThumbnailOperation)initWithAppex:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  QLExtensionHostContextThumbnailOperation *v13;
  NSXPCConnection *v14;
  NSXPCConnection *connection;
  uint64_t v16;
  QLFileThumbnailRequest *request;
  uint64_t v18;
  NSFileCoordinator *coordinator;
  NSObject *v20;
  dispatch_queue_t v21;
  QLExtensionHostContextThumbnailOperation *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)QLExtensionHostContextThumbnailOperation;
  v12 = -[QLExtensionHostContextThumbnailOperation init](&v24, sel_init);
  v13 = (QLExtensionHostContextThumbnailOperation *)v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 32, a3);
    objc_storeStrong(&v13->_completionHandler, a4);
    v14 = (NSXPCConnection *)_Block_copy(v11);
    connection = v13->_connection;
    v13->_connection = v14;

    *(_DWORD *)(&v13->super._executing + 3) = 0;
    v16 = objc_opt_new();
    request = v13->_request;
    v13->_request = (QLFileThumbnailRequest *)v16;

    v18 = objc_opt_new();
    coordinator = v13->_coordinator;
    v13->_coordinator = (NSFileCoordinator *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.quicklook.ExtensionHostContextThumbnailOperation", v20);

    -[NSFileCoordinator setUnderlyingQueue:](v13->_coordinator, "setUnderlyingQueue:", v21);
    v22 = v13;

  }
  return v13;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  dispatch_block_t v11;
  dispatch_time_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[4];
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (-[QLExtensionHostContextThumbnailOperation isCancelled](self, "isCancelled"))
  {
    -[QLExtensionHostContextThumbnailOperation finishWithReply:error:](self, "finishWithReply:error:", 0, 0);
  }
  else
  {
    objc_msgSend(self->_completionHandler, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAccessingIfNeeded");

    objc_msgSend(self->_completionHandler, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35F8];
      objc_msgSend(self->_completionHandler, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "readingIntentWithURL:options:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__QLExtensionHostContextThumbnailOperation_main__block_invoke;
      block[3] = &unk_1E99D2EB0;
      objc_copyWeak(&v23, &location);
      v11 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[QLExtensionHostContextThumbnailOperation setTimeoutBlock:](self, "setTimeoutBlock:", v11);

      v12 = dispatch_time(0, 20000000000);
      -[QLExtensionHostContextThumbnailOperation coordinationQueue](self, "coordinationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "underlyingQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      -[QLExtensionHostContextThumbnailOperation timeoutBlock](self, "timeoutBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_after(v12, v14, v15);

      -[QLExtensionHostContextThumbnailOperation coordinator](self, "coordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLExtensionHostContextThumbnailOperation coordinationQueue](self, "coordinationQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_7;
      v20[3] = &unk_1E99D2ED8;
      v20[4] = self;
      v19 = v9;
      v21 = v19;
      objc_msgSend(v16, "coordinateAccessWithIntents:queue:byAccessor:", v17, v18, v20);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
    else
    {
      -[QLExtensionHostContextThumbnailOperation generate](self, "generate");
    }
  }
}

void __48__QLExtensionHostContextThumbnailOperation_main__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;

  _log_4();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_cold_1(a1);

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLExtensionHostContextThumbnailOperation"), 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithReply:error:", 0, v7);

}

void __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeoutBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeoutBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v4);

  }
  v5 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v5, "finishWithReply:error:", 0, v10);
  }
  else
  {
    objc_msgSend(v5, "coordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retainAccess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFileAccess:", v7);

    objc_msgSend(*(id *)(a1 + 40), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "startAccessingSecurityScopedResource");

    if ((_DWORD)v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setAccessedURL:", v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "generate");
  }

}

- (void)generate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "Failed to acquire assertion : %@", (uint8_t *)&v2, 0xCu);
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  _log_4();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_2(a1);

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "appex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsConcurrentRequests");

  if ((v6 & 1) == 0)
  {
    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "process");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    _log_4();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_1(v3, v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("generation timing out"));
    v11 = objc_alloc(MEMORY[0x1E0D87E08]);
    v12 = (void *)MEMORY[0x1E0D87DA0];
    v13 = objc_loadWeakRetained(v3);
    objc_msgSend(v13, "process");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateMatchingIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithPredicate:context:", v15, v10);

    objc_msgSend(v16, "execute:", 0);
  }
  v17 = objc_loadWeakRetained(v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLExtensionHostContextThumbnailOperation"), 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishWithReply:error:", 0, v18);

}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "coordinationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_2;
  v7[3] = &unk_1E99D2CD0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithReply:error:", 0, *(_QWORD *)(a1 + 40));
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timeoutBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeoutBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "assertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  _log_4();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288);
    objc_msgSend(v5, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_INFO, "Thumbnail extension generated thumbnail for %@: reply = %@, error = %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithReply:error:", v5, v6);

}

- (void)finishWithReply:(id)a3 error:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(&self->super._executing + 3));
  connection = self->_connection;
  if (connection)
    ((void (*)(NSXPCConnection *, id, id))connection[2].super.isa)(connection, v8, v6);
  -[QLExtensionHostContextThumbnailOperation finish](self, "finish");
  os_unfair_lock_unlock((os_unfair_lock_t)(&self->super._executing + 3));

}

- (void)finish
{
  NSObject *v3;
  id completionHandler;
  NSURL *accessedURL;
  NSOperationQueue *coordinationQueue;
  NSFileCoordinationRetainedAccess *fileAccess;
  void *v8;
  NSURL *v9;
  NSXPCConnection *connection;
  _EXExtensionProcess *process;
  QLThumbnailExtension *appex;
  id timeoutBlock;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _log_4();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    completionHandler = self->_completionHandler;
    *(_DWORD *)buf = 138412290;
    v16 = completionHandler;
    _os_log_impl(&dword_1D54AE000, v3, OS_LOG_TYPE_INFO, "Operation did finish for %@", buf, 0xCu);
  }

  accessedURL = self->_accessedURL;
  if (accessedURL)
    dispatch_block_cancel(accessedURL);
  if (self->_coordinationQueue)
  {
    -[QLFileThumbnailRequest releaseAccess:](self->_request, "releaseAccess:");
    coordinationQueue = self->_coordinationQueue;
    self->_coordinationQueue = 0;

  }
  -[NSFileCoordinationRetainedAccess stopAccessingSecurityScopedResource](self->_fileAccess, "stopAccessingSecurityScopedResource");
  fileAccess = self->_fileAccess;
  self->_fileAccess = 0;

  objc_msgSend(self->_completionHandler, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cleanup");

  v9 = self->_accessedURL;
  self->_accessedURL = 0;

  connection = self->_connection;
  self->_connection = 0;

  -[_EXExtensionProcess invalidate](self->_process, "invalidate");
  process = self->_process;
  self->_process = 0;

  appex = self->_appex;
  self->_appex = 0;

  objc_msgSend(self->_timeoutBlock, "invalidate");
  timeoutBlock = self->_timeoutBlock;
  self->_timeoutBlock = 0;

  v14.receiver = self;
  v14.super_class = (Class)QLExtensionHostContextThumbnailOperation;
  -[QLAsynchronousOperation finish](&v14, sel_finish);
}

- (QLThumbnailExtension)appex
{
  return *(QLThumbnailExtension **)&self->_finishLock._os_unfair_lock_opaque;
}

- (void)setAppex:(id)a3
{
  objc_storeStrong((id *)&self->_finishLock, a3);
}

- (_EXExtensionProcess)process
{
  return (_EXExtensionProcess *)self->_appex;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_appex, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)self->_process;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (id)completionHandler
{
  return self->_connection;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (QLFileThumbnailRequest)request
{
  return (QLFileThumbnailRequest *)self->_completionHandler;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong(&self->_completionHandler, a3);
}

- (NSFileCoordinator)coordinator
{
  return (NSFileCoordinator *)self->_request;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSOperationQueue)coordinationQueue
{
  return (NSOperationQueue *)self->_coordinator;
}

- (void)setCoordinationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (NSFileCoordinationRetainedAccess)fileAccess
{
  return (NSFileCoordinationRetainedAccess *)self->_coordinationQueue;
}

- (void)setFileAccess:(id)a3
{
  objc_storeStrong((id *)&self->_coordinationQueue, a3);
}

- (NSURL)accessedURL
{
  return (NSURL *)self->_fileAccess;
}

- (void)setAccessedURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileAccess, a3);
}

- (id)timeoutBlock
{
  return self->_accessedURL;
}

- (void)setTimeoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (RBSAssertion)assertion
{
  return (RBSAssertion *)self->_timeoutBlock;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong(&self->_timeoutBlock, a3);
}

- (os_unfair_lock_s)finishLock
{
  return *(os_unfair_lock_s *)(&self->super._executing + 3);
}

- (void)setFinishLock:(os_unfair_lock_s)a3
{
  *(os_unfair_lock_s *)(&self->super._executing + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_accessedURL, 0);
  objc_storeStrong((id *)&self->_fileAccess, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_appex, 0);
  objc_storeStrong((id *)&self->_finishLock, 0);
}

void __48__QLExtensionHostContextThumbnailOperation_main__block_invoke_cold_1(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(v1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1D54AE000, v4, v5, "Coordination for %@ took more than %d seconds to reply", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_1(id *a1, NSObject *a2)
{
  id WeakRetained;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "process");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109120;
  v5[1] = objc_msgSend(v4, "rbs_pid");
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "Invalidating process (pid: %d) due to timing out", (uint8_t *)v5, 8u);

}

void __52__QLExtensionHostContextThumbnailOperation_generate__block_invoke_cold_2(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(v1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1D54AE000, v3, v4, "Generation for %@ took more than %d seconds to reply", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
