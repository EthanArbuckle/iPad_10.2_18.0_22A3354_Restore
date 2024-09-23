@implementation GKChallengeServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x400000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKChallengeServicePrivateInterface, a2);
}

- (void)getCountOfChallengesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[4];

  v4 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeService.m", 611, "-[GKChallengeServicePrivate getCountOfChallengesWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100076A0C;
  v18[3] = &unk_1002BEC40;
  v8 = v6;
  v19 = v8;
  v20 = v26;
  v21 = &v22;
  objc_msgSend(v7, "performBlockAndWait:", v18);

  if (*((_BYTE *)v23 + 24))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100076AD4;
    v15[3] = &unk_1002BBCC8;
    v15[4] = self;
    v16 = v8;
    v17 = v26;
    objc_msgSend(v16, "perform:", v15);

  }
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100076CC4;
    v11[3] = &unk_1002BBD40;
    v13 = v4;
    v14 = v26;
    v12 = v8;
    objc_msgSend(v12, "notifyOnQueue:block:", v10, v11);

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v26, 8);
}

- (void)startGame:(id)a3 withChallenge:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", a3));
  objc_msgSend(v6, "setLaunchEvent:withContext:", 0, v5);

}

- (void)getApprovedGamesForLeaderboardChallengesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = GKBagKeyChallengeApprovedGames;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeBag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100076EB4;
  v11[3] = &unk_1002BCC38;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v7, "getValuesForKeys:queue:completion:", v5, v9, v11);

}

- (void)createLeaderboardChallengeWithBundleID:(id)a3 leaderboardID:(id)a4 attemptLimit:(id)a5 duration:(id)a6 invitedPlayerIDs:(id)a7 previousChallengeID:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  id v33;
  id v34;
  id v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v30 = CFSTR("bundle-id");
  v31 = CFSTR("leaderboard-id");
  v33 = v14;
  v34 = v15;
  v32 = CFSTR("invited-player-ids");
  v35 = v18;
  v20 = a9;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v30, 3));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v21));

  if (v16)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v16, "intValue")));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("attempt-limit"));

  }
  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)(v24 * 1000.0)));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("duration"));

  }
  objc_msgSend(v22, "_gkSetIfNonNilObject:forKey:", v19, CFSTR("previous-challenge-id"), self, v30, v31, v32, v33, v34, v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "clientProxy"));
  objc_msgSend(v26, "createEntityWithRequest:bagKey:clientProxy:completionHandler:entityMaker:", v22, CFSTR("gk-challenge-create"), v27, v20, &stru_1002BFAB8);

}

- (void)getLeaderboardChallengeDetailsForChallengeID:(id)a3 allowStaleData:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v13 = CFSTR("challenge-id");
  v14 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v10, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", v11, CFSTR("gk-challenge-detail"), v5, v12, v8, &stru_1002BFAD8);

}

- (void)getLeaderboardChallengeSummaryForPlayerID:(id)a3 bundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v15 = CFSTR("player-id");
  v16 = v8;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("bundle-id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v13, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", v12, CFSTR("gk-challenge-summary"), 0, v14, v10, &stru_1002BFAF8);

}

- (void)acceptInviteForLeaderboardChallengeID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  void *v13;

  v11 = a3;
  v12 = CFSTR("player-invite");
  v10 = CFSTR("challenge-id");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));

  -[GKChallengeServicePrivate acceptForLeaderboardChallengeInvite:completionHandler:](self, "acceptForLeaderboardChallengeInvite:completionHandler:", v9, v6);
}

- (void)acceptInviteForLeaderboardChallengeCode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  void *v13;

  v11 = a3;
  v12 = CFSTR("code-invite");
  v10 = CFSTR("invite-code");
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));

  -[GKChallengeServicePrivate acceptForLeaderboardChallengeInvite:completionHandler:](self, "acceptForLeaderboardChallengeInvite:completionHandler:", v9, v6);
}

- (void)acceptForLeaderboardChallengeInvite:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007786C;
  v11[3] = &unk_1002BCB98;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "issueRequest:bagKey:clientProxy:handler:", v7, CFSTR("gk-challenge-accept"), v9, v11);

}

- (void)inviteToLeaderboardChallengeWithID:(id)a3 invitedPlayerIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v17[0] = CFSTR("challenge-id");
  v17[1] = CFSTR("player-ids");
  v18[0] = v10;
  v18[1] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100077A90;
  v15[3] = &unk_1002BCB98;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v11, "issueRequest:bagKey:clientProxy:handler:", v12, CFSTR("gk-challenge-invite"), v13, v15);

}

