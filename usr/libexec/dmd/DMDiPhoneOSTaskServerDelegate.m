@implementation DMDiPhoneOSTaskServerDelegate

- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unsigned int v18;
  uid_t v19;
  void *v20;
  unsigned __int8 v21;
  _BOOL4 v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v32;
  id v33;

  v9 = *(_QWORD *)&a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)DMDiPhoneOSTaskServerDelegate;
  v33 = 0;
  v14 = -[DMDTaskServerDelegate operationForRequest:targetUID:appleID:transport:error:](&v32, "operationForRequest:targetUID:appleID:transport:error:", a3, v9, v12, v13, &v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v33;
  v17 = objc_opt_class(CATXPCTransport);
  if ((objc_opt_isKindOfClass(v13, v17) & 1) == 0)
    goto LABEL_28;
  v18 = objc_msgSend(v13, "effectiveUserIdentifier");
  v19 = getuid();
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAccountUtilities primaryAppleID](DMDAccountUtilities, "primaryAppleID"));
  v21 = objc_msgSend(v12, "isEqualToString:", v20);

  if (v18 && v18 != (_DWORD)v9)
  {
    if (!(_DWORD)v9 && !v12)
    {
      v22 = 0;
      goto LABEL_24;
    }
    if (!v12)
      goto LABEL_20;
    if ((v21 & 1) != 0)
    {
      if (v18 == v19)
      {
        v22 = 1;
        if (!(_DWORD)v9)
          goto LABEL_24;
        goto LABEL_12;
      }
LABEL_20:
      v22 = v12 != 0;
      v24 = 5;
      goto LABEL_23;
    }
    v22 = 1;
LABEL_22:
    v24 = 4800;
    goto LABEL_23;
  }
  v22 = v12 != 0;
  if (v12)
    v23 = v21;
  else
    v23 = 1;
  if ((v23 & 1) == 0)
    goto LABEL_22;
  if (!(_DWORD)v9)
    goto LABEL_24;
LABEL_12:
  if (!v22 && v19 != (_DWORD)v9)
  {
    v22 = 0;
    v24 = 4801;
LABEL_23:
    v25 = DMFErrorWithCodeAndUserInfo(v24, 0);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    v16 = (id)v26;
  }
LABEL_24:
  if ((_DWORD)v9)
    v27 = 1;
  else
    v27 = v22;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));
  objc_msgSend(v28, "setRunAsUser:", v27);

LABEL_28:
  if (a7)
    *a7 = objc_retainAutorelease(v16);
  if (v16)
    v29 = 0;
  else
    v29 = v15;
  v30 = v29;

  return v30;
}

@end
