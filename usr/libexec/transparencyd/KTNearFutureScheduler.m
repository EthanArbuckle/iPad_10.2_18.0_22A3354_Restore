@implementation KTNearFutureScheduler

- (KTNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7
{
  return -[KTNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](self, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", a3, a4, a4, a5, a6, a7);
}

- (KTNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8
{
  unint64_t v8;

  if (a4)
    v8 = a5 / a4;
  else
    v8 = 1;
  if (v8 <= 1)
    v8 = 1;
  return -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](self, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", a3, (double)v8);
}

- (KTNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9
{
  id v17;
  id v18;
  KTNearFutureScheduler *v19;
  KTNearFutureScheduler *v20;
  id v21;
  const char *v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  id v27;
  id futureBlock;
  KTCondition *v29;
  KTCondition *liveRequestReceived;
  NSDate *predictedNextFireTime;
  NSOperationQueue *v32;
  NSOperationQueue *operationQueue;
  uint64_t v34;
  KTResultOperation *operationDependency;
  objc_super v37;

  v17 = a3;
  v18 = a9;
  v37.receiver = self;
  v37.super_class = (Class)KTNearFutureScheduler;
  v19 = -[KTNearFutureScheduler init](&v37, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("near-future-scheduler-%@"), v17)));
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_create(v22, v24);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v25;

    v20->_initialDelay = a4;
    v20->_currentDelay = a4;
    v20->_maximumDelay = a6;
    v20->_backoff = a5;
    v27 = objc_retainBlock(v18);
    futureBlock = v20->_futureBlock;
    v20->_futureBlock = v27;

    v20->_liveRequest = 0;
    v29 = objc_alloc_init(KTCondition);
    liveRequestReceived = v20->_liveRequestReceived;
    v20->_liveRequestReceived = v29;

    predictedNextFireTime = v20->_predictedNextFireTime;
    v20->_predictedNextFireTime = 0;

    v20->_keepProcessAlive = a7;
    v32 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v20->_operationQueue;
    v20->_operationQueue = v32;

    v20->_operationDependencyDescriptionCode = a8;
    v34 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler makeOperationDependency](v20, "makeOperationDependency"));
    operationDependency = v20->_operationDependency;
    v20->_operationDependency = (KTResultOperation *)v34;

  }
  return v20;
}

- (void)changeDelays:(unint64_t)a3 continuingDelay:(unint64_t)a4
{
  NSObject *v7;
  _QWORD block[7];

  v7 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A05DC;
  block[3] = &unk_10024BD40;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);

}

- (id)makeOperationDependency
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nfs-%@"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", v4, &stru_10024C950));

  objc_msgSend(v5, "setDescriptionErrorCode:", -[KTNearFutureScheduler operationDependencyDescriptionCode](self, "operationDependencyDescriptionCode"));
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler nextFireTime](self, "nextFireTime"));
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTNearFutureScheduler(%@): next at %@"), v5, v6));

  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler name](self, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTNearFutureScheduler(%@): no pending attempts"), v4));
  }

  return v7;
}

- (NSDate)nextFireTime
{
  void *v3;
  id v4;
  void *v5;

  if (-[KTNearFutureScheduler liveRequest](self, "liveRequest")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler liveRequestReceived](self, "liveRequestReceived")),
        v4 = objc_msgSend(v3, "wait:", 50000),
        v3,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

- (void)waitUntil:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A08B8;
  v6[3] = &unk_10023D240;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)triggerAt:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A0990;
  block[3] = &unk_10024C978;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_onqueueTimerTick
{
  NSObject *v3;
  void *v4;
  void (**v5)(void);
  KTCondition *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  id v17;

  v3 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTNearFutureScheduler liveRequest](self, "liveRequest"))
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler operationDependency](self, "operationDependency"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler makeOperationDependency](self, "makeOperationDependency"));
    -[KTNearFutureScheduler setOperationDependency:](self, "setOperationDependency:", v4);

    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler futureBlock](self, "futureBlock"));
    v5[2]();

    -[KTNearFutureScheduler setLiveRequest:](self, "setLiveRequest:", 0);
    v6 = objc_alloc_init(KTCondition);
    -[KTNearFutureScheduler setLiveRequestReceived:](self, "setLiveRequestReceived:", v6);

    -[KTNearFutureScheduler setTransaction:](self, "setTransaction:", 0);
    if (-[KTNearFutureScheduler currentDelay](self, "currentDelay"))
    {
      v7 = (double)-[KTNearFutureScheduler currentDelay](self, "currentDelay");
      -[KTNearFutureScheduler backoff](self, "backoff");
      v9 = v8 * v7;
      v10 = (double)-[KTNearFutureScheduler maximumDelay](self, "maximumDelay");
      if (v9 < v10)
        v10 = v9;
      v11 = (unint64_t)v10;
    }
    else
    {
      v11 = -[KTNearFutureScheduler maximumDelay](self, "maximumDelay");
    }
    -[KTNearFutureScheduler setCurrentDelay:](self, "setCurrentDelay:", v11);
    v13 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
    v14 = dispatch_walltime(0, -[KTNearFutureScheduler currentDelay](self, "currentDelay"));
    dispatch_source_set_timer(v13, v14, -[KTNearFutureScheduler currentDelay](self, "currentDelay"), 0x2FAF080uLL);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler operationQueue](self, "operationQueue"));
    objc_msgSend(v15, "addOperation:", v17);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-[KTNearFutureScheduler currentDelay](self, "currentDelay") / 1000000000.0));
    -[KTNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", v16);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
    dispatch_source_cancel(v12);

    -[KTNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", 0);
    -[KTNearFutureScheduler setCurrentDelay:](self, "setCurrentDelay:", -[KTNearFutureScheduler initialDelay](self, "initialDelay"));
  }
}

