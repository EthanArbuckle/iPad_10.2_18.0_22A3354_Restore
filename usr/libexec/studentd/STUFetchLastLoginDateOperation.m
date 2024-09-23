@implementation STUFetchLastLoginDateOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___STUFetchLastLoginDateOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKFetchLastLoginDateRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(DMFFetchLastLoginDateRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v13 = CATErrorWithCodeAndUserInfo(2, &off_1000D3858);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
        goto LABEL_11;
      }
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appleIDsForRequest:", v6));
  v10 = (void *)v9;
  v11 = v9 != 0;
  if (a4 && !v9)
  {
    v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D3880);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

LABEL_11:
  return v11;
}

- (void)runWithRequest:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allUsers"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchLastLoginDateOperation appleIDs](self, "appleIDs", (_QWORD)v20));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));
        v15 = objc_msgSend(v13, "containsObject:", v14);

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastLoginDate"));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastLoginDate"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, v18);

          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchLastLoginDateOperation makeResultObjectWithDatesByAppleID:](self, "makeResultObjectWithDatesByAppleID:", v4));
  -[STUFetchLastLoginDateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v19);

}

+ (id)appleIDsForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_class(CRKFetchLastLoginDateRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(DMFFetchLastLoginDateRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleIDs"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appleIDs"));
  v14 = v13;

  return v14;
}

- (id)appleIDs
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchLastLoginDateOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appleIDsForRequest:", v4));

  return v5;
}

- (id)makeResultObjectWithDatesByAppleID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  Class *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchLastLoginDateOperation request](self, "request"));
  v6 = objc_opt_class(DMFFetchLastLoginDateRequest);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = (Class *)DMFFetchLastLoginDateResultObject_ptr;
  if ((isKindOfClass & 1) == 0)
    v8 = (Class *)CRKFetchLastLoginDateResultObject_ptr;
  v9 = objc_msgSend(objc_alloc(*v8), "initWithDatesByAppleID:", v4);

  return v9;
}

@end
