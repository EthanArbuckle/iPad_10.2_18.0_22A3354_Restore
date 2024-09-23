@implementation GKAchievementChallengeCacheObject

+ (id)entityName
{
  return CFSTR("AchievementChallenge");
}

- (BOOL)hasDetails
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  objc_super v14;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementChallengeCacheObject hasDetails]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKAchievementChallengeCacheObject hasDetails]", objc_msgSend(v8, "UTF8String"), 4771));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v14.receiver = self;
  v14.super_class = (Class)GKAchievementChallengeCacheObject;
  if (!-[GKChallengeCacheObject hasDetails](&v14, "hasDetails"))
    return 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject identifier](self, "identifier"));
  if (v10)
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
    v11 = v12 != 0;

  }
  return v11;
}

- (Class)classForInternalRepresentation
{
  return (Class)objc_opt_class(GKAchievementChallengeInternal, a2);
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
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementChallengeCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKAchievementChallengeCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 4782));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject list](self, "list"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "player"));

  v24.receiver = self;
  v24.super_class = (Class)GKAchievementChallengeCacheObject;
  v12 = -[GKChallengeCacheObject internalRepresentation](&v24, "internalRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKAchievementInternal internalRepresentation](GKAchievementInternal, "internalRepresentation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject identifier](self, "identifier"));
  objc_msgSend(v14, "setIdentifier:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v14, "setGroupIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject date](self, "date"));
  objc_msgSend(v14, "setLastReportedDate:", v17);

  -[GKAchievementChallengeCacheObject percentComplete](self, "percentComplete");
  objc_msgSend(v14, "setPercentComplete:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalRepresentation"));
  objc_msgSend(v14, "setPlayer:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject title](self, "title"));
  objc_msgSend(v14, "setTitle:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementChallengeCacheObject maximumPoints](self, "maximumPoints"));
  objc_msgSend(v14, "setMaximumPoints:", (unsigned __int16)objc_msgSend(v21, "integerValue"));

  objc_msgSend(v14, "setHidden:", -[GKAchievementChallengeCacheObject hidden](self, "hidden"));
  objc_msgSend(v14, "setReplayable:", -[GKAchievementChallengeCacheObject replayable](self, "replayable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  objc_msgSend(v14, "setIcons:", v22);

  objc_msgSend(v13, "setAchievement:", v14);
  return v13;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementChallengeCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKAchievementChallengeCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 4807));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v29.receiver = self;
  v29.super_class = (Class)GKAchievementChallengeCacheObject;
  -[GKChallengeCacheObject updateWithServerRepresentation:](&v29, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement")));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("achievement-id")));
    -[GKAchievementChallengeCacheObject setIdentifier:](self, "setIdentifier:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("achievement-group-id")));
    -[GKAchievementChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("achievement-pct")));
    objc_msgSend(v16, "floatValue");
    -[GKAchievementChallengeCacheObject setPercentComplete:](self, "setPercentComplete:");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("timestamp")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v17));
    -[GKAchievementChallengeCacheObject setDate:](self, "setDate:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("achievement-description")));
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("achievement-id")));
    -[GKAchievementChallengeCacheObject setIdentifier:](self, "setIdentifier:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("group-achievement-id")));
    -[GKAchievementChallengeCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("achievement-image-urls")));
    if (v23)
      v24 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("achievement-title")));
    -[GKAchievementChallengeCacheObject setTitle:](self, "setTitle:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("achievement-max-value")));
    -[GKAchievementChallengeCacheObject setMaximumPoints:](self, "setMaximumPoints:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("achievement-display-unachieved")));
    -[GKAchievementChallengeCacheObject setHidden:](self, "setHidden:", objc_msgSend(v27, "BOOLValue") ^ 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("is-recyclable")));
    -[GKAchievementChallengeCacheObject setReplayable:](self, "setReplayable:", objc_msgSend(v28, "BOOLValue"));

  }
}

@end