- (void)createLeaderboardChallengeInviteCodeWithChallengeID:(id)a3 playerID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v12[0] = CFSTR("challenge-id");
  v12[1] = CFSTR("player-id");
  v13[0] = a3;
  v13[1] = a4;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  -[GKChallengeServicePrivate getStringWithRequest:bagKey:stringResponseKey:completionHandler:](self, "getStringWithRequest:bagKey:stringResponseKey:completionHandler:", v11, CFSTR("gk-challenge-create-invite-code"), CFSTR("invite-code"), v8);
}

- (void)getLeaderboardChallengeInviteStatusWithChallengeID:(id)a3 inviteCode:(id)a4 playerID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerID"));
  v16 = objc_msgSend(v13, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100077E80;
    v23 = &unk_1002BB540;
    v24 = v12;
    dispatch_async(v18, &v20);

  }
  v25[0] = CFSTR("challenge-id");
  v25[1] = CFSTR("invite-code");
  v26[0] = v10;
  v26[1] = v11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2, v20, v21, v22, v23));
  -[GKChallengeServicePrivate getStringWithRequest:bagKey:stringResponseKey:completionHandler:](self, "getStringWithRequest:bagKey:stringResponseKey:completionHandler:", v19, CFSTR("gk-challenge-detail"), CFSTR("invite-code-status"), v12);

}

- (void)compareLeaderboardChallengeWithPlayerID:(id)a3 otherPlayerID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18[0] = CFSTR("player-id");
  v18[1] = CFSTR("compare-to-player-id");
  v19[0] = v10;
  v19[1] = v11;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

  if (v12)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("bundle-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v16, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", v15, CFSTR("gk-challenge-compare"), 0, v17, v13, &stru_1002BFB18);

}

- (void)getLeaderboardChallengesCompletedWithPlayerID:(id)a3 type:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18[0] = CFSTR("player-id");
  v18[1] = CFSTR("type");
  v19[0] = v10;
  v19[1] = v11;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

  if (v12)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("bundle-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v16, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", v15, CFSTR("gk-challenge-get-completed"), 0, v17, v13, &stru_1002BFB38);

}

- (void)getLeaderboardCompletedChallengeSummaryForPlayerID:(id)a3 type:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18[0] = CFSTR("player-id");
  v18[1] = CFSTR("type");
  v19[0] = v10;
  v19[1] = v11;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

  if (v12)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("bundle-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v16, "readEntityWithRequest:bagKey:includeStaleCacheData:clientProxy:completionHandler:entityMaker:", v15, CFSTR("gk-challenge-get-completed-summary"), 0, v17, v13, &stru_1002BFB58);

}

- (void)leaveLeaderboardChallengeWithChallengeID:(id)a3 playerID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v12[0] = CFSTR("challenge-id");
  v12[1] = CFSTR("player-id");
  v13[0] = a3;
  v13[1] = a4;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  -[GKChallengeServicePrivate getStringWithRequest:bagKey:stringResponseKey:completionHandler:](self, "getStringWithRequest:bagKey:stringResponseKey:completionHandler:", v11, CFSTR("gk-challenge-leave"), CFSTR("response-status"), v8);
}

- (void)getActiveLeaderboardChallengeDetailsForPlayerID:(id)a3 bundleID:(id)a4 allowStaleChallengeDetailsData:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  _QWORD v10[4];
  GKChallengeServicePrivate *v11;
  id v12;
  BOOL v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007857C;
  v10[3] = &unk_1002BFB80;
  v11 = self;
  v12 = a6;
  v13 = a5;
  v9 = v12;
  -[GKChallengeServicePrivate getLeaderboardChallengeSummaryForPlayerID:bundleID:completionHandler:](v11, "getLeaderboardChallengeSummaryForPlayerID:bundleID:completionHandler:", a3, a4, v10);

}

- (void)getLeaderboardChallengeDetailsForChallengeIDs:(id)a3 allowStaleData:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[6];
  id v26;
  BOOL v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v8 = a3;
  v21 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeService.m", 938, "-[GKChallengeServicePrivate getLeaderboardChallengeDetailsForChallengeIDs:allowStaleData:completionHandler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v15);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000788D4;
        v25[3] = &unk_1002BBAD8;
        v25[4] = self;
        v25[5] = v16;
        v27 = a4;
        v26 = v10;
        objc_msgSend(v26, "perform:", v25);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000789FC;
  v22[3] = &unk_1002BB450;
  v23 = v10;
  v24 = v21;
  v19 = v10;
  v20 = v21;
  objc_msgSend(v19, "notifyOnQueue:block:", v18, v22);

}

- (void)getStringWithRequest:(id)a3 bagKey:(id)a4 stringResponseKey:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100078B98;
  v18[3] = &unk_1002BF858;
  v19 = v10;
  v20 = v11;
  v18[4] = self;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v14, "issueRequest:bagKey:clientProxy:handler:", v13, v12, v15, v18);

}

@end
