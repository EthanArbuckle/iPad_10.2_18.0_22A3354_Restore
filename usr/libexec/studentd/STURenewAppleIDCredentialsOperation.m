@implementation STURenewAppleIDCredentialsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STURenewAppleIDCredentialsOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKRenewAppleIDCredentialsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D35B0);
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
  id v4;
  STUAccountCredentialRenewalOptions *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = objc_opt_new(STUAccountCredentialRenewalOptions);
  -[STUAccountCredentialRenewalOptions setForce:](v5, "setForce:", objc_msgSend(v4, "force"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reason"));

  -[STUAccountCredentialRenewalOptions setReason:](v5, "setReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURenewAppleIDCredentialsOperation accountsPrimitives](self, "accountsPrimitives"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003716C;
  v8[3] = &unk_1000CA240;
  v8[4] = self;
  objc_msgSend(v7, "renewPrimaryAppleIDCredentialsWithOptions:completion:", v5, v8);

}

- (id)accountsPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsPrimitives"));

  return v4;
}

@end
