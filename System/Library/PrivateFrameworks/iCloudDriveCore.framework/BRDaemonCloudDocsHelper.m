@implementation BRDaemonCloudDocsHelper

void __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "br_currentHomeDir");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE17588]);

      +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountHandlerForCurrentPersona");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "isOpen") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE17630], "br_getProviderDomainIDForCurrentPersona");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          obj = *(id *)(v11 + 40);
          objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainWithID:cachePolicy:error:", v10, 0, &obj);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v11 + 40), obj);
        }
        else
        {
          v12 = 0;
        }
        -[NSObject storageURLs](v12, "storageURLs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "br_realpathURLWithIsDirectory:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE17548]);

          }
        }

      }
      else
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_2((uint64_t)v9, (uint64_t)v10, v12);
      }

    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_1((uint64_t)v13, v14);

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No home directory"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }

  }
}

- (id)queryPathsForPersona:(id)a3 withError:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__43;
  v18 = __Block_byref_object_dispose__43;
  v19 = 0;
  v6 = (id)objc_opt_new();
  BRPerformWithPersonaAndError();
  v7 = (void *)v15[5];
  if (v7)
  {
    v8 = v7;
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v13 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v21 = "-[BRDaemonCloudDocsHelper queryPathsForPersona:withError:]";
      v22 = 2080;
      if (!a4)
        v13 = "(ignored by caller)";
      v23 = v13;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v8);

    v11 = 0;
  }
  else
  {
    v11 = v6;
  }

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No home directory%@", (uint8_t *)&v2, 0xCu);
}

void __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Session %@ is not open. We can't get the mobile document path%@", (uint8_t *)&v3, 0x16u);
}

@end
