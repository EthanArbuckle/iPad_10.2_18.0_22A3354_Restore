@implementation SBKTransactionController

- (SBKTransactionController)initWithDomain:(id)a3 requestURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBKTransactionController *v9;

  v6 = a4;
  v7 = a3;
  SBKStoreAccount();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBKTransactionController initWithDomain:requestURL:forAccount:](self, "initWithDomain:requestURL:forAccount:", v7, v6, v8);

  return v9;
}

- (SBKTransactionController)initWithDomain:(id)a3 requestURL:(id)a4 forAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBKTransactionController *v11;
  uint64_t v12;
  NSString *domain;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  NSOperationQueue *v16;
  NSOperationQueue *operationQueue;
  NSMutableArray *v18;
  NSMutableArray *pendingTransactions;
  SBKStoreAuthenticationController *v20;
  SBKStoreAuthenticationController *authenticationController;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBKTransactionController;
  v11 = -[SBKTransactionController init](&v26, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    domain = v11->_domain;
    v11->_domain = (NSString *)v12;

    objc_storeStrong((id *)&v11->_requestURL, a4);
    v11->_enabled = 1;
    v14 = dispatch_queue_create("com.apple.SBKTransactionController", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    v11->_conflictResolutionAttempts = 0;
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v11->_operationQueue;
    v11->_operationQueue = v16;

    -[NSOperationQueue setName:](v11->_operationQueue, "setName:", CFSTR("com.apple.SBKTransactionController.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_storeStrong((id *)&v11->_account, a5);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingTransactions = v11->_pendingTransactions;
    v11->_pendingTransactions = v18;

    v20 = -[SBKStoreAuthenticationController initWithStoreAccount:]([SBKStoreAuthenticationController alloc], "initWithStoreAccount:", v11->_account);
    authenticationController = v11->_authenticationController;
    v11->_authenticationController = v20;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x24BEC8B00];
    objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel__networkTypeChangedNotification_, v23, v24);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEC8B00];
  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  -[SBKTransactionController _onQueue_endBackgroundTask](self, "_onQueue_endBackgroundTask");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSOperationQueue operations](self->_operationQueue, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "setDelegate:", 0);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)SBKTransactionController;
  -[SBKTransactionController dealloc](&v12, sel_dealloc);
}

- (void)setDomain:(id)a3
{
  id v4;
  NSString *v5;
  NSString *domain;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_domain, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    domain = self->_domain;
    self->_domain = v5;

    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__SBKTransactionController_setDomain___block_invoke;
    block[3] = &unk_24E2A8240;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)setRequestURL:(id)a3
{
  id v5;
  NSObject *queue;
  _QWORD block[5];

  v5 = a3;
  if ((-[NSURL isEqual:](self->_requestURL, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_requestURL, a3);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SBKTransactionController_setRequestURL___block_invoke;
    block[3] = &unk_24E2A8240;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)setEnabled:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[5];

  self->_enabled = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SBKTransactionController_setEnabled___block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SBKTransactionController__networkTypeChangedNotification___block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_onQueue_clampsController
{
  return +[SBKStoreClampsController sharedClampsController](SBKStoreClampsController, "sharedClampsController");
}

- (BOOL)_onQueue_isIdle
{
  return !self->_currentTransaction && -[NSMutableArray count](self->_pendingTransactions, "count") == 0;
}

- (BOOL)isIdle
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SBKTransactionController_isIdle__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)scheduleTransaction:(id)a3 withTransactionFinishedBlock:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v7, "setTransactionContext:forKey:", v6, CFSTR("SBKTransactionFinishedBlock"));

  -[SBKTransactionController scheduleTransaction:](self, "scheduleTransaction:", v7);
}

