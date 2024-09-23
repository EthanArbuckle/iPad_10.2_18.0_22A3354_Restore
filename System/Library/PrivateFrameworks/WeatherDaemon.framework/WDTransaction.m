@implementation WDTransaction

void __20__WDTransaction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.weather", "transactions");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  NSString *transactionDescription;
  objc_super v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[WDTransaction log](WDTransaction, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    transactionDescription = self->_transactionDescription;
    *(_DWORD *)buf = 138543618;
    v8 = identifier;
    v9 = 2114;
    v10 = transactionDescription;
    _os_log_impl(&dword_1A6185000, v3, OS_LOG_TYPE_DEFAULT, "Releasing transaction: %{public}@ for: %{public}@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)WDTransaction;
  -[WDTransaction dealloc](&v6, sel_dealloc);
}

- (WDTransaction)initWithDescription:(id)a3
{
  id v4;
  WDTransaction *v5;
  id v6;
  uint64_t v7;
  OS_os_transaction *transaction;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  NSObject *v12;
  NSString *v13;
  NSString *transactionDescription;
  objc_super v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WDTransaction;
  v5 = -[WDTransaction init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "UTF8String");
    v7 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v7;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v5->_transactionDescription, v6);
    +[WDTransaction log](WDTransaction, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v5->_identifier;
      transactionDescription = v5->_transactionDescription;
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = transactionDescription;
      _os_log_impl(&dword_1A6185000, v12, OS_LOG_TYPE_DEFAULT, "Acquired transaction: %{public}@ for: %{public}@", buf, 0x16u);
    }

  }
  return v5;
}

+ (id)log
{
  if (log_onceToken[0] != -1)
    dispatch_once(log_onceToken, &__block_literal_global_1);
  return (id)log_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

@end
