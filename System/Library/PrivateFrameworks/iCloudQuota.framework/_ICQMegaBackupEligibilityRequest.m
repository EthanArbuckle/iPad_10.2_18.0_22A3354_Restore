@implementation _ICQMegaBackupEligibilityRequest

+ (id)eligibilityRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 deviceTotalUsedSpaceInBytes:(id)a5 entryMethod:(int64_t)a6 deepLinkURL:(id)a7 requestURL:(id)a8 URLSession:(id)a9 queue:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v24;
  id v25;
  id v26;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v17 = a7;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestURL:URLSession:queue:", v20, v19, v18);

  if (v21)
  {
    objc_storeStrong((id *)(v21 + 64), a3);
    objc_storeStrong((id *)(v21 + 72), a4);
    objc_storeStrong((id *)(v21 + 80), a5);
    *(_QWORD *)(v21 + 88) = a6;
    objc_storeStrong((id *)(v21 + 96), a7);
  }

  return (id)v21;
}

- (id)additionalRequestHeaders
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D00120]);
  v8 = 0;
  objc_msgSend(v2, "anisetteDataWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A8], "ak_anisetteHeadersWithData:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get anisette data: %@", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (id)bodyJSON
{
  id v3;
  NSString *deviceBackupUUID;
  void *v5;
  void *v6;
  void *v7;
  NSString *deepLinkURL;
  NSObject *v9;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  deviceBackupUUID = self->_deviceBackupUUID;
  -[NSNumber stringValue](self->_deviceTotalUsedSpaceInBytes, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", deviceBackupUUID, CFSTR("deviceBackupUdid"), v5, CFSTR("deviceTotalUsedSpace"), 0);

  if (self->_entryMethod)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("entryMethodType"));

    if (self->_entryMethod == 2)
    {
      deepLinkURL = self->_deepLinkURL;
      if (deepLinkURL)
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", deepLinkURL, CFSTR("entryMethodURL"));
      }
      else
      {
        _ICQGetLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[_ICQMegaBackupEligibilityRequest bodyJSON].cold.1(v9);

      }
    }
  }
  return v6;
}

- (void)addAdditionalRequestHeaders:(id)a3
{
  id v4;
  ICQRequestProvider *v5;
  ICQRequestProvider *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ICQMegaBackupEligibilityRequest;
  v4 = a3;
  -[_ICQMegaBackupNetworkRequest addAdditionalRequestHeaders:](&v7, sel_addAdditionalRequestHeaders_, v4);
  v5 = [ICQRequestProvider alloc];
  v6 = -[ICQRequestProvider initWithAccount:](v5, "initWithAccount:", self->_account, v7.receiver, v7.super_class);
  -[ICQRequestProvider addBasicAndCloudBackupHeadersToRequest:](v6, "addBasicAndCloudBackupHeadersToRequest:", v4);

}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5;
  void *v6;
  NSNumber *v7;
  NSNumber *daysUntilExpiration;
  void *v9;
  BOOL v10;
  BOOL v11;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("needsTemporaryStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_needsTemporaryStorage = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("durationInDays"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  daysUntilExpiration = self->_daysUntilExpiration;
  self->_daysUntilExpiration = v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("backupStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = !self->_needsTemporaryStorage && v9 == 0;
  if (v10 || (objc_msgSend(v9, "isEqualToString:", CFSTR("ALLOWED")) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("NOT_ALLOWED")))
      goto LABEL_8;
    v11 = 0;
  }
  self->_backupAllowed = v11;
LABEL_8:

  return 0;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)deviceBackupUUID
{
  return self->_deviceBackupUUID;
}

- (NSNumber)deviceTotalUsedSpaceInBytes
{
  return self->_deviceTotalUsedSpaceInBytes;
}

- (int64_t)entryMethod
{
  return self->_entryMethod;
}

- (NSString)deepLinkURL
{
  return self->_deepLinkURL;
}

- (BOOL)isBackupAllowed
{
  return self->_backupAllowed;
}

- (BOOL)needsTemporaryStorage
{
  return self->_needsTemporaryStorage;
}

- (NSNumber)daysUntilExpiration
{
  return self->_daysUntilExpiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysUntilExpiration, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_deviceTotalUsedSpaceInBytes, 0);
  objc_storeStrong((id *)&self->_deviceBackupUUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)bodyJSON
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_FAULT, "deepLinkURL must be non-nil when entryMethod is _ICQMegaBackupEntryMethodDeepLink", v1, 2u);
}

@end
