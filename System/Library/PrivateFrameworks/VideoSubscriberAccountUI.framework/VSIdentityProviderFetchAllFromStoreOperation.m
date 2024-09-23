@implementation VSIdentityProviderFetchAllFromStoreOperation

- (VSIdentityProviderFetchAllFromStoreOperation)init
{
  VSIdentityProviderFetchAllFromStoreOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  NSOperationQueue *v5;
  NSOperationQueue *privateQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderFetchAllFromStoreOperation;
  v2 = -[VSIdentityProviderFetchAllFromStoreOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v5;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSIdentityProviderFetchAllFromStoreOperation"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v2;
}

- (void)executionDidBegin
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  VSFeaturedIdentityProviderLimitingOperation *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(id *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  -[VSIdentityProviderFetchAllFromStoreOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDF8B48]);
  objc_msgSend(v4, "setRequestType:", 0);
  objc_msgSend(v4, "setMethodName:", *MEMORY[0x24BDF8D18]);
  -[VSIdentityProviderFetchAllFromStoreOperation auditToken](self, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuditToken:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8B50]), "initWithRequest:", v4);
  objc_msgSend(v3, "addOperation:", v6);
  v7 = objc_alloc_init(VSFeaturedIdentityProviderLimitingOperation);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  v8 = (void *)MEMORY[0x24BDD1478];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke;
  v15 = &unk_24FE19BD0;
  v9 = v6;
  v16 = v9;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v10 = v3;
  v17 = v10;
  objc_msgSend(v8, "blockOperationWithBlock:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDependency:", v9, v12, v13, v14, v15);
  objc_msgSend(v10, "addOperation:", v11);
  -[VSFeaturedIdentityProviderLimitingOperation addDependency:](v7, "addDependency:", v11);
  objc_msgSend(v10, "addOperation:", v7);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSAMSIdentityProviderResponseValueTransformer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transformedValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_2;
  v9[3] = &unk_24FE19BA8;
  objc_copyWeak(&v11, a1 + 6);
  objc_copyWeak(&v12, a1 + 7);
  v10 = a1[5];
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4;
  v7[3] = &unk_24FE199F8;
  objc_copyWeak(&v8, a1 + 7);
  objc_msgSend(v5, "unwrapObject:error:", v9, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);

}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "setUnlimitedIdentityProviders:", v3);
  v5 = (void *)MEMORY[0x24BDD1478];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_3;
  v11 = &unk_24FE19B80;
  objc_copyWeak(&v13, a1 + 6);
  v6 = WeakRetained;
  v12 = v6;
  objc_msgSend(v5, "blockOperationWithBlock:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDependency:", v6, v8, v9, v10, v11);
  objc_msgSend(a1[4], "addOperation:", v7);

  objc_destroyWeak(&v13);
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)MEMORY[0x24BDF8C38];
  v3 = (void *)MEMORY[0x24BDF8BF0];
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "failableWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v7);

  objc_msgSend(WeakRetained, "finishExecutionIfPossible");
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4_cold_1((uint64_t)v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v8);

  objc_msgSend(WeakRetained, "finishExecutionIfPossible");
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderFetchAllFromStoreOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSIdentityProviderFetchAllFromStoreOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

void __65__VSIdentityProviderFetchAllFromStoreOperation_executionDidBegin__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Unable to transform response: %@", (uint8_t *)&v2, 0xCu);
}

@end
