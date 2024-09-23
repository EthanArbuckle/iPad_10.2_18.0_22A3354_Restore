@implementation STUAskOperation

- (STUAskOperation)initWithRequest:(id)a3 context:(id)a4 delegate:(id)a5 feature:(id)a6 alertModel:(id)a7 supportsAlwaysAllow:(BOOL)a8
{
  id v15;
  id v16;
  STUAskOperation *v17;
  STUAskOperation *v18;
  objc_super v20;

  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STUAskOperation;
  v17 = -[STUTaskOperation initWithRequest:context:delegate:](&v20, "initWithRequest:context:delegate:", a3, a4, a5);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->mFeature, a6);
    objc_storeStrong((id *)&v18->mAlertModel, a7);
    v18->_supportsAlwaysAllow = a8;
  }

  return v18;
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
  v4.super_class = (Class)STUAskOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005F698;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005F748;
  v2[3] = &unk_1000C97E8;
  v2[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v2);
}

- (void)askIfNeeded
{
  uint64_t v3;
  STUFeatureProtocol *mFeature;
  unsigned __int8 v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  NSString *mFeatureToken;
  STUFeatureToken *v11;
  void *v12;
  void *v13;
  void *v14;
  STUFeatureToken *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  STUManagementUnlockOperation *v27;
  void *v28;
  void *v29;
  STUManagementUnlockOperation *v30;
  STUManagementUnlockOperation *mUnlockOperation;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  STUFeatureProtocol *v37;
  id v38;
  NSObject *v39;
  void *v40;
  STUFeatureProtocol *v41;
  id v42;
  NSObject *v43;
  STUFeatureProtocol *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  STUAskOperation *v52;
  __int16 v53;
  STUFeatureProtocol *v54;

  if (-[STUAskOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUAskOperation isCancelled](self, "isCancelled"))
    {
      v3 = CATErrorWithCodeAndUserInfo(404, 0);
      v45 = (id)objc_claimAutoreleasedReturnValue(v3);
      -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v45);

      return;
    }
    mFeature = self->mFeature;
    v50 = 0;
    v5 = -[STUFeatureProtocol permissionWithError:](mFeature, "permissionWithError:", &v50);
    v6 = v50;
    v7 = -[STUAskOperation supportsAlwaysAllow](self, "supportsAlwaysAllow");
    if ((v5 & 2) != 0)
      v8 = 0;
    else
      v8 = v7;
    if (self->mFeature)
      v9 = (v5 & 1) == 0;
    else
      v9 = 0;
    if (v9)
    {
      if (v6)
      {
        -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v6);
      }
      else
      {
        v32 = CRKErrorWithCodeAndUserInfo(110, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v33);

      }
      goto LABEL_34;
    }
    mFeatureToken = self->mFeatureToken;
    self->mFeatureToken = 0;

    if (self->mFeature)
    {
      v11 = [STUFeatureToken alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sessionToken"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeatureProtocol CRKFeature](self->mFeature, "CRKFeature"));
      v15 = -[STUFeatureToken initWithSessionToken:feature:](v11, "initWithSessionToken:feature:", v13, v14);

      v16 = (NSString *)objc_claimAutoreleasedReturnValue(-[STUFeatureToken stringValue](v15, "stringValue"));
      v17 = self->mFeatureToken;
      self->mFeatureToken = v16;

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tokenAuthenticator"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sessionToken"));
    v22 = objc_msgSend(v19, "isTokenAuthenticated:", v21);

    if (self->mFeatureToken)
    {
      v23 = objc_msgSend(v19, "isTokenAuthenticated:");
      if (v19)
        goto LABEL_15;
    }
    else
    {
      v23 = 1;
      if (v19)
      {
LABEL_15:
        if (v22)
        {
          if (((v8 | v23) & 1) != 0)
            goto LABEL_30;
          v23 = 0;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "device"));
        v26 = objc_msgSend(v25, "lockState") == (id)3;

        if (v26)
        {
          v27 = [STUManagementUnlockOperation alloc];
          v28 = (void *)objc_opt_new(DMFManagementUnlockRequest);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
          v30 = -[STUTaskOperation initWithRequest:context:delegate:](v27, "initWithRequest:context:delegate:", v28, v29, self);
          mUnlockOperation = self->mUnlockOperation;
          self->mUnlockOperation = v30;

          -[STUManagementUnlockOperation addTarget:selector:forOperationEvents:](self->mUnlockOperation, "addTarget:selector:forOperationEvents:", self, "unlockOperationDidFinish:", 6);
          -[STUTaskOperation enqueueOperation:](self, "enqueueOperation:", self->mUnlockOperation);
LABEL_33:

LABEL_34:
          return;
        }
        if ((v22 & 1) == 0)
        {
          v38 = sub_10005FDC0();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
            v41 = (STUFeatureProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "sessionToken"));
            *(_DWORD *)buf = 138543618;
            v52 = self;
            v53 = 2114;
            v54 = v41;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%{public}@: Session is not authenticated prompting user to take part in class: %{public}@", buf, 0x16u);

          }
          objc_initWeak((id *)buf, self);
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10005FE00;
          v48[3] = &unk_1000C9F38;
          objc_copyWeak(&v49, (id *)buf);
          -[STUAskOperation wakeScreenWithCompletion:](self, "wakeScreenWithCompletion:", v48);
          objc_destroyWeak(&v49);
          objc_destroyWeak((id *)buf);
          goto LABEL_33;
        }
        if (((v23 | v8) & 1) == 0)
        {
          v42 = sub_10005FDC0();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = self->mFeature;
            *(_DWORD *)buf = 138543618;
            v52 = self;
            v53 = 2114;
            v54 = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%{public}@: Feature is not authenticated prompting user to allow feature: %{public}@", buf, 0x16u);
          }

          objc_initWeak((id *)buf, self);
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_10005FE2C;
          v46[3] = &unk_1000C9F38;
          objc_copyWeak(&v47, (id *)buf);
          -[STUAskOperation wakeScreenWithCompletion:](self, "wakeScreenWithCompletion:", v46);
          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
          goto LABEL_33;
        }
