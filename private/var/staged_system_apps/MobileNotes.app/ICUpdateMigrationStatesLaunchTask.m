@implementation ICUpdateMigrationStatesLaunchTask

- (void)runLaunchTask
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Update Migration States"), &stru_100551978);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  +[ICMigrationUtilities updateAllLegacyAccountMigrationStatesInContext:](ICMigrationUtilities, "updateAllLegacyAccountMigrationStatesInContext:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "endBackgroundTask:", v4);

}

@end
