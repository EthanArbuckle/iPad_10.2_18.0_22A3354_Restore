@implementation _ICQMegaBackupManager

- (void)requestMegaBackupForAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_queue_completion___block_invoke;
  v14[3] = &unk_1E8B38620;
  v15 = v12;
  v13 = v12;
  -[_ICQMegaBackupManager requestMegaBackupForAccount:deviceBackupUUID:deviceTotalUsedSpaceInBytes:entryMethod:deepLinkURL:queue:completion:](self, "requestMegaBackupForAccount:deviceBackupUUID:deviceTotalUsedSpaceInBytes:entryMethod:deepLinkURL:queue:completion:", a3, a4, a5, 0, 0, a6, v14);

}

- (void)requestMegaBackupForAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 entryMethod:(int64_t)a6 deepLinkURL:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int64_t v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke;
  v27[3] = &unk_1E8B38670;
  v27[4] = self;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v33 = v20;
  v34 = a6;
  v31 = v18;
  v32 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v20;
  v26 = v15;
  dispatch_async(v21, v27);

}

- (id)_quotaBackupCheckURLForAccount:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  -[NSObject propertiesForDataclass:](v3, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("quotaBackupCheckURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[NSObject aa_altDSID](v3, "aa_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "invalid URL string %@ for quotaBackupCheckURL account %@", buf, 0x16u);
      }

    }
  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "missing quotaBackupCheckURL for account %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)updateMegaBackupStatusForAccount:(id)a3 deviceBackupUUID:(id)a4 status:(int64_t)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke;
  v20[3] = &unk_1E8B386C0;
  v20[4] = self;
  v21 = v12;
  v24 = v15;
  v25 = a5;
  v22 = v13;
  v23 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v15;
  v19 = v12;
  dispatch_async(v16, v20);

}

- (id)_updateStatusURLForAccount:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  -[NSObject propertiesForDataclass:](v3, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("quotaBackupUpdateStatusURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[NSObject aa_altDSID](v3, "aa_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Invalid URL string for update status: %@, account %@", buf, 0x16u);
      }

    }
  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "missing updateStatusURL for account %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)extendExpirationForAccount:(id)a3 deviceBackupUUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[_ICQMegaBackupManager extendExpirationForAccount:deviceBackupUUID:requestedExpirationDate:queue:completion:](self, "extendExpirationForAccount:deviceBackupUUID:requestedExpirationDate:queue:completion:", a3, a4, 0, a5, a6);
}

- (void)extendExpirationForAccount:(id)a3 deviceBackupUUID:(id)a4 requestedExpirationDate:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke;
  v22[3] = &unk_1E8B38710;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v16;
  v21 = v12;
  dispatch_async(v17, v22);

}

- (id)_extendExpirationURLForAccount:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  -[NSObject propertiesForDataclass:](v3, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("quotaBackupExtensionURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[NSObject aa_altDSID](v3, "aa_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Invalid URL string for extend expiration: %@, account %@", buf, 0x16u);
      }

    }
  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "missing extendExpirationURL for account: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

@end
