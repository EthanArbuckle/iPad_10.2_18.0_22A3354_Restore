@implementation STUAppLockLongRunningOperation

+ (void)removeCurrentAppLock
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[STUAppWhitelist sharedWhitelist](STUAppWhitelist, "sharedWhitelist"));
  objc_msgSend(v2, "forceReset");

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___STUAppLockLongRunningOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(DMFStartAppLockRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKStartAppLockRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v13 = CATErrorWithCodeAndUserInfo(2, &off_1000D3948);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
        goto LABEL_11;
      }
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifierForRequest:", v6));
  v10 = (void *)v9;
  v11 = v9 != 0;
  if (a4 && !v9)
  {
    v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D3970);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

LABEL_11:
  return v11;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  objc_super v3;
  _QWORD v4[5];

  if ((-[STUAppLockLongRunningOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100043828;
    v4[3] = &unk_1000C97E8;
    v4[4] = self;
    +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)STUAppLockLongRunningOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
}

- (void)operationWillFinish
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  objc_super v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 86, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (self->mHasInstalledRestriction)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("STUDidRemoveAppLockNotificationName"), self);

  }
  v8.receiver = self;
  v8.super_class = (Class)STUAppLockLongRunningOperation;
  -[STUTaskOperation operationWillFinish](&v8, "operationWillFinish");
}

- (void)runWithRequest:(id)a3
{
  STUAppWhitelist *v4;
  STUAppWhitelist *mWhitelist;
  NSString *mTransferredBundleIdentifier;
  NSString *v7;
  NSString **p_mCurrentBundleIdentifier;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  id v16;

  v4 = (STUAppWhitelist *)objc_claimAutoreleasedReturnValue(+[STUAppWhitelist sharedWhitelist](STUAppWhitelist, "sharedWhitelist", a3));
  mWhitelist = self->mWhitelist;
  self->mWhitelist = v4;

  mTransferredBundleIdentifier = self->mTransferredBundleIdentifier;
  v7 = mTransferredBundleIdentifier;
  if (!mTransferredBundleIdentifier)
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation bundleIdentifier](self, "bundleIdentifier"));
  p_mCurrentBundleIdentifier = &self->mCurrentBundleIdentifier;
  objc_storeStrong((id *)&self->mCurrentBundleIdentifier, v7);
  if (!mTransferredBundleIdentifier)

  v9 = self->mTransferredBundleIdentifier;
  self->mTransferredBundleIdentifier = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationWorkspace"));
  v12 = *p_mCurrentBundleIdentifier;
  v16 = 0;
  v13 = objc_msgSend(v11, "isBundleIdentifierLaunchable:returnDMFError:error:", v12, -[STUAppLockLongRunningOperation isRequestDMF](self, "isRequestDMF"), &v16);
  v14 = v16;

  if ((v13 & 1) != 0)
  {
    -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation appLockErrorForBundleIdentifier:underlyingError:](self, "appLockErrorForBundleIdentifier:underlyingError:", *p_mCurrentBundleIdentifier, v14));
    -[STUAppLockLongRunningOperation cleanupAndFinishWithError:](self, "cleanupAndFinishWithError:", v15);

  }
}

