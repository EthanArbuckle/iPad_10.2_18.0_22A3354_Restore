@implementation REMDaemonUserDefaults

- (int64_t)schedulingState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMDaemonUserDefaults cloudKitSchemaCatchUpSyncSchedulingState](self, "cloudKitSchemaCatchUpSyncSchedulingState"));
  v3 = objc_msgSend(v2, "integerValue");

  if ((unint64_t)v3 >= 3)
    return 3;
  else
    return (int64_t)v3;
}

- (void)setSchedulingState:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[REMDaemonUserDefaults setCloudKitSchemaCatchUpSyncSchedulingState:](self, "setCloudKitSchemaCatchUpSyncSchedulingState:", v4);

}

- (NSDate)lastScheduledDate
{
  return (NSDate *)-[REMDaemonUserDefaults cloudKitSchemaCatchUpSyncLastScheduledDate](self, "cloudKitSchemaCatchUpSyncLastScheduledDate");
}

- (void)setLastScheduledDate:(id)a3
{
  -[REMDaemonUserDefaults setCloudKitSchemaCatchUpSyncLastScheduledDate:](self, "setCloudKitSchemaCatchUpSyncLastScheduledDate:", a3);
}

- (void)setDebugForceSupportBackgroundScheduling:(BOOL)a3
{
  -[REMDaemonUserDefaults setDebugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling:](self, "setDebugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling:", a3);
}

@end
