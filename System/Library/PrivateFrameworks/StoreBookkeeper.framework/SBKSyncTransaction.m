@implementation SBKSyncTransaction

- (SBKSyncTransaction)initWithSyncRequestURL:(id)a3 domain:(id)a4 syncAnchor:(id)a5 keysToUpdate:(id)a6 keysToDelete:(id)a7 conflictDetectionType:(int64_t)a8
{
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  SBKSyncTransaction *v19;
  SBKSyncTransaction *v20;
  __CFString *v21;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = (__CFString *)a5;
  v17 = a6;
  v18 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBKSyncTransaction;
  v19 = -[SBKTransaction init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_syncRequestURL, a3);
    objc_storeStrong((id *)&v20->_domain, a4);
    if (v16)
      v21 = v16;
    else
      v21 = CFSTR("0");
    objc_storeStrong((id *)&v20->_syncAnchor, v21);
    objc_storeStrong((id *)&v20->_keysToUpdate, a6);
    objc_storeStrong((id *)&v20->_keysToDelete, a7);
    v20->_conflictDetectionType = a8;
    v20->_type = 1;
  }

  return v20;
}

- (SBKSyncTransaction)initWithStoreBagContext:(id)a3 syncAnchor:(id)a4 keysToUpdate:(id)a5 keysToDelete:(id)a6 conflictDetectionType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  SBKSyncTransaction *v18;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "syncRequestURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SBKSyncTransaction initWithSyncRequestURL:domain:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:](self, "initWithSyncRequestURL:domain:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:", v16, v17, v14, v13, v12, a7);
  return v18;
}

- (id)clampsKey
{
  void *v3;
  int64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SBKSyncTransaction type](self, "type");
  -[SBKSyncTransaction transactionProcessor](self, "transactionProcessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKSyncTransaction keysToUpdate](self, "keysToUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lld-%@-%lld"), v4, v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)domain
{
  return self->_domain;
}

- (id)requestURL
{
  return self->_syncRequestURL;
}

- (id)newRequest
{
  +[SBKSyncRequest requestForTransaction:](SBKSyncRequest, "requestForTransaction:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_validateTransactionProcessor:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 81, CFSTR("Invalid processor"));

    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 82, CFSTR("Invalid processor"));

    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 83, CFSTR("Invalid processor"));

    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 84, CFSTR("Invalid processor"));

    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 85, CFSTR("Invalid processor"));

    }
    if (-[SBKSyncTransaction conflictDetectionType](self, "conflictDetectionType")
      && (objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 88, CFSTR("Invalid processor"));

    }
  }
  else
  {
    -[SBKSyncTransaction conflictDetectionType](self, "conflictDetectionType");
  }

}

- (void)setTransactionProcessor:(id)a3
{
  id obj;

  obj = a3;
  -[SBKSyncTransaction _validateTransactionProcessor:](self, "_validateTransactionProcessor:", obj);
  objc_storeWeak((id *)&self->_transactionProcessor, obj);

}

