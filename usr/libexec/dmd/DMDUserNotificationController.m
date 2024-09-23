@implementation DMDUserNotificationController

+ (DMDUserNotificationController)sharedController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006BB0C;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EBAD0 != -1)
    dispatch_once(&qword_1000EBAD0, block);
  return (DMDUserNotificationController *)(id)qword_1000EBAC8;
}

- (id)initPrivate
{
  DMDUserNotificationController *v2;
  CATOperationQueue *v3;
  CATOperationQueue *queue;
  NSMutableArray *v5;
  NSMutableArray *notifications;
  NSMutableDictionary *v7;
  NSMutableDictionary *completionsByIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMDUserNotificationController;
  v2 = -[DMDUserNotificationController init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(CATOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    -[CATOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    -[CATOperationQueue setSuspended:](v2->_queue, "setSuspended:", 0);
    v5 = objc_opt_new(NSMutableArray);
    notifications = v2->_notifications;
    v2->_notifications = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    completionsByIdentifier = v2->_completionsByIdentifier;
    v2->_completionsByIdentifier = v7;

  }
  return v2;
}

- (void)showNotification:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  unsigned int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  DMDUserNotificationController *v19;
  void (**v20)(id, uint64_t);
  uint8_t buf[4];
  void *v22;

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDUserNotificationController.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "isInSingleAppMode"));
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not displaying notification in limited app mode", buf, 2u);
    }
    if (v8)
      v8[2](v8, 4);
  }
  else
  {
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Start user notification: %{public}@", buf, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController queue](self, "queue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006BE10;
    v17[3] = &unk_1000BA840;
    v18 = v7;
    v19 = self;
    v20 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v17));
    objc_msgSend(v14, "addOperation:", v15);

  }
}

- (id)_dictFromNotification:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "header"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, kCFUserNotificationAlertHeaderKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "message"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, kCFUserNotificationAlertMessageKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultButtonTitle"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, kCFUserNotificationDefaultButtonTitleKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alternateButtonTitle"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, kCFUserNotificationAlternateButtonTitleKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "otherButtonTitle"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, kCFUserNotificationOtherButtonTitleKey);

  v10 = objc_msgSend(v3, "displayWhenLocked");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, kCFUserNotificationAlertTopMostKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDontDismissOnUnlock);
  v12 = -[NSMutableDictionary copy](v4, "copy");

  return v12;
}

- (void)_showNextNotification
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006C174;
  v5[3] = &unk_1000BA4B0;
  v5[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v5));
  objc_msgSend(v3, "addOperation:", v4);

}

- (void)_completeNotification:(id)a3 response:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing user notification: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController completionsByIdentifier](self, "completionsByIdentifier"));
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v9)
    v9[2](v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController notifications](self, "notifications"));
  objc_msgSend(v10, "removeObject:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController completionsByIdentifier](self, "completionsByIdentifier"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v7);

  -[DMDUserNotificationController _showNextNotification](self, "_showNextNotification");
}

- (void)_notificationRef:(__CFUserNotification *)a3 wasDismissedWithFlags:(unint64_t)a4
{
  void *v7;
  void *v8;
  _QWORD v9[7];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006C5F4;
  v9[3] = &unk_1000BBE78;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v9));
  objc_msgSend(v7, "addOperation:", v8);

}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (NSMutableArray)notifications
{
  return self->_notifications;
}

- (NSMutableDictionary)completionsByIdentifier
{
  return self->_completionsByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
