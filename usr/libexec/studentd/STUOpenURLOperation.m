@implementation STUOpenURLOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___STUOpenURLOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4))
    goto LABEL_9;
  if ((objc_msgSend(a1, "requestHasAllowedClass:", v6) & 1) == 0)
  {
    if (a4)
    {
      v11 = CATErrorWithCodeAndUserInfo(2, &off_1000D33A8);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_10;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLForRequest:", v6));
  v8 = (void *)v7;
  v9 = v7 != 0;
  if (a4 && !v7)
  {
    v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D33D0);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
  }

LABEL_10:
  return v9;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUOpenURLOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUOpenURLOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 108, CFSTR("%@ must be called from the main thread"), v8);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation startAppLockOperation](self, "startAppLockOperation"));
  objc_msgSend(v4, "cancel");

  -[STUOpenURLOperation stopWaitingForApplicationToBecomeUnrestricted](self, "stopWaitingForApplicationToBecomeUnrestricted");
  if (-[STUOpenURLOperation isExecuting](self, "isExecuting"))
  {
    if (!-[STUTaskOperation isAsking](self, "isAsking"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue(v5);
      -[STUOpenURLOperation endOperationWithError:](self, "endOperationWithError:", v9);

    }
  }
}

- (void)operationWillFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUOpenURLOperation;
  -[STUTaskOperation operationWillFinish](&v3, "operationWillFinish");
  -[STUOpenURLOperation stopObservingLockState](self, "stopObservingLockState");
  -[STUOpenURLOperation stopObservingApplicationChange](self, "stopObservingApplicationChange");
  -[STUOpenURLOperation restoreWhitelistIfNeeded](self, "restoreWhitelistIfNeeded");
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *launchServicesQueue;
  void *v7;
  void *v8;
  STUAppWhitelist *v9;
  STUAppWhitelist *mWhitelist;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 132, CFSTR("%@ must be called from the main thread"), v15);

  }
  v5 = (OS_dispatch_queue *)dispatch_queue_create("STUOpenURLOperationQueue", 0);
  launchServicesQueue = self->_launchServicesQueue;
  self->_launchServicesQueue = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enrollmentRecord"));

  if (v8)
  {
    v9 = (STUAppWhitelist *)objc_claimAutoreleasedReturnValue(+[STUAppWhitelist sharedWhitelist](STUAppWhitelist, "sharedWhitelist"));
    mWhitelist = self->mWhitelist;
    self->mWhitelist = v9;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002CE70;
    v16[3] = &unk_1000CA738;
    v16[4] = self;
    v17 = v8;
    -[STUOpenURLOperation fetchHandlingAppWithCompletion:](self, "fetchHandlingAppWithCompletion:", v16);

  }
  else
  {
    v11 = CRKErrorWithCodeAndUserInfo(16, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[STUOpenURLOperation endOperationWithError:](self, "endOperationWithError:", v12);

  }
}

- (void)askUserPermisisonWithEnrollmentRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomOpenURLAllowed](CRKRestrictions, "classroomOpenURLAllowed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[STUFeatureFactory featureForCRKFeature:enrollmentRecord:configurationManager:](STUFeatureFactory, "featureForCRKFeature:enrollmentRecord:configurationManager:", v5, v4, v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[STUAskAlertModelFactory sharedFactory](STUAskAlertModelFactory, "sharedFactory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation instructorName](self, "instructorName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "openURLTextWithInstructorName:", v9));

  -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", v11, v10);
}

- (void)failWithUnderlyingError:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 183, CFSTR("%@ must be called from the main thread"), v10);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", CATErrorDomain))
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v11, "code");

  if (v6 != (id)404)
  {
LABEL_7:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation makeUnableToOpenURLErrorWithUnderlyingError:](self, "makeUnableToOpenURLErrorWithUnderlyingError:", v11));
    -[STUOpenURLOperation endOperationWithError:](self, "endOperationWithError:", v7);

    goto LABEL_8;
  }
  -[STUOpenURLOperation endOperationWithError:](self, "endOperationWithError:", v11);
LABEL_8:

}

