@implementation GKBulletin

+ (id)syncQueue
{
  if (qword_100318140 != -1)
    dispatch_once(&qword_100318140, &stru_1002C4AE0);
  return (id)qword_100318138;
}

+ (void)bulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKBulletin bulletinsForPushNotification: withHandler:", buf, 2u);
  }
  if (qword_100318150 != -1)
    dispatch_once(&qword_100318150, &stru_1002C4B00);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", GKPushCommandKey));
  v11 = objc_msgSend((id)qword_100318148, "objectForKeyedSubscript:", v10);
  v12 = objc_msgSend(v11, "shouldProcessNotification");
  if ((_DWORD)v12)
  {
    objc_msgSend(v11, "loadBulletinsForPushNotification:withHandler:", v5, v7);
  }
  else
  {
    if (!v11)
    {
      if (!os_log_GKGeneral)
        v13 = (id)GKOSLoggers(v12);
      v14 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PUSH FAILED: Invalid payload", v15, 2u);
      }
    }
    if (v7)
      v7[2](v7, 0);
  }

}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!os_log_GKGeneral)
    v10 = (id)GKOSLoggers(v8);
  v11 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_1001369C8(v11, (uint64_t)a1, a2);

}

- (GKBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKBulletin *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSString *recordID;
  id v14;
  uint64_t v15;
  NSString *title;
  id v17;
  uint64_t v18;
  NSString *message;
  id v20;
  uint64_t v21;
  NSDate *date;
  id v23;
  uint64_t v24;
  NSDate *expirationDate;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSString *soundPath;
  id v31;
  uint64_t v32;
  GKBulletinAction *acceptAction;
  id v34;
  uint64_t v35;
  GKBulletinAction *defaultAction;
  id v37;
  uint64_t v38;
  GKBulletinAction *dismissAction;
  id v40;
  uint64_t v41;
  GKBulletinAction *declineAction;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  NSString *gameName;
  id v48;
  uint64_t v49;
  NSURL *gameIcon;
  id v51;
  uint64_t v52;
  GKGameDescriptor *gameDescriptor;
  id v54;
  uint64_t v55;
  NSString *categoryIdentifier;
  uint64_t v57;
  NSSet *v58;
  void *v59;
  uint64_t v60;
  NSArray *attachments;
  objc_super v63;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin initWithCoder:", buf, 2u);
  }
  v63.receiver = self;
  v63.super_class = (Class)GKBulletin;
  v8 = -[GKBulletin init](&v63, "init");
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("pushCommand"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_pushCommand = (unsigned __int16)objc_msgSend(v10, "integerValue");

    v11 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("recordID"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    recordID = v8->_recordID;
    v8->_recordID = (NSString *)v12;

    v14 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("title"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    title = v8->_title;
    v8->_title = (NSString *)v15;

    v17 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("message"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    message = v8->_message;
    v8->_message = (NSString *)v18;

    v20 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("date"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    date = v8->_date;
    v8->_date = (NSDate *)v21;

    v23 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("expirationDate"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v24;

    v26 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("hasSound"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v8->_hasSound = objc_msgSend(v27, "BOOLValue");

    v28 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("soundPath"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    soundPath = v8->_soundPath;
    v8->_soundPath = (NSString *)v29;

    v31 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKBulletinAction), CFSTR("acceptAction"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    acceptAction = v8->_acceptAction;
    v8->_acceptAction = (GKBulletinAction *)v32;

    v34 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKBulletinAction), CFSTR("defaultAction"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    defaultAction = v8->_defaultAction;
    v8->_defaultAction = (GKBulletinAction *)v35;

    v37 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKBulletinAction), CFSTR("dismissAction"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    dismissAction = v8->_dismissAction;
    v8->_dismissAction = (GKBulletinAction *)v38;

    v40 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKBulletinAction), CFSTR("declineAction"));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    declineAction = v8->_declineAction;
    v8->_declineAction = (GKBulletinAction *)v41;

    v43 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("showInListOnly"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v8->_showInListOnly = objc_msgSend(v44, "BOOLValue");

    v45 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("gameName"));
    v46 = objc_claimAutoreleasedReturnValue(v45);
    gameName = v8->_gameName;
    v8->_gameName = (NSString *)v46;

    v48 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("gameIcon"));
    v49 = objc_claimAutoreleasedReturnValue(v48);
    gameIcon = v8->_gameIcon;
    v8->_gameIcon = (NSURL *)v49;

    v51 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKGameDescriptor), CFSTR("gameDescriptor"));
    v52 = objc_claimAutoreleasedReturnValue(v51);
    gameDescriptor = v8->_gameDescriptor;
    v8->_gameDescriptor = (GKGameDescriptor *)v52;

    v54 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("categoryIdentifier"));
    v55 = objc_claimAutoreleasedReturnValue(v54);
    categoryIdentifier = v8->_categoryIdentifier;
    v8->_categoryIdentifier = (NSString *)v55;

    v57 = objc_opt_class(NSArray);
    v58 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v57, objc_opt_class(GKBulletinAttachment), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v59, CFSTR("attachments")));
    attachments = v8->_attachments;
    v8->_attachments = (NSArray *)v60;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t v26[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin encodeWithCoder:", v26, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[GKBulletin pushCommand](self, "pushCommand")));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("pushCommand"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin recordID](self, "recordID"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("recordID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin title](self, "title"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("title"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("message"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin date](self, "date"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("date"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("expirationDate"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKBulletin hasSound](self, "hasSound")));
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("hasSound"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin soundPath](self, "soundPath"));
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("soundPath"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin acceptAction](self, "acceptAction"));
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("acceptAction"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin defaultAction](self, "defaultAction"));
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("defaultAction"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dismissAction](self, "dismissAction"));
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("dismissAction"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin declineAction](self, "declineAction"));
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("declineAction"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKBulletin showInListOnly](self, "showInListOnly")));
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("showInListOnly"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  objc_msgSend(v5, "encodeObject:forKey:", v21, CFSTR("gameName"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameIcon](self, "gameIcon"));
  objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("gameIcon"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", v23, CFSTR("gameDescriptor"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin categoryIdentifier](self, "categoryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", v24, CFSTR("categoryIdentifier"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin attachments](self, "attachments"));
  objc_msgSend(v5, "encodeObject:forKey:", v25, CFSTR("attachments"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dataFrom64String:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v9[16];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin dataFrom64String:", v9, 2u);
  }
  if (v4)
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v4, 0);
  else
    v7 = 0;

  return v7;
}

- (GKBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKBulletin *v8;
  void *v9;
  uint64_t v10;
  NSString *recordID;
  void *v12;
  objc_super v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin initWithPushNotification:", buf, 2u);
  }
  v14.receiver = self;
  v14.super_class = (Class)GKBulletin;
  v8 = -[GKBulletin init](&v14, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    recordID = v8->_recordID;
    v8->_recordID = (NSString *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", GKPushCommandKey));
    v8->_pushCommand = (unsigned __int16)objc_msgSend(v12, "integerValue");

    v8->_bulletinType = 0;
  }

  return v8;
}

+ (BOOL)shouldProcessNotification
{
  id v2;
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  uint8_t v7[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(a1);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletin shouldProcessNotification", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v5 = objc_msgSend(v4, "isGameCenterRestricted");

  return v5 ^ 1;
}

- (void)executeBulletinWithBulletinController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin executeBulletinWithBulletinController:", v8, 2u);
  }
  objc_msgSend(v5, "presentBulletin:", self);

}

