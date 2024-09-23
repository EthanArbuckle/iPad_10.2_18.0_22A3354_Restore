@implementation STUWaitForUnlockOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUWaitForUnlockOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKWaitForUnlockRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D3A88);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUWaitForUnlockOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUWaitForUnlockOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
}

- (void)cancelIfNeeded
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUWaitForUnlockOperation.m"), 48, CFSTR("%@ must be called from the main thread"), v8);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUWaitForUnlockOperation unlockedConditionMonitor](self, "unlockedConditionMonitor"));

  if (v4)
  {
    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUWaitForUnlockOperation endOperationWithError:](self, "endOperationWithError:");
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[STUWaitForUnlockOperation wakeScreenOperation](self, "wakeScreenOperation"));
    objc_msgSend(v9, "cancel");
  }

}

- (void)operationWillFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUWaitForUnlockOperation;
  -[STUTaskOperation operationWillFinish](&v3, "operationWillFinish");
  -[STUWaitForUnlockOperation setUnlockedConditionMonitor:](self, "setUnlockedConditionMonitor:", 0);
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4;
  id v5;

  if (-[STUWaitForUnlockOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[STUWaitForUnlockOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUWaitForUnlockOperation endOperationWithError:](self, "endOperationWithError:", v5);

    }
    else
    {
      -[STUWaitForUnlockOperation createConditionMonitor](self, "createConditionMonitor");
    }
  }
}

- (void)wakeScreen
{
  void *v3;
  STUWakeScreenOperation *v4;
  void *v5;
  STUWakeScreenOperation *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[STUWaitForUnlockOperation request](self, "request"));
  v3 = (void *)objc_opt_new(CRKWakeScreenRequest);
  objc_msgSend(v3, "setShouldBecomeExclusive:", objc_msgSend(v7, "shouldBecomeExclusive"));
  v4 = [STUWakeScreenOperation alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = -[STUTaskOperation initWithRequest:context:delegate:](v4, "initWithRequest:context:delegate:", v3, v5, self);

  -[STUWakeScreenOperation addTarget:selector:forOperationEvents:](v6, "addTarget:selector:forOperationEvents:", self, "wakeScreenOperationDidFinish:", 6);
  -[STUWaitForUnlockOperation setWakeScreenOperation:](self, "setWakeScreenOperation:", v6);
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v6);

}

- (void)wakeScreenOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[STUWaitForUnlockOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUWaitForUnlockOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STUWaitForUnlockOperation createConditionMonitor](self, "createConditionMonitor");
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STUWaitForUnlockOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
LABEL_8:

}

- (void)createConditionMonitor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

  v15[0] = CFSTR("screenState");
  v15[1] = CFSTR("lockState");
  v15[2] = CFSTR("screenSaverActive");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100048760;
  v13[3] = &unk_1000CAFE8;
  v6 = v4;
  v14 = v6;
  v7 = objc_retainBlock(v13);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000487C0;
  v10[3] = &unk_1000C9F38;
  objc_copyWeak(&v11, &location);
  v8 = objc_retainBlock(v10);
  v9 = -[STUConditionMonitor initObservingObject:keyPaths:condition:completion:]([STUConditionMonitor alloc], "initObservingObject:keyPaths:condition:completion:", v6, v5, v7, v8);
  -[STUWaitForUnlockOperation setUnlockedConditionMonitor:](self, "setUnlockedConditionMonitor:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)deviceDidUnlock
{
  uint64_t v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[5];

  if (-[STUWaitForUnlockOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUWaitForUnlockOperation isCancelled](self, "isCancelled"))
    {
      v3 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(v3);
      -[STUWaitForUnlockOperation endOperationWithError:](self, "endOperationWithError:", v5);

    }
    else
    {
      v4 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000488A8;
      block[3] = &unk_1000C97E8;
      block[4] = self;
      dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (STUWakeScreenOperation)wakeScreenOperation
{
  return self->_wakeScreenOperation;
}

- (void)setWakeScreenOperation:(id)a3
{
  objc_storeStrong((id *)&self->_wakeScreenOperation, a3);
}

- (STUConditionMonitor)unlockedConditionMonitor
{
  return self->_unlockedConditionMonitor;
}

- (void)setUnlockedConditionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_unlockedConditionMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedConditionMonitor, 0);
  objc_storeStrong((id *)&self->_wakeScreenOperation, 0);
}

@end
