@implementation DMDSetAppAllowUserToHideOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetAppAllowUserToHideRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C29E8;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allowUserToHide"));

  v13 = 0;
  v10 = objc_msgSend(v8, "setAllowUserToHide:forBundleIdentifier:error:", v9, v6, &v13);

  v11 = v13;
  if ((v10 & 1) != 0)
  {
    -[DMDSetAppAllowUserToHideOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
    objc_msgSend(v12, "sendManagedAppsChangedNotification");

    -[DMDSetAppAllowUserToHideOperation endOperationWithError:](self, "endOperationWithError:", v11);
  }

}

@end
