@implementation GKGameSessionServicePrivate

- (BOOL)requiresAuthentication
{
  return 0;
}

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKGameSessionServicePrivateInterface, a2);
}

- (void)getZonesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("getZones"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056958;
  v6[3] = &unk_1002BCA80;
  v7 = v4;
  v5 = v4;
  +[GKCloudGameSession getZoneNamesWithCompletionHandler:](GKCloudGameSession, "getZoneNamesWithCompletionHandler:", v6);

}

- (void)getFriendPlayersWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("getFriendPlayers"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056A74;
  v6[3] = &unk_1002BCA80;
  v7 = v4;
  v5 = v4;
  +[GKCloudGameSession getFriendPlayersWithHandler:](GKCloudGameSession, "getFriendPlayersWithHandler:", v6);

}

- (void)sendInvitePushForSessionWithID:(id)a3 userMessage:(id)a4 recipientIDs:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[GKGameSessionService reportMetricsWithActionType:](self, "reportMetricsWithActionType:", CFSTR("sendInvite"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100056BF8;
  v17[3] = &unk_1002BE5B0;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  +[GKCloudGameSession sessionForIdentifier:handler:](GKCloudGameSession, "sessionForIdentifier:handler:", v13, v17);

}

- (void)saveConnectionStateForLostPlayerWithCloudID:(id)a3 sessionIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  GKGameSessionServicePrivate *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("saveConnectionStateForLostPlayer")));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100056EF4;
  v26[3] = &unk_1002BB590;
  v12 = v9;
  v27 = v12;
  v13 = v11;
  v28 = v13;
  objc_msgSend(v13, "perform:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100057030;
  v20[3] = &unk_1002BB4C8;
  v21 = v13;
  v22 = v8;
  v23 = self;
  v24 = v12;
  v25 = v10;
  v16 = v10;
  v17 = v12;
  v18 = v8;
  v19 = v13;
  objc_msgSend(v19, "notifyOnQueue:block:", v15, v20);

}

@end
