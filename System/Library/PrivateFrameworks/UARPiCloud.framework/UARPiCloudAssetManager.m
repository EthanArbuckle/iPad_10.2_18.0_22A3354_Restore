@implementation UARPiCloudAssetManager

- (UARPiCloudAssetManager)initWithManager:(id)a3
{
  id v5;
  UARPiCloudAssetManager *v6;
  os_log_t v7;
  OS_os_log *log;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *delegateQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *batchedProcessingQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UARPiCloudAssetManager;
  v6 = -[UARPiCloudAssetManager init](&v16, sel_init);
  if (v6)
  {
    v7 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_assetManager, a3);
    v9 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager.queue", 0);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager.batched", 0);
    batchedProcessingQueue = v6->_batchedProcessingQueue;
    v6->_batchedProcessingQueue = (OS_dispatch_queue *)v13;

  }
  return v6;
}

- (void)cleanupAssetCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t j;
  void *v24;
  NSObject *log;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  InternalStorageDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UARPArrayOfExpiredFiles(v4, 0, 2592000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (void *)MEMORY[0x24BDD1798];
  InternalStorageDirectoryPath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "escapedPatternForString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("^%@\\S+\\/\\S+\\/(%@|%@)\\/.+$"), v9, *MEMORY[0x24BE28A40], *MEMORY[0x24BE28A48]);
  v10 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v10, 1, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  obj = v11;
  if (!v12)
  {
LABEL_14:

    goto LABEL_15;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v48 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_msgSend(v17, "pathExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(CFSTR("urlasset"), "isEqualToString:", v18);

      if ((v19 & 1) != 0)
      {
        v20 = v14;
      }
      else
      {
        v20 = 1;
        if (objc_msgSend(v38, "rangeOfFirstMatchInString:options:range:", v17, 1, 0, objc_msgSend(v17, "length")) == 0x7FFFFFFFFFFFFFFFLL)
          continue;
      }
      objc_msgSend(v3, "addObject:", v17);
      v14 = v20;
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  }
  while (v13);

  if ((v14 & 1) != 0)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    InternalStorageDirectoryPath();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@%@"), v22, CFSTR("icloudTokens.plist"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v11);
    goto LABEL_14;
  }
LABEL_15:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = v3;
  v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(v39);
        v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v24;
          _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "Deleting iCloud Cache file:%@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeItemAtPath:error:", v24, 0);

        objc_msgSend(v24, "stringByDeletingLastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        InternalStorageDirectoryPath();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        if ((v29 & 1) == 0)
        {
          while (1)
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "contentsOfDirectoryAtPath:error:", v27, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v31, "count"))
              break;
            v32 = self->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v27;
              _os_log_impl(&dword_219CF8000, v32, OS_LOG_TYPE_DEFAULT, "Deleting iCloud Cache directory:%@", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "removeItemAtPath:error:", v27, 0);

            objc_msgSend(v27, "stringByDeletingLastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            InternalStorageDirectoryPath();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqualToString:", v35);

            v27 = v34;
            if (v36)
              goto LABEL_30;
          }

        }
        v34 = v27;
LABEL_30:

      }
      v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v42);
  }

}

- (int64_t)performRemoteUpdateCheckForAccessories:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__UARPiCloudAssetManager_performRemoteUpdateCheckForAccessories_inContainer___block_invoke;
  v13[3] = &unk_24DBDF538;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(workQueue, v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __77__UARPiCloudAssetManager_performRemoteUpdateCheckForAccessories_inContainer___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "handleRemoteQueryRequestForAccessories:inContainer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (int64_t)downloadFirmwareForAccessory:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__UARPiCloudAssetManager_downloadFirmwareForAccessory___block_invoke;
  block[3] = &unk_24DBDF560;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __55__UARPiCloudAssetManager_downloadFirmwareForAccessory___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "handleRemoteFirmwareDownloadRequestForAccessory:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)downloadReleaseNotesForAccessory:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__UARPiCloudAssetManager_downloadReleaseNotesForAccessory___block_invoke;
  block[3] = &unk_24DBDF560;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__UARPiCloudAssetManager_downloadReleaseNotesForAccessory___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "handleReleaseNotesDownloadRequestForAccessory:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)getSupportedAccessories:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__UARPiCloudAssetManager_getSupportedAccessories_batchRequest_inContainer___block_invoke;
  v14[3] = &unk_24DBDF588;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(workQueue, v14);

  return 0;
}

