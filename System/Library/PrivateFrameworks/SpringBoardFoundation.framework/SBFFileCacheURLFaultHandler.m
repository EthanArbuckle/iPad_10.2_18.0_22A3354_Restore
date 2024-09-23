@implementation SBFFileCacheURLFaultHandler

- (SBFFileCacheURLFaultHandler)init
{
  SBFFileCacheURLFaultHandler *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURLSession *urlSession;
  NSArray *retryIntervals;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFFileCacheURLFaultHandler;
  v2 = -[SBFFileCacheURLFaultHandler init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionWithConfiguration:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v5;

    retryIntervals = v2->_retryIntervals;
    v2->_retryIntervals = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v2;
}

- (void)fileCache:(id)a3 loadFileForIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[SBFFileCacheURLFaultHandler retryIntervals](self, "retryIntervals");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFFileCacheURLFaultHandler urlSession](self, "urlSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFFileCacheURLFaultHandler attemptLoadFromURL:session:retryIntervalEnumerator:completionHandler:](self, "attemptLoadFromURL:session:retryIntervalEnumerator:completionHandler:", v8, v10, v9, v7);

}

- (void)attemptLoadFromURL:(id)a3 session:(id)a4 retryIntervalEnumerator:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SBFFileCacheURLFaultHandler *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke;
  v18[3] = &unk_1E200EC08;
  v22 = v11;
  v23 = v13;
  v19 = v12;
  v20 = self;
  v21 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  v17 = v13;
  -[SBFFileCacheURLFaultHandler performLoadFromURL:session:completionHandler:](self, "performLoadFromURL:session:completionHandler:", v15, v14, v18);

}

void __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      dispatch_get_global_queue(21, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke_2;
      block[3] = &unk_1E200EBE0;
      v11 = *(void **)(a1 + 48);
      block[4] = *(_QWORD *)(a1 + 40);
      v13 = v11;
      v14 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 64);
      dispatch_after(v9, v10, block);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

uint64_t __100__SBFFileCacheURLFaultHandler_attemptLoadFromURL_session_retryIntervalEnumerator_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attemptLoadFromURL:session:retryIntervalEnumerator:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)performLoadFromURL:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __76__SBFFileCacheURLFaultHandler_performLoadFromURL_session_completionHandler___block_invoke;
  v15 = &unk_1E200EC30;
  v16 = v7;
  v17 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a4, "dataTaskWithURL:completionHandler:", v10, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume", v12, v13, v14, v15);

}

void __76__SBFFileCacheURLFaultHandler_performLoadFromURL_session_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3650];
    v7 = a2;
    a2 = (void *)objc_msgSend([v6 alloc], "initRegularFileWithContents:", v7);

    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "setFilename:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSArray)retryIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRetryIntervals:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_retryIntervals, 0);
}

@end
