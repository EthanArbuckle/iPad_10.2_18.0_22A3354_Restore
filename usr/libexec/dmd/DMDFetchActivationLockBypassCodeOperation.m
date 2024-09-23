@implementation DMDFetchActivationLockBypassCodeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchActivationLockBypassCodeRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2BB0;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSErrorUserInfoKey v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection", a3));
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchActivationLockBypassKeyWithError:", &v11));
  v6 = v11;

  if (v5)
  {
    v7 = objc_msgSend(objc_alloc((Class)DMFFetchActivationLockBypassCodeResultObject), "initWithBypassCode:", v5);
    -[DMDFetchActivationLockBypassCodeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);
  }
  else if (v6)
  {
    v12 = NSUnderlyingErrorKey;
    v13 = v6;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v8 = DMFErrorWithCodeAndUserInfo(3601, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[DMDFetchActivationLockBypassCodeOperation endOperationWithError:](self, "endOperationWithError:", v9);

  }
  else
  {
    v10 = DMFErrorWithCodeAndUserInfo(3600, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue(v10);
    -[DMDFetchActivationLockBypassCodeOperation endOperationWithError:](self, "endOperationWithError:", v7);
  }

}

@end
