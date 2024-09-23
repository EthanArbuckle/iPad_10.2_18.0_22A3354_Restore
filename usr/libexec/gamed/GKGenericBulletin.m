@implementation GKGenericBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKGenericBulletin loadBulletinsForPushNotification: withHandler:", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v11, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountTurnBased);

  v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithPushNotification:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("i")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  if (v14)
  {
    v21 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pushCredentialForEnvironment:", objc_msgSend(v15, "environment")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playerInternal"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playerID"));
    v20 = objc_msgSend(v19, "isEqualToString:", v14);

    v6 = v21;
    if (v20)
    {
      objc_msgSend(v13, "assembleBulletinFromPushNotification:", v21);
      objc_msgSend(v12, "addObject:", v13);
    }
  }
  if (v8)
    ((void (**)(_QWORD, id))v8)[2](v8, v12);

}

- (void)assembleBulletinFromPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GKBulletinAction *v14;
  void *v15;
  GKBulletinAction *v16;
  void *v17;
  void *v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKGenericBulletin assembleBulletinFromPushNotification:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("b")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("u")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("t")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("m")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("n")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("y")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("o")));
  v14 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v14, "setType:", 1);
  -[GKBulletinAction setTitle:](v14, "setTitle:", v12);
  if (v9)
    v15 = v9;
  else
    v15 = v8;
  -[GKBulletinAction setInfo:](v14, "setInfo:", v15);
  if (objc_msgSend(v13, "integerValue") == (id)2)
  {
    v16 = objc_alloc_init(GKBulletinAction);
    -[GKBulletinAction setType:](v16, "setType:", 0);
    -[GKBulletinAction setTitle:](v16, "setTitle:", v11);
    -[GKBulletinAction setInfo:](v16, "setInfo:", &stru_1002CE2A8);
    -[GKBulletin setDismissAction:](self, "setDismissAction:", v16);

  }
  -[GKBulletin setMessage:](self, "setMessage:", v10);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  -[GKBulletin setSoundPath:](self, "setSoundPath:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v17);

  -[GKBulletin setTitle:](self, "setTitle:", v18);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v14);
  -[GKBulletin setBulletinType:](self, "setBulletinType:", 1);

}

@end
