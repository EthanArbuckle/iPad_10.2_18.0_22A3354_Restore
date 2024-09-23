@implementation STUPostStandardUserNotificationOperation

- (STUPostStandardUserNotificationOperation)initWithUserNotificationPoster:(id)a3
{
  id v4;
  STUPostStandardUserNotificationOperation *v5;
  id v6;
  id userNotificationPoster;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUPostStandardUserNotificationOperation;
  v5 = -[STUPostStandardUserNotificationOperation init](&v9, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    userNotificationPoster = v5->_userNotificationPoster;
    v5->_userNotificationPoster = v6;

  }
  return v5;
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
  v4.super_class = (Class)STUPostStandardUserNotificationOperation;
  -[STUPostStandardUserNotificationOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062F40;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)main
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063018;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)operationWillFinish
{
  id v3;

  -[STUPostStandardUserNotificationOperation setUserNotificationPoster:](self, "setUserNotificationPoster:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[STUPostStandardUserNotificationOperation userNotification](self, "userNotification"));
  objc_msgSend(v3, "cancel");

}

- (void)postUserNotification
{
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostStandardUserNotificationOperation.m"), 71, CFSTR("%@ must be called from the main thread"), v10);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPostStandardUserNotificationOperation userNotificationPoster](self, "userNotificationPoster"));

  if (!v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostStandardUserNotificationOperation.m"), 72, CFSTR("Should be have a notification poster before posting the notification"));

  }
  if (-[STUPostStandardUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    objc_initWeak(&location, self);
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[STUPostStandardUserNotificationOperation userNotificationPoster](self, "userNotificationPoster"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100063218;
    v12[3] = &unk_1000CA0F0;
    objc_copyWeak(&v13, &location);
    v6 = ((uint64_t (**)(_QWORD, _QWORD *))v5)[2](v5, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[STUPostStandardUserNotificationOperation setUserNotification:](self, "setUserNotification:", v7);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)userNotificationDidFinishWithResult:(int64_t)a3
{
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPostStandardUserNotificationOperation.m"), 87, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (-[STUPostStandardUserNotificationOperation isExecuting](self, "isExecuting"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[STUPostStandardUserNotificationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v9);

  }
}

- (id)userNotificationPoster
{
  return self->_userNotificationPoster;
}

- (void)setUserNotificationPoster:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (STUUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(id)a3
{
  objc_storeStrong((id *)&self->_userNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong(&self->_userNotificationPoster, 0);
}

@end