+ (void)performAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin performAsync:", v9, 2u);
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syncQueue"));
  dispatch_async(v8, v5);

}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin handleAction:", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle action: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100135A98;
    v11[3] = &unk_1002C4B28;
    v11[4] = self;
    v12 = v5;
    -[GKBulletin launchBulletinWithCompletionHandler:](self, "launchBulletinWithCompletionHandler:", v11);

  }
  else
  {
    -[GKBulletin reportMetricsForActionID:withAdditionalFields:](self, "reportMetricsForActionID:withAdditionalFields:", v5, 0);
  }

}

- (void)launchBulletinWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  GKBulletinAction *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  GKBulletin *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(_QWORD, _QWORD);
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  GKBulletin *v38;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin launchBulletinWithCompletionHandler:", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Launching: %@", buf, 0xCu);
  }
  v11 = self->_acceptAction;
  if (!v11)
    v11 = self->_defaultAction;
  v12 = -[GKBulletinAction type](v11, "type");
  if (v12 == (id)2)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](v11, "info"));
    v24 = objc_msgSend(v23, "length");

    if (v24)
    {
      v36[0] = GKRemoteAlertDeeplinkActionPlayerProfileValue;
      v35[0] = GKRemoteAlertDeeplinkActionKey;
      v35[1] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](v11, "info"));
      v36[1] = v25;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));

    }
    else
    {
      v15 = 0;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:credential:](GKUtilityServicePrivate, "serviceWithTransport:forClient:credential:", 0, v31, 0));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameInternal createGamedGameInternal](GKGameInternal, "createGamedGameInternal"));
    objc_msgSend(v17, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v32, getpid(), v15, GKDashboardLaunchContextPushNotification);

    v5[2](v5, 0);
LABEL_32:

    goto LABEL_33;
  }
  if (v12 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction appLaunchTrampolineURL](v11, "appLaunchTrampolineURL"));

    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
      v16 = objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKUtilityServicePrivate, "serviceWithTransport:forClient:localPlayer:", 0, v15, 0));
      v17 = (void *)v16;
      if (!os_log_GKGeneral)
        v18 = (id)GKOSLoggers(v16);
      v19 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        v21 = (GKBulletin *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction appLaunchTrampolineURL](v11, "appLaunchTrampolineURL"));
        *(_DWORD *)buf = 138412290;
        v38 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Invoking AppLaunchTrampoline with URL: %@", buf, 0xCu);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction appLaunchTrampolineURL](v11, "appLaunchTrampolineURL"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100135F98;
      v33[3] = &unk_1002C4B50;
      v34 = v5;
      objc_msgSend(v17, "invokeASCAppLaunchTrampolineWithURL:handler:", v22, v33);

      goto LABEL_32;
    }
    if (!os_log_GKGeneral)
      v29 = (id)GKOSLoggers(v14);
    v30 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100136B08(v30);
  }
  else
  {
    if (!os_log_GKGeneral)
      v26 = (id)GKOSLoggers(v12);
    v27 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR))
      sub_100136A9C((uint64_t)v11, v27, v28);
  }
  v5[2](v5, 0);
