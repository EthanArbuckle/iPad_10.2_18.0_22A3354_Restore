@implementation RCNetworkOperationURLSessionDelegate

- (RCNetworkOperationURLSessionDelegate)initWithSessionIdentifier:(id)a3
{
  id v5;
  RCNetworkOperationURLSessionDelegate *v6;
  RCNetworkOperationURLSessionDelegate *v7;
  uint64_t v8;
  NSMutableDictionary *runningTasks;
  uint64_t v10;
  NSPointerArray *sessionDidFinishObservers;
  RCUnfairLock *v12;
  RCUnfairLock *taskLock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCNetworkOperationURLSessionDelegate;
  v6 = -[RCNetworkOperationURLSessionDelegate init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    runningTasks = v7->_runningTasks;
    v7->_runningTasks = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v10 = objc_claimAutoreleasedReturnValue();
    sessionDidFinishObservers = v7->_sessionDidFinishObservers;
    v7->_sessionDidFinishObservers = (NSPointerArray *)v10;

    v12 = -[RCUnfairLock initWithOptions:]([RCUnfairLock alloc], "initWithOptions:", 1);
    taskLock = v7->_taskLock;
    v7->_taskLock = v12;

  }
  return v7;
}

- (void)addObserver:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RCNetworkOperationURLSessionDelegate sessionDidFinishObservers](self, "sessionDidFinishObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rc_containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[RCNetworkOperationURLSessionDelegate sessionDidFinishObservers](self, "sessionDidFinishObservers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addPointer:", v7);

  }
}

- (void)observeCompletionOfTaskWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[RCNetworkOperationURLSessionDelegate _networkTaskForIdentifier:](self, "_networkTaskForIdentifier:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  objc_msgSend(v9, "setCompletionHandler:", v6);
  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RCSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v6, "rc_logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      v36 = 2114;
      v37 = v7;
      _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_ERROR, "URL Session %{public}@ became invalid with error: %{public}@", buf, 0x16u);

    }
    v11 = v7;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v6, "rc_logIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v12;
      _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_ERROR, "Network operation %{public}@ became invalid with unknown error", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "rc_unknownBackgroundNetworkOperationError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v11;
  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lock");

  -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v23, "completionHandler", (_QWORD)v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v23, "completionHandler");
          v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, _QWORD, void *))v25)[2](v25, 0, 0, v13);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lock");

  -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeAllObjects");

  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unlock");

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v44[6];
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[RCNetworkOperationURLSessionDelegate _existingNetworkTaskForURLSessionTask:](self, "_existingNetworkTaskForURLSessionTask:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __77__RCNetworkOperationURLSessionDelegate_URLSession_task_didCompleteWithError___block_invoke;
    v44[3] = &unk_1E470DE50;
    v44[4] = v7;
    v44[5] = self;
    __77__RCNetworkOperationURLSessionDelegate_URLSession_task_didCompleteWithError___block_invoke((uint64_t)v44);
    goto LABEL_26;
  }
  -[RCNetworkOperationURLSessionDelegate _existingNetworkTaskForURLSessionTask:](self, "_existingNetworkTaskForURLSessionTask:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend(v7, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  RCDynamicCast(v11, (uint64_t)v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "receiveHTTPResponse:", v13);
  if (v8)
  {
    RCSharedLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "rc_logIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v15;
      v49 = 2114;
      v50 = (uint64_t)v8;
      _os_log_impl(&dword_1A1FB5000, v14, OS_LOG_TYPE_ERROR, "Network operation %{public}@ failed with error: %{public}@)", buf, 0x16u);

    }
    objc_msgSend(v10, "completionHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_21;
    objc_msgSend(v10, "completionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v17)[2](v17, v18, v19, v8);
  }
  else if (v13 && objc_msgSend(v13, "isFailure"))
  {
    RCSharedLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "rc_logIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v21;
      v49 = 2050;
      v50 = objc_msgSend(v13, "statusCode");
      _os_log_impl(&dword_1A1FB5000, v20, OS_LOG_TYPE_ERROR, "Network operation %{public}@ failed with HTTP status code: %{public}ld", buf, 0x16u);

    }
    objc_msgSend(v10, "completionHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_21;
    v45[0] = CFSTR("RCErrorHTTPURL");
    objc_msgSend(v13, "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    v45[1] = CFSTR("RCErrorHTTPRequestUUID");
    objc_msgSend(v7, "taskDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v24;
    v45[2] = CFSTR("RCErrorHTTPStatusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "statusCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v13, "allHeaderFields");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v13, "allHeaderFields");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("RCErrorHTTPResponseHeaders"));

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL session task failed with status code %lu"), objc_msgSend(v13, "statusCode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "rc_errorWithCode:description:additionalUserInfo:", 3, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completionHandler");
    v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v43)[2](v43, v29, v30, v19);

  }
  else
  {
    RCSharedLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "rc_logIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v32;
      _os_log_impl(&dword_1A1FB5000, v31, OS_LOG_TYPE_DEFAULT, "Network operation %{public}@ did succeed", buf, 0xCu);

    }
    objc_msgSend(v10, "completionHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_21;
    objc_msgSend(v10, "completionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD))v17)[2](v17, v18, v19, 0);
  }

LABEL_21:
  objc_msgSend(v10, "completionHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lock");

    -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, v37);

    -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
    v38 = objc_claimAutoreleasedReturnValue();
    -[NSObject unlock](v38, "unlock");
  }
  else
  {
    RCSharedLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "rc_logIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "allKeys");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v39;
      v49 = 2114;
      v50 = (uint64_t)v41;
      _os_log_impl(&dword_1A1FB5000, v38, OS_LOG_TYPE_DEFAULT, "Network operation task %{public}@ has no completion handler. Tasks: %{public}@", buf, 0x16u);

    }
  }

