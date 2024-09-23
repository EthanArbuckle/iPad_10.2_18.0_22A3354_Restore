@implementation GKLeaderboardTitleMapListCacheObject

+ (id)entityName
{
  return CFSTR("LeaderboardTitleMapList");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKLeaderboardSetCacheObject, a2);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardTitleMapListCacheObject;
  v6 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v8, "updateWithServerRepresentation:expirationDate:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("results"), v8.receiver, v8.super_class));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v7, &stru_1002C2788, 1);
}

@end
