@implementation MISharedAppNotificationManager

+ (id)instanceForCurrentUser
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EF24;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DF68 != -1)
    dispatch_once(&qword_10009DF68, block);
  return (id)qword_10009DF60;
}

- (MISharedAppNotificationManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MISharedAppNotificationManager;
  return -[MISharedAppNotificationManager init](&v3, "init");
}

- (BOOL)markAppAsUpdatedForOtherUsers:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v6 = sub_100010E50((uint64_t)"-[MISharedAppNotificationManager markAppAsUpdatedForOtherUsers:error:]", 42, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v4, (uint64_t)"-[MISharedAppNotificationManager markAppAsUpdatedForOtherUsers:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (id)updatedAppsWithError:(id *)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;

  v5 = sub_100010E50((uint64_t)"-[MISharedAppNotificationManager updatedAppsWithError:]", 51, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v3, (uint64_t)"-[MISharedAppNotificationManager updatedAppsWithError:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return 0;
}

- (BOOL)clearPendingUpdates:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v6 = sub_100010E50((uint64_t)"-[MISharedAppNotificationManager clearPendingUpdates:error:]", 60, MIInstallerErrorDomain, 4, 0, 0, CFSTR("%s is not yet implemented"), v4, (uint64_t)"-[MISharedAppNotificationManager clearPendingUpdates:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

@end
