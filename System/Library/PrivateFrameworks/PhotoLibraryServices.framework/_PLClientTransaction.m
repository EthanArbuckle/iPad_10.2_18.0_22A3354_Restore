@implementation _PLClientTransaction

- (void)persistTransactionScopes:(id)a3
{
  void *v3;

  +[PLClientServerTransaction scopeValuesFromScopes:](PLClientServerTransaction, "scopeValuesFromScopes:", a3);
  +[_PLClientTransaction _fdIsolationQueue](_PLClientTransaction, "_fdIsolationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_sync();

}

+ (id)_fdIsolationQueue
{
  pl_dispatch_once();
  return (id)_fdIsolationQueue_sQueue;
}

- (_PLClientTransaction)initWithPathManager:(id)a3 identifier:(const char *)a4
{
  _PLClientTransaction *v5;
  _PLClientTransaction *v6;
  PLProcessAssertion *v7;
  id processAssertion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PLClientTransaction;
  v5 = -[PLClientServerTransaction initWithPathManager:](&v10, sel_initWithPathManager_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_fileDescriptor = -1;
    if (PLIsAssetsd())
    {
      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", a4);
      v7 = (PLProcessAssertion *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = -[PLProcessAssertion initWithIdentifier:]([PLProcessAssertion alloc], "initWithIdentifier:", CFSTR("com.apple.photos.clientServerTransaction"));
    }
    processAssertion = v6->_processAssertion;
    v6->_processAssertion = v7;

    -[_PLClientTransaction setChangeScopesDescriptionSnapshot:](v6, "setChangeScopesDescriptionSnapshot:", CFSTR("(unavailable)"));
  }
  return v6;
}

- (void)setChangeScopesDescriptionSnapshot:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

- (void)setFdResourceSemaphore:(id)a3
{
  objc_storeWeak((id *)&self->_fdResourceSemaphore, a3);
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _PLClientTransaction *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _PLClientTransaction *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLClientServerTransactionsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "%@ : %@", buf, 0x16u);

  }
  +[_PLClientTransaction _fdIsolationQueue](_PLClientTransaction, "_fdIsolationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __31___PLClientTransaction_dealloc__block_invoke;
  v11 = &unk_1E3677AA0;
  v12 = self;
  pl_dispatch_sync();

  v7.receiver = self;
  v7.super_class = (Class)_PLClientTransaction;
  -[_PLClientTransaction dealloc](&v7, sel_dealloc);
}

- (void)completeTransaction
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  _PLClientTransaction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLClientServerTransactionsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "%@ : %@", buf, 0x16u);

  }
  +[_PLClientTransaction _fdIsolationQueue](_PLClientTransaction, "_fdIsolationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_sync();

}

- (id)changeScopes
{
  return self->_changeScopes;
}

- (void)addChangeScopes:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *changeScopes;
  NSSet *v8;
  NSSet *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    -[_PLClientTransaction changeScopes](self, "changeScopes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count") || (objc_msgSend(v10, "isSubsetOfSet:", v4) & 1) == 0)
    {
      if (v4)
      {
        objc_msgSend(v4, "setByAddingObjectsFromSet:", v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (NSSet *)objc_msgSend(v5, "copy");
        changeScopes = self->_changeScopes;
        self->_changeScopes = v6;

        -[_PLClientTransaction _updateChangeScopesDescriptionSnapshot](self, "_updateChangeScopesDescriptionSnapshot");
      }
      else
      {
        v8 = (NSSet *)objc_msgSend(v10, "copy");
        v9 = self->_changeScopes;
        self->_changeScopes = v8;

        -[_PLClientTransaction _updateChangeScopesDescriptionSnapshot](self, "_updateChangeScopesDescriptionSnapshot");
      }
      if (!self->_addChangeScopesBatch)
        -[_PLClientTransaction persistTransactionScopes:](self, "persistTransactionScopes:", self->_changeScopes);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeScopesDescriptionSnapshot, 0);
  objc_destroyWeak((id *)&self->_fdResourceSemaphore);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_batchScopes, 0);
  objc_storeStrong((id *)&self->_changeScopes, 0);
  objc_storeStrong(&self->_processAssertion, 0);
}

+ (id)_fdResourceSemaphore
{
  pl_dispatch_once();
  return (id)_fdResourceSemaphore_fdResourceSem;
}

- (_PLClientTransaction)initWithPathManager:(id)a3
{
  id v4;
  _PLClientTransaction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PFMethodNotImplementedException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)pushChangeScopesBatch
{
  NSSet *changeScopes;
  NSSet *v4;
  NSSet *batchScopes;

  ++self->_addChangeScopesBatch;
  if (!self->_batchScopes)
  {
    changeScopes = self->_changeScopes;
    if (changeScopes)
    {
      v4 = (NSSet *)-[NSSet copy](changeScopes, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    batchScopes = self->_batchScopes;
    self->_batchScopes = v4;

  }
}

- (void)popChangeScopesBatch
{
  int64_t v2;
  NSSet *batchScopes;

  v2 = self->_addChangeScopesBatch - 1;
  self->_addChangeScopesBatch = v2;
  if (!v2)
  {
    if (self->_changeScopes)
    {
      if (!-[NSSet isEqualToSet:](self->_batchScopes, "isEqualToSet:"))
        -[_PLClientTransaction persistTransactionScopes:](self, "persistTransactionScopes:", self->_changeScopes);
    }
    batchScopes = self->_batchScopes;
    self->_batchScopes = 0;

  }
}

- (BOOL)isClientTransaction
{
  return 1;
}

- (void)abortTransaction
{
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  _PLClientTransaction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLClientServerTransactionsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "%@ : %@", (uint8_t *)&v7, 0x16u);

  }
  if ((-[_PLClientTransaction fileDescriptor](self, "fileDescriptor") & 0x80000000) == 0)
  {
    -[_PLClientTransaction path](self, "path");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    unlink((const char *)objc_msgSend(v6, "fileSystemRepresentation"));

  }
}

- (id)generateChangeScopesDescription
{
  void *v2;
  void *v3;

  -[_PLClientTransaction changeScopes](self, "changeScopes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id processAssertion;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_PLClientTransaction;
  -[_PLClientTransaction description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientServerTransaction transactionToken](self, "transactionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PLClientTransaction fileDescriptor](self, "fileDescriptor");
  processAssertion = self->_processAssertion;
  -[_PLClientTransaction changeScopesDescriptionSnapshot](self, "changeScopesDescriptionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, fd %d, %@ %@"), v4, v5, v6, processAssertion, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (NSString)path
{
  return self->_path;
}

- (OS_dispatch_semaphore)fdResourceSemaphore
{
  return (OS_dispatch_semaphore *)objc_loadWeakRetained((id *)&self->_fdResourceSemaphore);
}

- (NSString)changeScopesDescriptionSnapshot
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

@end
