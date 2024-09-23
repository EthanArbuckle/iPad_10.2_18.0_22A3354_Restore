@implementation GKTTRInitiationBulletin

+ (id)packFakeTTRBulletinWithInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  objc_super v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTTRInitiationBulletin: packFakeTTRBulletinWithInfo", buf, 2u);
  }
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___GKTTRInitiationBulletin;
  v8 = objc_msgSendSuper2(&v17, "packFakeTTRBulletinWithInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1002DB778, GKPushCommandKey);
  v11 = GKTTRBulletinKeySubtitle;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeySubtitle));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("Did you encounter any issues? Tap here to file a radar.");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v11);

  v15 = objc_msgSend(v10, "copy");
  return v15;
}

- (void)assembleBulletin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTTRInitiationBulletin;
  -[GKTTRBulletin assembleBulletin](&v3, "assembleBulletin");
  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", CFSTR("GKNotificationCategoryActionsTTRInitiation"));
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  GKTTRInitiationBulletin *v10;
  void *v11;
  uint8_t v12[16];
  GKTTRInitiationBulletin *v13;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKTTRBulletin: loadBulletinsForPushNotification", v12, 2u);
  }
  v10 = -[GKTTRBulletin initWithPushNotification:]([GKTTRInitiationBulletin alloc], "initWithPushNotification:", v5);
  -[GKTTRInitiationBulletin assembleBulletin](v10, "assembleBulletin");
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  ((void (**)(_QWORD, void *))v7)[2](v7, v11);

}

@end
