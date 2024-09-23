@implementation KTStateMultiStateArrivalWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5
{
  return -[KTStateMultiStateArrivalWatcher initNamed:serialQueue:states:failStates:](self, "initNamed:serialQueue:states:failStates:", a3, a4, a5, &__NSDictionary0__struct);
}

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTStateMultiStateArrivalWatcher *v15;
  KTStateMultiStateArrivalWatcher *v16;
  void *v17;
  uint64_t v18;
  NSSet *states;
  void *v20;
  uint64_t v21;
  KTResultOperation *v22;
  NSOperationQueue *v23;
  NSOperationQueue *operationQueue;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)KTStateMultiStateArrivalWatcher;
  v15 = -[KTStateMultiStateArrivalWatcher init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "setByAddingObjectsFromArray:", v17));
    states = v16->_states;
    v16->_states = (NSSet *)v18;

    objc_storeStrong((id *)&v16->_failStates, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("watcher-%@"), v11));
    v21 = objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", v20, &stru_100071C20));
    v22 = v16->_result;
    v16->_result = (KTResultOperation *)v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v23;

    objc_storeStrong((id *)&v16->_queue, a4);
    *(_WORD *)&v16->_completed = 256;
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher states](self, "states"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTStateMultiStateArrivalWatcher(%@): states: %@, result: %@>"), v3, v4, v5));

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
  -[KTStateMultiStateArrivalWatcher onqueueEnterState:](self, "onqueueEnterState:", v6);

}

- (void)onqueueEnterState:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[KTStateMultiStateArrivalWatcher completed](self, "completed"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher states](self, "states"));
    v5 = objc_msgSend(v4, "containsObject:", v8);

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher failStates](self, "failStates"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));

      -[KTStateMultiStateArrivalWatcher onqueueStartFinishOperation:](self, "onqueueStartFinishOperation:", v7);
    }
  }

}

- (void)_onqueuePerformTimeoutWithUnderlyingError
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateMultiStateArrivalWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[KTStateMultiStateArrivalWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher name](self, "name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher states](self, "states"));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation(%@) timed out waiting to start for any state in [%@]"), v4, v5));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("KTResultOperationError"), 3, v7));
    -[KTStateMultiStateArrivalWatcher onqueueStartFinishOperation:](self, "onqueueStartFinishOperation:", v6);

  }
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
  v6 = objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100034358;
  v8[3] = &unk_100070710;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)onqueueStartFinishOperation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[KTStateMultiStateArrivalWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher result](self, "result"));
  objc_msgSend(v6, "setError:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher operationQueue](self, "operationQueue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher result](self, "result"));
  objc_msgSend(v7, "addOperation:", v8);

  -[KTStateMultiStateArrivalWatcher setCompleted:](self, "setCompleted:", 1);
}

- (void)completeWithErrorIfPending:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMultiStateArrivalWatcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000344C8;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (KTResultOperation)result
{
  return (KTResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)states
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)failStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTResultOperation)initialTimeoutListenerOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInitialTimeoutListenerOp:(id)a3
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

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_initialTimeoutListenerOp, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_failStates, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
