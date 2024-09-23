@implementation TPSURLSessionTask

- (void)setPriority:(float)a3
{
  double v5;

  -[NSURLSessionTask priority](self->_task, "priority");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[NSURLSessionTask setPriority:](self->_task, "setPriority:", v5);
  }
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (TPSURLSessionTask)initWithSessionTask:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  TPSURLSessionTask *v9;
  TPSURLSessionTask *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *sessionTaskDelegateQueue;
  NSObject *v14;
  _QWORD block[4];
  TPSURLSessionTask *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TPSURLSessionTask;
  v9 = -[TPSURLSessionTask init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a4);
    objc_storeStrong((id *)&v10->_task, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.tipsd.urlsessionQueue", v11);
    sessionTaskDelegateQueue = v10->_sessionTaskDelegateQueue;
    v10->_sessionTaskDelegateQueue = (OS_dispatch_queue *)v12;

    v14 = v10->_sessionTaskDelegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__TPSURLSessionTask_initWithSessionTask_identifier___block_invoke;
    block[3] = &unk_1E395B100;
    v17 = v10;
    dispatch_sync(v14, block);

  }
  return v10;
}

- (void)setUnderlyingSession:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingSession, a3);
}

- (void)setRequestType:(id)a3
{
  objc_storeStrong((id *)&self->_requestType, a3);
}

- (void)setNetworkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkDelegate, a3);
}

- (void)setDelegateResponds:(TPSURLSessionDelegateResponds)a3
{
  self->_delegateResponds = a3;
}

- (void)registerDelegate:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *sessionTaskDelegateQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[NSHashTable containsObject:](self->_sessionTaskDelegates, "containsObject:", v4);
    v4 = v7;
    if (!v5)
    {
      sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__TPSURLSessionTask_registerDelegate___block_invoke;
      block[3] = &unk_1E395B150;
      block[4] = self;
      v9 = v7;
      dispatch_sync(sessionTaskDelegateQueue, block);

      v4 = v7;
    }
  }

}

void __52__TPSURLSessionTask_initWithSessionTask_identifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionTaskDelegates:", v2);

}

- (void)setSessionTaskDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTaskDelegates, a3);
}

- (void)resume
{
  -[NSURLSessionTask resume](self->_task, "resume");
}

- (NSURLSessionTask)task
{
  return self->_task;
}

void __38__TPSURLSessionTask_registerDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)sessionTaskDelegates
{
  return self->_sessionTaskDelegates;
}

+ (TPSURLSessionDelegateResponds)delegateRespondsWithDelegate:(id)a3
{
  id v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v4 = objc_opt_respondsToSelector();
  v5 = objc_opt_respondsToSelector();
  v6 = objc_opt_respondsToSelector();
  v7 = objc_opt_respondsToSelector();
  v8 = objc_opt_respondsToSelector();

  v9 = 0x100000000;
  if ((v4 & 1) == 0)
    v9 = 0;
  v10 = 0x1000000;
  if ((v8 & 1) == 0)
    v10 = 0;
  v11 = 0x10000;
  if ((v5 & 1) == 0)
    v11 = 0;
  v12 = 256;
  if ((v7 & 1) == 0)
    v12 = 0;
  return (TPSURLSessionDelegateResponds)((v11 | v9) & 0xFFFFFFFFFFFFFFFELL | v6 & 1 | v12 | v10);
}

- (void)dealloc
{
  objc_super v3;

  -[TPSURLSessionTask cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)TPSURLSessionTask;
  -[TPSURLSessionTask dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v3;
  void *v4;

  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    -[TPSURLSessionTask URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[NSURLSessionTask originalRequest](self->_task, "originalRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (float)priority
{
  float result;

  -[NSURLSessionTask priority](self->_task, "priority");
  return result;
}

- (void)didCompleteWithError:(id)a3
{
  id v4;
  NSObject *sessionTaskDelegateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSURLSessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_1E395B150;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionTaskDelegateQueue, block);

}

void __42__TPSURLSessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "URLSessionSessionTask:didCompleteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  NSObject *sessionTaskDelegateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__TPSURLSessionTask_unregisterDelegate___block_invoke;
  block[3] = &unk_1E395B150;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  dispatch_sync(sessionTaskDelegateQueue, block);
  if (!-[NSHashTable count](self->_sessionTaskDelegates, "count"))
    -[TPSURLSessionTask cancel](self, "cancel");

}

void __40__TPSURLSessionTask_unregisterDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)cancel
{
  NSObject *sessionTaskDelegateQueue;
  _QWORD block[5];

  -[NSURLSessionTask cancel](self->_task, "cancel");
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__TPSURLSessionTask_cancel__block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_sync(sessionTaskDelegateQueue, block);
  self->_cancelled = 1;
}

void __27__TPSURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (NSURLSession)underlyingSession
{
  return (NSURLSession *)objc_loadWeakRetained((id *)&self->_underlyingSession);
}

- (TPSURLSessionDelegate)networkDelegate
{
  return (TPSURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_networkDelegate);
}

- (TPSURLSessionDelegateResponds)delegateResponds
{
  return (TPSURLSessionDelegateResponds)(*(unsigned int *)&self->_delegateResponds.willCacheResponse | ((unint64_t)self->_delegateResponds.taskDidReceiveChallenge << 32));
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCacheData
{
  return self->_isCacheData;
}

- (void)setIsCacheData:(BOOL)a3
{
  self->_isCacheData = a3;
}

- (unint64_t)downloadTaskTotalBytes
{
  return self->_downloadTaskTotalBytes;
}

- (void)setDownloadTaskTotalBytes:(unint64_t)a3
{
  self->_downloadTaskTotalBytes = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)requestType
{
  return self->_requestType;
}

- (id)formattedData
{
  return self->_formattedData;
}

- (void)setFormattedData:(id)a3
{
  objc_storeStrong(&self->_formattedData, a3);
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (NSMutableData)dataTaskData
{
  return self->_dataTaskData;
}

- (void)setDataTaskData:(id)a3
{
  objc_storeStrong((id *)&self->_dataTaskData, a3);
}

- (NSError)dataError
{
  return self->_dataError;
}

- (void)setDataError:(id)a3
{
  objc_storeStrong((id *)&self->_dataError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTaskDelegates, 0);
  objc_storeStrong((id *)&self->_dataError, 0);
  objc_storeStrong((id *)&self->_dataTaskData, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_formattedData, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_networkDelegate);
  objc_destroyWeak((id *)&self->_underlyingSession);
  objc_storeStrong((id *)&self->_sessionTaskDelegateQueue, 0);
}

@end
