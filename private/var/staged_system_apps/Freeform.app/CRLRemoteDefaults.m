@implementation CRLRemoteDefaults

+ (id)sharedDefaults
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10047D77C;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415AB0 != -1)
    dispatch_once(&qword_101415AB0, block);
  return (id)qword_101415AA8;
}

- (CRLRemoteDefaults)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v5 = a3;
  v6 = a4;
  v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260C48);
  v8 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v17 = v7;
    v18 = 2082;
    v19 = "-[CRLRemoteDefaults initWithRemoteURL:localURL:]";
    v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m";
    v22 = 1024;
    v23 = 315;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260C68);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v17 = v7;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemoteDefaults initWithRemoteURL:localURL:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 315, 0, "Do not call method");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLRemoteDefaults initWithRemoteURL:localURL:]"));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

  objc_exception_throw(v15);
}

- (id)initInternal
{
  void *v3;
  CRLRemoteDefaults *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/freeform-1.0.plist")));
  v6.receiver = self;
  v6.super_class = (Class)CRLRemoteDefaults;
  v4 = -[CRLRemotePropertyList initWithRemoteURL:localURL:](&v6, "initWithRemoteURL:localURL:", v3, 0);

  if (v4)
    -[CRLRemoteDefaults registerDefaults](v4, "registerDefaults");
  return v4;
}

- (void)registerDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("freeform-1.0"), CFSTR("plist")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v3));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v9 = CFSTR("CRLRemoteDefaults");
      v10 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
      objc_msgSend(v5, "registerDefaults:", v6);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260C88);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E38B98();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101260CA8);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemoteDefaults registerDefaults]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 347, 0, "Can't parse local defaults plist");
    }

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260CC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38B18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260CE8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemoteDefaults registerDefaults]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 356, 0, "Don't have local defaults plist");
  }

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForKey:", CFSTR("CRLRemoteDefaults")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (!v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLRemoteDefaults;
    v8 = -[CRLRemotePropertyList objectForKey:](&v10, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (void)processPropertyList:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("CRLRemoteDefaults"));

  v6.receiver = self;
  v6.super_class = (Class)CRLRemoteDefaults;
  -[CRLRemotePropertyList processPropertyList:](&v6, "processPropertyList:", v4);

}

@end
