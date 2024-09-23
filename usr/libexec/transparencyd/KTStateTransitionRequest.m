@implementation KTStateTransitionRequest

- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 timeout:(unint64_t)a6 transitionOp:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  KTStateTransitionRequest *v17;
  KTStateTransitionRequest *v18;
  id v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)KTStateTransitionRequest;
  v17 = -[KTStateTransitionRequest init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_sourceStates, a4);
    objc_storeStrong((id *)&v18->_queue, a5);
    v18->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v18->_transitionOperation, a7);
  }
  v19 = -[KTStateTransitionRequest timeout:](v18, "timeout:", a6);

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest transitionOperation](self, "transitionOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest sourceStates](self, "sourceStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTStateTransitionRequest: %@ %@ sources:%d>"), v3, v4, objc_msgSend(v5, "count")));

  return v6;
}

- (id)_onqueueStart
{
  NSObject *v3;
  void *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateTransitionRequest timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[KTStateTransitionRequest setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest transitionOperation](self, "transitionOperation"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
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
  v6 = objc_claimAutoreleasedReturnValue(-[KTStateTransitionRequest queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100111FBC;
  v8[3] = &unk_10023A970;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)sourceStates
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (KTStateTransitionOperationProtocol)transitionOperation
{
  return (KTStateTransitionOperationProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transitionOperation, 0);
  objc_storeStrong((id *)&self->_sourceStates, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
