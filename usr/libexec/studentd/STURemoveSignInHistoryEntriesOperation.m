@implementation STURemoveSignInHistoryEntriesOperation

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
  v13.super_class = (Class)&OBJC_METACLASS___STURemoveSignInHistoryEntriesOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKRemoveSignInHistoryEntriesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v10 = &off_1000D2B10;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifiers"));

  if (!v8)
  {
    if (a4)
    {
      v10 = &off_1000D2B38;
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
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = (id)objc_opt_new(CRKFetchSignInHistoryResultObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signInHistoryStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "removeItems:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  objc_msgSend(v13, "setHistory:", v9);

  objc_msgSend(v13, "setIsTruncated:", objc_msgSend(v8, "isTruncated"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "signInHistoryStorage"));
  objc_msgSend(v13, "setLimit:", objc_msgSend(v11, "limit"));

  objc_msgSend(v13, "setHistoryVersion:", objc_msgSend(v8, "historyVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ownerAppleID"));
  objc_msgSend(v13, "setOwnerAppleID:", v12);

  -[STURemoveSignInHistoryEntriesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v13);
}

@end
