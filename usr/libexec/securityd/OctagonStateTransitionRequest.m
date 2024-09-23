@implementation OctagonStateTransitionRequest

- (id)init:(id)a3 sourceStates:(id)a4 serialQueue:(id)a5 transitionOp:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OctagonStateTransitionRequest *v15;
  OctagonStateTransitionRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OctagonStateTransitionRequest;
  v15 = -[OctagonStateTransitionRequest init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_sourceStates, a4);
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_timeoutCanOccur = 1;
    objc_storeStrong((id *)&v16->_transitionOperation, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest sourceStates](self, "sourceStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonStateTransitionRequest: %@ %@ sources:%d>"), v3, v4, objc_msgSend(v5, "count")));

  return v6;
}

- (id)_onqueueStart
{
  NSObject *v3;
  void *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OctagonStateTransitionRequest timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateTransitionRequest setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)onqueueHandleStartTimeout:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateTransitionRequest timeoutCanOccur](self, "timeoutCanOccur"))
  {
    -[OctagonStateTransitionRequest setTimeoutCanOccur:](self, "setTimeoutCanOccur:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    objc_msgSend(v5, "setDescriptionUnderlyingError:", v11);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    objc_msgSend(v6, "setDescriptionErrorCode:", 2000);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    v8 = objc_msgSend(v7, "timeout:", 0);

    v9 = objc_alloc_init((Class)NSOperationQueue);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionRequest transitionOperation](self, "transitionOperation"));
    objc_msgSend(v9, "addOperation:", v10);

  }
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)sourceStates
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (OctagonStateTransitionOperationProtocol)transitionOperation
{
  return (OctagonStateTransitionOperationProtocol *)objc_getProperty(self, a2, 32, 1);
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
