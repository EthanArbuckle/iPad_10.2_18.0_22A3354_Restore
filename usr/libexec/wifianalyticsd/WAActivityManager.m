@implementation WAActivityManager

+ (id)sharedActivityManager
{
  if (qword_1000ED0B0 != -1)
    dispatch_once(&qword_1000ED0B0, &stru_1000CDBA0);
  return (id)qword_1000ED0B8;
}

- (WAActivityManager)init
{
  WAActivityManager *v2;
  WAActivityManager *v3;
  NSTimer *eagerExitTimeout;
  uint64_t v5;
  NSMutableArray *active_transactions;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 isEagerExitEnabled;
  id v23;
  NSObject *v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  _BOOL4 v35;

  v25.receiver = self;
  v25.super_class = (Class)WAActivityManager;
  v2 = -[WAActivityManager init](&v25, "init");
  v3 = v2;
  if (v2)
  {
    eagerExitTimeout = v2->_eagerExitTimeout;
    v2->_eagerExitTimeout = 0;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    active_transactions = v3->_active_transactions;
    v3->_active_transactions = (NSMutableArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("WAActivityManager", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v3->isEagerExitEnabled = 0;
    v11 = MGGetProductType();
    v12 = WALogActivityManagerHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11 == 3348380076)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[WAActivityManager init]";
        v28 = 1024;
        v29 = 77;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager is b520, setting isEagerExitEnabled", buf, 0x12u);
      }

      v3->isEagerExitEnabled = 1;
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[WAActivityManager init]";
        v28 = 1024;
        v29 = 80;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager is not b520, no isEagerExitEnabled", buf, 0x12u);
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd")));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("eager-exit-enable")));
    v18 = v17;
    if (v17)
    {
      v3->isEagerExitEnabled = objc_msgSend(v17, "BOOLValue");
      v19 = WALogActivityManagerHandle();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        isEagerExitEnabled = v3->isEagerExitEnabled;
        *(_DWORD *)buf = 136447234;
        v27 = "-[WAActivityManager init]";
        v28 = 1024;
        v29 = 88;
        v30 = 2112;
        v31 = CFSTR("com.apple.wifianalyticsd");
        v32 = 2112;
        v33 = CFSTR("eager-exit-enable");
        v34 = 1024;
        v35 = isEagerExitEnabled;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@ value: %d", buf, 0x2Cu);
      }

    }
    v3->waitingToInitDebugTimer = 0;
  }
  else
  {
    v23 = WALogActivityManagerHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[WAActivityManager init]";
      v28 = 1024;
      v29 = 100;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAActivityManager init error!", buf, 0x12u);
    }

  }
  return v3;
}

- (BOOL)isEagerExitEnabled
{
  return self->isEagerExitEnabled;
}

- (BOOL)debugTimerEnabled
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("eager-exit-debug")));
  if (v4)
  {
    v5 = WALogActivityManagerHandle();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136446978;
      v10 = "-[WAActivityManager debugTimerEnabled]";
      v11 = 1024;
      v12 = 121;
      v13 = 2112;
      v14 = CFSTR("com.apple.wifianalyticsd");
      v15 = 2112;
      v16 = CFSTR("eager-exit-debug");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@", (uint8_t *)&v9, 0x26u);
    }

    v7 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)debugTimer
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  WAActivityManager *obj;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  if (self->_periodicActiveListTimer)
  {
    v4 = WALogActivityManagerHandle();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v9 = "-[WAActivityManager debugTimer]";
      v10 = 1024;
      v11 = 130;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager debugTimer already setup", buf, 0x12u);
    }

  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    if (obj->waitingToInitDebugTimer)
    {
      objc_sync_exit(obj);

    }
    else
    {
      v2 = WALogActivityManagerHandle();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v9 = "-[WAActivityManager debugTimer]";
        v10 = 1024;
        v11 = 136;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:configuring _periodicActiveListTimer", buf, 0x12u);
      }

      obj->waitingToInitDebugTimer = 1;
      objc_sync_exit(obj);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007B8D0;
      block[3] = &unk_1000CCDB0;
      block[4] = obj;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  const char *v11;

  v6 = a4;
  if (self->isEagerExitEnabled)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = sub_10007BCE4;
    block[3] = &unk_1000CDBF0;
    block[4] = self;
    v8 = v6;
    block[0] = _NSConcreteStackBlock;
    v10 = v6;
    v11 = a3;
    dispatch_sync((dispatch_queue_t)queue, block);

    v6 = v8;
  }

}

- (void)osTransactionComplete:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  WAActivityManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (self->isEagerExitEnabled)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007C034;
    block[3] = &unk_1000CDC40;
    v10 = v4;
    v11 = self;
    v12 = &v13;
    dispatch_sync((dispatch_queue_t)queue, block);
    if (*((_BYTE *)v14 + 24))
    {
      v7 = WALogActivityManagerHandle();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[WAActivityManager osTransactionComplete:]";
        v19 = 1024;
        v20 = 269;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:osTransactionComplete TRANSACTION NOT FOUND ASSERT", buf, 0x12u);
      }

    }
  }
  _Block_object_dispose(&v13, 8);

}

- (void)_executeBeforePossibleEagerExit
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAActivityManager executeBeforePossibleEagerExit](self, "executeBeforePossibleEagerExit"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[WAActivityManager executeBeforePossibleEagerExit](self, "executeBeforePossibleEagerExit"));
    v4[2]();

  }
}

- (void)_executeTimerBlock
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[WAActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit"));
    v4[2]();

  }
}

- (unint64_t)osTransactionsActive
{
  OS_dispatch_queue *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007C888;
  v5[3] = &unk_1000CCF50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)alternateExecutionBlockForCleanExit
{
  return self->_alternateExecutionBlockForCleanExit;
}

- (void)setAlternateExecutionBlockForCleanExit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)executeBeforePossibleEagerExit
{
  return self->_executeBeforePossibleEagerExit;
}

- (void)setExecuteBeforePossibleEagerExit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)transactionsStarted
{
  return self->_transactionsStarted;
}

- (void)setTransactionsStarted:(unint64_t)a3
{
  self->_transactionsStarted = a3;
}

- (NSDate)dateFirstTransaction
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unint64_t)transactionsCompleted
{
  return self->_transactionsCompleted;
}

- (void)setTransactionsCompleted:(unint64_t)a3
{
  self->_transactionsCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFirstTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_executeBeforePossibleEagerExit, 0);
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);
  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end