- (void)exclusivityRequestDidComplete:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[STUOpenURLOperation isExecuting](self, "isExecuting");
  v5 = v8;
  if (v4)
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v7);

    }
    else if (v8)
    {
      -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v8);
    }
    else
    {
      -[STUOpenURLOperation setExclusive:](self, "setExclusive:", 1);
      -[STUOpenURLOperation waitForApplicationToBecomeUnrestricted](self, "waitForApplicationToBecomeUnrestricted");
    }
    v5 = v8;
  }

}

- (void)restoreWhitelistIfNeeded
{
  void (**mWhitelistRestorationBlock)(id, SEL);
  id v4;

  mWhitelistRestorationBlock = (void (**)(id, SEL))self->mWhitelistRestorationBlock;
  if (mWhitelistRestorationBlock)
  {
    mWhitelistRestorationBlock[2](mWhitelistRestorationBlock, a2);
    v4 = self->mWhitelistRestorationBlock;
    self->mWhitelistRestorationBlock = 0;

  }
}

- (void)waitForTargetApplicationToBecomeActive
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSString *mBundleIdentifier;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  uint8_t buf[4];
  STUOpenURLOperation *v20;
  __int16 v21;
  NSString *v22;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 214, CFSTR("%@ must be called from the main thread"), v18);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

  v6 = sub_10002CFD4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    mBundleIdentifier = self->mBundleIdentifier;
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = mBundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Waiting for %{public}@ to become active", buf, 0x16u);
  }

  v9 = objc_msgSend(v5, "isApplicationOpen:", self->mBundleIdentifier);
  v10 = sub_10002CFD4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      v13 = self->mBundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ already active", buf, 0x16u);
    }

    -[STUOpenURLOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allOpenApplications"));
      v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ currently active", buf, 0x16u);

    }
    -[STUOpenURLOperation startObservingApplicationChange](self, "startObservingApplicationChange");
  }

}

- (void)performRequest:(id)a3
{
  if (-[STUOpenURLOperation lockInApp](self, "lockInApp", a3))
    -[STUOpenURLOperation performAppLock](self, "performAppLock");
  else
    -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");
}

- (void)deviceIsReadyToOpenURL
{
  uint64_t v3;
  _QWORD *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  if (-[STUOpenURLOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v3 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(v3);
      -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v5);

    }
    else
    {
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10002D6B4;
      v6[3] = &unk_1000CA760;
      v6[4] = self;
      objc_copyWeak(&v7, &location);
      v4 = objc_retainBlock(v6);
      -[STUOpenURLOperation openRequestedURLWithCompletion:](self, "openRequestedURLWithCompletion:", v4);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)openRequestedURLWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL mDisableAppLinks;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  STUOpenURLOperation *v25;
  __int16 v26;
  void *v27;

  v5 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 262, CFSTR("%@ must be called from the main thread"), v18);

    if (v5)
      goto LABEL_3;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  if (-[STUOpenURLOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v7);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation URL](self, "URL"));
      v9 = sub_10002CFD4();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Opening URL %{public}@", buf, 0x16u);
      }

      mDisableAppLinks = self->mDisableAppLinks;
      if (mDisableAppLinks)
      {
        v12 = sub_10002CFD4();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v25 = self;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: Disabling URL overrides", buf, 0xCu);
        }

      }
      v14 = objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation launchServicesQueue](self, "launchServicesQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002D9F8;
      block[3] = &unk_1000CA788;
      v23 = mDisableAppLinks;
      block[4] = self;
      v21 = v8;
      v22 = v5;
      v15 = v8;
      dispatch_async(v14, block);

    }
  }

}

- (void)waitForDeviceToUnlock
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint8_t buf[4];
  STUOpenURLOperation *v15;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 335, CFSTR("%@ must be called from the main thread"), v13);

  }
  v4 = sub_10002CFD4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Waiting for device to unlock", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v8 = objc_msgSend(v7, "lockState");

  if (v8 == (id)1)
  {
    v9 = sub_10002CFD4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Device already unlocked", buf, 0xCu);
    }

    -[STUOpenURLOperation waitForTargetApplicationToBecomeActive](self, "waitForTargetApplicationToBecomeActive");
  }
  else
  {
    -[STUOpenURLOperation startObservingLockState](self, "startObservingLockState");
  }
}

