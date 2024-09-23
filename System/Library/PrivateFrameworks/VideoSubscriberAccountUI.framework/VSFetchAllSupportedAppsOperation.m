@implementation VSFetchAllSupportedAppsOperation

- (VSFetchAllSupportedAppsOperation)init
{
  VSFetchAllSupportedAppsOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSOperationQueue *privateQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSFetchAllSupportedAppsOperation;
  v2 = -[VSFetchAllSupportedAppsOperation init](&v11, sel_init);
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (void *)MEMORY[0x24BDD1710];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queueWithName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;

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
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  VSFetchAllSupportedAppsOperation *v14;

  -[VSFetchAllSupportedAppsOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDF8B48]);
  objc_msgSend(v4, "setMethodName:", *MEMORY[0x24BDF8D18]);
  objc_msgSend(v4, "setRequestType:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8B50]), "initWithRequest:", v4);
  objc_msgSend(v3, "addOperation:", v5);
  v6 = (void *)MEMORY[0x24BDD1478];
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke;
  v12 = &unk_24FE19E30;
  v13 = v5;
  v14 = self;
  v7 = v5;
  objc_msgSend(v6, "blockOperationWithBlock:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDependency:", v7, v9, v10, v11, v12);
  objc_msgSend(v3, "addOperation:", v8);

}

void __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSAMSChannelAppsResponseValueTransformer"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformedValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_2;
  v7[3] = &unk_24FE1ADC8;
  v8 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_3;
  v6[3] = &unk_24FE19D18;
  v6[4] = v8;
  objc_msgSend(v4, "unwrapObject:error:", v7, v6);
  objc_msgSend(*(id *)(a1 + 40), "finishExecutionIfPossible");

}

void __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDF8C38];
  v4 = (void *)MEMORY[0x24BDF8BF0];
  objc_msgSend(a2, "allApps");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failableWithObject:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optionalWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResult:", v6);

}

void __53__VSFetchAllSupportedAppsOperation_executionDidBegin__block_invoke_3(uint64_t a1, uint64_t a2)
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
}

@end
