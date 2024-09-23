@implementation ISOperation

- (ISOperation)init
{
  ISOperation *v3;
  NSLock *v4;
  NSLock *lock;
  objc_super v7;

  __ISRecordSPIClassUsage(self);
  v7.receiver = self;
  v7.super_class = (Class)ISOperation;
  v3 = -[ISOperation init](&v7, sel_init);
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v3->_lock;
    v3->_lock = v4;

  }
  return v3;
}

- (SSOperationProgress)progress
{
  SSOperationProgress *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_progress;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (int64_t)progressWeight
{
  return 1;
}

- (void)run
{
  -[ISOperation setError:](self, "setError:", 0);
  -[ISOperation setSuccess:](self, "setSuccess:", 1);
}

- (int)runRunLoopUntilStopped
{
  void *v3;
  const __CFString *v4;
  void *v5;
  CFRunLoopRunResult v6;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__keepAliveTimer_, 0, 0, 1.79769313e308);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_stopped = 0;
  v4 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  do
  {
    v5 = (void *)MEMORY[0x20BD37A0C]();
    v6 = CFRunLoopRunInMode(v4, 10.0, 1u);
    objc_autoreleasePoolPop(v5);
  }
  while (!self->_stopped && (v6 - 1) > 1);
  objc_msgSend(v3, "invalidate");

  return v6;
}

- (BOOL)runSubOperation:(id)a3 returningError:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if ((objc_msgSend(v6, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v6, "setParentOperation:", self);
    -[ISOperation lock](self, "lock");
    -[ISOperation _addSubOperation:](self, "_addSubOperation:", v6);
    -[ISOperation unlock](self, "unlock");
    +[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checkInOperation:", v6);

    objc_msgSend(v6, "main");
    objc_msgSend(v6, "dispatchCompletionBlock");
    objc_msgSend(v6, "setParentOperation:", 0);
    -[ISOperation lock](self, "lock");
    -[ISOperation _removeSubOperation:](self, "_removeSubOperation:", v6);
    -[ISOperation unlock](self, "unlock");
  }
  if (a4)
  {
    objc_msgSend(v6, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v6, "success");

  return v8;
}

- (BOOL)runSubOperation:(id)a3 onQueue:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v8, "setParentOperation:", self);
    -[ISOperation lock](self, "lock");
    -[ISOperation _addSubOperation:](self, "_addSubOperation:", v8);
    -[ISOperation unlock](self, "unlock");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperations:waitUntilFinished:", v10, 1);

    objc_msgSend(v8, "setParentOperation:", 0);
    -[ISOperation lock](self, "lock");
    -[ISOperation _removeSubOperation:](self, "_removeSubOperation:", v8);
    -[ISOperation unlock](self, "unlock");
  }
  if (a5)
  {
    objc_msgSend(v8, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v8, "success");

  return v11;
}

- (BOOL)stopRunLoop
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __CFRunLoop *v12;
  const void *v13;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[ISOperation lock](self, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_subOperations, "copy");
  -[ISOperation unlock](self, "unlock");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "stopRunLoop") & 1) != 0)
        {
          v11 = 1;
          v10 = v4;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[ISOperation operationRunLoop](self, "operationRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9 != 0;
  if (v9)
  {
    v12 = (__CFRunLoop *)objc_msgSend(v9, "getCFRunLoop");
    v13 = (const void *)*MEMORY[0x24BDBD5A0];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__ISOperation_stopRunLoop__block_invoke;
    block[3] = &unk_24C43C128;
    block[4] = self;
    CFRunLoopPerformBlock(v12, v13, block);
    CFRunLoopWakeUp(v12);
    CFRunLoopStop(v12);
    v11 = 1;
  }
LABEL_12:

  return v11;
}

uint64_t __26__ISOperation_stopRunLoop__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 329) = 1;
  return result;
}

