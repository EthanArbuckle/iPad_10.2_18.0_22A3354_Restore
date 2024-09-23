@implementation BKAlternateSystemAppManager

- (BKAlternateSystemAppManager)init
{
  BKAlternateSystemAppManager *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAlternateSystemAppManager;
  v2 = -[BKAlternateSystemAppManager init](&v6, "init");
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboardd.altsysapp"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

  }
  return v2;
}

- (BOOL)isBlockingSystemApp
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C84C;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)alternateSystemAppBundleIdentifier
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10005C7F8;
  v10 = sub_10005C808;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C810;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)blockSystemAppForAlternateSystemAppWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = BKLogAlternateSystemApp();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Manager] Blocking the system app", v8, 2u);
  }

  -[BKAlternateSystemAppManager _setBlockingSystemApp:](self, "_setBlockingSystemApp:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
  objc_msgSend(v7, "blockSystemApp");

  if (v4)
    dispatch_async((dispatch_queue_t)self->_queue, v4);

}

- (void)openAlternateSystemApp:(id)a3 options:(id)a4 withResult:(id)a5 andExitBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  BKAlternateSystemAppManager *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C4F4;
  block[3] = &unk_1000EB688;
  v20 = v10;
  v21 = v11;
  v22 = self;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

- (void)terminateAlternateSystemApp:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  id v9;
  id v10;
  NSObject *queue;
  void *v12;
  _QWORD block[4];
  id v14;
  BKAlternateSystemAppManager *v15;
  id v16;

  v9 = a3;
  v10 = a7;
  if (-[NSString isEqualToString:](self->_openBundleId, "isEqualToString:", v9))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005C428;
    block[3] = &unk_1000EC060;
    v14 = v9;
    v15 = self;
    v16 = v10;
    dispatch_async(queue, block);
    -[BKAlternateSystemAppManager setOpenBundleId:](self, "setOpenBundleId:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
    objc_msgSend(v12, "setActiveAlternateSystemAppBundleIdentifier:", 0);

  }
}

- (void)terminateAnyAlternateSystemApp
{
  uint64_t v3;
  NSObject *v4;
  NSString *openBundleId;
  int v6;
  NSString *v7;

  if (self->_openBundleId)
  {
    v3 = BKLogAlternateSystemApp();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      openBundleId = self->_openBundleId;
      v6 = 138543362;
      v7 = openBundleId;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Manager] Terminating alternate system app with bundleID: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    -[BKAlternateSystemAppManager terminateAlternateSystemApp:forReason:andReport:withDescription:completion:](self, "terminateAlternateSystemApp:forReason:andReport:withDescription:completion:", self->_openBundleId, 0, 0, 0, 0);
  }
}

- (void)unblockSystemAppForAlternateSystemAppWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = BKLogAlternateSystemApp();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Manager] Unblocking the system app", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
  objc_msgSend(v7, "unblockSystemApp");

  -[BKAlternateSystemAppManager _setBlockingSystemApp:](self, "_setBlockingSystemApp:", 0);
  if (v4)
    dispatch_async((dispatch_queue_t)self->_queue, v4);

}

- (void)_queue_cleanUpAfterAlternativeSystemApp:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  BKAlternateSystemApp *alternateSystemApp;
  int v10;
  id v11;
  __int16 v12;
  BKAlternateSystemApp *v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAlternateSystemAppManager alternateSystemApp](self, "alternateSystemApp"));

  v6 = BKLogAlternateSystemApp();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v5 == v4)
  {
    if (v8)
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[Manager] clean up: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    -[BKAlternateSystemAppManager setAlternateSystemApp:](self, "setAlternateSystemApp:", 0);
  }
  else
  {
    if (v8)
    {
      alternateSystemApp = self->_alternateSystemApp;
      v10 = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = alternateSystemApp;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[Manager] clean up: %{public}@, but expected %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_setBlockingSystemApp:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005C418;
  v4[3] = &unk_1000EC978;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (NSString)openBundleId
{
  return self->_openBundleId;
}

- (void)setOpenBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BKAlternateSystemApp)alternateSystemApp
{
  return self->_alternateSystemApp;
}

- (void)setAlternateSystemApp:(id)a3
{
  objc_storeStrong((id *)&self->_alternateSystemApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateSystemApp, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_openBundleId, 0);
}

+ (BKAlternateSystemAppManager)sharedInstance
{
  if (qword_100117468 != -1)
    dispatch_once(&qword_100117468, &stru_1000EB610);
  return (BKAlternateSystemAppManager *)(id)qword_100117460;
}

@end
