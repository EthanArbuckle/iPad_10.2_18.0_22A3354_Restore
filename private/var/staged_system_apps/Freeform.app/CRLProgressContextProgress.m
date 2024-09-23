@implementation CRLProgressContextProgress

- (CRLProgressContextProgress)initWithProgressContext:(id)a3
{
  id v5;
  id *v6;
  CRLProgressContextProgress *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *progressContextObserverQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLProgressContextProgress;
  v6 = -[CRLProgress initForSubclass](&v11, "initForSubclass");
  v7 = (CRLProgressContextProgress *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 5, a3);
    v8 = dispatch_queue_create("com.apple.freeform.CRLProgressContextProgress", 0);
    progressContextObserverQueue = v7->_progressContextObserverQueue;
    v7->_progressContextObserverQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
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
    dispatch_once(&qword_10147E370, &stru_101238558);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLProgressContextProgress initForSubclass]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    v17 = 1024;
    v18 = 490;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101238578);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLProgressContextProgress initForSubclass]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 490, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLProgressContextProgress initForSubclass]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (double)value
{
  CRLProgressContext *progressContext;
  double result;

  progressContext = self->_progressContext;
  if (!progressContext)
    return 0.0;
  -[CRLProgressContext overallProgress](progressContext, "overallProgress");
  return result;
}

- (double)maxValue
{
  return 1.0;
}

- (BOOL)isIndeterminate
{
  return 0;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLProgressContextProgress;
  v6 = -[CRLProgress addProgressObserverWithValueInterval:queue:handler:](&v9, "addProgressObserverWithValueInterval:queue:handler:", a4, a5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CRLProgressContextProgress p_updateProgressContextObserver](self, "p_updateProgressContextObserver");
  return v7;
}

- (void)removeProgressObserver:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLProgressContextProgress;
  -[CRLProgress removeProgressObserver:](&v4, "removeProgressObserver:", a3);
  -[CRLProgressContextProgress p_updateProgressContextObserver](self, "p_updateProgressContextObserver");
}

- (void)p_updateProgressContextObserver
{
  NSObject *progressContextObserverQueue;
  _QWORD block[5];

  progressContextObserverQueue = self->_progressContextObserverQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001070C8;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(progressContextObserverQueue, block);
}

- (void)p_progressDidChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CRLProgressMessage")));

  if (v5)
    -[CRLProgress setMessage:](self, "setMessage:", v5);
  -[CRLProgress protected_progressDidChange](self, "protected_progressDidChange");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressContextObserverQueue, 0);
  objc_storeStrong((id *)&self->_progressContext, 0);
}

@end
