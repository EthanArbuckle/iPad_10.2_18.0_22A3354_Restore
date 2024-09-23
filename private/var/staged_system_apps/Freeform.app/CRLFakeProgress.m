@implementation CRLFakeProgress

- (CRLFakeProgress)initWithMaxValue:(double)a3 numberOfStages:(unint64_t)a4
{
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLFakeProgress *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *accessQueue;
  objc_super v18;

  if (!a4)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238598);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFADEC(v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012385B8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFakeProgress initWithMaxValue:numberOfStages:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 617, 0, "Invalid parameter not satisfying: %{public}s", "numberOfStages > 0");

  }
  v18.receiver = self;
  v18.super_class = (Class)CRLFakeProgress;
  v12 = -[CRLBasicProgress initWithMaxValue:](&v18, "initWithMaxValue:", a3);
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("CRLFakeProgress", v14);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v15;

    v12->_numberOfStages = a4;
    v12->_stopped = 1;
  }
  return v12;
}

- (CRLFakeProgress)initWithMaxValue:(double)a3
{
  unsigned int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  unsigned int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012385D8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v13 = v3;
    v14 = 2082;
    v15 = "-[CRLFakeProgress initWithMaxValue:]";
    v16 = 2082;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    v18 = 1024;
    v19 = 628;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012385F8);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    v7 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v13 = v3;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFakeProgress initWithMaxValue:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 628, 0, "Do not call method");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLFakeProgress initWithMaxValue:]"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (void)start
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100107988;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)stop
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100107A0C;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)advanceToStage:(unint64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100107A84;
  v4[3] = &unk_10122DCC8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)p_slowlyAdvanceToNextStage
{
  dispatch_time_t v3;
  NSObject *accessQueue;
  _QWORD block[5];

  if (!self->_stopped && self->_currentStage < self->_numberOfStages)
  {
    v3 = dispatch_time(0, 250000000);
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100107BB4;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_after(v3, accessQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
