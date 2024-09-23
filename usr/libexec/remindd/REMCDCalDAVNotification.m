@implementation REMCDCalDAVNotification

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDCalDAVNotification"));
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDCalDAVNotification owner](self, "owner"));
  v6 = objc_msgSend(v5, "isConnectedToAccountObject:", v4);

  return v6;
}

- (void)debug_lowLevelRemoveFromParent
{
  -[REMCDCalDAVNotification setOwner:](self, "setOwner:", 0);
}

+ (BOOL)shouldSyncToCloud
{
  return 0;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMCalDAVNotification cdEntityName](REMCalDAVNotification, "cdEntityName");
}

@end