- (void)scheduleTransaction:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  BOOL v13;
  id v14;

  v4 = a3;
  if (self->_account)
  {
    v14 = 0;
    v5 = -[SBKTransactionController _delegateShouldScheduleTransaction:error:](self, "_delegateShouldScheduleTransaction:error:", v4, &v14);
    v6 = v14;
  }
  else
  {
    +[SBKStoreError noStoreAccountErrorWithTransaction:underlyingError:](SBKStoreError, "noStoreAccountErrorWithTransaction:underlyingError:", v4, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SBKTransactionController_scheduleTransaction___block_invoke;
  block[3] = &unk_24E2A82B8;
  v13 = v5;
  block[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_async(queue, block);

}

- (void)cancelScheduledTransaction:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SBKTransactionController_cancelScheduledTransaction___block_invoke;
  v7[3] = &unk_24E2A81C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cancelAllTransactions
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SBKTransactionController_cancelAllTransactions__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelAllTransactionsCancelCode:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SBKTransactionController_cancelAllTransactionsCancelCode___block_invoke;
  v4[3] = &unk_24E2A7D60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_enqueueStoreOperation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __51__SBKTransactionController__enqueueStoreOperation___block_invoke;
  v8 = &unk_24E2A7758;
  objc_copyWeak(&v9, &from);
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setCompletionBlock:", &v5);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_storeOperationDidComplete:(id)a3
{
  SBKTransactionController *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "delegate");
  v4 = (SBKTransactionController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    objc_msgSend(v5, "setDelegate:", 0);

}

- (void)_resolveError:(id)a3 resolution:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SBKTransactionController__resolveError_resolution___block_invoke;
  block[3] = &unk_24E2A7780;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_beginBackgroundTask
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SBKTransactionController__beginBackgroundTask__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_endBackgroundTask
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SBKTransactionController__endBackgroundTask__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueue_beginBackgroundTask
{
  void *v3;
  MSVTaskAssertion *backgroundTaskAssertion;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_backgroundTaskAssertion)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65CC0]), "initWithName:pid:subsystem:reason:flags:", CFSTR("SBKTransactionController"), getpid(), CFSTR("com.apple.amp.StoreBookkeeper"), 2, 1);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke;
    v5[3] = &unk_24E2A80A0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "setInvalidationHandler:", v5);
    backgroundTaskAssertion = self->_backgroundTaskAssertion;
    self->_backgroundTaskAssertion = (MSVTaskAssertion *)v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_onQueue_endBackgroundTask
{
  MSVTaskAssertion *v3;
  MSVTaskAssertion *backgroundTaskAssertion;
  NSObject *queue;
  _QWORD block[4];
  MSVTaskAssertion *v7;

  v3 = self->_backgroundTaskAssertion;
  backgroundTaskAssertion = self->_backgroundTaskAssertion;
  self->_backgroundTaskAssertion = 0;

  if (v3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__SBKTransactionController__onQueue_endBackgroundTask__block_invoke;
    block[3] = &unk_24E2A8240;
    v7 = v3;
    dispatch_async(queue, block);

  }
}

- (void)_onQueue_cancelAllPendingTransactions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_pendingTransactions, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(v4, "copy", (_QWORD)v12);
        objc_msgSend(v11, "setTransaction:", v10);
        -[SBKTransactionController _onQueue_cancelTransaction:error:](self, "_onQueue_cancelTransaction:error:", v10, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_pendingTransactions, "removeAllObjects");
}

- (void)_onQueue_cancelTransaction:(id)a3 error:(id)a4
{
  SBKTransaction *v6;
  id v7;
  SBKTransaction *currentTransaction;
  NSObject *v9;
  const __CFString *v10;
  SBKTransaction *v11;
  int v12;
  SBKTransaction *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (SBKTransaction *)a3;
  v7 = a4;
  if (v6)
  {
    currentTransaction = self->_currentTransaction;
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (currentTransaction == v6)
        v10 = CFSTR("YES");
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21E4FD000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling transaction: %@ -- isCurrentTransaction: %@", (uint8_t *)&v12, 0x16u);
    }

    if (!v7)
    {
      +[SBKStoreError transactionCancelledErrorWithTransaction:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", 0, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "setTransaction:", v6);
    if (currentTransaction == v6)
    {
      -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
      -[SBKTransaction setActiveRequest:](self->_currentTransaction, "setActiveRequest:", 0);
      v11 = self->_currentTransaction;
      self->_currentTransaction = 0;

    }
    if (self->_isResolvingError)
      -[SBKTransactionController _onQueue_transactionDidCancel:withError:](self, "_onQueue_transactionDidCancel:withError:", v6, v7);
    else
      -[SBKTransactionController _onQueue_transactionDidFail:withError:](self, "_onQueue_transactionDidFail:withError:", v6, v7);
    -[NSMutableArray removeObject:](self->_pendingTransactions, "removeObject:", v6);
    -[SBKTransactionController _onQueue_processPendingTransactions](self, "_onQueue_processPendingTransactions");
  }

}

- (void)_onQueue_processPendingTransactions
{
  NSObject *v3;
  SBKTransaction *currentTransaction;
  SBKTransaction *v5;
  SBKTransaction *v6;
  NSObject *v7;
  int v8;
  SBKTransaction *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_currentTransaction)
  {
    v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      currentTransaction = self->_currentTransaction;
      v8 = 138412290;
      v9 = currentTransaction;
      _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "Transaction In progress: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else if (-[NSMutableArray count](self->_pendingTransactions, "count"))
  {
    -[SBKTransaction setActiveRequest:](self->_currentTransaction, "setActiveRequest:", 0);
    -[NSMutableArray objectAtIndex:](self->_pendingTransactions, "objectAtIndex:", 0);
    v5 = (SBKTransaction *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentTransaction;
    self->_currentTransaction = v5;

    -[SBKTransactionController _onQueue_processCurrentTransaction](self, "_onQueue_processCurrentTransaction");
  }
  else
  {
    v7 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_21E4FD000, v7, OS_LOG_TYPE_DEFAULT, "No Pending Transactions", (uint8_t *)&v8, 2u);
    }

    -[SBKTransactionController _onQueue_endBackgroundTask](self, "_onQueue_endBackgroundTask");
  }
}