- (void)exclusivityRequestDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *mTransferredBundleIdentifier;
  void *v10;
  NSString *v11;
  NSString *mCurrentBundleIdentifier;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  STUFrontBoardBackedAppLauncher *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  STUAppLockLongRunningOperation *v23;

  v4 = a3;
  if (-[STUAppLockLongRunningOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUAppLockLongRunningOperation isCanceled](self, "isCanceled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STUAppLockLongRunningOperation cleanupAndFinishWithError:](self, "cleanupAndFinishWithError:", v6);
LABEL_14:

      goto LABEL_15;
    }
    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));

      if (-[STUAppLockLongRunningOperation isGuidedAccessActive](self, "isGuidedAccessActive"))
      {
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation effectiveAppLockedBundleIdentifier](self, "effectiveAppLockedBundleIdentifier"));
        mTransferredBundleIdentifier = self->mTransferredBundleIdentifier;
        self->mTransferredBundleIdentifier = v8;

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allOpenApplications"));
        v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        mCurrentBundleIdentifier = self->mCurrentBundleIdentifier;
        self->mCurrentBundleIdentifier = v11;

      }
      if (objc_msgSend(v6, "lockState") == (id)1 || (objc_msgSend(v6, "isPasscodeEnabled") & 1) == 0)
      {
        -[STUAppLockLongRunningOperation installSingleAppModeRestriction](self, "installSingleAppModeRestriction");
      }
      else
      {
        v13 = sub_100043900();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v23 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: Device is locked -- prompting user to unlock", buf, 0xCu);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allOpenApplications"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

        v17 = objc_opt_new(STUFrontBoardBackedAppLauncher);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "primitives"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100043DD8;
        v20[3] = &unk_1000C9DA0;
        v20[4] = self;
        v21 = v6;
        -[STUFrontBoardBackedAppLauncher openBundleIdentifier:primitives:completion:](v17, "openBundleIdentifier:primitives:completion:", v16, v19, v20);

      }
      goto LABEL_14;
    }
    -[STUAppLockLongRunningOperation cleanupAndFinishWithError:](self, "cleanupAndFinishWithError:", v4);
  }
LABEL_15:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v6[5];
  objc_super v7;

  if (a6 == "STUAppLockLongRunningOperationObservationContext")
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100043EA8;
    v6[3] = &unk_1000C97E8;
    v6[4] = self;
    +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v6, a4, a5);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)STUAppLockLongRunningOperation;
    -[STUAppLockLongRunningOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)effectiveAppLockedBundleIdentifier
{
  NSString *mTransferredBundleIdentifier;

  mTransferredBundleIdentifier = self->mTransferredBundleIdentifier;
  if (!mTransferredBundleIdentifier)
    mTransferredBundleIdentifier = self->mCurrentBundleIdentifier;
  return mTransferredBundleIdentifier;
}

- (BOOL)transferLockToBundleIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSString *v17;
  NSString *mTransferredBundleIdentifier;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  STUAppLockLongRunningOperation *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v7 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v21 = NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 190, CFSTR("%@ must be called from the main thread"), v22);

    if (v7)
      goto LABEL_3;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  if ((-[STUAppLockLongRunningOperation isExecuting](self, "isExecuting") & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 192, CFSTR("Can't transfer app lock with a non-executing operation"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationWorkspace"));
  v25 = 0;
  v10 = objc_msgSend(v9, "isBundleIdentifierLaunchable:returnDMFError:error:", v7, -[STUAppLockLongRunningOperation isRequestDMF](self, "isRequestDMF"), &v25);
  v11 = v25;

  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation effectiveAppLockedBundleIdentifier](self, "effectiveAppLockedBundleIdentifier"));
    v13 = objc_msgSend(v12, "isEqualToString:", v7);
    v14 = sub_100043900();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543618;
        v27 = self;
        v28 = 2114;
        v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: Already locked to %{public}@", buf, 0x16u);
      }

    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543874;
        v27 = self;
        v28 = 2114;
        v29 = v12;
        v30 = 2114;
        v31 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: Transferring app lock from %{public}@ to %{public}@", buf, 0x20u);
      }

      v17 = (NSString *)objc_msgSend(v7, "copy");
      mTransferredBundleIdentifier = self->mTransferredBundleIdentifier;
      self->mTransferredBundleIdentifier = v17;

      if (self->mHasInstalledRestriction)
        -[STUAppLockLongRunningOperation installSingleAppModeRestriction](self, "installSingleAppModeRestriction");
    }

  }
  else if (a4)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation appLockErrorForBundleIdentifier:underlyingError:](self, "appLockErrorForBundleIdentifier:underlyingError:", v7, v11));
  }

  return v10;
}

