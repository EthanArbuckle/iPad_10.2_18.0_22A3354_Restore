@implementation _BCTransaction

- (_BCTransaction)init
{
  _BCTransaction *v2;
  uint64_t v3;
  BCTransactionContext *context;
  void *v5;
  uint64_t v6;
  NSString *guid;
  NSMutableArray *v8;
  NSMutableArray *pending;
  NSMutableArray *v10;
  NSMutableArray *rollbacks;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_BCTransaction;
  v2 = -[_BCTransaction init](&v13, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_BCTransactionContextUnintializedSentinel sharedInstance](_BCTransactionContextUnintializedSentinel, "sharedInstance"));
    context = v2->_context;
    v2->_context = (BCTransactionContext *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    guid = v2->_guid;
    v2->_guid = (NSString *)v6;

    v8 = objc_opt_new(NSMutableArray);
    pending = v2->_pending;
    v2->_pending = v8;

    v10 = objc_opt_new(NSMutableArray);
    rollbacks = v2->_rollbacks;
    v2->_rollbacks = v10;

  }
  return v2;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)commit:(id)a3 rollback:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  _BCTransaction *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  void *v28;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sync"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_11A038;
  v18 = &unk_291930;
  v22 = &v23;
  v19 = self;
  v10 = v6;
  v20 = v10;
  v11 = v7;
  v21 = v11;
  dispatch_sync(v9, &v15);

  if (*((_BYTE *)v24 + 24))
  {
    v12 = BCTransactionLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction debugDescription](self, "debugDescription", v15, v16, v17, v18, v19, v20));
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "commit transaction: %{public}@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "_processTransaction:", self);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)commit:(id)a3
{
  -[_BCTransaction commit:rollback:](self, "commit:rollback:", a3, 0);
}

- (void)whenCancelled:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _BCTransaction *v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sync"));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_11A230;
    v13 = &unk_28C080;
    v14 = self;
    v15 = v4;
    dispatch_sync(v6, &v10);

    v7 = BCTransactionLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction debugDescription](self, "debugDescription", v10, v11, v12, v13, v14));
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Adding whenCancelled block to transaction: %{public}@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "_processTransaction:", self);

  }
}

- (void)whenCompleted:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _BCTransaction *v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sync"));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_11A3F8;
    v13 = &unk_28C080;
    v14 = self;
    v15 = v4;
    dispatch_sync(v6, &v10);

    v7 = BCTransactionLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction debugDescription](self, "debugDescription", v10, v11, v12, v13, v14));
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Adding whenCompleted block to transaction: %{public}@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "_processTransaction:", self);

  }
}

- (void)finalize
{
  id WeakRetained;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  void *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sync"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_11A654;
  v8[3] = &unk_28E468;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v4, v8);

  if (*((_BYTE *)v10 + 24))
  {
    v5 = BCTransactionLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction debugDescription](self, "debugDescription"));
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Finalized transaction: %{public}@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "_processTransaction:", self);
  }

  _Block_object_dispose(&v9, 8);
}

- (id)sq_commitsToProcess
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_pending;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commit", (_QWORD)v18));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commit"));
          v12 = objc_retainBlock(v11);
          -[NSMutableArray addObject:](v3, "addObject:", v12);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rollback"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction rollbacks](self, "rollbacks"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rollback"));
          v16 = objc_retainBlock(v15);
          objc_msgSend(v14, "addObject:", v16);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_pending, "removeAllObjects");
  if (self->_whenCompletedBlocks && (self->_flags & 1) != 0)
  {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:");
    -[NSMutableArray removeAllObjects](self->_whenCompletedBlocks, "removeAllObjects");
  }
  return v3;
}

- (id)sq_rollbacksToProcess
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction rollbacks](self, "rollbacks"));
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bu_reversedArray"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction rollbacks](self, "rollbacks"));
  objc_msgSend(v6, "removeAllObjects");

  return v5;
}

- (void)sq_cancel
{
  self->_flags |= 2uLL;
}

- (BOOL)sq_isFinal
{
  BOOL v2;
  void *v4;
  void *v5;

  if ((self->_flags & 1) == 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction pending](self, "pending"));
  if (objc_msgSend(v4, "count"))
  {
    v2 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction whenCompletedBlocks](self, "whenCompletedBlocks"));
    v2 = objc_msgSend(v5, "count") == 0;

  }
  return v2;
}

