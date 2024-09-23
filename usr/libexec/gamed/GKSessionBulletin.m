@implementation GKSessionBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)displayNotification
{
  return 1;
}

- (void)determineGameLocationOnDeviceOrInStoreWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSessionBulletin.m", 89, "-[GKSessionBulletin determineGameLocationOnDeviceOrInStoreWithCompletionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100152E9C;
  v16[3] = &unk_1002BB590;
  v16[4] = self;
  v10 = v9;
  v17 = v10;
  objc_msgSend(v10, "perform:", v16);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100153524;
  v13[3] = &unk_1002BB450;
  v14 = v10;
  v15 = v5;
  v11 = v10;
  v12 = v5;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v13);

}

- (void)loadDataWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin loadDataWithHandler:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKSessionBulletin.m", 152, "-[GKSessionBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100153714;
  v16[3] = &unk_1002BB590;
  v16[4] = self;
  v10 = v9;
  v17 = v10;
  objc_msgSend(v10, "perform:", v16);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100153870;
  v13[3] = &unk_1002BB450;
  v14 = v10;
  v15 = v5;
  v11 = v10;
  v12 = v5;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v13);

}

- (GKSessionBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKSessionBulletin *v8;
  uint64_t v9;
  NSString *cloudContainer;
  void *v11;
  uint64_t v12;
  NSDictionary *localizableMessage;
  uint64_t v14;
  NSString *senderID;
  uint64_t v16;
  NSData *data;
  uint64_t v18;
  GKCloudPlayer *sender;
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
  v21.super_class = (Class)GKSessionBulletin;
  v8 = -[GKMultiplayerBulletin initWithPushNotification:](&v21, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushCloudContainer));
    cloudContainer = v8->_cloudContainer;
    v8->_cloudContainer = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushOriginatingDeviceType));
    v8->_originatingDeviceType = (int)objc_msgSend(v11, "intValue");

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushLocalizableMessage));
    localizableMessage = v8->_localizableMessage;
    v8->_localizableMessage = (NSDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushSenderID));
    senderID = v8->_senderID;
    v8->_senderID = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushData));
    data = v8->_data;
    v8->_data = (NSData *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", GKSessionPushSenderName));
    sender = v8->_sender;
    v8->_sender = (GKCloudPlayer *)v18;

  }
  return v8;
}

