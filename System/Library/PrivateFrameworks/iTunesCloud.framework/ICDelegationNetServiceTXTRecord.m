@implementation ICDelegationNetServiceTXTRecord

- (ICDelegationNetServiceTXTRecord)initWithTXTRecordData:(id)a3
{
  id v4;
  ICDelegationNetServiceTXTRecord *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  NSString *deviceName;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  ICDelegationNetServiceTXTRecord *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICDelegationNetServiceTXTRecord init](self, "init");
  if (v5)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__28361;
    v23 = __Block_byref_object_dispose__28362;
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0C92C38], "dictionaryFromTXTRecordData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v5;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - TXTRecord dictionary from data decoding: %{public}@", buf, 0x16u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__ICDelegationNetServiceTXTRecord_initWithTXTRecordData___block_invoke;
    v18[3] = &unk_1E438ED30;
    v18[4] = &v19;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
    objc_storeStrong((id *)&v5->_delegationAccountUUIDs, (id)v20[5]);
    objc_msgSend(v6, "objectForKey:", CFSTR("ServiceVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    else
      v9 = 0;
    v5->_serviceVersion = objc_msgSend(v9, "integerValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("SecurityMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
    else
      v11 = 0;
    v12 = objc_msgSend(v11, "integerValue");
    if ((unint64_t)(v12 - 1) >= 4)
      v13 = 0;
    else
      v13 = v12;
    v5->_securityMode = v13;
    objc_msgSend(v6, "objectForKey:", CFSTR("DeviceName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
      deviceName = v5->_deviceName;
      v5->_deviceName = (NSString *)v15;
    }
    else
    {
      deviceName = v5->_deviceName;
      v5->_deviceName = 0;
    }

    _Block_object_dispose(&v19, 8);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t serviceVersion;
  int64_t securityMode;

  v3 = -[NSArray hash](self->_delegationAccountUUIDs, "hash");
  securityMode = self->_securityMode;
  serviceVersion = self->_serviceVersion;
  return v3 ^ serviceVersion ^ securityMode ^ ~-[NSString hash](self->_deviceName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ICDelegationNetServiceTXTRecord *v4;
  NSArray *delegationAccountUUIDs;
  NSArray *v6;
  char v7;
  NSString *deviceName;
  NSString *v9;

  v4 = (ICDelegationNetServiceTXTRecord *)a3;
  if (v4 == self)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_serviceVersion != v4->_serviceVersion)
    goto LABEL_13;
  delegationAccountUUIDs = self->_delegationAccountUUIDs;
  v6 = v4->_delegationAccountUUIDs;
  if (delegationAccountUUIDs != v6)
  {
    v7 = 0;
    if (!delegationAccountUUIDs || !v6)
      goto LABEL_15;
    if (!-[NSArray isEqualToArray:](delegationAccountUUIDs, "isEqualToArray:"))
      goto LABEL_13;
  }
  if (self->_securityMode != v4->_securityMode)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_15;
  }
  deviceName = self->_deviceName;
  v9 = v4->_deviceName;
  if (deviceName == v9)
  {
LABEL_14:
    v7 = 1;
    goto LABEL_15;
  }
  v7 = 0;
  if (deviceName && v9)
    v7 = -[NSString isEqualToString:](deviceName, "isEqualToString:");
LABEL_15:

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_delegationAccountUUIDs)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Delegation UUIDs: %@"), self->_delegationAccountUUIDs);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Delegation UUIDs: Missing"), v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (self->_deviceName)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device name: %@"), self->_deviceName);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device name: Uknonwn"), v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)ICDelegationNetServiceTXTRecord;
  -[ICDelegationNetServiceTXTRecord description](&v13, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ [%@]"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_delegationAccountUUIDs);
    objc_storeStrong((id *)(v5 + 16), self->_deviceName);
    *(_QWORD *)(v5 + 32) = self->_serviceVersion;
    *(_QWORD *)(v5 + 24) = self->_securityMode;
  }
  return (id)v5;
}

- (NSData)TXTRecordData
{
  id v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t securityMode;
  void *v14;
  void *v15;
  NSString *deviceName;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  ICDelegationNetServiceTXTRecord *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(CFSTR("1"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_delegationAccountUUIDs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(CFSTR("AUUID-"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v4, v10);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), self->_serviceVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ServiceVersion"));

  securityMode = self->_securityMode;
  if (securityMode)
  {
    if (securityMode >= 5)
      securityMode = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), securityMode);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("SecurityMode"));

  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    -[NSString dataUsingEncoding:](deviceName, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("DeviceName"));

  }
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - TXTRecord dictionary for data encoding: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C92C38], "dataFromTXTRecordDictionary:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v19;
}

- (NSArray)delegationAccountUUIDs
{
  return self->_delegationAccountUUIDs;
}

- (void)setDelegationAccountUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(int64_t)a3
{
  self->_securityMode = a3;
}

- (int64_t)serviceVersion
{
  return self->_serviceVersion;
}

- (void)setServiceVersion:(int64_t)a3
{
  self->_serviceVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_delegationAccountUUIDs, 0);
}

void __57__ICDelegationNetServiceTXTRecord_initWithTXTRecordData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!objc_msgSend(v10, "rangeOfString:", CFSTR("AUUID-")))
  {
    v4 = v3;
    if (v3 == objc_msgSend(CFSTR("AUUID-"), "length"))
    {
      objc_msgSend(v10, "substringFromIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        if (!v6)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v9 = *(void **)(v8 + 40);
          *(_QWORD *)(v8 + 40) = v7;

          v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        }
        objc_msgSend(v6, "addObject:", v5);
      }

    }
  }

}

@end
