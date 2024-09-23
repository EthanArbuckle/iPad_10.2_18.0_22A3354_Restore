@implementation UARPiCloudManager

- (BOOL)handleRemoteFetchRequestForCHIPAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  id v15;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x220733E88]();
  -[UARPiCloudManager container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "verificationCertificates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (-[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync](self, "performRemoteFetchForCHIPVerificationCertificateSync"), -[UARPiCloudManager container](self, "container"), v10 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "verificationCertificates"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v10, v11))
  {
    v15 = 0;
    v12 = -[UARPiCloudManager handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:](self, "handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:", &v15, v6, v4);
    v13 = v15;
    -[UARPiCloudManager processCHIPAccessoriesRecords:isComplete:productGroup:](self, "processCHIPAccessoriesRecords:isComplete:productGroup:", v13, v12, v6);

  }
  else
  {
    LOBYTE(v12) = 1;
    -[UARPiCloudManager processCHIPAccessoriesRecords:isComplete:productGroup:](self, "processCHIPAccessoriesRecords:isComplete:productGroup:", 0, 1, v6);
  }
  objc_autoreleasePoolPop(v7);

  return v12;
}

- (BOOL)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:(id *)a3 productGroup:(id)a4 batchRequest:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  _QWORD v31[5];
  NSObject *v32;
  _QWORD v33[6];
  BOOL v34;
  _QWORD v35[5];
  id v36;
  __int128 *p_buf;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[3];

  v5 = a5;
  v47[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  -[UARPiCloudManager log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[UARPiCloudManager container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_219CF8000, v8, OS_LOG_TYPE_DEFAULT, "Fetching CHIPAccessories Record for Container:%@", (uint8_t *)&buf, 0xCu);

  }
  v11 = objc_alloc(MEMORY[0x24BDB9200]);
  v12 = (void *)objc_msgSend(v11, "initWithZoneName:ownerName:", CFSTR("chipAccessories"), *MEMORY[0x24BDB8E80]);
  v13 = objc_alloc(MEMORY[0x24BDB90D0]);
  v47[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v14, 0);

  objc_msgSend(v15, "setFetchAllChanges:", !v5);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x24BDB90B8]);
    -[UARPiCloudManager container](self, "container");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "databaseChangeToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreviousServerChangeToken:", v19);

    objc_msgSend(v16, "setObject:forKey:", v17, v12);
    objc_msgSend(v15, "setConfigurationsByRecordZoneID:", v16);

  }
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke;
  v35[3] = &unk_24DBDF498;
  v35[4] = self;
  v21 = v7;
  v36 = v21;
  p_buf = &buf;
  objc_msgSend(v15, "setRecordChangedBlock:", v35);
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_12;
  v33[3] = &unk_24DBDF4C0;
  v34 = v5;
  v33[4] = self;
  v33[5] = &v38;
  objc_msgSend(v15, "setRecordZoneFetchCompletionBlock:", v33);
  v31[0] = v20;
  v31[1] = 3221225472;
  v31[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_16;
  v31[3] = &unk_24DBDF4E8;
  v31[4] = self;
  v22 = dispatch_semaphore_create(0);
  v32 = v22;
  objc_msgSend(v15, "setFetchRecordZoneChangesCompletionBlock:", v31);
  -[UARPiCloudManager container](self, "container");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "database");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addOperation:", v15);

  v25 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v22, v25))
  {
    -[UARPiCloudManager log](self, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:].cold.1();

    *a3 = 0;
    -[UARPiCloudManager container](self, "container");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDatabaseChangeToken:", 0);

    objc_msgSend(v15, "cancel");
    v28 = 1;
  }
  else
  {
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v28 = *((_BYTE *)v39 + 24) != 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v38, 8);

  return v28;
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  CHIPAccessoriesRecord *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_219CF8000, v4, OS_LOG_TYPE_DEFAULT, "%s: Record Changed: %@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(v3, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CHIPAccessory"));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 40);
    if (!v11 || objc_msgSend(v11, "isEqualToString:", v10))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "processCHIPAccessoriesRecord:", v3))
      {
        v12 = -[CHIPAccessoriesRecord initWithCKRecord:]([CHIPAccessoriesRecord alloc], "initWithCKRecord:", v3);
        if (v12)
        {
          v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v13)
          {
            v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v16 = *(void **)(v15 + 40);
            *(_QWORD *)(v15 + 40) = v14;

            v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v13, "addObject:", v12);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "log");
        v12 = (CHIPAccessoriesRecord *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "recordID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "recordName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 136315394;
          v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchReque"
                "st:]_block_invoke";
          v21 = 2112;
          v22 = v18;
          _os_log_impl(&dword_219CF8000, &v12->super, OS_LOG_TYPE_DEFAULT, "%s: Invalid CHIPAccessoryRecord: %@", (uint8_t *)&v19, 0x16u);

        }
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315394;
      v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_219CF8000, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid Record type: %@", (uint8_t *)&v19, 0x16u);
    }
  }

}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_12(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v12 = a6;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = "NO";
    v17 = 136316162;
    v18 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    if (a5)
      v14 = "YES";
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2080;
    v26 = v14;
    _os_log_impl(&dword_219CF8000, v13, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed for recordZoneID: %@ changeToken:%@ error: %@ moreComing %s", (uint8_t *)&v17, 0x34u);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a5 ^ 1;
    if (((a5 ^ 1) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "container");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDatabaseChangeToken:", 0);
    }
    else
    {
      v15 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(*(id *)(a1 + 32), "container");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDatabaseChangeToken:", v15);

    }
  }

}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v4, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed with error: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)handleRemoteFetchRequestForCHIPAttestationCertificates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  -[UARPiCloudManager container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verificationCertificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync](self, "performRemoteFetchForCHIPVerificationCertificateSync"), -[UARPiCloudManager container](self, "container"), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "verificationCertificates"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7, v8))
  {
    v10 = 0;
    -[UARPiCloudManager handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:](self, "handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:", &v10, v4);
    v9 = v10;
    -[UARPiCloudManager processCHIPAttestationCertificateRecords:subjectKeyIdentifier:](self, "processCHIPAttestationCertificateRecords:subjectKeyIdentifier:", v9, v4);

  }
  else
  {
    -[UARPiCloudManager processCHIPAttestationCertificateRecords:subjectKeyIdentifier:](self, "processCHIPAttestationCertificateRecords:subjectKeyIdentifier:", 0, v4);
  }

}

- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:(id *)a3 subjectKeyIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *v21;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[UARPiCloudManager log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[UARPiCloudManager container](self, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_219CF8000, v7, OS_LOG_TYPE_DEFAULT, "Fetching CHIPAttestationCertificate Record for Container:%@", (uint8_t *)&buf, 0xCu);

  }
  v10 = objc_alloc(MEMORY[0x24BDB9200]);
  v11 = (void *)objc_msgSend(v10, "initWithZoneName:ownerName:", CFSTR("chipAttestationCertificates"), *MEMORY[0x24BDB8E80]);
  v12 = objc_alloc(MEMORY[0x24BDB90D0]);
  v32[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v13, 0);

  objc_msgSend(v14, "setFetchAllChanges:", 1);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v15 = MEMORY[0x24BDAC760];
  v31 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke;
  v24[3] = &unk_24DBDF498;
  v24[4] = self;
  v16 = v6;
  v25 = v16;
  p_buf = &buf;
  objc_msgSend(v14, "setRecordChangedBlock:", v24);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke_21;
  v22[3] = &unk_24DBDF4E8;
  v22[4] = self;
  v17 = dispatch_semaphore_create(0);
  v23 = v17;
  objc_msgSend(v14, "setFetchRecordZoneChangesCompletionBlock:", v22);
  -[UARPiCloudManager container](self, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v14);

  v20 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v17, v20))
  {
    -[UARPiCloudManager log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:].cold.1();

    *a3 = 0;
    objc_msgSend(v14, "cancel");
  }
  else
  {
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }

  _Block_object_dispose(&buf, 8);
}

void __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  CHIPAttestationCertificateRecord *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_219CF8000, v4, OS_LOG_TYPE_DEFAULT, "%s: Record Changed :%@", (uint8_t *)&v14, 0x16u);
  }

  v5 = *(void **)(a1 + 40);
  if (!v5
    || (objc_msgSend(v3, "recordID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "recordName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "isEqualToString:", v7),
        v7,
        v6,
        v8))
  {
    v9 = -[CHIPAttestationCertificateRecord initWithCKRecord:]([CHIPAttestationCertificateRecord alloc], "initWithCKRecord:", v3);
    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v10)
      {
        v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v10, "addObject:", v9);
    }

  }
}

void __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v4, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed with error: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)performRemoteFetchForCHIPVerificationCertificateSync
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  UARPiCloudManager *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[UARPiCloudManager log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[UARPiCloudManager container](self, "container");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_219CF8000, v3, OS_LOG_TYPE_DEFAULT, "Fetching CHIPVerificationCertificate Record for Container:%@", buf, 0xCu);

  }
  v6 = objc_alloc(MEMORY[0x24BDB9200]);
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("certificates"), *MEMORY[0x24BDB8E80]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E0]), "initWithRecordName:zoneID:", CFSTR("certificates"), v7);
  v9 = objc_alloc(MEMORY[0x24BDB90F0]);
  v26 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordIDs:", v10);

  v12 = dispatch_semaphore_create(0);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __79__UARPiCloudManager_CHIP__performRemoteFetchForCHIPVerificationCertificateSync__block_invoke;
  v22 = &unk_24DBDF510;
  v23 = self;
  v13 = v8;
  v24 = v13;
  v14 = v12;
  v25 = v14;
  objc_msgSend(v11, "setFetchRecordsCompletionBlock:", &v19);
  -[UARPiCloudManager container](self, "container", v19, v20, v21, v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v11);

  v17 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    -[UARPiCloudManager log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager(CHIP) performRemoteFetchForCHIPVerificationCertificateSync].cold.1();

    objc_msgSend(v11, "cancel");
  }

}

void __79__UARPiCloudManager_CHIP__performRemoteFetchForCHIPVerificationCertificateSync__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[UARPiCloudManager(CHIP) performRemoteFetchForCHIPVerificationCertificateSync]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_219CF8000, v7, OS_LOG_TYPE_INFO, "%s: operationError = %@, recordsByRecordID: %@", (uint8_t *)&v10, 0x20u);
  }

  if (v5 && !v6)
  {
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processVerificationCertificateRecord:", v8);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)processCHIPAccessoriesRecords:(id)a3 isComplete:(BOOL)a4 productGroup:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "accessoryMetadata", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    -[UARPiCloudManager delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "remoteFetchCompletionForSupportedAccessories:productGroup:isComplete:error:", v10, v9, v6, 0);

  }
  else if (v6)
  {
    -[UARPiCloudManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteFetchCompletionForSupportedAccessories:productGroup:isComplete:error:", 0, v9, 1, 0);

  }
}

- (BOOL)processCHIPAccessoriesRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const __CFData *v10;
  void *v11;
  __SecKey *v12;
  __SecKey *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  CFErrorRef error;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UARPiCloudManager calculateDigestFromCHIPAccessoryCKRecord:](self, "calculateDigestFromCHIPAccessoryCKRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[UARPiCloudManager log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_219CF8000, v8, OS_LOG_TYPE_INFO, "CHIPAccessory record digest: %@", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("signatureV2"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0)) != 0)
    {
      v10 = (const __CFData *)v9;
      objc_msgSend(v4, "objectForKey:", CFSTR("verificationCertificateKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (v12 = -[UARPiCloudManager copyPublicKeyFromCertificateID:](self, "copyPublicKeyFromCertificateID:", v11)) != 0)
      {
        v13 = v12;
        -[UARPiCloudManager log](self, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "recordID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "recordName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_impl(&dword_219CF8000, v14, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);

        }
        error = 0;
        v17 = SecKeyVerifySignature(v13, (SecKeyAlgorithm)*MEMORY[0x24BDE9298], (CFDataRef)v5, v10, &error);
        v18 = v17 != 0;
        CFRelease(v13);
        -[UARPiCloudManager log](self, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "recordID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "recordName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v22;
            _os_log_impl(&dword_219CF8000, v20, OS_LOG_TYPE_DEFAULT, "Stonehenge Signature validation successful for CHIPAccessoryRecord %@", buf, 0xCu);

          }
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.4(v4, (uint64_t)&error, v20);

          CFRelease(error);
        }
      }
      else
      {
        -[UARPiCloudManager log](self, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.3(v4);

        v18 = 0;
      }

    }
    else
    {
      -[UARPiCloudManager log](self, "log");
      v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
        -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.2(v4);
      v18 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.1(v4);
    v18 = 0;
  }

  return v18;
}

- (void)processCHIPAttestationCertificateRecords:(id)a3 subjectKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UARPiCloudManager *v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (v7)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "recordName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v7, "isEqualToString:", v15);

            if (!v16)
              continue;
          }
          if (-[UARPiCloudManager processCHIPAttestationCertificateRecord:subjectKeyIdentifier:](self, "processCHIPAttestationCertificateRecord:subjectKeyIdentifier:", v14, v7))
          {
            objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v11);
    }
    v34 = self;

    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v8;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v22, "rootCertificate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          objc_msgSend(v22, "intermediateCertificates");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            objc_msgSend(v22, "intermediateCertificates");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "length");

            if (v28)
            {
              objc_msgSend(v22, "intermediateCertificates");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "appendFormat:", CFSTR(",%@"), v29);

            }
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "recordName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, v31);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v19);
    }

    -[UARPiCloudManager delegate](v34, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "remoteFetchCompletionForAttestationCertificates:subjectKeyIdentifier:error:", v17, v7, 0);

    v6 = v35;
  }
  else
  {
    -[UARPiCloudManager delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "remoteFetchCompletionForAttestationCertificates:subjectKeyIdentifier:error:", 0, v7, 0);

  }
}

