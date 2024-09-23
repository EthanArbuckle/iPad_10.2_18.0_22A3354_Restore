@implementation GKLeaderboardTitleMapCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardTitleMapCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v7, "updateWithServerRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category-name")));
  if (v5)
    -[GKLeaderboardTitleMapCacheObject setIdentifier:](self, "setIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category-title")));

  if (v6)
    -[GKLeaderboardTitleMapCacheObject setLocalizedTitle:](self, "setLocalizedTitle:", v6);

}

+ (id)entityName
{
  return CFSTR("LeaderboardTitleMap");
}

@end
