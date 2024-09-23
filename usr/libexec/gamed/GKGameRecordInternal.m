@implementation GKGameRecordInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  objc_super v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "game"));
  v19.receiver = self;
  v19.super_class = (Class)GKGameRecordInternal;
  -[GKGameRecordInternal updateWithCacheObject:](&v19, "updateWithCacheObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPlayedDate"));
  -[GKGameRecordInternal setLastPlayedDate:](self, "setLastPlayedDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "purchaseDate"));
  -[GKGameRecordInternal setPurchaseDate:](self, "setPurchaseDate:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rank"));
  -[GKGameRecordInternal setRank:](self, "setRank:", objc_msgSend(v8, "unsignedIntegerValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maxRank"));
  -[GKGameRecordInternal setMaxRank:](self, "setMaxRank:", objc_msgSend(v9, "unsignedIntegerValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendRank"));
  -[GKGameRecordInternal setFriendRank:](self, "setFriendRank:", (unsigned __int16)objc_msgSend(v10, "unsignedIntegerValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maxFriendRank"));
  -[GKGameRecordInternal setMaxFriendRank:](self, "setMaxFriendRank:", (unsigned __int16)objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "achievements"));
  -[GKGameRecordInternal setAchievements:](self, "setAchievements:", (unsigned __int16)objc_msgSend(v12, "unsignedIntegerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "achievementPoints"));
  -[GKGameRecordInternal setAchievementPoints:](self, "setAchievementPoints:", (__int16)objc_msgSend(v13, "unsignedIntegerValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultLeaderboardIdentifier"));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "game"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultCategory"));

  }
  -[GKGameRecordInternal setDefaultLeaderboardIdentifier:](self, "setDefaultLeaderboardIdentifier:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  -[GKGameRecordInternal setValid:](self, "setValid:", v18 > 0.0);

}

@end