- (BOOL)processCHIPAttestationCertificateRecord:(id)a3 subjectKeyIdentifier:(id)a4
{
  id v5;
  void *v6;
  __SecKey *v7;
  const __CFData *v8;
  id v9;
  void *v10;
  const __CFData *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  CFErrorRef error;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "verificationCertificateID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPiCloudManager copyPublicKeyFromCertificateID:](self, "copyPublicKeyFromCertificateID:", v6);

  -[UARPiCloudManager calculateDigestFromCHIPAttestationCertificateRecord:](self, "calculateDigestFromCHIPAttestationCertificateRecord:", v5);
  v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v5, "signature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const __CFData *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v10, 0);

  if (v7)
  {
    v12 = 0;
    if (-[__CFData length](v8, "length") && v11)
    {
      -[UARPiCloudManager log](self, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "ckRecord");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "recordID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v16;
        _os_log_impl(&dword_219CF8000, v13, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);

      }
      error = 0;
      v17 = SecKeyVerifySignature(v7, (SecKeyAlgorithm)*MEMORY[0x24BDE9298], v8, v11, &error);
      v12 = v17 != 0;
      CFRelease(v7);
      -[UARPiCloudManager log](self, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "ckRecord");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v20;
          _os_log_impl(&dword_219CF8000, v19, OS_LOG_TYPE_DEFAULT, "Signature validation successful CHIPAttestationCertificateRecord %@", buf, 0xCu);

        }
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[UARPiCloudManager(CHIP) processCHIPAttestationCertificateRecord:subjectKeyIdentifier:].cold.1(v5, (uint64_t)&error, v19);

        CFRelease(error);
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)calculateDigestFromCHIPAccessoryCKRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  uint64_t v23;
  CC_LONG v24;
  const void *v25;
  uint64_t v26;
  void *v28;
  id v29;
  void *v30;
  unint64_t data;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CC_SHA256_CTX c;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (objc_msgSend(v6, "count") == 2)
  {
    v28 = v6;
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v33;
      v16 = *MEMORY[0x24BE28A50];
      v17 = CFSTR("verificationCertificateKey");
      v30 = v8;
      v18 = *(_QWORD *)v33;
      v29 = v3;
      while (1)
      {
        if (v18 != v15)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("accessoryCategoryNumber")))
        {
          if ((objc_msgSend(v8, "isEqualToString:", v16) & 1) == 0)
            break;
        }
        if ((objc_msgSend(v19, "isEqualToString:", v17) & 1) == 0
          && (objc_msgSend(v19, "isEqualToString:", CFSTR("signature")) & 1) == 0
          && (objc_msgSend(v19, "isEqualToString:", CFSTR("signatureV2")) & 1) == 0
          && (objc_msgSend(v19, "isEqualToString:", CFSTR("accessoryProductLabel")) & 1) == 0)
        {
          objc_msgSend(v3, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "dataUsingEncoding:", 4);
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = v17;
          v23 = objc_msgSend(v21, "bytes");
          v24 = objc_msgSend(v21, "length");
          v25 = (const void *)v23;
          v17 = v22;
          CC_SHA256_Update(&c, v25, v24);

          v3 = v29;
          v8 = v30;
LABEL_14:

        }
        if (++v14 >= v13)
        {
          v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (!v26)
            goto LABEL_19;
          v13 = v26;
          v14 = 0;
        }
        v18 = *(_QWORD *)v33;
      }
      objc_msgSend(v3, "objectForKey:", CFSTR("accessoryCategoryNumber"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      data = 0;
      data = bswap64(objc_msgSend(v20, "unsignedLongLongValue"));
      CC_SHA256_Update(&c, &data, 8u);
      goto LABEL_14;
    }
LABEL_19:

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v7, "mutableBytes"), &c);

    v6 = v28;
  }

  return v7;
}

