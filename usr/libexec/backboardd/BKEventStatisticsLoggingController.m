@implementation BKEventStatisticsLoggingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transactionAssertion, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_logCategory, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (BKEventStatisticsLoggingController)initWithLabel:(id)a3 logCategory:(id)a4
{
  id v6;
  id v7;
  BKEventStatisticsLoggingController *v8;
  BKEventStatisticsLoggingController *v9;
  NSString *v10;
  NSString *label;
  void *v12;
  uint64_t v13;
  BSCompoundAssertion *transactionAssertion;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  OS_dispatch_queue *workQueue;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BKEventStatisticsLoggingController;
  v8 = -[BKEventStatisticsLoggingController init](&v26, "init");
  v9 = v8;
  if (v8)
  {
    v8->_resetStartTime = 1;
    v10 = (NSString *)objc_msgSend(v6, "copy");
    label = v9->_label;
    v9->_label = v10;

    objc_storeStrong((id *)&v9->_logCategory, a4);
    objc_initWeak(&location, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("BKEventStatistics-"), "stringByAppendingString:", v6));
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_1000088FC;
    v23 = &unk_1000EBE88;
    objc_copyWeak(&v24, &location);
    v13 = objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:](BSCompoundAssertion, "assertionWithIdentifier:stateDidChangeHandler:", v12, &v20));
    transactionAssertion = v9->_transactionAssertion;
    v9->_transactionAssertion = (BSCompoundAssertion *)v13;

    v16 = (void *)objc_opt_class(v9, v15);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "workQueue", v20, v21, v22, v23));
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)beginTransactionForReason:(id)a3
{
  return -[BSCompoundAssertion acquireForReason:](self->_transactionAssertion, "acquireForReason:", a3);
}

- (void)updateStatistics:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B64C;
  v7[3] = &unk_1000EBEF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)setStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)invalidate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019024;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKEventStatisticsLoggingController *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (!self->_invalid)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("someone forgot to invoke -invalidate on %@"), self));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKEventStatisticsLoggingController.m");
      v20 = 1024;
      v21 = 439;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10001A394);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKEventStatisticsLoggingController;
  -[BKEventStatisticsLoggingController dealloc](&v11, "dealloc");
}

+ (OS_dispatch_queue)workQueue
{
  if (qword_1001174F8 != -1)
    dispatch_once(&qword_1001174F8, &stru_1000EBE60);
  return (OS_dispatch_queue *)(id)qword_100117500;
}

- (NSArray)statistics
{
  return self->_statistics;
}

@end
