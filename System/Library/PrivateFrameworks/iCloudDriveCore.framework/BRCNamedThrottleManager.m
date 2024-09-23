@implementation BRCNamedThrottleManager

- (BRCNamedThrottleManager)initWithDB:(id)a3
{
  id v5;
  BRCNamedThrottleManager *v6;
  BRCNamedThrottleManager *v7;
  uint64_t v8;
  NSString *currentOSVersion;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCNamedThrottleManager;
  v6 = -[BRCNamedThrottleManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    OSVersion();
    v8 = objc_claimAutoreleasedReturnValue();
    currentOSVersion = v7->_currentOSVersion;
    v7->_currentOSVersion = (NSString *)v8;

  }
  return v7;
}

- (void)cleanNamedThrottleTable:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  time_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCNamedThrottleManager cleanNamedThrottleTable:].cold.2((uint64_t)v4, v5);

  v6 = time(0);
  OSVersion();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "execute:", CFSTR("DELETE FROM named_throttles_history WHERE expiration < %ld AND (allow_same_build = 1 OR os_version != %@)"), v6, v7);

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCNamedThrottleManager cleanNamedThrottleTable:].cold.1(v3, (uint64_t)v8, v9);

}

- (void)throttle:(id)a3 subCategory:(id)a4 withRules:(id)a5 onQueue:(id)a6 block:(id)a7
{
  id v12;
  id v13;
  BRCPQLConnection *v14;
  NSString *v15;
  id v16;
  time_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  NSObject *v26;
  id v27;
  id v28;
  NSString *v29;
  id v30;
  id v31;
  BRCPQLConnection *v32;
  id v33;
  id v34;
  _QWORD block[4];
  BRCPQLConnection *v36;
  id v37;
  id v38;
  NSString *v39;
  id v40;
  id v41;
  time_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v34 = a3;
  v33 = a4;
  v12 = a6;
  v13 = a7;
  v14 = self->_db;
  v15 = self->_currentOSVersion;
  v16 = a5;
  v17 = time(0);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("waitBetweenThrottleRuns"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longValue");
  v20 = 86400;
  if (v19)
    v21 = v19;
  else
    v21 = 86400;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("waitBetweenSubCatagoryRuns"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "longValue");
  if (v23)
    v20 = v23;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("allowOnSameBuild"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "BOOLValue");
  -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke;
  block[3] = &unk_24FE47D40;
  v36 = v14;
  v37 = v34;
  v42 = v17;
  v43 = v21;
  v45 = v25;
  v38 = v33;
  v39 = v15;
  v44 = v20;
  v40 = v12;
  v41 = v13;
  v27 = v13;
  v28 = v12;
  v29 = v15;
  v30 = v33;
  v31 = v34;
  v32 = v14;
  dispatch_async(v26, block);

}

void __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "numberWithSQL:", CFSTR("SELECT MAX(last_run) FROM named_throttles_history WHERE throttle_id = %@"), *(_QWORD *)(a1 + 40));
  v3 = v2;
  if (!v2)
  {
    v6 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v2, "longValue") <= *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 88))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "fetch:", CFSTR("SELECT last_run, os_version FROM named_throttles_history WHERE throttle_id = %@ AND sub_category = %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_8:
    if (objc_msgSend(v6, "next"))
    {
      v7 = *(_QWORD *)(a1 + 80);
      v8 = (void *)(v7 - objc_msgSend(v6, "longAtIndex:", 0));
      v9 = 1;
      objc_msgSend(v6, "stringAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*(_BYTE *)(a1 + 104))
        v9 = objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", v10) ^ 1;
      v11 = *(_QWORD *)(a1 + 96);
      if ((uint64_t)v8 >= v11)
        v12 = v9;
      else
        v12 = 0;
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 96);
        v23 = *(_QWORD *)(a1 + 56);
        v24 = CFSTR("NO");
        if (v12)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        if (v9)
          v26 = CFSTR("YES");
        else
          v26 = CFSTR("NO");
        if ((uint64_t)v8 >= v11)
          v24 = CFSTR("YES");
        *(_DWORD *)buf = 138414594;
        v40 = v20;
        v41 = 2112;
        v42 = v21;
        v43 = 2048;
        v44 = v8;
        v45 = 2048;
        v46 = v22;
        v47 = 2112;
        v48 = v10;
        v49 = 2112;
        v50 = v23;
        v51 = 2112;
        v52 = v25;
        v53 = 2112;
        v54 = v26;
        v55 = 2112;
        v56 = v24;
        v57 = 2112;
        v58 = v13;
        _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttler %@,%@: last run: %ld seconds ago, minimal time: %ld seconds, os build: %@, current os build: %@, should invoke: %@. OS build Rule result: %@, Time Limit Rule Result: %@%@", buf, 0x66u);
      }

      if ((v12 & 1) == 0)
        goto LABEL_16;
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v40 = v27;
        v41 = 2112;
        v42 = v28;
        v43 = 2112;
        v44 = v17;
        _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttler %@,%@: no history found, should invoke: YES%@", buf, 0x20u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "execute:", CFSTR("INSERT OR REPLACE INTO named_throttles_history (throttle_id, sub_category, last_run, os_version, expiration, allow_same_build) VALUES (%@, %@, %ld, %@, %ld, %d)"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 104));
    v19 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_2;
    v34[3] = &unk_24FE409B8;
    v15 = &v35;
    v35 = *(id *)(a1 + 64);
    v36 = *(id *)(a1 + 72);
    objc_msgSend(v19, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v34);

    goto LABEL_21;
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    v31 = *(_QWORD *)(a1 + 80);
    v32 = objc_msgSend(v3, "longValue");
    v33 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 138413314;
    v40 = v29;
    v41 = 2112;
    v42 = v30;
    v43 = 2048;
    v44 = (void *)(v31 - v32);
    v45 = 2048;
    v46 = v33;
    v47 = 2112;
    v48 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttler %@,%@: throttle id last run: %ld seconds ago, minimal time: %ld seconds, should invoke: NO%@", buf, 0x34u);
  }

