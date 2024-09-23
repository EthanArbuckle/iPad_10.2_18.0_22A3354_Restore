@implementation ServiceProvider

- (void)start
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider fm_logID](self, "fm_logID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueId"));
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Starting service provider for account %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000085D0;
    v17[3] = &unk_100055208;
    v17[4] = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("AccountDidDeactivateNotificationKey"), 0, v10, v17));
    -[ServiceProvider setDidDeactivateToken:](self, "setDidDeactivateToken:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000864C;
    v16[3] = &unk_100055208;
    v16[4] = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("AccountDidUpdateNotification"), 0, v12, v16));
    -[ServiceProvider setDidUpdateToken:](self, "setDidUpdateToken:", v13);

  }
  else
  {
    v14 = sub_10001C4E8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100033784(self, v15);

  }
}

- (void)stop
{
  -[ServiceProvider _teardown](self, "_teardown");
}

- (NSString)serviceName
{
  return (NSString *)CFSTR("generic");
}

- (void)accountDeactivated
{
  -[ServiceProvider _teardown](self, "_teardown");
}

- (void)_teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider didDeactivateToken](self, "didDeactivateToken"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider didDeactivateToken](self, "didDeactivateToken"));
    objc_msgSend(v7, "removeObserver:", v4);

    -[ServiceProvider setDidDeactivateToken:](self, "setDidDeactivateToken:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider didUpdateToken](self, "didUpdateToken"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider didUpdateToken](self, "didUpdateToken"));
    objc_msgSend(v7, "removeObserver:", v6);

    -[ServiceProvider setDidUpdateToken:](self, "setDidUpdateToken:", 0);
  }
  -[ServiceProvider deinitializeProvider](self, "deinitializeProvider");

}

- (Account)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (id)didDeactivateToken
{
  return self->_didDeactivateToken;
}

- (void)setDidDeactivateToken:(id)a3
{
  objc_storeStrong(&self->_didDeactivateToken, a3);
}

- (id)didUpdateToken
{
  return self->_didUpdateToken;
}

- (void)setDidUpdateToken:(id)a3
{
  objc_storeStrong(&self->_didUpdateToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateToken, 0);
  objc_storeStrong(&self->_didDeactivateToken, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
