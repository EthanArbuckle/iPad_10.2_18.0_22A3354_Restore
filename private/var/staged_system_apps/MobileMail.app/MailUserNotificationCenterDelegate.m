@implementation MailUserNotificationCenterDelegate

- (MailUserNotificationCenterDelegate)initWithAlertSuppressionContextProvider:(id)a3
{
  id v4;
  MailUserNotificationCenterDelegate *v5;
  MailUserNotificationCenterDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailUserNotificationCenterDelegate;
  v5 = -[MailUserNotificationCenterDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_alertSuppressionContextProvider, v4);

  return v6;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;

  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));

  v26 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MSUserNotificationContentKeySuppressionContext));
  if (objc_msgSend(v13, "length"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(",")));
    v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    v12 = (void *)v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailUserNotificationCenterDelegate alertSuppressionContextProvider](self, "alertSuppressionContextProvider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentAlertSuppressionContexts"));
  v18 = objc_msgSend(v12, "intersectsSet:", v17);

  if (v18)
    v20 = 9;
  else
    v20 = 27;
  v21 = MSUserNotificationsLog(v19);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v20));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
    *(_DWORD *)buf = 138543874;
    v28 = v23;
    v29 = 2114;
    v30 = v25;
    v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will present notification with options = %{public}@, notification identifier = %{public}@, notification = %@", buf, 0x20u);

  }
  v8[2](v8, v20);

}

- (MailAlertSuppressionContextProvider)alertSuppressionContextProvider
{
  return (MailAlertSuppressionContextProvider *)objc_loadWeakRetained((id *)&self->_alertSuppressionContextProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertSuppressionContextProvider);
}

@end
