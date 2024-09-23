@implementation GKLeaderboardScoreRequest

- (id)serverTimeScope
{
  id v2;
  const __CFString *v3;

  v2 = -[GKLeaderboardScoreRequest timeScope](self, "timeScope");
  v3 = CFSTR("all-time");
  if (v2 == (id)1)
    v3 = CFSTR("this-week");
  if (v2)
    return (id)v3;
  else
    return CFSTR("today");
}

- (id)serverPlayerScope
{
  if (-[GKLeaderboardScoreRequest friendsOnly](self, "friendsOnly"))
    return CFSTR("friends");
  else
    return CFSTR("all");
}

- (id)bagKey
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The concrete subclass must override -[GKLeaderboardScoreRequest bagKey]")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v2, "-[GKLeaderboardScoreRequest(GKGameStatService) bagKey]", objc_msgSend(v4, "UTF8String"), 46));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v5);
  return 0;
}

- (id)serverRequestWithService:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The concrete subclass must override -[GKLeaderboardScoreRequest serverRequestWithService:]")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKLeaderboardScoreRequest(GKGameStatService) serverRequestWithService:]", objc_msgSend(v5, "UTF8String"), 52));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)leaderboardForServerRepresentations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKLeaderboardInternal internalRepresentation](GKLeaderboardInternal, "internalRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category-title")));
  objc_msgSend(v4, "setLocalizedTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("leaderboard-size")));
  objc_msgSend(v4, "setMaxRank:", objc_msgSend(v6, "unsignedIntegerValue"));

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("global-alltime-info")));
  if (!v7)
    v7 = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("category-name")));
  objc_msgSend(v4, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("group-category-name")));
  objc_msgSend(v4, "setGroupIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rank")));
  objc_msgSend(v4, "setOverallRank:", objc_msgSend(v10, "unsignedIntegerValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("leaderboard-size")));
  objc_msgSend(v4, "setOverallRankCount:", objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("friend-rank")));
  objc_msgSend(v4, "setFriendRank:", (unsigned __int16)objc_msgSend(v12, "unsignedIntegerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("num-friends-ranked")));
  objc_msgSend(v4, "setFriendRankCount:", (unsigned __int16)objc_msgSend(v13, "unsignedIntegerValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("category-image-urls")));
  objc_msgSend(v4, "setIcons:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("last-submitted")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v15));
  objc_msgSend(v4, "setLastSubmittedDate:", v16);

  return v4;
}

- (id)scoreForServerRepresentation:(id)a3 leaderboard:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKScoreInternal internalRepresentation](GKScoreInternal, "internalRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v7, "setLeaderboardIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  objc_msgSend(v7, "setGroupLeaderboardIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("player-id")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerInternal internalRepresentation](GKPlayerInternal, "internalRepresentation"));
    objc_msgSend(v11, "setPlayerID:", v10);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v7, "setPlayer:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rank")));
  objc_msgSend(v7, "setRank:", objc_msgSend(v12, "integerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v13));
  objc_msgSend(v7, "setDate:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score-value")));
  objc_msgSend(v7, "setValue:", objc_msgSend(v15, "unsignedLongLongValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("formatted-score-value")));
  objc_msgSend(v7, "setFormattedValue:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("context")));
  objc_msgSend(v7, "setContext:", objc_msgSend(v17, "unsignedLongLongValue"));

  return v7;
}

- (void)updatePlayersForLeaderboard:(id)a3 service:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scores"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerScore"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerScore"));
    objc_msgSend(v11, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_gkValuesForKeyPath:", CFSTR("player.playerID")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKAnonymousPlayerInternal internalRepresentation](GKAnonymousPlayerInternal, "internalRepresentation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKProfileService, "serviceFromService:", v9));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009EF14;
  v20[3] = &unk_1002BCE80;
  v21 = v11;
  v22 = v15;
  v23 = v8;
  v17 = v8;
  v18 = v15;
  v19 = v11;
  objc_msgSend(v16, "getProfilesForPlayerIDs:handler:", v14, v20);

}

- (void)generateScoresFromServerResponse:(id)a3 service:(id)a4 context:(id)a5 timeToLive:(double)a6 handler:(id)a7
{
  void *v7;
  void *v8;
  id v9;
  id v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The concrete subclass must override -[GKLeaderboardScoreRequest generateScoresFromServerResponse:service:context:timeToLive:handler:]"), a4, a5, a7, a6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v7, "-[GKLeaderboardScoreRequest(GKGameStatService) generateScoresFromServerResponse:service:context:timeToLive:handler:]", objc_msgSend(v9, "UTF8String"), 146));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
}

- (void)loadScoresWithService:(id)a3 context:(id)a4 handler:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The concrete subclass must override -[GKLeaderboardScoreRequest loadScoresForClient:context:handler:]"), a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKLeaderboardScoreRequest+GKGameStatService.m"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v5, "-[GKLeaderboardScoreRequest(GKGameStatService) loadScoresWithService:context:handler:]", objc_msgSend(v7, "UTF8String"), 153));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
}

@end
