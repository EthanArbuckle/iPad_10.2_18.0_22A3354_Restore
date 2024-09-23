@implementation GKAchievementDescriptionCacheObject

+ (BOOL)getIsPrereleaseFromServerRep:(id)a3
{
  return objc_msgSend(a3, "BOOLValueFromKey:defaultValue:", CFSTR("is-prerelease"), 0);
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
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementDescriptionCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKAchievementDescriptionCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 1750));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v27.receiver = self;
  v27.super_class = (Class)GKAchievementDescriptionCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v27, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-id")));
  -[GKAchievementDescriptionCacheObject setIdentifier:](self, "setIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("group-achievement-id")));
  -[GKAchievementDescriptionCacheObject setGroupIdentifier:](self, "setGroupIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-title")));
  -[GKAchievementDescriptionCacheObject setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-desc-after")));
  -[GKAchievementDescriptionCacheObject setAchievedDescription:](self, "setAchievedDescription:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-desc-before")));
  -[GKAchievementDescriptionCacheObject setUnachievedDescription:](self, "setUnachievedDescription:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-max-value")));
  -[GKAchievementDescriptionCacheObject setMaximumPoints:](self, "setMaximumPoints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-display-unachieved")));
  -[GKAchievementDescriptionCacheObject setHidden:](self, "setHidden:", objc_msgSend(v18, "BOOLValue") ^ 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("is-recyclable")));
  -[GKAchievementDescriptionCacheObject setReplayable:](self, "setReplayable:", objc_msgSend(v19, "BOOLValue"));

  if (+[GKAchievementDescriptionCacheObject getIsPrereleaseFromServerRep:](GKAchievementDescriptionCacheObject, "getIsPrereleaseFromServerRep:", v4))
  {
    v20 = 2;
  }
  else
  {
    v20 = 1;
  }
  -[GKAchievementDescriptionCacheObject setReleaseState:](self, "setReleaseState:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("percentage-players-earned")));
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "doubleValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 * 100.0));
    -[GKAchievementDescriptionCacheObject setRarityPercent:](self, "setRarityPercent:", v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("achievement-image-urls")));
  if (v25)
    v26 = -[GKCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v25);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementDescriptionCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKAchievementDescriptionCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 1775));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKAchievementInternal internalRepresentation](GKAchievementInternal, "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject identifier](self, "identifier"));
  objc_msgSend(v10, "setIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject title](self, "title"));
  objc_msgSend(v10, "setTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v10, "setGroupIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject achievedDescription](self, "achievedDescription"));
  objc_msgSend(v10, "setAchievedDescription:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject unachievedDescription](self, "unachievedDescription"));
  objc_msgSend(v10, "setUnachievedDescription:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject maximumPoints](self, "maximumPoints"));
  objc_msgSend(v10, "setMaximumPoints:", (unsigned __int16)objc_msgSend(v16, "unsignedIntegerValue"));

  objc_msgSend(v10, "setHidden:", -[GKAchievementDescriptionCacheObject hidden](self, "hidden"));
  objc_msgSend(v10, "setReplayable:", -[GKAchievementDescriptionCacheObject replayable](self, "replayable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
  objc_msgSend(v10, "setIcons:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementDescriptionCacheObject rarityPercent](self, "rarityPercent"));
  objc_msgSend(v10, "setRarityPercent:", v18);

  objc_msgSend(v10, "setReleaseState:", -[GKAchievementDescriptionCacheObject releaseState](self, "releaseState"));
  return v10;
}

+ (id)entityName
{
  return CFSTR("AchievementDescription");
}

@end
