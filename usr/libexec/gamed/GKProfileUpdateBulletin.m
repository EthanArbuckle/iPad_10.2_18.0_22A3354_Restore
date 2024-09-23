@implementation GKProfileUpdateBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKProfileUpdateBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v10, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountProfileUpdate);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("i")));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletin cacheTransactionGroup](GKBulletin, "cacheTransactionGroup"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001399A8;
    v15[3] = &unk_1002BB850;
    v16 = v11;
    v17 = v5;
    objc_msgSend(v12, "performOnManagedObjectContext:", v15);
    if (v7)
      v7[2](v7, 0);

  }
  else
  {
    if (!os_log_GKGeneral)
      v13 = (id)GKOSLoggers(0);
    v14 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10013A644(v14);
  }

}

@end
