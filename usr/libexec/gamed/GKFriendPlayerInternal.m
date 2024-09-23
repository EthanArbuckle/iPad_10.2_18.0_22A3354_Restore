@implementation GKFriendPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKFriendPlayerInternal;
  v4 = a3;
  -[GKFriendPlayerInternal updateWithCacheObject:](&v8, "updateWithCacheObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status", v8.receiver, v8.super_class));
  -[GKFriendPlayerInternal setStatus:](self, "setStatus:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPlayedDate"));
  -[GKFriendPlayerInternal setLastPlayedDate:](self, "setLastPlayedDate:", v6);

  -[GKFriendPlayerInternal setChallengedTogether:](self, "setChallengedTogether:", objc_msgSend(v4, "challengedTogether"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastChallengedDate"));

  -[GKFriendPlayerInternal setLastChallengedDate:](self, "setLastChallengedDate:", v7);
}

+ (int)familiarity
{
  return 1;
}

@end
