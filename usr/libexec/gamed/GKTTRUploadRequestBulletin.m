@implementation GKTTRUploadRequestBulletin

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
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  objc_super v24;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTTRUploadRequestBulletin: packFakeTTRBulletinWithInfo", buf, 2u);
  }
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___GKTTRUploadRequestBulletin;
  v8 = objc_msgSendSuper2(&v24, "packFakeTTRBulletinWithInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1002DB790, GKPushCommandKey);
  v11 = GKTTRBulletinKeyRadarID;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeyRadarID));
  v13 = (void *)v12;
  v14 = CFSTR("UnknownID");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  v16 = GKTTRBulletinKeyRequesterPlayerAlias;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeyRequesterPlayerAlias));
  v18 = (void *)v17;
  v19 = CFSTR("UnknownAlias");
  if (v17)
    v19 = (__CFString *)v17;
  v20 = v19;

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v11);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ has requested your logs. Tap here to upload your sysdiagnose to radar://%@"), v20, v15));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, GKTTRBulletinKeySubtitle);
  v22 = objc_msgSend(v10, "copy");

  return v22;
}

- (GKTTRUploadRequestBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKTTRUploadRequestBulletin *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTTRUploadRequestBulletin: initWithPushNotification", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKTTRUploadRequestBulletin;
  v8 = -[GKTTRBulletin initWithPushNotification:](&v12, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeyRadarID));
    -[GKTTRUploadRequestBulletin setRadarID:](v8, "setRadarID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeyRequesterPlayerAlias));
    -[GKTTRUploadRequestBulletin setRequesterPlayerAlias:](v8, "setRequesterPlayerAlias:", v10);

  }
  return v8;
}

- (void)assembleBulletin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTTRUploadRequestBulletin;
  -[GKTTRBulletin assembleBulletin](&v3, "assembleBulletin");
  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", CFSTR("GKNotificationCategoryActionsTTRUploadRequest"));
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  GKTTRUploadRequestBulletin *v10;
  void *v11;
  uint8_t v12[16];
  GKTTRUploadRequestBulletin *v13;

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
  v10 = -[GKTTRUploadRequestBulletin initWithPushNotification:]([GKTTRUploadRequestBulletin alloc], "initWithPushNotification:", v5);
  -[GKTTRUploadRequestBulletin assembleBulletin](v10, "assembleBulletin");
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  ((void (**)(_QWORD, void *))v7)[2](v7, v11);

}

- (NSString)radarID
{
  return self->_radarID;
}

- (void)setRadarID:(id)a3
{
  objc_storeStrong((id *)&self->_radarID, a3);
}

- (NSString)requesterPlayerAlias
{
  return self->_requesterPlayerAlias;
}

- (void)setRequesterPlayerAlias:(id)a3
{
  objc_storeStrong((id *)&self->_requesterPlayerAlias, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterPlayerAlias, 0);
  objc_storeStrong((id *)&self->_radarID, 0);
}

@end
