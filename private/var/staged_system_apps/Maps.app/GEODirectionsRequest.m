@implementation GEODirectionsRequest

- (NSString)cacheKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersistenceManager sharedManager](PersistenceManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEODirectionsRequest waypointTypeds](self, "waypointTypeds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheKeyForWaypoints:", v4));

  return (NSString *)v5;
}

@end
