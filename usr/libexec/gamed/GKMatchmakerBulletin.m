@implementation GKMatchmakerBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  _BOOL8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  GKMatchmakerBulletin *v16;
  id v17;
  NSObject *v18;
  int v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  v10 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v10)
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKMatchmakerBulletin loadBulletinsForPushNotification: withHandler:", (uint8_t *)&v19, 2u);
  }
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v10);
  v12 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "didReceiveMatchmakingPush: %@", (uint8_t *)&v19, 0xCu);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v13, "reportEvent:type:", GKReporterDomainPushCount, GKReporterPushCountMatchmaking);

  v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", GKMatchmakerMatchRID));
  if (v15)
  {
    v16 = objc_alloc_init(GKMatchmakerBulletin);
    -[GKMatchmakerBulletin setMatchID:](v16, "setMatchID:", v15);
    -[GKBulletin setBulletinType:](v16, "setBulletinType:", 1200);
    objc_msgSend(v14, "addObject:", v16);

  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(0);
    v18 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKMatchmakerBulletin - matchmaking push missing match-rid, did not create bulletin.", (uint8_t *)&v19, 2u);
    }
  }
  if (v7)
    ((void (**)(_QWORD, id))v7)[2](v7, v14);

}

- (void)executeBulletinWithBulletinController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;
  uint8_t v17[4];
  void *v18;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKMatchmakerBulletin executeBulletinWithBulletinController:", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100139F7C;
  v12[3] = &unk_1002BB710;
  v12[4] = self;
  v12[5] = buf;
  v8 = +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v12);
  if (!v14[24])
  {
    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(v8);
    v10 = os_log_GKMatch;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKMatchmakerBulletin matchID](self, "matchID"));
      *(_DWORD *)v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "matchmaking push:%@ for unknown rid", v17, 0xCu);

    }
  }
  _Block_object_dispose(buf, 8);

}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
  objc_storeStrong((id *)&self->_matchID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchID, 0);
}

@end
