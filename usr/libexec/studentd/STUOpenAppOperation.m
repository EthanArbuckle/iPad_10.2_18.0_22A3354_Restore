@implementation STUOpenAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STUOpenAppOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  if ((objc_msgSend(a1, "isValidRequestClass:", v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crkOpenAppRequestFromRequest:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

    if (v8)
    {
      if ((objc_msgSend(a1, "supportsAppLock") & 1) != 0 || !objc_msgSend(v7, "lockInApp"))
      {
        v11 = 1;
LABEL_16:

        goto LABEL_17;
      }
      if (a4)
      {
        v9 = &off_1000D2DE0;
LABEL_14:
        v12 = CATErrorWithCodeAndUserInfo(2, v9);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
        goto LABEL_16;
      }
    }
    else if (a4)
    {
      v9 = &off_1000D2DB8;
      goto LABEL_14;
    }
    v11 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D2D90);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
LABEL_10:
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUOpenAppOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013B54;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  -[STUOpenAppOperation askForPermission](self, "askForPermission", a3);
}

- (void)askForPermission
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppOperation.m"), 89, CFSTR("%@ must be called from the main thread"), v15);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentRecord"));

  if (v16)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomOpenAppAllowed](CRKRestrictions, "classroomOpenAppAllowed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[STUFeatureFactory featureForCRKFeature:enrollmentRecord:configurationManager:](STUFeatureFactory, "featureForCRKFeature:enrollmentRecord:configurationManager:", v5, v16, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[STUAskAlertModelFactory sharedFactory](STUAskAlertModelFactory, "sharedFactory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation instructorName](self, "instructorName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "openAppTextWithInstructorName:", v10));

    -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", v8, v11);
  }
  else
  {
    v12 = CRKErrorWithCodeAndUserInfo(16, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v8);
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
  if (-[STUOpenAppOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenAppOperation isCanceled](self, "isCanceled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STUOpenAppOperation checkAppCanBeOpened](self, "checkAppCanBeOpened");
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
LABEL_8:

}

- (void)checkAppCanBeOpened
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation openAppRequest](self, "openAppRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v9 = 0;
  v7 = objc_msgSend(v4, "isBundleIdentifierLaunchable:returnDMFError:error:", v6, -[STUOpenAppOperation isDMFRequest](self, "isDMFRequest"), &v9);
  v8 = v9;

  if ((v7 & 1) != 0)
    -[STUOpenAppOperation becomeExclusiveOrStartLockApp](self, "becomeExclusiveOrStartLockApp");
  else
    -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v8);

}

- (void)becomeExclusiveOrStartLockApp
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation openAppRequest](self, "openAppRequest"));
  v4 = objc_msgSend(v3, "lockInApp");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation makeOperationToPerformStartAppLock](self, "makeOperationToPerformStartAppLock"));
    -[STUOpenAppOperation setStartAppLockOperation:](self, "setStartAppLockOperation:", v5);
    objc_msgSend(v5, "addTarget:selector:forOperationEvents:", self, "startAppLockOperationDidFinish:", 6);
    -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v5);

  }
  else
  {
    -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");
  }
}

- (void)startAppLockOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STUOpenAppOperation setStartAppLockOperation:](self, "setStartAppLockOperation:", 0);
  if (-[STUOpenAppOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenAppOperation isCanceled](self, "isCanceled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STUOpenAppOperation deviceIsReadyToOpenApp](self, "deviceIsReadyToOpenApp");
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
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
  v4 = -[STUOpenAppOperation isExecuting](self, "isExecuting");
  v5 = v8;
  if (v4)
  {
    if (-[STUOpenAppOperation isCanceled](self, "isCanceled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v7);

    }
    else if (v8)
    {
      -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v8);
    }
    else
    {
      -[STUOpenAppOperation deviceIsReadyToOpenApp](self, "deviceIsReadyToOpenApp");
    }
    v5 = v8;
  }

}

- (void)deviceIsReadyToOpenApp
{
  void *v4;
  STULaunchAppOperation_iOS *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  STULaunchAppOperation_iOS *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOpenAppOperation.m"), 187, CFSTR("%@ must be called from the main thread"), v13);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation openAppRequest](self, "openAppRequest"));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[STULaunchAppConfiguration configurationWithOpenAppRequest:](STULaunchAppConfiguration, "configurationWithOpenAppRequest:", v4));

  v5 = [STULaunchAppOperation_iOS alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primitives"));
  v10 = -[STULaunchAppOperation_iOS initWithConfiguration:device:primitives:shouldReturnDMFErrors:](v5, "initWithConfiguration:device:primitives:shouldReturnDMFErrors:", v14, v7, v9, -[STUOpenAppOperation isDMFRequest](self, "isDMFRequest"));

  -[STUOpenAppOperation setLaunchAppOperation:](self, "setLaunchAppOperation:", v10);
  -[STULaunchAppOperation_iOS addTarget:selector:forOperationEvents:](v10, "addTarget:selector:forOperationEvents:", self, "launchAppOperationDidFinish:", 6);
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v10);

}

- (void)launchAppOperationDidFinish:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STUOpenAppOperation setLaunchAppOperation:](self, "setLaunchAppOperation:", 0);
  if (-[STUOpenAppOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUOpenAppOperation isCanceled](self, "isCanceled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = objc_claimAutoreleasedReturnValue(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

      if (!v6)
      {
        -[STUOpenAppOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
        goto LABEL_8;
      }
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    }
    v7 = (void *)v5;
    -[STUOpenAppOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
LABEL_8:

}

- (id)makeOperationToPerformStartAppLock
{
  STUStartAppLockOperation *v3;
  void *v4;
  void *v5;
  STUStartAppLockOperation *v6;

  v3 = [STUStartAppLockOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation startAppLockRequest](self, "startAppLockRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = -[STUTaskOperation initWithRequest:context:delegate:](v3, "initWithRequest:context:delegate:", v4, v5, self);

  return v6;
}

- (id)openAppRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation backingOpenAppRequest](self, "backingOpenAppRequest"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation request](self, "request"));
    v5 = objc_opt_class(CRKOpenAppRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      -[STUOpenAppOperation setBackingOpenAppRequest:](self, "setBackingOpenAppRequest:", v4);
    }
    else
    {
      v8 = (void *)objc_opt_class(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation request](self, "request"));
      v10 = objc_opt_class(DMFOpenAppRequest);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUOpenAppOperation openAppRequest]"));
        v15 = (objc_class *)objc_opt_class(DMFOpenAppRequest);
        v16 = NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (objc_class *)objc_opt_class(v9);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("STUOpenAppOperation.m"), 247, CFSTR("expected %@, got %@"), v17, v20);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crkOpenAppRequestFromDMFRequest:", v9));
      -[STUOpenAppOperation setBackingOpenAppRequest:](self, "setBackingOpenAppRequest:", v11);

    }
  }
  return (id)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation backingOpenAppRequest](self, "backingOpenAppRequest"));
}

