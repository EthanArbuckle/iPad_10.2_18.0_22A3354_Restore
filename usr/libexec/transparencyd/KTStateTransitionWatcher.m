@implementation KTStateTransitionWatcher

- (id)initNamed:(id)a3 serialQueue:(id)a4 path:(id)a5 initialRequest:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTStateTransitionWatcher *v15;
  KTStateTransitionWatcher *v16;
  uint64_t v17;
  KTStateTransitionPathStep *remainingPath;
  void *v19;
  uint64_t v20;
  KTResultOperation *v21;
  NSOperationQueue *v22;
  NSOperationQueue *operationQueue;
  void *v24;
  id v25;
  uint64_t v26;
  KTResultOperation *initialTimeoutListenerOp;
  KTResultOperation *v28;
  void *v29;
  KTSignalTermHandler *v30;
  KTSignalTermHandler *v31;
  KTSignalTermHandler *sigTerm;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;
  objc_super v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)KTStateTransitionWatcher;
  v15 = -[KTStateTransitionWatcher init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_intendedPath, a5);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asPathStep"));
    remainingPath = v16->_remainingPath;
    v16->_remainingPath = (KTStateTransitionPathStep *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("watcher-%@"), v11));
    v20 = objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", v19, &stru_10024A410));
    v21 = v16->_result;
    v16->_result = (KTResultOperation *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v22;

    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_initialRequest, a6);
    location = 0;
    objc_initWeak(&location, v16);
    if (v14)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("watcher-timeout-%@"), v11));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100174DCC;
      v36[3] = &unk_100246840;
      objc_copyWeak(&v38, &location);
      v25 = v14;
      v37 = v25;
      v26 = objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", v24, v36));
      initialTimeoutListenerOp = v16->_initialTimeoutListenerOp;
      v16->_initialTimeoutListenerOp = (KTResultOperation *)v26;

      v28 = v16->_initialTimeoutListenerOp;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "transitionOperation"));
      -[KTResultOperation addDependency:](v28, "addDependency:", v29);

      -[NSOperationQueue addOperation:](v16->_operationQueue, "addOperation:", v16->_initialTimeoutListenerOp);
      objc_destroyWeak(&v38);
    }
    v30 = [KTSignalTermHandler alloc];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100174EE8;
    v34[3] = &unk_10023A970;
    objc_copyWeak(&v35, &location);
    v31 = -[KTSignalTermHandler initWithSIGTERMNotification:](v30, "initWithSIGTERMNotification:", v34);
    sigTerm = v16->_sigTerm;
    v16->_sigTerm = v31;

    *(_WORD *)&v16->_active = 0;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTStateTransitionWatcher(%@): remaining: %@, result: %@>"), v3, v4, v5));

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
  v4 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[KTStateTransitionWatcher completed](self, "completed");

    if ((v7 & 1) == 0)
    {
      if (-[KTStateTransitionWatcher active](self, "active"))
      {
LABEL_6:
        -[KTStateTransitionWatcher onqueueProcessTransition:](self, "onqueueProcessTransition:", v12);
        goto LABEL_7;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher intendedPath](self, "intendedPath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "initialState"));
      v11 = objc_msgSend(v8, "isEqualToString:", v10);

      if (v11)
      {
        -[KTStateTransitionWatcher setActive:](self, "setActive:", 1);
        goto LABEL_6;
      }
    }
  }
LABEL_7:

}

- (void)_onqueuePerformTimeoutWithUnderlyingError:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
    dispatch_source_cancel(v6);

    -[KTStateTransitionWatcher setTimer:](self, "setTimer:", 0);
  }
  if (-[KTStateTransitionWatcher timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[KTStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation(%@) timed out waiting to start for [%@]"), v7, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("KTResultOperationError"), 3, v9, v12));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
    objc_msgSend(v11, "setError:", v10);

    -[KTStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
  }

}

- (id)timeout:(unint64_t)a3
{
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  -[KTStateTransitionWatcher setTimer:](self, "setTimer:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100175400;
  v15 = &unk_10023A970;
  objc_copyWeak(&v16, &location);
  dispatch_source_set_event_handler(v7, &v12);

  v8 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer", v12, v13, v14, v15));
  v9 = dispatch_time(0, a3);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);

  v10 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
  dispatch_resume(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return self;
}

- (BOOL)isExpectedFailure:(id)a3 expected:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  id obj;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if (!objc_msgSend(v8, "isEqual:", v9))
  {

    goto LABEL_7;
  }
  v10 = objc_msgSend(v7, "code");
  v11 = objc_msgSend(v6, "code");

  if (v10 != v11)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_36;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    if (v15)
      v16 = -[KTStateTransitionWatcher isExpectedFailure:expected:](self, "isExpectedFailure:expected:", v15, v13);
    else
      v16 = 0;

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSMultipleUnderlyingErrorsKey));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSMultipleUnderlyingErrorsKey));

      v34 = (void *)v20;
      if (v20)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        obj = v18;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v21)
        {
          v22 = v21;
          v33 = *(_QWORD *)v40;
          v31 = v18;
          while (1)
          {
            v23 = 0;
LABEL_13:
            if (*(_QWORD *)v40 != v33)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v23);
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v25 = v34;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (!v26)
              break;
            v27 = v26;
            v28 = *(_QWORD *)v36;
LABEL_17:
            v29 = 0;
            while (1)
            {
              if (*(_QWORD *)v36 != v28)
                objc_enumerationMutation(v25);
              if (-[KTStateTransitionWatcher isExpectedFailure:expected:](self, "isExpectedFailure:expected:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v29), v24))
              {
                break;
              }
              if (v27 == (id)++v29)
              {
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v27)
                  goto LABEL_17;
                goto LABEL_30;
              }
            }

            if ((id)++v23 != v22)
              goto LABEL_13;
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
            v16 = 1;
            v18 = v31;
            v13 = 0;
            if (!v22)
              goto LABEL_33;
          }
LABEL_30:

          v16 = 0;
          v18 = v31;
          v13 = 0;
        }
        else
        {
          v16 = 1;
        }
