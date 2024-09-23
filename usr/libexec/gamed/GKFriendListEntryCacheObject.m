@implementation GKFriendListEntryCacheObject

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

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendListEntryCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKFriendListEntryCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2597));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListEntryCacheObject playerID](self, "playerID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendListEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfileWithPlayerID:inManagedObjectContext:", v10, v11));

  v13 = objc_msgSend(objc_alloc((Class)GKFriendPlayerInternal), "initWithCacheObject:", v12);
  return v13;
}

+ (id)entityName
{
  return CFSTR("FriendEntry");
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
  objc_super v25;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKFriendListEntryCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKFriendListEntryCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 2609));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v25.receiver = self;
  v25.super_class = (Class)GKFriendListEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v25, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player-id")));
  -[GKFriendListEntryCacheObject setPlayerID:](self, "setPlayerID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("played-with")));
  -[GKFriendListEntryCacheObject setFriendPlayedWith:](self, "setFriendPlayedWith:", objc_msgSend(v13, "BOOLValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bi-directional")));
  -[GKFriendListEntryCacheObject setFriendBiDirectional:](self, "setFriendBiDirectional:", objc_msgSend(v14, "BOOLValue"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("played-nearby")));
  -[GKFriendListEntryCacheObject setFriendPlayedNearby:](self, "setFriendPlayedNearby:", objc_msgSend(v15, "BOOLValue"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accepted-game-invitation")));
  -[GKFriendListEntryCacheObject setAcceptedGameInviteFromThisFriend:](self, "setAcceptedGameInviteFromThisFriend:", objc_msgSend(v16, "BOOLValue"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initiated-game-invitation")));
  -[GKFriendListEntryCacheObject setInitiatedGameInviteToThisFriend:](self, "setInitiatedGameInviteToThisFriend:", objc_msgSend(v17, "BOOLValue"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("automatched-together")));
  -[GKFriendListEntryCacheObject setAutomatchedTogether:](self, "setAutomatchedTogether:", objc_msgSend(v18, "BOOLValue"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("challenged-together")));
  -[GKFriendListEntryCacheObject setChallengedTogether:](self, "setChallengedTogether:", objc_msgSend(v19, "BOOLValue"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last-challenged-timestamp")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v20));
  -[GKFriendListEntryCacheObject setLastChallengedDate:](self, "setLastChallengedDate:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last-challenged-game")));
  -[GKFriendListEntryCacheObject setLastChallengedGame:](self, "setLastChallengedGame:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKContactsAssociationIDKey));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKContactsIntegrationUserSettings associationIDFromServerResult:](GKContactsIntegrationUserSettings, "associationIDFromServerResult:", v23));
  -[GKFriendListEntryCacheObject setContactAssociationID:](self, "setContactAssociationID:", v24);

}

@end
