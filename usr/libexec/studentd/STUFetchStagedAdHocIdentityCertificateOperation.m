@implementation STUFetchStagedAdHocIdentityCertificateOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchStagedAdHocIdentityCertificateOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchStagedAdHocIdentityCertificateRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2D40);
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
  void *v11;
  id v12;

  v12 = (id)objc_opt_new(CRKFetchStagedAdHocIdentityCertificateResultObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configurationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stagedClientIdentityForGroupIdentifier:", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "certificate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataRepresentation"));
  objc_msgSend(v12, "setStagedAdHocIdentityCertificate:", v11);

  -[STUFetchStagedAdHocIdentityCertificateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v12);
}

@end
