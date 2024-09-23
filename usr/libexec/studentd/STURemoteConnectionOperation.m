@implementation STURemoteConnectionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_super v23;

  v6 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___STURemoteConnectionOperation;
  if (!objc_msgSendSuper2(&v23, "validateRequest:error:", v6, a4))
    goto LABEL_11;
  v7 = objc_opt_class(CRKRemoteConnectionRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v13 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2F48);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
      goto LABEL_12;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v8 = v6;
  v9 = objc_opt_class(CRKRemoteConnectionRequest);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STURemoteConnectionOperation validateRequest:error:]"));
    v17 = (objc_class *)objc_opt_class(CRKRemoteConnectionRequest);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (objc_class *)objc_opt_class(v8);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("STURemoteConnectionOperation.m"), 48, CFSTR("expected %@, got %@"), v19, v22);

  }
  objc_msgSend(v8, "notificationDuration");
  v11 = v10 > 0.0;
  if (a4 && v10 <= 0.0)
  {
    v12 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2F70);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

LABEL_12:
  return v11;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STURemoteConnectionOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019A78;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)operationWillFinish
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation timer](self, "timer"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation postNotificationOperation](self, "postNotificationOperation"));
  objc_msgSend(v4, "cancel");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CRKActiveStudentCoursesDidChangeNotificationName, 0);

}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t v28[16];
  _QWORD v29[4];
  id v30;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "activeCoursesDidChange:", CRKActiveStudentCoursesDidChangeNotificationName, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environmentPrimitives"));
  if ((objc_msgSend(v8, "isRunningOnInternalOS") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primitives"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userDefaultsPrimitives"));
    v12 = objc_msgSend(v11, "shouldAutoAcceptRemoteInvitations");

    if ((v12 & 1) != 0)
    {
      v13 = CFSTR("Auto-accept enabled");
LABEL_7:
      -[STURemoteConnectionOperation processAction:reason:](self, "processAction:reason:", 1, v13);
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (-[STURemoteConnectionOperation isRequestingInstructorAlreadyConnected](self, "isRequestingInstructorAlreadyConnected"))
  {
    v13 = CFSTR("Instructor already connected");
    goto LABEL_7;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "primitives"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timerPrimitives"));
  v17 = objc_msgSend((id)objc_opt_class(self), "notificationDurationTimerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v4, "notificationDuration");
  v20 = v19;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100019E74;
  v29[3] = &unk_1000C9F38;
  objc_copyWeak(&v30, &location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheduleTimerWithIdentifier:timeInterval:fireHandler:", v18, v29, v20));
  -[STURemoteConnectionOperation setTimer:](self, "setTimer:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation makeOperationToPostNotification](self, "makeOperationToPostNotification"));
  -[STURemoteConnectionOperation setPostNotificationOperation:](self, "setPostNotificationOperation:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation postNotificationOperation](self, "postNotificationOperation"));
  objc_msgSend(v23, "addTarget:selector:forOperationEvents:", self, "postNotificationOperationDidFinish:", 6);

  v24 = sub_100019EA0();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "RemoteConnect: Posting user notification.", v28, 2u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation postNotificationOperation](self, "postNotificationOperation"));
  objc_msgSend(v26, "addOperation:", v27);

  objc_destroyWeak(&v30);
LABEL_11:
  objc_destroyWeak(&location);

}

- (void)notificationDurationTimerDidFire
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  uint8_t buf[16];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STURemoteConnectionOperation.m"), 118, CFSTR("%@ must be called from the main thread"), v10);

  }
  if (-[STURemoteConnectionOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation postNotificationOperation](self, "postNotificationOperation"));
    objc_msgSend(v4, "cancel");

    v5 = (void *)objc_opt_new(CRKRemoteConnectionResultObject);
    objc_msgSend(v5, "setResponse:", 0);
    v6 = sub_100019EA0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RemoteConnect: Ring duration timer did fire.", buf, 2u);
    }

    -[STURemoteConnectionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
  }
}

- (void)postNotificationOperationDidFinish:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  id v22;

  v22 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STURemoteConnectionOperation.m"), 133, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (-[STURemoteConnectionOperation isExecuting](self, "isExecuting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURemoteConnectionOperation timer](self, "timer"));
    objc_msgSend(v5, "cancel");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));
      -[STURemoteConnectionOperation endOperationWithError:](self, "endOperationWithError:", v7);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "resultObject"));
      v9 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STURemoteConnectionOperation postNotificationOperationDidFinish:]"));
        v16 = (objc_class *)objc_opt_class(NSNumber);
        v17 = NSStringFromClass(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (objc_class *)objc_opt_class(v8);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("STURemoteConnectionOperation.m"), 146, CFSTR("expected %@, got %@"), v18, v21);

      }
      v10 = objc_msgSend(v8, "integerValue");

      -[STURemoteConnectionOperation processAction:reason:](self, "processAction:reason:", v10, CFSTR("User responded to user notification"));
    }
  }

}

- (void)processAction:(int64_t)a3 reason:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;

  v7 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STURemoteConnectionOperation.m"), 151, CFSTR("%@ must be called from the main thread"), v19);

  }
  v8 = sub_100019EA0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend((id)objc_opt_class(self), "debugStringForAction:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "RemoteConnect: action=%{public}@, reason=\"%{public}@\".", buf, 0x16u);

  }
  if (a3)
  {
    v12 = (void *)objc_opt_new(CRKRemoteConnectionResultObject);
    objc_msgSend(v12, "setResponse:", objc_msgSend((id)objc_opt_class(self), "responseForAction:", a3));
    if (a3 == 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "daemon"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionIdentifier"));
      objc_msgSend(v14, "allowManagementForSessionWithIdentifier:", v16);

    }
    -[STURemoteConnectionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v12);

  }
}

- (void)activeCoursesDidChange:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STURemoteConnectionOperation.m"), 169, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (-[STURemoteConnectionOperation isExecuting](self, "isExecuting"))
  {
    if (-[STURemoteConnectionOperation isRequestingInstructorAlreadyConnected](self, "isRequestingInstructorAlreadyConnected"))
    {
      -[STURemoteConnectionOperation processAction:reason:](self, "processAction:reason:", 1, CFSTR("Instructor already connected"));
    }
  }
}

+ (id)notificationDurationTimerIdentifier
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-NotificationDurationTimer"), v3));

  return v4;
}

- (BOOL)isRequestingInstructorAlreadyConnected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "classSessionGenerationToken"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "classSessionGenerationTokens"));
    v9 = objc_msgSend(v8, "containsObject:", v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int64_t)responseForAction:(int64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

+ (id)debugStringForAction:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1000C9FC8[a3];
}

- (id)makeOperationToPostNotification
{
  void *v3;
  STUPostAggressiveUserNotificationOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  STUPostAggressiveUserNotificationOperation *v12;
  _QWORD v14[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v4 = [STUPostAggressiveUserNotificationOperation alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timerPrimitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primitives"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lockScreenPrimitives"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A720;
  v14[3] = &unk_1000C9F88;
  v15 = v3;
  v11 = v3;
  v12 = -[STUPostAggressiveUserNotificationOperation initWithTimerPrimitives:lockScreenPrimitives:userNotificationPoster:](v4, "initWithTimerPrimitives:lockScreenPrimitives:userNotificationPoster:", v7, v10, v14);

  return v12;
}

- (CRKCancelable)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (CATOperation)postNotificationOperation
{
  return self->_postNotificationOperation;
}

- (void)setPostNotificationOperation:(id)a3
{
  objc_storeStrong((id *)&self->_postNotificationOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postNotificationOperation, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
