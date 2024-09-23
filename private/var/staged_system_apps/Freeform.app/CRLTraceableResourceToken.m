@implementation CRLTraceableResourceToken

- (CRLTraceableResourceToken)init
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
    dispatch_once(&qword_10147E370, &stru_101259AD8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLTraceableResourceToken init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m";
    v17 = 1024;
    v18 = 509;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259AF8);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 509, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLTraceableResourceToken init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLTraceableResourceToken)initWithIntent:(id)a3 timeout:(unint64_t)a4 parent:(id)a5 context:(id)a6 acquireCallStack:(id)a7 acquireTime:(double)a8 logContext:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  CRLTraceableResourceToken *v20;
  CRLTraceableResourceToken *v21;
  NSString *v22;
  NSString *intent;
  NSMutableArray *v24;
  NSMutableArray *breadcrumbs;
  id v27;
  objc_super v28;

  v16 = a3;
  v27 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)CRLTraceableResourceToken;
  v20 = -[CRLTraceableResourceToken init](&v28, "init");
  v21 = v20;
  if (v20)
  {
    atomic_store(0, (unint64_t *)&v20->_state);
    v22 = (NSString *)objc_msgSend(v16, "copy");
    intent = v21->_intent;
    v21->_intent = v22;

    objc_storeStrong((id *)&v21->_parent, a5);
    atomic_store(a4, &v21->_timeout);
    objc_storeStrong((id *)&v21->_context, a6);
    objc_storeStrong((id *)&v21->_acquireCallStack, a7);
    v21->_acquireTime = a8;
    v24 = objc_opt_new(NSMutableArray);
    breadcrumbs = v21->_breadcrumbs;
    v21->_breadcrumbs = v24;

    objc_storeStrong((id *)&v21->_logContext, a9);
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (!self->_relinquishCallStack)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259B18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E224();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259B38);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 529, 0, "Token was deallocated without getting relinquished: %{public}@", self);

  }
  v6 = atomic_load((unsigned int *)&self->_timeoutPauseCount);
  if (v6 >= 1)
  {
    sub_1003D9AD4();
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259B58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E1A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259B78);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken dealloc]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 530, 0, "Token was deallocated with paused timeout: %{public}@", self);

  }
  v10.receiver = self;
  v10.super_class = (Class)CRLTraceableResourceToken;
  -[CRLTraceableResourceToken dealloc](&v10, "dealloc");
}

- (int64_t)state
{
  return atomic_load((unint64_t *)&self->_state);
}

- (unint64_t)timeout
{
  return atomic_load(&self->_timeout);
}

- (BOOL)isTimeoutPaused
{
  signed int v2;

  __dmb(0xBu);
  v2 = atomic_load((unsigned int *)&self->_timeoutPauseCount);
  return v2 > 0;
}

- (void)pauseTimeout
{
  int *p_timeoutPauseCount;
  unsigned int v3;

  p_timeoutPauseCount = &self->_timeoutPauseCount;
  do
    v3 = __ldaxr((unsigned int *)p_timeoutPauseCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_timeoutPauseCount));
  -[CRLTraceableResourceToken pauseTimeout](self->_parent, "pauseTimeout");
}

- (void)resumeTimeout
{
  int *p_timeoutPauseCount;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  p_timeoutPauseCount = &self->_timeoutPauseCount;
  do
    v4 = __ldaxr((unsigned int *)p_timeoutPauseCount);
  while (__stlxr(v4 - 1, (unsigned int *)p_timeoutPauseCount));
  if (v4 <= 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259B98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E2A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259BB8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken resumeTimeout]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 553, 0, "Unbalanced -pauseTimeout and -resumeTimeout calls.");

  }
  else if (v4 == 1)
  {
    -[CRLTraceableResourceToken extendTimeout:updateParent:](self, "extendTimeout:updateParent:", 1, 0);
  }
  -[CRLTraceableResourceToken resumeTimeout](self->_parent, "resumeTimeout");
}

