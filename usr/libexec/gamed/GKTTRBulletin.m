@implementation GKTTRBulletin

+ (id)packFakeTTRBulletinWithInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t v14[16];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTTRBulletin: packFakeTTRBulletinWithInfo", v14, 2u);
  }
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = GKTTRBulletinKeyType;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKTTRBulletinKeyType));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  v10 = GKTTRBulletinKeyURL;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKTTRBulletinKeyURL));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v10);

  v12 = objc_msgSend(v7, "copy");
  return v12;
}

- (GKTTRBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKTTRBulletin *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTTRBulletin: packFakeTTRBulletinWithInfo: %@", buf, 0xCu);
  }
  v14.receiver = self;
  v14.super_class = (Class)GKTTRBulletin;
  v8 = -[GKBulletin initWithPushNotification:](&v14, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeySubtitle));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Internal Only] %@"), v9));
    -[GKBulletin setMessage:](v8, "setMessage:", v10);

    -[GKBulletin setTitle:](v8, "setTitle:", CFSTR("Game Center Tap-to-Radar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeyType));
    -[GKTTRBulletin setTtrBulletinType:](v8, "setTtrBulletinType:", objc_msgSend(v11, "integerValue"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKTTRBulletinKeyURL));
    -[GKTTRBulletin setTtrURLString:](v8, "setTtrURLString:", v12);

  }
  return v8;
}

- (void)assembleBulletin
{
  id v3;
  NSObject *v4;
  GKBulletinAction *v5;
  void *v6;
  GKBulletinAction *v7;
  GKBulletinAction *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKTTRBulletin: assembleBulletin", v11, 2u);
  }
  v5 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKTTRBulletin ttrURLString](self, "ttrURLString"));
  -[GKBulletinAction setInfo:](v5, "setInfo:", v6);

  v7 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v7, "setType:", 0);
  -[GKBulletinAction setInfo:](v7, "setInfo:", &stru_1002CE2A8);
  -[GKBulletinAction setInAlertView:](v7, "setInAlertView:", 0);
  -[GKBulletinAction setIsDestructive:](v7, "setIsDestructive:", 1);
  v8 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v8, "setType:", 0);
  -[GKBulletinAction setInfo:](v8, "setInfo:", &stru_1002CE2A8);
  -[GKBulletinAction setIsDestructive:](v8, "setIsDestructive:", 1);
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDeclineAction:](self, "setDeclineAction:", v7);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v8);
  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 7200.0));
  -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v10);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 2);
}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTTRBulletin: handleAction", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)GKTTRBulletin;
  -[GKBulletin handleAction:](&v19, "handleAction:", v5);
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0
    || (v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")), (v8 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKTTRBulletin ttrURLString](self, "ttrURLString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

    if (v10)
    {
      if (!os_log_GKGeneral)
        v12 = (id)GKOSLoggers(v11);
      v13 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TTRBulletin opening URL: %@", buf, 0xCu);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v14, "openURL:", v10);

    }
    else
    {
      if (!os_log_GKGeneral)
        v15 = (id)GKOSLoggers(v11);
      v16 = (void *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000D7CD0(v16, self);
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(v8);
    v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Refused to upload sysdiagnose", buf, 2u);
    }
  }

}

- (int64_t)ttrBulletinType
{
  return self->_ttrBulletinType;
}

- (void)setTtrBulletinType:(int64_t)a3
{
  self->_ttrBulletinType = a3;
}

- (NSString)ttrURLString
{
  return self->_ttrURLString;
}

- (void)setTtrURLString:(id)a3
{
  objc_storeStrong((id *)&self->_ttrURLString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrURLString, 0);
}

@end
