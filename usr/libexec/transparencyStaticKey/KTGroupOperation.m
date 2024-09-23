@implementation KTGroupOperation

- (KTGroupOperation)init
{
  KTGroupOperation *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  NSMutableArray *v5;
  NSMutableArray *internalSuccesses;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSBlockOperation *startOperation;
  void *v13;
  uint64_t v14;
  NSBlockOperation *finishOperation;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)KTGroupOperation;
  v2 = -[KTResultOperation init](&v29, "init");
  if (v2)
  {
    location = 0;
    objc_initWeak(&location, v2);
    v2->_fillInError = 1;
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    internalSuccesses = v2->_internalSuccesses;
    v2->_internalSuccesses = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("KTGroupOperationDispatchQueue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000060A0;
    v26[3] = &unk_100070710;
    objc_copyWeak(&v27, &location);
    v11 = objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v26));
    startOperation = v2->_startOperation;
    v2->_startOperation = (NSBlockOperation *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](v2, "startOperation"));
    objc_msgSend(v13, "removeDependenciesUponCompletion");

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000061C4;
    v24[3] = &unk_100070710;
    objc_copyWeak(&v25, &location);
    v14 = objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v24));
    finishOperation = v2->_finishOperation;
    v2->_finishOperation = (NSBlockOperation *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](v2, "finishOperation"));
    objc_msgSend(v16, "removeDependenciesUponCompletion");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](v2, "finishOperation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](v2, "startOperation"));
    objc_msgSend(v17, "addDependency:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](v2, "operationQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](v2, "finishOperation"));
    objc_msgSend(v19, "addOperation:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](v2, "startOperation"));
    objc_msgSend(v21, "setName:", CFSTR("group-start"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](v2, "finishOperation"));
    objc_msgSend(v22, "setName:", CFSTR("group-finish"));

    v2->executing = 0;
    v2->finished = 0;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  if (-[KTGroupOperation isPending](self, "isPending"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    objc_msgSend(v3, "cancelAllOperations");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
    objc_msgSend(v4, "cancel");

    v6.receiver = self;
    v6.super_class = (Class)KTGroupOperation;
    -[KTGroupOperation cancel](&v6, "cancel");
  }
  v5.receiver = self;
  v5.super_class = (Class)KTGroupOperation;
  -[KTGroupOperation dealloc](&v5, "dealloc");
}

- (BOOL)isPending
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
  if (objc_msgSend(v3, "isPending"))
    v4 = -[KTGroupOperation isCancelled](self, "isCancelled") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("group-queue:%@"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v6, "setName:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("group-start:%@"), v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
  objc_msgSend(v8, "setName:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("group-finish:%@"), v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
  objc_msgSend(v10, "setName:", v9);

  v11.receiver = self;
  v11.super_class = (Class)KTGroupOperation;
  -[KTGroupOperation setName:](&v11, "setName:", v4);

}

- (id)description
{
  void *v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation operationStateString](self, "operationStateString"));
  off_10008A998();
  v5 = v4;
  v6 = *v4 + 1;
  *v4 = v6;
  if (v6 >= 0xB)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation selfname](self, "selfname"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ recursion>"), v7, v3));
LABEL_29:

    goto LABEL_30;
  }
  if (!-[KTGroupOperation isFinished](self, "isFinished"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    v15 = (char *)objc_msgSend(v14, "operationCount");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dependencies"));
    v18 = &v15[(_QWORD)objc_msgSend(v17, "count")];

    if ((unint64_t)v18 <= 0x14)
    {
      v38 = v3;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "operations"));
      v21 = objc_msgSend(v20, "mutableCopy");

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
      objc_msgSend(v21, "removeObject:", v22);

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dependencies"));

      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            if ((unint64_t)objc_msgSend(v21, "count") > 0x14)
            {

              v7 = CFSTR("Potentially more than 20 operations");
              goto LABEL_24;
            }
            v30 = objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
            if (v29 == (void *)v30)
            {

            }
            else
            {
              v31 = (void *)v30;
              v32 = objc_msgSend(v21, "indexOfObject:", v29);

              if (v32 == (id)0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v21, "addObject:", v29);
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v26)
            continue;
          break;
        }
      }

      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", ")));
LABEL_24:

      v3 = v38;
    }
    else
    {
      v7 = CFSTR("Potentially more than 20 operations");
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation selfname](self, "selfname"));
    if (v33)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
      v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ [%@] error:%@>"), v34, v3, v7, v35);
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
      v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ [%@]%@>"), v34, v3, v7, v35);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(v36);

    goto LABEL_29;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation selfname](self, "selfname"));
  v11 = objc_claimAutoreleasedReturnValue(-[KTResultOperation finishDate](self, "finishDate"));
  v12 = (void *)v11;
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ %@ - %@>"), v10, v3, v12, v13));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ %@>"), v10, v3, v11));
  }