- (id)sq_whenCancelledBlocks
{
  id v2;

  if ((self->_flags & 2) != 0)
  {
    v2 = -[NSMutableArray copy](self->_whenCancelledBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_whenCancelledBlocks, "removeAllObjects");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sq_whenCompletedBlocks
{
  void *v3;
  id v4;
  id v5;

  if ((self->_flags & 1) != 0
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction pending](self, "pending")),
        v4 = objc_msgSend(v3, "count"),
        v3,
        !v4))
  {
    v5 = -[NSMutableArray copy](self->_whenCompletedBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_whenCompletedBlocks, "removeAllObjects");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)waitForCompletionWithTimeout:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  char v9;
  double v10;
  NSObject *v11;
  char v12;
  double v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCTransaction.m", 274, (uint64_t)"-[_BCTransaction waitForCompletionWithTimeout:]", (uint64_t)"[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"), v5, v6, v7, v18[0]);
  if (a3 > 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    v9 = 0;
    v10 = CFAbsoluteTimeGetCurrent() + a3;
    while (1)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sync"));
      v18[0] = (uint64_t)_NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = (uint64_t)sub_11AC10;
      v18[3] = (uint64_t)&unk_28E468;
      v18[4] = (uint64_t)self;
      v18[5] = (uint64_t)&v19;
      dispatch_sync(v11, v18);

      if (*((_BYTE *)v20 + 24))
      {
        v12 = 0;
        v9 = 1;
      }
      else
      {
        v13 = v10 - CFAbsoluteTimeGetCurrent();
        if (v13 > 0.0)
        {
          if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, v13, 1u) != kCFRunLoopRunTimedOut)
          {
            v12 = 1;
            goto LABEL_14;
          }
          v14 = BCTransactionLog();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction debugDescription](self, "debugDescription"));
            sub_1B7E58(v16, buf, &v24, v15);
          }

        }
        v12 = 0;
      }
LABEL_14:
      _Block_object_dispose(&v19, 8);
      if ((v12 & 1) == 0)
      {

        return v9 & 1;
      }
    }
  }
  return 0;
}

- (void)setContext:(id)a3
{
  BCTransactionContext *v5;
  id WeakRetained;
  id v7;
  BCTransactionContext *v8;

  v5 = (BCTransactionContext *)a3;
  if (self->_context != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_context, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    objc_msgSend(WeakRetained, "_cancelTransactionsConflictedByTransaction:", self);

    v7 = objc_loadWeakRetained((id *)&self->_queue);
    objc_msgSend(v7, "_process");

    v5 = v8;
  }

}

- (BCSceneControlling)targetSceneController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction targetSceneDescriptor](self, "targetSceneDescriptor"));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___BCSceneControlling, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (BCSceneControlling *)v4;
}

- (void)requireTargetSceneController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction targetSceneController](self, "targetSceneController"));

  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction targetSceneDescriptor](self, "targetSceneDescriptor"));
    v9 = BUProtocolCast(&OBJC_PROTOCOL___BCSceneProviding, v8);
    v6 = (id)objc_claimAutoreleasedReturnValue(v9);

    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_11AE7C;
      v11[3] = &unk_291958;
      v11[4] = self;
      v12 = v4;
      objc_msgSend(v6, "provideSceneController:", v11);

      goto LABEL_7;
    }
    v10 = objc_retainBlock(v4);
    v7 = v10;
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    goto LABEL_4;
  }
  v6 = objc_retainBlock(v4);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction targetSceneController](self, "targetSceneController"));
    (*((void (**)(id, void *))v6 + 2))(v6, v7);
LABEL_4:

  }
LABEL_7:

}

- (BCSceneControlling)destinationSceneController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction targetSceneController](self, "targetSceneController"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_BCTransaction originatingSceneController](self, "originatingSceneController"));
  v6 = v5;

  return (BCSceneControlling *)v6;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction guid](self, "guid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p guid:%@ name:%@>"), v3, self, v4, v5));

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction guid](self, "guid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransaction name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tx:%@, name:%@"), v3, v4));

  return (NSString *)v5;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (BCTransactionContext)context
{
  return self->_context;
}

- (BCSceneControlling)originatingSceneController
{
  return (BCSceneControlling *)objc_loadWeakRetained((id *)&self->_originatingSceneController);
}

- (void)setOriginatingSceneController:(id)a3
{
  objc_storeWeak((id *)&self->_originatingSceneController, a3);
}

- (BCTransactionQueue)queue
{
  return (BCTransactionQueue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (void)setQueue:(id)a3
{
  objc_storeWeak((id *)&self->_queue, a3);
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableArray)pending
{
  return self->_pending;
}

- (void)setPending:(id)a3
{
  objc_storeStrong((id *)&self->_pending, a3);
}

- (NSMutableArray)rollbacks
{
  return self->_rollbacks;
}

- (void)setRollbacks:(id)a3
{
  objc_storeStrong((id *)&self->_rollbacks, a3);
}

- (NSMutableArray)whenCancelledBlocks
{
  return self->_whenCancelledBlocks;
}

- (void)setWhenCancelledBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_whenCancelledBlocks, a3);
}

- (NSMutableArray)whenCompletedBlocks
{
  return self->_whenCompletedBlocks;
}

- (void)setWhenCompletedBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_whenCompletedBlocks, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (BCSceneDescriptor)targetSceneDescriptor
{
  return self->_targetSceneDescriptor;
}

- (void)setTargetSceneDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_targetSceneDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneDescriptor, 0);
  objc_storeStrong((id *)&self->_whenCompletedBlocks, 0);
  objc_storeStrong((id *)&self->_whenCancelledBlocks, 0);
  objc_storeStrong((id *)&self->_rollbacks, 0);
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_originatingSceneController);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
