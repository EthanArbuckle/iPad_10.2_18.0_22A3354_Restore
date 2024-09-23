@implementation CRLScaledProgress

- (CRLScaledProgress)init
{
  CRLScaledProgress *v2;
  CRLScaledProgressStorage *v3;
  CRLScaledProgressStorage *storage;
  dispatch_queue_t v5;
  OS_dispatch_queue *progressQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLScaledProgress;
  v2 = -[CRLProgress initForSubclass](&v8, "initForSubclass");
  if (v2)
  {
    v3 = objc_alloc_init(CRLScaledProgressStorage);
    storage = v2->_storage;
    v2->_storage = v3;

    v5 = dispatch_queue_create("com.apple.freeform.CRLScaledProgress", 0);
    progressQueue = v2->_progressQueue;
    v2->_progressQueue = (OS_dispatch_queue *)v5;

    -[CRLScaledProgressStorage setMaxValue:](v2->_storage, "setMaxValue:", 1.0);
  }
  return v2;
}

- (id)initForSubclass
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012384D8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLScaledProgress initForSubclass]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    v17 = 1024;
    v18 = 232;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012384F8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScaledProgress initForSubclass]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 232, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLScaledProgress initForSubclass]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLProgress)progress
{
  NSObject *progressQueue;
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
  v9 = sub_100105AA8;
  v10 = sub_100105AB8;
  v11 = 0;
  progressQueue = self->_progressQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100105AC0;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(progressQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CRLProgress *)v3;
}

- (void)setProgress:(id)a3
{
  id v4;
  NSObject *progressQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  progressQueue = self->_progressQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100105B88;
  v7[3] = &unk_10122D3D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(progressQueue, v7);

}

- (double)value
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScaledProgress progress](self, "progress"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "value");
    v6 = v5;
    objc_msgSend(v4, "maxValue");
    v8 = v6 / v7;
    -[CRLScaledProgress maxValue](self, "maxValue");
    v10 = v8 * v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)maxValue
{
  double result;

  -[CRLScaledProgressStorage maxValue](self->_storage, "maxValue");
  return result;
}

- (void)setMaxValue:(double)a3
{
  -[CRLScaledProgressStorage setMaxValue:](self->_storage, "setMaxValue:", a3);
  -[CRLProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (BOOL)isIndeterminate
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScaledProgress progress](self, "progress"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isIndeterminate");
  else
    v4 = 1;

  return v4;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  void *v7;
  NSObject *progressQueue;
  _QWORD block[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLScaledProgress;
  v6 = -[CRLProgress addProgressObserverWithValueInterval:queue:handler:](&v11, "addProgressObserverWithValueInterval:queue:handler:", a4, a5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  progressQueue = self->_progressQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105D6C;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(progressQueue, block);
  return v7;
}

- (void)removeProgressObserver:(id)a3
{
  NSObject *progressQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLScaledProgress;
  -[CRLProgress removeProgressObserver:](&v6, "removeProgressObserver:", a3);
  progressQueue = self->_progressQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105E28;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(progressQueue, block);
}

- (void)p_addProgressObserverToProgressInQueue
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  double v5;
  double v8;
  double v9;
  double v10;
  double v11;
  CRLProgress *progress;
  OS_dispatch_queue *progressQueue;
  void *v14;
  id progressObserver;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = self->_progressQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (self->_progress)
  {
    -[CRLProgress protected_minProgressObserverValueInterval](self, "protected_minProgressObserverValueInterval");
    v5 = *(double *)&v4;
    if (v4 >= 0 && ((v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      -[CRLProgress maxValue](self->_progress, "maxValue");
      v9 = v8;
      -[CRLScaledProgress maxValue](self, "maxValue");
      v11 = v5 * (v9 / v10);
      objc_initWeak(&location, self);
      progress = self->_progress;
      progressQueue = self->_progressQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100105FE8;
      v16[3] = &unk_10122D4C0;
      objc_copyWeak(&v17, &location);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgress addProgressObserverWithValueInterval:queue:handler:](progress, "addProgressObserverWithValueInterval:queue:handler:", progressQueue, v16, v11));
      progressObserver = self->_progressObserver;
      self->_progressObserver = v14;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

- (void)p_removeProgressObserverFromProgressInQueue
{
  OS_dispatch_queue *v3;
  id progressObserver;

  v3 = self->_progressQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (self->_progressObserver)
  {
    -[CRLProgress removeProgressObserver:](self->_progress, "removeProgressObserver:");
    progressObserver = self->_progressObserver;
    self->_progressObserver = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong(&self->_progressObserver, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