- (ISOperationDelegate)delegate
{
  id WeakRetained;

  -[ISOperation lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ISOperation unlock](self, "unlock");
  return (ISOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4;

  v4 = a3;
  -[ISOperation lock](self, "lock");
  objc_storeWeak((id *)&self->_delegate, v4);

  -[ISOperation unlock](self, "unlock");
}

- (void)setShouldMessageMainThread:(BOOL)a3
{
  -[ISOperation lock](self, "lock");
  self->_shouldMessageMainThread = a3;
  -[ISOperation unlock](self, "unlock");
}

- (BOOL)shouldFailAfterUniquePredecessorError:(id)a3
{
  return 1;
}

- (BOOL)shouldMessageMainThread
{
  BOOL shouldMessageMainThread;

  -[ISOperation lock](self, "lock");
  shouldMessageMainThread = self->_shouldMessageMainThread;
  -[ISOperation unlock](self, "unlock");
  return shouldMessageMainThread;
}

- (NSString)uniqueKey
{
  return 0;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISOperation;
  -[ISOperation cancel](&v4, sel_cancel);
  -[ISOperation lock](self, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_subOperations, "copy");
  -[ISOperation unlock](self, "unlock");
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);
  -[ISOperation stopRunLoop](self, "stopRunLoop");

}

- (void)main
{
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  int v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  int v54;
  NSObject *v55;
  _BOOL4 v56;
  int v57;
  void *v58;
  NSObject *v59;
  void *v60;
  int v61;
  int v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int *v69;
  int *v70;
  int *v71;
  uint64_t v72;
  id v73;
  void *v74;
  int v75;
  id v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  AMSGenerateLogCorrelationKey();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v4 |= 2u;
  objc_msgSend(v3, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (v4)
  {
    v75 = 138543618;
    v76 = (id)objc_opt_class();
    v77 = 2114;
    v78 = (uint64_t)v74;
    v6 = v76;
    LODWORD(v72) = 22;
    v69 = &v75;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v75, v72);
      v8 = (int *)objc_claimAutoreleasedReturnValue();
      free(v7);
      v69 = v8;
      SSFileLog();

    }
  }
  else
  {

  }
  -[ISOperation uniqueKey](self, "uniqueKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ISUniqueOperationLock((uint64_t)v9, (uint64_t)self, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (objc_msgSend(v11, "success") & 1) != 0
      || (objc_msgSend(v11, "error"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = -[ISOperation shouldFailAfterUniquePredecessorError:](self, "shouldFailAfterUniquePredecessorError:", v12), v12, !v13))
    {
      v21 = 0;
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog", v69);
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v15 |= 2u;
    objc_msgSend(v14, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (v15)
    {
      v17 = (void *)objc_opt_class();
      v75 = 138412290;
      v76 = v17;
      v18 = v17;
      LODWORD(v72) = 12;
      v69 = &v75;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_25:

        objc_msgSend(v11, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISOperation setError:](self, "setError:", v20);

        v21 = 1;
LABEL_27:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v75, v72);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v19);
      v69 = (int *)v16;
      SSFileLog();
    }

    goto LABEL_25;
  }
  v21 = 0;
LABEL_29:
  -[ISOperation powerAssertionIdentifier](self, "powerAssertionIdentifier", v69);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    +[ISDevice sharedInstance](ISDevice, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "takePowerAssertion:", v22);

  }
  else
  {
    v24 = 0;
  }
  if (!-[ISOperation shouldRunWithBackgroundPriority](self, "shouldRunWithBackgroundPriority")
    || (*__error() = 0, v25 = getpriority(3, 0), *__error())
    || setpriority(3, 0, 4096))
  {
    v26 = 0;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54 = objc_msgSend(v53, "shouldLog");
  if (objc_msgSend(v53, "shouldLogToDisk"))
    v54 |= 2u;
  objc_msgSend(v53, "OSLogObject");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
  v57 = v54 & 2;
  if (v56)
    v57 = v54;
  if (!v57)
    goto LABEL_83;
  v58 = (void *)objc_opt_class();
  v59 = v55;
  v60 = v53;
  v61 = v24;
  v62 = v25;
  v63 = (void *)MEMORY[0x24BDD17F0];
  v73 = v58;
  v64 = v63;
  v25 = v62;
  v24 = v61;
  v53 = v60;
  v65 = v59;
  objc_msgSend(v64, "currentThread");
  v66 = objc_claimAutoreleasedReturnValue();
  v75 = 138412546;
  v76 = v58;
  v77 = 2048;
  v78 = v66;
  LODWORD(v72) = 22;
  v70 = &v75;
  v67 = (void *)v66;
  v68 = (void *)_os_log_send_and_compose_impl();

  if (v68)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v68, 4, &v75, v72);
    v55 = objc_claimAutoreleasedReturnValue();
    free(v68);
    v70 = (int *)v55;
    SSFileLog();
