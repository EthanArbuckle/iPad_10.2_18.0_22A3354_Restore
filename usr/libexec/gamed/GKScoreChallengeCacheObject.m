@implementation GKScoreChallengeCacheObject

+ (id)entityName
{
  return CFSTR("ScoreChallenge");
}

- (BOOL)hasDetails
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKScoreChallengeCacheObject;
  if (!-[GKChallengeCacheObject hasDetails](&v6, "hasDetails"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject value](self, "value"));
  v4 = v3 != 0;

  return v4;
}

- (Class)classForInternalRepresentation
{
  return (Class)objc_opt_class(GKScoreChallengeInternal, a2);
}

- (id)internalRepresentation
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKScoreChallengeCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKScoreChallengeCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 4689));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v25.receiver = self;
  v25.super_class = (Class)GKScoreChallengeCacheObject;
  v10 = -[GKChallengeCacheObject internalRepresentation](&v25, "internalRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKScoreInternal internalRepresentation](GKScoreInternal, "internalRepresentation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject identifier](self, "identifier"));
  objc_msgSend(v12, "setLeaderboardIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v12, "setGroupLeaderboardIdentifier:", v14);

  objc_msgSend(v12, "setRank:", -[GKScoreChallengeCacheObject rank](self, "rank"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject value](self, "value"));
  objc_msgSend(v12, "setValue:", objc_msgSend(v15, "longLongValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject formattedValue](self, "formattedValue"));
  objc_msgSend(v12, "setFormattedValue:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject date](self, "date"));
  objc_msgSend(v12, "setDate:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject context](self, "context"));
  objc_msgSend(v12, "setContext:", objc_msgSend(v18, "longLongValue"));

  objc_msgSend(v11, "setScore:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKLeaderboardInternal internalRepresentation](GKLeaderboardInternal, "internalRepresentation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject identifier](self, "identifier"));
  objc_msgSend(v19, "setIdentifier:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v19, "setGroupIdentifier:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreChallengeCacheObject localizedTitle](self, "localizedTitle"));
  objc_msgSend(v19, "setLocalizedTitle:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  objc_msgSend(v19, "setIcons:", v23);

  objc_msgSend(v11, "setLeaderboard:", v19);
  return v11;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v29;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKScoreChallengeCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKScoreChallengeCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 4717));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v29.receiver = self;
  v29.super_class = (Class)GKScoreChallengeCacheObject;
  -[GKChallengeCacheObject updateWithServerRepresentation:](&v29, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("score")));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("leaderboard-id")));
    -[GKScoreChallengeCacheObject setIdentifier:](self, "setIdentifier:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("leaderboard-group-id")));
    -[GKScoreChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("rank")));
    -[GKScoreChallengeCacheObject setRank:](self, "setRank:", objc_msgSend(v16, "integerValue"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("value")));
    -[GKScoreChallengeCacheObject setValue:](self, "setValue:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("formatted-score-value")));
    -[GKScoreChallengeCacheObject setFormattedValue:](self, "setFormattedValue:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("timestamp")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v19));
    -[GKScoreChallengeCacheObject setDate:](self, "setDate:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("context")));
    -[GKScoreChallengeCacheObject setContext:](self, "setContext:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leaderboard-category")));
  v23 = v22;
  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("category-name")));
    -[GKScoreChallengeCacheObject setIdentifier:](self, "setIdentifier:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("group-category-name")));
    -[GKScoreChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("category-title")));
    -[GKScoreChallengeCacheObject setLocalizedTitle:](self, "setLocalizedTitle:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("category-image-urls")));
    if (v27)
      v28 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v27);

  }
}

@end
