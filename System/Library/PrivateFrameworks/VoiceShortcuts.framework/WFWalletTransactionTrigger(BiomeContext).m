@implementation WFWalletTransactionTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Wallet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "DSLPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribeOn:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)hasRemotePublisher
{
  return 1;
}

- (id)remotePublisherWithScheduler:()BiomeContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "registerContextSyncClient"))
  {
    BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ContextSync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "WalletTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DSLPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "subscribeOn:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)transactionIdentifierWithEvent:()BiomeContext
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "transactionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    objc_msgSend(v13, "transactionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
    v14 = v10;
  else
    v14 = v9;
  v15 = v14;

  return v15;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  id v7;
  void (**v8)(id, _BOOL8);
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  void *v30;
  _BOOL4 v31;
  _BOOL8 v32;
  id v33;
  _QWORD v35[5];
  void (**v36)(id, _BOOL8);
  _BYTE *v37;
  uint64_t *v38;
  char v39;
  BOOL v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _BYTE buf[24];
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  v8 = a5;
  objc_msgSend(v7, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
  }

  objc_msgSend(v7, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      getWFTriggersLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Found remote event converting to BMWalletTransaction", buf, 0xCu);
      }

      v12 = objc_alloc(MEMORY[0x1E0D02348]);
      objc_msgSend(v10, "passUniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "passLocalizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "transactionType");
      objc_msgSend(v10, "transactionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "merchantType");
      objc_msgSend(v10, "poiCategory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v12, "initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", v13, v14, v15, v16, v17, v18);

LABEL_8:
      getWFTriggersLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "passUniqueID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "transactionType");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v47 = v20;
        v48 = 2048;
        v49 = v21;
        _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s Received wallet transaction event %@ for trigger. pass unique id: %@; transactionType: %lu",
          buf,
          0x2Au);

      }
      objc_msgSend(v9, "passUniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(a1, "isPassIdentifierValid:", v22);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v47) = 1;
      v42 = 0;
      v43 = &v42;
      v44 = 0x2020000000;
      v45 = 1;
      if (objc_msgSend(v9, "transactionType") == 1)
      {
        objc_msgSend(a1, "selectedMerchantTypes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");
        WFAllWalletTransactionMerchantTypes();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 >= objc_msgSend(v26, "count"))
        {
          v28 = 0;
        }
        else
        {
          objc_msgSend(a1, "selectedMerchantTypes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count") != 0;

        }
      }
      else
      {
        v28 = 0;
      }
      if (objc_msgSend(v9, "transactionType") == 1)
      {
        objc_msgSend(a1, "selectedMerchants");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count") != 0;

        if (v28)
          goto LABEL_27;
      }
      else
      {
        v31 = 0;
        if (v28)
          goto LABEL_27;
      }
      if (!v31)
      {
        v32 = v23 && *(_BYTE *)(*(_QWORD *)&buf[8] + 24) && *((_BYTE *)v43 + 24) != 0;
        v8[2](v8, v32);
        goto LABEL_30;
      }
LABEL_27:
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __101__WFWalletTransactionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke;
      v35[3] = &unk_1E7AA5F58;
      v39 = v23;
      v40 = v28;
      v36 = v8;
      v37 = buf;
      v35[4] = a1;
      v41 = v31;
      v38 = &v42;
      objc_msgSend(a1, "eventInfoForEvent:completion:", v7, v35);

LABEL_30:
      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_31;
    }
  }

  getWFTriggersLogObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
    _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_DEFAULT, "%s No wallet transaction event received for trigger; not firing.",
      buf,
      0xCu);
  }

  v8[2](v8, 0);
LABEL_31:

}

- (uint64_t)isPassIdentifierValid:()BiomeContext
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "selectedPassUniqueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (uint64_t)registerContextSyncClient
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  BiomeLibrary();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "Wallet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "Transaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "DSLPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14390]), "initWithClientName:", CFSTR("com.apple.shortcuts"));
  v14 = 0;
  v5 = objc_msgSend(v4, "registerForUpdates:withIdentifier:shouldWake:forDeviceTypes:withError:", v3, CFSTR("com.apple.shortcuts"), 1, 4, &v14);
  v6 = v14;
  getWFTriggersLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[WFWalletTransactionTrigger(BiomeContext) registerContextSyncClient]";
      v9 = "%s Successfully registered for updates with context sync client";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[WFWalletTransactionTrigger(BiomeContext) registerContextSyncClient]";
    v17 = 2112;
    v18 = v6;
    v9 = "%s Failed register for updates from context sync client with error: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  return v5;
}

+ (uint64_t)unregisterContextSyncClient
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  BiomeLibrary();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "Wallet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "Transaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "DSLPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14390]), "initWithClientName:", CFSTR("com.apple.shortcuts"));
  v14 = 0;
  v5 = objc_msgSend(v4, "unregisterForUpdates:withIdentifier:forDeviceTypes:withError:", v3, CFSTR("com.apple.shortcuts"), 4, &v14);
  v6 = v14;
  getWFTriggersLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[WFWalletTransactionTrigger(BiomeContext) unregisterContextSyncClient]";
      v9 = "%s Successfully unregistered from context sync client";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[WFWalletTransactionTrigger(BiomeContext) unregisterContextSyncClient]";
    v17 = 2112;
    v18 = v6;
    v9 = "%s Failed to unregister client with error: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  return v5;
}

@end