- (void)trigger
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A0CD4;
  v4[3] = &unk_10023A970;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_onqueueTrigger:(unint64_t)a3 maximumDelay:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  intptr_t v24;
  NSObject *v25;
  dispatch_source_t v26;
  NSObject *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  NSObject *v32;
  dispatch_time_t v33;
  NSObject *v34;
  void *v35;
  _QWORD handler[4];
  id v37;
  id location;

  v7 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  location = 0;
  objc_initWeak(&location, self);
  if (-[KTNearFutureScheduler keepProcessAlive](self, "keepProcessAlive"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler transaction](self, "transaction"));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler name](self, "name"));
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.transparencyd.%@"), v9)));
      v11 = (void *)os_transaction_create(objc_msgSend(v10, "UTF8String"));
      -[KTNearFutureScheduler setTransaction:](self, "setTransaction:", v11);

    }
  }
  if (a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)a3 / 1000000000.0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
      v15 = objc_msgSend(v13, "compare:", v14);

      if (v15 == (id)1)
      {
        v16 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
        dispatch_source_cancel(v16);

        -[KTNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", 0);
      }

    }
  }
  if (a4 != -1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)a3 / 1000000000.0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
      v20 = objc_msgSend(v18, "compare:", v19);

      if (v20 != (id)1)
      {
        v21 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
        dispatch_source_cancel(v21);

        -[KTNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", 0);
      }

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
  if (!v22
    || (v23 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer")),
        v24 = dispatch_source_testcancel(v23),
        v23,
        v22,
        v24))
  {
    v25 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
    v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v25);
    -[KTNearFutureScheduler setTimer:](self, "setTimer:", v26);

    v27 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001A1104;
    handler[3] = &unk_10023A970;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v27, handler);

    v28 = -[KTNearFutureScheduler currentDelay](self, "currentDelay");
    if (v28 <= a3)
      v29 = a3;
    else
      v29 = v28;
    if (!a3)
      v29 = v28;
    if (v29 >= a4)
      v30 = a4;
    else
      v30 = v29;
    if (a4 == -1)
      v31 = v29;
    else
      v31 = v30;
    v32 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
    v33 = dispatch_walltime(0, v31);
    dispatch_source_set_timer(v32, v33, -[KTNearFutureScheduler currentDelay](self, "currentDelay"), 0x2FAF080uLL);

    v34 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler timer](self, "timer"));
    dispatch_resume(v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(unint64_t)v31 / 1000000000.0));
    -[KTNearFutureScheduler setPredictedNextFireTime:](self, "setPredictedNextFireTime:", v35);

    objc_destroyWeak(&v37);
  }
  objc_destroyWeak(&location);
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A119C;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)status
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v10 = CFSTR("currentDelay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[KTNearFutureScheduler currentDelay](self, "currentDelay") / 0x3B9ACA00));
  v11 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTNearFutureScheduler predictedNextFireTime](self, "predictedNextFireTime"));
    objc_msgSend(v7, "timeIntervalSinceNow");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("nextFire"));

  }
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)futureBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFutureBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (KTResultOperation)operationDependency
{
  return (KTResultOperation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTCondition)liveRequestReceived
{
  return (KTCondition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLiveRequestReceived:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(unint64_t)a3
{
  self->_initialDelay = a3;
}

- (unint64_t)currentDelay
{
  return self->_currentDelay;
}

- (void)setCurrentDelay:(unint64_t)a3
{
  self->_currentDelay = a3;
}

- (unint64_t)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setMaximumDelay:(unint64_t)a3
{
  self->_maximumDelay = a3;
}

- (double)backoff
{
  return self->_backoff;
}

- (void)setBackoff:(double)a3
{
  self->_backoff = a3;
}

- (int64_t)operationDependencyDescriptionCode
{
  return self->_operationDependencyDescriptionCode;
}

- (void)setOperationDependencyDescriptionCode:(int64_t)a3
{
  self->_operationDependencyDescriptionCode = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDate)predictedNextFireTime
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPredictedNextFireTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)liveRequest
{
  return self->_liveRequest;
}

- (void)setLiveRequest:(BOOL)a3
{
  self->_liveRequest = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)keepProcessAlive
{
  return self->_keepProcessAlive;
}

- (void)setKeepProcessAlive:(BOOL)a3
{
  self->_keepProcessAlive = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_predictedNextFireTime, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_liveRequestReceived, 0);
  objc_storeStrong((id *)&self->_operationDependency, 0);
  objc_storeStrong(&self->_futureBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
