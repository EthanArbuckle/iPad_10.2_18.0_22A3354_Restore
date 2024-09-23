@implementation DMDEchoOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFEchoRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2B68;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[3];
  uint64_t v22;
  const __CFString *v23;

  v6 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___DMDEchoOperation;
  if (!objc_msgSendSuper2(&v18, "validateRequest:error:", v6, a4))
    goto LABEL_11;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "echo"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_12;
    v22 = DMFInvalidParameterErrorKey;
    v23 = CFSTR("request.echo");
    v13 = &v23;
    v14 = &v22;
    goto LABEL_10;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultStatus"));
  if (v8)
  {
    v9 = (void *)v8;
    v21[0] = DMFRMEchoStatusOK;
    v21[1] = DMFRMEchoStatusPending;
    v21[2] = DMFRMEchoStatusFail;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultStatus"));
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) == 0)
    {
      if (!a4)
        goto LABEL_12;
      v19 = DMFInvalidParameterErrorKey;
      v20 = CFSTR("request.resultStatus");
      v13 = &v20;
      v14 = &v19;
LABEL_10:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
      v16 = DMFErrorWithCodeAndUserInfo(1, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v16);

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
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultStatus"));
  if (objc_msgSend(v4, "isEqualToString:", DMFRMEchoStatusOK))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultStatus"));
    v6 = objc_msgSend(v5, "isEqualToString:", DMFRMEchoStatusPending);

    if (!v6)
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 4);
      goto LABEL_6;
    }
  }
  v7 = (void *)objc_opt_new(DMFEchoResultObject);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "echo"));
  objc_msgSend(v7, "setEcho:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultStatus"));
  objc_msgSend(v7, "setResultStatus:", v9);

  -[DMDEchoOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);
LABEL_6:

}

@end
