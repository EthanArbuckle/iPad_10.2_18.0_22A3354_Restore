@implementation CSCoreAnalyticsXPCManager

- (CSCoreAnalyticsXPCManager)initWithMartyUploadHandler:(id)a3 andKappaHandler:(id)a4
{
  id v6;
  id v7;
  CSCoreAnalyticsXPCManager *v8;
  void *v9;
  NSObject *v10;
  unint64_t xpcIntervalInSecs;
  id v12;
  id martyHandler;
  id v14;
  id kappaHandler;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  unint64_t v23;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSCoreAnalyticsXPCManager;
  v8 = -[CSCoreAnalyticsXPCManager init](&v21, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
    v8->_xpcIntervalInSecs = (unint64_t)objc_msgSend(v9, "integerForKey:", CFSTR("CoreAnalyticsUserInfoCadence"));

    if (!v8->_xpcIntervalInSecs)
      v8->_xpcIntervalInSecs = 86400;
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_100361310);
    v10 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
    {
      xpcIntervalInSecs = v8->_xpcIntervalInSecs;
      *(_DWORD *)buf = 134217984;
      v23 = xpcIntervalInSecs;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "configure to send after %llu seconds", buf, 0xCu);
    }
    v12 = objc_retainBlock(v6);
    martyHandler = v8->_martyHandler;
    v8->_martyHandler = v12;

    v14 = objc_retainBlock(v7);
    kappaHandler = v8->_kappaHandler;
    v8->_kappaHandler = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
    v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("CAUnmanagedXPCActivity"));

    if (v17)
    {
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_100361310);
      v18 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "unmanaged xpc activity", buf, 2u);
      }
      -[CSCoreAnalyticsXPCManager registerForCoreAnalyticsUserInfoWithExplicitCriteria](v8, "registerForCoreAnalyticsUserInfoWithExplicitCriteria");
    }
    else
    {
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_100361310);
      v19 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "launchd managed xpc activity", buf, 2u);
      }
      -[CSCoreAnalyticsXPCManager registerForCoreAnalyticsUserInfo](v8, "registerForCoreAnalyticsUserInfo");
    }
  }

  return v8;
}

- (void)registerForCoreAnalyticsUserInfoWithExplicitCriteria
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, self->_xpcIntervalInSecs);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  -[CSCoreAnalyticsXPCManager registerForCoreAnalyticsUserInfoWithCriteria:](self, "registerForCoreAnalyticsUserInfoWithCriteria:", xdict);

}

- (void)registerForCoreAnalyticsUserInfo
{
  -[CSCoreAnalyticsXPCManager registerForCoreAnalyticsUserInfoWithCriteria:](self, "registerForCoreAnalyticsUserInfoWithCriteria:", XPC_ACTIVITY_CHECK_IN);
}

- (void)registerForCoreAnalyticsUserInfoWithCriteria:(id)a3
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10026F920;
  handler[3] = &unk_1003612F0;
  handler[4] = self;
  xpc_activity_register("com.apple.anomalydetectiond.CoreAnalytics.UserInfo", a3, handler);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_kappaHandler, 0);
  objc_storeStrong(&self->_martyHandler, 0);
}

@end