uint64_t __75__UARPiCloudAssetManager_getSupportedAccessories_batchRequest_inContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:batchRequest:inContainer:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (int64_t)handleRemoteQueryRequestForAccessories:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *log;
  UARPiCloudManager *v10;
  id cloudManager;
  NSMutableDictionary *v12;
  NSMutableDictionary *accessories;
  NSObject *v14;
  NSMutableDictionary *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  UARPiCloudAccessory *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UARPiCloudAccessory *v34;
  void *v35;
  NSObject *v36;
  NSMutableDictionary *v37;
  int64_t v38;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE buf[22];
  __int16 v52;
  NSMutableDictionary *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "Performing Remote Check on iCloud ContainerID:%@ for accessories: %@", buf, 0x16u);
  }
  v10 = -[UARPiCloudManager initWithDelegate:containerID:]([UARPiCloudManager alloc], "initWithDelegate:containerID:", self, v7);
  cloudManager = self->_cloudManager;
  self->_cloudManager = v10;

  if (self->_cloudManager)
  {
    if (!self->_accessories)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      accessories = self->_accessories;
      self->_accessories = v12;

    }
    v40 = v7;
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_accessories;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[UARPiCloudAssetManager handleRemoteQueryRequestForAccessories:inContainer:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_219CF8000, v14, OS_LOG_TYPE_DEFAULT, "%s: Current _accessories %@", buf, 0x16u);
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v41 = v6;
    obj = v6;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v45)
    {
      v43 = *(_QWORD *)v48;
      v44 = v8;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v48 != v43)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v17, "accessoryID", v40);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firmwareVersion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "accessoryID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stagedFirmwareVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "assetID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "type") == 15)
          {

LABEL_16:
            if (v21 && (objc_msgSend(v21, "isEqualToString:", v19) & 1) == 0)
              goto LABEL_21;
            goto LABEL_22;
          }
          objc_msgSend(v17, "assetID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "type");

          if (v24 == 16)
            goto LABEL_16;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          v25 = (void *)MEMORY[0x24BE28A10];
          objc_msgSend(v17, "accessoryID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firmwareVersion");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "versionFromString:version:", v27, buf);

          if (v21)
          {
            v46[0] = 0;
            v46[1] = 0;
            objc_msgSend(MEMORY[0x24BE28A10], "versionFromString:version:", v21, v46);
            if (uarpVersionCompare(buf, v46) == 1)
            {
LABEL_21:
              v28 = v21;

              v19 = v28;
            }
          }
LABEL_22:
          v29 = [UARPiCloudAccessory alloc];
          objc_msgSend(v17, "accessoryID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "productGroup");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "accessoryID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "productNumber");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[UARPiCloudAccessory initWithProductGroup:productNumber:firmwareVersion:](v29, "initWithProductGroup:productNumber:firmwareVersion:", v31, v33, v19);

          objc_msgSend(v17, "assetID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPiCloudAccessory setSignatureValidationNeeded:](v34, "setSignatureValidationNeeded:", objc_msgSend(v35, "signatureValidationNeeded"));

          v8 = v44;
          objc_msgSend(v44, "addObject:", v34);
          -[NSMutableDictionary setObject:forKey:](self->_accessories, "setObject:forKey:", v17, v34);
          v36 = self->_log;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = self->_accessories;
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[UARPiCloudAssetManager handleRemoteQueryRequestForAccessories:inContainer:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v17;
            v52 = 2112;
            v53 = v37;
            _os_log_impl(&dword_219CF8000, v36, OS_LOG_TYPE_DEFAULT, "%s: Added internalAccessory %@ to _accessories %@", buf, 0x20u);
          }

        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v45);
    }

    objc_msgSend(self->_cloudManager, "performRemoteFetchForAccessories:", v8);
    v38 = 0;
    v7 = v40;
    v6 = v41;
  }
  else
  {
    v38 = 2;
  }

  return v38;
}

- (int64_t)getAttestationCertificates:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UARPiCloudAssetManager_getAttestationCertificates_inContainer___block_invoke;
  block[3] = &unk_24DBDF5B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(workQueue, block);

  return 0;
}

uint64_t __65__UARPiCloudAssetManager_getAttestationCertificates_inContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:inContainer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)remoteFetchCompletion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UARPiCloudAssetManager_remoteFetchCompletion_error___block_invoke;
  block[3] = &unk_24DBDF5B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

