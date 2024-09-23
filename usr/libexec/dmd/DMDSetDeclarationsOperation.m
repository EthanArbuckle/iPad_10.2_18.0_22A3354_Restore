@implementation DMDSetDeclarationsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetDeclarationsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3120;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006385C;
    v9[3] = &unk_1000BBCE0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "handleSetDeclarationsRequest:completionHandler:", v4, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = DMFErrorWithCodeAndUserInfo(4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDSetDeclarationsOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
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
  v14.super_class = (Class)&OBJC_METACLASS___DMDSetDeclarationsOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_11;
    v17 = DMFInvalidParameterErrorKey;
    v18 = CFSTR("request.organizationIdentifier");
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syncToken"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_11;
    v15 = DMFInvalidParameterErrorKey;
    v16 = CFSTR("request.syncToken");
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

@end
