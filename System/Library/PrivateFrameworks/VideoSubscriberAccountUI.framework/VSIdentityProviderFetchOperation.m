@implementation VSIdentityProviderFetchOperation

- (VSIdentityProviderFetchOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSIdentityProviderFetchOperation)initWithIdentityProviderID:(id)a3
{
  id v4;
  VSIdentityProviderFetchOperation *v5;
  VSIdentityProviderFetchOperation *v6;
  uint64_t v7;
  NSString *identityProviderID;
  objc_super v10;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The identityProviderID parameter must not be nil."));
  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderFetchOperation;
  v5 = -[VSIdentityProviderFetchOperation init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    commonInit_2(v5);
    v7 = objc_msgSend(v4, "copy");
    identityProviderID = v6->_identityProviderID;
    v6->_identityProviderID = (NSString *)v7;

  }
  return v6;
}

- (VSIdentityProviderFetchOperation)initWithIdentityProviderUniqueID:(id)a3
{
  id v5;
  VSIdentityProviderFetchOperation *v6;
  VSIdentityProviderFetchOperation *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The identityProviderUniqueID parameter must not be nil."));
  v9.receiver = self;
  v9.super_class = (Class)VSIdentityProviderFetchOperation;
  v6 = -[VSIdentityProviderFetchOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    commonInit_2(v6);
    objc_storeStrong((id *)&v7->_identityProviderUniqueID, a3);
  }

  return v7;
}

- (id)_fetchAllOperation
{
  _BOOL4 v3;
  __objc2_class **v4;
  id v5;
  void *v6;

  v3 = -[VSIdentityProviderFetchOperation fetchFromStoreOnly](self, "fetchFromStoreOnly");
  v4 = off_24FE18D20;
  if (!v3)
    v4 = off_24FE18D28;
  v5 = objc_alloc_init(*v4);
  -[VSIdentityProviderFetchOperation auditToken](self, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuditToken:", v6);

  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The fetchAllOperation parameter must not be nil."));
  return v5;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  VSIdentityProviderFetchOperation *v13;
  id v14;
  id location;

  -[VSIdentityProviderFetchOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderFetchOperation _fetchAllOperation](self, "_fetchAllOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDD1478];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke;
  v11 = &unk_24FE19C28;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v12 = v6;
  v13 = self;
  objc_msgSend(v5, "blockOperationWithBlock:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDependency:", v6, v8, v9, v10, v11);
  objc_msgSend(v3, "addOperation:", v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[5];
  _QWORD v6[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "forceUnwrapObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_2;
    v6[3] = &unk_24FE1A810;
    v6[4] = *(_QWORD *)(a1 + 40);
    v6[5] = WeakRetained;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_3;
    v5[3] = &unk_24FE19D18;
    v5[4] = WeakRetained;
    objc_msgSend(v3, "unwrapObject:error:", v6, v5);

    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
  }

}

void __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  VSIdentityProviderFilter *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identityProviderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(VSIdentityProviderFilter);
    -[VSIdentityProviderFilter setAllIdentityProviders:](v5, "setAllIdentityProviders:", v3);
    objc_msgSend(*(id *)(a1 + 40), "identityProviderID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderFilter setSupportedAccountProviderIDs:](v5, "setSupportedAccountProviderIDs:", v7);

    -[VSIdentityProviderFilter filteredIdentityProviders](v5, "filteredIdentityProviders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = (VSIdentityProviderFilter *)v3;
    v9 = (id)-[VSIdentityProviderFilter countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v26 = v3;
      v10 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "uniqueID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "forceUnwrapObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "identityProviderUniqueID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if (v16)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        v9 = (id)-[VSIdentityProviderFilter countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v9)
          continue;
        break;
      }
LABEL_13:
      v3 = v26;
    }
  }

  if (v9)
  {
    v17 = *(void **)(a1 + 40);
    v18 = (void *)MEMORY[0x24BDF8C38];
    v19 = (void *)MEMORY[0x24BDF8BF0];
    v20 = v9;
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v19, "failableWithObject:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "optionalWithObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setResult:", v23);

  }
  else
  {
    VSPrivateError();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(a1 + 40);
    v25 = (void *)MEMORY[0x24BDF8C38];
    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "optionalWithObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setResult:", v23);
  }

}

void __53__VSIdentityProviderFetchOperation_executionDidBegin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optionalWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResult:", v4);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderFetchOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSIdentityProviderFetchOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (NSString)identityProviderID
{
  return self->_identityProviderID;
}

- (void)setIdentityProviderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)identityProviderUniqueID
{
  return self->_identityProviderUniqueID;
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
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

- (BOOL)fetchFromStoreOnly
{
  return self->_fetchFromStoreOnly;
}

- (void)setFetchFromStoreOnly:(BOOL)a3
{
  self->_fetchFromStoreOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_identityProviderUniqueID, 0);
  objc_storeStrong((id *)&self->_identityProviderID, 0);
}

@end
