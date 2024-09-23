@implementation DMDValidateApplicationsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFValidateApplicationsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C32B8;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifiers"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006E778;
  v7[3] = &unk_1000BAD98;
  v7[4] = self;
  objc_msgSend(v5, "validateAppBundleIDs:completion:", v6, v7);

}

@end
