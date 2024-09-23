@implementation GKPurgeableCacheObject

- (BOOL)purgeable
{
  return 1;
}

- (void)purge
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = -[GKPurgeableCacheObject purgeable](self, "purgeable");
  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GKPurgeableCacheObject managedObjectContext](self, "managedObjectContext"));
    objc_msgSend(v5, "deleteObject:", self);

  }
  else
  {
    if (!os_log_GKGeneral)
      v4 = (id)GKOSLoggers(v3);
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
      sub_1000F6734();
  }
}

@end