LABEL_30:
        v35 = sub_10005FDC0();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = self->mFeature;
          *(_DWORD *)buf = 138543618;
          v52 = self;
          v53 = 2114;
          v54 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}@: Feature is allowed: %{public}@", buf, 0x16u);
        }

        -[STUAskOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", &__kCFBooleanTrue);
        goto LABEL_33;
      }
    }
    if (qword_1000FC5A0 != -1)
      dispatch_once(&qword_1000FC5A0, &stru_1000CB8B8);
    v34 = qword_1000FC598;
    if (os_log_type_enabled((os_log_t)qword_1000FC598, OS_LOG_TYPE_ERROR))
      sub_10007D644(v34);
    goto LABEL_30;
  }
}

- (void)unlockOperationDidFinish:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAskOperation.m"), 156, CFSTR("%@ must be called from the main thread"), v9);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    -[STUAskOperation failWithUnderlyingError:](self, "failWithUnderlyingError:", v6);

  }
  else
  {
    -[STUAskOperation askIfNeeded](self, "askIfNeeded");
  }

}

- (void)wakeScreenWithCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)wakeScreenOperationDidFinish:(id)a3 userInfo:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  STUWakeScreenOperation *mWakeScreenOperation;
  void *v11;
  id v12;
  NSObject *v13;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[STUAskOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUAskOperation isCancelled](self, "isCancelled"))
    {
      v8 = CATErrorWithCodeAndUserInfo(404, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v9);

    }
    else
    {
      mWakeScreenOperation = self->mWakeScreenOperation;
      self->mWakeScreenOperation = 0;

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      if (v11)
      {
        v12 = sub_10005FDC0();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10007D684();

      }
      v7[2](v7);
    }
  }

}

