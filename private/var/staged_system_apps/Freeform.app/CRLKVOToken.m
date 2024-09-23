@implementation CRLKVOToken

- (CRLKVOToken)init
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
    dispatch_once(&qword_10147E370, &stru_1012445C0);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLKVOToken init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSObject_CRLAdditions.m";
    v17 = 1024;
    v18 = 246;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012445E0);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLKVOToken init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSObject_CRLAdditions.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 246, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLKVOToken init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6
{
  NSObject *v10;
  NSObject *v11;
  id v12;
  CRLKVOToken *v13;
  CRLKVOToken *v14;
  NSString *v15;
  NSString *keyPath;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRLKVOToken;
  v13 = -[CRLKVOToken init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_observer = v10;
    v13->_target = v11;
    v15 = (NSString *)objc_msgSend(v12, "copy");
    keyPath = v14->_keyPath;
    v14->_keyPath = v15;

    v14->_context = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id context;
  unsigned __int8 v10;
  NSObject *observer;
  NSObject *v12;
  NSString *keyPath;
  void *v14;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class(CRLKVOToken, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 && (context = self->_context, context == objc_msgSend(v8, "context")))
  {
    observer = self->_observer;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "observer"));
    if (observer == v12)
    {
      keyPath = self->_keyPath;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyPath"));
      v10 = -[NSString isEqualToString:](keyPath, "isEqualToString:", v14);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSObject *observer;

  observer = self->_observer;
  return -[NSString hash](self->_keyPath, "hash") ^ (unint64_t)observer ^ (unint64_t)self->_context;
}

- (NSObject)observer
{
  return self->_observer;
}

- (NSObject)target
{
  return self->_target;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
