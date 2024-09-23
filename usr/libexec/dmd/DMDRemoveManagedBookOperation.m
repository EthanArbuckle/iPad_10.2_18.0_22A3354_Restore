@implementation DMDRemoveManagedBookOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRemoveManagedBookRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2F88;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDRemoveManagedBookOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentID"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iTunesStoreID"));

    if (v8)
      goto LABEL_5;
    if (a4)
    {
      v10 = DMFErrorWithCodeAndUserInfo(1600, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }

LABEL_5:
  v9 = 1;
LABEL_9:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void ***v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  DMDRemoveManagedBookOperation *v14;
  id v15;

  v4 = a3;
  if ((MCHasMDMMigrated() & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDManagedMediaManager sharedManager](DMDManagedMediaManager, "sharedManager"));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100061270;
    v13 = &unk_1000B9BA8;
    v14 = self;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDRemoveManagedBookOperation: run")));
    v15 = v6;
    v7 = objc_retainBlock(&v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentID", v10, v11, v12, v13, v14));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentID"));
      objc_msgSend(v5, "removeNonStoreBookWithPersistentID:assertion:completionBlock:", v9, v6, v7);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iTunesStoreID"));
      objc_msgSend(v5, "removeStoreBookWithiTunesStoreID:assertion:completionBlock:", v9, v6, v7);
    }

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1650);
  }

}

@end
