@implementation GKLeaderboardScoreRangeRequest

- (void)sanitizeRange
{
  int8x16_t v2;
  int8x16_t v3;

  v2 = *(int8x16_t *)((char *)self + OBJC_IVAR___GKLeaderboardScoreRangeRequest__range);
  v3 = (int8x16_t)vcgtq_u64((uint64x2_t)v2, (uint64x2_t)vdupq_n_s64(1uLL));
  *(int64x2_t *)((char *)self + OBJC_IVAR___GKLeaderboardScoreRangeRequest__range) = vsubq_s64((int64x2_t)vandq_s8(v2, v3), (int64x2_t)vmvnq_s8(v3));
}

- (id)bagKey
{
  return CFSTR("gk-get-leaderboard");
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
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v20[0] = CFSTR("game");
  v18 = CFSTR("bundle-id");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest gameBundleID](self, "gameBundleID", a3));
  v19 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v21[0] = v5;
  v20[1] = CFSTR("time-scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest serverTimeScope](self, "serverTimeScope"));
  v21[1] = v6;
  v20[2] = CFSTR("player-scope");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest serverPlayerScope](self, "serverPlayerScope"));
  v21[2] = v7;
  v20[3] = CFSTR("count");
  -[GKLeaderboardScoreRangeRequest range](self, "range");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
  v21[3] = v9;
  v20[4] = CFSTR("starting-rank");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKLeaderboardScoreRangeRequest range](self, "range")));
  v21[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 5));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest identifier](self, "identifier"));

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest identifier](self, "identifier"));
LABEL_5:
    v16 = (void *)v14;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("category"));

    goto LABEL_6;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest groupIdentifier](self, "groupIdentifier"));

  if (v15)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[GKLeaderboardScoreRangeRequest groupIdentifier](self, "groupIdentifier"));
    goto LABEL_5;
  }
LABEL_6:

  return v12;
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
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  GKLeaderboardScoreRangeRequest *v29;
  id v30;
  id v31;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m", 196, "-[GKLeaderboardScoreRangeRequest(GKGameStatService) generateScoresFromServerResponse:service:context:timeToLive:handler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v16, v14, v15));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10009F690;
  v27[3] = &unk_1002BCAA8;
  v28 = v11;
  v29 = self;
  v18 = v17;
  v30 = v18;
  v31 = v12;
  v19 = v12;
  v20 = v11;
  objc_msgSend(v18, "performOnManagedObjectContext:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10009F930;
  v24[3] = &unk_1002BB450;
  v25 = v18;
  v26 = v13;
  v22 = v18;
  v23 = v13;
  objc_msgSend(v22, "notifyOnQueue:block:", v21, v24);

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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m", 240, "-[GKLeaderboardScoreRangeRequest(GKGameStatService) loadScoresWithService:context:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v12, v9, v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10009FB48;
  v24[3] = &unk_1002BC3A8;
  v24[4] = self;
  v25 = v8;
  v15 = v13;
  v26 = v15;
  v27 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "performOnQueue:block:", v14, v24);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009FE54;
  v21[3] = &unk_1002BB450;
  v22 = v15;
  v23 = v10;
  v19 = v15;
  v20 = v10;
  objc_msgSend(v19, "notifyOnQueue:block:", v18, v21);

}

@end
