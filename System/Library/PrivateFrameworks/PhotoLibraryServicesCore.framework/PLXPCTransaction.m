@implementation PLXPCTransaction

uint64_t __46__PLXPCTransaction__startTrackingTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_allTransactions, "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__PLXPCTransaction__stopTrackingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)_allTransactions, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  result = objc_msgSend((id)_allTransactions, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  +[PLXPCTransaction _stopTrackingTransaction:](PLXPCTransaction, "_stopTrackingTransaction:", self);
  v3.receiver = self;
  v3.super_class = (Class)PLXPCTransaction;
  -[PLXPCTransaction dealloc](&v3, sel_dealloc);
}

+ (void)_stopTrackingTransaction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLXPCUtilities.m"), 962, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2050000000;
  v9[3] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PLXPCTransaction__stopTrackingTransaction___block_invoke;
  v8[3] = &unk_1E3768D10;
  v8[4] = v9;
  v8[5] = &v10;
  pl_dispatch_sync(_allTransactionsLock, v8);
  if (!v11[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("kPLXPCTransactionIdleNotification"), 0);

  }
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)transaction:(const char *)a3
{
  return -[PLXPCTransaction initWithIdentifier:]([PLXPCTransaction alloc], "initWithIdentifier:", a3);
}

- (PLXPCTransaction)initWithIdentifier:(const char *)a3
{
  PLXPCTransaction *v4;
  id v5;
  uint64_t v6;
  OS_os_transaction *transaction;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLXPCTransaction;
  v4 = -[PLXPCTransaction init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos.PLXPCTransaction: %p %s"), v4, a3);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    v6 = os_transaction_create();
    transaction = v4->_transaction;
    v4->_transaction = (OS_os_transaction *)v6;

    v4->_identifier = a3;
    +[PLXPCTransaction _startTrackingTransaction:](PLXPCTransaction, "_startTrackingTransaction:", v4);

  }
  return v4;
}

+ (void)_startTrackingTransaction:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLXPCUtilities.m"), 954, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

  }
  v6 = _allTransactionsLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PLXPCTransaction__startTrackingTransaction___block_invoke;
  v9[3] = &unk_1E376C6E0;
  v10 = v5;
  v7 = v5;
  pl_dispatch_sync(v6, v9);

}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 256, 0);
  v3 = (void *)_allTransactions;
  _allTransactions = v2;

  v4 = dispatch_queue_create("com.apple.assetsd.trasactionTracking", 0);
  v5 = (void *)_allTransactionsLock;
  _allTransactionsLock = (uint64_t)v4;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PLXPCTransaction;
  -[PLXPCTransaction description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: os_transaction: %p, identifier: %s"), v4, self->_transaction, self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)openXPCTransactionStatus
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __int16 v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PLXPCTransaction_openXPCTransactionStatus__block_invoke;
  v4[3] = &unk_1E376CAD8;
  v4[4] = &v5;
  pl_dispatch_sync(_allTransactionsLock, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Number of open XPC transactions: %d.\n"), *((__int16 *)v6 + 12));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__PLXPCTransaction_openXPCTransactionStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)_allTransactions, "count");
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
