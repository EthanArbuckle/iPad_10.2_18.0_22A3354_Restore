@implementation STUFetchMDMIdentityOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchMDMIdentityOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchMDMIdentityRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3F60);
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
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[CRKMDMIdentityProvider identity](CRKMDMIdentityProvider, "identity", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", ")));

  if (-[STUFetchMDMIdentityOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUFetchMDMIdentityOperation isCancelled](self, "isCancelled"))
    {
      v7 = CATErrorWithCodeAndUserInfo(404, 0);
      v8 = objc_claimAutoreleasedReturnValue(v7);
    }
    else
    {
      if (v11)
      {
        v9 = (void *)objc_opt_new(CRKFetchMDMIdentityResultObject);
        objc_msgSend(v9, "setMdmIdentityCommonName:", v6);
        -[STUFetchMDMIdentityOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v9);
LABEL_8:

        goto LABEL_9;
      }
      v10 = CRKErrorWithCodeAndUserInfo(17, 0);
      v8 = objc_claimAutoreleasedReturnValue(v10);
    }
    v9 = (void *)v8;
    -[STUFetchMDMIdentityOperation endOperationWithError:](self, "endOperationWithError:", v8);
    goto LABEL_8;
  }
LABEL_9:

}

@end
