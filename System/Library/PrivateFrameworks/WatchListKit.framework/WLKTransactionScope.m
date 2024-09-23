@implementation WLKTransactionScope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (WLKTransactionScope)initWithIdentifier:(id)a3
{
  return -[WLKTransactionScope initWithIdentifier:delay:](self, "initWithIdentifier:delay:", a3, 5.0);
}

- (WLKTransactionScope)initWithIdentifier:(id)a3 delay:(double)a4
{
  id v6;
  WLKTransactionScope *v7;
  WLKTransactionScope *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *identifier;
  uint64_t v13;
  OS_os_transaction *transaction;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKTransactionScope;
  v7 = -[WLKTransactionScope init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_delay = a4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" \"%@\"), v6);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v9;
    }
    identifier = v8->_identifier;
    v8->_identifier = v11;

    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v13 = os_transaction_create();
    transaction = v8->_transaction;
    v8->_transaction = (OS_os_transaction *)v13;

  }
  NSLog(CFSTR("[WLKTransactionScope] %@: Started transaction"), v8->_identifier);

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  double v5;
  dispatch_time_t v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD block[4];
  id v11;
  id v12;

  -[WLKTransactionScope transaction](self, "transaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKTransactionScope identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKTransactionScope delay](self, "delay");
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__WLKTransactionScope_dealloc__block_invoke;
  block[3] = &unk_1E68A79C0;
  v11 = v4;
  v12 = v3;
  v7 = v3;
  v8 = v4;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

  v9.receiver = self;
  v9.super_class = (Class)WLKTransactionScope;
  -[WLKTransactionScope dealloc](&v9, sel_dealloc);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)delay
{
  return self->_delay;
}

- (WLKTransactionScope)init
{
  return -[WLKTransactionScope initWithIdentifier:](self, "initWithIdentifier:", 0);
}

void __30__WLKTransactionScope_dealloc__block_invoke(uint64_t a1)
{
  NSLog(CFSTR("[WLKTransactionScope] %@: Ended transaction"), *(_QWORD *)(a1 + 32));
}

@end