- (id)whitelistedBundleIdentifiers
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppWhitelist bundleIdentifiers](self->mWhitelist, "bundleIdentifiers"));
  v4 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", self->mCurrentBundleIdentifier);
  if (self->mTransferredBundleIdentifier)
    objc_msgSend(v4, "addObject:");
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (void)installSingleAppModeRestriction
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  STUAppWhitelist *mWhitelist;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  STUAppLockLongRunningOperation *v20;
  __int16 v21;
  void *v22;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 235, CFSTR("%@ must be called from the main thread"), v17);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationWorkspace"));
  objc_msgSend(v5, "startUsingCachedData");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation whitelistedBundleIdentifiers](self, "whitelistedBundleIdentifiers"));
  v7 = sub_100043900();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Installing Single App Mode restriction for bundle identifiers: %{public}@", buf, 0x16u);
  }

  mWhitelist = self->mWhitelist;
  v18 = 0;
  v10 = -[STUAppWhitelist setBundleIdentifiers:error:](mWhitelist, "setBundleIdentifiers:error:", v6, &v18);
  v11 = v18;
  if ((v10 & 1) != 0)
  {
    if (!self->mHasInstalledRestriction)
    {
      self->mHasInstalledRestriction = 1;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "postNotificationName:object:", CFSTR("STUDidApplyAppLockNotificationName"), self);

    }
    if (self->mTransferredBundleIdentifier)
      -[STUAppLockLongRunningOperation openTransferredApp](self, "openTransferredApp");
  }
  else
  {
    v13 = sub_100043900();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10007C4DC((uint64_t)self, v11);

    -[STUAppLockLongRunningOperation cleanupAndFinishWithError:](self, "cleanupAndFinishWithError:", v11);
  }

}

- (void)openTransferredApp
{
  STUOpenAppLockTransferredAppOperation *v3;
  NSString *mTransferredBundleIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CATOperation *v9;
  CATOperation *mOpenTransferredAppOperation;
  void *v12;
  id v13;

  if (!self->mTransferredBundleIdentifier)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 261, CFSTR("nil transferred app"));

  }
  -[CATOperation cancel](self->mOpenTransferredAppOperation, "cancel");
  v3 = [STUOpenAppLockTransferredAppOperation alloc];
  mTransferredBundleIdentifier = self->mTransferredBundleIdentifier;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
  v9 = -[STUOpenAppLockTransferredAppOperation initWithBundleIdentifier:primitives:device:](v3, "initWithBundleIdentifier:primitives:device:", mTransferredBundleIdentifier, v6, v8);
  mOpenTransferredAppOperation = self->mOpenTransferredAppOperation;
  self->mOpenTransferredAppOperation = v9;

  -[CATOperation addTarget:selector:forOperationEvents:](self->mOpenTransferredAppOperation, "addTarget:selector:forOperationEvents:", self, "openTransferredAppOperationDidFinish:", 6);
  v13 = (id)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v13, "addOperation:", self->mOpenTransferredAppOperation);

}

- (void)openTransferredAppOperationDidFinish:(id)a3
{
  CATOperation *v4;
  void *v5;
  id v6;
  NSObject *v7;
  CATOperation *mOpenTransferredAppOperation;
  NSString *mTransferredBundleIdentifier;

  v4 = (CATOperation *)a3;
  if (-[STUAppLockLongRunningOperation isExecuting](self, "isExecuting")
    && self->mOpenTransferredAppOperation == v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CATOperation error](v4, "error"));

    if (v5)
    {
      v6 = sub_100043900();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10007C560((uint64_t)self, v4);

    }
    mOpenTransferredAppOperation = self->mOpenTransferredAppOperation;
    self->mOpenTransferredAppOperation = 0;

    objc_storeStrong((id *)&self->mCurrentBundleIdentifier, self->mTransferredBundleIdentifier);
    mTransferredBundleIdentifier = self->mTransferredBundleIdentifier;
    self->mTransferredBundleIdentifier = 0;

    -[STUAppLockLongRunningOperation whitelistSingleBundleIdentifier:](self, "whitelistSingleBundleIdentifier:", self->mCurrentBundleIdentifier);
  }

}

