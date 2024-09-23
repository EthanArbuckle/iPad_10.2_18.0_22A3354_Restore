@implementation GKAchievementListCacheObject

+ (id)entityName
{
  return CFSTR("AchievementList");
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKAchievementListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject game](self, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = v4 != 0;

  return v5;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementListCacheObject updateWithServerRepresentation:expirationDate:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKAchievementListCacheObject updateWithServerRepresentation:expirationDate:]", objc_msgSend(v13, "UTF8String"), 1814));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v16.receiver = self;
  v16.super_class = (Class)GKAchievementListCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v16, "updateWithServerRepresentation:expirationDate:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("results")));
  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v15, &stru_1002C26A8, 1);

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
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKAchievementListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKAchievementListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 1824));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject game](self, "game"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "achievementDescriptionList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entries"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject entries](self, "entries"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementListCacheObject player](self, "player"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerID"));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000E59A0;
  v26[3] = &unk_1002C26D0;
  v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2 * (_QWORD)objc_msgSend(v13, "count"));
  v27 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "array"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000E5A24;
  v23[3] = &unk_1002C26F8;
  v24 = v16;
  v25 = v15;
  v18 = v15;
  v19 = v16;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_gkFilterWithBlock:", v23));

  if (v20)
    v21 = (void *)v20;
  else
    v21 = &__NSArray0__struct;

  return v21;
}

@end