- (void)waitForApplicationToBecomeUnrestricted
{
  id v3;
  NSObject *v4;
  NSString *mBundleIdentifier;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  STUOpenURLOperation *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  void *v30;

  v3 = sub_10002CFD4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    mBundleIdentifier = self->mBundleIdentifier;
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = mBundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Waiting for %{public}@ to become unrestricted", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "launchServicesPrimitives"));
  v9 = self->mBundleIdentifier;
  v24 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationRecordWithBundleIdentifier:error:", v9, &v24));
  v11 = v24;
  -[STUOpenURLOperation setTargetApplicationRecord:](self, "setTargetApplicationRecord:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation targetApplicationRecord](self, "targetApplicationRecord"));
  LODWORD(v6) = v12 == 0;

  if ((_DWORD)v6)
  {
    v15 = sub_10002CFD4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->mBundleIdentifier;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verboseDescription"));
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create application record for %{public}@ for unrestrictedness observing. Proceeding to open the URL anyway. Error: %{public}@", buf, 0x20u);

    }
    -[STUOpenURLOperation deviceIsReadyToOpenURL](self, "deviceIsReadyToOpenURL");
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation targetApplicationRecord](self, "targetApplicationRecord"));
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10002E0F8;
    v22 = &unk_1000C9F38;
    objc_copyWeak(&v23, (id *)buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addApplicationStateObserver:", &v19));
    -[STUOpenURLOperation setApplicationRecordStateSubscription:](self, "setApplicationRecordStateSubscription:", v14, v19, v20, v21, v22);

    -[STUOpenURLOperation evaluateApplicationRestrictedness](self, "evaluateApplicationRestrictedness");
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)evaluateApplicationRestrictedness
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  NSString *mBundleIdentifier;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  STUOpenURLOperation *v19;
  __int16 v20;
  NSString *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation targetApplicationRecord](self, "targetApplicationRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationState"));
  v5 = objc_msgSend(v4, "isRestricted");

  if ((v5 & 1) == 0)
  {
    v6 = sub_10002CFD4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      mBundleIdentifier = self->mBundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = mBundleIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ has become unrestricted, proceeding to open the URL", buf, 0x16u);
    }

    -[STUOpenURLOperation stopWaitingForApplicationToBecomeUnrestricted](self, "stopWaitingForApplicationToBecomeUnrestricted");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primitives"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "launchServicesPrimitives"));
    v12 = objc_msgSend(v11, "supportsNotingRestrictionsUpdateForOpens");

    if (v12)
    {
      objc_initWeak((id *)buf, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "primitives"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "launchServicesPrimitives"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10002E338;
      v16[3] = &unk_1000CA7B0;
      v16[4] = self;
      objc_copyWeak(&v17, (id *)buf);
      objc_msgSend(v15, "noteRestrictionsUpdateForOpensWithCompletion:", v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[STUOpenURLOperation deviceIsReadyToOpenURL](self, "deviceIsReadyToOpenURL");
    }
  }
}

- (void)stopWaitingForApplicationToBecomeUnrestricted
{
  void *v3;

  -[STUOpenURLOperation setTargetApplicationRecord:](self, "setTargetApplicationRecord:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation applicationRecordStateSubscription](self, "applicationRecordStateSubscription"));
  objc_msgSend(v3, "cancel");

  -[STUOpenURLOperation setApplicationRecordStateSubscription:](self, "setApplicationRecordStateSubscription:", 0);
}

- (void)performAppLock
{
  void *v4;
  void *v5;
  STUStartAppLockOperation *v6;
  void *v7;
  STUStartAppLockOperation *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

  if (objc_msgSend(v10, "isAppLocked")
    && objc_msgSend(v10, "isApplicationOpen:", self->mBundleIdentifier))
  {
    -[STUOpenURLOperation waitForApplicationToBecomeUnrestricted](self, "waitForApplicationToBecomeUnrestricted");
  }
  else
  {
    if (-[STUOpenURLOperation isExclusive](self, "isExclusive"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 442, CFSTR("Never ever /ever/ attempt to app lock after becoming exclusive. This will deadlock the device."));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation makeStartAppLockRequestForBundleIdentifier:](self, "makeStartAppLockRequestForBundleIdentifier:", self->mBundleIdentifier));
    objc_msgSend(v5, "setHandlesNotifications:", 1);
    v6 = [STUStartAppLockOperation alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = -[STUTaskOperation initWithRequest:context:delegate:](v6, "initWithRequest:context:delegate:", v5, v7, self);

    -[STUStartAppLockOperation addTarget:selector:forOperationEvents:](v8, "addTarget:selector:forOperationEvents:", self, "appLockOperationDidFinish:", 6);
    -[STUOpenURLOperation setStartAppLockOperation:](self, "setStartAppLockOperation:", v8);
    -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v8);

  }
}