- (void)extendTimeout:(unint64_t)a3
{
  -[CRLTraceableResourceToken extendTimeout:updateParent:](self, "extendTimeout:updateParent:", a3, 1);
}

- (void)extendTimeout:(unint64_t)a3 updateParent:(BOOL)a4
{
  unint64_t *p_timeout;
  unint64_t v5;

  p_timeout = &self->_timeout;
  do
    v5 = __ldaxr(p_timeout);
  while (__stlxr(v5 + a3, p_timeout));
  if (a4)
    -[CRLTraceableResourceToken extendTimeout:](self->_parent, "extendTimeout:");
}

- (void)addBreadcrumb:(id)a3
{
  id v4;
  void *v5;
  CRLLogContext *logContext;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  CRLTraceableResourceToken *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  if (qword_10147E3A8 != -1)
    dispatch_once(&qword_10147E3A8, &stru_101259BD8);
  v5 = off_1013D90A8;
  if (os_log_type_enabled((os_log_t)off_1013D90A8, OS_LOG_TYPE_INFO))
  {
    logContext = self->_logContext;
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext publicString](logContext, "publicString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogContext privateString](self->_logContext, "privateString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken intent](self, "intent"));
    v11 = 138544386;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@ %@ Resource %p with '%{public}@' intent added breadcrumb: %{public}@", (uint8_t *)&v11, 0x34u);

  }
  -[NSMutableArray addObject:](self->_breadcrumbs, "addObject:", v4);
  -[CRLTraceableResourceToken extendTimeout:updateParent:](self, "extendTimeout:updateParent:", 1, 1);

}

- (NSArray)acquireCallStack
{
  NSArray *copiedAcquireCallStack;
  NSArray *v4;
  NSArray *v5;

  copiedAcquireCallStack = self->_copiedAcquireCallStack;
  if (!copiedAcquireCallStack)
  {
    v4 = (NSArray *)-[NSArray copy](self->_acquireCallStack, "copy");
    v5 = self->_copiedAcquireCallStack;
    self->_copiedAcquireCallStack = v4;

    copiedAcquireCallStack = self->_copiedAcquireCallStack;
  }
  return copiedAcquireCallStack;
}

- (NSArray)relinquishCallStack
{
  NSArray *copiedRelinquishCallStack;
  NSArray *v4;
  NSArray *v5;

  copiedRelinquishCallStack = self->_copiedRelinquishCallStack;
  if (!copiedRelinquishCallStack)
  {
    v4 = (NSArray *)-[NSArray copy](self->_relinquishCallStack, "copy");
    v5 = self->_copiedRelinquishCallStack;
    self->_copiedRelinquishCallStack = v4;

    copiedRelinquishCallStack = self->_copiedRelinquishCallStack;
  }
  return copiedRelinquishCallStack;
}

- (void)didAcquire
{
  int64_t *p_state;
  void *v4;
  void *v5;
  void *v6;

  p_state = &self->_state;
  while (!__ldaxr((unint64_t *)p_state))
  {
    if (!__stlxr(1uLL, (unint64_t *)p_state))
      return;
  }
  __clrex();
  sub_1003D9AD4();
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259BF8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2E328();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259C18);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken didAcquire]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 602, 0, "Unexpected state.");

}

- (void)setRelinquishCallStackIfNeeded:(id)a3 relinquishTime:(double)a4
{
  id v7;
  int64_t *p_state;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  p_state = &self->_state;
  while (1)
  {
    v9 = __ldaxr((unint64_t *)p_state);
    if (v9 != 1)
      break;
    if (!__stlxr(2uLL, (unint64_t *)p_state))
      goto LABEL_14;
  }
  __clrex();
  sub_1003D9AD4();
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259C38);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2E3A8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259C58);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceToken setRelinquishCallStackIfNeeded:relinquishTime:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 607, 0, "Unexpected state.");

