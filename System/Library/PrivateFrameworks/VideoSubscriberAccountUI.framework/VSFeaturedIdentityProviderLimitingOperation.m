@implementation VSFeaturedIdentityProviderLimitingOperation

- (VSFeaturedIdentityProviderLimitingOperation)init
{
  VSFeaturedIdentityProviderLimitingOperation *v2;
  VSFeaturedIdentityProviderLimitingOperation *v3;
  NSArray *unlimitedIdentityProviders;
  VSOptional *v5;
  VSOptional *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  NSOperationQueue *privateQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VSFeaturedIdentityProviderLimitingOperation;
  v2 = -[VSFeaturedIdentityProviderLimitingOperation init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    unlimitedIdentityProviders = v2->_unlimitedIdentityProviders;
    v2->_unlimitedIdentityProviders = (NSArray *)MEMORY[0x24BDBD1A8];

    v5 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v6 = v3->_result;
    v3->_result = v5;

    v7 = (void *)MEMORY[0x24BDD1710];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queueWithName:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = (NSOperationQueue *)v10;

  }
  return v3;
}

- (void)executionDidBegin
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;
  id buf[2];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Will attempt to determine maximum number of featured providers.", (uint8_t *)buf, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x24BDF8B40]);
  objc_msgSend(v4, "setBagKey:", *MEMORY[0x24BDF8D08]);
  objc_initWeak(buf, v4);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__VSFeaturedIdentityProviderLimitingOperation_executionDidBegin__block_invoke;
  v6[3] = &unk_24FE1A628;
  objc_copyWeak(&v7, buf);
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "setCompletionBlock:", v6);
  -[VSFeaturedIdentityProviderLimitingOperation privateQueue](self, "privateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);

}

void __64__VSFeaturedIdentityProviderLimitingOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v23 = WeakRetained;
  objc_msgSend(WeakRetained, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4, "integerValue") + 1;
  else
    v5 = 16;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v3;
  objc_msgSend(v3, "unlimitedIdentityProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v9, "storefronts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v15, "sortOrdinal");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "unsignedIntegerValue");

              if (v17 >= v5)
                objc_msgSend(v15, "setSortOrdinal:", 0);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v12);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  v18 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(v22, "unlimitedIdentityProviders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "optionalWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setResult:", v20);

  objc_msgSend(v22, "finishExecutionIfPossible");
}

- (NSArray)unlimitedIdentityProviders
{
  return self->_unlimitedIdentityProviders;
}

- (void)setUnlimitedIdentityProviders:(id)a3
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
  objc_storeStrong((id *)&self->_unlimitedIdentityProviders, 0);
}

@end
