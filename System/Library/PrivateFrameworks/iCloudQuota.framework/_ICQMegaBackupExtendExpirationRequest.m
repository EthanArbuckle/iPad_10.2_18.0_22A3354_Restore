@implementation _ICQMegaBackupExtendExpirationRequest

+ (id)extendExpirationRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 requestedExpirationDate:(id)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;
  id v23;

  v23 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestURL:URLSession:queue:", v20, v19, v18);

  if (v21)
  {
    objc_storeStrong(v21 + 8, a3);
    objc_storeStrong(v21 + 9, a4);
    objc_storeStrong(v21 + 10, a5);
  }

  return v21;
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
  NSDate *requestedExpirationDate;
  NSString *deviceBackupUUID;
  void *v4;
  void *v5;
  void *v6;
  NSString *v8;
  const __CFString *v9;
  NSString *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  requestedExpirationDate = self->_requestedExpirationDate;
  if (requestedExpirationDate)
  {
    deviceBackupUUID = self->_deviceBackupUUID;
    v11[0] = CFSTR("deviceBackupUdid");
    v11[1] = CFSTR("newExpirationDate");
    v12[0] = deviceBackupUUID;
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](requestedExpirationDate, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = self->_deviceBackupUUID;
    v9 = CFSTR("deviceBackupUdid");
    v10 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)addAdditionalRequestHeaders:(id)a3
{
  id v4;
  ICQRequestProvider *v5;
  ICQRequestProvider *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ICQMegaBackupExtendExpirationRequest;
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
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *updatedExpirationDate;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extensionAllowed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_extensionAllowed = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("newExpirationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    updatedExpirationDate = self->_updatedExpirationDate;
    self->_updatedExpirationDate = v9;

  }
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

- (NSDate)requestedExpirationDate
{
  return self->_requestedExpirationDate;
}

- (BOOL)isExtensionAllowed
{
  return self->_extensionAllowed;
}

- (NSDate)updatedExpirationDate
{
  return self->_updatedExpirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedExpirationDate, 0);
  objc_storeStrong((id *)&self->_requestedExpirationDate, 0);
  objc_storeStrong((id *)&self->_deviceBackupUUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