LABEL_14:
  if (!self->_relinquishCallStack)
  {
    objc_storeStrong((id *)&self->_relinquishCallStack, a3);
    self->_relinquishTime = a4;
  }

}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLTraceableResourceToken;
  return -[CRLTraceableResourceToken hash](&v3, "hash");
}

+ (id)p_formattedDateStringFromTimeInterval:(double)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
  v4 = objc_alloc_init((Class)NSDateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSSZ"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));

  return v6;
}

- (id)metadataDescriptionWithIndex:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v18;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = v7;
  -[CRLTraceableResourceToken acquireTime](self, "acquireTime", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "p_formattedDateStringFromTimeInterval:"));
  v10 = -[CRLTraceableResourceToken state](self, "state");
  v11 = CFSTR("WAITING");
  if (v10 == 1)
    v11 = CFSTR("ACTIVE");
  if (v10 == 2)
    v11 = CFSTR("DONE");
  v12 = v11;
  v13 = objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken intent](self, "intent"));
  v14 = (void *)v13;
  if (v4)
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] %@ '%@' %@"), v4, v12, v13, v9);
  else
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' %@ %@"), v12, v13, v9, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (NSString)acquireCallStackDescription
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken acquireCallStack](self, "acquireCallStack", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callStackDescriptionWithAction:callStackSymbols:index:", &stru_1012A72B0, v6, 0));

  return (NSString *)v7;
}

- (NSString)relinquishCallStackDescription
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken relinquishCallStack](self, "relinquishCallStack", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callStackDescriptionWithAction:callStackSymbols:index:", &stru_1012A72B0, v6, 0));

  return (NSString *)v7;
}

- (id)acquireCallStackDescriptionWithIndex:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken acquireCallStack](self, "acquireCallStack", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callStackDescriptionWithAction:callStackSymbols:index:", &stru_1012A72B0, v9, v4));

  return v10;
}

+ (id)callStackDescriptionWithAction:(id)a3 callStackSymbols:(id)a4 index:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSMutableString *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  uint64_t v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_new(NSMutableString);
  v11 = objc_msgSend(v9, "length");
  v12 = CFSTR(" ");
  if (!v11)
    v12 = &stru_1012A72B0;
  if (v7)
    -[NSMutableString appendFormat:](v10, "appendFormat:", CFSTR("[%@] %@%@backtrace:"), v7, v9, v12);
  else
    -[NSMutableString appendFormat:](v10, "appendFormat:", CFSTR("%@%@backtrace:"), v9, v12, v15);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceStringWithReturnAddresses:](CRLAssertionHandler, "packedBacktraceStringWithReturnAddresses:", v8));
  -[NSMutableString appendFormat:](v10, "appendFormat:", CFSTR(" %@"), v13);

  return v10;
}

- (id)breadcrumbsDescriptionWithIndex:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSMutableString *v7;
  NSMutableString *v8;
  __CFString *v9;
  NSMutableArray *breadcrumbs;
  uint64_t v12;
  _QWORD v13[4];
  __CFString *v14;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_breadcrumbs, "count");
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_new(NSMutableString);
    v8 = v7;
    if (v4)
      -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("[%@] %tu breadcrumb(s): ("), v4, v6);
    else
      -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("%tu breadcrumb(s): ("), v6, v12);
    breadcrumbs = self->_breadcrumbs;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003DE0A8;
    v13[3] = &unk_10122E508;
    v9 = v8;
    v14 = v9;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](breadcrumbs, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
    -[__CFString appendString:](v9, "appendString:", CFSTR(")"));

  }
  else
  {
    v9 = &stru_1012A72B0;
  }

  return v9;
}