LABEL_33:

      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 1;
    }

  }
LABEL_36:

  return v16;
}

- (BOOL)onqueueCheckExpectedFailure:(id)a3 attempt:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (!v6 || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error")), v9, !v9))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "expectedFailure"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));

      if (!v18)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state %@, had unexpected success"), v11));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.transparency"), -4713, v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
        objc_msgSend(v21, "setError:", v20);
        goto LABEL_14;
      }
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "expectedFailure"));
    if (v22)
    {
      v19 = (void *)v22;
      v14 = 1;
LABEL_15:

      goto LABEL_16;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));

    if (!v26)
    {
      v14 = 1;
      goto LABEL_17;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state %@, had unexpected failure: expected no failure"), v11));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.transparency"), -4714, v19, v20));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
    objc_msgSend(v27, "setError:", v21);

LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expectedFailure"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
  v13 = -[KTStateTransitionWatcher isExpectedFailure:expected:](self, "isExpectedFailure:expected:", v12, v6);

  if ((v13 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state %@, had unexpected error %@, expected %@"), v19, v20, v11));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.transparency"), -4712, v21, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
    objc_msgSend(v25, "setError:", v24);

    goto LABEL_14;
  }
  v14 = 1;
LABEL_16:

LABEL_17:
  return v14;
}

+ (id)stripUnexpectedPathError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.transparency")) & 1) != 0
    || objc_msgSend(v3, "code") == (id)-4711
    || objc_msgSend(v3, "code") == (id)-4712
    || objc_msgSend(v3, "code") == (id)-4713)
  {

  }
  else
  {
    v12 = objc_msgSend(v3, "code");

    if (v12 != (id)-4714)
    {
      v10 = v3;
      goto LABEL_10;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v8 = objc_opt_class(NSError, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    v9 = v6;
  else
    v9 = v3;
  v10 = v9;

LABEL_10:
  return v10;
}

- (void)onqueueProcessTransition:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[KTStateTransitionWatcher completed](self, "completed");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextStep:", v9));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "expectedFailure"));
        v13 = -[KTStateTransitionWatcher onqueueCheckExpectedFailure:attempt:](self, "onqueueCheckExpectedFailure:attempt:", v12, v22);

        if (v13)
        {
          -[KTStateTransitionWatcher setRemainingPath:](self, "setRemainingPath:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
          v15 = objc_msgSend(v14, "successState");

          if ((v15 & 1) == 0)
            goto LABEL_12;
        }
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
          objc_msgSend(v18, "setError:", v17);
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextState"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher remainingPath](self, "remainingPath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state became %@, was expecting %@"), v17, v18));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.transparency"), -4711, v19));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
          objc_msgSend(v21, "setError:", v20);

        }
      }
      -[KTStateTransitionWatcher onqueueStartFinishOperation](self, "onqueueStartFinishOperation");
LABEL_12:

    }
  }

}

- (void)onqueueStartFinishOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[KTStateTransitionWatcher setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher sigTerm](self, "sigTerm"));
  objc_msgSend(v4, "unregister");

  -[KTStateTransitionWatcher setSigTerm:](self, "setSigTerm:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher timer](self, "timer"));
    dispatch_source_cancel(v6);

    -[KTStateTransitionWatcher setTimer:](self, "setTimer:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher operationQueue](self, "operationQueue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionWatcher result](self, "result"));
  objc_msgSend(v7, "addOperation:", v8);

  -[KTStateTransitionWatcher setActive:](self, "setActive:", 0);
  -[KTStateTransitionWatcher setCompleted:](self, "setCompleted:", 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (KTResultOperation)result
{
  return (KTResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (KTStateTransitionPath)intendedPath
{
  return (KTStateTransitionPath *)objc_getProperty(self, a2, 32, 1);
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

- (KTStateTransitionPathStep)remainingPath
{
  return (KTStateTransitionPathStep *)objc_getProperty(self, a2, 40, 1);
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

- (KTStateTransitionRequest)initialRequest
{
  return (KTStateTransitionRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInitialRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (KTResultOperation)initialTimeoutListenerOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitialTimeoutListenerOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (KTSignalTermHandler)sigTerm
{
  return (KTSignalTermHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSigTerm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigTerm, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_initialTimeoutListenerOp, 0);
  objc_storeStrong((id *)&self->_initialRequest, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_remainingPath, 0);
  objc_storeStrong((id *)&self->_intendedPath, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