uint64_t __54__UARPiCloudAssetManager_remoteFetchCompletion_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRemoteFetchCompletion:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)handleRemoteFetchCompletion:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  NSObject *log;
  NSMutableDictionary *accessories;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSMutableDictionary *v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  NSObject *v50;
  void *v51;
  char *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  _BOOL4 v97;
  char *v98;
  NSMutableDictionary *v99;
  char *v100;
  NSObject *v101;
  _BOOL4 v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  NSObject *v110;
  NSMutableDictionary *v111;
  void *v112;
  void *v113;
  void *v114;
  NSObject *v115;
  _QWORD v116[5];
  NSMutableDictionary *v117;
  id v118;
  id v119;
  id v120;
  _QWORD v121[5];
  NSMutableDictionary *v122;
  _QWORD block[5];
  NSMutableDictionary *v124;
  uint8_t buf[4];
  const char *v126;
  __int16 v127;
  NSMutableDictionary *v128;
  __int16 v129;
  NSMutableDictionary *v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v6, "setNumberStyle:", 1);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessories, "objectForKeyedSubscript:", v5);
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    accessories = self->_accessories;
    *(_DWORD *)buf = 136315650;
    v126 = "-[UARPiCloudAssetManager handleRemoteFetchCompletion:error:]";
    v127 = 2112;
    v128 = v7;
    v129 = 2112;
    v130 = accessories;
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "%s: Found internalAccessory %@, from _accessories %@", buf, 0x20u);
  }
  if (v7)
  {
    objc_msgSend(v5, "chipFirmwareRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        objc_msgSend(v5, "chipFirmwareRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firmwareURL");
        v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v126 = v14;
        v127 = 2112;
        v128 = v7;
        _os_log_impl(&dword_219CF8000, v12, OS_LOG_TYPE_DEFAULT, "Found an update on %@ from iCloud for accessory %@", buf, 0x16u);

      }
      objc_msgSend(v5, "chipFirmwareRecord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setRecord:](v7, "setRecord:", v15);

      objc_msgSend(v5, "chipFirmwareRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firmwareVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAssetVersion:", v17);

      objc_msgSend(v5, "chipFirmwareRecord");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firmwareVersionNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAssetVersionNumber:", v20);

      v22 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v5, "chipFirmwareRecord");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firmwareURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLWithString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setRemoteURL:", v25);

      -[NSMutableDictionary assetID](v7, "assetID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDownloadStatus:", 0);

      -[NSMutableDictionary assetID](v7, "assetID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setUpdateAvailabilityStatus:", 1);

      v29 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v5, "chipFirmwareRecord");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "releaseNotesURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URLWithString:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setReleaseNotesRemoteURL:", v32);

      -[NSMutableDictionary assetID](v7, "assetID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setReleaseNotesDownloadStatus:", 0);

      -[NSMutableDictionary assetID](v7, "assetID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setReleaseNotesAvailabilityStatus:", 1);

      objc_msgSend(v5, "chipFirmwareRecord");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firmwareFileSize");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberFromString:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFirmwareFileSize:", v38);

      objc_msgSend(v5, "chipFirmwareRecord");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "releaseDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setAssetReleaseDate:", v41);

      -[NSMutableDictionary assetID](v7, "assetID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadAvailableForAssetID:](v7, "analyticsSetDownloadAvailableForAssetID:", v43);

      -[NSMutableDictionary assetID](v7, "assetID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadConsentRequestedForAssetID:](v7, "analyticsSetDownloadConsentRequestedForAssetID:", v44);

      -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
      v45 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke;
      block[3] = &unk_24DBDF5D8;
      block[4] = self;
      v124 = v7;
      dispatch_async(v45, block);

      v46 = v124;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v5, "record");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = self->_log;
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if (v47)
    {
      if (v49)
      {
        v50 = v48;
        objc_msgSend(v5, "record");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "firmwareURL");
        v52 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v126 = v52;
        v127 = 2112;
        v128 = v7;
        _os_log_impl(&dword_219CF8000, v50, OS_LOG_TYPE_DEFAULT, "Found an update on %@ from iCloud for accessory %@", buf, 0x16u);

      }
      objc_msgSend(v5, "record");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "deploymentList");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        -[NSMutableDictionary assetID](v7, "assetID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "record");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "deploymentList");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "processUARPDeploymentRules:", v57);

      }
      objc_msgSend(v5, "record");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "releaseDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v60 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v60, "setDateFormat:", CFSTR("MM/dd/yyyy"));
        objc_msgSend(v5, "record");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "releaseDate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "dateFromString:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary assetID](v7, "assetID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setAssetReleaseDate:", v63);

      }
      -[NSMutableDictionary assetID](v7, "assetID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "signatureValidationNeeded");

      -[NSMutableDictionary assetID](v7, "assetID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setValidationStatus:", v66);

      objc_msgSend(v5, "record");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setRecord:](v7, "setRecord:", v68);

      objc_msgSend(v5, "record");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "firmwareVersion");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setAssetVersion:", v70);

      v72 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v5, "record");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "firmwareURL");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "URLWithString:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setRemoteURL:", v75);

      -[NSMutableDictionary assetID](v7, "assetID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setDownloadStatus:", 0);

      -[NSMutableDictionary assetID](v7, "assetID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setUpdateAvailabilityStatus:", 1);

      v79 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v5, "record");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "releaseNotesURL");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "URLWithString:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setReleaseNotesRemoteURL:", v82);

      -[NSMutableDictionary assetID](v7, "assetID");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setReleaseNotesDownloadStatus:", 0);

      -[NSMutableDictionary assetID](v7, "assetID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setReleaseNotesAvailabilityStatus:", 1);

      objc_msgSend(v5, "record");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "releaseNotesFileSize");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberFromString:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setReleaseNotesFileSize:", v88);

      objc_msgSend(v5, "record");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "firmwareFileSize");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberFromString:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary assetID](v7, "assetID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setFirmwareFileSize:", v92);

      -[NSMutableDictionary assetID](v7, "assetID");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadAvailableForAssetID:](v7, "analyticsSetDownloadAvailableForAssetID:", v94);

      -[NSMutableDictionary assetID](v7, "assetID");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadConsentRequestedForAssetID:](v7, "analyticsSetDownloadConsentRequestedForAssetID:", v95);

      -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
      v96 = objc_claimAutoreleasedReturnValue();
      v121[0] = MEMORY[0x24BDAC760];
      v121[1] = 3221225472;
      v121[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_201;
      v121[3] = &unk_24DBDF5D8;
      v121[4] = self;
      v122 = v7;
      dispatch_async(v96, v121);

      v46 = v122;
      goto LABEL_16;
    }
    if (v49)
    {
      *(_DWORD *)buf = 138412290;
      v126 = (const char *)v7;
      _os_log_impl(&dword_219CF8000, v48, OS_LOG_TYPE_DEFAULT, "No new update found on iCloud since last check for %@, checking in local UARP cache ", buf, 0xCu);
    }
    v119 = 0;
    v120 = 0;
    v118 = 0;
    v97 = -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:](self, "checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:", v7, &v120, &v119, &v118);
    v98 = (char *)v120;
    v99 = (NSMutableDictionary *)v119;
    v100 = (char *)v118;
    v101 = self->_log;
    v102 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
    if (v97 && v98 && v99)
    {
      if (v102)
      {
        *(_DWORD *)buf = 138412802;
        v126 = v98;
        v127 = 2112;
        v128 = v99;
        v129 = 2112;
        v130 = v7;
        _os_log_impl(&dword_219CF8000, v101, OS_LOG_TYPE_DEFAULT, "Found update %@ in local UARP cache %@ path for accessory %@", buf, 0x20u);
      }
      -[NSMutableDictionary assetID](v7, "assetID");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary analyticsSetDownloadCompleteForAssetID:status:](v7, "analyticsSetDownloadCompleteForAssetID:status:", v103, 2);

      -[NSMutableDictionary assetID](v7, "assetID");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setAssetVersion:", v98);

      -[NSMutableDictionary assetID](v7, "assetID");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setRemoteURL:", v99);

      -[NSMutableDictionary assetID](v7, "assetID");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setLocalURL:", v99);

      -[NSMutableDictionary assetID](v7, "assetID");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setDownloadStatus:", 1);

      -[NSMutableDictionary assetID](v7, "assetID");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setUpdateAvailabilityStatus:", 3);

      if (v100)
      {
        v109 = self->_log;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          v110 = v109;
          -[NSMutableDictionary accessoryID](v7, "accessoryID");
          v111 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v126 = v100;
          v127 = 2112;
          v128 = v111;
          _os_log_impl(&dword_219CF8000, v110, OS_LOG_TYPE_DEFAULT, "Found releaseNotes in local UARP cache %@ path for accessory %@", buf, 0x16u);

        }
        -[NSMutableDictionary assetID](v7, "assetID");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setReleaseNotesLocalURL:", v100);

        -[NSMutableDictionary assetID](v7, "assetID");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setReleaseNotesDownloadStatus:", 1);

        -[NSMutableDictionary assetID](v7, "assetID");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setReleaseNotesAvailabilityStatus:", 3);

      }
      -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
      v115 = objc_claimAutoreleasedReturnValue();
      v116[0] = MEMORY[0x24BDAC760];
      v116[1] = 3221225472;
      v116[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_202;
      v116[3] = &unk_24DBDF5D8;
      v116[4] = self;
      v117 = v7;
      dispatch_async(v115, v116);

    }
    else if (v102)
    {
      *(_DWORD *)buf = 138412290;
      v126 = (const char *)v7;
      _os_log_impl(&dword_219CF8000, v101, OS_LOG_TYPE_DEFAULT, "No new update found in local UARP cache for accessory: %@", buf, 0xCu);
    }

  }
