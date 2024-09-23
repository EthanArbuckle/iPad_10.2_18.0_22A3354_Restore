@implementation GKPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerInternal(Cache) updateWithCacheObject:]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKPlayerInternal(Cache) updateWithCacheObject:]", objc_msgSend(v9, "UTF8String"), 170));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "playerID"));
  -[GKPlayerInternal setPlayerID:](self, "setPlayerID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "alias"));
  -[GKPlayerInternal setAlias:](self, "setAlias:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "avatarType"));
  -[GKPlayerInternal setAvatarType:](self, "setAvatarType:", v13);

  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "friendLevel"));
  v15 = (void *)v14;
  if (v14)
    v16 = (_UNKNOWN **)v14;
  else
    v16 = &off_1002DB8C8;
  -[GKPlayerInternal setFriendLevel:](self, "setFriendLevel:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "friendBiDirectional"));
  -[GKPlayerInternal setFriendBiDirectional:](self, "setFriendBiDirectional:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "friendPlayedWith"));
  -[GKPlayerInternal setFriendPlayedWith:](self, "setFriendPlayedWith:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "friendPlayedNearby"));
  -[GKPlayerInternal setFriendPlayedNearby:](self, "setFriendPlayedNearby:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "acceptedGameInviteFromThisFriend"));
  -[GKPlayerInternal setAcceptedGameInviteFromThisFriend:](self, "setAcceptedGameInviteFromThisFriend:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "initiatedGameInviteToThisFriend"));
  -[GKPlayerInternal setInitiatedGameInviteToThisFriend:](self, "setInitiatedGameInviteToThisFriend:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "automatchedTogether"));
  -[GKPlayerInternal setAutomatchedTogether:](self, "setAutomatchedTogether:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageURLDictionary"));
  -[GKPlayerInternal setPhotos:](self, "setPhotos:", v23);

  -[GKPlayerInternal setNumberOfFriends:](self, "setNumberOfFriends:", (unsigned __int16)objc_msgSend(v26, "numberOfFriends"));
  -[GKPlayerInternal setNumberOfFriendsInCommon:](self, "setNumberOfFriendsInCommon:", (unsigned __int16)objc_msgSend(v26, "numberOfFriendsInCommon"));
  -[GKPlayerInternal setNumberOfGames:](self, "setNumberOfGames:", (unsigned __int16)objc_msgSend(v26, "numberOfGames"));
  -[GKPlayerInternal setNumberOfGamesInCommon:](self, "setNumberOfGamesInCommon:", (unsigned __int16)objc_msgSend(v26, "numberOfGamesInCommon"));
  -[GKPlayerInternal setNumberOfAchievements:](self, "setNumberOfAchievements:", objc_msgSend(v26, "numberOfAchievements"));
  -[GKPlayerInternal setNumberOfAchievementPoints:](self, "setNumberOfAchievementPoints:", objc_msgSend(v26, "numberOfAchievementPoints"));
  -[GKPlayerInternal setAchievementsVisibility:](self, "setAchievementsVisibility:", objc_msgSend(v26, "achievementsVisibility"));
  -[GKPlayerInternal setFriendsVisibility:](self, "setFriendsVisibility:", objc_msgSend(v26, "friendsVisibility"));
  -[GKPlayerInternal setGamesPlayedVisibility:](self, "setGamesPlayedVisibility:", objc_msgSend(v26, "gamesPlayedVisibility"));
  -[GKPlayerInternal setGlobalFriendListAccess:](self, "setGlobalFriendListAccess:", objc_msgSend(v26, "globalFriendListAccess"));
  -[GKPlayerInternal setIsArcadeSubscriber:](self, "setIsArcadeSubscriber:", objc_msgSend(v26, "isArcadeSubscriber"));
  -[GKPlayerInternal setContactsIntegrationConsent:](self, "setContactsIntegrationConsent:", objc_msgSend(v26, "contactsIntegrationConsent"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contactsAssociationID"));
  -[GKPlayerInternal setContactsAssociationID:](self, "setContactsAssociationID:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "serviceLastUpdatedTimestamp"));
  -[GKPlayerInternal setServiceLastUpdatedTimestamp:](self, "setServiceLastUpdatedTimestamp:", v25);

  -[GKPlayerInternal setAllowReceivingFriendInvites:](self, "setAllowReceivingFriendInvites:", objc_msgSend(v26, "allowReceivingFriendInvites"));
  -[GKPlayerInternal setAllowChallengeFriendInvites:](self, "setAllowChallengeFriendInvites:", objc_msgSend(v26, "allowChallengeFriendInvites"));
  -[GKPlayerInternal setAllowMultiplayerFriendInvites:](self, "setAllowMultiplayerFriendInvites:", objc_msgSend(v26, "allowMultiplayerFriendInvites"));

}

+ (unsigned)piecesToLoad
{
  return +[GKPlayerProfileCacheObject piecesToLoadForFamiliarity:](GKPlayerProfileCacheObject, "piecesToLoadForFamiliarity:", objc_msgSend(a1, "familiarity"));
}

+ (int)familiarity
{
  return 0;
}

@end
