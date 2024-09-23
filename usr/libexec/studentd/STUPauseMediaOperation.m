@implementation STUPauseMediaOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUPauseMediaOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKPauseMediaRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D3768);
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

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4;
  id v5;

  if (-[STUPauseMediaOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[STUPauseMediaOperation isCancelled](self, "isCancelled"))
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(v4);
      -[STUPauseMediaOperation endOperationWithError:](self, "endOperationWithError:", v5);

    }
    else
    {
      -[STUTaskOperation askUserPermissionForFeature:alertModel:](self, "askUserPermissionForFeature:alertModel:", 0, 0);
    }
  }
}

- (void)askOperationDidFinish:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[STUPauseMediaOperation isExecuting](self, "isExecuting");
  v5 = v10;
  if (v4)
  {
    if (-[STUPauseMediaOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUPauseMediaOperation request](self, "request"));
        -[STUPauseMediaOperation performRequest:](self, "performRequest:", v9);
        goto LABEL_8;
      }
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    }
    v9 = (void *)v7;
    -[STUPauseMediaOperation endOperationWithError:](self, "endOperationWithError:", v7);
LABEL_8:

    v5 = v10;
  }

}

- (void)performRequest:(id)a3
{
  uint64_t v4;
  id v5;

  if (MRMediaRemoteSendCommand(1, 0))
  {
    -[STUPauseMediaOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    v4 = CRKErrorWithCodeAndUserInfo(119, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[STUPauseMediaOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
}

@end
