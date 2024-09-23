@implementation DMDInstallProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFInstallProfileRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2E08;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___DMDInstallProfileOperation;
  if (!objc_msgSendSuper2(&v16, "validateRequest:error:", v6, a4))
    goto LABEL_11;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profileData"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_12;
    v19 = DMFInvalidParameterErrorKey;
    v20 = CFSTR("request.profileData");
    v11 = &v20;
    v12 = &v19;
    goto LABEL_10;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managingProfileIdentifier"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v6, "style");

    if (v10 != (id)1)
    {
      if (!a4)
        goto LABEL_12;
      v17 = DMFInvalidParameterErrorKey;
      v18 = CFSTR("request.managingProfileIdentifier");
      v11 = &v18;
      v12 = &v17;
LABEL_10:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v12, 1));
      v14 = DMFErrorWithCodeAndUserInfo(1, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v14);

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_12;
    }
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profileData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managingProfileIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v7 = objc_msgSend(v6, "isSetupBuddyDone");

  v8 = objc_msgSend(v10, "style");
  if (v8 == (id)2)
  {
    if (!v7)
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2001);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v8 == (id)1)
  {
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaID"));
    -[DMDInstallProfileOperation _installSilentProfileData:managingProfileIdentifier:personaID:](self, "_installSilentProfileData:managingProfileIdentifier:personaID:", v4, v5, v9);

    goto LABEL_10;
  }
  if (!v8)
  {
    if (!v7 || getuid() == 502)
      goto LABEL_6;
LABEL_8:
    -[DMDInstallProfileOperation _installInteractiveProfile:](self, "_installInteractiveProfile:", v4);
  }
LABEL_10:

}

- (void)_installSilentProfileData:(id)a3 managingProfileIdentifier:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSErrorUserInfoKey v27;
  id v28;
  uint64_t v29;
  void *v30;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
  if (objc_msgSend(v12, "runAsUser"))
  {

LABEL_4:
    v15 = 2;
    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallProfileOperation request](self, "request"));
  v14 = objc_msgSend(v13, "type");

  if (v14 == (id)1)
    goto LABEL_4;
  v15 = 1;
LABEL_6:
  v29 = kMCInstallProfileOptionInstallationType;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
  v30 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v18 = objc_msgSend(v17, "mutableCopy");

  if (v8)
  {
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsInstalledByMDM);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, kMCInstallProfileOptionManagingProfileIdentifier);
  }
  if (v9)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, kMDMPersonaKey);
  v19 = objc_msgSend(v18, "copy");
  v26 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "installProfileData:options:outError:", v10, v19, &v26));

  v21 = v26;
  if (v20)
  {
    -[DMDInstallProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (v21)
    {
      v27 = NSUnderlyingErrorKey;
      v28 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v23 = DMFErrorWithCodeAndUserInfo(2002, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v24);

    }
    else
    {
      v25 = DMFErrorWithCodeAndUserInfo(2002, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v25);
      -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v22);
    }

  }
}

- (void)_installInteractiveProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSErrorUserInfoKey v20;
  id v21;
  NSErrorUserInfoKey v22;
  id v23;

  v4 = a3;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v4, &v19));
  v6 = v19;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    if (objc_msgSend(v8, "mustInstallProfileNonInteractively:", v5))
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2000);

    }
    else
    {
      v18 = v7;
      v12 = objc_msgSend(v8, "queueFileDataForAcceptance:originalFileName:outError:", v4, 0, &v18);
      v13 = v18;

      if (v13)
      {
        v20 = NSUnderlyingErrorKey;
        v21 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
        v15 = DMFErrorWithCodeAndUserInfo(2002, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v16);

      }
      else
      {
        -[DMDInstallProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
      }
    }
    v7 = v8;
  }
  else if (v6)
  {
    v22 = NSUnderlyingErrorKey;
    v23 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v10 = DMFErrorWithCodeAndUserInfo(2003, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v11);

  }
  else
  {
    v17 = DMFErrorWithCodeAndUserInfo(2003, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v7);
  }

}

@end