+ (BOOL)isDMFRequest:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(DMFOpenAppRequest);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)isDMFRequest
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation request](self, "request"));
  LOBYTE(v3) = objc_msgSend(v3, "isDMFRequest:", v4);

  return (char)v3;
}

+ (BOOL)isValidRequestClass:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;

  v3 = a3;
  v4 = objc_opt_class(CRKOpenAppRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = objc_opt_class(DMFOpenAppRequest);
    isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  }

  return isKindOfClass & 1;
}

+ (id)crkOpenAppRequestFromRequest:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;

  v4 = a3;
  v5 = objc_msgSend(a1, "isDMFRequest:", v4);
  v6 = v4;
  if (v5)
  {
    v7 = objc_opt_class(DMFOpenAppRequest);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STUOpenAppOperation crkOpenAppRequestFromRequest:]"));
      v14 = (objc_class *)objc_opt_class(DMFOpenAppRequest);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (objc_class *)objc_opt_class(v6);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("STUOpenAppOperation.m"), 266, CFSTR("expected %@, got %@"), v16, v19);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crkOpenAppRequestFromDMFRequest:", v6));
    v9 = v6;
  }
  else
  {
    v10 = objc_opt_class(CRKOpenAppRequest);
    v8 = v6;
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
      goto LABEL_7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STUOpenAppOperation crkOpenAppRequestFromRequest:]"));
    v21 = (objc_class *)objc_opt_class(CRKOpenAppRequest);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (objc_class *)objc_opt_class(v6);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("STUOpenAppOperation.m"), 267, CFSTR("expected %@, got %@"), v23, v26);

    v8 = v6;
  }

LABEL_7:
  return v8;
}

+ (id)crkOpenAppRequestFromDMFRequest:(id)a3
{
  id v3;
  CRKOpenAppRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = objc_opt_new(CRKOpenAppRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  -[CRKOpenAppRequest setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  -[CRKOpenAppRequest setActivityType:](v4, "setActivityType:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityData"));
  -[CRKOpenAppRequest setActivityData:](v4, "setActivityData:", v7);

  v8 = objc_msgSend(v3, "lockInApp");
  -[CRKOpenAppRequest setLockInApp:](v4, "setLockInApp:", v8);
  return v4;
}

- (id)startAppLockRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[STUOpenAppOperation isDMFRequest](self, "isDMFRequest"))
    v3 = DMFStartAppLockRequest;
  else
    v3 = CRKStartAppLockRequest;
  v4 = (void *)objc_opt_new(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUOpenAppOperation openAppRequest](self, "openAppRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  return v4;
}

- (CRKOpenAppRequest)backingOpenAppRequest
{
  return self->_backingOpenAppRequest;
}

- (void)setBackingOpenAppRequest:(id)a3
{
  objc_storeStrong((id *)&self->_backingOpenAppRequest, a3);
}

- (CATOperation)startAppLockOperation
{
  return self->_startAppLockOperation;
}

- (void)setStartAppLockOperation:(id)a3
{
  objc_storeStrong((id *)&self->_startAppLockOperation, a3);
}

- (CATOperation)launchAppOperation
{
  return self->_launchAppOperation;
}

- (void)setLaunchAppOperation:(id)a3
{
  objc_storeStrong((id *)&self->_launchAppOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchAppOperation, 0);
  objc_storeStrong((id *)&self->_startAppLockOperation, 0);
  objc_storeStrong((id *)&self->_backingOpenAppRequest, 0);
}

@end
