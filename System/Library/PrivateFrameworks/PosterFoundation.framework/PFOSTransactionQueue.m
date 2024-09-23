@implementation PFOSTransactionQueue

+ (id)sharedTransactionQueueForName:(id)a3
{
  __CFString *v3;
  id v4;
  void *v5;

  v3 = (__CFString *)a3;
  if (sharedTransactionQueueForName__onceToken != -1)
    dispatch_once(&sharedTransactionQueueForName__onceToken, &__block_literal_global_7);
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("DEFAULT_TX_QUEUE");
  }
  v4 = (id)sharedTransactionQueueForName__nameToQueueWeakMap;
  objc_sync_enter(v4);
  objc_msgSend((id)sharedTransactionQueueForName__nameToQueueWeakMap, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTransactionName:", v3);
    objc_msgSend((id)sharedTransactionQueueForName__nameToQueueWeakMap, "setObject:forKey:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

void __54__PFOSTransactionQueue_sharedTransactionQueueForName___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedTransactionQueueForName__nameToQueueWeakMap;
  sharedTransactionQueueForName__nameToQueueWeakMap = v0;

}

+ (id)sharedASTCProcessingTransactionQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PFOSTransactionQueue_sharedASTCProcessingTransactionQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedASTCProcessingTransactionQueue_onceToken != -1)
    dispatch_once(&sharedASTCProcessingTransactionQueue_onceToken, block);
  return (id)sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue;
}

void __60__PFOSTransactionQueue_sharedASTCProcessingTransactionQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sharedTransactionQueueForName:", CFSTR("sharedASTCProcessingTransactionQueue"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue;
  sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue = v1;

  if (sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue)
    objc_msgSend(*(id *)(sharedASTCProcessingTransactionQueue_sharedASTCProcessingTransactionQueue + 8), "setQualityOfService:", 25);
}

- (PFOSTransactionQueue)initWithTransactionName:(id)a3
{
  id v4;
  PFOSTransactionQueue *v5;
  uint64_t v6;
  NSString *transactionName;
  void *v8;
  uint64_t v9;
  NSOperationQueue *txOperationQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFOSTransactionQueue;
  v5 = -[PFOSTransactionQueue init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    transactionName = v5->_transactionName;
    v5->_transactionName = (NSString *)v6;

    objc_msgSend(CFSTR("PFOSTransaction-"), "stringByAppendingString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_new();
    txOperationQueue = v5->_txOperationQueue;
    v5->_txOperationQueue = (NSOperationQueue *)v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_txOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v5->_txOperationQueue, "setName:", v8);

  }
  return v5;
}

- (void)dispatchAsync:(id)a3
{
  -[PFOSTransactionQueue _dispatchWork:waitUntilFinished:](self, "_dispatchWork:waitUntilFinished:", a3, 0);
}

- (void)dispatchSync:(id)a3
{
  -[PFOSTransactionQueue _dispatchWork:waitUntilFinished:](self, "_dispatchWork:waitUntilFinished:", a3, 1);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_transactionName, CFSTR("transactionName"));
  -[NSOperationQueue progress](self->_txOperationQueue, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("progress"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_dispatchWork:(id)a3 waitUntilFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSOperationQueue *txOperationQueue;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v4 = a4;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    -[PFOSTransactionQueue transactionName](self, "transactionName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    txOperationQueue = self->_txOperationQueue;
    v9 = (void *)MEMORY[0x24BDD1478];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __56__PFOSTransactionQueue__dispatchWork_waitUntilFinished___block_invoke;
    v16 = &unk_251543D48;
    v17 = v7;
    v18 = v6;
    v10 = v7;
    objc_msgSend(v9, "blockOperationWithBlock:", &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1, v13, v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperations:waitUntilFinished:](txOperationQueue, "addOperations:waitUntilFinished:", v12, v4);

  }
}

void __56__PFOSTransactionQueue__dispatchWork_waitUntilFinished___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v2 = (id)os_transaction_create();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)transactionName
{
  return self->_transactionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionName, 0);
  objc_storeStrong((id *)&self->_txOperationQueue, 0);
}

@end
