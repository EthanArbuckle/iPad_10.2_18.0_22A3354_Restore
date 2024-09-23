@implementation STUConcreteLSApplicationRecord

- (STUConcreteLSApplicationRecord)initWithLSApplicationRecord:(id)a3
{
  id v5;
  STUConcreteLSApplicationRecord *v6;
  STUConcreteLSApplicationRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUConcreteLSApplicationRecord;
  v6 = -[STUConcreteLSApplicationRecord init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingRecord, a3);

  return v7;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteLSApplicationRecord underlyingRecord](self, "underlyingRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  return (NSString *)v3;
}

- (STULSApplicationState)applicationState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteLSApplicationRecord underlyingRecord](self, "underlyingRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationState"));

  return (STULSApplicationState *)v3;
}

- (id)addApplicationStateObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteLSApplicationRecord bundleIdentifier](self, "bundleIdentifier"));
  v6 = (void *)objc_opt_new(CRKConcreteDistributedNotificationPublisher);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005A990;
  v11[3] = &unk_1000CB6D8;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscribeToNotificationWithName:handler:", CFSTR("com.apple.LaunchServices.applicationStateChanged"), v11));

  return v9;
}

- (LSApplicationRecord)underlyingRecord
{
  return self->_underlyingRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRecord, 0);
}

@end
