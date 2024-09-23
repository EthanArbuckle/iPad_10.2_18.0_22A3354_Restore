@implementation BRCMiniCiconia

- (BRCMiniCiconia)init
{
  BRCMiniCiconia *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCMiniCiconia;
  v2 = -[BRCMiniCiconia init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("BRCMiniCiconia", v3);

    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)_setupExtensionID
{
  void *v3;
  int v4;
  BOOL v5;
  __CFString *v6;
  NSString *extensionID;
  id v8;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v8, "isDataSeparatedPersona");
  v5 = v4;
  v6 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  extensionID = self->_extensionID;
  if (v4)
    v6 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  self->_extensionID = &v6->isa;

  self->_isDataSeparated = v5;
}

- (BOOL)_removeFPDomain:(id)a3 error:(id *)a4
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  NSString *extensionID;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  _BYTE v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__32;
  v33 = __Block_byref_object_dispose__32;
  v34 = 0;
  v6 = dispatch_semaphore_create(0);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v36 = v5;
    *(_WORD *)&v36[8] = 2112;
    *(_QWORD *)&v36[10] = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Will remove domain: %@%@", buf, 0x16u);
  }

  v9 = 0;
  while (1)
  {
    v10 = (void *)MEMORY[0x24BDC83F0];
    extensionID = self->_extensionID;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __40__BRCMiniCiconia__removeFPDomain_error___block_invoke;
    v24[3] = &unk_24FE468C0;
    v28 = v9;
    v12 = v5;
    v25 = v12;
    v27 = &v29;
    v13 = v6;
    v26 = v13;
    objc_msgSend(v10, "removeDomain:forProviderIdentifier:completionHandler:", v12, extensionID, v24);
    v14 = dispatch_time(0, 900000000000);
    if (dispatch_semaphore_wait(v13, v14))
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v36 = v9;
        *(_WORD *)&v36[4] = 2112;
        *(_QWORD *)&v36[6] = v5;
        *(_WORD *)&v36[14] = 2112;
        *(_QWORD *)&v36[16] = v15;
        _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] %d: removeDomain:%@ timed out%@", buf, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 60);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v30[5];
      v30[5] = v17;

    }
    v19 = (void *)v30[5];
    if (!v19 || !objc_msgSend(v19, "br_isNSXPCConnectionError"))
      break;
    sleep(1u);

    if (++v9 == 3)
      goto LABEL_13;
  }

LABEL_13:
  v20 = (void *)v30[5];
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = (void *)v30[5];
  }
  v21 = v20 == 0;

  _Block_object_dispose(&v29, 8);
  return v21;
}

void __40__BRCMiniCiconia__removeFPDomain_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "fp_prettyDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = 67109890;
      v12[1] = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] %d: removeDomain:%@ failed: %@%@", (uint8_t *)v12, 0x26u);

    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;
  v11 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_cleanupOldCiconiaDomains:(id *)a3
{
  void *v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSString *extensionID;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  dispatch_semaphore_t dsema;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  dispatch_semaphore_t v34;
  uint64_t *v35;
  uint64_t *v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCMiniCiconia _cleanupOldCiconiaDomains:].cold.1();

  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__32;
  v48 = __Block_byref_object_dispose__32;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__32;
  v42 = __Block_byref_object_dispose__32;
  v43 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = 0;
  v7 = MEMORY[0x24BDAC760];
  while (1)
  {
    v8 = (void *)MEMORY[0x24BDC83F0];
    extensionID = self->_extensionID;
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __44__BRCMiniCiconia__cleanupOldCiconiaDomains___block_invoke;
    v33[3] = &unk_24FE468E8;
    v37 = v6;
    v35 = &v44;
    v36 = &v38;
    dsema = v5;
    v34 = dsema;
    objc_msgSend(v8, "getDomainsForProviderIdentifier:completionHandler:", extensionID, v33);
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    v10 = v45[5];
    if (!v10 || (objc_msgSend(v10, "br_isNSXPCConnectionError") & 1) == 0)
      break;
    sleep(1u);

    if (++v6 == 3)
      goto LABEL_9;
  }

LABEL_9:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = (id)v39[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v56, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v15, "br_isCiconiaDomain"))
        {
          brc_bread_crumbs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v51 = v15;
            v52 = 2112;
            v53 = v16;
            _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Found old domain %@, dropping%@", buf, 0x16u);
          }

          v28 = 0;
          -[BRCMiniCiconia _removeFPDomain:error:](self, "_removeFPDomain:error:", v15, &v28);
          v18 = v28;
          v19 = v28;
          if (v19 && !v45[5])
          {
            brc_bread_crumbs();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "fp_prettyDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v51 = v15;
              v52 = 2112;
              v53 = v22;
              v54 = 2112;
              v55 = v20;
              _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to remove old domain %@: %@%@", buf, 0x20u);

            }
            objc_storeStrong(v45 + 5, v18);
          }

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v56, 16);
    }
    while (v12);
  }

  v23 = v45[5];
  if (a3 && v23)
    *a3 = objc_retainAutorelease(v23);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v23 == 0;
}

