@implementation GKSessionInviteBulletin

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSessionBulletin.m", 281, "+[GKSessionInviteBulletin loadBulletinsForPushNotification:withHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001545AC;
  v11[3] = &unk_1002C0B88;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

- (GKSessionInviteBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKSessionInviteBulletin *v8;
  uint64_t v9;
  NSString *senderName;
  uint64_t v11;
  NSString *userMessage;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSURL *sessionURL;
  uint64_t v18;
  NSURL *v19;
  objc_super v21;
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
  v21.receiver = self;
  v21.super_class = (Class)GKSessionInviteBulletin;
  v8 = -[GKSessionBulletin initWithPushNotification:](&v21, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushSenderName));
    senderName = v8->_senderName;
    v8->_senderName = (NSString *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushUserMessage));
    userMessage = v8->_userMessage;
    v8->_userMessage = (NSString *)v11;

    v13 = GKSessionPushShareURL;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushShareURL));
    v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("#"));
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13));
      sessionURL = v8->_sessionURL;
      v8->_sessionURL = (NSURL *)v16;
    }
    else
    {
      sessionURL = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", v15));
      v18 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", sessionURL));
      v19 = v8->_sessionURL;
      v8->_sessionURL = (NSURL *)v18;

    }
  }

  return v8;
}

- (GKSessionInviteBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKSessionInviteBulletin *v8;
  id v9;
  uint64_t v10;
  NSURL *sessionURL;
  id v12;
  uint64_t v13;
  NSString *userMessage;
  id v15;
  uint64_t v16;
  NSString *senderName;
  objc_super v19;
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
  v19.receiver = self;
  v19.super_class = (Class)GKSessionInviteBulletin;
  v8 = -[GKSessionBulletin initWithCoder:](&v19, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("sessionURL"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    sessionURL = v8->_sessionURL;
    v8->_sessionURL = (NSURL *)v10;

    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("userMessage"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    userMessage = v8->_userMessage;
    v8->_userMessage = (NSString *)v13;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("senderName"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    senderName = v8->_senderName;
    v8->_senderName = (NSString *)v16;

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
  objc_super v11;
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
  v11.receiver = self;
  v11.super_class = (Class)GKSessionInviteBulletin;
  -[GKSessionBulletin encodeWithCoder:](&v11, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionInviteBulletin sessionURL](self, "sessionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("sessionURL"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionInviteBulletin userMessage](self, "userMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("userMessage"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionInviteBulletin senderName](self, "senderName"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("senderName"));

}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountSessionsInvite;
}

- (id)assembledMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionInviteBulletin userMessage](self, "userMessage"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_NOTIFICATION_1_INVITER_2_GAME_3_MESSAGE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_NOTIFICATION_1_INVITER_2_GAME_3_MESSAGE_FORMAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin sender](self, "sender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionInviteBulletin userMessage](self, "userMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5, v6, v7));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_NOTIFICATION_1_INVITER_2_GAME_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_NOTIFICATION_1_INVITER_2_GAME_FORMAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin sender](self, "sender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5, v6));
  }

  return v8;
}

- (void)handleAcceptAction
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKSessionBulletin handleAcceptAction", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionInviteBulletin sessionURL](self, "sessionURL"));
  +[GKCloudGameSession acceptShareURL:handler:](GKCloudGameSession, "acceptShareURL:handler:", v5, &stru_1002C4F60);

}

- (void)handleAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin handleAction:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKSessionInviteBulletin;
  v8 = -[GKBulletin handleAction:](&v11, "handleAction:", v5);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle turn based action: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GKAccepted")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("GKDefault")))
  {
    -[GKSessionInviteBulletin handleAcceptAction](self, "handleAcceptAction");
  }

}

- (void)assembleBulletin
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKSessionInviteBulletin;
  -[GKSessionBulletin assembleBulletin](&v4, "assembleBulletin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_INVITE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_INVITE_NOTIFICATION_TITLE"));
  -[GKBulletin setTitle:](self, "setTitle:", v3);

  -[GKBulletin setBulletinType:](self, "setBulletinType:", 1400);
}

- (NSURL)sessionURL
{
  return self->_sessionURL;
}

- (void)setSessionURL:(id)a3
{
  objc_storeStrong((id *)&self->_sessionURL, a3);
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_storeStrong((id *)&self->_senderName, a3);
}

- (NSString)userMessage
{
  return self->_userMessage;
}

- (void)setUserMessage:(id)a3
{
  objc_storeStrong((id *)&self->_userMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_sessionURL, 0);
}

@end