LABEL_17:

}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_DEFAULT, "Updated internalAccessory.assetID state, notifying client for accessory %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v5, v6, 0);

}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_DEFAULT, "Updated internalAccessory.assetID state, notifying client for accessory %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v5, v6, 0);

}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_202(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_DEFAULT, "Updated internalAccessory.assetID state, notifying client for accessory %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v5, v6, 0);

}

- (BOOL)moveFileAtURL:(id)a3 toTempURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *log;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = 0;
  if (objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v9, "removeItemAtURL:error:", v7, &v16);
    v8 = v16;

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v11 = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v6, v7, &v15);
  v12 = v15;

  if ((v11 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_219CF8000, log, OS_LOG_TYPE_ERROR, "Failed to moved file from %@ to temporary location %@ for validation: %@", buf, 0x20u);
    }
  }

  return v11;
}

- (int64_t)handleRemoteFirmwareDownloadRequestForAccessory:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    objc_msgSend(v4, "assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_219CF8000, v6, OS_LOG_TYPE_INFO, "Downloading asset from remote url %@ for accessory %@", buf, 0x16u);

  }
  objc_msgSend(v4, "assetID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke;
  v17[3] = &unk_24DBDF600;
  v17[4] = self;
  v18 = v4;
  v19 = v11;
  v13 = v11;
  v14 = v4;
  objc_msgSend(v12, "downloadTaskWithURL:completionHandler:", v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "resume");
  return 0;
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  _QWORD *v24;
  NSObject *v25;
  id *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  NSObject *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *((_QWORD *)a1[4] + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = a1[5];
    v12 = v10;
    objc_msgSend(v11, "assetID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "accessoryID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v14;
    v44 = 2112;
    v45 = v15;
    v46 = 2112;
    v47 = v7;
    _os_log_impl(&dword_219CF8000, v12, OS_LOG_TYPE_INFO, "Download result: %@ error:%@ from remote url %@ for accessory %@ %@", buf, 0x34u);

  }
  if (!v7 || v9)
  {
    objc_msgSend(a1[4], "setFirmwareDownloadFailureStatusForAccessory:", a1[5]);
    objc_msgSend(a1[4], "delegateQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_204;
    v36[3] = &unk_24DBDF5D8;
    v29 = a1[5];
    v36[4] = a1[4];
    v37 = v29;
    dispatch_async(v28, v36);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    InternalStorageDirectoryPath();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@.%@"), v17, v18, CFSTR("urlasset"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCF48];
    v21 = objc_retainAutorelease(v19);
    objc_msgSend(v20, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(v21, "UTF8String"), 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(a1[4], "moveFileAtURL:toTempURL:", v7, v22);
    v24 = a1[4];
    if ((v23 & 1) != 0)
    {
      v25 = v24[5];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_3;
      block[3] = &unk_24DBDF5B0;
      block[4] = v24;
      v26 = &v32;
      v32 = v22;
      v33 = a1[5];
      dispatch_sync(v25, block);
      v27 = v33;
    }
    else
    {
      objc_msgSend(v24, "setFirmwareDownloadFailureStatusForAccessory:", a1[5]);
      objc_msgSend(a1[4], "delegateQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_2;
      v34[3] = &unk_24DBDF5D8;
      v30 = a1[5];
      v34[4] = a1[4];
      v26 = &v35;
      v35 = v30;
      dispatch_async(v27, v34);
    }

  }
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_204(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v4, v3, 0);

}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v4, v3, 0);

}

uint64_t __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleFirmwareDownloadResponseFromLocation:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)isFirmwareHash:(id)a3 equalToHash:(id)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return objc_msgSend(a4, "caseInsensitiveCompare:") == 0;
  }
  return result;
}

