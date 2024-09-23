@implementation ACAccountStore(ICAccountStoreAdditions)

- (void)ic_allStoreAccountsWithCompletion:()ICAccountStoreAdditions
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccountsWithCompletion___block_invoke;
  v6[3] = &unk_1E438C2E8;
  v6[4] = a1;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "ic_storeAccountTypeWithCompletion:", v6);

}

- (id)ic_allStoreAccountsWithError:()ICAccountStoreAdditions
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C8F170];
  v15 = 0;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:error:", v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v7)
  {
    v8 = v7;
    v9 = 0;
  }
  else
  {
    v14 = 0;
    objc_msgSend(a1, "accountsWithAccountType:options:error:", v6, 1, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    objc_msgSend(v10, "msv_filter:", &__block_literal_global_15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v11, "copy");

    if (!v8)
      goto LABEL_7;
  }
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v17 = a1;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving iTunesStore accounts. err=%{public}@", buf, 0x16u);
  }

LABEL_7:
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (void)ic_activeStoreAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E438C2C0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v6);

}

- (id)ic_activeStoreAccountWithError:()ICAccountStoreAdditions
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13521;
  v15 = __Block_byref_object_dispose__13522;
  v16 = 0;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a1;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving all store accounts, err=%{public}@", buf, 0x16u);
    }

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccountWithError___block_invoke;
    v10[3] = &unk_1E438C330;
    v10[4] = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)ic_setActiveStoreAccount:()ICAccountStoreAdditions completion:
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount_completion___block_invoke;
  v10[3] = &unk_1E438FEF0;
  v12 = a1;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v10);

}

- (BOOL)ic_setActiveStoreAccount:()ICAccountStoreAdditions error:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  uint64_t v21;
  id obj;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = 0;
  v23 = a1;
  objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v21 = *MEMORY[0x1E0C8F1D0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);
        if ((_DWORD)v15 != objc_msgSend(v12, "isActive"))
        {
          objc_msgSend(v12, "setActive:", v15);
          v24 = v7;
          v16 = objc_msgSend(v23, "saveVerifiedAccount:error:", v12, &v24);
          v17 = v24;

          if ((v16 & 1) == 0 && !v17)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v21, 1, 0);
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (v17)
          {
            v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218498;
              v31 = v23;
              v32 = 2114;
              v33 = v12;
              v34 = 2114;
              v35 = v17;
              _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error updating active bit for account %{public}@. err=%{public}@", buf, 0x20u);
            }

            v7 = v17;
          }
          else
          {
            v7 = 0;
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v9);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v7 == 0;
}

- (void)ic_activeLockerAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E438C358;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "ic_activeStoreAccountWithCompletion:", v6);

}

- (id)ic_activeLockerAccountWithError:()ICAccountStoreAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "ic_activeStoreAccountWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  if (v6)
  {
    v7 = 0;
  }
  else if (objc_msgSend(v4, "ic_isActiveLockerAccount"))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)ic_setActiveLockerAccount:()ICAccountStoreAdditions completion:
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke_2;
    v11[3] = &unk_1E438C380;
    v11[4] = a1;
    v12 = v7;
    objc_msgSend(a1, "ic_activeStoreAccountWithCompletion:", v11);
    v9 = v12;
LABEL_8:

    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "ic_isActiveLockerAccount") & 1) == 0)
  {
    objc_msgSend(v6, "ic_setActiveLockerAccount:", 1);
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ as the active locker account", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount_completion___block_invoke;
    v13[3] = &unk_1E438F330;
    v14 = v8;
    objc_msgSend(a1, "saveAccount:withDataclassActions:doVerify:completion:", v6, 0, 0, v13);
    v9 = v14;
    goto LABEL_8;
  }
  v8[2](v8, 0);
LABEL_9:

}