- (void)fetchHandlingAppWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  BOOL v11;
  STUAppWhitelist *mWhitelist;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  STUOpenURLOperation *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  char v24;

  v4 = a3;
  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation handlingBundleIdentifiers](self, "handlingBundleIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation handlingBundleIdentifierFromSuggestions:isBrowser:](self, "handlingBundleIdentifierFromSuggestions:isBrowser:", v5, &v24));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
  if ((objc_msgSend(v8, "isAppLocked") & 1) != 0)
  {

  }
  else
  {
    v9 = -[STUOpenURLOperation lockInApp](self, "lockInApp");

    if ((v9 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation URL](self, "URL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primitives"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "launchServicesPrimitives"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10002E92C;
      v18[3] = &unk_1000CA800;
      v19 = v6;
      v20 = self;
      v21 = v4;
      objc_msgSend(v14, "stu_handlingAppWithLSPrimitives:completion:", v17, v18);

      v13 = v19;
      goto LABEL_11;
    }
  }
  if (!v6)
  {
    mWhitelist = self->mWhitelist;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002E884;
    v22[3] = &unk_1000CA7D8;
    v22[4] = self;
    v23 = v4;
    -[STUOpenURLOperation temporarilySuspendWhitelist:toDetermineAppHandlingRequestWithCompletion:](self, "temporarilySuspendWhitelist:toDetermineAppHandlingRequestWithCompletion:", mWhitelist, v22);
    v13 = v23;
LABEL_11:

    goto LABEL_12;
  }
  v10 = -[STUOpenURLOperation lockInApp](self, "lockInApp");
  if (v24)
    v11 = v10;
  else
    v11 = 0;
  self->mDisableAppLinks = v11;
  (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v6, 0);
LABEL_12:

}

- (id)handlingBundleIdentifierFromSuggestions:(id)a3 isBrowser:(BOOL *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  char v25;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id v33;
  id v34;
  NSObject *v35;
  BOOL *v37;
  id v38;
  NSObject *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  STUOpenURLOperation *v46;
  __int16 v47;
  void *v48;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("STUIgnoreTeacherSuggestedHandlingApps"));

  if (v8)
  {
    v9 = sub_10002CFD4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v46 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Ignoring teacher suggested handling apps because defaults key is set", buf, 0xCu);
    }
LABEL_32:
    v26 = 0;
    goto LABEL_35;
  }
  v11 = objc_msgSend(v6, "count");
  v12 = sub_10002CFD4();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v10 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10007BA1C((uint64_t)self, v10);
    goto LABEL_32;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 138543618;
    v46 = self;
    v47 = 2114;
    v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: Suggested bundle identifiers: %{public}@", buf, 0x16u);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v6;
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v15)
  {
    v26 = 0;
    goto LABEL_34;
  }
  v16 = v15;
  v37 = a4;
  v38 = v6;
  v17 = *(_QWORD *)v41;
LABEL_9:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v17)
      objc_enumerationMutation(obj);
    v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo", v37));
    v21 = objc_msgSend(v20, "platform");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[STUApplicationEquivalency equivalencyForBundleIdentifier:](STUApplicationEquivalency, "equivalencyForBundleIdentifier:", v19));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleIdentifierForPlatform:", v21));
    v24 = -[STUOpenURLOperation isSafariBundleIdentifier:](self, "isSafariBundleIdentifier:", v23);
    v25 = v24;
    if (v24)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation defaultBrowserIdentifier](self, "defaultBrowserIdentifier"));

      v27 = sub_10002CFD4();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
      if (!v26)
      {
        if (v29)
        {
          *(_DWORD *)buf = 138543362;
          v46 = self;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@: Default browser is nil", buf, 0xCu);
        }

        v26 = 0;
        goto LABEL_19;
      }
      if (v29)
      {
        *(_DWORD *)buf = 138543618;
        v46 = self;
        v47 = 2114;
        v48 = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@: Re-mapping Safari to default browser: %{public}@", buf, 0x16u);
      }

    }
    else
    {
      v26 = v23;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "applicationWorkspace"));
    v32 = objc_msgSend(v31, "isBundleIdentifierLaunchable:error:", v26, 0);

    if (v32)
      break;