- (void)askForSession
{
  STUShowUserNotificationOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CATOperation *v12;
  CATOperation *mAskOperation;
  id v14;
  void *v15;
  id v16;
  id v17;

  v3 = [STUShowUserNotificationOperation alloc];
  v16 = (id)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lockScreenPrimitives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userNotificationPrimitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primitives"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "globalNotificationPrimitives"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskOperation joinClassPromptOptions](self, "joinClassPromptOptions"));
  v12 = -[STUShowUserNotificationOperation initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:](v3, "initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:", v4, v7, v10, v11, -[STUAskOperation joinClassPromptFlags](self, "joinClassPromptFlags"), 0.0);
  mAskOperation = self->mAskOperation;
  self->mAskOperation = v12;

  -[CATOperation addTarget:selector:forOperationEvents:](self->mAskOperation, "addTarget:selector:forOperationEvents:", self, "askOperationForSessionDidStart:", 1);
  -[CATOperation addTarget:selector:forOperationEvents:](self->mAskOperation, "addTarget:selector:forOperationEvents:", self, "askOperationForSessionDidFinish:", 6);
  v14 = objc_msgSend((id)objc_opt_class(self), "notificationOperationQueue");
  v17 = (id)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v17, "addOperation:", self->mAskOperation);

}

- (void)askOperationForSessionDidStart:(id)a3
{
  if (!self->mIsPrompting)
  {
    -[STUAskOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", CRKOperationDidBeginPromptingForRequestPermissionNotificationName, 0);
    self->mIsPrompting = 1;
  }
}

- (void)askOperationForSessionDidFinish:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  STUAskOperation *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint8_t buf[4];
  STUAskOperation *v23;

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAskOperation.m"), 224, CFSTR("%@ must be called from the main thread"), v21);

  }
  if (-[STUAskOperation isCanceled](self, "isCanceled"))
  {
    v6 = CATErrorWithCodeAndUserInfo(404, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v7);
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));

  if (v8)
  {
    v9 = sub_10005FDC0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10007D798();

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));
    v11 = self;
    v12 = v7;
LABEL_9:
    -[STUAskOperation failWithUnderlyingError:](v11, "failWithUnderlyingError:", v12);
    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultObject"));
  if ((-[STUAskOperation handleJoinClassPromptResponse:](self, "handleJoinClassPromptResponse:", objc_msgSend(v7, "selectedResponse")) & 1) != 0)goto LABEL_15;
  v13 = objc_msgSend(v7, "selectedResponse");
  v14 = sub_10005FDC0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 != (id)3)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10007D704();

    v11 = self;
    v12 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: User canceled notification", buf, 0xCu);
  }

  v17 = CRKErrorWithCodeAndUserInfo(110, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v18);

LABEL_15:
}

- (void)askForFeature
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  STUShowUserNotificationOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CATOperation *v18;
  CATOperation *mAskOperation;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v3 = objc_alloc((Class)NSMutableDictionary);
  v24[0] = kCFUserNotificationAlertHeaderKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModel title](self->mAlertModel, "title"));
  v25[0] = v4;
  v24[1] = kCFUserNotificationAlertMessageKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModel message](self->mAlertModel, "message"));
  v25[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  v7 = objc_msgSend(v3, "initWithDictionary:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskOperation askPermissionPromptOptions](self, "askPermissionPromptOptions"));
  v9 = v7;
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  v10 = [STUShowUserNotificationOperation alloc];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "primitives"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lockScreenPrimitives"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primitives"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userNotificationPrimitives"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "primitives"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "globalNotificationPrimitives"));
  v18 = -[STUShowUserNotificationOperation initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:](v10, "initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:", v11, v14, v17, v9, -[STUAskOperation askPermissionPromptFlags](self, "askPermissionPromptFlags"), 0.0);
  mAskOperation = self->mAskOperation;
  self->mAskOperation = v18;

  -[CATOperation addTarget:selector:forOperationEvents:](self->mAskOperation, "addTarget:selector:forOperationEvents:", self, "askOperationForFeatureDidStart:", 1);
  -[CATOperation addTarget:selector:forOperationEvents:](self->mAskOperation, "addTarget:selector:forOperationEvents:", self, "askOperationForFeatureDidFinish:", 6);
  v20 = objc_msgSend((id)objc_opt_class(self), "notificationOperationQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v21, "addOperation:", self->mAskOperation);

}

- (void)askOperationForFeatureDidStart:(id)a3
{
  if (!self->mIsPrompting)
  {
    -[STUAskOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", CRKOperationDidBeginPromptingForRequestPermissionNotificationName, 0);
    self->mIsPrompting = 1;
  }
}

- (void)askOperationForFeatureDidFinish:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  STUAskOperation *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint8_t buf[4];
  STUAskOperation *v23;

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAskOperation.m"), 286, CFSTR("%@ must be called from the main thread"), v21);

  }
  if (-[STUAskOperation isCanceled](self, "isCanceled"))
  {
    v6 = CATErrorWithCodeAndUserInfo(404, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v7);
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));

  if (v8)
  {
    v9 = sub_10005FDC0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10007D798();

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));
    v11 = self;
    v12 = v7;