- (SBKSyncTransactionProcessing)transactionProcessor
{
  return (SBKSyncTransactionProcessing *)objc_loadWeakRetained((id *)&self->_transactionProcessor);
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  if (-[SBKSyncTransaction type](self, "type") == 1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[SBKSyncTransaction syncAnchor](self, "syncAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SYNC: anchor=%@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[NSArray count](self->_keysToDelete, "count"))
    {
      -[NSArray componentsJoinedByString:](self->_keysToDelete, "componentsJoinedByString:", CFSTR(", "));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(", deletes=%@"), v6);

    }
    if (-[NSArray count](self->_keysToUpdate, "count"))
    {
      -[NSArray componentsJoinedByString:](self->_keysToUpdate, "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(", updates=%@"), v8);

    }
  }
  else
  {
    v5 = CFSTR("????");
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)SBKSyncTransaction;
  -[SBKSyncTransaction description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ domain = %@, %@"), v11, self->_domain, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)conflictDetectionOrdinalForKey:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v9;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncTransaction.m"), 124, CFSTR("transactions using conflict detection must supply a conflict ordinal"));

  }
  objc_msgSend(WeakRetained, "transaction:conflictDetectionOrdinalForKey:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)keyValuePairForUpdatedKey:(id)a3
{
  SBKSyncTransactionProcessing **p_transactionProcessor;
  id v5;
  id WeakRetained;
  void *v7;

  p_transactionProcessor = &self->_transactionProcessor;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_transactionProcessor);
  objc_msgSend(WeakRetained, "transaction:keyValuePairForUpdatedKey:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)syncAnchor
{
  id WeakRetained;
  char v4;
  NSString *syncAnchor;
  NSString *v6;
  NSString *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  v4 = objc_opt_respondsToSelector();
  syncAnchor = self->_syncAnchor;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "transaction:syncAnchorForTransactionSyncAnchor:", self, syncAnchor);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = syncAnchor;
  }
  v7 = v6;

  return v7;
}

- (int64_t)conflictDetectionType
{
  id WeakRetained;
  char v4;
  uint64_t conflictDetectionType;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  v4 = objc_opt_respondsToSelector();
  conflictDetectionType = self->_conflictDetectionType;
  if ((v4 & 1) != 0)
    conflictDetectionType = objc_msgSend(WeakRetained, "transaction:conflictDetectionTypeForTransactionDetectionType:", self, self->_conflictDetectionType);

  return conflictDetectionType;
}

- (NSArray)keysToUpdate
{
  id WeakRetained;
  char v4;
  NSArray *keysToUpdate;
  NSArray *v6;
  NSArray *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  v4 = objc_opt_respondsToSelector();
  keysToUpdate = self->_keysToUpdate;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "transaction:keysForTransactionForTransactionKeysToUpdate:", self, keysToUpdate);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = keysToUpdate;
  }
  v7 = v6;

  return v7;
}

- (NSArray)keysToDelete
{
  id WeakRetained;
  char v4;
  NSArray *keysToDelete;
  NSArray *v6;
  NSArray *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  v4 = objc_opt_respondsToSelector();
  keysToDelete = self->_keysToDelete;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "transaction:keysForTransactionForTransactionKeysToDelete:", self, keysToDelete);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = keysToDelete;
  }
  v7 = v6;

  return v7;
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  id WeakRetained;
  SBKSyncResponseDataKeyEnumerator *v11;
  id v12;
  void (**v13)(id, _QWORD);
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v6, "syncResponseData"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_21E4FD000, v9, OS_LOG_TYPE_ERROR, "WARNING: Invalid response (%@).  Skipping...", buf, 0xCu);
    }

    v7[2](v7, 0);
    v8 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  objc_msgSend(WeakRetained, "transaction:willProcessResponseData:", self, v8);

  v11 = -[SBKSyncResponseDataKeyEnumerator initWithResponseData:]([SBKSyncResponseDataKeyEnumerator alloc], "initWithResponseData:", v8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__SBKSyncTransaction_processDataInResponse_withCompletionHandler___block_invoke;
  v14[3] = &unk_24E2A8028;
  v14[4] = self;
  v15 = v8;
  v16 = v7;
  v12 = v8;
  v13 = v7;
  -[SBKSyncResponseDataKeyEnumerator enumerateKeysInResponseForTransaction:completionBlock:](v11, "enumerateKeysInResponseForTransaction:completionBlock:", self, v14);

}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)syncRequestURL
{
  return self->_syncRequestURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncRequestURL, 0);
  objc_destroyWeak((id *)&self->_transactionProcessor);
  objc_storeStrong((id *)&self->_keysToDelete, 0);
  objc_storeStrong((id *)&self->_keysToUpdate, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
}

uint64_t __66__SBKSyncTransaction_processDataInResponse_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  objc_msgSend(WeakRetained, "transaction:didProcessResponseData:", a1[4], a1[5]);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