LABEL_30:
  --*v5;

  return v8;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  KTGroupOperation *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[KTGroupOperation queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000691C;
  v5[3] = &unk_100070A50;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isFinished
{
  KTGroupOperation *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[KTGroupOperation queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000069F4;
  v5[3] = &unk_100070A50;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)start
{
  const __CFString *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[KTResultOperation invalidateTimeout](self, "invalidateTimeout");
  if (-[KTGroupOperation isCancelled](self, "isCancelled"))
  {
    v3 = CFSTR("isFinished");
    -[KTGroupOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    v4 = objc_claimAutoreleasedReturnValue(-[KTGroupOperation queue](self, "queue"));
    v5 = v4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006B48;
    v10[3] = &unk_100070A78;
    v10[4] = self;
    v6 = v10;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
    objc_msgSend(v7, "addOperation:", v8);

    v3 = CFSTR("isExecuting");
    -[KTGroupOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    v4 = objc_claimAutoreleasedReturnValue(-[KTGroupOperation queue](self, "queue"));
    v5 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006B60;
    v9[3] = &unk_100070A78;
    v9[4] = self;
    v6 = v9;
  }
  dispatch_sync(v4, v6);

  -[KTGroupOperation didChangeValueForKey:](self, "didChangeValueForKey:", v3);
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &stru_100070A98));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
  objc_msgSend(v4, "addDependency:", v3);

  v39.receiver = self;
  v39.super_class = (Class)KTGroupOperation;
  -[KTGroupOperation cancel](&v39, "cancel");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operations"));
  v7 = objc_msgSend(v6, "copy");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
          objc_msgSend(v13, "cancel");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dependencies"));
  v18 = objc_msgSend(v17, "copy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v8, "containsObject:", v24, (_QWORD)v31) & 1) == 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
          v26 = objc_msgSend(v24, "isEqual:", v25);

          if ((v26 & 1) == 0)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
            objc_msgSend(v27, "removeDependency:", v24);

          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v21);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
  v29 = objc_msgSend(v28, "isPending");

  if (v29)
    -[KTGroupOperation setFillInError:](self, "setFillInError:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue", (_QWORD)v31));
  objc_msgSend(v30, "addOperation:", v3);

}

- (void)completeOperation
{
  NSObject *v3;
  _QWORD block[5];

  -[KTGroupOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[KTGroupOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  v3 = objc_claimAutoreleasedReturnValue(-[KTGroupOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006F2C;
  block[3] = &unk_100070A78;
  block[4] = self;
  dispatch_sync(v3, block);

  -[KTGroupOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[KTGroupOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)addDependency:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KTGroupOperation;
  v4 = a3;
  -[KTGroupOperation addDependency:](&v6, "addDependency:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation", v6.receiver, v6.super_class));
  objc_msgSend(v5, "addDependency:", v4);

}

- (void)runBeforeGroupFinished:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
  objc_msgSend(v4, "addDependency:", v5);

  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  objc_msgSend(v6, "addOperation:", v4);

}

- (void)dependOnBeforeGroupFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  KTGroupOperation *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    if (-[KTGroupOperation isCancelled](self, "isCancelled"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can't add operation dependency to cancelled group", buf, 2u);
      }
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
      objc_msgSend(v5, "addDependency:", v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation finishOperation](self, "finishOperation"));
      v7 = objc_msgSend(v6, "isFinished");

      if (v7)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to add operation(%@) to completed group(%@)"), v4, self));
        v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v13, 0));

        objc_exception_throw(v14);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation startOperation](self, "startOperation"));
      objc_msgSend(v4, "addDependency:", v8);

      v10 = objc_opt_class(KTResultOperation, v9);
      if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
      {
        v11 = self;
        objc_sync_enter(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation internalSuccesses](v11, "internalSuccesses"));
        objc_msgSend(v12, "addObject:", v4);

        objc_sync_exit(v11);
      }
    }
  }

}

+ (id)operationWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v4));

  objc_msgSend(v5, "runBeforeGroupFinished:", v6);
  return v5;
}

+ (id)named:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "operationWithBlock:", a4));
  objc_msgSend(v7, "setName:", v6);

  return v7;
}

+ (id)named:(id)a3 withBlockTakingSelf:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  location = 0;
  objc_initWeak(&location, v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007434;
  v12[3] = &unk_1000706E8;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v12));
  objc_msgSend(v8, "runBeforeGroupFinished:", v10);

  objc_msgSend(v8, "setName:", v6);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)fillInError
{
  return self->_fillInError;
}

- (void)setFillInError:(BOOL)a3
{
  self->_fillInError = a3;
}

- (NSBlockOperation)startOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStartOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSBlockOperation)finishOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFinishOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableArray)internalSuccesses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInternalSuccesses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSuccesses, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_finishOperation, 0);
  objc_storeStrong((id *)&self->_startOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
