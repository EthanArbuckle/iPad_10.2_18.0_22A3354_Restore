@implementation FMDDeviceIdentityProxyFactory

+ (BOOL)isAutomationActive
{
  id v2;
  NSObject *v3;

  if (qword_100306858 != -1)
    dispatch_once(&qword_100306858, &stru_1002C4478);
  v2 = sub_1000031B8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10022B6E8(v3);

  return byte_100306850;
}

+ (id)deviceIdentityProxy
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (+[FMDDeviceIdentityProxyFactory isAutomationActive](FMDDeviceIdentityProxyFactory, "isAutomationActive"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
    v3 = objc_msgSend(v2, "automationHelperClassWithName:", CFSTR("FMDAutomationDeviceIdentity"));

    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10022B764(v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = (void *)objc_opt_new(v3);
  }
  else
  {
    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_10022B794(v15, v16, v17, v18, v19, v20, v21, v22);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDRealDeviceIdentity sharedInstance](FMDRealDeviceIdentity, "sharedInstance"));
  }
  return v13;
}

@end
