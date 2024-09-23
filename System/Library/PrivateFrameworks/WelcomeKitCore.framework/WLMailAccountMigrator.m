@implementation WLMailAccountMigrator

- (WLMailAccountMigrator)init
{
  WLMailAccountMigrator *v2;
  void *v3;
  ACAccountStore *accountStore;
  void *v5;
  uint64_t v6;
  NSDictionary *accountTypes;
  NSMutableDictionary *v8;
  NSMutableDictionary *existingAccounts;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  const __CFString *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)WLMailAccountMigrator;
  v2 = -[WLMailAccountMigrator init](&v32, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLMailAccountMigrator setAccountStore:](v2, "setAccountStore:", v3);

    accountStore = v2->_accountStore;
    if (accountStore)
    {
      v35 = CFSTR("com.google");
      -[ACAccountStore accountTypeWithAccountTypeIdentifier:](accountStore, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4068]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v6 = objc_claimAutoreleasedReturnValue();
      accountTypes = v2->_accountTypes;
      v2->_accountTypes = (NSDictionary *)v6;

    }
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    existingAccounts = v2->_existingAccounts;
    v2->_existingAccounts = v8;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[NSDictionary allKeys](v2->_accountTypes, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](v2->_accountTypes, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          -[ACAccountStore accountsWithAccountType:](v2->_accountStore, "accountsWithAccountType:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "username");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            }
            while (v16);
          }

          -[NSMutableDictionary setObject:forKey:](v2->_existingAccounts, "setObject:forKey:", v13, v11);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v23);
    }

  }
  return v2;
}

- (void)enable
{
  WLFeaturePayload **p_featurePayload;
  id WeakRetained;
  id v4;

  p_featurePayload = &self->_featurePayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v4 = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(v4, "setState:", CFSTR("enabled"));

}

- (void)setState:(id)a3
{
  WLFeaturePayload **p_featurePayload;
  id v4;
  id WeakRetained;

  p_featurePayload = &self->_featurePayload;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(WeakRetained, "setState:", v4);

}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", a3);

}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

+ (id)contentType
{
  return CFSTR("cloud");
}

- (id)contentType
{
  return +[WLMailAccountMigrator contentType](WLMailAccountMigrator, "contentType");
}

- (id)dataType
{
  return +[WLMailAccountMigrator contentType](WLMailAccountMigrator, "contentType");
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 5120);

}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v8;
  void (**v9)(id, _BOOL8, id);
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  ACAccountStore *accountStore;
  id v29;
  WLMailAccountMigrator *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _BOOL8, id))a6;
  v30 = self;
  _WLLog();
  if (self->_accountStore && -[NSDictionary count](self->_accountTypes, "count", self))
  {
    v44 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v44;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("accountType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("accountName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v14;
      if (objc_msgSend(v13, "length") && objc_msgSend(v14, "length"))
      {
        _WLLog();
        -[NSDictionary objectForKeyedSubscript:](self->_accountTypes, "objectForKeyedSubscript:", v13, self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_existingAccounts, "objectForKeyedSubscript:", v13);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "containsObject:", v14))
          {
            _WLLog();
            v16 = 1;
          }
          else
          {
            v37 = v13;
            v33 = v12;
            v34 = v8;
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v15);
            objc_msgSend(v21, "setUsername:", v14);
            objc_msgSend(v21, "setAccountDescription:", v14);
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v32 = v15;
            objc_msgSend(v15, "supportedDataclasses");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v41 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
                  objc_msgSend(v21, "setProvisioned:forDataclass:", 1, v27);
                  objc_msgSend(v21, "setEnabled:forDataclass:", 1, v27);
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
              }
              while (v24);
            }

            accountStore = self->_accountStore;
            v39 = v11;
            -[ACAccountStore saveVerifiedAccount:error:](accountStore, "saveVerifiedAccount:error:", v21, &v39);
            v29 = v39;

            v16 = v29 == 0;
            if (!v29)
              objc_msgSend(v35, "addObject:", v38);

            v11 = v29;
            v8 = v34;
            v15 = v32;
            v12 = v33;
            v13 = v37;
          }

        }
        else
        {
          _WLLog();
          v16 = 1;
        }
      }
      else
      {
        v36 = v13;
        v19 = (void *)MEMORY[0x24BDD1540];
        v46 = *MEMORY[0x24BDD0FC8];
        v47 = CFSTR("invalid argument");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("WLAccountErrorDomain"), 1, v15);
        v20 = objc_claimAutoreleasedReturnValue();

        v16 = 0;
        v11 = (id)v20;
        v13 = v36;
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      v49 = CFSTR("invalid argument");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WLAccountErrorDomain"), 1, v12);
      v16 = 0;
      v13 = v11;
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    v51[0] = CFSTR("cannot continue to import an account due to an ACAccountStore error.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1, v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WLAccountErrorDomain"), 2, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }

  objc_msgSend(v11, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v9)
    v9[2](v9, v16, v11);

}

- (id)importWillBegin
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  v4 = 0;
  if (!self->_accountStore)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BEC2878];
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = CFSTR("Mail account migrator couldn't create account store.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 1, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)importDidEnd
{
  NSDictionary *accountTypes;
  NSMutableDictionary *existingAccounts;

  -[WLMailAccountMigrator setAccountStore:](self, "setAccountStore:", 0);
  accountTypes = self->_accountTypes;
  self->_accountTypes = 0;

  existingAccounts = self->_existingAccounts;
  self->_existingAccounts = 0;

  return 0;
}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_existingAccounts, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
}

@end