- (void)_onQueue_processCurrentTransaction
{
  NSObject *v3;
  SBKTransaction *currentTransaction;
  SBKTransaction *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  SBKTransaction *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentTransaction = self->_currentTransaction;
    *(_DWORD *)buf = 138412290;
    v13 = currentTransaction;
    _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "Processing Transaction: %@", buf, 0xCu);
  }

  v5 = self->_currentTransaction;
  v11 = 0;
  v6 = -[SBKTransactionController _onQueue_authenticationCanProcessTransaction:error:](self, "_onQueue_authenticationCanProcessTransaction:error:", v5, &v11);
  v7 = v11;
  if (v6)
  {
    -[SBKTransactionController _onQueue_beginBackgroundTask](self, "_onQueue_beginBackgroundTask");
    v8 = -[SBKTransaction newRequest](self->_currentTransaction, "newRequest");
    objc_msgSend(v8, "setShouldAuthenticate:", -[SBKStoreAuthenticationController shouldAuthenticate](self->_authenticationController, "shouldAuthenticate"));
    -[SBKTransaction setActiveRequest:](self->_currentTransaction, "setActiveRequest:", v8);
    v9 = (void *)objc_msgSend(v8, "newURLOperationWithDelegate:", self);
    -[SBKTransactionController _enqueueStoreOperation:](self, "_enqueueStoreOperation:", v9);

    v7 = v8;
  }
  else
  {
    -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccountIdentifierCheckTimestamp");

    -[SBKTransactionController _onQueue_transactionDidFail:withError:](self, "_onQueue_transactionDidFail:withError:", self->_currentTransaction, v7);
  }

}

- (void)_onQueue_scheduleTransaction:(id)a3 isRetry:(BOOL)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  dispatch_time_t v15;
  NSObject *queue;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_21E4FD000, v7, OS_LOG_TYPE_DEFAULT, "Scheduling Transaction: %@", buf, 0xCu);
  }

  v18 = 0;
  v8 = -[SBKTransactionController _onQueue_canScheduleTransaction:error:](self, "_onQueue_canScheduleTransaction:error:", v6, &v18);
  v9 = v18;
  v10 = v9;
  if (v8)
  {
    -[SBKTransactionController _onQueue_addPendingTransaction:](self, "_onQueue_addPendingTransaction:", v6);
  }
  else if (!a4 && objc_msgSend(v9, "isClampError") && (objc_msgSend(v10, "retrySeconds"), v11 <= 5.0))
  {
    -[NSMutableArray insertObject:atIndex:](self->_pendingTransactions, "insertObject:atIndex:", v6, 0);
    v12 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "retrySeconds");
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2048;
      v22 = v13;
      _os_log_impl(&dword_21E4FD000, v12, OS_LOG_TYPE_DEFAULT, "Holding transaction %@ (due to clamps) %.2f seconds", buf, 0x16u);
    }

    objc_msgSend(v10, "retrySeconds");
    v15 = dispatch_time(0, (uint64_t)((v14 + 0.5) * 1000000000.0));
    queue = self->_queue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __65__SBKTransactionController__onQueue_scheduleTransaction_isRetry___block_invoke;
    v17[3] = &unk_24E2A8240;
    v17[4] = self;
    dispatch_after(v15, queue, v17);
  }
  else
  {
    -[SBKTransactionController _onQueue_transactionDidFail:withError:](self, "_onQueue_transactionDidFail:withError:", v6, v10);
  }

}

- (void)_onQueue_addPendingTransaction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimestampForTransaction:", v4);

  -[NSMutableArray addObject:](self->_pendingTransactions, "addObject:", v4);
  -[SBKTransactionController _onQueue_processPendingTransactions](self, "_onQueue_processPendingTransactions");
}

- (BOOL)_onQueue_canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[SBKTransactionController _onQueue_isEnabledForTransaction:error:](self, "_onQueue_isEnabledForTransaction:error:", v6, a4))
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  -[SBKTransactionController _onQueue_assertIsTransactionValid:error:](self, "_onQueue_assertIsTransactionValid:error:", v6, a4);
  if (!-[SBKTransactionController _onQueue_clampsCanScheduleTransaction:error:](self, "_onQueue_clampsCanScheduleTransaction:error:", v6, a4))
  {
    v8 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v9 = *a4;
      else
        v9 = 0;
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_DEFAULT, "Unable to schedule (due to clamps %@) transaction %@.", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_10;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)_onQueue_isEnabledForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  BOOL v8;

  v6 = a3;
  v7 = -[SBKTransactionController isEnabled](self, "isEnabled");
  v8 = v7;
  if (a4 && !v7)
  {
    +[SBKStoreError keyValueStoreDisabledErrorWithTransaction:underlyingError:](SBKStoreError, "keyValueStoreDisabledErrorWithTransaction:underlyingError:", v6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_onQueue_assertIsTransactionValid:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransactionController.m"), 413, CFSTR("No domain specified in transaction %@!"), v11);

  }
  objc_msgSend(v11, "requestURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransactionController.m"), 414, CFSTR("No url specified in transaction %@!"), v11);

  }
}

- (BOOL)_onQueue_clampsCanScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "canScheduleTransaction:error:", v6, a4);
  else
    v9 = 1;

  return v9;
}