- (id)calculateDigestFromCHIPAttestationCertificateRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  CC_SHA256_CTX v14;

  v3 = a3;
  memset(&v14, 0, sizeof(v14));
  CC_SHA256_Init(&v14);
  objc_msgSend(v3, "rootCertificate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256_Update(&v14, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  objc_msgSend(v3, "intermediateCertificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_retainAutorelease(v8);
    CC_SHA256_Update(&v14, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  }
  objc_msgSend(v3, "recordStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  CC_SHA256_Update(&v14, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v12, "mutableBytes"), &v14);

  return v12;
}

- (__SecKey)copyPublicKeyFromCertificateID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t AppleCHIPUpdateSigning;
  const void *v10;
  __SecKey *v11;

  v4 = a3;
  -[UARPiCloudManager container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verificationCertificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AppleCHIPUpdateSigning = SecPolicyCreateAppleCHIPUpdateSigning();
    if (AppleCHIPUpdateSigning)
    {
      v10 = (const void *)AppleCHIPUpdateSigning;
      v11 = -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:](self, "copyPublicKeyForVerificationCertificateData:policy:", v8, AppleCHIPUpdateSigning);
      CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)processCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHIPAccessoryFirmwareRecord *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[CHIPAccessoryFirmwareRecord initWithCKRecord:]([CHIPAccessoryFirmwareRecord alloc], "initWithCKRecord:", v10);

  LODWORD(v10) = objc_msgSend(v9, "signatureValidationNeeded");
  -[UARPiCloudManager log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v10)
  {
    if (v13)
    {
      -[CHIPAccessoryFirmwareRecord recordName](v11, "recordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = "-[UARPiCloudManager(CHIP) processCHIPFirmwareRecord:inContainer:forAccessory:]";
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_219CF8000, v12, OS_LOG_TYPE_DEFAULT, "%s: Bypassing signature validation on Record %@", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_9;
  }
  if (v13)
  {
    -[CHIPAccessoryFirmwareRecord recordName](v11, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[UARPiCloudManager(CHIP) processCHIPFirmwareRecord:inContainer:forAccessory:]";
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_219CF8000, v12, OS_LOG_TYPE_DEFAULT, "%s: Validating signature on Record %@", (uint8_t *)&v17, 0x16u);

  }
  if (-[UARPiCloudManager validateCHIPFirmwareRecord:inContainer:forAccessory:](self, "validateCHIPFirmwareRecord:inContainer:forAccessory:", v11, v8, v9))
  {
LABEL_9:
    objc_msgSend(v9, "setChipFirmwareRecord:", v11);
  }
  -[UARPiCloudManager delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteFetchCompletion:error:", v9, 0);

}

- (BOOL)validateCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  id v6;
  void *v7;
  __SecKey *v8;
  const __CFData *v9;
  NSObject *v10;
  id v11;
  void *v12;
  const __CFData *v13;
  NSObject *v14;
  void *v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  _BYTE cf[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "verificationCertificateID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UARPiCloudManager copyPublicKeyFromCertificateID:](self, "copyPublicKeyFromCertificateID:", v7);

  if (v8)
  {
    objc_msgSend(v6, "digest");
    v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (-[__CFData length](v9, "length"))
    {
      -[UARPiCloudManager log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)cf = 138412290;
        *(_QWORD *)&cf[4] = v9;
        _os_log_impl(&dword_219CF8000, v10, OS_LOG_TYPE_INFO, "CHIPAccessoryFirmware record digest: %@", cf, 0xCu);
      }

      v11 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v6, "signature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (const __CFData *)objc_msgSend(v11, "initWithBase64EncodedString:options:", v12, 0);

      if (v13)
      {
        -[UARPiCloudManager log](self, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "recordName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)cf = 138412290;
          *(_QWORD *)&cf[4] = v15;
          _os_log_impl(&dword_219CF8000, v14, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", cf, 0xCu);

        }
        *(_QWORD *)cf = 0;
        v16 = SecKeyVerifySignature(v8, (SecKeyAlgorithm)*MEMORY[0x24BDE9298], v9, v13, (CFErrorRef *)cf);
        v17 = v16 != 0;
        CFRelease(v8);
        if (!v16)
        {
          -[UARPiCloudManager log](self, "log");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[UARPiCloudManager(CHIP) validateCHIPFirmwareRecord:inContainer:forAccessory:].cold.1(v6, (uint64_t)cf, v18);

          CFRelease(*(CFTypeRef *)cf);
        }
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (UARPiCloudManager)initWithDelegate:(id)a3 containerID:(id)a4
{
  id v7;
  id v8;
  UARPiCloudManager *v9;
  os_log_t v10;
  OS_os_log *log;
  dispatch_queue_t v12;
  OS_dispatch_queue *recordProcessingQueue;
  UARPiCloudContainer *v14;
  UARPiCloudContainer *container;
  NSMutableSet *v16;
  void *pendingiCloudAccessoryRequests;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UARPiCloudManager;
  v9 = -[UARPiCloudManager init](&v19, sel_init);
  if (!dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 16))
  {
    pendingiCloudAccessoryRequests = v9;
    v9 = 0;
    goto LABEL_5;
  }
  if (v9)
  {
    v10 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_delegate, a3);
    v12 = dispatch_queue_create("com.apple.UARPiCloudManager.recordProcessingQueue", 0);
    recordProcessingQueue = v9->_recordProcessingQueue;
    v9->_recordProcessingQueue = (OS_dispatch_queue *)v12;

    v14 = -[UARPiCloudContainer initWithContainerID:]([UARPiCloudContainer alloc], "initWithContainerID:", v8);
    container = v9->_container;
    v9->_container = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    pendingiCloudAccessoryRequests = v9->_pendingiCloudAccessoryRequests;
    v9->_pendingiCloudAccessoryRequests = v16;
LABEL_5:

  }
  return v9;
}

- (void)performRemoteFetchForAccessories:(id)a3
{
  id v4;
  NSObject *recordProcessingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  UARPiCloudManager *v9;

  v4 = a3;
  recordProcessingQueue = self->_recordProcessingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__UARPiCloudManager_performRemoteFetchForAccessories___block_invoke;
  v7[3] = &unk_24DBDF5D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(recordProcessingQueue, v7);

}

void __54__UARPiCloudManager_performRemoteFetchForAccessories___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", v8, (_QWORD)v9) & 1) == 0)
        {
          objc_msgSend(v2, "addObject:", v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "qHandleRemoteFetchRequestForAccessories:", v2);

}

- (void)qHandleRemoteFetchRequestForAccessories:(id)a3
{
  id v4;
  UARPiCloudContainer **p_container;
  UARPiCloudContainer *container;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *log;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_container = &self->_container;
  if (-[UARPiCloudManager fetchVerificationCertificateInContainer:](self, "fetchVerificationCertificateInContainer:", self->_container))
  {
    container = self->_container;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61__UARPiCloudManager_qHandleRemoteFetchRequestForAccessories___block_invoke;
    v20[3] = &unk_24DBDF4E8;
    v20[4] = self;
    v21 = v4;
    -[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:](self, "fetchRemoteDatabaseChangesInContainer:completion:", container, v20);

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[NSMutableSet removeObject:](self->_pendingiCloudAccessoryRequests, "removeObject:", v12);
          -[UARPiCloudManagerDelegate remoteFetchCompletion:error:](self->_delegate, "remoteFetchCompletion:error:", v12, 0);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:].cold.1((uint64_t)p_container, log, v14, v15, v16, v17, v18, v19);
  }

}

void __61__UARPiCloudManager_qHandleRemoteFetchRequestForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v6 = v4;
    objc_msgSend(v5, "updatedZones");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:]_block_invoke";
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_219CF8000, v6, OS_LOG_TYPE_INFO, "%s: container.updatedZones: %@ error: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updatedZones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v3)
    v10 = 1;
  else
    v10 = v9 == 0;
  v11 = !v10;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *(id *)(a1 + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v17, (_QWORD)v18);
        if ((v11 & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteFetchCompletion:error:", v17, v3);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "fetchZoneChangesInContainer:forAccessories:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));

}

- (int64_t)fetchRemoteDatabaseChangesInContainer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB90A0]), "initWithPreviousServerChangeToken:", 0);
  objc_msgSend(v8, "setFetchAllChanges:", 1);
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke;
  v18[3] = &unk_24DBDF678;
  v18[4] = self;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v8, "setRecordZoneWithIDChangedBlock:", v18);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_186;
  v15[3] = &unk_24DBDF6C8;
  v15[4] = self;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v10;
  objc_msgSend(v8, "setFetchDatabaseChangesCompletionBlock:", v15);
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v8);

  return 0;
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2;
  block[3] = &unk_24DBDF5B0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  UARPiCloudZone *v4;
  uint64_t v5;
  void *v6;
  UARPiCloudZone *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v9 = 136315394;
    v10 = "-[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]_block_invoke_2";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_INFO, "%s: Zone with ID %@ changed", (uint8_t *)&v9, 0x16u);
  }
  v4 = [UARPiCloudZone alloc];
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "containerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPiCloudZone initWithZoneID:containerID:](v4, "initWithZoneID:containerID:", v5, v6);

  objc_msgSend(*(id *)(a1 + 48), "updatedZones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_186(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2_187;
  v14[3] = &unk_24DBDF6A0;
  v14[1] = 3221225472;
  v14[4] = v9;
  v15 = v7;
  v19 = a3;
  v16 = v8;
  v17 = v10;
  v18 = *(id *)(a1 + 48);
  v12 = v8;
  v13 = v7;
  dispatch_async(v11, v14);

}

