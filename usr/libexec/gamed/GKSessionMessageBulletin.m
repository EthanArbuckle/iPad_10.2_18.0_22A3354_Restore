@implementation GKSessionMessageBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSessionBulletin.m", 424, "+[GKSessionMessageBulletin loadBulletinsForPushNotification:withHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001554DC;
  v11[3] = &unk_1002C0B88;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

- (void)loadSessionWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin loadSessionWithIdentifier: handler:", buf, 2u);
  }
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionMessageBulletin sessionIdentifier](self, "sessionIdentifier"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100155CD0;
    v12[3] = &unk_1002BE560;
    v12[4] = self;
    v13 = v5;
    +[GKCloudGameSession sessionForIdentifier:handler:](GKCloudGameSession, "sessionForIdentifier:handler:", v9, v12);

  }
  else
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v8);
    v11 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1001566A8(v11);
  }

}

- (GKSessionMessageBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKSessionMessageBulletin *v8;
  uint64_t v9;
  NSString *sessionIdentifier;
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin initWithPushNotification:", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKSessionMessageBulletin;
  v8 = -[GKSessionBulletin initWithPushNotification:](&v12, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushSessionIdentifier));
    sessionIdentifier = v8->_sessionIdentifier;
    v8->_sessionIdentifier = (NSString *)v9;

  }
  return v8;
}

- (GKSessionMessageBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKSessionMessageBulletin *v8;
  id v9;
  uint64_t v10;
  NSString *sessionIdentifier;
  objc_super v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin initWithCoder:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKSessionMessageBulletin;
  v8 = -[GKSessionBulletin initWithCoder:](&v13, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("sessionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    sessionIdentifier = v8->_sessionIdentifier;
    v8->_sessionIdentifier = (NSString *)v10;

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
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin encodeWithCoder:", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKSessionMessageBulletin;
  -[GKSessionBulletin encodeWithCoder:](&v9, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionMessageBulletin sessionIdentifier](self, "sessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("sessionIdentifier"));

}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountSessionsMessage;
}

- (void)distributeData
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKSessionMessageBulletin distributeData", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin session](self, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerName"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001561A8;
  v7[3] = &unk_1002C4F88;
  v7[4] = self;
  +[GKCloudGameSession bundleIDsForContainerName:handler:](GKCloudGameSession, "bundleIDsForContainerName:handler:", v6, v7);

}

- (id)assembledMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin session](self, "session"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_MESSAGE_NOTIFICATION_1_SESSION_2_GAME_3_GAME_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_MESSAGE_NOTIFICATION_1_SESSION_2_GAME_3_GAME_MESSAGE_FORMAT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin session](self, "session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin localizedMessage](self, "localizedMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7, v8, v9));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_MESSAGE_NOTIFICATION_1_GAME_2_GAME_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_MESSAGE_NOTIFICATION_1_GAME_2_GAME_MESSAGE_FORMAT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin localizedMessage](self, "localizedMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6, v7));
  }

  return v10;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
