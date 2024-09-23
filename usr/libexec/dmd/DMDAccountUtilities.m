@implementation DMDAccountUtilities

+ (NSString)primaryAppleID
{
  ACAccountStore *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = objc_opt_new(ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountTypeWithAccountTypeIdentifier:](v2, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierAppleAccount));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountsWithAccountType:](v2, "accountsWithAccountType:", v3));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v16 = v3;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountProperties"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("primaryAccount")));
        v12 = objc_msgSend(v11, "BOOLValue");

        if ((v12 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountProperties"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("appleId")));

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
    v13 = 0;
LABEL_11:
    v3 = v16;
  }
  else
  {
    v13 = 0;
  }

  return (NSString *)v13;
}

@end