- (void)handleFirmwareDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *log;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "assetID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "signatureValidationNeeded");

  if (v9)
  {
    objc_msgSend(v7, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v7, "record");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "record");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hashAlgorithmType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedLongValue");

      }
      else
      {
        v16 = 1;
      }
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v21 = log;
        objc_msgSend(v7, "record");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v45 = "-[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:]";
        v46 = 2112;
        v47 = v7;
        v48 = 2112;
        v49 = v22;
        _os_log_impl(&dword_219CF8000, v21, OS_LOG_TYPE_DEFAULT, "%s: UARPAccessoryInternal %@, record %@", buf, 0x20u);

      }
      v23 = -[UARPiCloudAssetManager _getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:](self, "_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:", v16);
      objc_msgSend(v7, "record");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firmwareBinaryHash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0;
      generateHashForDataAtLocation(v6, v23, (uint64_t)&v43);
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      v27 = v43;
      v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v45 = v26;
        v46 = 2114;
        v47 = v25;
        v48 = 2114;
        v49 = v27;
        _os_log_impl(&dword_219CF8000, v28, OS_LOG_TYPE_DEFAULT, "calculatedHash: %{public}@, expectedHash:%{public}@, error:%{public}@", buf, 0x20u);
      }
      objc_msgSend(v7, "assetID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFirmwareHash:", v26);

      if (-[UARPiCloudAssetManager isFirmwareHash:equalToHash:](self, "isFirmwareHash:equalToHash:", v25, v26))
        goto LABEL_17;
      objc_msgSend(v7, "record");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
        goto LABEL_18;
      v42 = v27;
      generateBase64HashForDataAtLocation(v6, v23, (uint64_t)&v42);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v42;

      objc_msgSend(v7, "assetID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFirmwareHash:", v32);

      v26 = (char *)v32;
      v27 = v33;
      if (-[UARPiCloudAssetManager isFirmwareHash:equalToHash:](self, "isFirmwareHash:equalToHash:", v25, v32))
      {
LABEL_17:
        objc_msgSend(v7, "assetID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setValidationStatus:", 1);

        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:](self, "moveToUARPCacheFromRemoteURL:assetType:forAcessory:", v6, 0, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_18:
        objc_msgSend(v7, "assetID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setValidationStatus:", 2);

        v18 = 0;
      }

      if (v18)
        goto LABEL_20;
    }
    else
    {
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:].cold.1(v19, v7);
    }
LABEL_21:
    -[UARPiCloudAssetManager setFirmwareDownloadFailureStatusForAccessory:](self, "setFirmwareDownloadFailureStatusForAccessory:", v7);
    goto LABEL_22;
  }
  objc_msgSend(v7, "assetID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValidationStatus:", 0);

  -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:](self, "moveToUARPCacheFromRemoteURL:assetType:forAcessory:", v6, 0, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_21;
LABEL_20:
  objc_msgSend(v7, "assetID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLocalURL:", v18);

  -[UARPiCloudAssetManager setFirmwareDownloadSuccessStatusForAccessory:](self, "setFirmwareDownloadSuccessStatusForAccessory:", v7);
LABEL_22:
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  v38 = objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __82__UARPiCloudAssetManager_handleFirmwareDownloadResponseFromLocation_forAccessory___block_invoke;
  v40[3] = &unk_24DBDF5D8;
  v40[4] = self;
  v41 = v7;
  v39 = v7;
  dispatch_async(v38, v40);

}

void __82__UARPiCloudAssetManager_handleFirmwareDownloadResponseFromLocation_forAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 136315394;
    v8 = "-[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219CF8000, v2, OS_LOG_TYPE_DEFAULT, "%s: Updated assetID state %@, notifying client", (uint8_t *)&v7, 0x16u);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v5, v6, 0);

}

- (void)setFirmwareDownloadFailureStatusForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *log;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalURL:", 0);

  objc_msgSend(v4, "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDownloadStatus:", 2);

  objc_msgSend(v4, "assetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateAvailabilityStatus:", 0);

  objc_msgSend(v4, "assetID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSetDownloadCompleteForAssetID:status:", v8, 3);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[UARPiCloudAssetManager setFirmwareDownloadFailureStatusForAccessory:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "%s: Set Download Failure Status for accessory %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)setFirmwareDownloadSuccessStatusForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *log;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDownloadStatus:", 1);

  objc_msgSend(v4, "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUpdateAvailabilityStatus:", 3);

  objc_msgSend(v4, "assetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSetDownloadCompleteForAssetID:status:", v7, 1);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[UARPiCloudAssetManager setFirmwareDownloadSuccessStatusForAccessory:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "%s: Set Download Success Status for accessory %@", (uint8_t *)&v9, 0x16u);
  }

}

