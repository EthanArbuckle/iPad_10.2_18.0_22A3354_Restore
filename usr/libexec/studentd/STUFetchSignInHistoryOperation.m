@implementation STUFetchSignInHistoryOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchSignInHistoryOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchSignInHistoryRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D38D0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_opt_new(CRKFetchSignInHistoryResultObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "signInHistoryStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "history"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  objc_msgSend(v11, "setHistory:", v7);

  objc_msgSend(v11, "setIsTruncated:", objc_msgSend(v6, "isTruncated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "signInHistoryStorage"));
  objc_msgSend(v11, "setLimit:", objc_msgSend(v9, "limit"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ownerAppleID"));
  objc_msgSend(v11, "setOwnerAppleID:", v10);

  objc_msgSend(v11, "setHistoryVersion:", objc_msgSend(v6, "historyVersion"));
  -[STUFetchSignInHistoryOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);

}

@end