void __44__BRCMiniCiconia__cleanupOldCiconiaDomains___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_DWORD *)(a1 + 56);
      objc_msgSend(v6, "fp_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109634;
      v14[1] = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] %d: enumerating domains failed: %@%@", (uint8_t *)v14, 0x1Cu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;
  v13 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_removeDiagnosticsDirectoryAtURL:(id)a3 withError:(id *)a4
{
  void *v5;
  int v6;

  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BRCRecursiveRemove(v5);

  if (a4 && v6 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", *__error());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 >= 0;
}

- (BOOL)_fsRemoveWorkDirectory:(id *)a3
{
  int v5;
  void *v6;
  int v7;
  uint64_t v8;

  v5 = 5;
  while (1)
  {
    -[NSURL path](self->_targetURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BRCRemoveFolder(v6, 0, 0, 1);

    if ((v7 & 0x80000000) == 0)
      break;
    v8 = *__error();
    if (*__error() != 2)
    {
      sleep(1u);
      if (--v5)
        continue;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return v7 >= 0;
  }
  return v7 >= 0;
}

- (BOOL)_removeWorkDirectory:(id *)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v27;

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCMiniCiconia _removeWorkDirectory:].cold.5();

  if (self->_isDataSeparated)
  {
    v27 = 1;
    v7 = container_create_or_lookup_path_for_current_user();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Library/CloudStorage/"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      free(v8);
      objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("iCloudDrive𝛃-Ciconia"));
      v13 = objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCMiniCiconia _removeWorkDirectory:].cold.4(v13, (uint64_t)v14, v15);

      -[NSObject path](v13, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = BRCRemoveFolder(v16, 0, 0, 1);

      if (v17 < 0)
      {
        v18 = *__error();
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          -[BRCMiniCiconia _removeWorkDirectory:].cold.3((uint64_t)v19, v18, v20);

        *__error() = v18;
      }
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        -[BRCMiniCiconia _removeWorkDirectory:].cold.2(&v27, (uint64_t)v12, v13);
    }

  }
  if (-[BRCMiniCiconia _fsRemoveWorkDirectory:](self, "_fsRemoveWorkDirectory:", a3))
    return 1;
  if ((objc_msgSend(*a3, "br_isPOSIXErrorCode:", 2) & 1) != 0)
    return 0;
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRCMiniCiconia _removeWorkDirectory:].cold.1();

  -[NSURL URLByAppendingPathComponent:](self->_targetURL, "URLByAppendingPathComponent:", CFSTR("files"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_enable_fault_handling();
  objc_msgSend(v24, "path");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  MEMORY[0x2348B9D10](objc_msgSend(v25, "fileSystemRepresentation"), 0);

  v21 = -[BRCMiniCiconia _fsRemoveWorkDirectory:](self, "_fsRemoveWorkDirectory:", a3);
  return v21;
}

- (void)cleanupCiconiaAtURL:(id)a3 diagnosticsURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BRCMiniCiconia_cleanupCiconiaAtURL_diagnosticsURL_completionHandler___block_invoke;
  block[3] = &unk_24FE46910;
  objc_copyWeak(&v19, &location);
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __71__BRCMiniCiconia_cleanupCiconiaAtURL_diagnosticsURL_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    objc_msgSend(v3, "_setupExtensionID");
    v7 = 0;
    objc_msgSend(v3, "_cleanupOldCiconiaDomains:", &v7);
    v4 = v7;
    v6 = v4;
    objc_msgSend(v3, "_removeWorkDirectory:", &v6);
    v5 = v6;

    objc_msgSend(v3, "_removeDiagnosticsDirectoryAtURL:withError:", *(_QWORD *)(a1 + 40), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_cleanupOldCiconiaDomains:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Looking for old Ciconia domains%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_removeWorkDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Retry removing work directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_removeWorkDirectory:(os_log_t)log .cold.2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] Error: %lld%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_removeWorkDirectory:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] Failed removing domain %{errno}d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)_removeWorkDirectory:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_prettyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing FP domain on disk: %@%@", v7, 0x16u);

}

- (void)_removeWorkDirectory:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Removing work directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