LABEL_83:

  }
  v26 = v25 == 0;
LABEL_36:
  -[ISOperation _main:](self, "_main:", v21, v70);
  if (v24)
  {
    +[ISDevice sharedInstance](ISDevice, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "releasePowerAssertion:", v22);

  }
  if (v26)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = objc_msgSend(v28, "shouldLog");
    v30 = objc_msgSend(v28, "shouldLogToDisk");
    objc_msgSend(v28, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30)
      v29 |= 2u;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      v33 = v29;
    else
      v33 = v29 & 2;
    if (v33)
    {
      v34 = (id)objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 138412546;
      v76 = v34;
      v77 = 2048;
      v78 = (uint64_t)v35;
      LODWORD(v72) = 22;
      v71 = &v75;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_50:

        setpriority(3, 0, 0);
        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v75, v72);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      free(v36);
      v71 = (int *)v32;
      SSFileLog();
    }

    goto LABEL_50;
  }
LABEL_51:
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ISUniqueOperationUnlock((uint64_t)v9, (uint64_t)self, v37);

  }
  +[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance", v71);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "checkOutOperation:", self);

  -[ISOperation error](self, "error");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = objc_msgSend(v40, "shouldLog");
    v42 = objc_msgSend(v40, "shouldLogToDisk");
    objc_msgSend(v40, "OSLogObject");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v42)
      v41 |= 2u;
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      v41 &= 2u;
    if (!v41)
      goto LABEL_72;
    v45 = (void *)objc_opt_class();
    v75 = 138543618;
    v76 = v45;
    v77 = 2114;
    v78 = (uint64_t)v74;
    v46 = v45;
    LODWORD(v72) = 22;
    v47 = (void *)_os_log_send_and_compose_impl();

    if (v47)
    {
LABEL_71:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v47, 4, &v75, v72);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      free(v47);
      SSFileLog();
LABEL_72:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v48 = objc_msgSend(v40, "shouldLog");
    v49 = objc_msgSend(v40, "shouldLogToDisk");
    objc_msgSend(v40, "OSLogObject");
    v50 = objc_claimAutoreleasedReturnValue();
    v44 = v50;
    if (v49)
      v48 |= 2u;
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      v48 &= 2u;
    if (!v48)
      goto LABEL_72;
    v51 = (void *)objc_opt_class();
    v75 = 138543618;
    v76 = v51;
    v77 = 2114;
    v78 = (uint64_t)v74;
    v52 = v51;
    LODWORD(v72) = 22;
    v47 = (void *)_os_log_send_and_compose_impl();

    if (v47)
      goto LABEL_71;
  }

}