- (BOOL)_onQueue_authenticationCanProcessTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_msgSend(v7, "hasUserRecentlyAcceptedSync") & 1) == 0
    && !-[SBKStoreAuthenticationController isAuthenticationValidForTransaction:error:](self->_authenticationController, "isAuthenticationValidForTransaction:error:", v6, a4)|| !-[SBKStoreAuthenticationController shouldAuthenticate](self->_authenticationController, "shouldAuthenticate")|| (objc_msgSend(v7, "hasAuthenticatedTooRecentlyForTransaction:error:", v6, a4) & 1) == 0;

  return v8;
}

- (void)_onQueue_currentTransactionDidFinish
{
  NSObject *v3;
  SBKTransaction *currentTransaction;
  SBKTransaction *v5;
  int v6;
  SBKTransaction *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentTransaction = self->_currentTransaction;
    v6 = 138412290;
    v7 = currentTransaction;
    _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "Transaction Finished: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SBKTransactionController _onQueue_endBackgroundTask](self, "_onQueue_endBackgroundTask");
  -[SBKTransactionController _delegateTransactionDidFinish:](self, "_delegateTransactionDidFinish:", self->_currentTransaction);
  -[NSMutableArray removeObject:](self->_pendingTransactions, "removeObject:", self->_currentTransaction);
  -[SBKTransaction setActiveRequest:](self->_currentTransaction, "setActiveRequest:", 0);
  v5 = self->_currentTransaction;
  self->_currentTransaction = 0;

  -[SBKTransactionController _onQueue_processPendingTransactions](self, "_onQueue_processPendingTransactions");
}

- (void)_onQueue_transactionDidFail:(id)a3 withError:(id)a4
{
  SBKTransaction *v6;
  id v7;
  SBKTransaction *currentTransaction;
  BOOL v9;
  id v10;
  SBKTransaction *v11;
  _QWORD block[4];
  SBKTransaction *v13;
  id v14;
  SBKTransactionController *v15;

  v6 = (SBKTransaction *)a3;
  v7 = a4;
  currentTransaction = self->_currentTransaction;
  if (currentTransaction)
    v9 = currentTransaction == v6;
  else
    v9 = 0;
  if (v9)
    -[SBKTransactionController _onQueue_endBackgroundTask](self, "_onQueue_endBackgroundTask");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SBKTransactionController__onQueue_transactionDidFail_withError___block_invoke;
  block[3] = &unk_24E2A80C8;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)_onQueue_transactionDidCancel:(id)a3 withError:(id)a4
{
  SBKTransaction *v6;
  id v7;
  SBKTransaction *currentTransaction;
  BOOL v9;
  id v10;
  SBKTransaction *v11;
  _QWORD block[4];
  SBKTransaction *v13;
  id v14;
  SBKTransactionController *v15;

  v6 = (SBKTransaction *)a3;
  v7 = a4;
  currentTransaction = self->_currentTransaction;
  if (currentTransaction)
    v9 = currentTransaction == v6;
  else
    v9 = 0;
  if (v9)
    -[SBKTransactionController _onQueue_endBackgroundTask](self, "_onQueue_endBackgroundTask");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SBKTransactionController__onQueue_transactionDidCancel_withError___block_invoke;
  block[3] = &unk_24E2A80C8;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)_processDataInResponse:(id)a3
{
  SBKTransaction *currentTransaction;
  _QWORD v4[5];

  currentTransaction = self->_currentTransaction;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBKTransactionController__processDataInResponse___block_invoke;
  v4[3] = &unk_24E2A77A8;
  v4[4] = self;
  -[SBKTransaction processDataInResponse:withCompletionHandler:](currentTransaction, "processDataInResponse:withCompletionHandler:", a3, v4);
}

- (void)_onQueue_processOperationOutput:(id)a3 operation:(id)a4 operationAuthenticated:(BOOL)a5
{
  id v7;
  id v8;
  SBKTransaction *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  const char *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = self->_currentTransaction;
  -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v9 && self->_enabled)
    {
      v11 = v7;
      objc_msgSend(v8, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKResponse responseWithURLResponse:responseDictionary:](SBKResponse, "responseWithURLResponse:responseDictionary:", v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBKTransaction activeRequest](v9, "activeRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "canonicalResponseForResponse:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "isSuccess");
      v17 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (!v18)
          goto LABEL_15;
        *(_DWORD *)v31 = 138412290;
        *(_QWORD *)&v31[4] = v15;
        v19 = "Deserialized server response: %@";
      }
      else
      {
        if (!v18)
          goto LABEL_15;
        *(_DWORD *)v31 = 138412290;
        *(_QWORD *)&v31[4] = v11;
        v19 = "Deserialized server response produced response data: %@";
      }
      _os_log_impl(&dword_21E4FD000, v17, OS_LOG_TYPE_DEFAULT, v19, v31, 0xCu);
