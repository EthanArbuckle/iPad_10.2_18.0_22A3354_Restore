@implementation STULaunchAppOperation_iOS

- (STULaunchAppOperation_iOS)initWithConfiguration:(id)a3 device:(id)a4 primitives:(id)a5 shouldReturnDMFErrors:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  STULaunchAppOperation_iOS *v12;
  STULaunchAppConfiguration *v13;
  STULaunchAppConfiguration *configuration;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)STULaunchAppOperation_iOS;
  v12 = -[STULaunchAppOperation_iOS init](&v16, "init");
  if (v12)
  {
    v13 = (STULaunchAppConfiguration *)objc_msgSend(v9, "copy");
    configuration = v12->_configuration;
    v12->_configuration = v13;

    objc_storeStrong((id *)&v12->_device, a4);
    objc_storeStrong((id *)&v12->_primitives, a5);
  }

  return v12;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STULaunchAppOperation_iOS;
  -[STULaunchAppOperation_iOS cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072A28;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)main
{
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[STULaunchAppOperation_iOS initialOpenApp](self, "initialOpenApp");
  else
    -[STULaunchAppOperation_iOS performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
}

- (void)initialOpenApp
{
  STULaunchAppConfiguration *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  STULaunchAppConfiguration *v16;
  STUOpenAppUsingFrontBoardOperation *v17;
  void *v18;
  STUOpenAppUsingFrontBoardOperation *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  uint8_t buf[4];
  STULaunchAppOperation_iOS *v25;
  __int16 v26;
  void *v27;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v22 = NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STULaunchAppOperation_iOS.m"), 88, CFSTR("%@ must be called from the main thread"), v23);

  }
  v4 = (STULaunchAppConfiguration *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS device](self, "device"));
  v6 = objc_msgSend(v5, "lockState");

  if (v6 != (id)1)
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "lockScreenEmbeddedAppBundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v11 = objc_msgSend(v8, "containsObject:", v10);

    if (v11)
    {
      v12 = sub_100072D90();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS configuration](self, "configuration"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
        *(_DWORD *)buf = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: Opening directly to springboard to bypass lock screen embedded app %{public}@", buf, 0x16u);

      }
      v16 = -[STULaunchAppConfiguration initWithBundleIdentifier:]([STULaunchAppConfiguration alloc], "initWithBundleIdentifier:", CFSTR("com.apple.springboard"));

      v4 = v16;
    }
  }
  v17 = [STUOpenAppUsingFrontBoardOperation alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS primitives](self, "primitives"));
  v19 = -[STUOpenAppUsingFrontBoardOperation initWithConfiguration:primitives:](v17, "initWithConfiguration:primitives:", v4, v18);

  -[STULaunchAppOperation_iOS setInitialOpenAppOperation:](self, "setInitialOpenAppOperation:", v19);
  -[STUOpenAppUsingFrontBoardOperation addTarget:selector:forOperationEvents:](v19, "addTarget:selector:forOperationEvents:", self, "initialOpenAppOperationDidFinish:", 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v20, "addOperation:", v19);

}

- (void)initialOpenAppOperationDidFinish:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v12 = a3;
  -[STULaunchAppOperation_iOS setInitialOpenAppOperation:](self, "setInitialOpenAppOperation:", 0);
  v4 = -[STULaunchAppOperation_iOS isExecuting](self, "isExecuting");
  v5 = v12;
  if (v4)
  {
    if (-[STULaunchAppOperation_iOS isCanceled](self, "isCanceled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));

      if (!v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS configuration](self, "configuration"));
        v11 = objc_msgSend(v10, "waitsForDeviceUnlock");

        if ((v11 & 1) != 0)
          -[STULaunchAppOperation_iOS beginObservingLockState](self, "beginObservingLockState");
        else
          -[STULaunchAppOperation_iOS endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
        goto LABEL_7;
      }
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
    }
    v9 = (void *)v7;
    -[STULaunchAppOperation_iOS endOperationWithError:](self, "endOperationWithError:", v7);

LABEL_7:
    v5 = v12;
  }

}

- (void)beginObservingLockState
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  _QWORD v12[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STULaunchAppOperation_iOS.m"), 131, CFSTR("%@ must be called from the main thread"), v11);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("lockState")));
  v5 = objc_alloc((Class)CRKWaitForKeyValueChangeOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS device](self, "device"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100073020;
  v12[3] = &unk_1000CAFE8;
  v12[4] = self;
  v7 = objc_msgSend(v5, "initWithObject:keyPaths:conditionEvaluator:", v6, v4, v12);

  -[STULaunchAppOperation_iOS setWaitForUnlockedStateOperation:](self, "setWaitForUnlockedStateOperation:", v7);
  objc_msgSend(v7, "addTarget:selector:forOperationEvents:", self, "waitForUnlockedStateOperationDidFinish:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v8, "addOperation:", v7);

}

- (void)waitForUnlockedStateOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STULaunchAppOperation_iOS setWaitForUnlockedStateOperation:](self, "setWaitForUnlockedStateOperation:", 0);
  if (-[STULaunchAppOperation_iOS isExecuting](self, "isExecuting"))
  {
    if (-[STULaunchAppOperation_iOS isCanceled](self, "isCanceled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STULaunchAppOperation_iOS followUpOpenApp](self, "followUpOpenApp");
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STULaunchAppOperation_iOS endOperationWithError:](self, "endOperationWithError:", v5);

  }
LABEL_8:

}

- (void)followUpOpenApp
{
  STUOpenAppUsingFrontBoardOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  STUOpenAppUsingFrontBoardOperation *v11;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STULaunchAppOperation_iOS.m"), 168, CFSTR("%@ must be called from the main thread"), v10);

  }
  v4 = [STUOpenAppUsingFrontBoardOperation alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS primitives](self, "primitives"));
  v11 = -[STUOpenAppUsingFrontBoardOperation initWithConfiguration:primitives:](v4, "initWithConfiguration:primitives:", v5, v6);

  -[STULaunchAppOperation_iOS setFollowUpOpenAppOperation:](self, "setFollowUpOpenAppOperation:", v11);
  -[STUOpenAppUsingFrontBoardOperation addTarget:selector:forOperationEvents:](v11, "addTarget:selector:forOperationEvents:", self, "followUpOpenAppOperationDidFinish:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v7, "addOperation:", v11);

}