- (id)copyActivePowerAssertionIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[ISOperation parentOperation](self, "parentOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (id)objc_msgSend(v3, "copyActivePowerAssertionIdentifiers");
  else
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = v5;
  -[ISOperation powerAssertionIdentifier](self, "powerAssertionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);

  return v6;
}

- (id)copySerializationLocks
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ISOperation serializationLockIdentifiers](self, "serializationLockIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    +[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "lockWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)delegateDispatch:(id)a3
{
  void (**v4)(void);
  _QWORD block[4];
  void (**v6)(void);

  v4 = (void (**)(void))a3;
  if (-[ISOperation shouldMessageMainThread](self, "shouldMessageMainThread"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__ISOperation_delegateDispatch___block_invoke;
    block[3] = &unk_24C43C150;
    v6 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v4[2]();
  }

}

uint64_t __32__ISOperation_delegateDispatch___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dispatchCompletionBlock
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[ISOperation completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__ISOperation_dispatchCompletionBlock__block_invoke;
    block[3] = &unk_24C43C128;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __38__ISOperation_dispatchCompletionBlock__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (void)releasePowerAssertionsDuringBlock:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  int *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  int v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v5 = -[ISOperation copyActivePowerAssertionIdentifiers](self, "copyActivePowerAssertionIdentifiers");
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    v9 &= 2u;
  if (v9)
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    v35 = 138412546;
    v36 = v11;
    v37 = 2048;
    v38 = objc_msgSend(v5, "count");
    LODWORD(v24) = 22;
    v23 = &v35;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v35, v24);
      v14 = (int *)objc_claimAutoreleasedReturnValue();
      free(v13);
      v23 = v14;
      SSFileLog();

    }
  }
  else
  {

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(v6, "releasePowerAssertion:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v23);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v16);
  }

  v4[2](v4);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(v6, "takePowerAssertion:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v23);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

}

- (void)run:(BOOL)a3
{
  if (!a3)
    -[ISOperation run](self, "run");
}

- (void)sendDidTakeSerializationLocks
{
  void *v3;
  _QWORD v4[4];
  id v5;
  ISOperation *v6;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __44__ISOperation_sendDidTakeSerializationLocks__block_invoke;
    v4[3] = &unk_24C43C178;
    v5 = v3;
    v6 = self;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v4);

  }
}

uint64_t __44__ISOperation_sendDidTakeSerializationLocks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operationDidTakeSerializationLocks:", *(_QWORD *)(a1 + 40));
}

- (void)sendProgressToDelegate
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ISOperation *v8;
  id v9;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ISOperation lock](self, "lock");
    v4 = (void *)-[SSOperationProgress copy](self->_progress, "copy");
    -[ISOperation unlock](self, "unlock");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__ISOperation_sendProgressToDelegate__block_invoke;
    v6[3] = &unk_24C43C1A0;
    v7 = v3;
    v8 = self;
    v9 = v4;
    v5 = v4;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v6);

  }
}

uint64_t __37__ISOperation_sendProgressToDelegate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:updatedProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSArray)serializationLockIdentifiers
{
  NSArray *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_serializationLockIdentifiers;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)setSerializationLockIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *serializationLockIdentifiers;
  NSArray *v6;

  v6 = (NSArray *)a3;
  -[ISOperation lock](self, "lock");
  if (self->_serializationLockIdentifiers != v6)
  {
    v4 = (NSArray *)-[NSArray copy](v6, "copy");
    serializationLockIdentifiers = self->_serializationLockIdentifiers;
    self->_serializationLockIdentifiers = v4;

  }
  -[ISOperation unlock](self, "unlock");

}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_addSubOperation:(id)a3
{
  id v4;
  NSMutableArray *subOperations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subOperations = self->_subOperations;
  v8 = v4;
  if (!subOperations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subOperations;
    self->_subOperations = v6;

    v4 = v8;
    subOperations = self->_subOperations;
  }
  -[NSMutableArray addObject:](subOperations, "addObject:", v4);

}

- (void)_failAfterException
{
  uint64_t v3;
  id v4;
  id v5;

  -[ISOperation error](self, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    ISError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ISOperation setError:](self, "setError:", v4);
    v3 = (uint64_t)v4;
  }
  v5 = (id)v3;
  -[ISOperation _sendErrorToDelegate:](self, "_sendErrorToDelegate:", v3);

}