- (uint64_t)ic_setActiveLockerAccount:()ICAccountStoreAdditions error:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  id v12;
  NSObject *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "ic_isActiveLockerAccount") & 1) != 0)
    {
      v8 = 0;
      goto LABEL_24;
    }
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ as the active locker account", buf, 0xCu);
    }

    objc_msgSend(v7, "ic_setActiveLockerAccount:", 1);
    v21 = 0;
    v14 = objc_msgSend(a1, "saveVerifiedAccount:error:", v7, &v21);
    v15 = v21;
    v8 = v15;
    if ((v14 & 1) == 0 && !v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v8)
    {
LABEL_18:
      v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v23 = a1;
        v24 = 2114;
        v25 = v7;
        v26 = 2114;
        v27 = v8;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error setting active locker account %{public}@. err=%{public}@", buf, 0x20u);
      }

      v17 = 0;
      if (a4)
        goto LABEL_25;
      goto LABEL_26;
    }
  }
  else
  {
    v20 = 0;
    objc_msgSend(a1, "ic_activeStoreAccountWithError:", &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    if (v8)
      v10 = 1;
    else
      v10 = v9 == 0;
    if (!v10)
    {
      if (objc_msgSend(v9, "ic_isActiveLockerAccount"))
      {
        objc_msgSend(v9, "ic_setActiveLockerAccount:", 0);
        v19 = 0;
        v11 = objc_msgSend(a1, "saveVerifiedAccount:error:", v9, &v19);
        v12 = v19;
        v8 = v12;
        if ((v11 & 1) == 0 && !v12)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v8 = 0;
      }
    }

    if (v8)
      goto LABEL_18;
  }
LABEL_24:
  v17 = 1;
  if (a4)
LABEL_25:
    *a4 = objc_retainAutorelease(v8);
LABEL_26:

  return v17;
}

- (BOOL)ic_disableActiveLockerAccount:()ICAccountStoreAdditions error:
{
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccountStore+ICAccountStoreAdditions.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account != nil"));

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "ic_isActiveLockerAccount"))
    goto LABEL_5;
  objc_msgSend(v8, "ic_setActiveLockerAccount:", 0);
  v15 = 0;
  v9 = objc_msgSend(a1, "saveVerifiedAccount:error:", v8, &v15);
  v10 = v15;
  v11 = v10;
  if ((v9 & 1) == 0 && !v10)
    goto LABEL_5;
LABEL_6:
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v17 = a1;
      v18 = 2114;
      v19 = v8;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error removing active locker account %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v11 == 0;
}

- (void)ic_primaryAppleAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E438C358;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "aa_primaryAppleAccountWithCompletion:", v6);

}

- (id)ic_primaryAppleAccountWithError:()ICAccountStoreAdditions
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13521;
  v16 = __Block_byref_object_dispose__13522;
  v17 = 0;
  v11 = 0;
  objc_msgSend(a1, "aa_appleAccountsWithError:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccountWithError___block_invoke;
  v10[3] = &unk_1E438C330;
  v10[4] = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a1;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error fetching primary apple account. err=%{public}@", buf, 0x16u);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (void)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions completion:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccountStore+ICAccountStoreAdditions.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeAccountID != nil"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_completion___block_invoke;
  v12[3] = &unk_1E438FF68;
  v13 = v7;
  v14 = v8;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v12);

}

- (id)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions error:
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccountStore+ICAccountStoreAdditions.m"), 344, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeAccountID != nil"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__13521;
  v22 = __Block_byref_object_dispose__13522;
  v23 = 0;
  v17 = 0;
  objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = a1;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving store account for DSID %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID_error___block_invoke;
    v14[3] = &unk_1E438C3A8;
    v15 = v7;
    v16 = &v18;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    v10 = v15;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v9);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)ic_storeAccountTypeWithCompletion:()ICAccountStoreAdditions
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = *MEMORY[0x1E0C8F170];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E438C3D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "accountTypeWithIdentifier:completion:", v5, v7);

}

- (id)ic_storeAccountTypeWithError:()ICAccountStoreAdditions
{
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C8F170];
  v10 = 0;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:error:", v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v12 = a1;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving store account type. err=%{public}@", buf, 0x16u);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

- (void)ic_storeAccountForHomeUserIdentifier:()ICAccountStoreAdditions completion:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccountStore+ICAccountStoreAdditions.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeUserID"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_completion___block_invoke;
  v12[3] = &unk_1E438FF68;
  v13 = v7;
  v14 = v8;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v12);

}

