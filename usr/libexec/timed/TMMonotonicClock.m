@implementation TMMonotonicClock

- (double)coarseMonotonicTime
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v14;
  double lastCoarseMonotonicTime;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;

  v3 = -[TMMonotonicClock machTime](self, "machTime");
  v4 = sub_10000678C(0, 0);
  v5 = sub_100006AF0(self->_lastCoarseMonotonicTimeMachTime, v3);
  v6 = v4 - self->_lastCoarseMonotonicTime;
  v7 = sub_100006A10();
  if (v6 >= v7 * -0.5)
  {
    if (v5 > v7 + v7 && v6 < v7 * 0.5)
    {
      v14 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
      {
        lastCoarseMonotonicTime = self->_lastCoarseMonotonicTime;
        v17 = 134219008;
        v18 = v4;
        v19 = 2048;
        v20 = lastCoarseMonotonicTime;
        v21 = 2048;
        v22 = v6;
        v23 = 2048;
        v24 = v5;
        v25 = 2048;
        v26 = v7;
        v10 = "PMU RTC appears stalled: %f - %f = %f; mach advanced by %f; resolution %f";
        v11 = v14;
        v12 = 52;
        goto LABEL_12;
      }
    }
  }
  else
  {
    v8 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
    {
      v9 = self->_lastCoarseMonotonicTime;
      v17 = 134218752;
      v18 = v4;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = v6;
      v23 = 2048;
      v24 = v7;
      v10 = "PMU RTC went backward: %f - %f = %f; resolution %f";
      v11 = v8;
      v12 = 42;
LABEL_12:
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v17, v12);
    }
  }
  self->_lastCoarseMonotonicTime = v4;
  self->_lastCoarseMonotonicTimeMachTime = v3;
  return v4;
}

- (TMMonotonicClock)init
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMMonotonicClock.m"), 34, CFSTR("Incorrect init invoked"));
  return 0;
}

- (TMMonotonicClock)initWithSyncInterval:(double)a3
{
  TMMonotonicClock *v4;
  TMMonotonicClock *v5;
  objc_class *v6;
  const char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TMMonotonicClock;
  v4 = -[TMMonotonicClock init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%llx"), NSStringFromClass(v6), v5), "UTF8String");
    v5->_workQ = (OS_dispatch_queue *)dispatch_queue_create(v7, 0);
    v5->_lastCoarseMonotonicTimeMachTime = -[TMMonotonicClock machTime](v5, "machTime");
    v5->_syncInterval = a3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TMMonotonicClock;
  -[TMMonotonicClock dealloc](&v3, "dealloc");
}

- (void)montonicTimeForMachTime:(unint64_t)a3 toQueue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v10;
  _QWORD block[8];

  v10 = mach_absolute_time();
  if (v10 < a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMMonotonicClock.m"), 63, CFSTR("%lld < %lld"), a3, v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000130B0;
  block[3] = &unk_100029200;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  block[7] = a3;
  dispatch_async((dispatch_queue_t)-[TMMonotonicClock workQ](self, "workQ"), block);
}

- (unint64_t)lastWake
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _QWORD v14[5];
  size_t v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;

  if (qword_100033708 != -1)
    dispatch_once(&qword_100033708, &stru_100029220);
  v15 = 8;
  v16 = 0;
  if (sysctl((int *)&unk_1000336F8, qword_100033700, &v16, &v15, 0, 0))
  {
    v3 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001BE14(v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = -1;
    v16 = -1;
  }
  else
  {
    v11 = v16;
  }
  if (self->_lastWake != v11)
  {
    self->_lastWake = v11;
    v12 = qword_100033720;
    if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "cmd,lastWake,mach,%llu", buf, 0xCu);
      v11 = v16;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013624;
    v14[3] = &unk_100029240;
    v14[4] = v11;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.lastWake"), v14);
    return v16;
  }
  return v11;
}

- (BOOL)isMachTimeValid:(unint64_t)a3
{
  return -[TMMonotonicClock lastWake](self, "lastWake") < a3;
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
