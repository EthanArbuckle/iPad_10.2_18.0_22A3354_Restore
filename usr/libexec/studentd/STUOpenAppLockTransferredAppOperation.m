@implementation STUOpenAppLockTransferredAppOperation

- (STUOpenAppLockTransferredAppOperation)initWithBundleIdentifier:(id)a3 primitives:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUOpenAppLockTransferredAppOperation *v12;
  NSString *v13;
  NSString *mBundleIdentifier;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)STUOpenAppLockTransferredAppOperation;
  v12 = -[STUOpenAppLockTransferredAppOperation init](&v17, "init");
  if (v12)
  {
    v13 = (NSString *)objc_msgSend(v9, "copy");
    mBundleIdentifier = v12->mBundleIdentifier;
    v12->mBundleIdentifier = v13;

    objc_storeStrong((id *)&v12->_primitives, a4);
    objc_storeStrong((id *)&v12->_device, a5);
  }

  return v12;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUOpenAppLockTransferredAppOperation;
  -[STUOpenAppLockTransferredAppOperation cancel](&v3, "cancel");
  -[STUOpenAppLockTransferredAppOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
}

- (void)cancelIfNeeded
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  void *v7;
  id v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 56, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (-[STUOpenAppLockTransferredAppOperation isExecuting](self, "isExecuting"))
  {
    -[STUOpenAppLockTransferredAppOperation stopObservingApplicationChange](self, "stopObservingApplicationChange");
    -[STUOpenAppLockTransferredAppOperation stopObservingLockState](self, "stopObservingLockState");
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[STUOpenAppLockTransferredAppOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
}

- (void)main
{
  _QWORD v2[6];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100059190;
  v2[3] = &unk_1000CB670;
  v2[4] = self;
  v2[5] = a2;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v2);
}

- (void)openAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  STUFrontBoardBackedAppLauncher *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint8_t buf[4];
  STUOpenAppLockTransferredAppOperation *v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 93, CFSTR("%@ must be called from the main thread"), v16);

  }
  v9 = sub_1000592D0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Opening %{public}@", buf, 0x16u);
  }

  v11 = objc_opt_new(STUFrontBoardBackedAppLauncher);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation primitives](self, "primitives"));
  -[STUFrontBoardBackedAppLauncher openBundleIdentifier:primitives:completion:](v11, "openBundleIdentifier:primitives:completion:", v7, v12, v8);

}

- (void)waitForApplicationWithIdentifierToBecomeActive:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint8_t buf[4];
  STUOpenAppLockTransferredAppOperation *v21;
  __int16 v22;
  id v23;

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 105, CFSTR("%@ must be called from the main thread"), v19);

  }
  v6 = sub_1000592D0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Waiting for %{public}@ to become active", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
  v9 = objc_msgSend(v8, "isApplicationOpen:", v5);

  if (v9)
  {
    v10 = sub_1000592D0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ is already active", buf, 0x16u);
    }

    -[STUOpenAppLockTransferredAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allOpenApplications"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));

    v15 = sub_1000592D0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ currently active", buf, 0x16u);
    }

    -[STUOpenAppLockTransferredAppOperation startObservingApplicationChange](self, "startObservingApplicationChange");
  }

}

- (void)lockStateDidChange
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSString *mBundleIdentifier;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  uint8_t buf[4];
  STUOpenAppLockTransferredAppOperation *v16;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 121, CFSTR("%@ must be called from the main thread"), v12);

  }
  if (-[STUOpenAppLockTransferredAppOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenAppLockTransferredAppOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUOpenAppLockTransferredAppOperation endOperationWithError:](self, "endOperationWithError:");

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
      v6 = objc_msgSend(v5, "lockState");

      if (v6 == (id)1)
      {
        -[STUOpenAppLockTransferredAppOperation stopObservingLockState](self, "stopObservingLockState");
        v7 = sub_1000592D0();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v16 = self;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Device did unlock", buf, 0xCu);
        }

        mBundleIdentifier = self->mBundleIdentifier;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100059A38;
        v14[3] = &unk_1000C9810;
        v14[4] = self;
        v14[5] = a2;
        -[STUOpenAppLockTransferredAppOperation openAppWithBundleIdentifier:completion:](self, "openAppWithBundleIdentifier:completion:", mBundleIdentifier, v14);
      }
    }
  }
}

- (void)openAppsDidChange
{
  uint64_t v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  NSString *mBundleIdentifier;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  STUOpenAppLockTransferredAppOperation *v15;
  __int16 v16;
  NSString *v17;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 148, CFSTR("%@ must be called from the main thread"), v12);

  }
  if (-[STUOpenAppLockTransferredAppOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenAppLockTransferredAppOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUOpenAppLockTransferredAppOperation endOperationWithError:](self, "endOperationWithError:");

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
      v6 = objc_msgSend(v5, "isApplicationOpen:", self->mBundleIdentifier);

      if (v6)
      {
        -[STUOpenAppLockTransferredAppOperation stopObservingApplicationChange](self, "stopObservingApplicationChange");
        v7 = sub_1000592D0();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          mBundleIdentifier = self->mBundleIdentifier;
          *(_DWORD *)buf = 138543618;
          v15 = self;
          v16 = 2114;
          v17 = mBundleIdentifier;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ did become active", buf, 0x16u);
        }

        -[STUOpenAppLockTransferredAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  const char *v12;
  objc_super v13;

  v10 = a3;
  v11 = v10;
  if (a6 == "kSTUOpenAppLockTransferredAppOperationObservationContext")
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("lockState")))
    {
      v12 = "lockStateDidChange";
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CRKDeviceAllOpenApplicationsKey))
        goto LABEL_8;
      v12 = "openAppsDidChange";
    }
    -[STUOpenAppLockTransferredAppOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", v12, 0, 0);
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)STUOpenAppLockTransferredAppOperation;
  -[STUOpenAppLockTransferredAppOperation observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, a4, a5, a6);
LABEL_8:

}

- (void)startObservingApplicationChange
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 175, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (self->mObservingApplicationChange)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 176, CFSTR("Already observing application change"));

  }
  self->mObservingApplicationChange = 1;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CRKDeviceAllOpenApplicationsKey, 1, "kSTUOpenAppLockTransferredAppOperationObservationContext");

}

- (void)stopObservingApplicationChange
{
  void *v4;
  NSString *v5;
  void *v6;
  id v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 185, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (self->mObservingApplicationChange)
  {
    self->mObservingApplicationChange = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CRKDeviceAllOpenApplicationsKey, "kSTUOpenAppLockTransferredAppOperationObservationContext");

  }
}

- (void)startObservingLockState
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  STUOpenAppLockTransferredAppOperation *v12;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 195, CFSTR("%@ must be called from the main thread"), v9);

  }
  if (self->mObservingLockState)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 196, CFSTR("Already observing lock state"));

  }
  self->mObservingLockState = 1;
  v4 = sub_1000592D0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Waiting for device to unlock", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("lockState"), 5, "kSTUOpenAppLockTransferredAppOperationObservationContext");

}

- (void)stopObservingLockState
{
  void *v4;
  NSString *v5;
  void *v6;
  id v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 203, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (self->mObservingLockState)
  {
    self->mObservingLockState = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenAppLockTransferredAppOperation device](self, "device"));
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("lockState"), "kSTUOpenAppLockTransferredAppOperationObservationContext");

  }
}

- (STUDevice)device
{
  return self->_device;
}

- (STUPrimitives)primitives
{
  return self->_primitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->mBundleIdentifier, 0);
}

@end