LABEL_26:
}

void __77__RCNetworkOperationURLSessionDelegate_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  RCSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "rc_logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "runningTasks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1A1FB5000, v2, OS_LOG_TYPE_ERROR, "Network operation request: @%{public}@ failed to find existing task. Tasks: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  RCSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "rc_logIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEBUG, "Network operation %{public}@ did finish collecting metrics: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "taskDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "taskDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    RCSharedLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "rc_logIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2048;
      v20 = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1A1FB5000, v11, OS_LOG_TYPE_DEFAULT, "Network operation with request %{public}@ received data (%lu bytes)", buf, 0x16u);

    }
    -[RCNetworkOperationURLSessionDelegate _networkTaskForIdentifier:](self, "_networkTaskForIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lock");

    objc_msgSend(v13, "receiveData:", v8);
    -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlock");

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__RCNetworkOperationURLSessionDelegate_URLSession_dataTask_didReceiveData___block_invoke;
    v16[3] = &unk_1E470DFF0;
    v16[4] = v7;
    __75__RCNetworkOperationURLSessionDelegate_URLSession_dataTask_didReceiveData___block_invoke((uint64_t)v16);
  }

}

void __75__RCNetworkOperationURLSessionDelegate_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  RCSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "rc_logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A1FB5000, v2, OS_LOG_TYPE_ERROR, "Error: Missing task identifier for request %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 0, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  RCSharedLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "rc_logIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "length");
    objc_msgSend(v8, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v12;
    v24 = 2048;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1A1FB5000, v11, OS_LOG_TYPE_DEFAULT, "Network operation with request %{public}@ finished downloading data (%lu bytes) to location %{public}@", buf, 0x20u);

  }
  objc_msgSend(v7, "taskDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "taskDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      RCSharedLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v7, "rc_logIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2114;
      v25 = (uint64_t)v10;
      _os_log_impl(&dword_1A1FB5000, v17, OS_LOG_TYPE_ERROR, "Network operation download %{public}@ failed with error: %{public}@", buf, 0x16u);
    }
    else
    {
      -[RCNetworkOperationURLSessionDelegate _networkTaskForIdentifier:](self, "_networkTaskForIdentifier:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lock");

      -[NSObject receiveData:](v17, "receiveData:", v9);
      -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unlock");
    }

    goto LABEL_10;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__RCNetworkOperationURLSessionDelegate_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  v20[3] = &unk_1E470DFF0;
  v20[4] = v7;
  __90__RCNetworkOperationURLSessionDelegate_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke((uint64_t)v20);
LABEL_11:

}

void __90__RCNetworkOperationURLSessionDelegate_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  RCSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "rc_logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A1FB5000, v2, OS_LOG_TYPE_ERROR, "Error: Missing task identifier for request %{public}@", (uint8_t *)&v4, 0xCu);

  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  RCSharedLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "rc_logIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_1A1FB5000, v5, OS_LOG_TYPE_DEFAULT, "Background URL session did finish for identifier: %{public}@", buf, 0xCu);

  }
  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  -[RCNetworkOperationURLSessionDelegate observerLock](self, "observerLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  -[RCNetworkOperationURLSessionDelegate sessionDidFinishObservers](self, "sessionDidFinishObservers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      -[RCNetworkOperationURLSessionDelegate sessionDidFinishObservers](self, "sessionDidFinishObservers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pointerAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "networkSessionDidFinishWithTasks:", v9);
      ++v14;
      -[RCNetworkOperationURLSessionDelegate sessionDidFinishObservers](self, "sessionDidFinishObservers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v14 < v18);
  }
  -[RCNetworkOperationURLSessionDelegate observerLock](self, "observerLock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unlock");

  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lock");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v27, "completionHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, v30);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v24);
  }

  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "unlock");

}

- (id)_networkTaskForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RCNetworkOperationTask *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (RCNetworkOperationTask *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[RCNetworkOperationTask initWithIdentifier:]([RCNetworkOperationTask alloc], "initWithIdentifier:", v4);
    -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v4);

  }
  -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v7;
}

- (id)_existingNetworkTaskForURLSessionTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "taskDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lock");

    -[RCNetworkOperationURLSessionDelegate runningTasks](self, "runningTasks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RCNetworkOperationURLSessionDelegate taskLock](self, "taskLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

  }
  else
  {
    RCSharedLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1A1FB5000, v10, OS_LOG_TYPE_ERROR, "Identifier is missing for task: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (RCUnfairLock)taskLock
{
  return self->_taskLock;
}

- (void)setTaskLock:(id)a3
{
  objc_storeStrong((id *)&self->_taskLock, a3);
}

- (NSMutableDictionary)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_runningTasks, a3);
}

- (RCUnfairLock)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(id)a3
{
  objc_storeStrong((id *)&self->_observerLock, a3);
}

- (NSPointerArray)sessionDidFinishObservers
{
  return self->_sessionDidFinishObservers;
}

- (void)setSessionDidFinishObservers:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDidFinishObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDidFinishObservers, 0);
  objc_storeStrong((id *)&self->_observerLock, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_taskLock, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
