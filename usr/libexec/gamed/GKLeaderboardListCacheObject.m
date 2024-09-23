@implementation GKLeaderboardListCacheObject

+ (id)entityName
{
  return CFSTR("LeaderboardList");
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardListCacheObject;
  v6 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v8, "updateWithServerRepresentation:expirationDate:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("results"), v8.receiver, v8.super_class));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v7, &stru_1002C27A8, 1);
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKLeaderboardListCacheObject game](self, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = v4 != 0;

  return v5;
}

@end
