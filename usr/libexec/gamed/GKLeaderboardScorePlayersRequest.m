@implementation GKLeaderboardScorePlayersRequest

- (id)bagKey
{
  return CFSTR("gk-get-leaderboard-rank");
}

- (id)serverRequestWithService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  void *v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest playerInternals](self, "playerInternals"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkMapWithBlock:", &stru_1002C0998));

  if (v7)
  {
    if ((objc_msgSend(v7, "containsObject:", v5) & 1) == 0)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v5));

      v7 = (void *)v8;
    }
  }
  else
  {
    v24 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  }
  v22[0] = CFSTR("game");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest gameBundleID](self, "gameBundleID", CFSTR("bundle-id")));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v23[0] = v10;
  v22[1] = CFSTR("time-scope");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest serverTimeScope](self, "serverTimeScope"));
  v23[1] = v11;
  v22[2] = CFSTR("player-scope");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest serverPlayerScope](self, "serverPlayerScope"));
  v22[3] = CFSTR("player-ids");
  v23[2] = v12;
  v23[3] = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest identifier](self, "identifier"));

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest identifier](self, "identifier"));
LABEL_9:
    v18 = (void *)v16;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("category"));

    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest groupIdentifier](self, "groupIdentifier"));

  if (v17)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScorePlayersRequest groupIdentifier](self, "groupIdentifier"));
    goto LABEL_9;
  }
LABEL_10:

  return v14;
}

- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m", 310, "-[GKLeaderboardScorePlayersRequest(GKGameStatService) generateScoresFromServerResponse:service:context:timeToLive:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v16, v14, v15));

  if (v11)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000A02F0;
    v24[3] = &unk_1002BCAA8;
    v24[4] = self;
    v25 = v11;
    v26 = v17;
    v27 = v12;
    objc_msgSend(v26, "performOnManagedObjectContext:", v24);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A065C;
  v21[3] = &unk_1002BB450;
  v22 = v17;
  v23 = v13;
  v19 = v17;
  v20 = v13;
  objc_msgSend(v19, "notifyOnQueue:block:", v18, v21);

}

- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m", 357, "-[GKLeaderboardScorePlayersRequest(GKGameStatService) loadScoresWithService:context:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v12, v9, v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000A088C;
  v23[3] = &unk_1002BC010;
  v23[4] = self;
  v15 = v8;
  v24 = v15;
  v16 = v11;
  v25 = v16;
  v17 = v13;
  v26 = v17;
  v18 = v9;
  v27 = v18;
  objc_msgSend(v17, "performOnQueue:block:", v14, v23);

  if (v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A0B9C;
    v20[3] = &unk_1002BB450;
    v22 = v10;
    v21 = v17;
    objc_msgSend(v21, "notifyOnQueue:block:", v19, v20);

  }
}

@end
