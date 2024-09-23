@implementation DMDRemoveProfileOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRemoveProfileRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2FB8;
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
  v11.super_class = (Class)&OBJC_METACLASS___DMDRemoveProfileOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profileIdentifier"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.profileIdentifier");
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "profileIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "installedProfileWithIdentifier:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if (objc_msgSend(v7, "runAsUser"))
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveProfileOperation request](self, "request"));
      v12 = objc_msgSend(v11, "type");

      if (v12 != (id)1)
      {
        v13 = 1;
        goto LABEL_8;
      }
    }
    v13 = 2;
LABEL_8:
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100061738;
    v14[3] = &unk_1000BAD98;
    v14[4] = self;
    -[DMDRemoveProfileOperation removeProfileWithIdentifier:installationType:completion:](self, "removeProfileWithIdentifier:installationType:completion:", v4, v13, v14);
    goto LABEL_9;
  }
  v15 = DMFProfileIdentifierErrorKey;
  v16 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v9 = DMFErrorWithCodeAndUserInfo(1901, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[DMDRemoveProfileOperation endOperationWithError:](self, "endOperationWithError:", v10);

LABEL_9:
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v9, "removeProfileAsyncWithIdentifier:installationType:completion:", v8, a4, v7);

}

@end
