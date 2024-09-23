@implementation DMDInstallManagedBookOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFInstallManagedBookRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2DF0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_super v17;
  uint64_t v18;
  const __CFString *v19;

  v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___DMDInstallManagedBookOperation;
  if (!objc_msgSendSuper2(&v17, "validateRequest:error:", v6, a4))
    goto LABEL_14;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentID"));

    if (!v8)
    {
      if (a4)
      {
        v9 = 1501;
LABEL_11:
        v13 = DMFErrorWithCodeAndUserInfo(v9, 0);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iTunesStoreID"));

    if (!v10)
    {
      if (a4)
      {
        v9 = 1004;
        goto LABEL_11;
      }
LABEL_14:
      v12 = 0;
      goto LABEL_15;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originator"));

    if (!v11)
    {
      if (a4)
      {
        v18 = DMFInvalidParameterErrorKey;
        v19 = CFSTR("request.originator");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        v15 = DMFErrorWithCodeAndUserInfo(1, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v15);

      }
      goto LABEL_14;
    }
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void ***v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  DMDInstallManagedBookOperation *v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDInstallManagedBookOperation: run")));
  if ((MCHasMDMMigrated() & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iTunesStoreID"));
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10004A5D4;
    v21 = &unk_1000BB258;
    v22 = self;
    v7 = v5;
    v23 = v7;
    v8 = objc_retainBlock(&v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDManagedMediaManager sharedManager](DMDManagedMediaManager, "sharedManager", v18, v19, v20, v21, v22));
    if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originator"));
      objc_msgSend(v9, "installStoreBookWithiTunesStoreID:originator:assertion:completionBlock:", v6, v10, v7, v8);
    }
    else
    {
      v10 = (void *)objc_opt_new(MDMBook);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentID"));
      objc_msgSend(v10, "setPersistentID:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
      objc_msgSend(v10, "setAuthor:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
      objc_msgSend(v10, "setTitle:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "version"));
      objc_msgSend(v10, "setVersion:", v14);

      v15 = (unint64_t)objc_msgSend(v4, "type");
      if (v15 > 2)
        v16 = 0;
      else
        v16 = *off_1000BB278[v15];
      objc_msgSend(v10, "setKind:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      objc_msgSend(v9, "installNonStoreBook:fileExtension:URL:assertion:completionBlock:", v10, v16, v17, v7, v8);

    }
  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1650);
  }

}

@end
