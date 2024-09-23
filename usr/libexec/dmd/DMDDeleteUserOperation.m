@implementation DMDDeleteUserOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFDeleteUserRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2B38;
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
  v11.super_class = (Class)&OBJC_METACLASS___DMDDeleteUserOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.message");
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
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  DMDDeleteUserOperation *v20;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allUsers"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
    v10 = objc_msgSend(v9, "isEqualToString:", v7);

    if (v10)
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1801);
    }
    else
    {
      v20 = self;
      v21 = v4;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
LABEL_7:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "username"));
          v18 = objc_msgSend(v17, "isEqualToString:", v7);

          if ((v18 & 1) != 0)
            break;
          if (v13 == (id)++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v13)
              goto LABEL_7;
            goto LABEL_13;
          }
        }
        v19 = v16;

        if (!v19)
          goto LABEL_18;
        v4 = v21;
        if (objc_msgSend(v19, "hasDataToSync")
          && (objc_msgSend(v21, "forceDeletion") & 1) == 0)
        {
          -[DMDTaskOperation endOperationWithDMFErrorCode:](v20, "endOperationWithDMFErrorCode:", 1803);
        }
        else
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100035DF4;
          v22[3] = &unk_1000BAD98;
          v22[4] = v20;
          objc_msgSend(v5, "deleteUser:completionHandler:", v19, v22);
        }

      }
      else
      {
LABEL_13:

LABEL_18:
        -[DMDTaskOperation endOperationWithDMFErrorCode:](v20, "endOperationWithDMFErrorCode:", 1802);
        v4 = v21;
      }
    }

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1700);
  }

}

@end
