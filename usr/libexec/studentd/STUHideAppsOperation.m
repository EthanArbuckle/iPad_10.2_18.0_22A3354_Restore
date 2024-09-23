@implementation STUHideAppsOperation

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUHideAppsOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031A7C;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = a3;
  v5 = objc_opt_class(CRKHideAppsRequest);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4;
  id v5;

  if (-[STUHideAppsOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[STUHideAppsOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUHideAppsOperation endOperationWithError:](self, "endOperationWithError:", v5);

    }
    else
    {
      -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", 0, 0);
    }
  }
}

- (void)askOperationDidFinish:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[STUHideAppsOperation isExecuting](self, "isExecuting");
  v5 = v10;
  if (v4)
  {
    if (-[STUHideAppsOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation request](self, "request"));
        -[STUHideAppsOperation performRequest:](self, "performRequest:", v9);
        goto LABEL_8;
      }
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    }
    v9 = (void *)v7;
    -[STUHideAppsOperation endOperationWithError:](self, "endOperationWithError:", v7);
LABEL_8:

    v5 = v10;
  }

}

- (void)waitForUnlock
{
  void *v3;
  STUWaitForUnlockOperation *v4;
  void *v5;
  STUWaitForUnlockOperation *v6;
  id v7;

  v7 = (id)objc_opt_new(CRKWaitForUnlockRequest);
  objc_msgSend(v7, "setShouldBecomeExclusive:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation request](self, "request"));
  objc_msgSend(v7, "setHandlesNotifications:", objc_msgSend(v3, "handlesNotifications"));

  v4 = [STUWaitForUnlockOperation alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = -[STUTaskOperation initWithRequest:context:delegate:](v4, "initWithRequest:context:delegate:", v7, v5, self);

  -[STUWaitForUnlockOperation setNotificationDelegate:](v6, "setNotificationDelegate:", self);
  -[STUWaitForUnlockOperation addTarget:selector:forOperationEvents:](v6, "addTarget:selector:forOperationEvents:", self, "waitForUnlockOperationDidFinish:", 6);
  -[STUHideAppsOperation setWaitForUnlockOperation:](self, "setWaitForUnlockOperation:", v6);
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v6);

}

- (void)waitForUnlockOperationDidFinish:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[STUHideAppsOperation isExecuting](self, "isExecuting");
  v5 = v10;
  if (v4)
  {
    if (-[STUHideAppsOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation request](self, "request"));
        -[STUHideAppsOperation performRequest:](self, "performRequest:", v9);
        goto LABEL_8;
      }
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    }
    v9 = (void *)v7;
    -[STUHideAppsOperation endOperationWithError:](self, "endOperationWithError:", v7);
LABEL_8:

    v5 = v10;
  }

}

- (void)performRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;

  v13 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation makePauseOperation](self, "makePauseOperation"));
  -[NSMutableArray addObject:](v13, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "classSessionReporter"));
  v7 = objc_msgSend(v6, "hasActiveRemoteClassSessions");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation makeMuteOperation](self, "makeMuteOperation"));
    -[NSMutableArray addObject:](v13, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation makeOpenSpringboardOperation](self, "makeOpenSpringboardOperation"));
  -[NSMutableArray addObject:](v13, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRKSequentialOperation sequentialOperationWithOperations:](CRKSequentialOperation, "sequentialOperationWithOperations:", v13));
  -[STUHideAppsOperation setSequentialOperation:](self, "setSequentialOperation:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation sequentialOperation](self, "sequentialOperation"));
  objc_msgSend(v11, "addTarget:selector:forOperationEvents:", self, "sequentialOperationDidFinish:", 6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation sequentialOperation](self, "sequentialOperation"));
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v12);

}

- (id)makeOpenSpringboardOperation
{
  CRKOpenAppRequest *v3;
  void *v4;
  STUOpenAppOperation *v5;
  void *v6;
  STUOpenAppOperation *v7;

  v3 = objc_opt_new(CRKOpenAppRequest);
  -[CRKOpenAppRequest setBundleIdentifier:](v3, "setBundleIdentifier:", CRKSpringBoardBundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation request](self, "request"));
  -[CRKOpenAppRequest setHandlesNotifications:](v3, "setHandlesNotifications:", objc_msgSend(v4, "handlesNotifications"));

  v5 = [STUOpenAppOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = -[STUTaskOperation initWithRequest:context:delegate:](v5, "initWithRequest:context:delegate:", v3, v6, self);

  -[STUOpenAppOperation setNotificationDelegate:](v7, "setNotificationDelegate:", self);
  return v7;
}

- (id)makePauseOperation
{
  STUPauseMediaOperation *v3;
  void *v4;
  void *v5;
  STUPauseMediaOperation *v6;

  v3 = [STUPauseMediaOperation alloc];
  v4 = (void *)objc_opt_new(CRKPauseMediaRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = -[STUTaskOperation initWithRequest:context:delegate:](v3, "initWithRequest:context:delegate:", v4, v5, self);

  return v6;
}

- (id)makeMuteOperation
{
  void *v3;
  void *v4;
  STUSetMuteStateOperation *v5;
  void *v6;
  STUSetMuteStateOperation *v7;

  v3 = (void *)objc_opt_new(CRKSetMuteStateRequest);
  objc_msgSend(v3, "setMute:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUHideAppsOperation request](self, "request"));
  objc_msgSend(v3, "setHandlesNotifications:", objc_msgSend(v4, "handlesNotifications"));

  v5 = [STUSetMuteStateOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = -[STUTaskOperation initWithRequest:context:delegate:](v5, "initWithRequest:context:delegate:", v3, v6, self);

  -[STUSetMuteStateOperation setNotificationDelegate:](v7, "setNotificationDelegate:", self);
  return v7;
}

- (void)sequentialOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[STUHideAppsOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUHideAppsOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STUHideAppsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STUHideAppsOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
LABEL_8:

}

- (STUWaitForUnlockOperation)waitForUnlockOperation
{
  return self->_waitForUnlockOperation;
}

- (void)setWaitForUnlockOperation:(id)a3
{
  objc_storeStrong((id *)&self->_waitForUnlockOperation, a3);
}

- (CRKSequentialOperation)sequentialOperation
{
  return self->_sequentialOperation;
}

- (void)setSequentialOperation:(id)a3
{
  objc_storeStrong((id *)&self->_sequentialOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequentialOperation, 0);
  objc_storeStrong((id *)&self->_waitForUnlockOperation, 0);
}

@end