uint64_t __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2_187(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = 136315906;
    v9 = "-[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]_block_invoke_2";
    v10 = 2112;
    v11 = v4;
    v12 = 1024;
    v13 = v3;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_INFO, "%s: Fetch database changes operation completed with token: %@ moreComing: %d error: %@", (uint8_t *)&v8, 0x26u);
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(*(id *)(a1 + 56), "setDatabaseChangeToken:", v6);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)fetchZoneChangesInContainer:(id)a3 forAccessories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *log;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("zoneName"), 1);
  objc_msgSend(v6, "updatedZones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke;
    v30[3] = &unk_24DBDF6F0;
    v13 = v6;
    v31 = v13;
    v32 = v8;
    v22 = v8;
    v14 = v9;
    v33 = v14;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);
    v34 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingDescriptors:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB90D0]), "initWithRecordZoneIDs:configurationsByRecordZoneID:", v16, 0);
    objc_msgSend(v17, "setFetchAllChanges:", 1);
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2;
    v28[3] = &unk_24DBDF718;
    v28[4] = self;
    v18 = v13;
    v29 = v18;
    objc_msgSend(v17, "setRecordChangedBlock:", v28);
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_200;
    v26[3] = &unk_24DBDF790;
    v26[4] = self;
    v27 = v11;
    objc_msgSend(v17, "setRecordZoneFetchCompletionBlock:", v26);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_204;
    v23[3] = &unk_24DBDF7E0;
    v23[4] = self;
    v19 = v18;
    v24 = v19;
    v25 = v7;
    objc_msgSend(v17, "setFetchRecordZoneChangesCompletionBlock:", v23);
    objc_msgSend(v19, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addOperation:", v17);

    v8 = v22;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]";
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_INFO, "%s: No updates available for accessories %@", buf, 0x16u);
    }
  }

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc_init(MEMORY[0x24BDB90B8]);
  objc_msgSend(*(id *)(a1 + 32), "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("com.apple.chip"));

  if (v5)
  {
    objc_msgSend(v3, "setPreviousServerChangeToken:", 0);
  }
  else
  {
    objc_msgSend(v11, "changeToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPreviousServerChangeToken:", v6);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v11, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v3, v8);

  v9 = *(void **)(a1 + 48);
  objc_msgSend(v11, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3;
  block[3] = &unk_24DBDF5B0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_INFO, "%s: Record changed: %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "updatedRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_200(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(v12 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_201;
  block[3] = &unk_24DBDF768;
  block[4] = v12;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_async(v14, block);

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_201(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    v11 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_2";
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed for recordZoneID: %@ changeToken:%@ error: %@", buf, 0x2Au);
  }
  v6 = *(void **)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_202;
  v7[3] = &unk_24DBDF740;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_202(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v10, "setChangeToken:", v9);

    *a3 = 1;
  }

}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_204(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v8[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3_205;
  v8[3] = &unk_24DBDF7B8;
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3_205(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed for all zones with error: %@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "processUpdatedRecordsInContainer:forAccessories:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)processUpdatedRecordsInContainer:(id)a3 forAccessories:(id)a4
{
  id v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  uint64_t v57;
  void *v58;
  UARPiCloudManager *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v52 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v8 = log;
    objc_msgSend(v6, "containerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
    v78 = 2112;
    v79 = v9;
    v80 = 2112;
    v81 = v10;
    _os_log_impl(&dword_219CF8000, v8, OS_LOG_TYPE_INFO, "%s: Updated Records in Container %@: %@", buf, 0x20u);

  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v6, "updatedRecords");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  v58 = v6;
  v59 = self;
  if (!v11)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_45;
  }
  v12 = v11;
  v13 = 0;
  v14 = 0;
  v57 = *(_QWORD *)v70;
  do
  {
    v15 = 0;
    v54 = v12;
    do
    {
      if (*(_QWORD *)v70 != v57)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v15);
      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
        v78 = 2112;
        v79 = v16;
        _os_log_impl(&dword_219CF8000, v17, OS_LOG_TYPE_INFO, "%s: Processing Record %@", buf, 0x16u);
      }
      objc_msgSend(v16, "recordType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("UARPAccessory")))
      {

      }
      else
      {
        objc_msgSend(v16, "recordType");
        v19 = v15;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("CHIPAccessoryFirmware"));

        v15 = v19;
        if (!v21)
        {
          v40 = self->_log;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = v40;
            objc_msgSend(v16, "recordType");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            v78 = 2112;
            v79 = v42;
            _os_log_impl(&dword_219CF8000, v41, OS_LOG_TYPE_INFO, "%s: Unexpected RecordType %@, discarding", buf, 0x16u);

          }
          goto LABEL_41;
        }
      }
      objc_msgSend(v16, "objectForKey:", CFSTR("recordStatus"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("1")) & 1) != 0)
      {
        v56 = v22;
        objc_msgSend(v16, "recordID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("-"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v60 = v16;
          objc_msgSend(v16, "recordID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "zoneID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "zoneName");
          v29 = objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v53 = v15;
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v30 = v52;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
            if (!v31)
              goto LABEL_27;
            v32 = v31;
            v33 = *(_QWORD *)v66;
            while (1)
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v66 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                objc_msgSend(v35, "productNumber");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v36, "isEqualToString:", v26))
                {
                  objc_msgSend(v35, "productGroup");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "isEqualToString:", v29);

                  if (!v38)
                    continue;
                  objc_msgSend(v35, "availableRecords");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "addObject:", v60);
                }

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
              if (!v32)
              {
LABEL_27:

                self = v59;
                v15 = v53;
                v12 = v54;
                goto LABEL_36;
              }
            }
          }
          v44 = self->_log;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            v78 = 2112;
            v79 = v60;
            _os_log_impl(&dword_219CF8000, v44, OS_LOG_TYPE_INFO, "%s: Unexpected format for zoneName for CKRecord %@, discarding", buf, 0x16u);
          }
          v29 = 0;
          v12 = v54;
        }
        else
        {
          v43 = self->_log;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            v78 = 2112;
            v79 = v16;
            _os_log_impl(&dword_219CF8000, v43, OS_LOG_TYPE_INFO, "%s: Unexpected format for RecordName for CKRecord %@, discarding", buf, 0x16u);
          }
          v26 = 0;
          v29 = (uint64_t)v13;
          v12 = v54;
LABEL_36:
          v22 = v56;
        }
      }
      else
      {
        v39 = self->_log;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
          v78 = 2112;
          v79 = v16;
          _os_log_impl(&dword_219CF8000, v39, OS_LOG_TYPE_DEFAULT, "%s: Discarding Inactive Record %@", buf, 0x16u);
        }
        v29 = (uint64_t)v13;
        v26 = (uint64_t)v14;
      }

      v13 = (void *)v29;
      v14 = (void *)v26;
