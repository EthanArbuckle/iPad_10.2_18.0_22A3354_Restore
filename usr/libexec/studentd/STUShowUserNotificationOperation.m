@implementation STUShowUserNotificationOperation

- (STUShowUserNotificationOperation)initWithLockScreenPrimitives:(id)a3 userNotificationPrimitives:(id)a4 globalNotificationPrimitives:(id)a5 options:(id)a6 timeout:(double)a7 flags:(unint64_t)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  STUShowUserNotificationOperation *v20;
  STUShowUserNotificationOperation *v21;
  NSDictionary *v22;
  NSDictionary *options;
  void *v25;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (!v19)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUShowUserNotificationOperation.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v26.receiver = self;
  v26.super_class = (Class)STUShowUserNotificationOperation;
  v20 = -[STUShowUserNotificationOperation init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_lockScreenPrimitives, a3);
    objc_storeStrong((id *)&v21->_userNotificationPrimitives, a4);
    objc_storeStrong((id *)&v21->_globalNotificationPrimitives, a5);
    v22 = (NSDictionary *)objc_msgSend(v19, "copy");
    options = v21->_options;
    v21->_options = v22;

    v21->_timeout = a7;
    v21->_flags = a8;
  }

  return v21;
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
  v4.super_class = (Class)STUShowUserNotificationOperation;
  -[STUShowUserNotificationOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008614;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)operationWillFinish
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation userNotification](self, "userNotification"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation globalNotification](self, "globalNotification"));
  objc_msgSend(v4, "cancel");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation lockStateStatusSubscription](self, "lockStateStatusSubscription"));
  objc_msgSend(v5, "cancel");

}

- (void)main
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (-[STUShowUserNotificationOperation isCanceled](self, "isCanceled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUShowUserNotificationOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
    else if (CRKIsiOS())
    {
      -[STUShowUserNotificationOperation postMainNotification](self, "postMainNotification");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation lockScreenPrimitives](self, "lockScreenPrimitives"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100008814;
      v7[3] = &unk_1000C9990;
      v7[4] = self;
      objc_msgSend(v5, "lockStateStatusProviderWithCompletion:", v7);

    }
  }
  else
  {
    -[STUShowUserNotificationOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)postMainNotification
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  id v19;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUShowUserNotificationOperation.m"), 122, CFSTR("%@ must be called from the main thread"), v15);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = objc_msgSend((id)objc_opt_class(self), "requiredNotificationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation globalNotificationPrimitives](self, "globalNotificationPrimitives"));
  v19 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeNotificationWithOptions:flags:error:", v5, -[STUShowUserNotificationOperation flags](self, "flags"), &v19));
  v10 = v19;
  -[STUShowUserNotificationOperation setGlobalNotification:](self, "setGlobalNotification:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation globalNotification](self, "globalNotification"));
  if (v11)
  {
    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation globalNotification](self, "globalNotification"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008B24;
    v16[3] = &unk_1000C99B8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "scheduleWithCompletion:", v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[STUShowUserNotificationOperation endOperationWithError:](self, "endOperationWithError:", v10);
  }

}

- (void)handleGlobalNotificationWith:(unint64_t)a3 responseDictionary:(id)a4 error:(id)a5
{
  id v9;
  STUUserNotificationResultObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUShowUserNotificationOperation.m"), 141, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (-[STUShowUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    if (v9)
    {
      -[STUShowUserNotificationOperation endOperationWithError:](self, "endOperationWithError:", v9);
    }
    else
    {
      v10 = -[STUUserNotificationResultObject initWithResponseFlags:responseDictionary:]([STUUserNotificationResultObject alloc], "initWithResponseFlags:responseDictionary:", a3, v14);
      -[STUShowUserNotificationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);

    }
  }

}

- (void)updateLockScreenNotificationWithInitialUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUShowUserNotificationOperation.m"), 156, CFSTR("%@ must be called from the main thread"), v17);

  }
  if ((-[STUShowUserNotificationOperation isCanceled](self, "isCanceled") & 1) == 0
    && -[STUShowUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation lockStateStatusProvider](self, "lockStateStatusProvider"));
    v7 = objc_msgSend(v6, "isLocked");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation userNotification](self, "userNotification"));
    v9 = v8;
    if ((v7 & 1) != 0)
    {

      if (!v9 && v3)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation options](self, "options"));
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kCFUserNotificationAlertHeaderKey));

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation options](self, "options"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kCFUserNotificationAlertMessageKey));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUShowUserNotificationOperation userNotificationPrimitives](self, "userNotificationPrimitives"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "postInformativeNotificationWithTitle:subtitle:", v18, v12));
        -[STUShowUserNotificationOperation setUserNotification:](self, "setUserNotification:", v14);

      }
    }
    else
    {
      objc_msgSend(v8, "cancel");

      -[STUShowUserNotificationOperation setUserNotification:](self, "setUserNotification:", 0);
    }
  }
}

+ (id)requiredNotificationOptions
{
  void *v2;
  void *v3;
  void *v4;
  CFStringRef v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CRKClassroomKitBundleIdentifier));
  v6 = kCFUserNotificationLocalizationURLKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resourceURL"));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  return v4;
}

- (NSDictionary)options
{
  return self->_options;
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (STULockScreenPrimitives)lockScreenPrimitives
{
  return self->_lockScreenPrimitives;
}

- (STUUserNotificationPrimitives)userNotificationPrimitives
{
  return self->_userNotificationPrimitives;
}

- (STUGlobalNotificationPrimitives)globalNotificationPrimitives
{
  return self->_globalNotificationPrimitives;
}

- (STULockStateStatusProviding)lockStateStatusProvider
{
  return self->_lockStateStatusProvider;
}

- (void)setLockStateStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateStatusProvider, a3);
}

- (CRKCancelable)lockStateStatusSubscription
{
  return self->_lockStateStatusSubscription;
}

- (void)setLockStateStatusSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateStatusSubscription, a3);
}

- (STUUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(id)a3
{
  objc_storeStrong((id *)&self->_userNotification, a3);
}

- (STUGlobalNotification)globalNotification
{
  return self->_globalNotification;
}

- (void)setGlobalNotification:(id)a3
{
  objc_storeStrong((id *)&self->_globalNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalNotification, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_lockStateStatusSubscription, 0);
  objc_storeStrong((id *)&self->_lockStateStatusProvider, 0);
  objc_storeStrong((id *)&self->_globalNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_userNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_lockScreenPrimitives, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
