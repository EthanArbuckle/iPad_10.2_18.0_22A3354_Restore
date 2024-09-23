@implementation SSLazyPromise

- (SSLazyPromise)initWithBlock:(id)a3
{
  id v4;
  SSLazyPromise *v5;
  uint64_t v6;
  id block;
  NSLock *v8;
  NSLock *executeBlockLock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSLazyPromise;
  v5 = -[SSPromise init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    executeBlockLock = v5->_executeBlockLock;
    v5->_executeBlockLock = v8;

  }
  return v5;
}

- (void)addErrorBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SSLazyPromise _runBlock](self, "_runBlock");
  v5.receiver = self;
  v5.super_class = (Class)SSLazyPromise;
  -[SSPromise addErrorBlock:](&v5, sel_addErrorBlock_, v4);

}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SSLazyPromise _runBlock](self, "_runBlock");
  v5.receiver = self;
  v5.super_class = (Class)SSLazyPromise;
  -[SSPromise addSuccessBlock:](&v5, sel_addSuccessBlock_, v4);

}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  -[SSLazyPromise _runBlock](self, "_runBlock");
  v9.receiver = self;
  v9.super_class = (Class)SSLazyPromise;
  -[SSPromise resultBeforeDate:error:](&v9, sel_resultBeforeDate_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resultWithError:(id *)a3
{
  objc_super v6;

  -[SSLazyPromise _runBlock](self, "_runBlock");
  v6.receiver = self;
  v6.super_class = (Class)SSLazyPromise;
  -[SSPromise resultWithError:](&v6, sel_resultWithError_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  objc_super v8;

  -[SSLazyPromise _runBlock](self, "_runBlock");
  v8.receiver = self;
  v8.super_class = (Class)SSLazyPromise;
  -[SSPromise resultWithTimeout:error:](&v8, sel_resultWithTimeout_error_, a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_runBlock
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  void *v12;
  id location;

  -[SSPromise stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[SSPromise stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "condition");

  -[SSPromise stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  if (v5 == 1)
    return 0;
  -[SSLazyPromise executeBlockLock](self, "executeBlockLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  if (-[SSLazyPromise executedBlock](self, "executedBlock"))
  {
    -[SSLazyPromise executeBlockLock](self, "executeBlockLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

    return 0;
  }
  objc_initWeak(&location, self);
  -[SSLazyPromise block](self, "block");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(&location);
  ((void (**)(_QWORD, id))v10)[2](v10, v11);

  -[SSLazyPromise setExecutedBlock:](self, "setExecutedBlock:", 1);
  -[SSLazyPromise executeBlockLock](self, "executeBlockLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)executedBlock
{
  return self->_executedBlock;
}

- (void)setExecutedBlock:(BOOL)a3
{
  self->_executedBlock = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSLock)executeBlockLock
{
  return self->_executeBlockLock;
}

- (void)setExecuteBlockLock:(id)a3
{
  objc_storeStrong((id *)&self->_executeBlockLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executeBlockLock, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
