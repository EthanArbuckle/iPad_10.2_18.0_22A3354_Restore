@implementation KTSystemStateProvider

- (KTSystemStateProvider)initWithDataStore:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  KTSystemStateProvider *v8;
  KTSystemStateProvider *v9;
  id v10;
  KTCondition *v11;
  KTSystemStateProvider *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTSystemStateProvider;
  v8 = -[KTSystemStateProvider init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[KTSystemStateProvider setDataStore:](v8, "setDataStore:", v6);
    v10 = objc_alloc_init((Class)KTSelfStatusResult);
    -[KTSystemStateProvider setKtStatus:](v9, "setKtStatus:", v10);

    -[KTSystemStateProvider setDnc:](v9, "setDnc:", v7);
    v11 = objc_alloc_init(KTCondition);
    -[KTSystemStateProvider setStatusFilled:](v9, "setStatusFilled:", v11);

    v12 = v9;
  }

  return v9;
}

- (BOOL)treeStateUnstable:(id)a3 logBeginTime:(unint64_t)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dataStore](self, "dataStore"));
  v12 = 0;
  v8 = objc_msgSend(v7, "isMapStillPopulating:logBeginMs:error:", v6, a4, &v12);

  v9 = v12;
  if (v9)
  {
    if (qword_1002A7808 != -1)
      dispatch_once(&qword_1002A7808, &stru_100248310);
    v10 = qword_1002A7810;
    if (os_log_type_enabled((os_log_t)qword_1002A7810, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "KTSystemStateProvider could not fetch tree state: %@", buf, 0xCu);
    }
  }

  return v8;
}

- (void)setPendingChanges:(BOOL)a3
{
  int v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  KTCondition *v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = objc_msgSend(v5, "pendingStatusChanges");

  if (v6 != v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    v8 = v7;
    if (v3)
    {
      objc_msgSend(v7, "setPendingStatusChanges:", 1);

      v9 = objc_alloc_init(KTCondition);
      -[KTSystemStateProvider setStatusFilled:](self, "setStatusFilled:");
    }
    else
    {
      objc_msgSend(v7, "setPendingStatusChanges:", 0);

      v9 = (KTCondition *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider statusFilled](self, "statusFilled"));
      -[KTCondition fulfill](v9, "fulfill");
    }

  }
}

- (BOOL)pendingChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v3 = objc_msgSend(v2, "pendingStatusChanges");

  return v3;
}

- (void)reset
{
  id v3;

  v3 = objc_alloc_init((Class)KTSelfStatusResult);
  -[KTSystemStateProvider setKtStatus:](self, "setKtStatus:", v3);

}

- (void)setOptInState:(unint64_t)a3 everOptIn:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  objc_msgSend(v7, "setEverOptIn:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v9 = objc_msgSend(v8, "optIn");

  if (v9 != (id)a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v10, "setOptIn:", a3);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v12 = kTransparencyNotificationStatusChanged;
    v15 = kKTStatusOptInState;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", v12, 0, v14, 1);

  }
}

- (void)setServerOptInState:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = objc_msgSend(v5, "serverOptIn");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v7, "setServerOptIn:", a3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v9 = kTransparencyNotificationStatusChanged;
    v12 = kKTStatusServerOptInState;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v9, 0, v11, 1);

  }
}

- (void)setAccountStatus:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = objc_msgSend(v5, "accountStatus");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v7, "setAccountStatus:", a3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v9 = kTransparencyNotificationAccountStatusChanged;
    v10 = kKTStatusAccountStatus;
    v19 = kKTStatusAccountStatus;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v9, 0, v12, 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v14 = kTransparencyNotificationStatusChanged;
    v17 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v18 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    objc_msgSend(v13, "postNotificationName:object:userInfo:deliverImmediately:", v14, 0, v16, 1);

  }
}

- (void)setSelfStatus:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = objc_msgSend(v5, "selfStatus");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v7, "setSelfStatus:", a3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v9 = kTransparencyNotificationStatusChanged;
    v12 = kKTStatusSelfStatus;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v9, 0, v11, 1);

  }
}

- (void)setSelfDevices:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  objc_msgSend(v5, "setSelfDevices:", v4);

}

- (void)setSystemStatus:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = objc_msgSend(v5, "systemStatus");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v7, "setSystemStatus:", a3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v9 = kTransparencyNotificationStatusChanged;
    v12 = kKTStatusSystemStatus;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v9, 0, v11, 1);

  }
}

- (void)setKTAccountKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKey"));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v8, "setAccountKey:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v10 = kTransparencyNotificationStatusChanged;
    v12 = kKTStatusAccountKey;
    v13 = &__kCFBooleanTrue;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", v10, 0, v11, 1);

  }
}

- (void)setIDSAccountStatus:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
  v6 = objc_msgSend(v5, "idsAccountStatus");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider ktStatus](self, "ktStatus"));
    objc_msgSend(v7, "setIdsAccountStatus:", a3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSystemStateProvider dnc](self, "dnc"));
    v9 = kTransparencyNotificationStatusChanged;
    v12 = kKTStatusIDSAccount;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v9, 0, v11, 1);

  }
}

- (KTCondition)statusFilled
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStatusFilled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)newServerOptInRequests
{
  return self->newServerOptInRequests;
}

- (void)setNewServerOptInRequests:(BOOL)a3
{
  self->newServerOptInRequests = a3;
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTSelfStatusResult)ktStatus
{
  return (KTSelfStatusResult *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKtStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTNSDistributedNotificationCenter)dnc
{
  return (KTNSDistributedNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDnc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnc, 0);
  objc_storeStrong((id *)&self->_ktStatus, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->statusFilled, 0);
}

@end
