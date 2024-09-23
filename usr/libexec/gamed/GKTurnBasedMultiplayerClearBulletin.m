@implementation GKTurnBasedMultiplayerClearBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  GKTurnBasedMultiplayerClearBulletin *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin loadBulletinsForPushNotification: withHandler:", v14, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v10, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountTurnBasedClear);

  v11 = objc_alloc_init(GKTurnBasedMultiplayerClearBulletin);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedMultiplayerBulletin matchID](v11, "matchID"));
  objc_msgSend(v12, "clearTurnBasedBulletinsForMatchID:", v13);

  if (v7)
    v7[2](v7, 0);

}

- (GKTurnBasedMultiplayerClearBulletin)initWithPushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKTurnBasedMultiplayerClearBulletin *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin initWithPushNotification:", buf, 2u);
  }
  v14.receiver = self;
  v14.super_class = (Class)GKTurnBasedMultiplayerClearBulletin;
  v8 = -[GKTurnBasedMultiplayerBulletin initWithPushNotification:](&v14, "initWithPushNotification:", v5);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("cc")));
    v10 = objc_msgSend(v9, "integerValue");

    v11 = 3;
    if (v10 != (id)81)
      v11 = 0;
    if (v10 == (id)80)
      v12 = 2;
    else
      v12 = v11;
    -[GKTurnBasedMultiplayerClearBulletin setClearType:](v8, "setClearType:", v12);
  }

  return v8;
}

- (GKTurnBasedMultiplayerClearBulletin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKTurnBasedMultiplayerClearBulletin *v8;
  id v9;
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin initWithCoder:", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKTurnBasedMultiplayerClearBulletin;
  v8 = -[GKTurnBasedMultiplayerBulletin initWithCoder:](&v12, "initWithCoder:", v5);
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("clearType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_clearType = (int64_t)objc_msgSend(v10, "integerValue");

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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin encodeWithCoder:", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKTurnBasedMultiplayerClearBulletin;
  -[GKTurnBasedMultiplayerBulletin encodeWithCoder:](&v9, "encodeWithCoder:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKTurnBasedMultiplayerClearBulletin clearType](self, "clearType")));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("clearType"));

}

- (int64_t)clearType
{
  return self->_clearType;
}

- (void)setClearType:(int64_t)a3
{
  self->_clearType = a3;
}

@end
