@implementation DMDRemoveProvisioningProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRemoveProvisioningProfileRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2FE8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDRemoveProvisioningProfileOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profileIdentifier"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_11;
    v17 = DMFInvalidParameterErrorKey;
    v18 = CFSTR("request.profileIdentifier");
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managingProfileIdentifier"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_11;
    v15 = DMFInvalidParameterErrorKey;
    v16 = CFSTR("request.managingProfileIdentifier");
    v9 = &v16;
    v10 = &v15;
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, 1));
    v12 = DMFErrorWithCodeAndUserInfo(1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSErrorUserInfoKey v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managingProfileIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dependentsOfParent:inDomain:", v7, kMCDMManagingProfileToProvisioningProfileKey));
  if ((objc_msgSend(v8, "containsObject:", v5) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v16 = 0;
    v10 = objc_msgSend(v9, "removeProvisioningProfileWithUUID:outError:", v5, &v16);
    v11 = v16;

    if (v10)
    {
      -[DMDRemoveProvisioningProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
    else
    {
      if (v11)
      {
        v17 = NSUnderlyingErrorKey;
        v18 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
        v13 = DMFErrorWithCodeAndUserInfo(1202, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        -[DMDRemoveProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v14);

      }
      else
      {
        v15 = DMFErrorWithCodeAndUserInfo(1202, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[DMDRemoveProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v12);
      }

    }
  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1201);
  }

}

@end
