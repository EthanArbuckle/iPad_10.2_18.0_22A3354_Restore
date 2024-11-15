@implementation ACAccountStore

void __76__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __69__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __68__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccount__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __65__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccount__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccount__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __62__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __73__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "ic_isLocalAccount"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __78__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "ic_isLocalAccount", (_QWORD)v12))
          {
            v8 = v11;
            goto LABEL_13;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "ic_homeUserIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __91__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v26;
      obj = v5;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "ic_homeUserIdentifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v22 != v17)
                  objc_enumerationMutation(v14);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "isEqual:", *(_QWORD *)(a1 + 32)))
                {
                  v19 = v12;

                  v9 = v19;
                  goto LABEL_18;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_18:

        }
        v5 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v6 = 0;
  }

}

uint64_t __77__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountTypeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "ic_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __87__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "ic_DSID", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

          if (v13)
          {
            v8 = v11;
            goto LABEL_13;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __80__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v5 = 0;
    if ((a2 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "ic_isActiveLockerAccount"))
  {
    objc_msgSend(v3, "ic_setActiveLockerAccount:", 0);
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ as the active locker account", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_20;
    v6[3] = &unk_1E438F330;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "saveAccount:withDataclassActions:doVerify:completion:", v3, 0, 0, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v5 = 0;
    if ((a2 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __80__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "ic_isActiveLockerAccount"))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "active store account does not have the locker bit set - returning nil", v11, 2u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

LABEL_6:
}

void __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id obj;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[5];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v18 = v5;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = dispatch_group_create();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__13521;
    v34[4] = __Block_byref_object_dispose__13522;
    v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 1;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          dispatch_group_enter(v7);
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);
          if ((_DWORD)v14 != objc_msgSend(v11, "isActive"))
          {
            objc_msgSend(v11, "setActive:", v14);
            v15 = *(void **)(a1 + 40);
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_2;
            v24[3] = &unk_1E4390A38;
            v26 = v32;
            v27 = v34;
            v16 = v7;
            v25 = v16;
            objc_msgSend(v15, "saveAccount:withDataclassActions:doVerify:completion:", v11, 0, 0, v24);
            dispatch_get_global_queue(0, 0);
            v17 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_3;
            block[3] = &unk_1E438FE78;
            v22 = v32;
            v23 = v34;
            v21 = *(id *)(a1 + 48);
            dispatch_group_notify(v16, v17, block);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v8);
    }

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);

    v6 = 0;
  }

}

void __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    *(_BYTE *)(v6 + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
    objc_storeStrong(v8, a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void __74__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isActive"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __79__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "isActive", (_QWORD)v12))
          {
            v8 = v11;
            goto LABEL_13;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __72__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_isITunesAccount");
}

void __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke_2;
    v5[3] = &unk_1E438C2C0;
    v4 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "accountsWithAccountType:options:completion:", a2, 1, v5);

  }
}

void __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(a2, "msv_filter:", &__block_literal_global_12);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_msgSend(v8, "copy");
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

}

uint64_t __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_isITunesAccount");
}

void __68__ACAccountStore_ICAccountStoreAdditions__ic_canAccessAppleAccounts__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  ic_canAccessAppleAccounts___hasAppleAccountAccess = objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:shouldLogForMissingEntitlement:", CFSTR("com.apple.accounts.appleaccount.fullaccess"), 0);
  if ((ic_canAccessAppleAccounts___hasAppleAccountAccess & 1) == 0)
  {
    v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "[ACAccountStore] Current process does not have apple account access.", v1, 2u);
    }

  }
}

void __67__ACAccountStore_ICAccountStoreAdditions__ic_canAccessAccountStore__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if ((objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:shouldLogForMissingEntitlement:", CFSTR("com.apple.private.accounts.allaccounts"), 0) & 1) != 0|| (objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:shouldLogForMissingEntitlement:", CFSTR("com.apple.itunesstored.private"), 0) & 1) != 0)
  {
    ic_canAccessAccountStore___hasAccountAccess = 1;
  }
  else
  {
    ic_canAccessAccountStore___hasAccountAccess = objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:shouldLogForMissingEntitlement:", CFSTR("com.apple.private.applemediaservices"), 0);
    if ((ic_canAccessAccountStore___hasAccountAccess & 1) == 0)
    {
      v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v1 = 0;
        _os_log_impl(&dword_1A03E3000, v0, OS_LOG_TYPE_DEFAULT, "[ACAccountStore] Current process does not have account store access.", v1, 2u);
      }

    }
  }
}

void __64__ACAccountStore_ICAccountStoreAdditions__ic_sharedAccountStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_sharedAccountStore_sSharedAccountStore;
  ic_sharedAccountStore_sSharedAccountStore = v0;

}

@end
