@implementation NSString(BRCPathAdditions)

+ (id)brc_currentCachesDir
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  char v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (brc_currentCachesDir_once != -1)
    dispatch_once(&brc_currentCachesDir_once, &__block_literal_global_26);
  v2 = (id)brc_currentCachesDir_pathByPersonaID;
  objc_sync_enter(v2);
  v10 = 0;
  objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)brc_currentCachesDir_pathByPersonaID, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (v10)
    {
      objc_msgSend(a1, "br_currentHomeDir");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Library/Caches/com.apple.bird"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
LABEL_6:
        objc_msgSend(v4, "br_realpath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)brc_currentCachesDir_pathByPersonaID, "setObject:forKeyedSubscript:", v6, v3);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(CFSTR("com.apple.bird"), "br_pathRelativeToDirectory:", 13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        goto LABEL_6;
    }
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for Caches directory%@", buf, 0xCu);
    }

    goto LABEL_11;
  }
LABEL_12:
  v8 = v4;

  objc_sync_exit(v2);
  return v8;
}

+ (uint64_t)brc_accountIDPathForAccountPath:()BRCPathAdditions
{
  return objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("account.1"));
}

+ (const)ubiquityTokenSaltFilename
{
  return CFSTR("MobileHost.txt");
}

+ (id)brc_locateUbiquityTokenSaltInOldAccountPath:()BRCPathAdditions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    v9 = v6;
    if (!v7)
      goto LABEL_20;
    v10 = v7;
    v11 = 0;
    v12 = *(_QWORD *)v29;
    *(_QWORD *)&v8 = 138412546;
    v27 = v8;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v36 = 0;
        v37 = 0;
        objc_msgSend(v14, "brc_stringByDeletingPathExtension", v27, (_QWORD)v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = _br_parseUUIDString();

        if (v16)
        {
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v27;
            v33 = v14;
            v34 = 2112;
            v35 = v17;
            _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Located ubiquity salt path by the duck test - %@%@", buf, 0x16u);
          }

          objc_msgSend(v3, "stringByAppendingPathComponent:", v14);
          v19 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v19;
        }
      }
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v10);

    if (!v11)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "fileExistsAtPath:", v11);

    if ((v21 & 1) != 0)
    {
      v9 = v11;
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("UnknownHost.txt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "fileExistsAtPath:", v9);

    if (v23)
    {
      if (v9)
        goto LABEL_24;
    }
    else
    {
LABEL_20:

    }
LABEL_21:
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v3;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_230455000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate ubiquity salt path in %@%@", buf, 0x16u);
    }

    v9 = 0;
    goto LABEL_24;
  }
  v9 = 0;
LABEL_25:

  return v9;
}

+ (uint64_t)br_currentMobileDocumentsDir
{
  return objc_msgSend(a1, "br_currentMobileDocumentsDirWithRefreshCache:", 0);
}

+ (id)br_currentMobileDocumentsDirWithRefreshCache:()BRCPathAdditions
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD v27[4];
  NSObject *v28;
  _BYTE *v29;
  id v30;
  char v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (br_currentMobileDocumentsDirWithRefreshCache__once != -1)
    dispatch_once(&br_currentMobileDocumentsDirWithRefreshCache__once, &__block_literal_global_13);
  v5 = (id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID;
  objc_sync_enter(v5);
  v31 = 0;
  objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v31);
  v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend((id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID, "removeObjectForKey:", v6);
  objc_msgSend((id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (MEMORY[0x2348B93B0]())
    {
      objc_msgSend(MEMORY[0x24BE17630], "br_getProviderDomainIDForCurrentPersona");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v30 = 0;
        objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainWithID:cachePolicy:error:", v8, 0, &v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v30;
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v33 = v6;
        LOWORD(v34) = 2112;
        *(_QWORD *)((char *)&v34 + 2) = v11;
        _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Getting root item for provider domain ID: %@. Found domain: %@. Current persona: %@%@", buf, 0x2Au);
      }

      if (v9)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v33 = __Block_byref_object_copy__21;
        *(_QWORD *)&v34 = __Block_byref_object_dispose__21;
        *((_QWORD *)&v34 + 1) = 0;
        objc_msgSend(v9, "storageURLs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count") == 0;

        if (v14)
        {
          v20 = dispatch_group_create();
          dispatch_group_enter(v20);
          objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __75__NSString_BRCPathAdditions__br_currentMobileDocumentsDirWithRefreshCache___block_invoke_17;
          v27[3] = &unk_24FE43560;
          v29 = buf;
          v18 = v20;
          v28 = v18;
          objc_msgSend(v21, "fetchRootItemForProviderDomain:completionHandler:", v9, v27);

          dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
          v19 = v28;
        }
        else
        {
          objc_msgSend(v9, "storageURLs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v16;

          brc_bread_crumbs();
          v18 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            +[NSString(BRCPathAdditions) br_currentMobileDocumentsDirWithRefreshCache:].cold.1((uint64_t)&buf[8], (uint64_t)v18, v19);
        }

        v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v22)
        {
          objc_msgSend(v22, "path");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      +[BRCStringAdditions _br_currentMobileDocumentsDirForLegacy](BRCStringAdditions, "_br_currentMobileDocumentsDirForLegacy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v7)
    {
      objc_msgSend(v7, "br_realpath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID, "setObject:forKeyedSubscript:", v23, v6);
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_230455000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for Mobile Documents directory%@", buf, 0xCu);
      }

    }
  }
  v25 = v7;

  objc_sync_exit(v5);
  return v25;
}

+ (id)_brc_fileProviderStoragePath
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.iCloudDrive"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("File Provider Storage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)brc_groupDownloadStagePath
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD17C8], "_brc_fileProviderStoragePath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("DownloadStage"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)br_currentMobileDocumentsDirWithRefreshCache:()BRCPathAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, (uint64_t)a3, "[DEBUG] Getting root URL from storage URLs: %@%@", (uint8_t *)&v4);
}

@end