- (void)_main:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  SSOperationProgress *v8;
  SSOperationProgress *progress;
  void *v10;
  SSOperationProgress *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISOperation setOperationRunLoop:](self, "setOperationRunLoop:", v5);

  -[ISOperation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ISOperation lock](self, "lock");
    v8 = (SSOperationProgress *)objc_alloc_init(MEMORY[0x24BEB1F40]);
    progress = self->_progress;
    self->_progress = v8;

    -[SSOperationProgress setMaxValue:](self->_progress, "setMaxValue:", 1);
    -[ISOperation unlock](self, "unlock");
    -[ISOperation sendProgressToDelegate](self, "sendProgressToDelegate");
  }
  -[ISOperation _sendWillStartToDelegate](self, "_sendWillStartToDelegate");
  -[ISOperation run:](self, "run:", v3);
  if (-[ISOperation success](self, "success"))
  {
    if ((v7 & 1) != 0)
    {
      -[ISOperation lock](self, "lock");
      -[SSOperationProgress setCurrentValue:](self->_progress, "setCurrentValue:", -[SSOperationProgress maxValue](self->_progress, "maxValue"));
      -[SSOperationProgress setEstimatedTimeRemaining:](self->_progress, "setEstimatedTimeRemaining:", -1.0);
      -[ISOperation unlock](self, "unlock");
      -[ISOperation sendProgressToDelegate](self, "sendProgressToDelegate");
    }
    -[ISOperation _sendSuccessToDelegate](self, "_sendSuccessToDelegate");
  }
  else
  {
    -[ISOperation error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation _sendErrorToDelegate:](self, "_sendErrorToDelegate:", v10);

  }
  -[ISOperation lock](self, "lock");
  v11 = self->_progress;
  self->_progress = 0;

  -[ISOperation unlock](self, "unlock");
  -[ISOperation setOperationRunLoop:](self, "setOperationRunLoop:", 0);
}

- (void)_removeSubOperation:(id)a3
{
  -[NSMutableArray removeObject:](self->_subOperations, "removeObject:", a3);
}

- (void)_sendErrorToDelegate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  ISOperation *v8;
  id v9;

  v4 = a3;
  -[ISOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__ISOperation__sendErrorToDelegate___block_invoke;
    v6[3] = &unk_24C43C1A0;
    v7 = v5;
    v8 = self;
    v9 = v4;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v6);

  }
}

uint64_t __36__ISOperation__sendErrorToDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendSuccessToDelegate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  ISOperation *v6;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __37__ISOperation__sendSuccessToDelegate__block_invoke;
    v4[3] = &unk_24C43C178;
    v5 = v3;
    v6 = self;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v4);

  }
}

uint64_t __37__ISOperation__sendSuccessToDelegate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operationFinished:", *(_QWORD *)(a1 + 40));
}

- (void)_sendWillStartToDelegate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  ISOperation *v6;

  -[ISOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __39__ISOperation__sendWillStartToDelegate__block_invoke;
    v4[3] = &unk_24C43C178;
    v5 = v3;
    v6 = self;
    -[ISOperation delegateDispatch:](self, "delegateDispatch:", v4);

  }
}

uint64_t __39__ISOperation__sendWillStartToDelegate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operationWillStart:", *(_QWORD *)(a1 + 40));
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSRunLoop)operationRunLoop
{
  return (NSRunLoop *)objc_getProperty(self, a2, 272, 1);
}

- (void)setOperationRunLoop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (ISOperation)parentOperation
{
  return (ISOperation *)objc_getProperty(self, a2, 280, 1);
}

- (void)setParentOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSString)powerAssertionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setPowerAssertionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (BOOL)shouldRunWithBackgroundPriority
{
  return self->_shouldRunWithBackgroundPriority;
}

- (void)setShouldRunWithBackgroundPriority:(BOOL)a3
{
  self->_shouldRunWithBackgroundPriority = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_serializationLockIdentifiers, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parentOperation, 0);
  objc_storeStrong((id *)&self->_operationRunLoop, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)loadedURLBagWithContext:(id)a3 accountDSID:(id)a4 returningError:(id *)a5
{
  id v8;
  id v9;
  ISLoadURLBagOperation *v10;
  id v11;
  void *v12;
  id v14;

  v8 = a4;
  v9 = a3;
  v10 = -[ISLoadURLBagOperation initWithBagContext:]([ISLoadURLBagOperation alloc], "initWithBagContext:", v9);

  -[ISLoadURLBagOperation setAccountDSID:](v10, "setAccountDSID:", v8);
  v14 = 0;
  LODWORD(v8) = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v10, &v14);
  v11 = v14;
  v12 = 0;
  if ((_DWORD)v8)
  {
    -[ISLoadURLBagOperation URLBag](v10, "URLBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v11);

  return v12;
}

- (id)loadedURLBagWithContext:(id)a3 returningError:(id *)a4
{
  return -[ISOperation loadedURLBagWithContext:accountDSID:returningError:](self, "loadedURLBagWithContext:accountDSID:returningError:", a3, 0, a4);
}

- (BOOL)loadURLBagWithContext:(id)a3 returningError:(id *)a4
{
  id v6;
  ISLoadURLBagOperation *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  v7 = -[ISLoadURLBagOperation initWithBagContext:]([ISLoadURLBagOperation alloc], "initWithBagContext:", v6);

  v12 = 0;
  v8 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v7, &v12);
  v9 = v12;
  v10 = v9;
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (BOOL)loadSoftwareMapReturningError:(id *)a3
{
  ISLoadSoftwareMapOperation *v5;
  BOOL v6;
  void *v8;

  v8 = 0;
  v5 = objc_alloc_init(ISLoadSoftwareMapOperation);
  v6 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, &v8);

  if (a3)
    *a3 = v8;
  return v6;
}

