@implementation KTResultOperation

- (KTResultOperation)init
{
  KTResultOperation *v2;
  NSError *error;
  NSMutableArray *v4;
  NSMutableArray *successDependencies;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *timeoutQueue;
  KTCondition *v10;
  KTCondition *completionHandlerDidRunCondition;
  void ***v12;
  id finishingBlock;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)KTResultOperation;
  v2 = -[KTResultOperation init](&v21, "init");
  if (v2)
  {
    location = 0;
    objc_initWeak(&location, v2);
    error = v2->_error;
    v2->_error = 0;

    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    successDependencies = v2->_successDependencies;
    v2->_successDependencies = v4;

    v2->_timeoutCanOccur = 1;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("result-operation-timeout", v7);
    timeoutQueue = v2->_timeoutQueue;
    v2->_timeoutQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(KTCondition);
    completionHandlerDidRunCondition = v2->_completionHandlerDidRunCondition;
    v2->_completionHandlerDidRunCondition = v10;

    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10019D3D8;
    v18 = &unk_10023A970;
    objc_copyWeak(&v19, &location);
    v12 = objc_retainBlock(&v15);
    finishingBlock = v2->_finishingBlock;
    v2->_finishingBlock = v12;

    -[KTResultOperation setCompletionBlock:](v2, "setCompletionBlock:", &stru_10024C6A0, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)operationStateString
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  unsigned int v6;

  if ((-[KTResultOperation isFinished](self, "isFinished") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation finishDate](self, "finishDate"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("finished %@"), v3));

  }
  else
  {
    if ((-[KTResultOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v5 = CFSTR("cancelled");
    }
    else if ((-[KTResultOperation isExecuting](self, "isExecuting") & 1) != 0)
    {
      v5 = CFSTR("executing");
    }
    else
    {
      v6 = -[KTResultOperation isReady](self, "isReady");
      v5 = CFSTR("pending");
      if (v6)
        v5 = CFSTR("ready");
    }
    v4 = v5;
  }
  return v4;
}

- (id)description
{
  void *v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation operationStateString](self, "operationStateString"));
  off_1002A43C0();
  v5 = v4;
  v6 = *v4 + 1;
  *v4 = v6;
  if (v6 < 0xB)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation selfname](self, "selfname"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ error:%@>"), v7, v3, v10);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@%@>"), v7, v3, v10);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(v11);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation selfname](self, "selfname"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ recursion>"), v7, v3));
  }

  --*v5;
  return v8;
}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019D734;
  v7[3] = &unk_100245D38;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)KTResultOperation;
  -[KTResultOperation setCompletionBlock:](&v6, "setCompletionBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)start
{
  void *v3;
  objc_super v4;
  uint8_t buf[4];
  void *v6;

  if (-[KTResultOperation allDependentsSuccessful](self, "allDependentsSuccessful"))
  {
    -[KTResultOperation invalidateTimeout](self, "invalidateTimeout");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
      *(_DWORD *)buf = 138412290;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not running due to some failed dependent: %@", buf, 0xCu);

    }
    -[KTResultOperation cancel](self, "cancel");
  }
  v4.receiver = self;
  v4.super_class = (Class)KTResultOperation;
  -[KTResultOperation start](&v4, "start");
}

- (void)invalidateTimeout
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTResultOperation timeoutQueue](self, "timeoutQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019DA20;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)dependenciesDescriptionError
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation dependencies](self, "dependencies"));
  v3 = objc_msgSend(v2, "copy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexesOfObjectsPassingTest:", &stru_10024C6E0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsAtIndexes:", v4));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(KTResultOperation, v8);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = v13;
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "descriptionError", (_QWORD)v21));
          v17 = (void *)v16;
          if (v16)
            v18 = (void *)v16;
          else
            v18 = v10;
          v19 = v18;

          v10 = v19;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)descriptionError
{
  _DWORD *v3;
  _DWORD *v4;
  void *v5;

  off_1002A43D8();
  v4 = v3;
  ++*v3;
  if (-[KTResultOperation descriptionErrorCode](self, "descriptionErrorCode"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KTResultOperationDescriptionError"), -[KTResultOperation descriptionErrorCode](self, "descriptionErrorCode"), 0));
  }
  else if (*v4 < 0xBu)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation dependenciesDescriptionError](self, "dependenciesDescriptionError"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("KTResultOperationDescriptionError"), -1, CFSTR("Excess recursion")));
  }
  --*v4;
  return v5;
}

