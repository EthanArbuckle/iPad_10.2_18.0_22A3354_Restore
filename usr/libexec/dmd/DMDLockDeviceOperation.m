@implementation DMDLockDeviceOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFLockDeviceRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2E50;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DMDLockDeviceOperation *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSErrorUserInfoKey v16;
  void *v17;

  v4 = a3;
  +[DMDLockUtilities lockDevice](DMDLockUtilities, "lockDevice");
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if ((objc_msgSend(v7, "isMultiUser") & 1) == 0)
  {

    if (!(v5 | v6))
      goto LABEL_4;
    v8 = (void *)objc_opt_new(FMDLostModeInfo);
    objc_msgSend(v8, "setMessage:", v5);
    objc_msgSend(v8, "setPhoneNumber:", v6);
    objc_msgSend(v8, "setLostModeEnabled:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enableLostModeWithInfo:", v8));

    if (v10)
    {
      if (objc_msgSend(v10, "code") == (id)7)
      {
        v11 = self;
        v12 = 301;
      }
      else
      {
        if (objc_msgSend(v10, "code") != (id)8)
        {
          v16 = NSUnderlyingErrorKey;
          v17 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
          v14 = DMFErrorWithCodeAndUserInfo(300, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          -[DMDLockDeviceOperation endOperationWithError:](self, "endOperationWithError:", v15);

          goto LABEL_13;
        }
        v11 = self;
        v12 = 302;
      }
      -[DMDTaskOperation endOperationWithDMFErrorCode:](v11, "endOperationWithDMFErrorCode:", v12);
    }
    else
    {
      -[DMDLockDeviceOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
LABEL_13:

    goto LABEL_14;
  }

LABEL_4:
  -[DMDLockDeviceOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
LABEL_14:

}

@end