LABEL_15:

      if (objc_msgSend(v15, "isSuccess"))
      {
        -[SBKStoreAuthenticationController saveAccountToLastSyncedDefaults](self->_authenticationController, "saveAccountToLastSyncedDefaults");
        -[SBKStoreAuthenticationController setShouldAuthenticate:](self->_authenticationController, "setShouldAuthenticate:", 0);
        -[SBKTransactionController _processDataInResponse:](self, "_processDataInResponse:", v15);
LABEL_39:

        goto LABEL_40;
      }
      objc_msgSend(v15, "retrySeconds");
      if (v21 <= 0.0)
      {
        if (!objc_msgSend(v15, "isUnsupportedClient"))
        {
          if (objc_msgSend(v15, "isGenericError"))
          {
            _SBKLogCategoryDefault();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v31 = 138412290;
              *(_QWORD *)&v31[4] = v11;
              _os_log_impl(&dword_21E4FD000, v27, OS_LOG_TYPE_DEFAULT, "Generic error indicated by response responseDictionary: %@", v31, 0xCu);
            }

            objc_msgSend(v15, "requestError");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[SBKStoreError storeGenericErrorWithTransaction:underlyingError:](SBKStoreError, "storeGenericErrorWithTransaction:underlyingError:", v9, v24);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v15, "isValidationError"))
          {
            _SBKLogCategoryDefault();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v31 = 138412290;
              *(_QWORD *)&v31[4] = v11;
              _os_log_impl(&dword_21E4FD000, v29, OS_LOG_TYPE_DEFAULT, "Validation error indicated by response responseDictionary: %@", v31, 0xCu);
            }

            objc_msgSend(v15, "requestError");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[SBKStoreError storeValidationErrorWithTransaction:underlyingError:](SBKStoreError, "storeValidationErrorWithTransaction:underlyingError:", v9, v24);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v15, "isAuthenticationError"))
          {
            -[SBKStoreAuthenticationController saveAccountToLastFailedSyncDefaults](self->_authenticationController, "saveAccountToLastFailedSyncDefaults");
            if (-[SBKTransactionController shouldAuthenticateIfNecessary](self, "shouldAuthenticateIfNecessary"))
            {
              objc_msgSend(v10, "clearAuthenticationRequest");
              -[SBKStoreAuthenticationController setShouldAuthenticate:](self->_authenticationController, "setShouldAuthenticate:", 1);
              -[SBKTransactionController _onQueue_processCurrentTransaction](self, "_onQueue_processCurrentTransaction");
              goto LABEL_39;
            }
            objc_msgSend(v15, "requestError");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[SBKStoreError storeAccountSessionExpiredWithTransaction:underlyingError:](SBKStoreError, "storeAccountSessionExpiredWithTransaction:underlyingError:", v9, v24);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            _SBKLogCategoryDefault();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v31 = 138412290;
              *(_QWORD *)&v31[4] = v11;
              _os_log_impl(&dword_21E4FD000, v30, OS_LOG_TYPE_DEFAULT, "Unknown error in response: %@", v31, 0xCu);
            }

            objc_msgSend(v15, "requestError");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[SBKStoreError unknownErrorWithTransaction:underlyingError:](SBKStoreError, "unknownErrorWithTransaction:underlyingError:", v9, v24);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v26 = (void *)v28;
          -[SBKTransactionController _onQueue_transactionDidFail:withError:](self, "_onQueue_transactionDidFail:withError:", v9, v28, *(_OWORD *)v31);
LABEL_38:

          goto LABEL_39;
        }
        objc_msgSend(v10, "setNetworkingBlocked");
        objc_msgSend(v15, "requestError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBKStoreError killSwitchErrorWithTransaction:underlyingError:](SBKStoreError, "killSwitchErrorWithTransaction:underlyingError:", v9, v24);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v15, "retrySeconds");
        objc_msgSend(v10, "backOffForTimeInterval:");
        objc_msgSend(v15, "retrySeconds");
        v23 = v22;
        objc_msgSend(v15, "requestError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBKStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:](SBKStoreError, "serverClampErrorWithTransaction:retrySeconds:underlyingError:", v9, v24, v23);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v26 = (void *)v25;
      -[SBKTransactionController _onQueue_cancelAllPendingTransactions:](self, "_onQueue_cancelAllPendingTransactions:", v25, *(_OWORD *)v31);
      goto LABEL_38;
    }
    v11 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      v20 = "Not using deserialized responseDictionary because transactions have been cancelled!";
      goto LABEL_11;
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      v20 = "Not using deserialized response because it is not a dictionary as expected!";
LABEL_11:
      _os_log_impl(&dword_21E4FD000, v11, OS_LOG_TYPE_DEFAULT, v20, v31, 2u);
    }
  }
LABEL_40:

}

