@implementation GKGameSessionService

- (BOOL)requiresAuthentication
{
  return 0;
}

+ (unint64_t)requiredEntitlements
{
  return 128;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKGameSessionServiceInterface, a2);
}

- (id)validateContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.developer.icloud-container-identifiers")));

  if (v4)
  {
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) == 0)
    {

      v4 = 0;
    }
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  }

  return v4;
}

- (void)reportMetricsWithActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalBundleIdentifier"));
  v9[0] = CFSTR("eventType");
  v9[1] = CFSTR("actionType");
  v10[0] = CFSTR("session");
  v10[1] = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  objc_msgSend(v5, "reportClickStreamEventWithHostAppBundleId:metricsFields:", v7, v8);
}

- (void)primaryPlayerInContainer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameSessionService validateContainer:](self, "validateContainer:", v6));

    if (v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100052BC8;
      v10[3] = &unk_1002BE538;
      v6 = v8;
      v11 = v6;
      v12 = v7;
      +[GKCloudGameSession primaryPlayerWithHandler:](GKCloudGameSession, "primaryPlayerWithHandler:", v10);

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 12, 0));
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

      v6 = 0;
    }
  }

}

- (void)createSessionInContainer:(id)a3 withTitle:(id)a4 maxConnectedPlayers:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __objc2_meth_list *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v10 = a4;
  v11 = a6;
  v12 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("createSession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("createSessionInContainer")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameSessionService validateContainer:](self, "validateContainer:", v12));

  v15 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleIdentifier"));
    v18 = +[GKCloudGameSession isCloudDriveEnabledForBundleID:](GKCloudGameSession, "isCloudDriveEnabledForBundleID:", v17);

    if (v18)
    {
      v28[0] = _NSConcreteStackBlock;
      v15 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
      v28[1] = 3221225472;
      v28[2] = sub_100052EE4;
      v28[3] = &unk_1002BCDE0;
      v29 = v14;
      v30 = v10;
      v32 = a5;
      v31 = v13;
      objc_msgSend(v31, "perform:", v28);

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 15, 0));
      objc_msgSend(v13, "setError:", v20);

      v15 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 12, 0));
    objc_msgSend(v13, "setError:", v19);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = v15[254];
  v25[2] = sub_10005300C;
  v25[3] = &unk_1002BB450;
  v26 = v13;
  v27 = v11;
  v23 = v13;
  v24 = v11;
  objc_msgSend(v23, "notifyOnQueue:block:", v22, v25);

}

- (void)loadSessionsInContainer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a4;
  v7 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("loadInContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("loadSessionsInContainer")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameSessionService validateContainer:](self, "validateContainer:", v7));

  if (v9)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100053240;
    v18[3] = &unk_1002BB590;
    v19 = v9;
    v20 = v8;
    objc_msgSend(v20, "perform:", v18);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 12, 0));
    objc_msgSend(v8, "setError:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100053354;
  v15[3] = &unk_1002BB450;
  v16 = v8;
  v17 = v6;
  v13 = v8;
  v14 = v6;
  objc_msgSend(v13, "notifyOnQueue:block:", v12, v15);

}

- (void)loadSessionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("loadSession"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100053574;
  v9[3] = &unk_1002BE588;
  v10 = v6;
  v8 = v6;
  +[GKCloudGameSession sessionForIdentifier:handler:](GKCloudGameSession, "sessionForIdentifier:handler:", v7, v9);

}

- (void)removeSessionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("removeSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("removeSession")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
  v11 = +[GKCloudGameSession isCloudDriveEnabledForBundleID:](GKCloudGameSession, "isCloudDriveEnabledForBundleID:", v10);

  if (v11)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000537F4;
    v20[3] = &unk_1002BB590;
    v21 = v6;
    v22 = v8;
    objc_msgSend(v22, "perform:", v20);

  }
  else if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", 15, 0));
    objc_msgSend(v8, "setError:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000538C4;
  v17[3] = &unk_1002BB450;
  v18 = v8;
  v19 = v7;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v15, "notifyOnQueue:block:", v14, v17);

}

