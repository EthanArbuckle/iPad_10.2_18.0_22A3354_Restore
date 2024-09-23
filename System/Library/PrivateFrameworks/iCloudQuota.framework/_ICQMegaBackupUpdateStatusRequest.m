@implementation _ICQMegaBackupUpdateStatusRequest

+ (id)updateStatusRequestWithAccount:(id)a3 deviceBackupUUID:(id)a4 status:(int64_t)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestURL:URLSession:queue:", v20, v19, v18);

  if (v21)
  {
    objc_storeStrong((id *)(v21 + 56), a3);
    objc_storeStrong((id *)(v21 + 64), a4);
    *(_QWORD *)(v21 + 72) = a5;
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
  int64_t v3;
  const __CFString *v4;
  NSString *deviceBackupUUID;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = -[_ICQMegaBackupUpdateStatusRequest status](self, "status");
  v4 = CFSTR("end");
  if (v3 != 1)
    v4 = 0;
  if (!v3)
    v4 = CFSTR("start");
  deviceBackupUUID = self->_deviceBackupUUID;
  v7[0] = CFSTR("deviceBackupUdid");
  v7[1] = CFSTR("status");
  v8[0] = deviceBackupUUID;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addAdditionalRequestHeaders:(id)a3
{
  id v4;
  ICQRequestProvider *v5;
  ICQRequestProvider *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ICQMegaBackupUpdateStatusRequest;
  v4 = a3;
  -[_ICQMegaBackupNetworkRequest addAdditionalRequestHeaders:](&v7, sel_addAdditionalRequestHeaders_, v4);
  v5 = [ICQRequestProvider alloc];
  v6 = -[ICQRequestProvider initWithAccount:](v5, "initWithAccount:", self->_account, v7.receiver, v7.super_class);
  -[ICQRequestProvider addBasicAndCloudBackupHeadersToRequest:](v6, "addBasicAndCloudBackupHeadersToRequest:", v4);

}

- (id)handleResponse:(id)a3 body:(id)a4
{
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *expirationDate;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("expirationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v5, "integerValue"));
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v7;

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

- (int64_t)status
{
  return self->_status;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deviceBackupUUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
