@implementation BRCImportUtil

+ (BOOL)reimportItemsBelowItemWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__27;
  v20 = __Block_byref_object_dispose__27;
  v21 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__BRCImportUtil_reimportItemsBelowItemWithIdentifier_error___block_invoke;
  v13[3] = &unk_24FE45DA0;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:](BRCImportUtil, "reimportItemsBelowItemWithIdentifier:completionHandler:", v5, v13);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v17[5];
  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v12 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v23 = "+[BRCImportUtil reimportItemsBelowItemWithIdentifier:error:]";
      v24 = 2080;
      if (!a4)
        v12 = "(ignored by caller)";
      v25 = v12;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v16, 8);
  return v8 == 0;
}

void __60__BRCImportUtil_reimportItemsBelowItemWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (void)reimportItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:].cold.2((uint64_t)v5);

  objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BE176A8];
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "xpcConnectionFailureRetries");
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke;
    v20[3] = &unk_24FE41D48;
    v21 = v5;
    v22 = v6;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_7;
    v17[3] = &unk_24FE45DC8;
    v18 = v9;
    v19 = v21;
    objc_msgSend(v10, "executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:", v12, v20, v17);

    v14 = v21;
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v14);
  }

}

void __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] failed to re-import items under %@ with error %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_24FE438B0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "reimportItemsBelowItemWithIdentifier:completionHandler:", v4, v7);

}

uint64_t __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)requestModificationOfItemIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[BRCImportUtil requestModificationOfItemIdentifier:completionHandler:].cold.1((uint64_t)v5);

  objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "requestModificationOfFields:forItemWithIdentifier:options:completionHandler:", 1, v5, 1, v6);
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't compute fp manager for current account%@", (uint8_t *)&v13, 0xCu);
    }

  }
}

+ (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      +[BRCImportUtil forceIngestionForItemID:completionHandler:].cold.1();

  }
  objc_msgSend(MEMORY[0x24BDC82E8], "br_fpItemIDFromItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Forcing Ingestion for itemIdentifier = %@ and itemID = %@%@", buf, 0x20u);
    }

    v11 = (void *)MEMORY[0x24BE176A8];
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "xpcConnectionFailureRetries");
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__BRCImportUtil_forceIngestionForItemID_completionHandler___block_invoke;
    v19[3] = &unk_24FE45DF0;
    v20 = v8;
    objc_msgSend(v11, "executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:", v13, v7, v19);

    v14 = v20;
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v22 = a1;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Can't find a file provider item ID for %@%@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemNotFound:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);
  }

}

void __59__BRCImportUtil_forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDC8270];
  v4 = a2;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceIngestionForItemID:completionHandler:", *(_QWORD *)(a1 + 32), v4);

}

+ (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v6)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      +[BRCImportUtil forceIngestionForItemID:completionHandler:].cold.1();

  }
  objc_msgSend(MEMORY[0x24BDC82E8], "br_fpItemIDFromItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Propagating To File System for itemIdentifier = %@ and itemID = %@%@", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDC8270], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forceLatestVersionOnDiskForItemID:completionHandler:", v8, v7);
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = a1;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Can't find a file provider item ID for %@%@", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemNotFound:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }

}

+ (BOOL)isFileNameIgnoredForSync:(id)a3 isRegFile:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  char v6;
  void *v8;
  NSObject *v9;

  v4 = a4;
  v5 = a3;
  if (!v5)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[BRCImportUtil isFileNameIgnoredForSync:isRegFile:].cold.1();

  }
  if ((objc_msgSend(v5, "br_isExcludedFromSyncInFPFSIsFile:", v4) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "br_isSideFaultName");

  return v6;
}

