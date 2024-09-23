@implementation ActionManager

+ (id)sharedManager
{
  if (qword_1003063B8 != -1)
    dispatch_once(&qword_1003063B8, &stru_1002C1398);
  return (id)qword_1003063B0;
}

- (ActionManager)init
{
  ActionManager *v2;
  void *v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ActionManager;
  v2 = -[ActionManager init](&v15, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    -[ActionManager setWeakActions:](v2, "setWeakActions:", v3);

    -[ActionManager setNextActionIdNumber:](v2, "setNextActionIdNumber:", 1);
    v4 = dispatch_queue_create("ActionManager-MetadataMods", 0);
    -[ActionManager setMetadataModsQueue:](v2, "setMetadataModsQueue:", v4);

    v5 = dispatch_queue_create("ActionManager-TransactionQueue", 0);
    -[ActionManager setTransactionSerialQueue:](v2, "setTransactionSerialQueue:", v5);

    -[ActionManager setOperationTransactionActive:](v2, "setOperationTransactionActive:", 0);
    v6 = objc_alloc_init((Class)NSOperationQueue);
    -[ActionManager setActionExecutionQueue:](v2, "setActionExecutionQueue:", v6);

    v7 = NSStringFromSelector("operationCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_initWeak(&location, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionManager actionExecutionQueue](v2, "actionExecutionQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000C4C4;
    v12[3] = &unk_1002C13C0;
    objc_copyWeak(&v13, &location);
    v10 = objc_msgSend(v9, "addKVOBlockForKeyPath:options:handler:", v8, 5, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (id)enqueueAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ActionManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10000C660;
  v17 = sub_10000C670;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionManager metadataModsQueue](self, "metadataModsQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C678;
  v9[3] = &unk_1002C1410;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  +[FMDDispatchTransaction dispatchTransactionSync:transactionName:block:](FMDDispatchTransaction, "dispatchTransactionSync:transactionName:block:", v5, CFSTR("ActionManagerEnqueueAction"), v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)cancelActionWithId:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ActionManager metadataModsQueue](self, "metadataModsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CDCC;
  v7[3] = &unk_1002C13E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelAllActions
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ActionManager metadataModsQueue](self, "metadataModsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D074;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)refreshTransactionState:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[ActionManager transactionSerialQueue](self, "transactionSerialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D11C;
  v6[3] = &unk_1002C1460;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionManager fm_logID](self, "fm_logID"));
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionManager weakActions](self, "weakActions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

  if (objc_msgSend(v6, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dependencies"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(",")));
          objc_msgSend(v3, "appendFormat:", CFSTR("\n%@ -> (%@)"), v12, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v6 = v16;
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(" (Empty)"));
  }

  return v3;
}

- (void)_setDependenciesForNewAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ActionManager metadataModsQueue](self, "metadataModsQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionManager actionExecutionQueue](self, "actionExecutionQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operations"));

  if (v7)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "embeddedAction"));
          v15 = objc_msgSend(v4, "shouldCancelAction:", v14);

          if (v15)
            objc_msgSend(v13, "cancel");

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v20);
          if (objc_msgSend(v4, "shouldWaitForAction:", v21, (_QWORD)v22))
            objc_msgSend(v4, "addDependency:", v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v18);
    }

  }
}

- (NSDate)nextRegisterDate
{
  return self->_nextRegisterDate;
}

- (void)setNextRegisterDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextRegisterDate, a3);
}

- (int64_t)nextActionIdNumber
{
  return self->_nextActionIdNumber;
}

- (void)setNextActionIdNumber:(int64_t)a3
{
  self->_nextActionIdNumber = a3;
}

- (OS_dispatch_queue)metadataModsQueue
{
  return self->_metadataModsQueue;
}

- (void)setMetadataModsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metadataModsQueue, a3);
}

- (OS_dispatch_queue)transactionSerialQueue
{
  return self->_transactionSerialQueue;
}

- (void)setTransactionSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSerialQueue, a3);
}

- (NSOperationQueue)actionExecutionQueue
{
  return self->_actionExecutionQueue;
}

- (void)setActionExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_actionExecutionQueue, a3);
}

- (BOOL)operationTransactionActive
{
  return self->_operationTransactionActive;
}

- (void)setOperationTransactionActive:(BOOL)a3
{
  self->_operationTransactionActive = a3;
}

- (NSPointerArray)weakActions
{
  return self->_weakActions;
}

- (void)setWeakActions:(id)a3
{
  objc_storeStrong((id *)&self->_weakActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakActions, 0);
  objc_storeStrong((id *)&self->_actionExecutionQueue, 0);
  objc_storeStrong((id *)&self->_transactionSerialQueue, 0);
  objc_storeStrong((id *)&self->_metadataModsQueue, 0);
  objc_storeStrong((id *)&self->_nextRegisterDate, 0);
}

@end