- (GKSessionBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKSessionBulletin *v8;
  id v9;
  uint64_t v10;
  NSString *cloudContainer;
  id v12;
  uint64_t v13;
  NSDictionary *localizableMessage;
  id v15;
  uint64_t v16;
  NSString *senderID;
  id v18;
  uint64_t v19;
  GKCloudPlayer *sender;
  id v21;
  uint64_t v22;
  NSData *data;
  objc_super v25;
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
  v25.receiver = self;
  v25.super_class = (Class)GKSessionBulletin;
  v8 = -[GKGameplayBulletin initWithCoder:](&v25, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("cloudContainer"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    cloudContainer = v8->_cloudContainer;
    v8->_cloudContainer = (NSString *)v10;

    v8->_originatingDeviceType = (int64_t)objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("originatingDeviceType"));
    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("localizableMessage"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    localizableMessage = v8->_localizableMessage;
    v8->_localizableMessage = (NSDictionary *)v13;

    v15 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("senderID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    senderID = v8->_senderID;
    v8->_senderID = (NSString *)v16;

    v18 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(GKCloudPlayer), CFSTR("sender"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    sender = v8->_sender;
    v8->_sender = (GKCloudPlayer *)v19;

    v21 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("data"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    data = v8->_data;
    v8->_data = (NSData *)v22;

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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKSessionBulletin encodeWithCoder:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKSessionBulletin;
  -[GKGameplayBulletin encodeWithCoder:](&v13, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin cloudContainer](self, "cloudContainer"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("cloudContainer"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[GKSessionBulletin originatingDeviceType](self, "originatingDeviceType"), CFSTR("originatingDeviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin localizableMessage](self, "localizableMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("localizableMessage"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin senderID](self, "senderID"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("senderID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin sender](self, "sender"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("sender"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin data](self, "data"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("data"));

}

- (void)localizeMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin localizableMessage](self, "localizableMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkLocalizedMessageFromDictionary:forBundleID:](NSBundle, "_gkLocalizedMessageFromDictionary:forBundleID:", v6, v4));
  -[GKSessionBulletin setLocalizedMessage:](self, "setLocalizedMessage:", v5);

}

- (void)assembleBulletin
{
  id v3;
  NSObject *v4;
  GKBulletinAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString **v11;
  GKBulletinAction *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKSessionBulletin assembleBulletin", v22, 2u);
  }
  v5 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v5, "setType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));
  -[GKBulletinAction setAdamID:](v5, "setAdamID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  -[GKBulletinAction setBundleID:](v5, "setBundleID:", v9);

  if (-[GKGameplayBulletin gameLocation](self, "gameLocation") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings APP_STORE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "APP_STORE"));
    v11 = &GKNotificationCategoryActionsAppStoreClose;
  }
  else
  {
    if (-[GKGameplayBulletin gameLocation](self, "gameLocation") != 1)
      goto LABEL_10;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings PLAY_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "PLAY_BUTTON_TITLE"));
    v11 = &GKNotificationCategoryActionsPlayClose;
  }
  -[GKBulletinAction setTitle:](v5, "setTitle:", v10);

  -[GKBulletin setCategoryIdentifier:](self, "setCategoryIdentifier:", *v11);
LABEL_10:
  v12 = objc_alloc_init(GKBulletinAction);
  -[GKBulletinAction setType:](v12, "setType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings CLOSE_TURN_BASED_ALERT_BUTTON_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CLOSE_TURN_BASED_ALERT_BUTTON_TITLE"));
  -[GKBulletinAction setTitle:](v12, "setTitle:", v13);

  -[GKBulletinAction setInfo:](v12, "setInfo:", &stru_1002CE2A8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin assembledMessage](self, "assembledMessage"));
  -[GKBulletin setMessage:](self, "setMessage:", v14);

  -[GKBulletin setHasSound:](self, "setHasSound:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerBulletin customInviteSoundPathForBundleID:](self, "customInviteSoundPathForBundleID:", v16));
  -[GKBulletin setSoundPath:](self, "setSoundPath:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[GKBulletin setDate:](self, "setDate:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GCFLocalizedStrings SESSION_MESSAGE_NOTIFICATION_TITLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SESSION_MESSAGE_NOTIFICATION_TITLE"));
  -[GKBulletin setTitle:](self, "setTitle:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2592000.0));
    -[GKBulletin setExpirationDate:](self, "setExpirationDate:", v21);

  }
  -[GKBulletin setDefaultAction:](self, "setDefaultAction:", v5);
  -[GKBulletin setDismissAction:](self, "setDismissAction:", v12);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKSessionBulletin;
  v3 = -[GKBulletin description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin cloudContainer](self, "cloudContainer"));
  v6 = -[GKSessionBulletin originatingDeviceType](self, "originatingDeviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin localizableMessage](self, "localizableMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionBulletin sender](self, "sender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("cloudContainer:%@ originatingDeviceType:%ld localizableMessage:%@ sender:%@"), v5, v6, v7, v8));

  return v9;
}

- (NSString)cloudContainer
{
  return self->_cloudContainer;
}

- (void)setCloudContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContainer, a3);
}

- (GKGameDescriptor)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (int64_t)originatingDeviceType
{
  return self->_originatingDeviceType;
}

- (void)setOriginatingDeviceType:(int64_t)a3
{
  self->_originatingDeviceType = a3;
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizableMessage, a3);
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
  objc_storeStrong((id *)&self->_senderID, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizedMessage, a3);
}

- (NSString)assembledMessage
{
  return self->_assembledMessage;
}

- (GKCloudGameSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (GKCloudPlayer)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSString)aggregateDictionaryKey
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateDictionaryKey, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_assembledMessage, 0);
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_cloudContainer, 0);
}

@end