- (void)followUpOpenAppOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STULaunchAppOperation_iOS setFollowUpOpenAppOperation:](self, "setFollowUpOpenAppOperation:", 0);
  if (-[STULaunchAppOperation_iOS isExecuting](self, "isExecuting"))
  {
    if (-[STULaunchAppOperation_iOS isCanceled](self, "isCanceled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STULaunchAppOperation_iOS beginObservingOpenApps](self, "beginObservingOpenApps");
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STULaunchAppOperation_iOS endOperationWithError:](self, "endOperationWithError:", v5);

  }
LABEL_8:

}

- (void)beginObservingOpenApps
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  _QWORD v12[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STULaunchAppOperation_iOS.m"), 197, CFSTR("%@ must be called from the main thread"), v11);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("allOpenApplications")));
  v5 = objc_alloc((Class)CRKWaitForKeyValueChangeOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS device](self, "device"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007344C;
  v12[3] = &unk_1000CAFE8;
  v12[4] = self;
  v7 = objc_msgSend(v5, "initWithObject:keyPaths:conditionEvaluator:", v6, v4, v12);

  -[STULaunchAppOperation_iOS setWaitForOpenedAppToAppearOperation:](self, "setWaitForOpenedAppToAppearOperation:", v7);
  objc_msgSend(v7, "addTarget:selector:forOperationEvents:", self, "waitForOpenedAppToAppearOperationDidFinish:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v8, "addOperation:", v7);

}

- (void)waitForOpenedAppToAppearOperationDidFinish:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  STULaunchAppOperation_iOS *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  -[STULaunchAppOperation_iOS setWaitForOpenedAppToAppearOperation:](self, "setWaitForOpenedAppToAppearOperation:", 0);
  if (-[STULaunchAppOperation_iOS isExecuting](self, "isExecuting"))
  {
    if (-[STULaunchAppOperation_iOS isCanceled](self, "isCanceled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = objc_claimAutoreleasedReturnValue(v5);
LABEL_6:
      v8 = (void *)v6;
      -[STULaunchAppOperation_iOS endOperationWithError:](self, "endOperationWithError:", v6);

      goto LABEL_7;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    if (v7)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
      goto LABEL_6;
    }
    v9 = sub_100072D90();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[STULaunchAppOperation_iOS configuration](self, "configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ did become active", (uint8_t *)&v13, 0x16u);

    }
    -[STULaunchAppOperation_iOS endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
LABEL_7:

}

+ (id)lockScreenEmbeddedAppBundleIdentifiers
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000D4290);
}

- (STULaunchAppConfiguration)configuration
{
  return self->_configuration;
}

- (STUPrimitives)primitives
{
  return self->_primitives;
}

- (STUDevice)device
{
  return self->_device;
}

- (CATOperation)initialOpenAppOperation
{
  return self->_initialOpenAppOperation;
}

- (void)setInitialOpenAppOperation:(id)a3
{
  objc_storeStrong((id *)&self->_initialOpenAppOperation, a3);
}

- (CATOperation)waitForUnlockedStateOperation
{
  return self->_waitForUnlockedStateOperation;
}

- (void)setWaitForUnlockedStateOperation:(id)a3
{
  objc_storeStrong((id *)&self->_waitForUnlockedStateOperation, a3);
}

- (CATOperation)followUpOpenAppOperation
{
  return self->_followUpOpenAppOperation;
}

- (void)setFollowUpOpenAppOperation:(id)a3
{
  objc_storeStrong((id *)&self->_followUpOpenAppOperation, a3);
}

- (CATOperation)waitForOpenedAppToAppearOperation
{
  return self->_waitForOpenedAppToAppearOperation;
}

- (void)setWaitForOpenedAppToAppearOperation:(id)a3
{
  objc_storeStrong((id *)&self->_waitForOpenedAppToAppearOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForOpenedAppToAppearOperation, 0);
  objc_storeStrong((id *)&self->_followUpOpenAppOperation, 0);
  objc_storeStrong((id *)&self->_waitForUnlockedStateOperation, 0);
  objc_storeStrong((id *)&self->_initialOpenAppOperation, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
