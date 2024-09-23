@implementation STULeaveControlGroupOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___STULeaveControlGroupOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKLeaveControlGroupRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(DMFLeaveControlGroupRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v13 = CATErrorWithCodeAndUserInfo(2, &off_1000D35D8);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
        goto LABEL_11;
      }
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "groupIdentifierForRequest:", v6));
  v10 = (void *)v9;
  v11 = v9 != 0;
  if (a4 && !v9)
  {
    v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D3600);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

LABEL_11:
  return v11;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationManager"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STULeaveControlGroupOperation groupIdentifier](self, "groupIdentifier"));
  v9 = 0;
  v7 = objc_msgSend(v5, "removeEnrollmentRecordWithIdentifier:error:", v6, &v9);
  v8 = v9;

  if ((v7 & 1) != 0)
    -[STULeaveControlGroupOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  else
    -[STULeaveControlGroupOperation endOperationWithError:](self, "endOperationWithError:", v8);

}

+ (id)groupIdentifierForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = objc_opt_class(CRKLeaveControlGroupRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  }
  else
  {
    v9 = v3;
    v10 = objc_opt_class(DMFLeaveControlGroupRequest);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupIdentifier"));
  }

  return v8;
}

- (id)groupIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STULeaveControlGroupOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupIdentifierForRequest:", v4));

  return v5;
}

@end