- (void)whitelistSingleBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  STUAppWhitelist *mWhitelist;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  STUAppLockLongRunningOperation *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = sub_100043900();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Whitelisting only %{public}@", buf, 0x16u);
  }

  mWhitelist = self->mWhitelist;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  v14 = 0;
  v9 = -[STUAppWhitelist setBundleIdentifiers:error:](mWhitelist, "setBundleIdentifiers:error:", v8, &v14);
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    v11 = sub_100043900();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "verboseDescription"));
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set whitelist to only %{public}@: %{public}@", buf, 0x20u);

    }
    -[STUAppLockLongRunningOperation cleanupAndFinishWithError:](self, "cleanupAndFinishWithError:", v10);
  }

}

- (void)cleanupAndFinishWithError:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  CATOperation *mOpenTransferredAppOperation;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSTimer *v14;
  NSTimer *mWaitForExitFromSingleAppModeTimeoutTimer;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  STUAppLockLongRunningOperation *v23;

  v6 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 304, CFSTR("%@ must be called from the main thread"), v19);

    if (v6)
      goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  if (self->mError)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 306, CFSTR("Cleanup and finish should only be called once"));

  }
  objc_storeStrong((id *)&self->mError, a3);
  if (self->mWaitingForUnlock)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CFSTR("lockState"), "STUAppLockLongRunningOperationObservationContext");

    self->mWaitingForUnlock = 0;
  }
  -[CATOperation cancel](self->mOpenTransferredAppOperation, "cancel");
  mOpenTransferredAppOperation = self->mOpenTransferredAppOperation;
  self->mOpenTransferredAppOperation = 0;

  objc_msgSend((id)objc_opt_class(self), "removeCurrentAppLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationWorkspace"));
  objc_msgSend(v11, "stopUsingCachedData");

  v12 = sub_100043900();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: Waiting for Guided access to end", buf, 0xCu);
  }

  v14 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "waitForExitFromSingleAppModeTimeoutDidFire:", 0, 0, 10.0));
  mWaitForExitFromSingleAppModeTimeoutTimer = self->mWaitForExitFromSingleAppModeTimeoutTimer;
  self->mWaitForExitFromSingleAppModeTimeoutTimer = v14;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100044C88, AXGuidedAccessActiveStatusDidChangeBroadcastNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
  -[STUAppLockLongRunningOperation guidedAccessActiveStatusDidChange:](self, "guidedAccessActiveStatusDidChange:", 0);

}