LABEL_19:

    if (v16 == (id)++v18)
    {
      v33 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v16 = v33;
      if (!v33)
      {
        v26 = 0;
        goto LABEL_29;
      }
      goto LABEL_9;
    }
  }
  v34 = sub_10002CFD4();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v46 = self;
    v47 = 2114;
    v48 = v26;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%{public}@: Picking %{public}@", buf, 0x16u);
  }

  *v37 = v25;
LABEL_29:
  v6 = v38;
LABEL_34:
  v10 = obj;
LABEL_35:

  return v26;
}

- (void)temporarilySuspendWhitelist:(id)a3 toDetermineAppHandlingRequestWithCompletion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSSet *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  STUOpenURLOperation *v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v34;
  id v35;
  uint8_t buf[4];
  STUOpenURLOperation *v37;
  __int16 v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("whitelist"));

    if (v9)
      goto LABEL_3;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 546, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifiers"));
  v11 = objc_msgSend(v10, "count");
  v12 = v11 != 0;
  if (!v11)
  {
LABEL_10:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation URL](self, "URL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "primitives"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "launchServicesPrimitives"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002F214;
    v29[3] = &unk_1000CA828;
    v34 = v12;
    v30 = v10;
    v31 = self;
    v32 = v7;
    v33 = v9;
    objc_msgSend(v21, "stu_handlingAppWithLSPrimitives:completion:", v24, v29);

    v20 = v30;
    goto LABEL_14;
  }
  v13 = sub_10002CFD4();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: Suspending app lock in order to query for the handling app", buf, 0xCu);
  }

  v15 = sub_10002CFD4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crk_stableDescription"));
    *(_DWORD *)buf = 138543618;
    v37 = self;
    v38 = 2114;
    v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: Current whitelisted bundle identifiers: %{public}@", buf, 0x16u);

  }
  v18 = objc_opt_new(NSSet);
  v35 = 0;
  v19 = objc_msgSend(v7, "setBundleIdentifiers:error:", v18, &v35);
  v20 = v35;

  if ((v19 & 1) != 0)
  {

    goto LABEL_10;
  }
  v25 = sub_10002CFD4();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    sub_10007BA90((uint64_t)self, v20);

  ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, id))v9)[2](v9, 0, 0, 0, v20);
LABEL_14:

}

- (id)restorationBlockForWhitelist:(id)a3 previousState:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  char v20;

  v6 = a3;
  v7 = (unint64_t)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "changeToken"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifiers"));
  if (v7 | v9)
    v10 = objc_msgSend((id)v7, "isEqual:", v9) ^ 1;
  else
    v10 = 0;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002F630;
  v16[3] = &unk_1000CA850;
  v20 = v10;
  v16[4] = self;
  v17 = v8;
  v18 = v6;
  v19 = (id)v7;
  v11 = (id)v7;
  v12 = v6;
  v13 = v8;
  v14 = objc_retainBlock(v16);

  return v14;
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
  v4 = -[STUOpenURLOperation isExecuting](self, "isExecuting");
  v5 = v10;
  if (v4)
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation request](self, "request"));
        -[STUOpenURLOperation performRequest:](self, "performRequest:", v9);
        goto LABEL_8;
      }
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    }
    v9 = (void *)v7;
    -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v7);
LABEL_8:

    v5 = v10;
  }

}

- (void)appLockOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[STUOpenURLOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STUOpenURLOperation waitForApplicationToBecomeUnrestricted](self, "waitForApplicationToBecomeUnrestricted");
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v5);

  }
LABEL_8:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a3;
  v11 = v10;
  if (off_1000FAFE8 == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CRKDeviceAllOpenApplicationsKey))
      -[STUOpenURLOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "openAppsDidChange", 0, 0);
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("lockState")))
      -[STUOpenURLOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "lockStateDidChange", 0, 0);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)STUOpenURLOperation;
    -[STUOpenURLOperation observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", v10, a4, a5, a6);
  }

}

