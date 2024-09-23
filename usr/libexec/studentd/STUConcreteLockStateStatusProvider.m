@implementation STUConcreteLockStateStatusProvider

- (BOOL)isLocked
{
  return SBSGetScreenLockStatus(0, a2) != 0;
}

- (id)subscribeToLockStateChanges:(id)a3
{
  id v3;
  CRKConcreteDarwinNotificationPublisher *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_opt_new(CRKConcreteDarwinNotificationPublisher);
  v5 = objc_alloc((Class)NSString);
  v6 = objc_msgSend(v5, "initWithCString:encoding:", kSBSLockStateNotifyKey, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRKConcreteDarwinNotificationPublisher subscribeToNotificationWithName:handler:](v4, "subscribeToNotificationWithName:handler:", v6, v3));

  return v7;
}

@end
