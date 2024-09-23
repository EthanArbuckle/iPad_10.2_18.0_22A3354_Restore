@implementation SSObservable

- (SSObservable)init
{
  SSObservable *v2;
  uint64_t v3;
  NSString *logKey;
  NSMutableArray *v5;
  NSMutableArray *observers;
  NSMutableArray *v7;
  NSMutableArray *queuedResults;
  dispatch_queue_t v9;
  OS_dispatch_queue *sendMessageQueue;
  uint64_t v11;
  NSConditionLock *stateLock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SSObservable;
  v2 = -[SSObservable init](&v14, sel_init);
  if (v2)
  {
    SSGenerateLogCorrelationString();
    v3 = objc_claimAutoreleasedReturnValue();
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v2->_observers;
    v2->_observers = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queuedResults = v2->_queuedResults;
    v2->_queuedResults = v7;

    v9 = dispatch_queue_create("coma.apple.StoreServices.SSObservable.sendMessage", MEMORY[0x1E0C80D50]);
    sendMessageQueue = v2->_sendMessageQueue;
    v2->_sendMessageQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v11;

  }
  return v2;
}

+ (id)observableWithObserver:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "subscribe:", v3);

  return v4;
}

+ (id)observableWithObservers:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "subscribe:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isCancelled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[SSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[SSObservable _isComplete](self, "_isComplete"))
  {
    v4 = (void *)objc_opt_class();
    -[SSObservable failureError](self, "failureError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "_errorIsCanceledError:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[SSObservable stateLock](self, "stateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (BOOL)isComplete
{
  void *v3;
  void *v4;

  -[SSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = -[SSObservable _isComplete](self, "_isComplete");
  -[SSObservable stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (BOOL)cancel
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SSObservable sendFailure:](self, "sendFailure:", v3);

  return (char)self;
}

- (BOOL)sendCompletion
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[SSObservable stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[SSObservable stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "condition");

  if (v5 == 1)
  {
    SSObservableLogConfig();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      v18 &= 2u;
    if (v18)
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      -[SSObservable logKey](self, "logKey");
      v36 = 138543618;
      v37 = v20;
      v38 = 2114;
      v39 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 22;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_21:

        -[SSObservable stateLock](self, "stateLock");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unlock");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v36, v30);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog(v16, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v19);
    }

    goto LABEL_21;
  }
  -[SSObservable observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[SSObservable stateLock](self, "stateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlockWithCondition:", 1);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[SSObservable sendMessageQueue](self, "sendMessageQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_sendCompletionUsingQueue:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

LABEL_22:
  return v5 != 1;
}

- (BOOL)sendFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    SSObservableLogConfig();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      v20 &= 2u;
    if (v20)
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      -[SSObservable logKey](self, "logKey");
      v38 = 138543618;
      v39 = v22;
      v40 = 2114;
      v41 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 22;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_21:

        -[SSObservable stateLock](self, "stateLock");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unlock");
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v38, v32);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog(v18, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v21);
    }

    goto LABEL_21;
  }
  -[SSObservable setFailureError:](self, "setFailureError:", v4);
  -[SSObservable observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[SSObservable stateLock](self, "stateLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlockWithCondition:", 1);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[SSObservable sendMessageQueue](self, "sendMessageQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_sendFailure:usingQueue:", v4, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

LABEL_22:
  return v7 != 1;
}

- (BOOL)sendResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  int v31;
  NSObject *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  NSObject *v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  void *v74;
  int *v76;
  uint64_t v77;
  void *v78;
  id v79;
  id obj;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  int v94;
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    SSObservableLogConfig();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v10 &= 2u;
    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      -[SSObservable logKey](self, "logKey");
      v94 = 138543618;
      v95 = v12;
      v96 = 2114;
      v97 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v77) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        -[SSObservable stateLock](self, "stateLock");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "unlock");
        v22 = 0;
        goto LABEL_58;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v94, v77);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_13;
  }
  -[SSObservable queuedResults](self, "queuedResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v4);

  -[SSObservable queuedResults](self, "queuedResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v24, "copy");

  -[SSObservable observers](self, "observers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");

  v82 = v26;
  v27 = objc_msgSend(v26, "count");
  SSObservableLogConfig();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (!v27)
  {
    if (!v28)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = objc_msgSend(v29, "shouldLog");
    if (objc_msgSend(v29, "shouldLogToDisk"))
      v47 = v46 | 2;
    else
      v47 = v46;
    objc_msgSend(v29, "OSLogObject");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      v49 = v47;
    else
      v49 = v47 & 2;
    if (v49)
    {
      v50 = v21;
      v51 = v4;
      v52 = (void *)objc_opt_class();
      v53 = v52;
      -[SSObservable logKey](self, "logKey");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = 138543618;
      v95 = v52;
      v96 = 2114;
      v97 = v54;
      LODWORD(v77) = 22;
      v76 = &v94;
      v55 = (void *)_os_log_send_and_compose_impl();

      if (v55)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v55, 4, &v94, v77);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        free(v55);
        SSFileLog(v29, CFSTR("%@"), v57, v58, v59, v60, v61, v62, (uint64_t)v56);

      }
      v4 = v51;
      v21 = v50;
    }
    else
    {

    }
    goto LABEL_41;
  }
  if (!v28)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = objc_msgSend(v29, "shouldLog");
  if (objc_msgSend(v29, "shouldLogToDisk"))
    v31 = v30 | 2;
  else
    v31 = v30;
  objc_msgSend(v29, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    v33 = v31;
  else
    v33 = v31 & 2;
  if (!v33)
    goto LABEL_26;
  v34 = v21;
  v35 = (void *)objc_opt_class();
  v36 = v4;
  v37 = v35;
  -[SSObservable logKey](self, "logKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 138543618;
  v95 = v35;
  v21 = v34;
  v96 = 2114;
  v97 = v38;
  LODWORD(v77) = 22;
  v76 = &v94;
  v39 = (void *)_os_log_send_and_compose_impl();

  v4 = v36;
  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v39, 4, &v94, v77);
    v32 = objc_claimAutoreleasedReturnValue();
    free(v39);
    SSFileLog(v29, CFSTR("%@"), v40, v41, v42, v43, v44, v45, (uint64_t)v32);
LABEL_26:

  }
  -[SSObservable queuedResults](self, "queuedResults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeAllObjects");
