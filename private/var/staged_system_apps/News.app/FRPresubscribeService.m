@implementation FRPresubscribeService

- (FRPresubscribeService)initWithAppConfigurationManager:(id)a3 tagController:(id)a4 subscriptionController:(id)a5 purchaseController:(id)a6 notificationManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FRPresubscribeService *v17;
  FRPresubscribeService *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FRPresubscribeService;
  v17 = -[FRPresubscribeService init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v18->_tagController, a4);
    objc_storeStrong((id *)&v18->_subscriptionController, a5);
    objc_storeStrong((id *)&v18->_purchaseController, a6);
    objc_storeStrong((id *)&v18->_notificationManager, a7);
    -[FCSubscriptionController addObserver:](v18->_subscriptionController, "addObserver:", v18);
  }

  return v18;
}

- (FRPresubscribeService)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRPresubscribeService init]";
    v7 = 2080;
    v8 = "FRPresubscribeService.m";
    v9 = 1024;
    v10 = 31;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRPresubscribeService init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)presubscribeToChannelsIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, _QWORD);
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = FRPresubscribeServiceLog;
  if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presubscribing to channels, if needed", buf, 2u);
  }
  if (-[FRPresubscribeService _hasUserBeenPresubscribed](self, "_hasUserBeenPresubscribed"))
  {
    v6 = FRPresubscribeServiceLog;
    if (os_log_type_enabled((os_log_t)FRPresubscribeServiceLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not presubscribing because the user's already been presubscribed", buf, 2u);
    }
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPresubscribeService appConfigurationManager](self, "appConfigurationManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100059E34;
    v8[3] = &unk_1000DA500;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", &_dispatch_main_q, v8);

  }
}

- (void)subscriptionControllerDidResetToEmpty:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("has_user_been_presubscribed"));

  -[FRPresubscribeService presubscribeToChannelsIfNeededWithCompletion:](self, "presubscribeToChannelsIfNeededWithCompletion:", 0);
}

- (void)_subscribeToFeedIDs:(id)a3 preSubscribedNotificationsChannelIDs:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  FRPresubscribeService *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPresubscribeService tagController](self, "tagController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005A2A4;
  v15[3] = &unk_1000DD360;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v14, 25, &_dispatch_main_q, v15);

}

- (BOOL)_hasUserBeenPresubscribed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("has_user_been_presubscribed"));

  return v3;
}

- (void)_setHasUserBeenPresubscribed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("has_user_been_presubscribed"));

}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (FRNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end
