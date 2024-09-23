@implementation SBKTransactionURLOperation

- (SBKTransactionURLOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKTransactionURLOperation.m"), 43, CFSTR("Use +operationWithRequest:delegate:"));

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBKTransactionURLOperation;
  return -[ISStoreURLOperation init](&v3, sel_init);
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  *(&self->_shouldAuthenticate + 1) = a3;
  -[ISStoreURLOperation setNeedsAuthentication:](self, "setNeedsAuthentication:");
  v4 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21E4FD000, v4, OS_LOG_TYPE_DEFAULT, "[StoreBookkeeper] setting up an authentication context - will FORCE authentication!", v10, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BEC8C80]));
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "account");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v7);
  objc_msgSend(v9, "setPromptStyle:", 1);
  objc_msgSend(v9, "setAllowsSilentAuthentication:", 1);
  -[ISURLOperation setAuthenticationContext:](self, "setAuthenticationContext:", v9);

}

- (BOOL)shouldAuthenticate
{
  return *(&self->_shouldAuthenticate + 1);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ISURLOperation requestProperties](self, "requestProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (PrimaryURL: %@)"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBKRequest)SBKRequest
{
  return self->_SBKRequest;
}

- (void)setSBKRequest:(id)a3
{
  objc_storeStrong((id *)&self->_SBKRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SBKRequest, 0);
}

+ (id)operationWithRequest:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = -[SBKTransactionURLOperation _init]([SBKTransactionURLOperation alloc], "_init");
  objc_msgSend(v7, "setDelegate:", v5);

  v8 = (void *)objc_msgSend(v6, "copyRequestProperties");
  objc_msgSend(v7, "setRequestProperties:", v8);

  objc_msgSend(v7, "setShouldMessageMainThread:", 0);
  objc_msgSend(v7, "setQueuePriority:", 8);
  objc_msgSend(v7, "setShouldAuthenticate:", objc_msgSend(v6, "shouldAuthenticate"));
  objc_msgSend(v6, "responseDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataProvider:", v9);

  objc_msgSend(v7, "setSBKRequest:", v6);
  return v7;
}

@end
