@implementation SASProximityCompanionAuthRequestAction

+ (unint64_t)actionID
{
  return 4;
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)responsePayload
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SASProximityCompanionAuthRequestAction idmsAccountForiCloud](self, "idmsAccountForiCloud");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportableAuthKitAccount:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v15 = 0;
  objc_msgSend(v5, "credentialForAccount:error:", v4, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v6)
  {
    objc_msgSend(v4, "setCredential:", v6);
    objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setLinkType:](v8, "setLinkType:", 3);
    v16[0] = CFSTR("device");
    v16[1] = CFSTR("account");
    v17[0] = v8;
    v17[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (!v10)
    {
      +[SASLogging facility](SASLogging, "facility");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1D45FD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to archive response: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1D45FD000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load credentials for IDMS account: %@ - %@", buf, 0x16u);
    }
    v10 = 0;
    v11 = v7;
  }

  return v10;
}

- (void)setResponseFromData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16;
  if (!v11)
  {
    +[SASLogging facility](SASLogging, "facility");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1D45FD000, v13, OS_LOG_TYPE_DEFAULT, "Failed to unarchive response: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityCompanionAuthRequestAction setCompanionDevice:](self, "setCompanionDevice:", v14);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("account"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityCompanionAuthRequestAction setAccount:](self, "setAccount:", v15);

}

- (id)idmsAccountForiCloud
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountPropertyForKey:", CFSTR("DSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F0C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountType:", v5);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v18 = v3;
    v19 = v2;
    v17 = v5;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "aa_altDSID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && objc_msgSend(v21, "isEqualToString:", v12))
        {
          v15 = v11;
          goto LABEL_20;
        }
        objc_msgSend(v11, "accountPropertyForKey:", CFSTR("DSID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && objc_msgSend(v4, "isEqualToNumber:", v13))
        {
          v15 = v11;
          goto LABEL_19;
        }
        objc_msgSend(v11, "username");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_msgSend(v20, "isEqualToString:", v14) & 1) != 0)
        {
          v15 = v11;

LABEL_19:
LABEL_20:

          v3 = v18;
          v2 = v19;
          v5 = v17;
          goto LABEL_21;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v15 = 0;
      v3 = v18;
      v2 = v19;
      v5 = v17;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

- (AKDevice)companionDevice
{
  return (AKDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCompanionDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_companionDevice, 0);
}

@end
