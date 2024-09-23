@implementation GKPlayerToInviteCacheObject

+ (id)entityName
{
  return CFSTR("PlayerToInvite");
}

- (id)internalRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerToInviteCacheObject managedObjectContext](self, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerToInviteCacheObject playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfileWithPlayerID:inManagedObjectContext:", v4, v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerInternal internalRepresentationForCacheObject:](GKPlayerInternal, "internalRepresentationForCacheObject:", v5));
  return v6;
}

@end
