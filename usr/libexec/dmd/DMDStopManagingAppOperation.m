@implementation DMDStopManagingAppOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFStopManagingAppRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3228;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  DMDStopManagingAppOperation *v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managementInformationForBundleIdentifier:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065ADC;
  v11[3] = &unk_1000BB710;
  v12 = v5;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v8, "setRemovability:forBundleIdentifier:completion:", 0, v10, v11);

}

@end