LABEL_41:
      ++v15;
    }
    while (v15 != v12);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  }
  while (v12);
LABEL_45:

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v45 = v52;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v62 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        v51 = self->_log;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
          v78 = 2112;
          v79 = v50;
          _os_log_impl(&dword_219CF8000, v51, OS_LOG_TYPE_INFO, "%s: Processing accessory %@", buf, 0x16u);
        }
        self = v59;
        -[UARPiCloudManager processRecordsInContainer:forAccessory:](v59, "processRecordsInContainer:forAccessory:", v58, v50);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    }
    while (v47);
  }

}

- (void)processRecordsInContainer:(id)a3 forAccessory:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *log;
  NSObject *v31;
  void *v32;
  UARPiCloudManager *v33;
  id v34;
  id obj;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE buf[22];
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v6 = a4;
  objc_msgSend(v6, "availableRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    goto LABEL_5;
  objc_msgSend(v6, "availableRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 1)
  {

LABEL_7:
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "firmwareVersion", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = v6;
    objc_msgSend(v6, "availableRecords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v37 = 0;
      v13 = CFSTR("firmwareVersion");
      v19 = &unk_24DBE2CB8;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v38, "isCHIPContainer"))
          {
            v23 = v19;
            objc_msgSend(v22, "objectForKey:", CFSTR("firmwareVersionNumber"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", CFSTR("minFirmwareVersionNumber"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", CFSTR("maxFirmwareVersionNumber"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((!v25
               || (objc_msgSend(v25, "isEqualToNumber:", v24) & 1) != 0
               || objc_msgSend(v36, "compare:", v25) != -1)
              && (!v26
               || (objc_msgSend(v26, "isEqualToNumber:", v24) & 1) != 0
               || objc_msgSend(v36, "compare:", v26) != 1)
              && objc_msgSend(v24, "compare:", v36) == 1
              && objc_msgSend(v24, "compare:", v19) == 1)
            {
              v23 = v24;

              v27 = v22;
              v37 = v27;
            }

            v13 = CFSTR("firmwareVersionString");
            v19 = v23;
          }
          else
          {
            objc_msgSend(v22, "objectForKey:", v13);
            v28 = objc_claimAutoreleasedReturnValue();

            v39 = 0uLL;
            objc_msgSend(MEMORY[0x24BE28A10], "versionFromString:version:", v28, &v39);
            if (uarpVersionCompare(buf, &v39) == 1)
            {
              *(_OWORD *)buf = v39;
              v29 = v22;

              v37 = v29;
            }
            v18 = (void *)v28;
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
      v37 = 0;
      v13 = CFSTR("firmwareVersion");
      v19 = &unk_24DBE2CB8;
    }

    self = v33;
    v6 = v34;
    v12 = v37;
    if (!v37)
      goto LABEL_5;
    goto LABEL_31;
  }
  v10 = objc_msgSend(v38, "isCHIPContainer");

  if ((v10 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v6, "availableRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = CFSTR("firmwareVersion");
  if (!v12)
  {
LABEL_5:
    -[UARPiCloudManagerDelegate remoteFetchCompletion:error:](self->_delegate, "remoteFetchCompletion:error:", v6, 0);
    goto LABEL_34;
  }
LABEL_31:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v31 = log;
    objc_msgSend(v12, "objectForKey:", v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[UARPiCloudManager processRecordsInContainer:forAccessory:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v32;
    v45 = 2112;
    v46 = v6;
    _os_log_impl(&dword_219CF8000, v31, OS_LOG_TYPE_INFO, "%s: Greatest Firmware Version %@ available on iCloud for accessory: %@", buf, 0x20u);

  }
  -[UARPiCloudManager processCKRecord:inContainer:forAccessory:](self, "processCKRecord:inContainer:forAccessory:", v12, v38, v6);

LABEL_34:
}

- (void)processCKRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  UARPiCloudAccessoryRecord *v11;
  UARPiCloudAccessoryRecord *v12;
  void *v13;
  uint64_t v14;
  NSObject *log;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  _BYTE buf[22];
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isCHIPContainer"))
  {
    v11 = -[UARPiCloudAccessoryRecord initWithCKRecord:]([UARPiCloudAccessoryRecord alloc], "initWithCKRecord:", v8);
    v12 = v11;
    if (!v11)
      goto LABEL_19;
    -[UARPiCloudAccessoryRecord recordStatus](v11, "recordStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "compare:options:", CFSTR("1"), 1);

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v16 = log;
      -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPiCloudAccessoryRecord recordStatus](v12, "recordStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      v38 = 2112;
      v39 = v18;
      _os_log_impl(&dword_219CF8000, v16, OS_LOG_TYPE_INFO, "%s: Record %@ Active Status: %@", buf, 0x20u);

    }
    if (v14)
      goto LABEL_19;
    objc_msgSend(v10, "firmwareVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = v20;
        -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPiCloudAccessoryRecord firmwareVersion](v12, "firmwareVersion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firmwareVersion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        v38 = 2112;
        v39 = v23;
        v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_219CF8000, v21, OS_LOG_TYPE_INFO, "%s: Comparing Record %@ Firmware Version %@ with %@ on accessory", buf, 0x2Au);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      v25 = (void *)MEMORY[0x24BE28A10];
      objc_msgSend(v10, "firmwareVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "versionFromString:version:", v26, buf);

      v27 = (void *)MEMORY[0x24BE28A10];
      -[UARPiCloudAccessoryRecord firmwareVersion](v12, "firmwareVersion", 0, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "versionFromString:version:", v28, &v36);

      if (uarpVersionCompare(buf, &v36) != 1)
        goto LABEL_19;
    }
    v29 = objc_msgSend(v10, "signatureValidationNeeded");
    v30 = self->_log;
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        v32 = v30;
        -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v33;
        _os_log_impl(&dword_219CF8000, v32, OS_LOG_TYPE_INFO, "%s: Validating signature on Record %@", buf, 0x16u);

      }
      if (!-[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:](self, "validateSignatureForUARPAccessoryRecord:inContainer:", v12, v9))goto LABEL_19;
    }
    else if (v31)
    {
      v34 = v30;
      -[UARPiCloudAccessoryRecord recordName](v12, "recordName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      _os_log_impl(&dword_219CF8000, v34, OS_LOG_TYPE_INFO, "%s: Bypassing signature validation on Record %@", buf, 0x16u);

    }
    objc_msgSend(v10, "setRecord:", v12);
LABEL_19:
    -[UARPiCloudManagerDelegate remoteFetchCompletion:error:](self->_delegate, "remoteFetchCompletion:error:", v10, 0);

    goto LABEL_20;
  }
  -[UARPiCloudManager processCHIPFirmwareRecord:inContainer:forAccessory:](self, "processCHIPFirmwareRecord:inContainer:forAccessory:", v8, v9, v10);
LABEL_20:

}

- (void)processVerificationCertificateRecord:(id)a3 forContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *log;
  __SecKey *v12;
  const void *AppleAccessoryUpdateSigning;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("certificate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "assetContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    if (!v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.3(log, v9);
      v12 = 0;
      AppleAccessoryUpdateSigning = 0;
      goto LABEL_15;
    }
    AppleAccessoryUpdateSigning = (const void *)SecPolicyCreateAppleAccessoryUpdateSigning();
    if (!AppleAccessoryUpdateSigning)
    {
      v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
      v12 = 0;
      goto LABEL_14;
    }
    v12 = -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:](self, "copyPublicKeyForVerificationCertificateData:policy:", v10, AppleAccessoryUpdateSigning);
    if (v12)
    {
LABEL_14:
      objc_msgSend(v7, "setVerificationCertificate:", v10, v6);
LABEL_15:
      objc_msgSend(v7, "setPublicKey:", v12, v35);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v24 = objc_msgSend(v22, "removeItemAtURL:error:", v23, &v37);
      v25 = v37;

      if ((v24 & 1) == 0)
      {
        v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.2(v26, v9, (uint64_t)v25);
      }

      if (AppleAccessoryUpdateSigning)
        CFRelease(AppleAccessoryUpdateSigning);
      v6 = v36;
      if (v12)
        CFRelease(v12);
      goto LABEL_22;
    }
    v27 = self->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.5(v27, v28, v29, v30, v31, v32, v33, v34);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.1();
    objc_msgSend(v7, "setPublicKey:", 0);
    v10 = 0;
  }
LABEL_22:

}

- (__SecKey)copyPublicKeyForVerificationCertificateData:(id)a3 policy:(__SecPolicy *)a4
{
  id v5;
  NSObject *log;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const __CFData *v15;
  SecCertificateRef v16;
  OSStatus v17;
  _BOOL4 v18;
  NSObject *v19;
  __SecCertificate *CertificateAtIndex;
  __SecKey *v21;
  NSObject *v22;
  void *v24;
  CFErrorRef error;
  SecTrustRef trust;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  _BOOL4 v33;
  __int16 v34;
  CFErrorRef v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[UARPiCloudContainer requiresPrefForSigningBeta](self->_container, "requiresPrefForSigningBeta"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "Setting Security Pref AllowAccessoryUpdateSigningBeta", buf, 2u);
    }
    CFPreferencesSetAppValue(CFSTR("AllowAccessoryUpdateSigningBeta"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.security"));
  }
  v24 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0);
        v16 = SecCertificateCreateWithData(0, v15);
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

  trust = 0;
  v17 = SecTrustCreateWithCertificates(v9, a4, &trust);
  if (trust)
  {
    error = 0;
    v18 = SecTrustEvaluateWithError(trust, &error);
    v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v33 = v18;
      v34 = 2112;
      v35 = error;
      _os_log_impl(&dword_219CF8000, v19, OS_LOG_TYPE_DEFAULT, "Certificate is trusted: %d trustErrorRef %@", buf, 0x12u);
    }
    CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, 0);
    v21 = SecCertificateCopyKey(CertificateAtIndex);
    CFRelease(trust);
  }
  else
  {
    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:].cold.1(v17, v22);
    v21 = 0;
  }

  return v21;
}