LABEL_16:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_15;
  block[3] = &unk_24FE41D98;
  v15 = &v38;
  v16 = *(NSObject **)(a1 + 64);
  v38 = *(id *)(a1 + 72);
  dispatch_async(v16, block);
LABEL_21:

}

void __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_15(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorThrottled");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_3;
  block[3] = &unk_24FE41D98;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __72__BRCNamedThrottleManager_throttle_subCategory_withRules_onQueue_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dumpToContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v18, "writeLineWithFormat:", CFSTR("Named Throttle History"));
  objc_msgSend(v18, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dumpDateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateFormat:", v6);

  v7 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT throttle_id, sub_category, last_run, os_version, expiration, allow_same_build FROM named_throttles_history LIMIT 100"));
  if (objc_msgSend(v7, "next"))
  {
    do
    {
      objc_msgSend(v7, "stringAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v7, "longAtIndex:", 2));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringAtIndex:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v7, "longAtIndex:", 4));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "BOOLAtIndex:", 5);
      objc_msgSend(v4, "stringFromDate:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromDate:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("no");
      if (v13)
        v17 = CFSTR("yes");
      objc_msgSend(v18, "writeLineWithFormat:", CFSTR("|<%@,%@>|last run:%@|os version:%@|expiration:%@|allow same build:%@"), v8, v9, v14, v11, v15, v17);

    }
    while ((objc_msgSend(v7, "next") & 1) != 0);
  }
  objc_msgSend(v18, "writeLineWithFormat:", &stru_24FE4A790);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)cleanNamedThrottleTable:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 134218242;
  v6 = objc_msgSend(a1, "changes");
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleared %lld throttle history records%@", (uint8_t *)&v5, 0x16u);
}

- (void)cleanNamedThrottleTable:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning named throggler%@", (uint8_t *)&v2, 0xCu);
}

@end
