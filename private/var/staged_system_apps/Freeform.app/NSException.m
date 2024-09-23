@implementation NSException

+ (void)crl_raiseWithError:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;

  v3 = a3;
  if (!v3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231988);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF01C0(v4, v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012319A8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSException(CRLAdditions) crl_raiseWithError:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSException_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 14, 0, "Invalid parameter not satisfying: %{public}s", "error != nil");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedFailureReason"));
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    v14 = (void *)v13;
    v15 = CFSTR("NSError exception");
    if (v13)
      v15 = (__CFString *)v13;
    v12 = v15;

  }
  v18 = CFSTR("CRLErrorExceptionUserInfoKey");
  v19 = v3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("CRLErrorException"), v12, v16));

  objc_msgSend(v17, "raise");
}

- (id)crl_error
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSException userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("CRLErrorExceptionUserInfoKey")));

  v5 = objc_opt_class(NSError, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = v3;
  }
  else
  {
    if (v3)
    {
      v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012319C8);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF026C((uint64_t)v3, v7, v8);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012319E8);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSException(CRLAdditions) crl_error]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSException_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 28, 0, "Unexpected NSException value for CRLErrorExceptionUserInfoKey: %@", v3);

    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)crl_catchExceptionsInBlock:(id)a3 error:(id *)a4
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  v4[2]();

  return 1;
}

@end