- (id)filterInterestedZonesInContainer:(id)a3 forAccessories:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v28 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v5;
  objc_msgSend(v5, "updatedZones");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    v27 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      v29 = v8;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_msgSend(v11, "zoneID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "zoneName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("certificates"));

        if (v14)
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          v31 = v10;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v15 = v28;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v11, "zoneID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "zoneName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "productGroup");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v22, "isEqualToString:", v23);

                if (v24)
                  objc_msgSend(v6, "addObject:", v11);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v17);
          }

          v9 = v27;
          v8 = v29;
          v10 = v31;
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }

  return v6;
}

- (BOOL)validateSignatureForUARPAccessoryRecord:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  const __CFData *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __SecKey *v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  NSObject *log;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFErrorRef error;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  CFErrorRef v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  error = 0;
  objc_msgSend(v7, "publicKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:].cold.1(log, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_18;
  }
  -[UARPiCloudManager calculateDigestFromUARPAccessoryRecord:](self, "calculateDigestFromUARPAccessoryRecord:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v32 = self->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_18;
  }
  v10 = (void *)v9;
  v11 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v6, "signature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (const __CFData *)objc_msgSend(v11, "initWithBase64EncodedString:options:", v12, 0);

  v14 = self->_log;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:].cold.3(v14, v40, v41, v42, v43, v44, v45, v46);

LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v6, "recordName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v16;
    _os_log_impl(&dword_219CF8000, v15, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);

  }
  objc_msgSend(v7, "publicKey");
  v17 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  v18 = SecKeyVerifySignature(v17, (SecKeyAlgorithm)*MEMORY[0x24BDE9298], (CFDataRef)v10, v13, &error);
  v19 = v18 != 0;

  v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    objc_msgSend(v6, "recordName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("INVALID");
    *(_DWORD *)buf = 138412802;
    v50 = v22;
    if (v18)
      v23 = CFSTR("VALID");
    v51 = 2112;
    v52 = v23;
    v53 = 2112;
    v54 = error;
    _os_log_impl(&dword_219CF8000, v21, OS_LOG_TYPE_DEFAULT, "Signature on Record %@: %@ error: %@", buf, 0x20u);

  }
LABEL_19:

  return v19;
}

- (id)calculateDigestFromUARPAccessoryRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CC_SHA256_CTX c;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(v3, "firmwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(v3, "firmwareURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  objc_msgSend(v3, "releaseType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "releaseType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  objc_msgSend(v3, "updateClassification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "updateClassification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  objc_msgSend(v3, "deploymentList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v3, "deploymentStr");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

  }
  objc_msgSend(v3, "releaseNotesURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  objc_msgSend(v3, "firmwareBinaryHash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v17);

  objc_msgSend(v3, "releaseNotesHash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v18);

  objc_msgSend(v3, "recordStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v19);

  objc_msgSend(v3, "releaseDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v20);

  objc_msgSend(v3, "firmwareFileSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v21);

  objc_msgSend(v3, "releaseNotesFileSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v22);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v4;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v27), "dataUsingEncoding:", 4, (_QWORD)v32);
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CC_SHA256_Update(&c, (const void *)objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"));

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
    CC_SHA256_Final((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v29), "mutableBytes"), &c);

  return v30;
}

- (BOOL)fetchVerificationCertificateInContainer:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *log;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  NSObject *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  const char *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isCHIPContainer"))
  {
    -[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync](self, "performRemoteFetchForCHIPVerificationCertificateSync");
  }
  else
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__0;
    v24[4] = __Block_byref_object_dispose__0;
    v25 = 0;
    v5 = dispatch_semaphore_create(0);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_INFO, "Fetching Verification Certificate", buf, 2u);
    }
    v7 = objc_alloc(MEMORY[0x24BDB9200]);
    v8 = (void *)objc_msgSend(v7, "initWithZoneName:ownerName:", CFSTR("certificates"), *MEMORY[0x24BDB8E80]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E0]), "initWithRecordName:zoneID:", CFSTR("certificates"), v8);
    v10 = objc_alloc(MEMORY[0x24BDB90F0]);
    v28[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithRecordIDs:", v11);

    objc_msgSend(v12, "setShouldFetchAssetContentInMemory:", 1);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __61__UARPiCloudManager_fetchVerificationCertificateInContainer___block_invoke;
    v19[3] = &unk_24DBDF808;
    v19[4] = self;
    v23 = v24;
    v13 = v9;
    v20 = v13;
    v14 = v4;
    v21 = v14;
    v15 = v5;
    v22 = v15;
    objc_msgSend(v12, "setFetchRecordsCompletionBlock:", v19);
    objc_msgSend(v14, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v12);

    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[UARPiCloudManager fetchVerificationCertificateInContainer:]";
      _os_log_impl(&dword_219CF8000, v17, OS_LOG_TYPE_INFO, "%s: Waiting on the fetch record completion block to be finished", buf, 0xCu);
    }
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v24, 8);
  }

  return 1;
}

void __61__UARPiCloudManager_fetchVerificationCertificateInContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "-[UARPiCloudManager fetchVerificationCertificateInContainer:]_block_invoke";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_219CF8000, v7, OS_LOG_TYPE_INFO, "%s: operationError = %@, recordsByRecordID: %@", (uint8_t *)&v11, 0x20u);
  }
  if (v5 && !v6)
  {
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 32), "processVerificationCertificateRecord:forContainer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (void)performRemoteFetchForSupportedAccessoriesMetadataInZone:(id)a3
{
  NSObject *log;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[UARPiCloudManager performRemoteFetchForSupportedAccessoriesMetadataInZone:]";
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "%s: Deprecated", (uint8_t *)&v4, 0xCu);
  }
}

- (void)performRemoteFetchForSupportedAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *log;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  dispatch_time_t v14;
  NSObject *recordProcessingQueue;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  _BYTE *v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  dispatch_time_t v27;
  _BYTE buf[24];
  const char *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    *(_QWORD *)&buf[4] = "-[UARPiCloudManager performRemoteFetchForSupportedAccessoriesMetadata:batchRequest:]";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v8 = "YES";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2080;
    v29 = v8;
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "%s: productGroup:%@ batchRequest:%s", buf, 0x20u);
  }
  -[UARPiCloudContainer containerID](self->_container, "containerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.chip")))
  {

  }
  else
  {
    -[UARPiCloudContainer containerID](self->_container, "containerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.chip.staging"));

    if (!v11)
      goto LABEL_11;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v29) = 1;
  v12 = dispatch_semaphore_create(0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v27 = dispatch_time(0, 0);
  v13 = MEMORY[0x24BDAC760];
  do
  {
    v14 = v25[3];
    recordProcessingQueue = self->_recordProcessingQueue;
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __84__UARPiCloudManager_performRemoteFetchForSupportedAccessoriesMetadata_batchRequest___block_invoke;
    v18[3] = &unk_24DBDF830;
    v21 = buf;
    v18[4] = self;
    v16 = v6;
    v23 = v4;
    v19 = v16;
    v22 = &v24;
    v17 = v12;
    v20 = v17;
    dispatch_after(v14, recordProcessingQueue, v18);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  }
  while (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24));
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(buf, 8);
LABEL_11:

}

intptr_t __84__UARPiCloudManager_performRemoteFetchForSupportedAccessoriesMetadata_batchRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "handleRemoteFetchRequestForCHIPAccessoriesMetadata:batchRequest:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(a1 + 72) && !*(_BYTE *)(v2 + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = dispatch_time(0, 1000000000);
  else
    *(_BYTE *)(v2 + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)performRemoteFetchForAttestationCertificates:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *recordProcessingQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[UARPiCloudManager performRemoteFetchForAttestationCertificates:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "%s: subjectKeyIdentifier:%@", buf, 0x16u);
  }
  recordProcessingQueue = self->_recordProcessingQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__UARPiCloudManager_performRemoteFetchForAttestationCertificates___block_invoke;
  v8[3] = &unk_24DBDF5D8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(recordProcessingQueue, v8);

}

void __66__UARPiCloudManager_performRemoteFetchForAttestationCertificates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.chip")))
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containerID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.chip.staging"));

    if (!v4)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "handleRemoteFetchRequestForCHIPAttestationCertificates:", *(_QWORD *)(a1 + 40));
}

- (UARPiCloudContainer)container
{
  return (UARPiCloudContainer *)objc_getProperty(self, a2, 24, 1);
}

- (UARPiCloudManagerDelegate)delegate
{
  return (UARPiCloudManagerDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_pendingiCloudAccessoryRequests, 0);
  objc_storeStrong((id *)&self->_recordProcessingQueue, 0);
}

- (void)qHandleRemoteFetchRequestForAccessories:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_219CF8000, a2, a3, "%s: failed to fetch verification certificate for container: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)processVerificationCertificateRecord:forContainer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_219CF8000, v0, v1, "%s: Failed to retrieve CKAsset from %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:.cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  int v9[5];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 136315650;
  OUTLINED_FUNCTION_4();
  v10 = v7;
  v11 = a3;
  OUTLINED_FUNCTION_4_2(&dword_219CF8000, v5, v8, "%s: Failed to delete asset at URL %@ withError %@", (uint8_t *)v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)processVerificationCertificateRecord:(void *)a1 forContainer:(void *)a2 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "assetContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "assetTransferOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[UARPiCloudManager processVerificationCertificateRecord:forContainer:]";
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  OUTLINED_FUNCTION_4_2(&dword_219CF8000, v3, v6, "%s: Failed to retrieve verification/certificate data from %@, %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_219CF8000, a1, a3, "%s: Failed to create a policy", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_219CF8000, a1, a3, "%s: Failed to get a publicKey", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)copyPublicKeyForVerificationCertificateData:(int)a1 policy:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_219CF8000, a2, OS_LOG_TYPE_ERROR, "Failed to create trust for certificate, status:0x%x", (uint8_t *)v2, 8u);
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_219CF8000, a1, a3, "%s: Public Key is empty for signature validaction.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_219CF8000, a1, a3, "%s: Failed to get digest data.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_219CF8000, a1, a3, "%s: Failed to get signature data.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