- (id)parentDescriptionWithIndex:(id)a3
{
  id v4;
  id v5;
  CRLTraceableResourceToken *parent;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v12;

  v4 = a3;
  if (self->_parent)
  {
    v5 = objc_alloc((Class)NSString);
    parent = self->_parent;
    v7 = objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken intent](parent, "intent"));
    v8 = (void *)v7;
    if (v4)
      v9 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%@] parent: %p '%@'"), v4, parent, v7);
    else
      v9 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("parent: %p '%@'"), parent, v7, v12);
    v10 = v9;

  }
  else
  {
    v10 = &stru_1012A72B0;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  Class v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  Class v33;
  NSString *v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  CRLTraceableResourceToken *v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken relinquishCallStack](self, "relinquishCallStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken context](self, "context"));
  v43 = v4;
  if (!v4)
  {
    v42 = &stru_1012A72B0;
    if (v3)
      goto LABEL_3;
LABEL_5:
    objc_opt_class(self, v5);
    v34 = NSStringFromClass(v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken metadataDescriptionWithIndex:](self, "metadataDescriptionWithIndex:", 0));
    *(_QWORD *)&v36 = objc_opt_class(self, v35).n128_u64[0];
    v38 = v37;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken acquireCallStack](self, "acquireCallStack", v36));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "callStackDescriptionWithAction:callStackSymbols:index:", CFSTR("Acquire"), v15, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken breadcrumbsDescriptionWithIndex:](self, "breadcrumbsDescriptionWithIndex:", 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken parentDescriptionWithIndex:](self, "parentDescriptionWithIndex:", 0));
    v28 = (__CFString *)v42;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>\n%@%@\n%@\n%@\n%@"), v10, self, v42, v32, v31, v20, v24));
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
  v42 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("context: %@\n"), v6));

  if (!v3)
    goto LABEL_5;
LABEL_3:
  *(_QWORD *)&v7 = objc_opt_class(self, v5).n128_u64[0];
  v9 = v8;
  -[CRLTraceableResourceToken acquireTime](self, "acquireTime", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "p_formattedDateStringFromTimeInterval:"));
  objc_opt_class(self, v11);
  v13 = NSStringFromClass(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken metadataDescriptionWithIndex:](self, "metadataDescriptionWithIndex:", 0));
  *(_QWORD *)&v17 = objc_opt_class(self, v16).n128_u64[0];
  v19 = v18;
  v41 = objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken acquireCallStack](self, "acquireCallStack", v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "callStackDescriptionWithAction:callStackSymbols:index:", CFSTR("Acquire"), v41, 0));
  *(_QWORD *)&v22 = objc_opt_class(self, v21).n128_u64[0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "callStackDescriptionWithAction:callStackSymbols:index:", CFSTR("Relinquish"), v3, 0, v22));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken breadcrumbsDescriptionWithIndex:](self, "breadcrumbsDescriptionWithIndex:", 0));
  v26 = v3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResourceToken parentDescriptionWithIndex:](self, "parentDescriptionWithIndex:", 0));
  v28 = (__CFString *)v42;
  v40 = self;
  v29 = (void *)v14;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>\n%@%@\n%@\n%@\n%@\n%@\n%@"), v14, v40, v42, v15, v20, v10, v24, v25, v27));

  v3 = v26;
  v31 = (void *)v41;

  v32 = v29;
LABEL_6:

  return (NSString *)v30;
}

- (NSString)intent
{
  return self->_intent;
}

- (CRLTraceableResourceToken)parent
{
  return self->_parent;
}

- (NSObject)context
{
  return self->_context;
}

- (double)acquireTime
{
  return self->_acquireTime;
}

- (double)relinquishTime
{
  return self->_relinquishTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_logContext, 0);
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
  objc_storeStrong((id *)&self->_copiedRelinquishCallStack, 0);
  objc_storeStrong((id *)&self->_relinquishCallStack, 0);
  objc_storeStrong((id *)&self->_copiedAcquireCallStack, 0);
  objc_storeStrong((id *)&self->_acquireCallStack, 0);
}

@end
