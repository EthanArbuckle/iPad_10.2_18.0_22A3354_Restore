@implementation GKPlayerInternalProvider

- (id)localPlayer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryCredentialForEnvironment:", objc_msgSend(v2, "environment")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerInternal"));

  v6 = objc_alloc((Class)GKPlayerInternalOnboarding);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerID"));
  v8 = objc_msgSend(v6, "initWithPlayerID:", v7);
  objc_msgSend(v5, "setOnboarding:", v8);

  return v5;
}

- (id)localPlayerCacheGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKPlayerInternalProvider.m", 36, "-[GKPlayerInternalProvider localPlayerCacheGroup]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerInternalProvider localPlayer](self, "localPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transactionGroupWithName:forPlayerID:", v4, v6));

  return v7;
}

@end