- (void)startObservingApplicationChange
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 707, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (self->mObservingApplicationChange)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 709, CFSTR("Already observing application change"));

  }
  self->mObservingApplicationChange = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CRKDeviceAllOpenApplicationsKey, 1, off_1000FAFE8);
}

- (void)stopObservingApplicationChange
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  id v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 724, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (self->mObservingApplicationChange)
  {
    self->mObservingApplicationChange = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

    objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CRKDeviceAllOpenApplicationsKey, off_1000FAFE8);
  }
}

- (void)startObservingLockState
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 739, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (self->mObservingLockState)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 741, CFSTR("Already observing lock state"));

  }
  self->mObservingLockState = 1;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("lockState"), 0, off_1000FAFE8);

}

- (BOOL)stopObservingLockState
{
  _BOOL4 mObservingLockState;
  void *v5;
  void *v6;
  void *v8;
  NSString *v9;
  void *v10;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 750, CFSTR("%@ must be called from the main thread"), v10);

  }
  mObservingLockState = self->mObservingLockState;
  if (self->mObservingLockState)
  {
    self->mObservingLockState = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("lockState"), off_1000FAFE8);

  }
  return mObservingLockState;
}

- (void)openAppsDidChange
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSString *mBundleIdentifier;
  id v14;
  NSObject *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  STUOpenURLOperation *v25;
  __int16 v26;
  NSString *v27;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v21 = NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 766, CFSTR("%@ must be called from the main thread"), v22);

  }
  if (-[STUOpenURLOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:");

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allOpenApplications"));
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = objc_msgSend(v6, "isApplicationOpen:", self->mBundleIdentifier);
        v10 = sub_10002CFD4();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v9)
        {
          if (v12)
          {
            mBundleIdentifier = self->mBundleIdentifier;
            *(_DWORD *)buf = 138543618;
            v25 = self;
            v26 = 2114;
            v27 = mBundleIdentifier;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ did become active", buf, 0x16u);
          }

          -[STUOpenURLOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
        }
        else
        {
          if (v12)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allOpenApplications"));
            v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", ")));
            *(_DWORD *)buf = 138543618;
            v25 = self;
            v26 = 2114;
            v27 = v18;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: Unexpected active apps %{public}@", buf, 0x16u);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation makeUnableToOpenAppErrorForBundleIdentifier:](self, "makeUnableToOpenAppErrorForBundleIdentifier:", self->mBundleIdentifier));
          -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v19);

        }
        -[STUOpenURLOperation stopObservingApplicationChange](self, "stopObservingApplicationChange");
      }
      else
      {
        v14 = sub_10002CFD4();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = self->mBundleIdentifier;
          *(_DWORD *)buf = 138543618;
          v25 = self;
          v26 = 2114;
          v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: No open applications. Waiting for %{public}@ to become active", buf, 0x16u);
        }

      }
    }
  }
}

- (void)lockStateDidChange
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  STUOpenURLOperation *v16;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenURLOperation.m"), 791, CFSTR("%@ must be called from the main thread"), v12);

  }
  if (-[STUOpenURLOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenURLOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUOpenURLOperation failWithUnderlyingError:](self, "failWithUnderlyingError:");

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));
      v7 = objc_msgSend(v6, "lockState");

      if (v7 == (id)1)
      {
        -[STUOpenURLOperation stopObservingLockState](self, "stopObservingLockState");
        v8 = sub_10002CFD4();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v16 = self;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: Device did unlock", buf, 0xCu);
        }

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100030418;
        v14[3] = &unk_1000CA240;
        v14[4] = self;
        -[STUOpenURLOperation openRequestedURLWithCompletion:](self, "openRequestedURLWithCompletion:", v14);
      }
    }
  }
}

+ (BOOL)requestHasAllowedClass:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;

  v3 = a3;
  v4 = objc_opt_class(DMFOpenURLRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = objc_opt_class(CRKOpenURLRequest);
    isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  }

  return isKindOfClass & 1;
}

+ (id)URLForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_class(DMFOpenURLRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKOpenURLRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  v14 = v13;

  return v14;
}