- (int64_t)handleReleaseNotesDownloadRequestForAccessory:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    objc_msgSend(v4, "assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "releaseNotesRemoteURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_219CF8000, v6, OS_LOG_TYPE_INFO, "Downloading Release Notes from remote url %@ for accessory %@", buf, 0x16u);

  }
  objc_msgSend(v4, "assetID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "releaseNotesRemoteURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke;
  v17[3] = &unk_24DBDF600;
  v17[4] = self;
  v18 = v4;
  v19 = v11;
  v13 = v11;
  v14 = v4;
  objc_msgSend(v12, "downloadTaskWithURL:completionHandler:", v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "resume");
  return 0;
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  _QWORD *v24;
  NSObject *v25;
  id *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  NSObject *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *((_QWORD *)a1[4] + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = a1[5];
    v12 = v10;
    objc_msgSend(v11, "assetID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "accessoryID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v14;
    v44 = 2112;
    v45 = v15;
    _os_log_impl(&dword_219CF8000, v12, OS_LOG_TYPE_INFO, "Download result: %@ error:%@ from remote url %@ for accessory %@", buf, 0x2Au);

  }
  if (!v7 || v9)
  {
    objc_msgSend(a1[4], "setReleaseNotesDownloadFailureStatusForAccessory:", a1[5]);
    objc_msgSend(a1[4], "delegateQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_211;
    v36[3] = &unk_24DBDF5D8;
    v29 = a1[5];
    v36[4] = a1[4];
    v37 = v29;
    dispatch_async(v28, v36);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    InternalStorageDirectoryPath();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@.%@"), v17, v18, CFSTR("urlasset"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCF48];
    v21 = objc_retainAutorelease(v19);
    objc_msgSend(v20, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(v21, "UTF8String"), 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(a1[4], "moveFileAtURL:toTempURL:", v7, v22);
    v24 = a1[4];
    if ((v23 & 1) != 0)
    {
      v25 = v24[5];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_3;
      block[3] = &unk_24DBDF5B0;
      block[4] = v24;
      v26 = &v32;
      v32 = v22;
      v33 = a1[5];
      dispatch_sync(v25, block);
      v27 = v33;
    }
    else
    {
      objc_msgSend(v24, "setReleaseNotesDownloadFailureStatusForAccessory:", a1[5]);
      objc_msgSend(a1[4], "delegateQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_2;
      v34[3] = &unk_24DBDF5D8;
      v30 = a1[5];
      v34[4] = a1[4];
      v26 = &v35;
      v35 = v30;
      dispatch_async(v27, v34);
    }

  }
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_211(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v4, v3, 0);

}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v4, v3, 0);

}

uint64_t __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleReleaseNotesDownloadResponseFromLocation:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setReleaseNotesDownloadFailureStatusForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReleaseNotesLocalURL:", 0);

  objc_msgSend(v3, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReleaseNotesDownloadStatus:", 2);

  objc_msgSend(v3, "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReleaseNotesAvailabilityStatus:", 0);

  objc_msgSend(v3, "assetID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsSetDownloadCompleteForAssetID:status:", v7, 3);

}

- (void)setReleaseNotesDownloadSuccessStatusForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReleaseNotesDownloadStatus:", 1);

  objc_msgSend(v3, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReleaseNotesAvailabilityStatus:", 3);

  objc_msgSend(v3, "assetID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsSetDownloadCompleteForAssetID:status:", v6, 1);

}

- (void)handleReleaseNotesDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *log;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "assetID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "signatureValidationNeeded");

  if (v9)
  {
    objc_msgSend(v7, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v7, "record");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "record");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hashAlgorithmType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedLongValue");

      }
      else
      {
        v16 = 1;
      }
      v20 = -[UARPiCloudAssetManager _getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:](self, "_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:", v16);
      objc_msgSend(v7, "record");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "releaseNotesHash");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      generateHashForDataAtLocation(v6, v20, (uint64_t)&v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v33;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v35 = v23;
        v36 = 2114;
        v37 = v22;
        v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_DEFAULT, "calculatedHash: %{public}@, expectedHash:%{public}@, error:%{public}@", buf, 0x20u);
      }
      if (v22 && objc_msgSend(v23, "isEqualToString:", v22))
      {
        objc_msgSend(v7, "assetID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setValidationStatus:", 1);

        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:](self, "moveToUARPCacheFromRemoteURL:assetType:forAcessory:", v6, 1, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "assetID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setValidationStatus:", 2);

        v18 = 0;
      }

      if (v18)
        goto LABEL_17;
    }
    else
    {
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[UARPiCloudAssetManager handleReleaseNotesDownloadResponseFromLocation:forAccessory:].cold.1(v19, v7);
    }
LABEL_18:
    -[UARPiCloudAssetManager setReleaseNotesDownloadFailureStatusForAccessory:](self, "setReleaseNotesDownloadFailureStatusForAccessory:", v7);
    goto LABEL_19;
  }
  objc_msgSend(v7, "assetID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValidationStatus:", 0);

  -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:](self, "moveToUARPCacheFromRemoteURL:assetType:forAcessory:", v6, 1, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_18;
LABEL_17:
  objc_msgSend(v7, "assetID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setReleaseNotesLocalURL:", v18);

  -[UARPiCloudAssetManager setReleaseNotesDownloadSuccessStatusForAccessory:](self, "setReleaseNotesDownloadSuccessStatusForAccessory:", v7);
LABEL_19:
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__UARPiCloudAssetManager_handleReleaseNotesDownloadResponseFromLocation_forAccessory___block_invoke;
  block[3] = &unk_24DBDF5D8;
  block[4] = self;
  v32 = v7;
  v30 = v7;
  dispatch_async(v29, block);

}