- (void)removePlayers:(id)a3 forSessionWithIdentifier:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000539D4;
  v9[3] = &unk_1002BE5B0;
  v9[4] = self;
  v10 = a3;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  +[GKCloudGameSession sessionForIdentifier:handler:](GKCloudGameSession, "sessionForIdentifier:handler:", a4, v9);

}

- (void)loadDataForSessionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("loadData"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100053C14;
  v9[3] = &unk_1002BE588;
  v10 = v6;
  v8 = v6;
  +[GKCloudGameSession sessionForIdentifier:handler:](GKCloudGameSession, "sessionForIdentifier:handler:", v7, v9);

}

- (void)saveData:(id)a3 forSessionWithIdentifier:(id)a4 changeTag:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("saveData"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100053E78;
  v25[3] = &unk_1002BC3A8;
  v26 = v11;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveData")));
  v27 = v14;
  v28 = v10;
  v29 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v14, "perform:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000541A0;
  v22[3] = &unk_1002BB450;
  v23 = v14;
  v24 = v13;
  v20 = v14;
  v21 = v13;
  objc_msgSend(v20, "notifyOnQueue:block:", v19, v22);

}

- (void)setConnectionState:(int64_t)a3 forSessionWithIdentifier:(id)a4 handler:(id)a5
{
  -[GKGameSessionService _setConnectionState:forSessionWithIdentifier:handler:](self, "_setConnectionState:forSessionWithIdentifier:handler:", 2 * (a3 == 1), a4, a5);
}

- (void)_setConnectionState:(int64_t)a3 forSessionWithIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  GKGameSessionService *v22;
  id v23;
  id v24;
  int64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v8 = a4;
  v9 = a5;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10005443C;
  v32[3] = &unk_1002BBB70;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("setConnectionStateForSession")));
  v33 = v10;
  objc_msgSend(v10, "perform:", v32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100054588;
  v29[3] = &unk_1002BB590;
  v11 = v8;
  v30 = v11;
  v12 = v10;
  v31 = v12;
  objc_msgSend(v12, "perform:", v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100054714;
  v26[3] = &unk_1002BB590;
  v13 = v11;
  v27 = v13;
  v14 = v12;
  v28 = v14;
  objc_msgSend(v14, "perform:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100054818;
  v20[3] = &unk_1002BE6F0;
  v24 = v9;
  v25 = a3;
  v21 = v14;
  v22 = self;
  v23 = v13;
  v17 = v13;
  v18 = v9;
  v19 = v14;
  objc_msgSend(v19, "notifyOnQueue:block:", v16, v20);

}

- (void)didSaveConnectionState:(int64_t)a3 forGameSession:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  GKGameSessionService *v22;
  id v23;
  id v24;
  int64_t v25;
  _QWORD v26[4];
  id v27;
  GKGameSessionService *v28;
  id v29;
  _QWORD v30[5];
  id v31;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("didSaveConnectionStateForGameSession")));
  v11 = v10;
  if (a3 == 2)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100054F9C;
    v26[3] = &unk_1002BB4A0;
    v27 = v8;
    v28 = self;
    v29 = v11;
    objc_msgSend(v29, "perform:", v26);

    v12 = v27;
    goto LABEL_6;
  }
  if (a3 != 1)
  {
    if (!a3)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100054EA4;
      v30[3] = &unk_1002BB590;
      v30[4] = self;
      v31 = v10;
      objc_msgSend(v31, "perform:", v30);
      v12 = v31;
LABEL_6:

      goto LABEL_11;
    }
    if (!os_log_GKGeneral)
      v13 = (id)GKOSLoggers(v10);
    v14 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100057518(a3, v14);
  }
LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005509C;
  v20[3] = &unk_1002BE6A0;
  v24 = v9;
  v25 = a3;
  v21 = v11;
  v22 = self;
  v23 = v8;
  v17 = v9;
  v18 = v8;
  v19 = v11;
  objc_msgSend(v19, "notifyOnQueue:block:", v16, v20);

}

- (void)sendData:(id)a3 reliably:(BOOL)a4 forSessionWithIdentifier:(id)a5 shouldReportMetrics:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = a6;
  v10 = a4;
  v15 = a3;
  v12 = a5;
  v13 = a7;
  if (v8)
    -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("sendData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKConnectionManager sharedManager](GKConnectionManager, "sharedManager"));
  objc_msgSend(v14, "sendData:reliably:forGameSessionWithIdentifier:handler:", v15, v10, v12, v13);

}

- (void)fetchShareURLForSessionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("fetchShareURL"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100055424;
  v9[3] = &unk_1002BE588;
  v10 = v6;
  v8 = v6;
  +[GKCloudGameSession sessionForIdentifier:handler:](GKCloudGameSession, "sessionForIdentifier:handler:", v7, v9);

}

- (void)setBadged:(BOOL)a3 forPlayerIDs:(id)a4 forSessionWithIdentifier:(id)a5 handler:(id)a6
{
  -[GKGameSessionService setBadged:forPlayerIDs:forSessionWithIdentifier:shouldReportMetrics:handler:](self, "setBadged:forPlayerIDs:forSessionWithIdentifier:shouldReportMetrics:handler:", a3, a4, a5, 1, a6);
}

- (void)setBadged:(BOOL)a3 forPlayerIDs:(id)a4 forSessionWithIdentifier:(id)a5 shouldReportMetrics:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  GKGameSessionService *v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v8)
    -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("setBadged"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("setBadgesForSession")));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100055754;
  v31[3] = &unk_1002BB590;
  v16 = v13;
  v32 = v16;
  v17 = v15;
  v33 = v17;
  objc_msgSend(v17, "perform:", v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100055898;
  v24[3] = &unk_1002BBC78;
  v25 = v17;
  v26 = self;
  v30 = a3;
  v27 = v12;
  v28 = v16;
  v29 = v14;
  v20 = v14;
  v21 = v16;
  v22 = v12;
  v23 = v17;
  objc_msgSend(v23, "notifyOnQueue:block:", v19, v24);

}

- (void)sendMessageForSessionWithID:(id)a3 withLocalizedFormatKey:(id)a4 arguments:(id)a5 userMessage:(id)a6 data:(id)a7 recipientIDs:(id)a8 badgePlayers:(BOOL)a9 shouldReportMetrics:(BOOL)a10 handler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  GKGameSessionService *v43;
  id v44;
  BOOL v45;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a11;
  if (a10)
    -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("sendMessage"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100055F88;
  v40[3] = &unk_1002BD050;
  v41 = v17;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("sendMessageForSession")));
  v42 = v24;
  v43 = self;
  v44 = v22;
  v45 = a9;
  v25 = v22;
  v26 = v17;
  objc_msgSend(v24, "perform:", v40);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100056544;
  v33[3] = &unk_1002BE880;
  v34 = v24;
  v35 = v18;
  v36 = v19;
  v37 = v20;
  v38 = v21;
  v39 = v23;
  v27 = v23;
  v28 = v21;
  v29 = v20;
  v30 = v19;
  v31 = v18;
  v32 = v24;
  objc_msgSend(v32, "notifyOnQueue:block:", &_dispatch_main_q, v33);

}

- (id)actualIdentifiersForObsfucatedPlayerIDs:(id)a3 inSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "record"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession playerIdentifierForObfuscatedIdentifier:containerName:](GKCloudGameSession, "playerIdentifierForObfuscatedIdentifier:containerName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15), v9, (_QWORD)v18));
        objc_msgSend(v10, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

@end
