@implementation ACAccountStore(SSExtensions)

- (id)_ss_accountTypeWithIdentifier:()SSExtensions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_accountTypesCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_accountTypesCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

    if (a4)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load an ACAccountType for %@"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SSError((uint64_t)CFSTR("SSAccountErrorDomain"), 2, 0, (uint64_t)v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v8 = 0;
      }
    }
  }

  return v8;
}

+ (id)_accountTypesCache
{
  if (_accountTypesCache_ss_once_token___COUNTER__ != -1)
    dispatch_once(&_accountTypesCache_ss_once_token___COUNTER__, &__block_literal_global_13);
  return (id)_accountTypesCache_ss_once_object___COUNTER__;
}

- (uint64_t)_ss_appleAuthenticationAccountForAccount:()SSExtensions error:
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:error:", *MEMORY[0x1E0C8F050], a3, a4);
}

- (uint64_t)_ss_iCloudAccountForAccount:()SSExtensions error:
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:error:", *MEMORY[0x1E0C8F030], a3, a4);
}

- (uint64_t)_ss_IDMSAccountForAccount:()SSExtensions error:
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:error:", *MEMORY[0x1E0C8F0C8], a3, a4);
}

- (uint64_t)_ss_iTunesAccountForAccount:()SSExtensions error:
{
  return objc_msgSend(a1, "_correspondingAccountWithAccountTypeIdentifier:forAccount:error:", *MEMORY[0x1E0C8F170], a3, a4);
}

- (id)_correspondingAccountWithAccountTypeIdentifier:()SSExtensions forAccount:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_ss_accountTypeWithIdentifier:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "accountsWithAccountType:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ss_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ss_DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "username");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __96__ACAccountStore_SSExtensions___correspondingAccountWithAccountTypeIdentifier_forAccount_error___block_invoke;
    v25[3] = &unk_1E47BC640;
    v15 = v12;
    v26 = v15;
    v16 = v13;
    v27 = v16;
    v17 = v14;
    v28 = v17;
    objc_msgSend(v11, "_ss_firstObjectPassingTest:", v25);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (a5 && !v18)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "_ss_hashedDescription");
      v24 = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Unable to find a corresponding account. accountTypeIdentifier = %@ | account = %@"), v8, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v24;
      SSError((uint64_t)CFSTR("SSAccountErrorDomain"), 1, 0, (uint64_t)v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
