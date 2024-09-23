@implementation VCCompanionSyncSerializer

- (id)dataFromChange:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  VCPBChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (-[NSObject conformsToProtocol:](v3, "conformsToProtocol:", &unk_1EF6FE170) & 1) != 0)
  {
    v5 = objc_alloc_init(VCPBChange);
    v6 = (void *)MEMORY[0x1C3BAFA00]();
    -[NSObject objectIdentifier](v4, "objectIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPBChange setUniqueID:](v5, "setUniqueID:", v7);

    v8 = -[NSObject changeType](v4, "changeType");
    if (v8 == 2)
      v9 = 2;
    else
      v9 = 1;
    if (v8 == 3)
      v10 = 3;
    else
      v10 = v9;
    -[VCPBChange setChangeType:](v5, "setChangeType:", v10);
    -[VCPBChange setMessageType:](v5, "setMessageType:", objc_msgSend((id)objc_opt_class(), "messageType"));
    v11 = (void *)objc_opt_new();
    v19 = 0;
    v12 = -[NSObject writeTo:error:](v4, "writeTo:error:", v11, &v19);
    v13 = v19;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v11, "immutableData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPBChange setMessage:](v5, "setMessage:", v14);

      objc_autoreleasePoolPop(v6);
      -[VCPBChange data](v5, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFWatchSyncLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[VCCompanionSyncSerializer dataFromChange:]";
        v22 = 2114;
        v23 = v4;
        v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_FAULT, "%s Failed to serialize %{public}@: %{public}@", buf, 0x20u);
      }

      objc_autoreleasePoolPop(v6);
      v15 = 0;
    }

    v16 = v4;
  }
  else
  {

    getWFWatchSyncLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[VCCompanionSyncSerializer dataFromChange:]";
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_FAULT, "%s Cannot serialize %{public}@, it does not conform to VCSYChange", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v4;
  void *v5;
  VCPBChange *v6;
  objc_class *v7;
  objc_class *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  objc_class *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BAFA00]();
  v6 = -[VCPBChange initWithData:]([VCPBChange alloc], "initWithData:", v4);
  v7 = (objc_class *)VCSYChangeClassFromMessageType(-[VCPBChange messageType](v6, "messageType"));
  if (!v7)
  {
    getWFWatchSyncLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[VCCompanionSyncSerializer changeFromData:ofType:]";
      v30 = 1024;
      LODWORD(v31) = -[VCPBChange messageType](v6, "messageType");
      _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_FAULT, "%s Unknown message type (%i) when deserializing, dropping change", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0D133D8], "degenerateChange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = [v7 alloc];
  -[VCPBChange uniqueID](v6, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VCPBChange changeType](v6, "changeType");
  v12 = 1;
  if (v11 == 2)
    v12 = 2;
  if (v11 == 3)
    v13 = 3;
  else
    v13 = v12;
  v14 = (id)objc_msgSend(v9, "initWithObjectIdentifier:changeType:", v10, v13);

  -[VCPBChange message](v6, "message");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
    goto LABEL_10;
  v17 = objc_alloc(MEMORY[0x1E0D82B90]);
  -[VCPBChange message](v6, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithData:", v18);

  v27 = 0;
  v20 = objc_msgSend(v14, "readFrom:error:", v19, &v27);
  v21 = v27;
  v22 = v21;
  if (!v20)
  {
    getWFWatchSyncLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[VCCompanionSyncSerializer changeFromData:ofType:]";
      v30 = 2114;
      v31 = v8;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_FAULT, "%s Failed to deserialize %{public}@: %{public}@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0D133D8], "degenerateChange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    objc_autoreleasePoolPop(v5);
    goto LABEL_18;
  }

LABEL_10:
  objc_autoreleasePoolPop(v5);
  v14 = v14;
  v23 = v14;
LABEL_18:

  return v23;
}

@end
