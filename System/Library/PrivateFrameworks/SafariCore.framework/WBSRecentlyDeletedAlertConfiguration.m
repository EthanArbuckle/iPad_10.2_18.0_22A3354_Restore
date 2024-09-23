@implementation WBSRecentlyDeletedAlertConfiguration

+ (id)alertTitleForFailingToRecoverAccounts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "credentialTypes");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v4, "count") == 1)
    objc_msgSend(a1, "_alertTitleForFailingToRecoverSingleAccountWithCredentialTypes:", v7);
  else
    objc_msgSend(a1, "_alertTitleForFailingToRecoverMultipleAccountsWithCredentialTypes:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_alertTitleForFailingToRecoverMultipleAccountsWithCredentialTypes:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 3)
  {
    v3 = CFSTR("Passwords was unable to recover these passkeys and passwords.");
  }
  else if (a3 == 2)
  {
    v3 = CFSTR("Passwords was unable to recover these passkeys.");
  }
  else
  {
    v3 = CFSTR("Passwords was unable to recover these passwords.");
  }
  _WBSLocalizedString(v3, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_alertTitleForFailingToRecoverSingleAccountWithCredentialTypes:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 3)
  {
    v3 = CFSTR("Passwords was unable to recover this passkey and password.");
  }
  else if (a3 == 2)
  {
    v3 = CFSTR("Passwords was unable to recover this passkey.");
  }
  else
  {
    v3 = CFSTR("Passwords was unable to recover this password.");
  }
  _WBSLocalizedString(v3, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
