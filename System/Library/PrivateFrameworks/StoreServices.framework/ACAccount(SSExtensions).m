@implementation ACAccount(SSExtensions)

- (id)_ss_DSID
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a1, "_ss_isiCloudAccount"))
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("personID"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "length"))
    {
      v4 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v4 = (void *)v3;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(a1, "_ss_isIDMSAccount"))
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "DSIDForAccount:", a1);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if ((objc_msgSend(a1, "_ss_isAppleAuthenticationAccount") & 1) != 0
    || objc_msgSend(a1, "_ss_isiTunesAccount"))
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("dsid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (uint64_t)_ss_isiTunesAccount
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F170]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "accountType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F180]);

  }
  return v4;
}

- (uint64_t)_ss_isiCloudAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  return v3;
}

- (uint64_t)_ss_isIDMSAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F0C8]);

  return v3;
}

- (uint64_t)_ss_isAppleAuthenticationAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F050]);

  return v3;
}

- (id)_ss_altDSID
{
  void *v2;
  void *v4;

  if ((objc_msgSend(a1, "_ss_isiCloudAccount") & 1) != 0 || objc_msgSend(a1, "_ss_isiTunesAccount"))
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("altDSID"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "_ss_isIDMSAccount"))
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "altDSIDForAccount:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_ss_hashedDescription
{
  SSAccount *v1;
  void *v2;

  v1 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", a1);
  -[SSAccount hashedDescription](v1, "hashedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)_ss_isLocalAccount
{
  return +[SSAccount backingAccountIsLocalAccount:](SSAccount, "backingAccountIsLocalAccount:", a1);
}

- (id)_ss_secureToken
{
  SSAccount *v1;
  void *v2;

  v1 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", a1);
  -[SSAccount secureToken](v1, "secureToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_ss_setSecureToken:()SSExtensions
{
  id v4;
  SSAccount *v5;

  v4 = a3;
  v5 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", a1);
  -[SSAccount setSecureToken:](v5, "setSecureToken:", v4);

}

- (uint64_t)_ss_isDuplicate:()SSExtensions
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(a1, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (!v12)
  {
LABEL_7:
    v21 = 0;
  }
  else
  {
    objc_msgSend(a1, "_ss_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ss_altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v4, "_ss_DSID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_9;
    v17 = (void *)v16;
    objc_msgSend(a1, "_ss_DSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ss_DSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

    if ((v20 & 1) != 0)
    {
LABEL_6:
      v21 = 1;
    }
    else
    {
LABEL_9:
      objc_msgSend(a1, "username");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "username");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v23, "isEqualToString:", v24);

    }
  }

  return v21;
}

@end
