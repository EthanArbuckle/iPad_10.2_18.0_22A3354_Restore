@implementation VSAMSStorefrontFetchAllOperation

- (void)executionDidBegin
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_msgSend(MEMORY[0x24BE08050], "vs_defaultBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE08390]);
  v5 = (void *)objc_msgSend(v4, "initWithMediaType:clientIdentifier:bag:", 2, *MEMORY[0x24BDF8D20], v3);
  objc_msgSend(v5, "performTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke;
  v12[3] = &unk_24FE199F8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "addErrorBlock:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_2;
  v10[3] = &unk_24FE19FC8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "addSuccessBlock:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_5;
  v8[3] = &unk_24FE19FF0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "addFinishBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x24BDF8C38];
    objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optionalWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v6);

  }
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSAMSAllStorefrontsResponseValueTransformer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transformedValue:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[4] = WeakRetained;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_3;
    v8[3] = &unk_24FE19E80;
    v8[4] = WeakRetained;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_4;
    v7[3] = &unk_24FE19D18;
    objc_msgSend(v5, "unwrapObject:error:", v8, v7);

  }
}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optionalWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResult:", v4);

}

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_4(uint64_t a1, uint64_t a2)
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

void __53__VSAMSStorefrontFetchAllOperation_executionDidBegin__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "storefronts task finished with error %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");

}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
