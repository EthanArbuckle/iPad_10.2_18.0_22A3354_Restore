@implementation STUDumpASMCredentialsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUDumpASMCredentialsOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKDumpASMCredentialsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D2E08);
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
  id v5;

  v5 = (id)objc_opt_new(CRKDumpASMCredentialsResultObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDumpASMCredentialsOperation credentials](self, "credentials"));
  objc_msgSend(v5, "setCredentials:", v4);

  -[STUDumpASMCredentialsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
}

- (id)credentials
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKASMCredentialStoreFactory studentCredentialStore](CRKASMCredentialStoreFactory, "studentCredentialStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKASMCredentialStoreFactory instructorCredentialStore](CRKASMCredentialStoreFactory, "instructorCredentialStore"));
  v8[0] = CFSTR("Student");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "debugInfo"));
  v8[1] = CFSTR("Instructor");
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugInfo"));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return v6;
}

@end