- (void)_onQueue_resolveError:(id)a3 resolution:(int)a4
{
  char v6;
  void *v7;
  SBKTransaction *v8;
  SBKTransaction *currentTransaction;
  void *v10;
  id v11;

  v11 = a3;
  v6 = objc_msgSend(v11, "isTransactionCancelledError");
  v7 = v11;
  if ((v6 & 1) != 0)
    goto LABEL_13;
  self->_isResolvingError = 1;
  objc_msgSend(v11, "transaction");
  v8 = (SBKTransaction *)objc_claimAutoreleasedReturnValue();
  currentTransaction = self->_currentTransaction;
  if (v8 == currentTransaction)
  {

LABEL_6:
    -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearAccountIdentifierCheckTimestamp");

    goto LABEL_7;
  }

  if (!currentTransaction)
    goto LABEL_6;
LABEL_7:
  if (a4 == 2)
  {
    -[SBKTransactionController _onQueue_performCancelErrorHandlingForError:](self, "_onQueue_performCancelErrorHandlingForError:", v11);
  }
  else if (a4 == 1)
  {
    -[SBKTransactionController _onQueue_performRetryErrorHandlingForError:](self, "_onQueue_performRetryErrorHandlingForError:", v11);
  }
  else
  {
    -[SBKTransactionController _onQueue_performDefaultErrorHandlingForError:](self, "_onQueue_performDefaultErrorHandlingForError:", v11);
  }
  self->_isResolvingError = 0;
  v7 = v11;
LABEL_13:

}

- (void)_onQueue_performRetryErrorHandlingForError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBKTransactionController _onQueue_clampsController](self, "_onQueue_clampsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAccountsChangedError"))
  {
    objc_msgSend(v4, "setUserAcceptedSyncTimestamp");
  }
  else
  {
    if (!objc_msgSend(v7, "isAuthenticationError"))
    {
      objc_msgSend(v7, "transaction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clearTimestampForTransaction:", v5);

      objc_msgSend(v7, "transaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBKTransactionController _onQueue_scheduleTransaction:isRetry:](self, "_onQueue_scheduleTransaction:isRetry:", v6, 1);

      goto LABEL_7;
    }
    objc_msgSend(v4, "setUserAcceptedSyncTimestamp");
    -[SBKStoreAuthenticationController saveAccountToLastSyncedDefaults](self->_authenticationController, "saveAccountToLastSyncedDefaults");
  }
  -[SBKTransactionController _onQueue_processCurrentTransaction](self, "_onQueue_processCurrentTransaction");
LABEL_7:

}

- (void)_onQueue_performCancelErrorHandlingForError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isAuthenticationError"))
  {
    -[SBKTransactionController _onQueue_cancelAllPendingTransactions:](self, "_onQueue_cancelAllPendingTransactions:", v5);
  }
  else
  {
    objc_msgSend(v5, "transaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKTransactionController _onQueue_cancelTransaction:error:](self, "_onQueue_cancelTransaction:error:", v4, v5);

  }
}

- (void)_onQueue_performDefaultErrorHandlingForError:(id)a3
{
  SBKTransaction *v4;
  SBKTransaction *currentTransaction;
  SBKTransactionController *v6;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "isAuthenticationError")
    && -[SBKTransactionController shouldAuthenticateIfNecessary](self, "shouldAuthenticateIfNecessary")
    && (objc_msgSend(v9, "transaction"),
        v4 = (SBKTransaction *)objc_claimAutoreleasedReturnValue(),
        currentTransaction = self->_currentTransaction,
        v4,
        v4 == currentTransaction))
  {
    v6 = self;
    v7 = v9;
    v8 = 1;
  }
  else
  {
    v6 = self;
    v7 = v9;
    v8 = 2;
  }
  -[SBKTransactionController _onQueue_resolveError:resolution:](v6, "_onQueue_resolveError:resolution:", v7, v8);

}

- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  BOOL v8;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "transactionController:shouldScheduleTransaction:", self, v6) & 1) == 0)
  {
    if (a4)
    {
      +[SBKStoreError delegateCancelledErrorWithTransaction:underlyingError:](SBKStoreError, "delegateCancelledErrorWithTransaction:underlyingError:", v6, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_sendFinishedBlockForTransaction:(id)a3 success:(BOOL)a4 cancelled:(BOOL)a5 error:(id)a6 handledAsFinishedBlock:(BOOL *)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a6;
  objc_msgSend(v11, "transactionContextForKey:", CFSTR("SBKTransactionFinishedBlock"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    *a7 = 1;
    v15 = (*(uint64_t (**)(uint64_t, _BOOL8, _BOOL8, id))(v13 + 16))(v13, v10, v9, v12);
    objc_msgSend(v11, "setTransactionContext:forKey:", 0, CFSTR("SBKTransactionFinishedBlock"));
  }
  else
  {
    v15 = 0;
    *a7 = 0;
  }

  return v15;
}

- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  char v9;
  id WeakRetained;
  void *v12;
  void *v13;
  char v14;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransactionController.m"), 653, CFSTR("Delegate calls should be done on the main thread"));

  }
  v14 = 0;
  v9 = -[SBKTransactionController _sendFinishedBlockForTransaction:success:cancelled:error:handledAsFinishedBlock:](self, "_sendFinishedBlockForTransaction:success:cancelled:error:handledAsFinishedBlock:", v7, 0, 0, v8, &v14);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransactionController.m"), 660, CFSTR("transaction controllers with delegates can not use transaction finish blocks"));

    }
    v9 = objc_msgSend(WeakRetained, "transactionController:transactionDidFail:error:", self, v7, v8);
  }

  return v9;
}

- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SBKTransactionController__delegateTransactionDidCancel_withError___block_invoke;
  block[3] = &unk_24E2A77D0;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = WeakRetained;
  v17 = a2;
  v10 = WeakRetained;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)_delegateTransactionDidFinish:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  SEL v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SBKTransactionController__delegateTransactionDidFinish___block_invoke;
  v9[3] = &unk_24E2A77F8;
  v9[4] = self;
  v10 = v5;
  v11 = WeakRetained;
  v12 = a2;
  v7 = WeakRetained;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SBKTransactionController_operation_finishedWithOutput___block_invoke;
  block[3] = &unk_24E2A80C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)operation:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  NSObject *queue;
  _QWORD block[5];

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "statusCode") == 511)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SBKTransactionController_operation_didReceiveResponse___block_invoke;
    block[3] = &unk_24E2A8240;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  SBKTransaction *v8;
  void *v9;
  char v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *queue;
  id v16;
  SBKTransaction *v17;
  _QWORD block[4];
  __CFString *v19;
  SBKTransactionController *v20;
  SBKTransaction *v21;
  id v22;
  char v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_currentTransaction;
  if (objc_msgSend(v7, "code") == 16)
  {
    +[SBKStoreError userCancelledSignInErrorWithTransaction:underlyingError:](SBKStoreError, "userCancelledSignInErrorWithTransaction:underlyingError:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    v11 = CFSTR("User cancelled sign-in");
  }
  else if (objc_msgSend(v7, "code") == 5)
  {
    +[SBKStoreError userEnteredWrongCredentialsErrorWithTransaction:underlyingError:](SBKStoreError, "userEnteredWrongCredentialsErrorWithTransaction:underlyingError:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    v11 = CFSTR("User entered wrong credentials");
  }
  else
  {
    v12 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "requestProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_21E4FD000, v12, OS_LOG_TYPE_DEFAULT, "Operation failedWithError: %@ -- inputError = %@", buf, 0x16u);

    }
    +[SBKStoreError unknownErrorWithTransaction:underlyingError:](SBKStoreError, "unknownErrorWithTransaction:underlyingError:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v10 = 0;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SBKTransactionController_operation_failedWithError___block_invoke;
  block[3] = &unk_24E2A7820;
  v23 = v10;
  v19 = (__CFString *)v11;
  v20 = self;
  v24 = v10;
  v21 = v8;
  v22 = v9;
  v16 = v9;
  v17 = v8;
  dispatch_async(queue, block);

}

- (SBKTransactionControllerDelegate)delegate
{
  return (SBKTransactionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (SSAccount)account
{
  return self->_account;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SBKStoreAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (BOOL)shouldAuthenticateIfNecessary
{
  return self->_shouldAuthenticateIfNecessary;
}

- (void)setShouldAuthenticateIfNecessary:(BOOL)a3
{
  self->_shouldAuthenticateIfNecessary = a3;
}

- (SBKTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransactions, a3);
}

- (BOOL)isResolvingError
{
  return self->_isResolvingError;
}

- (void)setIsResolvingError:(BOOL)a3
{
  self->_isResolvingError = a3;
}

- (MSVTaskAssertion)backgroundTaskAssertion
{
  return self->_backgroundTaskAssertion;
}

- (void)setBackgroundTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTaskAssertion, a3);
}

- (id)networkTypeObserver
{
  return objc_loadWeakRetained(&self->_networkTypeObserver);
}

- (void)setNetworkTypeObserver:(id)a3
{
  objc_storeWeak(&self->_networkTypeObserver, a3);
}

- (int64_t)conflictResolutionAttempts
{
  return self->_conflictResolutionAttempts;
}

- (void)setConflictResolutionAttempts:(int64_t)a3
{
  self->_conflictResolutionAttempts = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_networkTypeObserver);
  objc_storeStrong((id *)&self->_backgroundTaskAssertion, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__SBKTransactionController_operation_failedWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_21E4FD000, v2, OS_LOG_TYPE_DEFAULT, "[StoreBookkeeper] %@.  Will suppress authentication dialogs for a while.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_onQueue_clampsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserCancelledSignIn");

  }
  if (*(_BYTE *)(a1 + 65) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "shouldAuthenticate"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_clampsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthenticationRequest");

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_transactionDidFail:withError:", v6, *(_QWORD *)(a1 + 56));
}

void __57__SBKTransactionController_operation_didReceiveResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNetworkingBlocked");

  v3 = *(void **)(a1 + 32);
  +[SBKStoreError killSwitchErrorWithTransaction:underlyingError:](SBKStoreError, "killSwitchErrorWithTransaction:underlyingError:", 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_onQueue_cancelAllPendingTransactions:", v4);

}

uint64_t __57__SBKTransactionController_operation_finishedWithOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_processOperationOutput:operation:operationAuthenticated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 48), "needsAuthentication"));
}