- (void)guidedAccessActiveStatusDidChange:(id)a3
{
  id v5;
  NSObject *v6;
  NSTimer *mWaitForExitFromSingleAppModeTimeoutTimer;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  STUAppLockLongRunningOperation *v10;

  if (+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    if (-[STUAppLockLongRunningOperation isExecuting](self, "isExecuting"))
    {
      if (-[STUAppLockLongRunningOperation isGuidedAccessActive](self, "isGuidedAccessActive"))
      {
        v5 = sub_100043900();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v9 = 138543362;
          v10 = self;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Guided access is active", (uint8_t *)&v9, 0xCu);
        }

      }
      else
      {
        -[NSTimer invalidate](self->mWaitForExitFromSingleAppModeTimeoutTimer, "invalidate");
        mWaitForExitFromSingleAppModeTimeoutTimer = self->mWaitForExitFromSingleAppModeTimeoutTimer;
        self->mWaitForExitFromSingleAppModeTimeoutTimer = 0;

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, AXGuidedAccessActiveStatusDidChangeBroadcastNotification, 0);
        if (self->mError)
          -[STUAppLockLongRunningOperation endOperationWithError:](self, "endOperationWithError:");
        else
          -[STUAppLockLongRunningOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
      }
    }
  }
  else
  {
    -[STUAppLockLongRunningOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)waitForExitFromSingleAppModeTimeoutDidFire:(id)a3
{
  NSTimer *mWaitForExitFromSingleAppModeTimeoutTimer;
  __CFNotificationCenter *DarwinNotifyCenter;
  unsigned int v7;
  NSError *mError;
  void *v9;
  uint64_t v10;
  NSError *v11;
  uint64_t v12;
  NSError *v13;
  uint64_t v14;
  NSError *v15;
  uint64_t v16;
  NSError *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSErrorUserInfoKey v21;
  NSError *v22;
  NSErrorUserInfoKey v23;
  NSError *v24;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 378, CFSTR("%@ must be called from the main thread"), v20);

  }
  if (-[STUAppLockLongRunningOperation isExecuting](self, "isExecuting"))
  {
    mWaitForExitFromSingleAppModeTimeoutTimer = self->mWaitForExitFromSingleAppModeTimeoutTimer;
    self->mWaitForExitFromSingleAppModeTimeoutTimer = 0;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, AXGuidedAccessActiveStatusDidChangeBroadcastNotification, 0);
    v7 = -[STUAppLockLongRunningOperation isRequestDMF](self, "isRequestDMF");
    mError = self->mError;
    if (v7)
    {
      if (mError)
      {
        v23 = NSUnderlyingErrorKey;
        v24 = mError;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        v10 = DMFErrorWithCodeAndUserInfo(106, v9);
        v11 = (NSError *)objc_claimAutoreleasedReturnValue(v10);
LABEL_9:
        v13 = self->mError;
        self->mError = v11;

LABEL_13:
        -[STUAppLockLongRunningOperation endOperationWithError:](self, "endOperationWithError:", self->mError);
        return;
      }
      v14 = DMFErrorWithCodeAndUserInfo(106, 0);
      v15 = (NSError *)objc_claimAutoreleasedReturnValue(v14);
    }
    else
    {
      if (mError)
      {
        v21 = NSUnderlyingErrorKey;
        v22 = mError;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
        v12 = CRKErrorWithCodeAndUserInfo(126, v9);
        v11 = (NSError *)objc_claimAutoreleasedReturnValue(v12);
        goto LABEL_9;
      }
      v16 = CRKErrorWithCodeAndUserInfo(126, 0);
      v15 = (NSError *)objc_claimAutoreleasedReturnValue(v16);
    }
    v17 = self->mError;
    self->mError = v15;

    goto LABEL_13;
  }
}

- (BOOL)isGuidedAccessActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](AXBackBoardServer, "server"));
  v3 = objc_msgSend(v2, "isGuidedAccessActive");

  return v3;
}

- (id)appLockErrorForBundleIdentifier:(id)a3 underlyingError:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockLongRunningOperation.m"), 411, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  if (-[STUAppLockLongRunningOperation isRequestDMF](self, "isRequestDMF"))
    v9 = objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation DMFAppLockErrorForBundleIdentifier:underlyingError:](self, "DMFAppLockErrorForBundleIdentifier:underlyingError:", v7, v8));
  else
    v9 = objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation CRKAppLockErrorForBundleIdentifier:underlyingError:](self, "CRKAppLockErrorForBundleIdentifier:underlyingError:", v7, v8));
  v10 = (void *)v9;

  return v10;
}

- (id)DMFAppLockErrorForBundleIdentifier:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, DMFBundleIdentifierErrorKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
  v8 = -[NSMutableDictionary copy](v7, "copy");
  v9 = DMFErrorWithCodeAndUserInfo(107, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)CRKAppLockErrorForBundleIdentifier:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, CFSTR("kCRKBundleIdentifierErrorKey"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
  v8 = -[NSMutableDictionary copy](v7, "copy");
  v9 = CRKErrorWithCodeAndUserInfo(127, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (BOOL)isRequestDMF
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation request](self, "request"));
  v3 = objc_opt_class(DMFStartAppLockRequest);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (id)bundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLockLongRunningOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifierForRequest:", v4));

  return v5;
}

+ (id)bundleIdentifierForRequest:(id)a3
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
  v4 = objc_opt_class(DMFStartAppLockRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKStartAppLockRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v14 = v13;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWhitelist, 0);
  objc_storeStrong((id *)&self->mOpenTransferredAppOperation, 0);
  objc_storeStrong((id *)&self->mTransferredBundleIdentifier, 0);
  objc_storeStrong((id *)&self->mCurrentBundleIdentifier, 0);
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mWaitForExitFromSingleAppModeTimeoutTimer, 0);
}

@end
