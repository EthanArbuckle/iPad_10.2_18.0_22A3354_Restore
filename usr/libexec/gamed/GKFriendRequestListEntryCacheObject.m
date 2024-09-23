@implementation GKFriendRequestListEntryCacheObject

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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRequestListEntryCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKFriendRequestListEntryCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 2986));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v21.receiver = self;
  v21.super_class = (Class)GKFriendRequestListEntryCacheObject;
  -[GKFriendListEntryCacheObject updateWithServerRepresentation:](&v21, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("player-id")));
  -[GKFriendRequestListEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject playerID](self, "playerID"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject playerID](self, "playerID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
    v16 = +[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfileWithPlayerID:inManagedObjectContext:", v14, v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("email")));
  -[GKFriendRequestListEntryCacheObject setEmail:](self, "setEmail:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("msg")));
  -[GKFriendRequestListEntryCacheObject setMessage:](self, "setMessage:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("timestamp")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v19));
  -[GKFriendRequestListEntryCacheObject setDate:](self, "setDate:", v20);

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
  id v13;
  void *v14;
  void *v15;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendRequestListEntryCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendRequestListEntryCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 3000));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject playerID](self, "playerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfileWithPlayerID:inManagedObjectContext:", v11, v10));

  if (objc_msgSend(v12, "familiarity") == 3)
  {
    v13 = objc_msgSend(objc_alloc((Class)GKFriendRequestInternal), "initWithCacheObject:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject date](self, "date"));
    objc_msgSend(v13, "setDate:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendRequestListEntryCacheObject message](self, "message"));
    objc_msgSend(v13, "setMessage:", v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)entityName
{
  return CFSTR("FriendRequestEntry");
}

@end
