@implementation APIDAccountsWeakContainer

+ (id)sharedInstance
{
  if (qword_10026D118 != -1)
    dispatch_once(&qword_10026D118, &stru_100218968);
  return (id)qword_10026D110;
}

- (id)addIDAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  if (v4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccountsWeakContainer lock](self, "lock"));
    objc_msgSend(v17, "lock");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccountsWeakContainer idAccounts](self, "idAccounts"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "iAdID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iAdID"));
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          break;
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v10;

      if (v14)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccountsWeakContainer idAccounts](self, "idAccounts"));
    objc_msgSend(v15, "addPointer:", v4);

    v14 = v4;
LABEL_13:
    objc_msgSend(v17, "unlock");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (NSPointerArray)idAccounts
{
  return self->_idAccounts;
}

- (APIDAccountsWeakContainer)init
{
  APIDAccountsWeakContainer *v2;
  APUnfairLock *v3;
  APUnfairLock *lock;
  uint64_t v5;
  NSPointerArray *idAccounts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APIDAccountsWeakContainer;
  v2 = -[APIDAccountsWeakContainer init](&v8, "init");
  if (v2)
  {
    v3 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    idAccounts = v2->_idAccounts;
    v2->_idAccounts = (NSPointerArray *)v5;

  }
  return v2;
}

- (void)setIdAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_idAccounts, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_idAccounts, 0);
}

@end
