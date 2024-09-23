@implementation CKKSResultOperation

- (CKKSResultOperation)init
{
  CKKSResultOperation *v2;
  NSError *error;
  NSMutableArray *v4;
  NSMutableArray *successDependencies;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *timeoutQueue;
  CKKSCondition *v10;
  CKKSCondition *completionHandlerDidRunCondition;
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
  v21.super_class = (Class)CKKSResultOperation;
  v2 = -[CKKSResultOperation init](&v21, "init");
  if (v2)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
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

    v10 = objc_alloc_init(CKKSCondition);
    completionHandlerDidRunCondition = v2->_completionHandlerDidRunCondition;
    v2->_completionHandlerDidRunCondition = v10;

    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100121FFC;
    v18 = &unk_1002EB598;
    objc_copyWeak(&v19, &location);
    v12 = objc_retainBlock(&v15);
    finishingBlock = v2->_finishingBlock;
    v2->_finishingBlock = v12;

    -[CKKSResultOperation setCompletionBlock:](v2, "setCompletionBlock:", &stru_1002DED68, v15, v16, v17, v18);
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

  if ((-[CKKSResultOperation isFinished](self, "isFinished") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation finishDate](self, "finishDate"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("finished %@"), v3));

  }
  else
  {
    if ((-[CKKSResultOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v5 = CFSTR("cancelled");
    }
    else if ((-[CKKSResultOperation isExecuting](self, "isExecuting") & 1) != 0)
    {
      v5 = CFSTR("executing");
    }
    else
    {
      v6 = -[CKKSResultOperation isReady](self, "isReady");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation operationStateString](self, "operationStateString"));
  off_100340BE8();
  v5 = v4;
  v6 = *v4 + 1;
  *v4 = v6;
  if (v6 < 0xB)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation selfname](self, "selfname"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@ error:%@>"), v7, v3, v10);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@%@>"), v7, v3, v10);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(v11);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation selfname](self, "selfname"));
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
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100121E54;
  v7[3] = &unk_1002EA830;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)CKKSResultOperation;
  -[CKKSResultOperation setCompletionBlock:](&v6, "setCompletionBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)start
{
  objc_super v3;

  if (-[CKKSResultOperation allDependentsSuccessful](self, "allDependentsSuccessful"))
    -[CKKSResultOperation invalidateTimeout](self, "invalidateTimeout");
  else
    -[CKKSResultOperation cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CKKSResultOperation;
  -[CKKSResultOperation start](&v3, "start");
}

- (void)invalidateTimeout
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeoutQueue](self, "timeoutQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121E18;
  block[3] = &unk_1002EC350;
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
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation dependencies](self, "dependencies"));
  v3 = objc_msgSend(v2, "copy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexesOfObjectsPassingTest:", &stru_1002DED88));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsAtIndexes:", v4));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(CKKSResultOperation);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = v12;
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "descriptionError", (_QWORD)v20));
          v16 = (void *)v15;
          if (v15)
            v17 = (void *)v15;
          else
            v17 = v9;
          v18 = v17;

          v9 = v18;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)descriptionError
{
  _DWORD *v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  off_100340C00();
  v4 = v3;
  ++*v3;
  if (-[CKKSResultOperation descriptionErrorCode](self, "descriptionErrorCode"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation descriptionUnderlyingError](self, "descriptionUnderlyingError"));

    if (v5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation descriptionUnderlyingError](self, "descriptionUnderlyingError"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, NSUnderlyingErrorKey);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSResultOperationDescriptionError"), -[CKKSResultOperation descriptionErrorCode](self, "descriptionErrorCode"), v5));

  }
  else
  {
    if (*v4 < 0xBu)
      v8 = objc_claimAutoreleasedReturnValue(-[CKKSResultOperation dependenciesDescriptionError](self, "dependenciesDescriptionError"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSResultOperationDescriptionError"), -1, CFSTR("Excess recursion")));
    v7 = (void *)v8;
  }
  --*v4;
  return v7;
}

- (id)_onqueueTimeoutError
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeoutQueue](self, "timeoutQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation descriptionError](self, "descriptionError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation selfname](self, "selfname"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation pendingDependenciesString:](self, "pendingDependenciesString:", &stru_1002EE888));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation(%@) timed out waiting to start for [%@]"), v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSResultOperationError"), 3, v7, v4));

  return v8;
}