void __86__UARPiCloudAssetManager_handleReleaseNotesDownloadResponseFromLocation_forAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "accessoryID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", v4, v3, 0);

}

- (BOOL)checkLocalUARPCacheForAccessory:(id)a3 versionAvailable:(id *)a4 firmwarePath:(id *)a5 releaseNotesPath:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *log;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];

  v10 = a3;
  objc_msgSend(v10, "assetID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") != 15)
  {
    objc_msgSend(v10, "assetID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "type");

    if (v13 == 16)
      goto LABEL_4;
    v16 = (void *)MEMORY[0x24BDD16A8];
    InternalStorageDirectoryPath();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v20, 0, 4, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    if (objc_msgSend(v23, "count"))
    {
      if (objc_msgSend(v23, "count") == 1)
        goto LABEL_11;
      if ((unint64_t)objc_msgSend(v23, "count") >= 2)
      {
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __105__UARPiCloudAssetManager_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath___block_invoke;
        v55[3] = &unk_24DBDF628;
        v55[4] = self;
        objc_msgSend(v23, "sortUsingComparator:", v55);
LABEL_11:
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          v54 = v19;
          objc_msgSend(v24, "URLByAppendingPathComponent:", *MEMORY[0x24BE28A40]);
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)v26;
          objc_msgSend(v27, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v26, 0, 4, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v28;
          if (objc_msgSend(v28, "count") == 1)
          {
            v49 = v20;
            v50 = v28;
            objc_msgSend(v28, "firstObject");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "path");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            getSuperBinaryVersionForAsset((uint64_t)v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "lastPathComponent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v31;
            v33 = objc_msgSend(v31, "isEqualToString:", v32);

            v19 = v54;
            v48 = v33;
            if ((v33 & 1) != 0)
            {
              objc_msgSend(v10, "accessoryID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "firmwareVersion");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = uarpVersionCompareStrings();

              v15 = v46 == 1;
              if (v46 == 1)
              {
                *a4 = (id)objc_msgSend(v52, "copy");
                *a5 = (id)objc_msgSend(v51, "copy");
              }
              objc_msgSend(v25, "URLByAppendingPathComponent:", *MEMORY[0x24BE28A48]);
              v36 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)v36;
              objc_msgSend(v37, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v36, 0, 4, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v38, "count") == 1)
              {
                objc_msgSend(v38, "firstObject");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *a6 = (id)objc_msgSend(v39, "copy");

                v40 = v52;
                v41 = v48;
                v42 = v47;
              }
              else
              {
                v45 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
                v40 = v52;
                v41 = v48;
                v42 = v47;
                if (v45)
                  -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.2();
              }

              v44 = v53;
            }
            else
            {
              v40 = v52;
              if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
              {
                v44 = v53;
                -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.3();
                v15 = 0;
              }
              else
              {
                v15 = 0;
                v44 = v53;
              }
              v41 = v48;
            }

            if (!v41)
              v15 = 0;
            v20 = v49;
            goto LABEL_23;
          }
          v19 = v54;
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.2();

        }
LABEL_22:
        v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v25 = 0;
    goto LABEL_22;
  }

LABEL_4:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:].cold.1(log, v10);
  v15 = 0;
LABEL_24:

  return v15;
}

uint64_t __105__UARPiCloudAssetManager_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v17 = 0;
  v6 = a3;
  objc_msgSend(v5, "pathToSuperBinaryInAccessoryVersionDirectory:uarpVersion:", a2, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v10, "pathToSuperBinaryInAccessoryVersionDirectory:uarpVersion:", v6, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16;
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -1;
  if (v9 && v13)
    v14 = uarpVersionCompareStrings();

  return v14;
}

- (id)pathToSuperBinaryInAccessoryVersionDirectory:(id)a3 uarpVersion:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", *MEMORY[0x24BE28A40]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "path", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        getSuperBinaryVersionForAsset((uint64_t)v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          *a4 = (id)objc_msgSend(v16, "copy");
          v17 = (void *)objc_msgSend(v14, "copy");

          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)moveToUARPCacheFromRemoteURL:(id)a3 assetType:(int64_t)a4 forAcessory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  NSObject *log;
  _BOOL4 v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  id v40;
  NSObject *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    v10 = (void *)MEMORY[0x24BDD16A8];
    InternalStorageDirectoryPath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = (_QWORD *)MEMORY[0x24BE28A48];
  }
  else
  {
    if (a4)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:].cold.1();
      goto LABEL_32;
    }
    v10 = (void *)MEMORY[0x24BDD16A8];
    InternalStorageDirectoryPath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = (_QWORD *)MEMORY[0x24BE28A40];
  }
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@/%@/%@"), v11, v12, v14, *v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

  if ((v19 & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v22 = objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v47);
    v23 = v47;

    log = self->_log;
    v25 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if ((v22 & 1) == 0)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v53 = v23;
        _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_INFO, "Failed to create UARP Firmware directory error: %@", buf, 0xCu);
      }
LABEL_31:

LABEL_32:
      v40 = 0;
      goto LABEL_33;
    }
    if (v25)
    {
      *(_DWORD *)buf = 138412290;
      v53 = v17;
      _os_log_impl(&dword_219CF8000, log, OS_LOG_TYPE_INFO, "UARP Firmware directory created %@", buf, 0xCu);
    }
    v50 = *MEMORY[0x24BDD0CC8];
    v51 = &unk_24DBE2C88;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v23;
    v28 = objc_msgSend(v27, "setAttributes:ofItemAtPath:error:", v26, v17, &v46);
    v20 = v46;

    if ((v28 & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:].cold.2();

  }
  objc_msgSend(v8, "URLByDeletingPathExtension");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lastPathComponent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendFormat:", CFSTR("/%@"), v30);

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v17);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v20;
    v33 = objc_msgSend(v32, "copyItemAtURL:toURL:error:", v8, v23, &v45);
    v34 = v45;

    if ((v33 & 1) != 0)
    {
      v43 = v9;
      v31 = v8;
      v20 = v34;
      goto LABEL_20;
    }
    v41 = self->_log;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v23;
      _os_log_impl(&dword_219CF8000, v41, OS_LOG_TYPE_INFO, "Failed to write to path %@", buf, 0xCu);
    }

    goto LABEL_31;
  }
  v43 = v9;
  v31 = v8;
LABEL_20:
  v48 = *MEMORY[0x24BDD0CC8];
  v49 = &unk_24DBE2CA0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "path");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v20;
  v38 = objc_msgSend(v36, "setAttributes:ofItemAtPath:error:", v35, v37, &v44);
  v39 = v44;

  if ((v38 & 1) != 0)
  {
    v40 = v23;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:].cold.2();
    v40 = 0;
  }
  v8 = v31;

  v9 = v43;
LABEL_33:

  return v40;
}

- (void)handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  UARPiCloudManager *v10;
  NSObject *batchedProcessingQueue;
  id v12;
  UARPiCloudManager *v13;
  _QWORD block[4];
  UARPiCloudManager *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = -[UARPiCloudManager initWithDelegate:containerID:]([UARPiCloudManager alloc], "initWithDelegate:containerID:", self, v9);

  batchedProcessingQueue = self->_batchedProcessingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__UARPiCloudAssetManager_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer___block_invoke;
  block[3] = &unk_24DBDF650;
  v15 = v10;
  v16 = v8;
  v17 = a4;
  v12 = v8;
  v13 = v10;
  dispatch_async(batchedProcessingQueue, block);

}

uint64_t __117__UARPiCloudAssetManager_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performRemoteFetchForSupportedAccessoriesMetadata:batchRequest:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)handleRemoteDownloadResponseForSupportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __105__UARPiCloudAssetManager_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete___block_invoke;
  v13[3] = &unk_24DBDF588;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __105__UARPiCloudAssetManager_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "supportedAccessories:forProductGroup:isComplete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  UARPiCloudManager *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UARPiCloudManager initWithDelegate:containerID:]([UARPiCloudManager alloc], "initWithDelegate:containerID:", self, v6);

  -[UARPiCloudManager performRemoteFetchForAttestationCertificates:](v8, "performRemoteFetchForAttestationCertificates:", v7);
}

- (void)remoteFetchCompletionForAttestationCertificates:(id)a3 subjectKeyIdentifier:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__UARPiCloudAssetManager_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error___block_invoke;
  block[3] = &unk_24DBDF5B0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(workQueue, block);

}

uint64_t __101__UARPiCloudAssetManager_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRemoteDownloadResponseForAttestationCertificates:forSubKeyIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)handleRemoteDownloadResponseForAttestationCertificates:(id)a3 forSubKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[UARPiCloudAssetManager delegateQueue](self, "delegateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__UARPiCloudAssetManager_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier___block_invoke;
  block[3] = &unk_24DBDF5B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __101__UARPiCloudAssetManager_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "attestationCertificates:forSubjectKeyIdentifier:", a1[5], a1[6]);
}

- (unsigned)_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:(unint64_t)a3
{
  if (a3 - 1 > 0xB)
    return 0;
  else
    return dword_219D13C40[a3 - 1];
}

- (BOOL)uarpDownloadOnCellularAllowed
{
  return self->_uarpDownloadOnCellularAllowed;
}

- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3
{
  self->_uarpDownloadOnCellularAllowed = a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_batchedProcessingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong(&self->_cloudManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)handleFirmwareDownloadResponseFromLocation:(void *)a1 forAccessory:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_219CF8000, v5, v6, "Downloaded firmware record %@ missing 'firmwareBinaryHash' property", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)handleReleaseNotesDownloadResponseFromLocation:(void *)a1 forAccessory:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_219CF8000, v5, v6, "Downloaded firmware record %@ missing 'releaseNotesHash' property", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)checkLocalUARPCacheForAccessory:(void *)a1 versionAvailable:(void *)a2 firmwarePath:releaseNotesPath:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_219CF8000, v5, v6, "Asset with CHIP iCloud asset type not supported for cache %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_219CF8000, v0, v1, "Invalid contents in directory %@, contents %@");
  OUTLINED_FUNCTION_2();
}

- (void)checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_219CF8000, v0, v1, "Mismatch firmware version %@ found in directory %@, discarding");
  OUTLINED_FUNCTION_2();
}

- (void)moveToUARPCacheFromRemoteURL:assetType:forAcessory:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_219CF8000, v0, OS_LOG_TYPE_ERROR, "Invalid assetType %ld", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)moveToUARPCacheFromRemoteURL:assetType:forAcessory:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_219CF8000, v0, v1, "Failed to set permission for location %@: %@");
  OUTLINED_FUNCTION_2();
}

@end