- (unint64_t)authenticatedAccountCredentialSource
{
  return -[ISOperation authenticatedAccountCredentialSource](-[ISOperation parentOperation](self, "parentOperation"), "authenticatedAccountCredentialSource");
}

- (id)authenticatedAccountDSID
{
  return -[ISOperation authenticatedAccountDSID](-[ISOperation parentOperation](self, "parentOperation"), "authenticatedAccountDSID");
}

- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6
{
  ISStoreAuthenticateOperation *v10;
  id v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v10 = -[ISStoreAuthenticateOperation initWithAuthenticationContext:]([ISStoreAuthenticateOperation alloc], "initWithAuthenticationContext:", a5);
  if (v10)
  {
    if (-[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v10, &v21))
    {
      v11 = -[ISStoreAuthenticateOperation authenticatedAccountDSID](v10, "authenticatedAccountDSID");
      v12 = -[ISOperation authenticatedAccountCredentialSource](v10, "authenticatedAccountCredentialSource");
      v13 = 1;
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v13 = 0;
    }
  }
  else
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    if (!v14)
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v22 = 138543362;
      v23 = objc_opt_class();
      LODWORD(v20) = 12;
      v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v22, v20);
        free(v18);
        SSFileLog();
      }
    }
    v12 = 0;
    v11 = 0;
    v13 = 0;
    v21 = (void *)ISError();
  }

  if (a3)
  {
    *a3 = v11;
    if (!a4)
      goto LABEL_19;
    goto LABEL_18;
  }

  if (a4)
LABEL_18:
    *a4 = v12;
LABEL_19:
  if (a6)
    *a6 = v21;
  return v13;
}

- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byHandlingAuthenticateResponse:(id)a5 returningError:(id *)a6
{
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  id v18;
  unint64_t v19;
  char v20;
  int *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v10 = objc_msgSend(a5, "responseDictionary");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfigOversize");
    if (!v11)
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v13 &= 2u;
    if (v13)
    {
      v25 = 138412546;
      v26 = objc_opt_class();
      v27 = 2112;
      v28 = v10;
      LODWORD(v23) = 22;
      v22 = &v25;
      v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v25, v23);
        free(v15);
        v22 = (int *)v16;
        SSFileLog();
      }
    }
  }
  v17 = +[ISStoreAuthenticateOperation _copyErrorForAuthenticateResponse:error:](ISStoreAuthenticateOperation, "_copyErrorForAuthenticateResponse:error:", a5, &v24, v22);
  if (v17)
  {
    v18 = (id)objc_msgSend((id)objc_msgSend(a5, "authenticatedAccount"), "uniqueIdentifier");
    v19 = objc_msgSend(a5, "credentialSource");
    if (a3)
      goto LABEL_14;
  }
  else
  {
    v19 = 0;
    v18 = 0;
    if (a3)
    {
LABEL_14:
      *a3 = v18;
      if (!a4)
        goto LABEL_16;
      goto LABEL_15;
    }
  }

  if (a4)
LABEL_15:
    *a4 = v19;
LABEL_16:
  if (a6)
    v20 = v17;
  else
    v20 = 1;
  if ((v20 & 1) == 0)
    *a6 = v24;
  return v17;
}

@end
