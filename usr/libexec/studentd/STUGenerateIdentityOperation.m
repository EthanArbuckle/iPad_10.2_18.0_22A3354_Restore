@implementation STUGenerateIdentityOperation

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
  v13.super_class = (Class)&OBJC_METACLASS___STUGenerateIdentityOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKGenerateIdentityRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v10 = &off_1000D3560;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commonName"));

  if (!v8)
  {
    if (a4)
    {
      v10 = &off_1000D3588;
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
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keychain"));

  v6 = objc_alloc((Class)CRKIdentityConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonName"));

  v8 = objc_msgSend(v6, "initWithCommonName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "makeIdentityWithConfiguration:", v8));
  if (v9)
  {
    v10 = (void *)objc_opt_new(CRKGenerateIdentityResultObject);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "certificate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataRepresentation"));
    objc_msgSend(v10, "setCertificateData:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataRepresentation"));
    objc_msgSend(v10, "setPrivateKeyData:", v14);

    -[STUGenerateIdentityOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);
  }
  else
  {
    v15 = CRKErrorWithCodeAndUserInfo(27, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[STUGenerateIdentityOperation endOperationWithError:](self, "endOperationWithError:", v10);
  }

}

@end
