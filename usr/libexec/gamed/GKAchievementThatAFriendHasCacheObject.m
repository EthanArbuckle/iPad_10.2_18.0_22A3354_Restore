@implementation GKAchievementThatAFriendHasCacheObject

+ (id)entityName
{
  return CFSTR("AchievementThatAFriendHas");
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friend")));
  -[GKAchievementThatAFriendHasCacheObject setFriend:](self, "setFriend:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp")));
  -[GKAchievementThatAFriendHasCacheObject setTimestamp:](self, "setTimestamp:", v6);

}

- (id)internalRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKAchievementThatAFriendHasInternal internalRepresentation](GKAchievementThatAFriendHasInternal, "internalRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementThatAFriendHasCacheObject friend](self, "friend"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internalRepresentation"));
  objc_msgSend(v3, "setFriendPlayer:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementThatAFriendHasCacheObject timestamp](self, "timestamp"));
  objc_msgSend(v3, "setTimestamp:", v6);

  return v3;
}

@end
