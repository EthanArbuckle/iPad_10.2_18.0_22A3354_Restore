@implementation MIObsoleteUpgradeCleaner

+ (BOOL)cleanUpgradesWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "systemAppBundleIDToInfoMap"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "internalAppBundleIDToInfoMap"));

  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &stru_100085640);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &stru_100085640);

  return 1;
}

@end
