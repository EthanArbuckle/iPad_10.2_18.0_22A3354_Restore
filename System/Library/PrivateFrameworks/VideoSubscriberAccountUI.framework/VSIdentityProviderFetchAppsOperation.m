@implementation VSIdentityProviderFetchAppsOperation

- (VSIdentityProviderFetchAppsOperation)initWithProviderIdentifier:(id)a3 andType:(unint64_t)a4
{
  id v7;
  VSIdentityProviderFetchAppsOperation *v8;
  VSOptional *v9;
  VSOptional *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  NSOperationQueue *privateQueue;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSIdentityProviderFetchAppsOperation;
  v8 = -[VSIdentityProviderFetchAppsOperation init](&v17, sel_init);
  if (v8)
  {
    v9 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v10 = v8->_result;
    v8->_result = v9;

    objc_storeStrong((id *)&v8->_providerIdentifier, a3);
    v8->_requestType = a4;
    v11 = (void *)MEMORY[0x24BDD1710];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queueWithName:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = (NSOperationQueue *)v14;

  }
  return v8;
}

- (void)executionDidBegin
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  VSIdentityProviderFetchAppsOperation *v16;
  id v17;
  id v18;
  _QWORD v19[5];

  -[VSIdentityProviderFetchAppsOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke;
  v19[3] = &unk_24FE19778;
  v19[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF8B48]);
  objc_msgSend(v6, "setMethodName:", *MEMORY[0x24BDF8D18]);
  objc_msgSend(v6, "setRequestType:", -[VSIdentityProviderFetchAppsOperation requestType](self, "requestType"));
  -[VSIdentityProviderFetchAppsOperation providerIdentifier](self, "providerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProviderIdentifier:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8B50]), "initWithRequest:", v6);
  objc_msgSend(v3, "addOperation:", v8);
  v9 = (void *)MEMORY[0x24BDD1478];
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_2;
  v14[3] = &unk_24FE1A0B8;
  v15 = v8;
  v16 = self;
  v17 = v5;
  v18 = v3;
  v10 = v3;
  v11 = v5;
  v12 = v8;
  objc_msgSend(v9, "blockOperationWithBlock:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addDependency:", v12);
  objc_msgSend(v10, "addOperation:", v13);

}

uint64_t __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSAMSChannelAppsResponseValueTransformer"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformedValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_3;
  v9[3] = &unk_24FE1A070;
  v5 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v4, "unwrapObject:error:", v9, &__block_literal_global_6);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResult:", v7);

  objc_msgSend(*(id *)(a1 + 56), "addOperation:", *(_QWORD *)(a1 + 48));
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_3(id *a1, void *a2)
{
  VSLoadAllAppIconsOperation *v3;
  id v4;

  objc_msgSend(a2, "allApps");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "shouldFetchImages"))
  {
    v3 = -[VSLoadAllAppIconsOperation initWithApps:shouldPrecomposeIcon:]([VSLoadAllAppIconsOperation alloc], "initWithApps:shouldPrecomposeIcon:", v4, objc_msgSend(a1[4], "shouldPrecomposeIcon"));
    objc_msgSend(a1[5], "addDependency:", v3);
    objc_msgSend(a1[6], "addOperation:", v3);

  }
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_4_cold_1((uint64_t)v2, v3);

}

- (NSString)identityProviderID
{
  return self->_identityProviderID;
}

- (void)setIdentityProviderID:(id)a3
{
  objc_storeStrong((id *)&self->_identityProviderID, a3);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BOOL)shouldFetchImages
{
  return self->_shouldFetchImages;
}

- (void)setShouldFetchImages:(BOOL)a3
{
  self->_shouldFetchImages = a3;
}

- (BOOL)shouldPrecomposeIcon
{
  return self->_shouldPrecomposeIcon;
}

- (void)setShouldPrecomposeIcon:(BOOL)a3
{
  self->_shouldPrecomposeIcon = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_providerIdentifier, a3);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_identityProviderID, 0);
}

void __57__VSIdentityProviderFetchAppsOperation_executionDidBegin__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Error Transforming AppChannelMappings: %@", (uint8_t *)&v2, 0xCu);
}

@end
