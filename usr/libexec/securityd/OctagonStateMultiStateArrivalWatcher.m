@implementation OctagonStateMultiStateArrivalWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5
{
  return -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:failStates:](self, "initNamed:serialQueue:states:failStates:", a3, a4, a5, &__NSDictionary0__struct);
}

- (id)initNamed:(id)a3 serialQueue:(id)a4 states:(id)a5 failStates:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OctagonStateMultiStateArrivalWatcher *v15;
  OctagonStateMultiStateArrivalWatcher *v16;
  void *v17;
  uint64_t v18;
  NSSet *states;
  void *v20;
  uint64_t v21;
  CKKSResultOperation *v22;
  NSOperationQueue *v23;
  NSOperationQueue *operationQueue;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)OctagonStateMultiStateArrivalWatcher;
  v15 = -[OctagonStateMultiStateArrivalWatcher init](&v26, "init");
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
    v21 = objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", v20, &stru_1002DD0B8));
    v22 = v16->_result;
    v16->_result = (CKKSResultOperation *)v21;

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher states](self, "states"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonStateMultiStateArrivalWatcher(%@): states: %@, result: %@>"), v3, v4, v5));

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
  -[OctagonStateMultiStateArrivalWatcher onqueueEnterState:](self, "onqueueEnterState:", v6);

}

- (void)onqueueEnterState:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[OctagonStateMultiStateArrivalWatcher completed](self, "completed"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher states](self, "states"));
    v5 = objc_msgSend(v4, "containsObject:", v8);

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher failStates](self, "failStates"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));

      -[OctagonStateMultiStateArrivalWatcher onqueueStartFinishOperation:](self, "onqueueStartFinishOperation:", v7);
    }
  }

}

- (void)onqueueHandleStartTimeout:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateMultiStateArrivalWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateMultiStateArrivalWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher states](self, "states"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation(%@) timed out waiting to start for any state in [%@]"), v5, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSResultOperationError"), 3, v7, v9));
    -[OctagonStateMultiStateArrivalWatcher onqueueStartFinishOperation:](self, "onqueueStartFinishOperation:", v8);

  }
}

- (void)onqueueStartFinishOperation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[OctagonStateMultiStateArrivalWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher result](self, "result"));
  objc_msgSend(v6, "setError:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher operationQueue](self, "operationQueue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher result](self, "result"));
  objc_msgSend(v7, "addOperation:", v8);

  -[OctagonStateMultiStateArrivalWatcher setCompleted:](self, "setCompleted:", 1);
}

- (void)completeWithErrorIfPending:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMultiStateArrivalWatcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2344;
  block[3] = &unk_1002E9728;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CKKSResultOperation)result
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24, 1);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_failStates, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
