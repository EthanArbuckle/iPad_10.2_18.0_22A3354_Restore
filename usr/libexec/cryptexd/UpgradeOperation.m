@implementation UpgradeOperation

- (UpgradeOperation)initWithCryptexName:(id)a3 graftPath:(id)a4
{
  id v7;
  id v8;
  UpgradeOperation *v9;
  os_log_t v10;
  OS_os_log *logHandle;
  dispatch_group_t v12;
  OS_dispatch_group *group;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  NSError *error;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UpgradeOperation;
  v9 = -[UpgradeOperation init](&v18, "init");
  if (v9)
  {
    v10 = os_log_create("com.apple.libcryptex", "upgrade");
    logHandle = v9->_logHandle;
    v9->_logHandle = (OS_os_log *)v10;

    v12 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v12;

    objc_storeStrong((id *)&v9->_cryptexName, a3);
    v14 = dispatch_queue_create("com.apple.security.cryptexd.upgrade", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_graftPath, a4);
    error = v9->_error;
    v9->_error = 0;

  }
  return v9;
}

- (void)terminateJobsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[UpgradeOperation cryptexName](self, "cryptexName")));
  v6 = objc_msgSend(v5, "UTF8String");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeOperation workQueue](self, "workQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002298;
  v9[3] = &unk_1000550B8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  sub_10000DFF4((uint64_t)v6, 0x3Cu, v7, v9);

}

- (void)startUpgrade
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = *__error();
  v4 = objc_claimAutoreleasedReturnValue(-[UpgradeOperation logHandle](self, "logHandle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Upgrade started.", v6, 2u);
  }

  *__error() = v3;
  v5 = objc_claimAutoreleasedReturnValue(-[UpgradeOperation group](self, "group"));
  dispatch_group_enter(v5);

}

- (void)completeUpgrade
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[UpgradeOperation workQueue](self, "workQueue"));
  dispatch_assert_queue_not_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[UpgradeOperation workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000027EC;
  block[3] = &unk_1000550E0;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)onComplete:(id)a3 withQueue:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[UpgradeOperation group](self, "group"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002934;
  v10[3] = &unk_100055108;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_group_notify(v8, v7, v10);

}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)cryptexName
{
  return self->_cryptexName;
}

- (NSString)graftPath
{
  return self->_graftPath;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_graftPath, 0);
  objc_storeStrong((id *)&self->_cryptexName, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
