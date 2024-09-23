@implementation STUTaskOperation

- (STUTaskOperation)initWithRequest:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  STUTaskOperation *v13;
  STUTaskOperation *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUTaskOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v12)
      goto LABEL_3;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUTaskOperation.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)STUTaskOperation;
  v13 = -[STUTaskOperation initWithRequest:](&v18, "initWithRequest:", v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeWeak((id *)&v14->_delegate, v12);
  }

  return v14;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUTaskOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100040950;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (BOOL)requireLoggedInUser
{
  return 0;
}

- (void)main
{
  -[STUTaskOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "run", 0, 0);
}

- (void)run
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  if (-[STUTaskOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUTaskOperation isCanceled](self, "isCanceled"))
    {
      v3 = CATErrorWithCodeAndUserInfo(404, 0);
      v4 = objc_claimAutoreleasedReturnValue(v3);
    }
    else
    {
      if (!-[STUTaskOperation requireLoggedInUser](self, "requireLoggedInUser")
        || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context")),
            v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device")),
            v7 = objc_msgSend(v6, "loginState"),
            v6,
            v5,
            !v7))
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[STUTaskOperation request](self, "request"));
        -[STUTaskOperation runWithRequest:](self, "runWithRequest:", v9);
        goto LABEL_10;
      }
      v8 = CRKErrorWithCodeAndUserInfo(106, 0);
      v4 = objc_claimAutoreleasedReturnValue(v8);
    }
    v9 = (id)v4;
    -[STUTaskOperation endOperationWithError:](self, "endOperationWithError:", v4);
LABEL_10:

  }
}

- (void)operationWillFinish
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUExclusiveOperationManager sharedManager](STUExclusiveOperationManager, "sharedManager"));
  objc_msgSend(v3, "stopWaitingForOperationToBeExclusive:", self->mExclusivityWaitToken);

  v4.receiver = self;
  v4.super_class = (Class)STUTaskOperation;
  -[STUTaskOperation operationWillFinish](&v4, "operationWillFinish");
}

- (BOOL)supportsAlwaysAllow
{
  return 1;
}

- (void)askUserPermissionForFeature:(id)a3 alertModel:(id)a4
{
  id v6;
  id v7;
  STUAskOperation_iOS *v8;
  void *v9;
  void *v10;
  STUAskOperation_iOS *v11;
  STUAskOperation_iOS *mAskOperation;

  v6 = a4;
  v7 = a3;
  v8 = [STUAskOperation_iOS alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation request](self, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = -[STUAskOperation initWithRequest:context:delegate:feature:alertModel:supportsAlwaysAllow:](v8, "initWithRequest:context:delegate:feature:alertModel:supportsAlwaysAllow:", v9, v10, self, v7, v6, -[STUTaskOperation supportsAlwaysAllow](self, "supportsAlwaysAllow"));

  mAskOperation = self->mAskOperation;
  self->mAskOperation = v11;

  -[STUAskOperation_iOS addTarget:selector:forOperationEvents:](self->mAskOperation, "addTarget:selector:forOperationEvents:", self, "_askOperationDidFinish:", 6);
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", self->mAskOperation);
}

- (BOOL)isAsking
{
  return self->mAskOperation != 0;
}

- (void)_askOperationDidFinish:(id)a3
{
  STUAskOperation_iOS *mAskOperation;
  id v5;

  mAskOperation = self->mAskOperation;
  self->mAskOperation = 0;
  v5 = a3;

  -[STUTaskOperation askOperationDidFinish:](self, "askOperationDidFinish:", v5);
}

- (void)askOperationDidFinish:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUTaskOperation.m"), 108, CFSTR("%@ must implement %@"), v7, v9);

}

- (void)requestToBecomeExclusive
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id mExclusivityWaitToken;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  STUTaskOperation *v13;

  v3 = sub_100040E7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Request to become exclusive", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUExclusiveOperationManager sharedManager](STUExclusiveOperationManager, "sharedManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100040EBC;
  v10[3] = &unk_1000C9F38;
  objc_copyWeak(&v11, (id *)buf);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100040F64;
  v8[3] = &unk_1000C9F38;
  objc_copyWeak(&v9, (id *)buf);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestToMakeOperationExclusive:successBlock:failureBlock:", self, v10, v8));
  mExclusivityWaitToken = self->mExclusivityWaitToken;
  self->mExclusivityWaitToken = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)operationMightHaveBecomeExclusive:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  STUTaskOperation *v10;

  if (a3)
  {
    v4 = sub_100040E7C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Did become exclusive", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    if (qword_1000FC3A8 != -1)
      dispatch_once(&qword_1000FC3A8, &stru_1000CAC50);
    v7 = qword_1000FC3A0;
    if (os_log_type_enabled((os_log_t)qword_1000FC3A0, OS_LOG_TYPE_ERROR))
      sub_10007C26C(v7);
    v8 = CATErrorWithCodeAndUserInfo(404, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  if (-[STUTaskOperation isExecuting](self, "isExecuting"))
    -[STUTaskOperation exclusivityRequestDidComplete:](self, "exclusivityRequestDidComplete:", v6);

}

- (void)exclusivityRequestDidComplete:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUTaskOperation.m"), 143, CFSTR("%@ must implement %@"), v7, v9);

}

- (void)runWithRequest:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUTaskOperation.m"), 147, CFSTR("%@ must implement %@"), v7, v9);

}

- (id)instructorName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "instructor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));

  return v4;
}

- (void)enqueueOperation:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUTaskOperation.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

  }
  v5 = objc_opt_class(CATTaskOperation);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    objc_msgSend(v8, "setNotificationDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation delegate](self, "delegate"));
  objc_msgSend(v6, "taskOperation:needsToEnqueueOperation:", self, v8);

}

- (void)enqueueOperations:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)taskOperation:(id)a3 needsToEnqueueOperation:(id)a4
{
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", a4);
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  -[STUTaskOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", a4, a5);
}

- (STUTaskOperationContext)context
{
  return self->_context;
}

- (STUTaskOperationDelegate)delegate
{
  return (STUTaskOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->mAskOperation, 0);
  objc_storeStrong(&self->mExclusivityWaitToken, 0);
}

@end