- (id)_onqueueTimeoutError
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[KTResultOperation timeoutQueue](self, "timeoutQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation descriptionError](self, "descriptionError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation selfname](self, "selfname"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation pendingDependenciesString:](self, "pendingDependenciesString:", &stru_1002508B8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation(%@) timed out waiting to start for [%@]"), v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("KTResultOperationError"), 3, v7, v4));

  return v8;
}

- (id)timeout:(unint64_t)a3
{
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, a3);
  v6 = objc_claimAutoreleasedReturnValue(-[KTResultOperation timeoutQueue](self, "timeoutQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019DEA4;
  v8[3] = &unk_10023A970;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)addSuccessDependency:(id)a3
{
  -[KTResultOperation addNullableSuccessDependency:](self, "addNullableSuccessDependency:", a3);
}

- (void)addNullableSuccessDependency:(id)a3
{
  KTResultOperation *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation successDependencies](v4, "successDependencies"));
    objc_msgSend(v5, "addObject:", v6);

    -[KTResultOperation addDependency:](v4, "addDependency:", v6);
    objc_sync_exit(v4);

  }
}

- (BOOL)allDependentsSuccessful
{
  KTResultOperation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation successDependencies](self, "successDependencies"));
  LOBYTE(v2) = -[KTResultOperation allSuccessful:](v2, "allSuccessful:", v3);

  return (char)v2;
}

- (BOOL)allSuccessful:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  char v8;
  char v9;
  void *i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  BOOL v29;
  void *v30;
  id obj;
  KTResultOperation *v32;
  uint64_t v33;
  id v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  NSErrorUserInfoKey v41;
  id v42;
  _BYTE v43[128];

  v4 = a3;
  v32 = self;
  objc_sync_enter(v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  v29 = v6 == 0;
  obj = v5;
  if (!v6)
    goto LABEL_22;
  v7 = 0;
  v8 = 0;
  v9 = 1;
  v33 = *(_QWORD *)v38;
  do
  {
    v34 = v6;
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v33)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      v36 = objc_msgSend(v11, "isFinished");
      v35 = objc_msgSend(v11, "isCancelled");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
      v13 = v12 != 0;

      if (objc_msgSend(v11, "isCancelled"))
        objc_msgSend(v30, "addObject:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
      v15 = v14 == 0;

      if (!v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain"));
        if ((objc_msgSend(v17, "isEqual:", CFSTR("KTResultOperationError")) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
          v19 = objc_msgSend(v18, "code") == (id)1;

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
            -[KTResultOperation setError:](v32, "setError:", v20);
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("op"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:description:underlying:](NSError, "errorWithDomain:code:userInfo:description:underlying:", CFSTR("KTResultOperationError"), 1, v20, CFSTR("Success-dependent operation failed"), v22));
        -[KTResultOperation setError:](v32, "setError:", v23);

        goto LABEL_14;
      }
LABEL_15:
      v9 &= v36;
      v7 |= v35;
      v8 |= v13;
    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  }
  while (v6);

  if (!(v7 & 1 | ((v9 & 1) == 0) | v8 & 1))
  {
    v29 = 1;
    goto LABEL_23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v32, "error"));
  v25 = v24 == 0;

  if (v25)
  {
    v41 = NSLocalizedDescriptionKey;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation (%@) cancelled"), v30));
    v42 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KTResultOperationError"), 2, v26));
    -[KTResultOperation setError:](v32, "setError:", v27);

LABEL_22:
    goto LABEL_23;
  }
  v29 = 0;
LABEL_23:

  objc_sync_exit(v32);
  return v29;
}

+ (id)operationWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "addExecutionBlock:", v4);

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
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  location = 0;
  objc_initWeak(&location, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10019E56C;
  v11[3] = &unk_100245D38;
  objc_copyWeak(&v13, &location);
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "addExecutionBlock:", v11);
  objc_msgSend(v8, "setName:", v6);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFinishDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTCondition)completionHandlerDidRunCondition
{
  return (KTCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletionHandlerDidRunCondition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)descriptionErrorCode
{
  return self->_descriptionErrorCode;
}

- (void)setDescriptionErrorCode:(int64_t)a3
{
  self->_descriptionErrorCode = a3;
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSuccessDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (OS_dispatch_queue)timeoutQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeoutQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)finishingBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setFinishingBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishingBlock, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_successDependencies, 0);
  objc_storeStrong((id *)&self->_completionHandlerDidRunCondition, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
