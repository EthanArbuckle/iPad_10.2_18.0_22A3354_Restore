@implementation DMDLogOutUserOperation

+ (id)whitelistedClassesForRequest
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = objc_opt_class(DMFLogOutUserRequest);
  v5[1] = objc_opt_class(DMFLogoutUserRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000C2E68;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUser"));
  v6 = objc_msgSend(v5, "isLoginUser");

  if (v6)
  {
    v7 = DMFErrorWithCodeAndUserInfo(2901, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDLogOutUserOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004C4AC;
    v9[3] = &unk_1000BAD98;
    v9[4] = self;
    objc_msgSend(v4, "switchToLoginUserWithCompletionHandler:", v9);
  }

}

@end