+ (BOOL)shouldFileIDBeIgnoredAsNonMigrated:(id)a3 docID:(id)a4 deviceID:(id)a5 isRegFile:(BOOL)a6 rowid:(id)a7 outItemURL:(id *)a8 isBusyDate:(BOOL *)a9 isIgnoredFromSync:(BOOL *)a10
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v12 = a6;
  v53 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v42 = 0;
  objc_msgSend(MEMORY[0x24BDBCF48], "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:withError:", a5, v16, 0, &v42);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v42;
  if (a8)
    *a8 = objc_retainAutorelease(v19);
  v41 = 0;
  if (v19)
    v21 = v20 == 0;
  else
    v21 = 0;
  if (!v21)
  {
    if (objc_msgSend(v20, "br_isPOSIXErrorCode:", 2))
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v44 = v18;
        v45 = 2112;
        v46 = v17;
        v47 = 2112;
        v48 = v16;
        v49 = 2112;
        v50 = v22;
        _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] item with rowID %@ docID %@ and fileID %@ was not found on disk%@", buf, 0x2Au);
      }
LABEL_20:

      v35 = 1;
      goto LABEL_36;
    }
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413314;
      v44 = v18;
      v45 = 2112;
      v46 = v17;
      v47 = 2112;
      v48 = v16;
      v49 = 2112;
      v50 = v20;
      v51 = 2112;
      v52 = v33;
      _os_log_error_impl(&dword_230455000, v34, (os_log_type_t)0x90u, "[ERROR] failed getting URL of item with rowID %@ docID %@ and fileID %@: %@%@", buf, 0x34u);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v19, "br_isInSyncedLocation") & 1) == 0)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fp_prettyPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v44 = v18;
      v45 = 2112;
      v46 = v17;
      v47 = 2112;
      v48 = v16;
      v49 = 2112;
      v50 = v37;
      v51 = 2112;
      v52 = v22;
      _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] item with rowID %@ docID %@ and fileID %@ is not located in synced location: %@%@", buf, 0x34u);

    }
    goto LABEL_20;
  }
  objc_msgSend(v19, "br_containerID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    objc_msgSend(v19, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fp_prettyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v44 = v18;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v31;
    v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is located in an invalid container: %@%@";
    goto LABEL_33;
  }
  objc_msgSend(v19, "lastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(a1, "isFileNameIgnoredForSync:isRegFile:", v26, v12);

  if (v27)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    objc_msgSend(v19, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fp_prettyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v44 = v18;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v31;
    v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is ignored from sync: %@%@";
    goto LABEL_33;
  }
  if (objc_msgSend(v19, "br_getBirthDate:", &v41) && BRCIsBusyDate(v41))
  {
    a10 = a9;
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    objc_msgSend(v19, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fp_prettyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v44 = v18;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v31;
    v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is busy date: %@%@";
    goto LABEL_33;
  }
  if (objc_msgSend(v19, "br_isIgnoredByFileProvider", v41))
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    objc_msgSend(v19, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fp_prettyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v44 = v18;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v31;
    v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is ignored by FP: %@%@";
    goto LABEL_33;
  }
  if (!objc_msgSend(v19, "br_isRootOwned"))
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      objc_msgSend(v19, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "fp_prettyPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v44 = v18;
      v45 = 2112;
      v46 = v17;
      v47 = 2112;
      v48 = v16;
      v49 = 2112;
      v50 = v40;
      v51 = 2112;
      v52 = v33;
      _os_log_error_impl(&dword_230455000, v34, (os_log_type_t)0x90u, "[ERROR] item with rowID %@ docID %@ and fileID %@ got left behind when migrating: %@%@", buf, 0x34u);

    }
LABEL_17:

    v35 = 0;
    goto LABEL_36;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v19, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fp_prettyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v44 = v18;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v31;
    v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is root owned: %@%@";
LABEL_33:
    _os_log_impl(&dword_230455000, v29, OS_LOG_TYPE_DEFAULT, v32, buf, 0x34u);

  }
LABEL_34:

  v35 = 1;
  if (a10)
    *a10 = 1;
LABEL_36:

  return v35;
}

+ (void)reimportItemsBelowItemWithIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Couldn't compute fp manager for current account%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)reimportItemsBelowItemWithIdentifier:(uint64_t)a1 completionHandler:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Starting BRCImportUtil::reimportItemsBelowItemWithIdentifier::%@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Successfully asked file provider to re-import all %@ items%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

+ (void)requestModificationOfItemIdentifier:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Starting BRCImportUtil::requestModificationOfItemIdentifier::%@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

+ (void)forceIngestionForItemID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: itemIdentifier%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)isFileNameIgnoredForSync:isRegFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: fileName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
