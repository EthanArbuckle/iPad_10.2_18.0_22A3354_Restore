@implementation MSDSystemAppsDataPrepareOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_prepareForSystemAppDataInstall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (BOOL)_prepareForSystemAppDataInstall
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  objc_msgSend(v2, "saveRequiredDeletableSystemApps");
  objc_msgSend(v2, "installAndWaitForSystemApps");

  return 1;
}

@end
