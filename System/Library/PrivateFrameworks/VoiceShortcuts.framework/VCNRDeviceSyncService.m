@implementation VCNRDeviceSyncService

- (VCNRDeviceSyncService)initWithCompanionSyncService:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  void *v9;
  VCNRDeviceSyncService *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  VCNRDeviceSyncService *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *syncServiceIdentifier;
  void *v27;
  uint64_t v28;
  NSURL *directoryURL;
  void *v31;
  void *v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCNRDeviceSyncService.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCNRDeviceSyncService.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));

LABEL_3:
  v33.receiver = self;
  v33.super_class = (Class)VCNRDeviceSyncService;
  v10 = -[VCNRDeviceSyncService init](&v33, sel_init);
  if (v10)
  {
    if (objc_opt_class())
    {
      objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51780]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (v14 > 6)
      {
        v15 = 3;
LABEL_12:
        v10->_protocolVersion = v15;
        objc_storeWeak((id *)&v10->_service, v7);
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "pairingID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("CompanionSync-%@"), v24);
        v25 = objc_claimAutoreleasedReturnValue();
        syncServiceIdentifier = v10->_syncServiceIdentifier;
        v10->_syncServiceIdentifier = (NSString *)v25;

        objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51708]);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
        }
        objc_msgSend(v27, "URLByAppendingPathComponent:", *MEMORY[0x1E0DC7FA0]);
        v28 = objc_claimAutoreleasedReturnValue();
        directoryURL = v10->_directoryURL;
        v10->_directoryURL = (NSURL *)v28;

        if (v17)
        v16 = v10;
        goto LABEL_21;
      }
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("B8CFCCD2-C6BE-441C-B60D-C5036FB9ABC5"));
      v21 = objc_msgSend(v9, "supportsCapability:", v20);

      if ((v21 & 1) != 0)
      {
        v15 = 2;
        goto LABEL_12;
      }
      getWFWatchSyncLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[VCNRDeviceSyncService initWithCompanionSyncService:device:]";
        v36 = 2114;
        v37 = v9;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, "%s Won't sync to device %{public}@ because it does not support shortcuts", buf, 0x16u);
      }
    }
    else
    {
      getWFWatchSyncLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315394;
        v35 = "-[VCNRDeviceSyncService initWithCompanionSyncService:device:]";
        v36 = 2114;
        v37 = v18;
        v19 = v18;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, "%s Can't create a %{public}@ because NanoRegistry is not available", buf, 0x16u);

      }
    }
    v16 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VCNRDeviceSyncService *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (VCNRDeviceSyncService *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VCNRDeviceSyncService service](self, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCNRDeviceSyncService service](v4, "service");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[VCNRDeviceSyncService syncServiceIdentifier](self, "syncServiceIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCNRDeviceSyncService syncServiceIdentifier](v4, "syncServiceIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v8))
        {
          -[VCNRDeviceSyncService directoryURL](self, "directoryURL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCNRDeviceSyncService directoryURL](v4, "directoryURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 == v10)
          {
            v13 = 1;
          }
          else
          {
            -[VCNRDeviceSyncService directoryURL](self, "directoryURL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCNRDeviceSyncService directoryURL](v4, "directoryURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

          }
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[VCNRDeviceSyncService service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VCNRDeviceSyncService syncServiceIdentifier](self, "syncServiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[VCNRDeviceSyncService directoryURL](self, "directoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)requestSync
{
  id v2;

  -[VCNRDeviceSyncService service](self, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSync");

}

- (void)requestFullResync
{
  id v2;

  -[VCNRDeviceSyncService service](self, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestFullResync");

}

- (NSString)syncServiceIdentifier
{
  return self->_syncServiceIdentifier;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (VCCompanionSyncService)service
{
  return (VCCompanionSyncService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_syncServiceIdentifier, 0);
}

@end
