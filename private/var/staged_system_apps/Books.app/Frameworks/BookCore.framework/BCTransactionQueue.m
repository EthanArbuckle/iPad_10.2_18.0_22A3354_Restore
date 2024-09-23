@implementation BCTransactionQueue

- (BCTransactionQueue)initWithOptions:(unint64_t)a3 queue:(id)a4
{
  id v7;
  BCTransactionQueue *v8;
  NSMutableArray *v9;
  NSMutableArray *blocksToProcess;
  NSMutableArray *v11;
  NSMutableArray *pendingTransactions;
  dispatch_queue_t v13;
  OS_dispatch_queue *sync;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCTransactionQueue;
  v8 = -[BCTransactionQueue init](&v16, "init");
  if (v8)
  {
    if (v7 == &_dispatch_main_q)
      a3 |= 0x10uLL;
    v9 = objc_opt_new(NSMutableArray);
    blocksToProcess = v8->_blocksToProcess;
    v8->_blocksToProcess = v9;

    v11 = objc_opt_new(NSMutableArray);
    pendingTransactions = v8->_pendingTransactions;
    v8->_pendingTransactions = v11;

    v8->_options = a3;
    objc_storeStrong((id *)&v8->_queue, a4);
    v13 = dispatch_queue_create("BCTransactionQueue.sync", 0);
    sync = v8->_sync;
    v8->_sync = (OS_dispatch_queue *)v13;

  }
  return v8;
}

+ (id)newWithOptions:(unint64_t)a3 queue:(id)a4
{
  id v5;
  BCTransactionQueue *v6;

  v5 = a4;
  v6 = -[BCTransactionQueue initWithOptions:queue:]([BCTransactionQueue alloc], "initWithOptions:queue:", a3, v5);

  return v6;
}

- (id)newTransaction
{
  return -[BCTransactionQueue newTransactionWithName:info:context:originatingSceneController:targetSceneDescriptor:](self, "newTransactionWithName:info:context:originatingSceneController:targetSceneDescriptor:", 0, 0, 0, 0, 0);
}

- (id)newTransactionWithContext:(id)a3
{
  return -[BCTransactionQueue newTransactionWithName:info:context:originatingSceneController:targetSceneDescriptor:](self, "newTransactionWithName:info:context:originatingSceneController:targetSceneDescriptor:", 0, 0, a3, 0, 0);
}

- (id)newTransactionWithName:(id)a3 info:(id)a4 context:(id)a5 originatingSceneController:(id)a6 targetSceneDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BCTransaction *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *sync;
  _BCTransaction *v22;
  _BCTransactionProxy *v23;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  BCTransactionQueue *v29;
  _BCTransaction *v30;
  uint8_t buf[4];
  void *v32;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_opt_new(_BCTransaction);
  -[_BCTransaction setQueue:](v17, "setQueue:", self);
  -[_BCTransaction setName:](v17, "setName:", v16);

  -[_BCTransaction setInfo:](v17, "setInfo:", v15);
  -[_BCTransaction setOriginatingSceneController:](v17, "setOriginatingSceneController:", v13);

  -[_BCTransaction setTargetSceneDescriptor:](v17, "setTargetSceneDescriptor:", v12);
  v18 = BCTransactionLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction debugDescription](v17, "debugDescription"));
    *(_DWORD *)buf = 138543362;
    v32 = v20;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Creating transaction: %{public}@", buf, 0xCu);

  }
  sync = self->_sync;
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_11B678;
  v28 = &unk_28B808;
  v29 = self;
  v30 = v17;
  v22 = v17;
  dispatch_sync(sync, &v25);
  -[_BCTransaction setContext:](v22, "setContext:", v14, v25, v26, v27, v28, v29);

  v23 = -[_BCTransactionProxy initWithTransaction:]([_BCTransactionProxy alloc], "initWithTransaction:", v22);
  return v23;
}

- (void)_cancelTransactionsConflictedByTransaction:(id)a3
{
  id v4;
  NSObject *sync;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11B734;
  block[3] = &unk_28B808;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sync, block);

}

- (void)_processTransaction:(id)a3
{
  id v4;
  NSObject *sync;
  id v6;
  _QWORD block[4];
  id v8;
  BCTransactionQueue *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11BC98;
  block[3] = &unk_28D240;
  v6 = v4;
  v9 = self;
  v10 = &v11;
  v8 = v6;
  dispatch_sync(sync, block);
  if (*((_BYTE *)v12 + 24))
    -[BCTransactionQueue _process](self, "_process");

  _Block_object_dispose(&v11, 8);
}

- (void)sq_removeFinishedTransactions
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCTransactionQueue activeTransaction](self, "activeTransaction"));
  v4 = objc_msgSend(v3, "sq_isFinal");

  if (v4)
  {
    v5 = BCTransactionLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCTransactionQueue activeTransaction](self, "activeTransaction"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugDescription"));
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "removing active transaction: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[BCTransactionQueue setActiveTransaction:](self, "setActiveTransaction:", 0);
  }
}

- (void)sq_activateTransactions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCTransactionQueue activeTransaction](self, "activeTransaction"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCTransactionQueue pendingTransactions](self, "pendingTransactions"));
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCTransactionQueue pendingTransactions](self, "pendingTransactions"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCTransactionQueue pendingTransactions](self, "pendingTransactions"));
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

    -[BCTransactionQueue setActiveTransaction:](self, "setActiveTransaction:", v8);
    v3 = v8;
  }

}

- (void)_process
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11C060;
  v4[3] = &unk_28B960;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  if ((self->_options & 0x10) != 0 && +[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v3[2])(v3);
  else
    dispatch_async((dispatch_queue_t)self->_queue, v3);

}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
  objc_storeStrong((id *)&self->_sync, a3);
}

- (_BCTransaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransaction, a3);
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransactions, a3);
}

- (NSMutableArray)blocksToProcess
{
  return self->_blocksToProcess;
}

- (void)setBlocksToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_blocksToProcess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksToProcess, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