uint64_t __58__SBKTransactionController__delegateTransactionDidFinish___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  char v4;

  v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_sendFinishedBlockForTransaction:success:cancelled:error:handledAsFinishedBlock:", *(_QWORD *)(a1 + 40), 1, 0, 0, &v4);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SBKTransactionController.m"), 687, CFSTR("transaction controllers with delegates can not use transaction finish blocks"));

    }
    return objc_msgSend(*(id *)(a1 + 48), "transactionController:transactionDidFinish:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __68__SBKTransactionController__delegateTransactionDidCancel_withError___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  char v4;

  v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_sendFinishedBlockForTransaction:success:cancelled:error:handledAsFinishedBlock:", *(_QWORD *)(a1 + 40), 0, 1, *(_QWORD *)(a1 + 48), &v4);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("SBKTransactionController.m"), 674, CFSTR("transaction controllers with delegates can not use transaction finish blocks"));

    }
    return objc_msgSend(*(id *)(a1 + 56), "transactionController:transactionDidCancel:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  return result;
}

void __51__SBKTransactionController__processDataInResponse___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SBKTransactionController__processDataInResponse___block_invoke_2;
  v4[3] = &unk_24E2A7A68;
  v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

void __51__SBKTransactionController__processDataInResponse___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = v1[13];
    if (v2 <= 0)
    {
      v1[13] = v2 + 1;
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_processCurrentTransaction");
    }
    else
    {
      v3 = v1[7];
      +[SBKStoreError storeGenericErrorWithTransaction:underlyingError:](SBKStoreError, "storeGenericErrorWithTransaction:underlyingError:", v3, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_onQueue_transactionDidFail:withError:", v3, v4);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_currentTransactionDidFinish");
  }
}

uint64_t __68__SBKTransactionController__onQueue_transactionDidCancel_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21E4FD000, v2, OS_LOG_TYPE_DEFAULT, "Transaction Failed: %@ -- Error: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_delegateTransactionDidCancel:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__SBKTransactionController__onQueue_transactionDidFail_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21E4FD000, v2, OS_LOG_TYPE_DEFAULT, "Transaction Failed: %@ -- Error: %@", (uint8_t *)&v6, 0x16u);
  }

  result = objc_msgSend(*(id *)(a1 + 48), "_delegateTransactionDidFail:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 48), "_resolveError:resolution:", *(_QWORD *)(a1 + 40), 0);
  return result;
}

void __65__SBKTransactionController__onQueue_scheduleTransaction_isRetry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectAtIndex:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (id)v2;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v2);
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_scheduleTransaction:isRetry:", v3, 1);

    }
  }
}

uint64_t __54__SBKTransactionController__onQueue_endBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return result;
}

void __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[8];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke_2;
    v7[3] = &unk_24E2A81C8;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "backgroundTaskAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_endBackgroundTask");
}

uint64_t __46__SBKTransactionController__endBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_endBackgroundTask");
}

uint64_t __48__SBKTransactionController__beginBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_beginBackgroundTask");
}

uint64_t __53__SBKTransactionController__resolveError_resolution___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_resolveError:resolution:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __51__SBKTransactionController__enqueueStoreOperation___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v2, "_storeOperationDidComplete:", WeakRetained);

  }
}

void __60__SBKTransactionController_cancelAllTransactionsCancelCode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  +[SBKStoreError transactionCancelledErrorWithTransaction:code:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:code:underlyingError:", 0, *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onQueue_cancelAllPendingTransactions:", v3);

  v5 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v5[7];
  +[SBKStoreError transactionCancelledErrorWithTransaction:code:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:code:underlyingError:", v6, v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_onQueue_cancelTransaction:error:", v6, v7);

}

void __49__SBKTransactionController_cancelAllTransactions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  +[SBKStoreError transactionCancelledErrorWithTransaction:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onQueue_cancelAllPendingTransactions:", v3);

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[7];
  +[SBKStoreError transactionCancelledErrorWithTransaction:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_onQueue_cancelTransaction:error:", v5, v6);

}

void __55__SBKTransactionController_cancelScheduledTransaction___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  +[SBKStoreError transactionCancelledErrorWithTransaction:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", v2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_onQueue_cancelTransaction:error:", v2, v3);

}

uint64_t __48__SBKTransactionController_scheduleTransaction___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "_onQueue_scheduleTransaction:isRetry:", v4, 0);
  else
    return objc_msgSend(v3, "_onQueue_transactionDidFail:withError:", v4, *(_QWORD *)(a1 + 48));
}

uint64_t __34__SBKTransactionController_isIdle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isIdle");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __60__SBKTransactionController__networkTypeChangedNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearNetworkingBlocked");

}

void __39__SBKTransactionController_setEnabled___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[8])
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_processPendingTransactions");
  }
  else
  {
    +[SBKStoreError keyValueStoreDisabledErrorWithTransaction:underlyingError:](SBKStoreError, "keyValueStoreDisabledErrorWithTransaction:underlyingError:", 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_onQueue_cancelAllPendingTransactions:", v2);

  }
}

void __42__SBKTransactionController_setRequestURL___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

void __38__SBKTransactionController_setDomain___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

@end
