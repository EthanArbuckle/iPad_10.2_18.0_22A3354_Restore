@implementation REMCDSharedToMeReminderPlaceholder

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    sub_10067E784(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSharedToMeReminderPlaceholder reminder](self, "reminder"));
  v7 = objc_msgSend(v6, "isConnectedToAccountObject:", v4);

  return v7;
}

- (void)debug_lowLevelRemoveFromParent
{
  -[REMCDSharedToMeReminderPlaceholder setReminder:](self, "setReminder:", 0);
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMSharedToMeReminderPlaceholder cdEntityName](REMSharedToMeReminderPlaceholder, "cdEntityName");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDSharedToMeReminderPlaceholder"));
}

@end
