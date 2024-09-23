@implementation STUClearASMCredentialsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_super v23;

  v6 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___STUClearASMCredentialsOperation;
  if (!objc_msgSendSuper2(&v23, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKClearASMCredentialsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = objc_opt_class(CRKClearASMCredentialsRequest);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STUClearASMCredentialsOperation validateRequest:error:]"));
      v17 = (objc_class *)objc_opt_class(CRKClearASMCredentialsRequest);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (objc_class *)objc_opt_class(v8);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("STUClearASMCredentialsOperation.m"), 27, CFSTR("expected %@, got %@"), v19, v22);

    }
    if ((uint64_t)objc_msgSend(v8, "role") < 3)
    {
      if ((uint64_t)objc_msgSend(v8, "type") < 3)
      {
        v12 = 1;
        goto LABEL_17;
      }
      if (a4)
      {
        v10 = &off_1000D3718;
        goto LABEL_14;
      }
    }
    else if (a4)
    {
      v10 = &off_1000D36F0;
LABEL_14:
      v13 = CRKErrorWithCodeAndUserInfo(2, v10);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
LABEL_17:

      goto LABEL_18;
    }
    v12 = 0;
    goto LABEL_17;
  }
  if (a4)
  {
    v11 = CRKErrorWithCodeAndUserInfo(2, &off_1000D36C8);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
LABEL_10:
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  if (!objc_msgSend(v4, "role") || objc_msgSend(v4, "role") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKASMCredentialStoreFactory studentCredentialStore](CRKASMCredentialStoreFactory, "studentCredentialStore"));
    -[NSMutableArray addObject:](v5, "addObject:", v6);

  }
  if (!objc_msgSend(v4, "role") || objc_msgSend(v4, "role") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRKASMCredentialStoreFactory instructorCredentialStore](CRKASMCredentialStoreFactory, "instructorCredentialStore"));
    -[NSMutableArray addObject:](v5, "addObject:", v7);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v5;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12);
        if (!objc_msgSend(v4, "type", (_QWORD)v14) || objc_msgSend(v4, "type") == (id)1)
          objc_msgSend(v13, "clearCertificates");
        if (!objc_msgSend(v4, "type") || objc_msgSend(v4, "type") == (id)2)
          objc_msgSend(v13, "clearIdentities");
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[STUClearASMCredentialsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
