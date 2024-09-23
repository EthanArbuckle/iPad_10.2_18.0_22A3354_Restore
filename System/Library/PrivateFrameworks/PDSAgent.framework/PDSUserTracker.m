@implementation PDSUserTracker

+ (id)standardAccountStore
{
  return objc_alloc_init(MEMORY[0x24BDB4398]);
}

- (PDSUserTracker)init
{
  return -[PDSUserTracker initWithAccountStoreBlock:](self, "initWithAccountStoreBlock:", &__block_literal_global_0);
}

id __22__PDSUserTracker_init__block_invoke()
{
  return +[PDSUserTracker standardAccountStore](PDSUserTracker, "standardAccountStore");
}

- (PDSUserTracker)initWithAccountStoreBlock:(id)a3
{
  id v5;
  PDSUserTracker *v6;
  uint64_t v7;
  id accountStoreBlock;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSUserTracker.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountStoreBlock"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PDSUserTracker;
  v6 = -[PDSUserTracker init](&v11, sel_init);
  if (v6)
  {
    v7 = MEMORY[0x2199F31C4](v5);
    accountStoreBlock = v6->_accountStoreBlock;
    v6->_accountStoreBlock = (id)v7;

  }
  return v6;
}

- (BOOL)validUser:(id)a3 withError:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSUserTracker.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  if (objc_msgSend(v7, "userType") == 1
    && (objc_msgSend(v7, "userID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    (*((void (**)(void))self->_accountStoreBlock + 2))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = *MEMORY[0x24BDB3FD8];
      v34 = 0;
      objc_msgSend(v10, "accountTypeWithAccountTypeIdentifier:error:", v12, &v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v34;
      v15 = v14;
      if (v13)
      {
        v27 = v14;
        objc_msgSend(v7, "userID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v13;
        v29 = v11;
        objc_msgSend(v11, "accountsWithAccountType:", v13);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "accountProperties");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("personID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v22) = objc_msgSend(v16, "isEqualToString:", v23);
              if ((_DWORD)v22)
              {

                v24 = 1;
                goto LABEL_23;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            if (v19)
              continue;
            break;
          }
        }

        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -102, 0);
          v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
LABEL_23:
        v13 = v28;
        v11 = v29;
        v15 = v27;

      }
      else
      {
        v24 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v14);
      }

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -101, 0);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -100, 0);
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)tokenAndIdentifier:(id *)a3 forUser:(id)a4 withError:(id *)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  id *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSUserTracker.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  if (objc_msgSend(v9, "userType") == 1
    && (objc_msgSend(v9, "userID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "length"),
        v10,
        v11))
  {
    (*((void (**)(void))self->_accountStoreBlock + 2))();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = *MEMORY[0x24BDB3FE8];
      v37 = 0;
      objc_msgSend(v12, "accountTypeWithAccountTypeIdentifier:error:", v14, &v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v37;
      v17 = v16;
      if (v15)
      {
        v30 = a3;
        v31 = v16;
        objc_msgSend(v9, "userID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v15;
        objc_msgSend(v13, "accountsWithAccountType:", v15);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v34;
LABEL_9:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
            objc_msgSend(v24, "aida_dsid");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "isEqualToString:", v25) & 1) != 0)
              break;

            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
              if (v21)
                goto LABEL_9;
              goto LABEL_15;
            }
          }
          v27 = v24;

          if (!v27)
            goto LABEL_25;
          objc_msgSend(v27, "aida_tokenWithExpiryCheckForService:", CFSTR("com.apple.gs.global.auth"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v27, "aida_alternateDSID");
            *v30 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
LABEL_15:

LABEL_25:
          if (a5)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -102, 0);
            v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
        }
        v17 = v31;
        v15 = v32;

      }
      else
      {
        v26 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v16);
      }

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -101, 0);
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -100, 0);
    v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)refreshCredentialsForUser:(id)a3 withError:(id *)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  (*((void (**)(void))self->_accountStoreBlock + 2))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PDSUserTracker _accountForUser:withError:](self, "_accountForUser:withError:", v11, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "aida_renewCredentialsForAccount:services:completion:", v10, &unk_24D4AF1F8, v8);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -102, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -101, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (id)_accountForUser:(id)a3 withError:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSUserTracker.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  if (objc_msgSend(v7, "userType") == 1
    && (objc_msgSend(v7, "userID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    (*((void (**)(void))self->_accountStoreBlock + 2))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = *MEMORY[0x24BDB3FE8];
      v33 = 0;
      objc_msgSend(v10, "accountTypeWithAccountTypeIdentifier:error:", v12, &v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      v15 = v14;
      if (v13)
      {
        v27 = v14;
        objc_msgSend(v7, "userID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v13;
        objc_msgSend(v11, "accountsWithAccountType:", v13);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
LABEL_9:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v21);
            objc_msgSend(v22, "aida_dsid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "isEqualToString:", v23) & 1) != 0)
              break;

            if (v19 == ++v21)
            {
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
              if (v19)
                goto LABEL_9;
              goto LABEL_15;
            }
          }
          v24 = v22;

          v15 = v27;
          v13 = v28;
          if (v24)
            goto LABEL_28;
        }
        else
        {
LABEL_15:

          v15 = v27;
          v13 = v28;
        }
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -102, 0);
          v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
LABEL_28:

      }
      else
      {
        v24 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v14);
      }

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -101, 0);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E550], -100, 0);
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)accountStoreBlock
{
  return self->_accountStoreBlock;
}

- (void)setAccountStoreBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountStoreBlock, 0);
}

@end