LABEL_9:
    -[STUAskOperation failWithUnderlyingError:](v11, "failWithUnderlyingError:", v12);
    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultObject"));
  if ((-[STUAskOperation handleAskPermissionPromptResponse:](self, "handleAskPermissionPromptResponse:", objc_msgSend(v7, "selectedResponse")) & 1) != 0)goto LABEL_15;
  v13 = objc_msgSend(v7, "selectedResponse");
  v14 = sub_10005FDC0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 != (id)3)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10007D704();

    v11 = self;
    v12 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@: User canceled notification", buf, 0xCu);
  }

  v17 = CRKErrorWithCodeAndUserInfo(110, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v18);

LABEL_15:
}

- (void)operationWillFinish
{
  objc_super v3;

  if (self->mIsPrompting)
  {
    -[STUAskOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", CRKOperationDidEndPromptingForRequestPermissionNotificationName, 0);
    self->mIsPrompting = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)STUAskOperation;
  -[STUTaskOperation operationWillFinish](&v3, "operationWillFinish");
}

- (void)failWithUnderlyingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSErrorUserInfoKey v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = NSUnderlyingErrorKey;
    v13 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v7 = CRKErrorWithCodeAndUserInfo(109, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
  else
  {
    v9 = sub_10005FDC0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10007D818((uint64_t)self, v10);

    v11 = CRKErrorWithCodeAndUserInfo(109, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }

}

+ (id)notificationOperationQueue
{
  if (qword_1000FC588 != -1)
    dispatch_once(&qword_1000FC588, &stru_1000CB898);
  return (id)qword_1000FC590;
}

- (void)acceptJoinPrompt
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  STUAskOperation *v10;

  v3 = sub_10005FDC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: User responded with Join", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tokenAuthenticator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionToken"));
  objc_msgSend(v6, "authenticateToken:", v8);

  -[STUAskOperation askIfNeeded](self, "askIfNeeded");
}

- (void)denyJoinPrompt
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  STUAskOperation *v8;

  v3 = sub_10005FDC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: User responded with Ignore", (uint8_t *)&v7, 0xCu);
  }

  v5 = CRKErrorWithCodeAndUserInfo(110, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v6);

}

- (void)acceptPermissionPrompt
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  STUAskOperation *v8;

  v3 = sub_10005FDC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: User responded with allow", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tokenAuthenticator"));
  objc_msgSend(v6, "authenticateToken:", self->mFeatureToken);

  -[STUAskOperation askIfNeeded](self, "askIfNeeded");
}

- (void)denyPermissionPrompt
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  STUAskOperation *v8;

  v3 = sub_10005FDC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: User responded with deny", (uint8_t *)&v7, 0xCu);
  }

  v5 = CRKErrorWithCodeAndUserInfo(110, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[STUAskOperation endOperationWithError:](self, "endOperationWithError:", v6);

}

- (void)alwaysAllowPermissionPrompt
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  STUAskOperation *v9;

  v3 = sub_10005FDC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: User responded with always allow", (uint8_t *)&v8, 0xCu);
  }

  -[STUFeatureProtocol setPermission:](self->mFeature, "setPermission:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tokenAuthenticator"));
  objc_msgSend(v6, "authenticateToken:", self->mFeatureToken);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CRKStudentPermissionsDidChangeNotificationName, 0);

  -[STUAskOperation askIfNeeded](self, "askIfNeeded");
}

- (BOOL)supportsAlwaysAllow
{
  return self->_supportsAlwaysAllow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFeatureToken, 0);
  objc_storeStrong((id *)&self->mAskOperation, 0);
  objc_storeStrong((id *)&self->mWakeScreenOperation, 0);
  objc_storeStrong((id *)&self->mUnlockOperation, 0);
  objc_storeStrong((id *)&self->mAlertModel, 0);
  objc_storeStrong((id *)&self->mFeature, 0);
}

@end
