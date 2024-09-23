@implementation STULeaveControlGroupsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  if (!v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STULeaveControlGroupsOperation.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___STULeaveControlGroupsOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v7, a4))
    goto LABEL_12;
  v8 = objc_opt_class(CRKLeaveControlGroupsRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    if (a4)
    {
      v11 = &off_1000D3628;
LABEL_11:
      v12 = CATErrorWithCodeAndUserInfo(2, v11);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_13;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifiers"));

  if (!v9)
  {
    if (a4)
    {
      v11 = &off_1000D3650;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v10 = 1;
LABEL_13:

  return v10;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STULeaveControlGroupsOperation.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifiers"));
  v12 = 0;
  v9 = objc_msgSend(v7, "removeEnrollmentRecordsWithIdentifiers:error:", v8, &v12);
  v10 = v12;

  if ((v9 & 1) != 0)
    -[STULeaveControlGroupsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  else
    -[STULeaveControlGroupsOperation endOperationWithError:](self, "endOperationWithError:", v10);

}

@end
