@implementation OctagonStateTransitionWatcher

- (id)initNamed:(id)a3 stateMachine:(id)a4 path:(id)a5 initialRequest:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OctagonStateTransitionWatcher *v15;
  OctagonStateTransitionWatcher *v16;
  uint64_t v17;
  OctagonStateTransitionPathStep *remainingPath;
  void *v19;
  uint64_t v20;
  CKKSResultOperation *v21;
  NSOperationQueue *v22;
  NSOperationQueue *operationQueue;
  uint64_t v24;
  OS_dispatch_queue *queue;
  uint64_t v26;
  NSDictionary *stateNumberMap;
  uint64_t v28;
  NSString *unexpectedStateErrorDomain;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)OctagonStateTransitionWatcher;
  v15 = -[OctagonStateTransitionWatcher init](&v31, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_intendedPath, a5);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asPathStep"));
    remainingPath = v16->_remainingPath;
    v16->_remainingPath = (OctagonStateTransitionPathStep *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("watcher-%@"), v11));
    v20 = objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", v19, &stru_1002DD098));
    v21 = v16->_result;
    v16->_result = (CKKSResultOperation *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queue"));
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateNumberMap"));
    stateNumberMap = v16->_stateNumberMap;
    v16->_stateNumberMap = (NSDictionary *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unexpectedStateErrorDomain"));
    unexpectedStateErrorDomain = v16->_unexpectedStateErrorDomain;
    v16->_unexpectedStateErrorDomain = (NSString *)v28;

    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_initialRequest, a6);
    *(_WORD *)&v16->_active = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonStateTransitionWatcher(%@): remaining: %@, result: %@>"), v3, v4, v5));

  return v6;
}

- (void)onqueueHandleTransition:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[OctagonStateTransitionWatcher completed](self, "completed");

    if ((v7 & 1) == 0)
    {
      if (-[OctagonStateTransitionWatcher active](self, "active"))
      {
LABEL_6:
        -[OctagonStateTransitionWatcher onqueueProcessTransition:](self, "onqueueProcessTransition:", v12);
        goto LABEL_7;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher intendedPath](self, "intendedPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "initialState"));
      v11 = objc_msgSend(v8, "isEqualToString:", v10);

      if (v11)
      {
        -[OctagonStateTransitionWatcher setActive:](self, "setActive:", 1);
        goto LABEL_6;
      }
    }
  }
LABEL_7:

}

- (void)onqueueHandleStartTimeout:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateTransitionWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation(%@) timed out waiting to start for [%@]"), v5, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSResultOperationError"), 3, v7, v10));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
    objc_msgSend(v9, "setError:", v8);

    -[OctagonStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
  }

}

- (void)onqueueProcessTransition:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[3];
  _QWORD v40[3];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[OctagonStateTransitionWatcher completed](self, "completed");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextStep:", v10));

      if (v11)
      {
        -[OctagonStateTransitionWatcher setRemainingPath:](self, "setRemainingPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
        v13 = objc_msgSend(v12, "successState");

        if (v13)
          -[OctagonStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
          objc_msgSend(v16, "setError:", v15);
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher stateNumberMap](self, "stateNumberMap"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));

          v19 = &AAAccountClassPrimary_ptr;
          if (v15)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher unexpectedStateErrorDomain](self, "unexpectedStateErrorDomain"));
            v21 = objc_msgSend(v15, "integerValue");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unexpected state '%@'"), v22));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", v20, v21, v23));

            v19 = &AAAccountClassPrimary_ptr;
          }
          else
          {
            v16 = 0;
          }
          v24 = v19[296];
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state became %@, was expecting %@"), v25, v26));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.security.octagon"), 30, v27, v16));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
          objc_msgSend(v29, "setError:", v28);

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "error"));
        v39[0] = CFSTR("name");
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher name](self, "name"));
        v40[0] = v32;
        v39[1] = CFSTR("intended");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher remainingPath](self, "remainingPath"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "followStates"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "allKeys"));
        v40[1] = v35;
        v39[2] = CFSTR("became");
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextState"));
        v40[2] = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 3));
        objc_msgSend(v30, "logUnrecoverableError:forEvent:withAttributes:", v31, CFSTR("OctagonEventStateTransition"), v37);

        -[OctagonStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
        v11 = 0;
      }

    }
  }

}

- (void)onqueueStartFinishOperation
{
  NSObject *v3;
  void *v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[OctagonStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher operationQueue](self, "operationQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionWatcher result](self, "result"));
  objc_msgSend(v4, "addOperation:", v5);

  -[OctagonStateTransitionWatcher setActive:](self, "setActive:", 0);
  -[OctagonStateTransitionWatcher setCompleted:](self, "setCompleted:", 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CKKSResultOperation)result
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (OctagonStateTransitionPath)intendedPath
{
  return (OctagonStateTransitionPath *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (OctagonStateTransitionPathStep)remainingPath
{
  return (OctagonStateTransitionPathStep *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemainingPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OctagonStateTransitionRequest)initialRequest
{
  return (OctagonStateTransitionRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInitialRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)stateNumberMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateNumberMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)unexpectedStateErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnexpectedStateErrorDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unexpectedStateErrorDomain, 0);
  objc_storeStrong((id *)&self->_stateNumberMap, 0);
  objc_storeStrong((id *)&self->_initialRequest, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_remainingPath, 0);
  objc_storeStrong((id *)&self->_intendedPath, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
