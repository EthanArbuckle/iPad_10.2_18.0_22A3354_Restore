@implementation STUManagementLockOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  return +[STULockLongRunningOperation validateRequest:error:](STULockLongRunningOperation, "validateRequest:error:", a3, a4);
}

- (BOOL)requireLoggedInUser
{
  return 1;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUManagementLockOperation.m"), 38, CFSTR("%@ must be called from the main thread"), v16);

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
    -[STUManagementLockOperation endOperationWithError:](self, "endOperationWithError:", v9);
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
  if (-[STUManagementLockOperation isCanceled](self, "isCanceled"))
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUManagementLockOperation request](self, "request"));
      -[STUManagementLockOperation performRequest:](self, "performRequest:", v7);
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
  }
  v7 = (void *)v5;
  -[STUManagementLockOperation endOperationWithError:](self, "endOperationWithError:", v5);
LABEL_7:

}

- (void)performRequest:(id)a3
{
  STULockLongRunningOperation *v4;
  void *v5;
  void *v6;
  STULockLongRunningOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  STUManagementLockOperation *v17;

  v4 = [STULockLongRunningOperation alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUManagementLockOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = -[STUTaskOperation initWithRequest:context:delegate:](v4, "initWithRequest:context:delegate:", v5, v6, self);
  -[STUManagementLockOperation setLockOperation:](self, "setLockOperation:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUManagementLockOperation lockOperation](self, "lockOperation"));
  -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));

  v11 = objc_msgSend(v10, "lockState");
  v12 = sub_1000460A4();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11 == (id)3)
  {
    if (v14)
    {
      v16 = 138543362;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: Device already locked", (uint8_t *)&v16, 0xCu);
    }

    -[STUManagementLockOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (v14)
    {
      v16 = 138543362;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: Waiting for classroom lock screen to appear", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("lockState"), 0, "kSTUManagementLockOperationObservationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUManagementLockOperation lockOperation](self, "lockOperation"));
    objc_msgSend(v15, "addTarget:selector:forOperationEvents:", self, "lockFailedToTakeEffect:", 4);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v6[5];
  objc_super v7;

  if (a6 == "kSTUManagementLockOperationObservationContext")
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100046170;
    v6[3] = &unk_1000C97E8;
    v6[4] = self;
    +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v6, a4, a5);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)STUManagementLockOperation;
    -[STUManagementLockOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)lockFailedToTakeEffect:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint8_t buf[4];
  STUManagementLockOperation *v15;

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUManagementLockOperation.m"), 105, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (-[STUManagementLockOperation isExecuting](self, "isExecuting"))
  {
    v6 = sub_1000460A4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: classroom lock screen failed to load", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "device"));
    objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, CFSTR("lockState"), "kSTUManagementLockOperationObservationContext");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));
    -[STUManagementLockOperation endOperationWithError:](self, "endOperationWithError:", v10);

  }
}

- (STULockLongRunningOperation)lockOperation
{
  return self->_lockOperation;
}

- (void)setLockOperation:(id)a3
{
  objc_storeStrong((id *)&self->_lockOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOperation, 0);
}

@end
