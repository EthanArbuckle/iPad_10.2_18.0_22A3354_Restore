@implementation WFCloudKitSyncToken

- (void)setServerChangeToken:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  WFCloudKitSyncToken *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v9 = (void *)objc_opt_new();
      -[WFCloudKitSyncToken setServerChangeTokenData:](self, "setServerChangeTokenData:", v9);

      v8 = 0;
      goto LABEL_7;
    }
    v5 = v4;
    v6 = self;
    v10 = (void *)v5;
    v7 = v5;
  }
  else
  {
    v7 = objc_opt_new();
    v10 = (void *)v7;
    v6 = self;
  }
  -[WFCloudKitSyncToken setServerChangeTokenData:](v6, "setServerChangeTokenData:", v7);
  v8 = v10;
LABEL_7:

}

- (CKServerChangeToken)serverChangeToken
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFCloudKitSyncToken serverChangeTokenData](self, "serverChangeTokenData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = objc_opt_class();
    -[WFCloudKitSyncToken serverChangeTokenData](self, "serverChangeTokenData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    if (v8)
    {
      v10 = v8;
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFCloudKitSyncToken serverChangeToken]";
        v16 = 2114;
        v17 = v9;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Error unarchving serverChangeTokenData: %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFCloudKitSyncToken serverChangeToken]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s serverChangeTokenData is empty", buf, 0xCu);
    }
    v8 = 0;
  }

  return (CKServerChangeToken *)v8;
}

- (void)setLastOrdering:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(a3, "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WFCloudKitSyncToken setLastOrderingData:](self, "setLastOrderingData:", v5);
    }
    else
    {
      v6 = (void *)objc_opt_new();
      -[WFCloudKitSyncToken setLastOrderingData:](self, "setLastOrderingData:", v6);

    }
  }
  else
  {
    v7 = (id)objc_opt_new();
    -[WFCloudKitSyncToken setLastOrderingData:](self, "setLastOrderingData:", v7);
  }

}

- (NSOrderedSet)lastOrdering
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[WFCloudKitSyncToken lastOrderingData](self, "lastOrderingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCloudKitSyncToken lastOrderingData](self, "lastOrderingData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFCloudKitSyncToken lastOrdering]";
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Error unarchving lastOrderingData: %{public}@", buf, 0x16u);
      }

      v12 = objc_opt_new();
    }
    v13 = (void *)v12;

  }
  else
  {
    getWFCloudKitSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFCloudKitSyncToken lastOrdering]";
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s lastOrderingData is empty", buf, 0xCu);
    }
    v13 = 0;
  }

  return (NSOrderedSet *)v13;
}

- (id)newTokenWithCopiedPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[WFCloudKitSyncToken account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccount:", v4);

  -[WFCloudKitSyncToken serverChangeTokenData](self, "serverChangeTokenData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServerChangeTokenData:", v5);

  -[WFCloudKitSyncToken lastOrderingData](self, "lastOrderingData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastOrderingData:", v6);

  -[WFCloudKitSyncToken lastOrderingCloudKitRecordMetadata](self, "lastOrderingCloudKitRecordMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastOrderingCloudKitRecordMetadata:", v7);

  -[WFCloudKitSyncToken syncEngineMetadata](self, "syncEngineMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncEngineMetadata:", v8);

  -[WFCloudKitSyncToken syncFlagsCloudKitRecordMetadata](self, "syncFlagsCloudKitRecordMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncFlagsCloudKitRecordMetadata:", v9);

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSData)serverChangeTokenData
{
  return self->_serverChangeTokenData;
}

- (void)setServerChangeTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)lastOrderingData
{
  return self->_lastOrderingData;
}

- (void)setLastOrderingData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)lastOrderingCloudKitRecordMetadata
{
  return self->_lastOrderingCloudKitRecordMetadata;
}

- (void)setLastOrderingCloudKitRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)syncEngineMetadata
{
  return self->_syncEngineMetadata;
}

- (void)setSyncEngineMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)syncFlagsCloudKitRecordMetadata
{
  return self->_syncFlagsCloudKitRecordMetadata;
}

- (void)setSyncFlagsCloudKitRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncFlagsCloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_syncEngineMetadata, 0);
  objc_storeStrong((id *)&self->_lastOrderingCloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_lastOrderingData, 0);
  objc_storeStrong((id *)&self->_serverChangeTokenData, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)defaultDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

+ (id)defaultIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ignoredPropertyNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("serverChangeToken"), CFSTR("lastOrdering"), 0);
}

+ (id)accountForContainerEnvironmentString:(id)a3 userRecordID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@:%@"), v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
