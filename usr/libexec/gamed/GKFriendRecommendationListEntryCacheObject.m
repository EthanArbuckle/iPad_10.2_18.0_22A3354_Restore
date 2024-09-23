@implementation GKFriendRecommendationListEntryCacheObject

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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRecommendationListEntryCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendRecommendationListEntryCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2871));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject playerID](self, "playerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfileWithPlayerID:inManagedObjectContext:", v11, v10));

  v13 = objc_msgSend(objc_alloc((Class)GKFriendRecommendationInternal), "initWithCacheObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject reason](self, "reason"));
  objc_msgSend(v13, "setReason:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject reason2](self, "reason2"));
  objc_msgSend(v13, "setReason2:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject rid](self, "rid"));
  objc_msgSend(v13, "setRid:", objc_msgSend(v16, "integerValue"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRecommendationListEntryCacheObject source](self, "source"));
  objc_msgSend(v13, "setSource:", objc_msgSend(v17, "integerValue"));

  return v13;
}

+ (id)entityName
{
  return CFSTR("FriendRecommendationEntry");
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
  objc_super v18;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRecommendationListEntryCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKFriendRecommendationListEntryCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 2890));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v18.receiver = self;
  v18.super_class = (Class)GKFriendRecommendationListEntryCacheObject;
  -[GKRecommendationEntryCacheObject updateWithServerRepresentation:](&v18, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", GKPlayerIDKey));
  -[GKFriendRecommendationListEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("reason")));
  -[GKFriendRecommendationListEntryCacheObject setReason:](self, "setReason:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("alt-reason")));
  -[GKFriendRecommendationListEntryCacheObject setReason2:](self, "setReason2:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("reason-id")));
  -[GKFriendRecommendationListEntryCacheObject setReasonID:](self, "setReasonID:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("rid")));
  -[GKFriendRecommendationListEntryCacheObject setRid:](self, "setRid:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("source")));
  -[GKFriendRecommendationListEntryCacheObject setSource:](self, "setSource:", v17);

}

@end
