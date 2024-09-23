@implementation MCOSXServerAccountPayloadHandler

- (id)accountStore
{
  if (qword_1000FD9E0 != -1)
    dispatch_once(&qword_1000FD9E0, &stru_1000E4360);
  return (id)qword_1000FD9D8;
}

- (id)_installedAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  MCOSXServerAccountPayloadHandler *v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  MCOSXServerAccountPayloadHandler *v24;
  id obj;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCOSXServerAccountPayloadHandler accountStore](self, "accountStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierOSXServer));

  v24 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCOSXServerAccountPayloadHandler accountStore](self, "accountStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsWithAccountType:", v4));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v22 = v4;
    v8 = *(_QWORD *)v28;
    v9 = v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mcProfileUUID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v9, "payload"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "profile"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
        if (objc_msgSend(v12, "isEqualToString:", v15))
        {
          v23 = v11;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mcPayloadUUID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v9, "payload"));
          v18 = v7;
          v19 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
          v26 = objc_msgSend(v16, "isEqualToString:", v20);

          v8 = v19;
          v7 = v18;

          v9 = v24;
          if (v26)
          {
            v7 = v23;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
LABEL_12:
    v4 = v22;
  }

  return v7;
}

- (BOOL)isInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCOSXServerAccountPayloadHandler _installedAccount](self, "_installedAccount"));
  v3 = v2 != 0;

  return v3;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MCOSXServerAccountPayloadHandler;
  -[MCNewPayloadHandler setAsideWithInstaller:](&v7, "setAsideWithInstaller:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCOSXServerAccountPayloadHandler _installedAccount](self, "_installedAccount"));
  if (v5)
  {
    -[MCOSXServerAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    objc_msgSend(v4, "addSetAsideAccountIdentifier:forPayloadClass:", v6, objc_opt_class(self));

  }
}

- (void)_deleteAccountAndAssociatedData:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)DMCProcessAssertion), "initWithReason:", CFSTR("profiled-DeleteAccount"));
  global_queue = dispatch_get_global_queue(17, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007CE70;
  block[3] = &unk_1000E41F0;
  block[4] = self;
  v11 = v4;
  v12 = v5;
  v8 = v5;
  v9 = v4;
  dispatch_async(v7, block);

}

- (void)remove
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCOSXServerAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
    -[MCOSXServerAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", 0);
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCOSXServerAccountPayloadHandler _installedAccount](self, "_installedAccount"));
  if (v5)
LABEL_5:
    -[MCOSXServerAccountPayloadHandler _deleteAccountAndAssociatedData:](self, "_deleteAccountAndAssociatedData:", v5);
LABEL_6:

}

- (ACAccount)setAsideAccount
{
  return self->_setAsideAccount;
}

- (void)setSetAsideAccount:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideAccount, 0);
  objc_storeStrong((id *)&self->_validationError, 0);
  objc_storeStrong((id *)&self->_doneSema, 0);
}

@end
