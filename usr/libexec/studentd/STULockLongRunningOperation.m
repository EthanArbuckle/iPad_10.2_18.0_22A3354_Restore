@implementation STULockLongRunningOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STULockLongRunningOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_9;
  v7 = objc_opt_class(DMFManagementLockRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKLockRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v11 = CATErrorWithCodeAndUserInfo(2, &off_1000D2F98);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
        goto LABEL_14;
      }
LABEL_9:
      v10 = 0;
      goto LABEL_14;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "passcodeForRequest:", v6));
  if (objc_msgSend(v9, "length") && (objc_msgSend(v9, "crk_isFourDigitPasscode") & 1) == 0)
  {
    if (a4)
    {
      v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D2FC0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

LABEL_14:
  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STULockLongRunningOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STULockLongRunningOperation dismissLockScreenAndFinishIfNeeded](self, "dismissLockScreenAndFinishIfNeeded");
}

- (void)exclusivityRequestDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  STULockLongRunningOperation *v13;

  v4 = a3;
  if (-[STULockLongRunningOperation isExecuting](self, "isExecuting"))
  {
    if (-[STULockLongRunningOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STULockLongRunningOperation endOperationWithError:](self, "endOperationWithError:", v6);
LABEL_9:

      goto LABEL_10;
    }
    if (!v4)
    {
      -[STULockLongRunningOperation startObserving](self, "startObserving");
      v7 = sub_10001C10C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v12 = 138543362;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Enabling classroom lock screen", (uint8_t *)&v12, 0xCu);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[STULockLongRunningOperation lockedByLabel](self, "lockedByLabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STULockLongRunningOperation passcode](self, "passcode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lockScreenMonitor"));
      objc_msgSend(v11, "displayClassroomLockScreenWithLabel:passcode:", v6, v9);

      MRMediaRemoteSendCommand(1, 0);
      goto LABEL_9;
    }
    -[STULockLongRunningOperation endOperationWithError:](self, "endOperationWithError:", v4);
  }
LABEL_10:

}

- (void)dismissLockScreenAndFinishIfNeeded
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001C1A8;
  v2[3] = &unk_1000C97E8;
  v2[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v2);
}

- (void)startObserving
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lockScreenMonitor"));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("classroomLockScreenVisible"), 0, CFSTR("STULockLongRunningOperationObservationContext"));

}

- (void)endObserving
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lockScreenMonitor"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("classroomLockScreenVisible"), CFSTR("STULockLongRunningOperationObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  objc_super v17;

  v11 = a3;
  v12 = v11;
  if (a6 == CFSTR("STULockLongRunningOperationObservationContext"))
  {
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("classroomLockScreenVisible")) & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STULockLongRunningOperation.m"), 139, CFSTR("Received an unexpected key path: %@"), v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lockScreenMonitor"));
    v15 = objc_msgSend(v14, "isClassroomLockScreenVisible");

    if (v15)
      -[STULockLongRunningOperation lockScreenDidAppear](self, "lockScreenDidAppear");
    else
      -[STULockLongRunningOperation lockScreenDidDisappear](self, "lockScreenDidDisappear");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)STULockLongRunningOperation;
    -[STULockLongRunningOperation observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v11, a4, a5, a6);
  }

}

- (void)lockScreenDidAppear
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  STULockLongRunningOperation *v12;

  v3 = sub_10001C10C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Classroom lock screen did appear", buf, 0xCu);
  }

  -[STULockLongRunningOperation setDidClassroomLockScreenDisplay:](self, "setDidClassroomLockScreenDisplay:", 1);
  v5 = objc_claimAutoreleasedReturnValue(-[STULockLongRunningOperation passcode](self, "passcode"));
  v6 = (void *)v5;
  if (v5)
  {
    v9 = CFSTR("STULockLongRunningOperationPasscodeKey");
    v10 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("STULockLongRunningOperationDidLockNotification"), self, v7);

}

- (void)lockScreenDidDisappear
{
  id v3;
  NSObject *v4;
  int v5;
  STULockLongRunningOperation *v6;

  v3 = sub_10001C10C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Classroom lock screen did disappear", (uint8_t *)&v5, 0xCu);
  }

  -[STULockLongRunningOperation dismissLockScreenAndFinishIfNeeded](self, "dismissLockScreenAndFinishIfNeeded");
}

+ (id)passcodeForRequest:(id)a3
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
  v4 = objc_opt_class(DMFManagementLockRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKLockRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passcode"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "passcode"));
  v14 = v13;

  return v14;
}

+ (id)lockedByLabelForRequest:(id)a3
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
  v4 = objc_opt_class(DMFManagementLockRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKLockRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lockedByLabel"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lockedByLabel"));
  v14 = v13;

  return v14;
}

- (id)passcode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STULockLongRunningOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passcodeForRequest:", v4));

  return v5;
}

- (id)lockedByLabel
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STULockLongRunningOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lockedByLabelForRequest:", v4));

  return v5;
}

- (BOOL)didClassroomLockScreenDisplay
{
  return self->_didClassroomLockScreenDisplay;
}

- (void)setDidClassroomLockScreenDisplay:(BOOL)a3
{
  self->_didClassroomLockScreenDisplay = a3;
}

@end
