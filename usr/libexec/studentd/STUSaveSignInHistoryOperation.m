@implementation STUSaveSignInHistoryOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _UNKNOWN **v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___STUSaveSignInHistoryOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKSaveSignInHistoryRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v10 = &off_1000D3B50;
LABEL_9:
      v11 = CATErrorWithCodeAndUserInfo(2, v10);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "item"));

  if (!v8)
  {
    if (a4)
    {
      v10 = &off_1000D3B78;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_opt_new(CRKSaveSignInHistoryResultObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signInHistoryStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appendItem:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  objc_msgSend(v10, "setHistory:", v9);

  -[STUSaveSignInHistoryOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);
}

@end
