@implementation DMDInstallProvisioningProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFInstallProvisioningProfileRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2E20;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  const __CFString *v13;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDInstallProvisioningProfileOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profileData"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.profileData");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSErrorUserInfoKey v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managingProfileIdentifier"));

  v13 = 0;
  LODWORD(v4) = objc_msgSend(v5, "installProvisioningProfileData:managingProfileIdentifier:outError:", v6, v7, &v13);
  v8 = v13;

  if ((_DWORD)v4)
  {
    -[DMDInstallProvisioningProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (v8)
    {
      v14 = NSUnderlyingErrorKey;
      v15 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v10 = DMFErrorWithCodeAndUserInfo(2800, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[DMDInstallProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v11);

    }
    else
    {
      v12 = DMFErrorWithCodeAndUserInfo(2800, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[DMDInstallProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v9);
    }

  }
}

@end
