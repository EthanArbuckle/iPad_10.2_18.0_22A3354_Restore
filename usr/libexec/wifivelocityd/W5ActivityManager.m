@implementation W5ActivityManager

+ (id)sharedActivityManager
{
  if (qword_1000FB680 != -1)
    dispatch_once(&qword_1000FB680, &stru_1000D56C8);
  return (id)qword_1000FB688;
}

- (W5ActivityManager)init
{
  W5ActivityManager *v2;
  W5ActivityManager *v3;
  NSTimer *eagerExitTimeout;
  uint64_t v5;
  NSMutableArray *active_transactions;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)W5ActivityManager;
  v2 = -[W5ActivityManager init](&v13, "init");
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
    v9 = dispatch_queue_create("W5ActivityManager", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager init error!", v12, 2u);
  }
  return v3;
}

- (BOOL)debugTimerEnabled
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.wifivelocity")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("eager-exit-debug")));
  if (v4)
  {
    NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[W5ActivityManager debugTimerEnabled]", CFSTR("com.apple.wifivelocity"), CFSTR("eager-exit-debug"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)debugTimer
{
  NSTimer *periodicActiveListTimer;
  _BOOL4 v4;
  _QWORD block[5];
  uint8_t buf[16];

  periodicActiveListTimer = self->_periodicActiveListTimer;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (periodicActiveListTimer)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager debugTimer already setup", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager configuring _periodicActiveListTimer", buf, 2u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017708;
    block[3] = &unk_1000D5268;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  const char *v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017A2C;
  block[3] = &unk_1000D5718;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (void)osTransactionComplete:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  uint8_t v7[8];
  _QWORD block[4];
  id v9;
  W5ActivityManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017CC8;
  block[3] = &unk_1000D5790;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v13 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete TRANSACTION NOT FOUND ASSERT", v7, 2u);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_executeTimerBlock
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5ActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[W5ActivityManager alternateExecutionBlockForCleanExit](self, "alternateExecutionBlockForCleanExit"));
    v4[2]();

  }
}

- (unint64_t)osTransactionsActive
{
  NSObject *queue;
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
  v5[2] = sub_10001832C;
  v5[3] = &unk_1000D57B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
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
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);
  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end
