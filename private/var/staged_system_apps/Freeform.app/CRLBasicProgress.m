@implementation CRLBasicProgress

- (CRLBasicProgress)initWithMaxValue:(double)a3
{
  CRLBasicProgress *v4;
  CRLBasicProgressStorage *v5;
  CRLBasicProgressStorage *storage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLBasicProgress;
  v4 = -[CRLProgress initForSubclass](&v8, "initForSubclass");
  if (v4)
  {
    v5 = objc_alloc_init(CRLBasicProgressStorage);
    storage = v4->_storage;
    v4->_storage = v5;

    -[CRLBasicProgressStorage setMaxValue:](v4->_storage, "setMaxValue:", a3);
  }
  return v4;
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
    dispatch_once(&qword_10147E370, &stru_101238498);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLBasicProgress initForSubclass]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    v17 = 1024;
    v18 = 176;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012384B8);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicProgress initForSubclass]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 176, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLBasicProgress initForSubclass]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (double)value
{
  double result;

  -[CRLBasicProgressStorage value](self->_storage, "value");
  return result;
}

- (void)setValue:(double)a3
{
  -[CRLBasicProgressStorage setValue:](self->_storage, "setValue:", a3);
  -[CRLProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (double)maxValue
{
  double result;

  -[CRLBasicProgressStorage maxValue](self->_storage, "maxValue");
  return result;
}

- (BOOL)isIndeterminate
{
  return -[CRLBasicProgressStorage isIndeterminate](self->_storage, "isIndeterminate");
}

- (void)setIndeterminate:(BOOL)a3
{
  -[CRLBasicProgressStorage setIndeterminate:](self->_storage, "setIndeterminate:", a3);
  -[CRLProgress protected_progressDidChange](self, "protected_progressDidChange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