- (id)ic_storeAccountForHomeUserIdentifier:()ICAccountStoreAdditions error:
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACAccountStore+ICAccountStoreAdditions.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeUserID"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__13521;
  v22 = __Block_byref_object_dispose__13522;
  v23 = 0;
  v17 = 0;
  objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = a1;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving store account for home ID %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForHomeUserIdentifier_error___block_invoke;
    v14[3] = &unk_1E438C3A8;
    v15 = v7;
    v16 = &v18;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    v10 = v15;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v9);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)ic_localStoreAccountWithCompletion:()ICAccountStoreAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E438C2C0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v6);

}

- (id)ic_localStoreAccountWithError:()ICAccountStoreAdditions
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13521;
  v16 = __Block_byref_object_dispose__13522;
  v17 = 0;
  v11 = 0;
  objc_msgSend(a1, "ic_allStoreAccountsWithError:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v19 = a1;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ACAccountStore %p - Error retrieving local store account. err=%{public}@", buf, 0x16u);
    }

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__ACAccountStore_ICAccountStoreAdditions__ic_localStoreAccountWithError___block_invoke;
    v10[3] = &unk_1E438C330;
    v10[4] = &v12;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (id)ic_allStoreAccounts
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13521;
  v13 = __Block_byref_object_dispose__13522;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ACAccountStore_ICAccountStoreAdditions__ic_allStoreAccounts__block_invoke;
  v6[3] = &unk_1E438C3F8;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "ic_allStoreAccountsWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)ic_activeStoreAccount
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13521;
  v13 = __Block_byref_object_dispose__13522;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ACAccountStore_ICAccountStoreAdditions__ic_activeStoreAccount__block_invoke;
  v6[3] = &unk_1E438C420;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "ic_activeStoreAccountWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)ic_activeLockerAccount
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13521;
  v13 = __Block_byref_object_dispose__13522;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ACAccountStore_ICAccountStoreAdditions__ic_activeLockerAccount__block_invoke;
  v6[3] = &unk_1E438C420;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "ic_activeLockerAccountWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)ic_primaryAppleAccount
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13521;
  v13 = __Block_byref_object_dispose__13522;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ACAccountStore_ICAccountStoreAdditions__ic_primaryAppleAccount__block_invoke;
  v6[3] = &unk_1E438C420;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "ic_primaryAppleAccountWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)ic_setActiveStoreAccount:()ICAccountStoreAdditions
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ACAccountStore_ICAccountStoreAdditions__ic_setActiveStoreAccount___block_invoke;
  v7[3] = &unk_1E43902A0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a1, "ic_setActiveStoreAccount:completion:", v4, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)ic_setActiveLockerAccount:()ICAccountStoreAdditions
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ACAccountStore_ICAccountStoreAdditions__ic_setActiveLockerAccount___block_invoke;
  v7[3] = &unk_1E43902A0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a1, "ic_setActiveLockerAccount:completion:", v4, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)ic_storeAccountForStoreAccountID:()ICAccountStoreAdditions
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13521;
  v16 = __Block_byref_object_dispose__13522;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__ACAccountStore_ICAccountStoreAdditions__ic_storeAccountForStoreAccountID___block_invoke;
  v9[3] = &unk_1E438C420;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "ic_storeAccountForStoreAccountID:completion:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (uint64_t)_ic_storeAccountType
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:error:", *MEMORY[0x1E0C8F170], 0);
}

+ (id)ic_sharedAccountStore
{
  if (ic_sharedAccountStore_onceToken != -1)
    dispatch_once(&ic_sharedAccountStore_onceToken, &__block_literal_global_13564);
  return (id)ic_sharedAccountStore_sSharedAccountStore;
}

+ (uint64_t)ic_canAccessAccountStore
{
  if (ic_canAccessAccountStore_onceToken != -1)
    dispatch_once(&ic_canAccessAccountStore_onceToken, &__block_literal_global_1);
  return ic_canAccessAccountStore___hasAccountAccess;
}

+ (uint64_t)ic_canAccessAppleAccounts
{
  if (ic_canAccessAppleAccounts_onceToken != -1)
    dispatch_once(&ic_canAccessAppleAccounts_onceToken, &__block_literal_global_8_13553);
  return ic_canAccessAppleAccounts___hasAppleAccountAccess;
}

@end
