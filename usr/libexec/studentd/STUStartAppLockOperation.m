@implementation STUStartAppLockOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  return +[STUAppLockLongRunningOperation validateRequest:error:](STUAppLockLongRunningOperation, "validateRequest:error:", a3, a4);
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUStartAppLockOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100037548;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (void)runWithRequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUStartAppLockOperation.m"), 55, CFSTR("%@ must be called from the main thread"), v16);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enrollmentRecord"));

  if (v17)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomLockDeviceAllowed](CRKRestrictions, "classroomLockDeviceAllowed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configurationManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[STUFeatureFactory featureForCRKFeature:enrollmentRecord:configurationManager:](STUFeatureFactory, "featureForCRKFeature:enrollmentRecord:configurationManager:", v6, v17, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[STUAskAlertModelFactory sharedFactory](STUAskAlertModelFactory, "sharedFactory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation instructorName](self, "instructorName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lockTextWithInstructorName:", v11));

    -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", v9, v12);
  }
  else
  {
    v13 = CRKErrorWithCodeAndUserInfo(16, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[STUStartAppLockOperation endOperationWithError:](self, "endOperationWithError:", v9);
  }

}

- (void)askOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[STUStartAppLockOperation isCanceled](self, "isCanceled"))
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation request](self, "request"));
      -[STUStartAppLockOperation performRequest:](self, "performRequest:", v7);
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
  }
  v7 = (void *)v5;
  -[STUStartAppLockOperation endOperationWithError:](self, "endOperationWithError:", v5);
LABEL_7:

}

- (void)operationWillFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUStartAppLockOperation;
  -[STUTaskOperation operationWillFinish](&v3, "operationWillFinish");
  -[STUStartAppLockOperation endObservingDevice](self, "endObservingDevice");
}

- (id)existingAppLockOperation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allRunningOperations"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(STUAppLockLongRunningOperation);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)performRequest:(id)a3
{
  STUAppLockLongRunningOperation *v4;
  void *v5;
  unsigned __int8 v6;
  STUAppLockLongRunningOperation *v7;
  STUStartAppLockOperation *v8;
  STUAppLockLongRunningOperation *v9;
  STUAppLockLongRunningOperation *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (STUAppLockLongRunningOperation *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation existingAppLockOperation](self, "existingAppLockOperation", a3));
  if (-[STUAppLockLongRunningOperation isExecuting](v4, "isExecuting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation bundleIdentifier](self, "bundleIdentifier"));
    v13 = 0;
    v6 = -[STUAppLockLongRunningOperation transferLockToBundleIdentifier:error:](v4, "transferLockToBundleIdentifier:error:", v5, &v13);
    v7 = (STUAppLockLongRunningOperation *)v13;

    v8 = self;
    if ((v6 & 1) == 0)
    {
      -[STUStartAppLockOperation endOperationWithError:](self, "endOperationWithError:", v7);
      goto LABEL_7;
    }
    v9 = v4;
  }
  else
  {
    v10 = [STUAppLockLongRunningOperation alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation request](self, "request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = -[STUTaskOperation initWithRequest:context:delegate:](v10, "initWithRequest:context:delegate:", v11, v12, self);

    -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v7);
    v8 = self;
    v9 = v7;
  }
  -[STUStartAppLockOperation trackLongRunningOperation:](v8, "trackLongRunningOperation:", v9);
LABEL_7:

}

- (void)trackLongRunningOperation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  STUStartAppLockOperation *v15;
  __int16 v16;
  void *v17;

  -[STUStartAppLockOperation setAppLockOperation:](self, "setAppLockOperation:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allOpenApplications"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation bundleIdentifier](self, "bundleIdentifier"));
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {

    goto LABEL_7;
  }
  v9 = objc_msgSend(v5, "isAppLocked");

  if (!v9)
  {
LABEL_7:
    -[STUStartAppLockOperation beginObservingDevice](self, "beginObservingDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation appLockOperation](self, "appLockOperation"));
    objc_msgSend(v13, "addTarget:selector:forOperationEvents:", self, "appLockOperationFailed:", 4);

    goto LABEL_8;
  }
  v10 = sub_100037BE4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation bundleIdentifier](self, "bundleIdentifier"));
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: Device already locked to %{public}@ nothing to do", (uint8_t *)&v14, 0x16u);

  }
  -[STUStartAppLockOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
LABEL_8:

}

- (void)appLockOperationFailed:(id)a3
{
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUStartAppLockOperation.m"), 146, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (-[STUStartAppLockOperation isExecuting](self, "isExecuting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    -[STUStartAppLockOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
}

- (id)observedDeviceKeyPaths
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("primaryOpenApplication"), CFSTR("appLocked"), 0);
}

- (void)beginObservingDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!self->mIsObservingDevice)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation observedDeviceKeyPaths](self, "observedDeviceKeyPaths", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), 4, CFSTR("STUStartAppLockOperationContext"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    self->mIsObservingDevice = 1;
  }
}

- (void)endObservingDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->mIsObservingDevice)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation observedDeviceKeyPaths](self, "observedDeviceKeyPaths", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), CFSTR("STUStartAppLockOperationContext"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    self->mIsObservingDevice = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v6[5];
  objc_super v7;

  if (a6 == CFSTR("STUStartAppLockOperationContext"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100038050;
    v6[3] = &unk_1000C97E8;
    v6[4] = self;
    +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v6, a4, a5);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)STUStartAppLockOperation;
    -[STUStartAppLockOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
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

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v14 = v13;

  return v14;
}

- (id)bundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUStartAppLockOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifierForRequest:", v4));

  return v5;
}

- (STUAppLockLongRunningOperation)appLockOperation
{
  return self->_appLockOperation;
}

- (void)setAppLockOperation:(id)a3
{
  objc_storeStrong((id *)&self->_appLockOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLockOperation, 0);
}

@end
