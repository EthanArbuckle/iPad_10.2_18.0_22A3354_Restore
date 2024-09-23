@implementation GKRealTimeMultiplayerSendBulletin

- (GKRealTimeMultiplayerSendBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerSendBulletin *v8;
  GKRealTimeMultiplayerSendBulletin *v9;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSNumber *sendReason;
  objc_super v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)GKRealTimeMultiplayerSendBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithPushNotification:](&v16, "initWithPushNotification:", v5);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerBulletin clientDictionary](v8, "clientDictionary"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundle-id")));
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("y")));
    sendReason = v9->_sendReason;
    v9->_sendReason = (NSNumber *)v13;

  }
  return v9;
}

- (GKRealTimeMultiplayerSendBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKRealTimeMultiplayerSendBulletin *v8;
  id v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  id v12;
  uint64_t v13;
  NSNumber *sendReason;
  objc_super v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithCoder:", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)GKRealTimeMultiplayerSendBulletin;
  v8 = -[GKRealTimeMultiplayerBulletin initWithCoder:](&v16, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("sendReason"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    sendReason = v8->_sendReason;
    v8->_sendReason = (NSNumber *)v13;

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
  objc_super v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin encodeWithCoder:", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKRealTimeMultiplayerSendBulletin;
  -[GKRealTimeMultiplayerBulletin encodeWithCoder:](&v10, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerSendBulletin bundleIdentifier](self, "bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("bundleIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRealTimeMultiplayerSendBulletin sendReason](self, "sendReason"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("sendReason"));

}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKRealTimeMultiplayerBulletin.m", 1180, "+[GKRealTimeMultiplayerSendBulletin loadBulletinsForPushNotification:withHandler:]"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014DCDC;
  v10[3] = &unk_1002BB758;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v7, v10);

}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSNumber)sendReason
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setSendReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendReason, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