LABEL_33:

}

- (NSString)metricsBundleID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  return (NSString *)v3;
}

- (void)reportMetricsForPresented
{
  -[GKBulletin reportMetricsWithEventType:additionalFields:](self, "reportMetricsWithEventType:additionalFields:", CFSTR("page"), 0);
}

- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v10 = CFSTR("actionType");
  v11 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_gkAddEntriesFrom:", v6));
  -[GKBulletin reportMetricsWithEventType:additionalFields:](self, "reportMetricsWithEventType:additionalFields:", CFSTR("click"), v9);

}

- (void)reportMetricsWithEventType:(id)a3 additionalFields:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[GKBulletin metricsBundleID](self, "metricsBundleID"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1002CE2A8;
  v15[0] = v7;
  v14[0] = CFSTR("eventType");
  v14[1] = CFSTR("pageId");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", -[GKBulletin pushCommand](self, "pushCommand")));
  v14[2] = CFSTR("pageType");
  v15[1] = v11;
  v15[2] = CFSTR("notification");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_gkAddEntriesFrom:", v6));
  -[GKBulletin reportMetricsWithHostAppBundleId:fields:](self, "reportMetricsWithHostAppBundleId:fields:", v10, v13);

}

- (void)reportMetricsWithHostAppBundleId:(id)a3 fields:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  objc_msgSend(v7, "reportClickStreamEventWithHostAppBundleId:metricsFields:", v6, v5);

}

- (id)updateNotificationCategories:(id)a3
{
  return 0;
}

+ (BOOL)playerIsLocal:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin playerIsLocal:", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allCredentialsForEnvironment:", objc_msgSend(v8, "currentEnvironment")));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "playerInternal", (_QWORD)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerID"));
        v16 = objc_msgSend(v15, "isEqualToString:", v4);

        if ((v16 & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v11;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)GKBulletin;
  v3 = -[GKBulletin description](&v20, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin recordID](self, "recordID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin date](self, "date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  v5 = CFSTR("NO");
  if (-[GKBulletin hasSound](self, "hasSound"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin soundPath](self, "soundPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin defaultAction](self, "defaultAction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin acceptAction](self, "acceptAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dismissAction](self, "dismissAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin declineAction](self, "declineAction"));
  if (-[GKBulletin showInListOnly](self, "showInListOnly"))
    v5 = CFSTR("YES");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin categoryIdentifier](self, "categoryIdentifier"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("\nrecordID:%@\ntitle:%@\nmessage:%@\ndate:%@\nexpirationDate:%@\nhasSound:%@\nsoundPath:%@\ndefaultAction:%@\nacceptAction:%@\ndismissAction:%@\ndeclineAction:%@\nshowInListOnly:%@\ncategoryIdentifier:%@"), v18, v17, v4, v16, v15, v6, v7, v8, v9, v10, v11, v5, v12));

  return v14;
}

- (signed)pushCommand
{
  return self->_pushCommand;
}

- (void)setPushCommand:(signed __int16)a3
{
  self->_pushCommand = a3;
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)hasSound
{
  return self->_hasSound;
}

- (void)setHasSound:(BOOL)a3
{
  self->_hasSound = a3;
}

- (NSString)soundPath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSoundPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (GKBulletinAction)acceptAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAcceptAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (GKBulletinAction)defaultAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDefaultAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (GKBulletinAction)dismissAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDismissAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (GKBulletinAction)declineAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeclineAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (GKBulletinAction)viewAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 112, 1);
}

- (void)setViewAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)showInListOnly
{
  return self->_showInListOnly;
}

- (void)setShowInListOnly:(BOOL)a3
{
  self->_showInListOnly = a3;
}

- (NSString)gameName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setGameName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSURL)gameIcon
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setGameIcon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (GKGameDescriptor)gameDescriptor
{
  return (GKGameDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGameDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (unint64_t)bulletinType
{
  return self->_bulletinType;
}

- (void)setBulletinType:(unint64_t)a3
{
  self->_bulletinType = a3;
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_gameIcon, 0);
  objc_storeStrong((id *)&self->_gameName, 0);
  objc_storeStrong((id *)&self->_viewAction, 0);
  objc_storeStrong((id *)&self->_declineAction, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_acceptAction, 0);
  objc_storeStrong((id *)&self->_soundPath, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_gameDescriptor, 0);
}

+ (id)cacheTransactionGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSystemBulletin.m", 56, "+[GKBulletin(CacheTransactionGroup) cacheTransactionGroup]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pushCredentialForEnvironment:", objc_msgSend(v2, "environment")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerInternal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transactionGroupWithName:forPlayerID:", v3, v7));

  return v8;
}

@end
