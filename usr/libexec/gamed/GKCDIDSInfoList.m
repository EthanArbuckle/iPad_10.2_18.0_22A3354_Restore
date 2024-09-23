@implementation GKCDIDSInfoList

+ (id)_gkPrimaryListWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GKCDIDSInfoList *v7;
  GKCDIDSInfoList *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfoList _gkObjectsMatchingPredicate:withContext:](GKCDIDSInfoList, "_gkObjectsMatchingPredicate:withContext:", 0, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = [GKCDIDSInfoList alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entity"));
    v7 = -[GKCDIDSInfoList initWithEntity:insertIntoManagedObjectContext:](v8, "initWithEntity:insertIntoManagedObjectContext:", v9, v4);

  }
  return v7;
}

- (void)_gkReset
{
  id v3;
  NSObject *v4;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_100133CA8(v4);
  -[GKCDIDSInfoList setUpdateIntervalStartTimeStamp:](self, "setUpdateIntervalStartTimeStamp:", 0);
  -[GKCDIDSInfoList setUpdateIntervalHandlesCount:](self, "setUpdateIntervalHandlesCount:", 0);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("IDSInfoList"));
}

@end