- (id)timeout:(unint64_t)a3
{
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, a3);
  v6 = objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeoutQueue](self, "timeoutQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100121D90;
  v8[3] = &unk_1002EB598;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)addNullableSuccessDependency:(id)a3
{
  CKKSResultOperation *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation successDependencies](v4, "successDependencies"));
    objc_msgSend(v5, "addObject:", v6);

    -[CKKSResultOperation addDependency:](v4, "addDependency:", v6);
    objc_sync_exit(v4);

  }
}

- (BOOL)allDependentsSuccessful
{
  CKKSResultOperation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation successDependencies](self, "successDependencies"));
  LOBYTE(v2) = -[CKKSResultOperation allSuccessful:](v2, "allSuccessful:", v3);

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
  _BOOL4 v23;
  void *v24;
  void *v25;
  BOOL v27;
  void *v28;
  id obj;
  CKKSResultOperation *v30;
  uint64_t v31;
  id v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSErrorUserInfoKey v39;
  id v40;
  _BYTE v41[128];

  v4 = a3;
  v30 = self;
  objc_sync_enter(v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  v27 = v6 == 0;
  obj = v5;
  if (!v6)
    goto LABEL_22;
  v7 = 0;
  v8 = 0;
  v31 = *(_QWORD *)v36;
  v9 = 1;
  do
  {
    v32 = v6;
    for (i = 0; i != v32; i = (char *)i + 1)
    {
      if (*(_QWORD *)v36 != v31)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
      v34 = objc_msgSend(v11, "isFinished");
      v33 = objc_msgSend(v11, "isCancelled");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
      v13 = v12 != 0;

      if (objc_msgSend(v11, "isCancelled"))
        objc_msgSend(v28, "addObject:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
      v15 = v14 == 0;

      if (!v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain"));
        if ((objc_msgSend(v17, "isEqual:", CFSTR("CKKSResultOperationError")) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
          v19 = objc_msgSend(v18, "code") == (id)1;

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
            -[CKKSResultOperation setError:](v30, "setError:", v20);
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSResultOperationError"), 1, CFSTR("Success-dependent operation failed"), v20));
        -[CKKSResultOperation setError:](v30, "setError:", v21);

        goto LABEL_14;
      }
LABEL_15:
      v9 &= v34;
      v7 |= v33;
      v8 |= v13;
    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  }
  while (v6);

  if (!(v7 & 1 | ((v9 & 1) == 0) | v8 & 1))
  {
    v27 = 1;
    goto LABEL_23;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v30, "error"));
  v23 = v22 == 0;

  if (v23)
  {
    v39 = NSLocalizedDescriptionKey;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation (%@) cancelled"), v28));
    v40 = v5;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSResultOperationError"), 2, v24));
    -[CKKSResultOperation setError:](v30, "setError:", v25);

LABEL_22:
    goto LABEL_23;
  }
  v27 = 0;
LABEL_23:

  objc_sync_exit(v30);
  return v27;
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

- (CKKSCondition)completionHandlerDidRunCondition
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32, 1);
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

- (NSError)descriptionUnderlyingError
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDescriptionUnderlyingError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSuccessDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeoutQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)finishingBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFinishingBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishingBlock, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_successDependencies, 0);
  objc_storeStrong((id *)&self->_descriptionUnderlyingError, 0);
  objc_storeStrong((id *)&self->_completionHandlerDidRunCondition, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (CKKSResultOperation)operationWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "addExecutionBlock:", v4);

  return (CKKSResultOperation *)v5;
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
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001221F4;
  v11[3] = &unk_1002EA830;
  objc_copyWeak(&v13, &location);
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "addExecutionBlock:", v11);
  objc_msgSend(v8, "setName:", v6);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

@end
