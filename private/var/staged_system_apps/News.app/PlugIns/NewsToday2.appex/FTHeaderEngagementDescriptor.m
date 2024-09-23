@implementation FTHeaderEngagementDescriptor

- (FTHeaderEngagementDescriptor)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTHeaderEngagementDescriptor init]";
    v7 = 2080;
    v8 = "FTHeaderEngagementDescriptor.m";
    v9 = 1024;
    v10 = 19;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTHeaderEngagementDescriptor init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

+ (id)engagementDescriptorWithTargetURL:(id)a3
{
  id v3;
  _QWORD *v4;
  FTOpenArbitraryURLEngagementDescriptor *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D3E4;
  v7[3] = &unk_1000C6C08;
  v8 = a3;
  v3 = v8;
  v4 = objc_retainBlock(v7);
  v5 = -[FTOpenArbitraryURLEngagementDescriptor initWithURL:engagementReporter:]([FTOpenArbitraryURLEngagementDescriptor alloc], "initWithURL:engagementReporter:", v3, v4);

  return v5;
}

@end
