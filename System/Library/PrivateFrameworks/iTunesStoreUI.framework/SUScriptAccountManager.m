@implementation SUScriptAccountManager

- (SUScriptAccountManager)init
{
  SUScriptAccountManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptAccountManager;
  v2 = -[SUScriptAccountManager init](&v5, sel_init);
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accountsChangedNotification_, *MEMORY[0x24BEB20F0], 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB20F0], 0);

  self->_accounts = 0;
  self->_lock = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccountManager;
  -[SUScriptAccountManager dealloc](&v4, sel_dealloc);
}

+ (id)beginAccountManagerSessionForObject:(id)a3
{
  id v5;
  id v6;
  id v7;

  _os_nospin_lock_lock();
  v5 = (id)__SessionObjects;
  if (!__SessionObjects)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    __SessionObjects = (uint64_t)v5;
  }
  objc_msgSend(v5, "addObject:", a3);
  v6 = (id)__SharedInstance_1;
  if (!__SharedInstance_1)
  {
    v6 = objc_alloc_init((Class)a1);
    __SharedInstance_1 = (uint64_t)v6;
  }
  v7 = v6;
  _os_nospin_lock_unlock();
  return v7;
}

+ (void)endAccountManagerSessionForObject:(id)a3
{
  _os_nospin_lock_lock();
  if (__SessionObjects)
  {
    objc_msgSend((id)__SessionObjects, "removeObject:", a3);
    if (!objc_msgSend((id)__SessionObjects, "count"))
    {

      __SharedInstance_1 = 0;
    }
  }
  _os_nospin_lock_unlock();
}

- (id)accountForDSID:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[SUScriptAccountManager accounts](self, "accounts");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "dsID"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (NSArray)accounts
{
  NSArray *v3;

  -[NSLock lock](self->_lock, "lock");
  -[SUScriptAccountManager _ntsReloadAccounts](self, "_ntsReloadAccounts");
  v3 = (NSArray *)(id)-[NSMutableArray copy](self->_accounts, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_accountsChangedNotification:(id)a3
{
  -[SUScriptAccountManager _dispatchEvent:forName:](self, "_dispatchEvent:forName:", 0, CFSTR("accountschange"));
}

- (void)_dispatchEvent:(id)a3 forName:(id)a4
{
  void *v7;
  SUScriptAccountManager *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  _os_nospin_lock_lock();
  if (__SessionObjects)
  {
    v7 = (void *)objc_msgSend((id)__SessionObjects, "allObjects");
    _os_nospin_lock_unlock();
    if (v7)
    {
      v17[0] = a3;
      v17[1] = a4;
      v8 = self;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v7);
            SUScriptObjectDispatchEventForName(*(void **)(*((_QWORD *)&v13 + 1) + 8 * i), v17);
          }
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v10);
      }
    }
  }
  else
  {
    _os_nospin_lock_unlock();
  }
}

- (void)_ntsReloadAccounts
{
  NSMutableArray *v3;
  id v4;
  NSMutableArray *accounts;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  SUScriptAccount *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  accounts = self->_accounts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accounts, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(accounts);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "dsID");
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v10, v11);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accounts, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }
  v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "accounts");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        v18 = objc_msgSend(v17, "uniqueIdentifier");
        if (!v18 || (v19 = (SUScriptAccount *)(id)objc_msgSend(v4, "objectForKey:", v18)) == 0)
          v19 = objc_alloc_init(SUScriptAccount);
        -[SUScriptAccount setAccount:](v19, "setAccount:", v17);
        -[NSMutableArray addObject:](v3, "addObject:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  self->_accounts = v3;
}

@end