+ (BOOL)lockInAppForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned __int8 v11;

  v3 = a3;
  v4 = objc_opt_class(DMFOpenURLRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKOpenURLRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if ((objc_msgSend(v10, "lockInApp") & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v6, "lockInApp");

  return v11;
}

+ (id)handlingBundleIdentifiersForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_class(DMFOpenURLRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKOpenURLRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "handlingBundleIdentifiers"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handlingBundleIdentifiers"));
  v14 = v13;

  return v14;
}

- (id)URL
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForRequest:", v4));

  return v5;
}

- (BOOL)lockInApp
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation request](self, "request"));
  LOBYTE(v3) = objc_msgSend(v3, "lockInAppForRequest:", v4);

  return (char)v3;
}

- (id)handlingBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handlingBundleIdentifiersForRequest:", v4));

  return v5;
}

- (BOOL)isSafariBundleIdentifier:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Safari"));

  return v4;
}

- (id)defaultBrowserIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedDefaultWebBrowserBundleIdentifier"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primitives"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "launchServicesPrimitives"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultWebBrowserBundleIdentifier"));

  }
  return v7;
}

- (BOOL)isRequestDMF
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation request](self, "request"));
  v3 = objc_opt_class(DMFOpenURLRequest);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (id)makeUnableToOpenURLErrorWithUnderlyingError:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, NSUnderlyingErrorKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenURLOperation URL](self, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));

  if (-[STUOpenURLOperation isRequestDMF](self, "isRequestDMF"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, DMFURLStringErrorKey);
    v8 = DMFErrorWithCodeAndUserInfo(102, v5);
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, CFSTR("kCRKURLStringErrorKey"));
    v8 = CRKErrorWithCodeAndUserInfo(124, v5);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)makeUnableToOpenAppErrorForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  if (-[STUOpenURLOperation isRequestDMF](self, "isRequestDMF"))
  {
    v14 = DMFBundleIdentifierErrorKey;
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v6 = DMFErrorWithCodeAndUserInfo(101, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    if (!v4)
    {
      v11 = CRKErrorWithCodeAndUserInfo(123, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_6;
    }
    v12 = CFSTR("kCRKBundleIdentifierErrorKey");
    v13 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v8 = CRKErrorWithCodeAndUserInfo(123, v5);
    v7 = objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = (void *)v7;

LABEL_6:
  return v9;
}

- (id)makeStartAppLockRequestForBundleIdentifier:(id)a3
{
  id v4;
  unsigned int v5;
  _QWORD *v6;
  void *v7;

  v4 = a3;
  v5 = -[STUOpenURLOperation isRequestDMF](self, "isRequestDMF");
  v6 = DMFStartAppLockRequest_ptr;
  if (!v5)
    v6 = CRKStartAppLockRequest_ptr;
  v7 = (void *)objc_opt_new(*v6);
  objc_msgSend(v7, "setBundleIdentifier:", v4);

  return v7;
}

- (BOOL)endIfNeeded
{
  return self->_endIfNeeded;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (STUStartAppLockOperation)startAppLockOperation
{
  return self->_startAppLockOperation;
}

- (void)setStartAppLockOperation:(id)a3
{
  objc_storeStrong((id *)&self->_startAppLockOperation, a3);
}

- (OS_dispatch_queue)launchServicesQueue
{
  return self->_launchServicesQueue;
}

- (STUOpenApplicationToken)keepAliveToken
{
  return self->_keepAliveToken;
}

- (void)setKeepAliveToken:(id)a3
{
  objc_storeStrong((id *)&self->_keepAliveToken, a3);
}

- (STULSApplicationRecord)targetApplicationRecord
{
  return self->_targetApplicationRecord;
}

- (void)setTargetApplicationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_targetApplicationRecord, a3);
}

- (CRKCancelable)applicationRecordStateSubscription
{
  return self->_applicationRecordStateSubscription;
}

- (void)setApplicationRecordStateSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_applicationRecordStateSubscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecordStateSubscription, 0);
  objc_storeStrong((id *)&self->_targetApplicationRecord, 0);
  objc_storeStrong((id *)&self->_keepAliveToken, 0);
  objc_storeStrong((id *)&self->_launchServicesQueue, 0);
  objc_storeStrong((id *)&self->_startAppLockOperation, 0);
  objc_storeStrong(&self->mWhitelistRestorationBlock, 0);
  objc_storeStrong((id *)&self->mWhitelist, 0);
  objc_storeStrong((id *)&self->mBundleIdentifier, 0);
}

@end
