@implementation GKRelayBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKRelayBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v11, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountRelay);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001396B0;
  v13[3] = &unk_1002BBBD8;
  v12 = v6;
  v14 = v12;
  objc_msgSend(a1, "performAsync:", v13);
  if (v8)
    v8[2](v8, 0);

}

@end
