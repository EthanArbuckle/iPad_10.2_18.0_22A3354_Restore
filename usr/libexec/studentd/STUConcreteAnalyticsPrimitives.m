@implementation STUConcreteAnalyticsPrimitives

- (void)sendEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  char v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100062D08;
  v8[3] = &unk_1000CB9C0;
  v5 = v3;
  v9 = v5;
  v6 = AnalyticsSendEventLazy(v4, v8);

  if ((v6 & 1) == 0)
  {
    if (qword_1000FC5E0 != -1)
      dispatch_once(&qword_1000FC5E0, &stru_1000CB9E0);
    v7 = qword_1000FC5D8;
    if (os_log_type_enabled((os_log_t)qword_1000FC5D8, OS_LOG_TYPE_ERROR))
      sub_10007D88C((uint64_t)v5, v7);
  }

}

@end
