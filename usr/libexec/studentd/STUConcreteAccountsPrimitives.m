@implementation STUConcreteAccountsPrimitives

- (NSString)primaryAppleID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteAccountsPrimitives primaryAppleAccount](self, "primaryAppleAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appleID"));

  return (NSString *)v3;
}

- (void)renewPrimaryAppleIDCredentialsWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (CRKIsOSX())
  {
    v8 = CRKErrorWithCodeAndUserInfo(112, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, v9);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteAccountsPrimitives primaryAppleAccount](self, "primaryAppleAccount"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteAccountsPrimitives store](self, "store"));
      v11 = objc_msgSend(v6, "shouldForce");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reason"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100009B8C;
      v15[3] = &unk_1000C9A90;
      v15[4] = self;
      v16 = v7;
      objc_msgSend(v10, "renewCredentialsForAccount:force:reason:completion:", v9, v11, v12, v15);

    }
    else
    {
      v13 = CRKErrorWithCodeAndUserInfo(106, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v7[2](v7, v14);

    }
  }

}

- (id)primaryAppleAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteAccountsPrimitives store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));

  return v3;
}

- (id)store
{
  return +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
}

- (id)errorForRenewResult:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (a3)
  {
    if (a3 == 1)
    {
      v5 = 41;
    }
    else
    {
      if (a3 != 2)
      {
        if (qword_1000FC078 != -1)
          dispatch_once(&qword_1000FC078, &stru_1000C9AB0);
        v4 = qword_1000FC070;
        if (os_log_type_enabled((os_log_t)qword_1000FC070, OS_LOG_TYPE_ERROR))
          sub_10007A7D0(a3, v4);
      }
      v5 = 42;
    }
    v7 = CRKErrorWithCodeAndUserInfo(v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
