@implementation DMDSetAppTapToPayScreenLockOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetAppTapToPayScreenLockRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3180;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tapToPayScreenLock"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100064228;
  v10[3] = &unk_1000BAD98;
  v10[4] = self;
  objc_msgSend(v8, "setTapToPayScreenLock:forBundleIdentifier:completion:", v9, v6, v10);

}

@end
