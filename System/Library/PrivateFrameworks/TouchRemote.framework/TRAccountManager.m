@implementation TRAccountManager

+ (id)idmsAccountForAccountService:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 3uLL:
      objc_msgSend(a1, "_idmsAccountForGameCenterService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(a1, "_idmsAccountForITunesService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(a1, "_idmsAccountForICloudService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          StringFromTRAccountService(a3);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412290;
          v9 = v6;
          _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "Unknown account service: %@", (uint8_t *)&v8, 0xCu);

        }
      }
      v4 = 0;
      break;
  }
  return v4;
}

+ (id)_primaryICloudAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_primaryITunesAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_primaryGameCenterAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4060]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_idmsAccountForICloudService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_primaryICloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("DSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_idmsAccountForAccountWithUsername:altDSID:DSID:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_idmsAccountForITunesService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_primaryITunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_idmsAccountForAccountWithUsername:altDSID:DSID:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_idmsAccountForGameCenterService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_primaryGameCenterAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("DSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_idmsAccountForAccountWithUsername:altDSID:DSID:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_idmsAccountForAccountWithUsername:(id)a3 altDSID:(id)a4 DSID:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v27 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4080]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountsWithAccountType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "+[TRAccountManager _idmsAccountForAccountWithUsername:altDSID:DSID:]";
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_20A2BF000, v11, OS_LOG_TYPE_DEFAULT, "%s accounts: %@.", buf, 0x16u);
    }

  }
  if (objc_msgSend(v10, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v10;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v23 = v10;
      v24 = v9;
      v25 = v8;
      v15 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "aa_altDSID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18 && objc_msgSend(v27, "isEqualToString:", v18))
          {
            v21 = v17;
            goto LABEL_29;
          }
          objc_msgSend(v17, "accountPropertyForKey:", CFSTR("DSID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 && objc_msgSend(v7, "isEqualToNumber:", v19))
          {
            v21 = v17;
            goto LABEL_28;
          }
          objc_msgSend(v17, "username");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20 && (objc_msgSend(v26, "isEqualToString:", v20) & 1) != 0)
          {
            v21 = v17;

LABEL_28:
LABEL_29:

            goto LABEL_30;
          }

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v14)
          continue;
        break;
      }
      v21 = 0;
LABEL_30:
      v9 = v24;
      v8 = v25;
      v10 = v23;
      goto LABEL_31;
    }
LABEL_23:
    v21 = 0;
LABEL_31:

    goto LABEL_32;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "+[TRAccountManager _idmsAccountForAccountWithUsername:altDSID:DSID:]";
      _os_log_impl(&dword_20A2BF000, v12, OS_LOG_TYPE_DEFAULT, "%s No IDMS accounts found.", buf, 0xCu);
    }
    goto LABEL_23;
  }
  v21 = 0;
LABEL_32:

  return v21;
}

+ (id)associatedAccountServicesForIDMSAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_idmsAccountForICloudService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    objc_msgSend(v5, "addObject:", &unk_24C2F2940);
  objc_msgSend(a1, "_idmsAccountForITunesService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
    objc_msgSend(v5, "addObject:", &unk_24C2F2958);
  objc_msgSend(a1, "_idmsAccountForGameCenterService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17)
    objc_msgSend(v5, "addObject:", &unk_24C2F2970);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