LABEL_41:

  -[SSObservable stateLock](self, "stateLock");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "unlock");

  v64 = objc_msgSend(v82, "count");
  v22 = v64 != 0;
  if (v64)
  {
    v78 = v21;
    v79 = v4;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v21;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
    if (v83)
    {
      v81 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v89 != v81)
            objc_enumerationMutation(obj);
          v66 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v67 = v82;
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          if (v68)
          {
            v69 = v68;
            v70 = *(_QWORD *)v85;
            do
            {
              for (j = 0; j != v69; ++j)
              {
                if (*(_QWORD *)v85 != v70)
                  objc_enumerationMutation(v67);
                v72 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
                v73 = (void *)objc_msgSend(v66, "copy", v76);
                -[SSObservable sendMessageQueue](self, "sendMessageQueue");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "_sendResult:usingQueue:", v73, v74);

              }
              v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
            }
            while (v69);
          }

        }
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
      }
      while (v83);
    }

    v21 = v78;
    v4 = v79;
    v22 = 1;
  }

LABEL_58:
  return v22;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t i;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  int *v56;
  uint64_t v57;
  id v58;
  id obj;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  int v73;
  void *v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSObservable stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SSObservable stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "condition");

  if (v7 == 1)
  {
    SSObservableLogConfig();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v10 &= 2u;
    if (!v10)
      goto LABEL_22;
    goto LABEL_20;
  }
  -[SSObservable observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  if (v13)
  {
    SSObservableLogConfig();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v15 &= 2u;
    if (!v15)
      goto LABEL_22;
LABEL_20:
    v16 = (void *)objc_opt_class();
    v17 = v16;
    -[SSObservable logKey](self, "logKey");
    v73 = 138543618;
    v74 = v16;
    v75 = 2114;
    v76 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 22;
    v18 = (void *)_os_log_send_and_compose_impl();

    if (!v18)
    {
LABEL_23:

      -[SSObservable stateLock](self, "stateLock");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unlock");
      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v73, v57);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog(v8, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v11);
LABEL_22:

    goto LABEL_23;
  }
  -[SSObservable observers](self, "observers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v4);

  -[SSObservable queuedResults](self, "queuedResults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");

  -[SSObservable queuedResults](self, "queuedResults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeAllObjects");

  v58 = v4;
  if (!objc_msgSend(v28, "count"))
  {
    v61 = 0;
    goto LABEL_38;
  }
  SSObservableLogConfig();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = objc_msgSend(v30, "shouldLog");
  if (objc_msgSend(v30, "shouldLogToDisk"))
    v32 = v31 | 2;
  else
    v32 = v31;
  objc_msgSend(v30, "OSLogObject");
  v33 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    v32 &= 2u;
  if (!v32)
    goto LABEL_35;
  v34 = (void *)objc_opt_class();
  v35 = v34;
  -[SSObservable logKey](self, "logKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 138543618;
  v74 = v34;
  v75 = 2114;
  v76 = v36;
  LODWORD(v57) = 22;
  v56 = &v73;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v73, v57);
    v33 = objc_claimAutoreleasedReturnValue();
    free(v37);
    SSFileLog(v30, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v33);
LABEL_35:

  }
  -[SSObservable observers](self, "observers");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v44, "copy");

LABEL_38:
  -[SSObservable stateLock](self, "stateLock", v56);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "unlock");

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v25 = v28;
  v62 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v62)
  {
    obj = v25;
    v60 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v68 != v60)
          objc_enumerationMutation(obj);
        v47 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v48 = v61;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v50; ++j)
            {
              if (*(_QWORD *)v64 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
              v54 = (void *)objc_msgSend(v47, "copy");
              -[SSObservable sendMessageQueue](self, "sendMessageQueue");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "_sendResult:usingQueue:", v54, v55);

            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          }
          while (v50);
        }

      }
      v25 = obj;
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v62);
  }

  v4 = v58;
LABEL_53:

}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v5 = objc_msgSend(v3, "code") == 3072;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isComplete
{
  void *v2;
  BOOL v3;

  -[SSObservable stateLock](self, "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition") == 1;

  return v3;
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(id)a3
{
  objc_storeStrong((id *)&self->_failureError, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableArray)queuedResults
{
  return self->_queuedResults;
}

- (void)setQueuedResults:(id)a3
{
  objc_storeStrong((id *)&self->_queuedResults, a3);
}

- (OS_dispatch_queue)sendMessageQueue
{
  return self->_sendMessageQueue;
}

- (void)setSendMessageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sendMessageQueue, a3);
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_stateLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_sendMessageQueue, 0);
  objc_storeStrong((id *)&self->_queuedResults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_failureError, 0);
}

@end
