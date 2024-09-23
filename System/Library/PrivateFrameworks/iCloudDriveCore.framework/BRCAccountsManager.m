@implementation BRCAccountsManager

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_48);
  return (id)sharedManager_instance;
}

- (BOOL)isInSyncBubble
{
  return objc_msgSend(MEMORY[0x24BEBF268], "br_isInSyncBubble");
}

- (BOOL)_isDeviceUnlocked
{
  int v2;
  void *v3;
  NSObject *v4;
  void *v6;
  NSObject *v7;

  v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 < 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager _isDeviceUnlocked].cold.1((uint64_t)v6, v2, v7);

    return 0;
  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BRCAccountsManager _isDeviceUnlocked].cold.2(v2);

    return v2 == 1;
  }
}

- (id)accountHandlerForCurrentPersona
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSMutableDictionary *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountsManager accountForPersona:](self, "accountForPersona:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountsManager accountHandlerForACAccountID:](self, "accountHandlerForACAccountID:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = self->_accountHandlersByACAccountID;
    objc_sync_enter(v21);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_accountHandlersByACAccountID, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    obj = v8;
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "session");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isDataSeparated") & 1) == 0 && (objc_msgSend(v4, "isDataSeparatedPersona") & 1) == 0)
          {

LABEL_15:
            brc_bread_crumbs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              v30 = 2112;
              v31 = v18;
              _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Found account handler %@ by persona match%@", buf, 0x16u);
            }

            v7 = v12;
            goto LABEL_18;
          }
          objc_msgSend(v12, "session");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "personaIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "br_personaID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v17)
            goto LABEL_15;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_18:

    objc_sync_exit(v21);
  }

  return v7;
}

- (id)accountForPersona:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDB4398];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_accountForPersona:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accountForCurrentPersona
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_accountForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)waitForInitialAccountLoadingSynchronouslyIfPossible
{
  NSObject *queue;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!self->_finishedLoadingAccounts)
  {
    if (self->_loadAccountsRequested)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke;
      block[3] = &unk_24FE3FA18;
      block[4] = self;
      dispatch_sync(queue, block);
    }
    else
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Not waiting for initial account loading synchronously since we did not yet kick loadAccounts request%@", buf, 0xCu);
      }

    }
  }
  return self->_finishedLoadingAccounts;
}

- (id)accountHandlerForACAccountID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountHandlersByACAccountID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id obj;

  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_sync_exit(obj);
}

- (void)enumerateAccountHandlers:(id)a3
{
  id v4;
  NSObject *queue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__38;
  v24 = __Block_byref_object_dispose__38;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke;
  block[3] = &unk_24FE42B50;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = (id)v21[5];
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "acAccountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "br_personaIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v4;
        BRPerformWithPersonaAndError();

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v20, 8);
}

void __35__BRCAccountsManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;

}

- (BRCAccountsManager)init
{
  BRCAccountsManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *maintainFPDomainsQueue;
  uint64_t v11;
  NSMutableDictionary *accountHandlersByACAccountID;
  BRCBarrier *v13;
  BRCBarrier *accountsLoadingBarrier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BRCAccountsManager;
  v2 = -[BRCAccountsManager init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("account-queue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("maintain-fp-domains", v8);

    maintainFPDomainsQueue = v2->_maintainFPDomainsQueue;
    v2->_maintainFPDomainsQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    accountHandlersByACAccountID = v2->_accountHandlersByACAccountID;
    v2->_accountHandlersByACAccountID = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(BRCBarrier);
    accountsLoadingBarrier = v2->_accountsLoadingBarrier;
    v2->_accountsLoadingBarrier = v13;

  }
  return v2;
}

- (id)getQueue
{
  return self->_queue;
}

- (id)getMaintainFPDomainsQueue
{
  return self->_maintainFPDomainsQueue;
}

- (id)_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_accountForCurrentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "br_dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.bird.keepDataLocalOnSignOutSetAtTime."), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_readkeepDataLocalOnSignOutForCurrentPersona
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  time_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountsManager _keepDataLocalOnSignOutDefaultsKeyForCurrentPersona](self, "_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = v2;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Value of %@ user default is: %@%@", (uint8_t *)&v9, 0x20u);
  }

  v7 = time(0);
  LOBYTE(v7) = objc_msgSend(v4, "longValue") > v7 - 60;

  return v7;
}

- (void)keepDataLocalOnSignOutForCurrentPersona:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[BRCAccountsManager _keepDataLocalOnSignOutDefaultsKeyForCurrentPersona](self, "_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", time(0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:", v7);
  }

}

- (BOOL)cleanupAccountDataForLoggedOutAccountWithPersona:(id)a3
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  BRPerformWithPersonaAndError();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  id v50;
  char v51[32];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_6();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    BRPostAccountTokenChangedNotification();
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BEBF270], "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDataSeparatedPersona");

  objc_msgSend(*(id *)(a1 + 32), "accountHandlerForCurrentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fpDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC83F0], "br_getProviderManagerForDataSeparated:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v42 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
  }
  else
  {
    if (v9)
    {
      brc_bread_crumbs();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_5();

    }
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "br_accountForCurrentPersona");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_4((uint64_t)v13);

    v50 = 0;
    objc_msgSend(v11, "br_getFPDomainForAccount:withError:", v13, &v50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v50;

    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    if (!v10)
    {
      if (v42)
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
          __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_3((uint64_t)v42);

        v18 = 0;
      }
      else
      {
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(0, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_2(v37, (uint64_t)v35, (uint64_t)v51);
        }

        v42 = 0;
        v18 = 0;
        *((_BYTE *)v47 + 24) = 1;
      }
      goto LABEL_14;
    }
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v53 = v38;
    v54 = 2112;
    v55 = v39;
    v56 = 2112;
    v57 = v16;
    _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing domain: %@, display name: %@%@", buf, 0x20u);

  }
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12;
  v43[3] = &unk_24FE41790;
  v18 = v10;
  v44 = v18;
  v45 = &v46;
  objc_msgSend(v11, "br_removeDomain:sync:completionHandler:", v18, 1, v43);

LABEL_14:
  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "destroySessionSynchronously");
    if (!*((_BYTE *)v47 + 24))
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain removal failed and we have an account session. Crashing to prevent inconsistent state"));
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        brc_append_system_info_to_message();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_1(v21, (uint64_t)v19, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v22 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountsManager cleanupAccountDataForLoggedOutAccountWithPersona:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountsManager.m", 305, v22);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "br_currentSupportDir");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathComponent:", *MEMORY[0x24BE174A0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("db"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "fileExistsAtPath:", v25);

    if (v27)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v53 = v30;
        v54 = 2112;
        v55 = v24;
        v56 = 2112;
        v57 = v28;
        _os_log_impl(&dword_230455000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Found existing session directory on startup for account with no account handler (persona %@). Removing it %@%@", buf, 0x20u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[BRCFileSystemWrapper recursiveRemove:](BRCFileSystemWrapper, "recursiveRemove:", v24) == 0;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(_BYTE *)(v31 + 24);
  if (v32)
    v32 = *((_BYTE *)v47 + 24) != 0;
  *(_BYTE *)(v31 + 24) = v32;
  _Block_object_dispose(&v46, 8);

LABEL_28:
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] Failed to remove domain %@ - %@%@", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12_cold_1(a1, (uint64_t)v6, v7);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)loadAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Creating sync task%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __34__BRCAccountsManager_loadAccounts__block_invoke(uint64_t a1)
{
  id (**v2)(void *);
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56[3];
  id v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "waitUntilDeviceIsUnlocked");
  v2 = (id (**)(void *))MEMORY[0x24BE17830];
  *MEMORY[0x24BE17840] = _BRBlockRememberPersona;
  *v2 = _BRActivityBlockRememberPersona;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v37, "br_allEnabledAppleAccountsIncludingDataSeparated:withError:", 1, &v57);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v57;
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"-[BRCAccountsManager loadAccounts]_block_invoke", 366, v56);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v31 = v56[0];
    v32 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 134218754;
    v61 = v31;
    v62 = 2048;
    v63 = v32;
    v64 = 2112;
    v65 = v36;
    v66 = 2112;
    v67 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Loaded %lu system icloud accounts with error: %@%@", buf, 0x2Au);
  }

  if (!v38 || v36)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      __34__BRCAccountsManager_loadAccounts__block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BE17660], "exitProcess:", 0);
  }
  else
  {
    +[BRCUserDefaults loadCachedServerConfiguration](BRCUserDefaults, "loadCachedServerConfiguration");
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v5 = v38;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    v7 = MEMORY[0x24BDAC760];
    if (v6)
    {
      v8 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v10, "br_personaIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v7;
          v46 = 3221225472;
          v47 = __34__BRCAccountsManager_loadAccounts__block_invoke_31;
          v48 = &unk_24FE42FD0;
          v12 = *(_QWORD *)(a1 + 32);
          v49 = v10;
          v50 = v12;
          v13 = v5;
          v51 = v13;
          BRPerformWithPersonaAndError();

        }
        v6 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "signalBarrier");
    v44 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 32);
          v40[0] = v7;
          v40[1] = 3221225472;
          v40[2] = __34__BRCAccountsManager_loadAccounts__block_invoke_32;
          v40[3] = &unk_24FE470A8;
          v40[4] = v20;
          v40[5] = v18;
          objc_msgSend(v20, "createAndLoadSessionWithACAccountID:createBlock:", v19, v40);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
      }
      while (v15);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "isInSyncBubble"))
    {
      v21 = *(_QWORD **)(a1 + 32);
      if (!v21[5])
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2();

        v21 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v21, "_createSyncBubbleTasksIfNecessary");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "end");
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = 0;

    }
    objc_msgSend(v35, "serverConfigurationURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v27;

    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __34__BRCAccountsManager_loadAccounts__block_invoke_36;
    v39[3] = &unk_24FE3FA18;
    v39[4] = *(_QWORD *)(a1 + 32);
    +[BRCUserDefaults setServerConfigurationURL:whenLoaded:](BRCUserDefaults, "setServerConfigurationURL:whenLoaded:", v30, v39);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_scheduleExistingFileProviderDomainsMaintenanceWithAccounts:", v14);

  }
  __brc_leave_section(v56);

}

void __34__BRCAccountsManager_loadAccounts__block_invoke_31(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;

  if (a2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __34__BRCAccountsManager_loadAccounts__block_invoke_31_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_maintainExistingFileProviderDomainsIfNeededWithAccounts:", *(_QWORD *)(a1 + 48));
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 32));
  }
}

id __34__BRCAccountsManager_loadAccounts__block_invoke_32(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAndLoadAccountSynchronously:", *(_QWORD *)(a1 + 40));
  return v2;
}

uint64_t __34__BRCAccountsManager_loadAccounts__block_invoke_36(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateAccountHandlers:", &__block_literal_global_38_0);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefaultsChanged");

}

- (id)_getEnterpriseProviderManager
{
  return (id)objc_msgSend(MEMORY[0x24BDC83F0], "br_getEnterpriseProviderManager");
}

- (id)_getPrimaryProviderManager
{
  return (id)objc_msgSend(MEMORY[0x24BDC83F0], "br_getPrimaryProviderManager");
}

- (BOOL)_maintainExistingFileProviderDomainsWithAccounts:(id)a3 withError:(id *)a4
{
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  const char *v19;
  uint64_t i;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char *v32;
  char *v33;
  NSObject *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  char *v41;
  NSObject *v42;
  char *v43;
  void *v44;
  int v45;
  NSObject *v46;
  char *v47;
  void *v48;
  char *v49;
  id v50;
  char *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  char *v55;
  int v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  char *v61;
  NSObject *v62;
  char *v63;
  void *v64;
  id *v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  int v80;
  void *v81;
  id v82;
  void *v83;
  NSObject *v84;
  const char *v86;
  const char *v87;
  const char *v88;
  __int128 v89;
  const char *v90;
  uint64_t v91;
  BRCAccountsManager *v92;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  _QWORD v100[6];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105[6];
  id v106;
  _QWORD v107[6];
  id v108;
  id v109;
  char v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id obj;
  uint64_t v116;
  _QWORD v117[4];
  id v118;
  _BYTE v119[128];
  _QWORD v120[2];
  uint8_t v121[128];
  uint8_t buf[4];
  const char *v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  id v127;
  __int16 v128;
  void *v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v96 = a3;
  v92 = self;
  if (-[BRCAccountsManager isInSyncBubble](self, "isInSyncBubble"))
  {
    v5 = 1;
    goto LABEL_117;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:].cold.3((uint64_t)v96);

  -[BRCAccountsManager _getEnterpriseProviderManager](self, "_getEnterpriseProviderManager");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  obj = 0;
  v116 = 0;
  v117[0] = &v116;
  v117[1] = 0x3032000000;
  v117[2] = __Block_byref_object_copy__38;
  v117[3] = __Block_byref_object_dispose__38;
  v118 = 0;
  objc_msgSend(v94, "br_getFPDomainsWithError:", &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v118, obj);
  if (*(_QWORD *)(v117[0] + 40))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:].cold.2((uint64_t)v117);

    v11 = *(id *)(v117[0] + 40);
    v5 = v11 == 0;
    v12 = v11;
    if (v11)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v86 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v123 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
        v124 = 2080;
        if (!a4)
          v86 = "(ignored by caller)";
        v125 = v86;
        v126 = 2112;
        v127 = v12;
        v128 = 2112;
        v129 = v13;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a4)
      goto LABEL_108;
    v15 = objc_retainAutorelease(v12);
    *a4 = v15;
    goto LABEL_116;
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
  v95 = v16;
  if (!v17)
    goto LABEL_81;
  v19 = "(passed to caller)";
  v97 = *(_QWORD *)v112;
  if (!a4)
    v19 = "(ignored by caller)";
  v90 = v19;
  v91 = *MEMORY[0x24BDD1128];
  *(_QWORD *)&v18 = 138412802;
  v89 = v18;
  do
  {
    v98 = v17;
    for (i = 0; i != v98; ++i)
    {
      if (*(_QWORD *)v112 != v97)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      if ((BRIsDefaultDomain() & 1) != 0)
        continue;
      v110 = 0;
      objc_msgSend(MEMORY[0x24BE175E0], "matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:", v21, v96, &v110);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (!v23)
      {
        v16 = v95;
        if (v110)
        {
          objc_msgSend(v21, "personaIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v105[1] = (id)MEMORY[0x24BDAC760];
          v105[2] = (id)3221225472;
          v105[3] = __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_48;
          v105[4] = &unk_24FE408B8;
          v105[5] = v21;
          v106 = v94;
          BRPerformWithPersonaAndError();

          v16 = v95;
        }
        continue;
      }
      objc_msgSend(v21, "personaIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "isEqualToString:", CFSTR("__defaultPersonaID__")))
      {

      }
      else
      {
        objc_msgSend(v21, "personaIdentifier");
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = 0;
          goto LABEL_31;
        }
      }
      if (_maintainExistingFileProviderDomainsWithAccounts_withError____personaOnceToken != -1)
        dispatch_once(&_maintainExistingFileProviderDomainsWithAccounts_withError____personaOnceToken, &__block_literal_global_44);
      v26 = (id)_maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona;
      v27 = 1;
LABEL_31:
      objc_msgSend(MEMORY[0x24BEBF268], "sharedManager", v89);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentPersona");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v109 = 0;
      objc_msgSend(v29, "userPersonaUniqueString");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30 == v26 || (objc_msgSend(v30, "isEqualToString:", v26) & 1) != 0)
      {
        v32 = 0;
        goto LABEL_34;
      }
      if (voucher_process_can_use_arbitrary_personas())
      {
        v108 = 0;
        v48 = (void *)objc_msgSend(v29, "copyCurrentPersonaContextWithError:", &v108);
        v49 = (char *)v108;
        v50 = v109;
        v109 = v48;

        if (v49)
        {
          brc_bread_crumbs();
          v51 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            v123 = v49;
            v124 = 2112;
            v125 = v51;
            _os_log_error_impl(&dword_230455000, v52, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", buf, 0x16u);
          }

        }
        objc_msgSend(v29, "generateAndRestorePersonaContextWithPersonaUniqueString:", v26);
        v32 = (char *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          brc_bread_crumbs();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, (os_log_type_t)0x90u))
          {
            objc_msgSend(v21, "personaIdentifier");
            v55 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v89;
            v123 = v55;
            v124 = 2112;
            v125 = v32;
            v126 = 2112;
            v127 = v53;
            _os_log_error_impl(&dword_230455000, v54, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

          }
LABEL_79:

        }
      }
      else
      {
        if (v27 && (objc_msgSend(v29, "isDataSeparatedPersona") & 1) == 0)
        {
          brc_bread_crumbs();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v123 = (const char *)v53;
            _os_log_debug_impl(&dword_230455000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", buf, 0xCu);
          }
          v32 = 0;
          goto LABEL_79;
        }
        brc_bread_crumbs();
        v61 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v123 = v61;
          _os_log_debug_impl(&dword_230455000, v62, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v91, 22, 0);
        v32 = (char *)objc_claimAutoreleasedReturnValue();
      }
LABEL_34:
      brc_bread_crumbs();
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v123 = (const char *)v21;
        v124 = 2112;
        v125 = v33;
        _os_log_impl(&dword_230455000, v34, OS_LOG_TYPE_INFO, "[INFO] Removing domain %@ since it doesn't have a backing AC account%@", buf, 0x16u);
      }

      v120[1] = 0;
      v120[0] = 0;
      objc_msgSend(v21, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = _br_parseUUIDString();

      if ((v36 & 1) == 0)
      {
        if (objc_msgSend(v21, "br_isCiconiaDomain"))
        {
          brc_bread_crumbs();
          v43 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "identifier");
            v47 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v123 = v47;
            v124 = 2112;
            v125 = v43;
            _os_log_impl(&dword_230455000, v46, OS_LOG_TYPE_DEFAULT, "[WARNING] We are removing the ciconia domain %@, not removing account data%@", buf, 0x16u);

          }
        }
        else
        {
          brc_bread_crumbs();
          v43 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v21, "identifier");
            v63 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v123 = v63;
            v124 = 2112;
            v125 = v43;
            _os_log_fault_impl(&dword_230455000, v46, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: domain identifier %@ isn't a UUID so not removing account data%@", buf, 0x16u);

          }
        }

        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "br_currentPersonaID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "personaIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqualToString:", v39);

      if (v40)
      {
        brc_bread_crumbs();
        v41 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v123 = v41;
          _os_log_debug_impl(&dword_230455000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] domain's persona still exists, removing account path%@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDD17C8], "br_currentSupportDir");
        v43 = (char *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "fileExistsAtPath:", v43);

          if (v45)
            BRCRecursiveRemove(v43);
        }
LABEL_57:

      }
      if ((objc_msgSend(v21, "isDataSeparatedDomain") & 1) != 0 || (objc_msgSend(v21, "isEnterpriseDomain") & 1) != 0)
        v56 = 1;
      else
        v56 = objc_msgSend(v21, "br_isCiconiaDomain");
      v107[0] = MEMORY[0x24BDAC760];
      v107[1] = 3221225472;
      v107[2] = 0x23060E000;
      v107[3] = &unk_24FE41790;
      v107[4] = v21;
      v107[5] = &v116;
      objc_msgSend(v94, "br_removeDomain:sync:completionHandler:", v21, v56 ^ 1u, v107);
      v57 = *(void **)(v117[0] + 40);
      if (v57)
      {
        v58 = v57;
        brc_bread_crumbs();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 136315906;
          v123 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
          v124 = 2080;
          v125 = v90;
          v126 = 2112;
          v127 = v58;
          v128 = 2112;
          v129 = v59;
          _os_log_error_impl(&dword_230455000, v60, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        if (a4)
          *a4 = objc_retainAutorelease(v58);

      }
      _BRRestorePersona();

      v16 = v95;
      if (v57)
      {
        v15 = v95;
        v5 = 0;
        v8 = v95;
        goto LABEL_116;
      }
    }
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
  }
  while (v17);
LABEL_81:

  -[BRCAccountsManager _getPrimaryProviderManager](v92, "_getPrimaryProviderManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (id *)(v117[0] + 40);
  v105[0] = *(id *)(v117[0] + 40);
  objc_msgSend(v64, "br_getFPDomainsWithError:", v105);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v65, v105[0]);

  if (*(_QWORD *)(v117[0] + 40))
  {
    brc_bread_crumbs();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, (os_log_type_t)0x90u))
      -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:].cold.1((uint64_t)v117);

    v68 = *(id *)(v117[0] + 40);
    v5 = v68 == 0;
    v12 = v68;
    if (v68)
    {
      brc_bread_crumbs();
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, (os_log_type_t)0x90u))
      {
        v87 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v123 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
        v124 = 2080;
        if (!a4)
          v87 = "(ignored by caller)";
        v125 = v87;
        v126 = 2112;
        v127 = v12;
        v128 = 2112;
        v129 = v69;
        _os_log_error_impl(&dword_230455000, v70, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
    {
      v15 = objc_retainAutorelease(v12);
      *a4 = v15;
      goto LABEL_115;
    }
    v94 = v64;
LABEL_108:
    v15 = v12;
  }
  else
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v71 = v8;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
    if (v72)
    {
      v73 = *(_QWORD *)v102;
      v74 = MEMORY[0x24BDAC760];
      while (2)
      {
        for (j = 0; j != v72; ++j)
        {
          if (*(_QWORD *)v102 != v73)
            objc_enumerationMutation(v71);
          v76 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
          if ((objc_msgSend(v76, "isReplicated", v89) & 1) != 0)
          {
            LOBYTE(v120[0]) = 0;
            objc_msgSend(MEMORY[0x24BE175E0], "matchDomainWithAccountAndStampDomainIfNeeded:withAccounts:persistDomain:", v76, v96, v120);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v77 == 0;

            if (v78)
            {
              if ((objc_msgSend(v76, "isDataSeparatedDomain") & 1) != 0
                || (objc_msgSend(v76, "isEnterpriseDomain") & 1) != 0)
              {
                v80 = 1;
              }
              else
              {
                v80 = objc_msgSend(v76, "br_isCiconiaDomain");
              }
              v100[0] = v74;
              v100[1] = 3221225472;
              v100[2] = __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_50;
              v100[3] = &unk_24FE41790;
              v100[4] = v76;
              v100[5] = &v116;
              objc_msgSend(v64, "br_removeDomain:sync:completionHandler:", v76, v80 ^ 1u, v100);
              v81 = *(void **)(v117[0] + 40);
              if (v81)
              {
                v82 = v81;
                brc_bread_crumbs();
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
                {
                  v88 = "(passed to caller)";
                  *(_DWORD *)buf = 136315906;
                  v123 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
                  v124 = 2080;
                  if (!a4)
                    v88 = "(ignored by caller)";
                  v125 = v88;
                  v126 = 2112;
                  v127 = v82;
                  v128 = 2112;
                  v129 = v83;
                  _os_log_error_impl(&dword_230455000, v84, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
                }

                if (a4)
                  *a4 = objc_retainAutorelease(v82);

                v5 = 0;
                goto LABEL_114;
              }
            }
            else if (LOBYTE(v120[0]))
            {
              objc_msgSend(v76, "personaIdentifier");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v64;
              BRPerformWithPersonaAndError();

            }
          }
        }
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
        v5 = 1;
        if (v72)
          continue;
        break;
      }
    }
    else
    {
      v5 = 1;
    }
LABEL_114:
    v15 = v71;
    v8 = v71;
LABEL_115:
    v94 = v64;
  }
LABEL_116:

  _Block_object_dispose(&v116, 8);
LABEL_117:

  return v5;
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona;
  _maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona = v0;

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Garbage Collected domain %@ with error - %@%@", (uint8_t *)&v9, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", buf, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_48_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "br_addDomain:completionHandler:");
  }

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_49(uint64_t a1, void *a2)
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
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Garbage Collected domain %@ with error - %@%@", (uint8_t *)&v9, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", buf, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_48_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "br_addDomain:completionHandler:");
  }

}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_52(uint64_t a1, void *a2)
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
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:(id)a3
{
  id v4;
  BRCAccountsManager *v5;
  _BOOL4 maintainedExistingFPDomains;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  maintainedExistingFPDomains = v5->_maintainedExistingFPDomains;
  v5->_maintainedExistingFPDomains = 1;
  objc_sync_exit(v5);

  if (!maintainedExistingFPDomains)
  {
    v11 = 0;
    v7 = -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:](v5, "_maintainExistingFileProviderDomainsWithAccounts:withError:", v4, &v11);
    v8 = v11;
    if ((v7 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCAccountsManager _maintainExistingFileProviderDomainsIfNeededWithAccounts:].cold.1((uint64_t)v8);

    }
  }

}

- (void)_scheduleExistingFileProviderDomainsMaintenanceWithAccounts:(id)a3
{
  id v4;
  BRCAccountsManager *v5;
  _BOOL4 maintainedExistingFPDomains;
  NSObject *maintainFPDomainsQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  maintainedExistingFPDomains = v5->_maintainedExistingFPDomains;
  objc_sync_exit(v5);

  if (!maintainedExistingFPDomains)
  {
    maintainFPDomainsQueue = v5->_maintainFPDomainsQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke;
    v8[3] = &unk_24FE3FA40;
    v8[4] = v5;
    v9 = v4;
    dispatch_async(maintainFPDomainsQueue, v8);

  }
}

void __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "_waitUntilFileProviderIsReady:", &v12);
  v4 = v12;
  if ((v3 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_53;
    block[3] = &unk_24FE3FA40;
    block[4] = v5;
    v11 = v6;
    dispatch_sync(v7, block);

  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1((uint64_t)v4);

  }
}

uint64_t __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_maintainExistingFileProviderDomainsIfNeededWithAccounts:", *(_QWORD *)(a1 + 40));
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2_cold_1();

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
}

- (void)enumerateAccountHandlerIfFinishedLoading:(id)a3
{
  if (self->_finishedLoadingAccounts)
    -[BRCAccountsManager enumerateAccountHandlers:](self, "enumerateAccountHandlers:", a3);
}

- (BOOL)_waitUntilFileProviderIsReady:(id *)a3
{
  void *v4;
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  const char *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "waitForFPToBeReadyToAcceptXPCWithError:", &v13);
  v5 = v13;
  v6 = objc_msgSend(v5, "br_isCloudDocsErrorCode:", 114);
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (!v5)
    {
      v7 = 0;
      v6 = 1;
      if (!a3)
        goto LABEL_9;
      goto LABEL_8;
    }
    if ((objc_msgSend(v5, "br_isPOSIXErrorCode:", 4) & 1) == 0)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        -[BRCAccountsManager _waitUntilFileProviderIsReady:].cold.1((uint64_t)v5);

      exit(1);
    }
    v7 = v5;
    brc_bread_crumbs();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v15 = "-[BRCAccountsManager _waitUntilFileProviderIsReady:]";
      v16 = 2080;
      if (!a3)
        v10 = "(ignored by caller)";
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v5;
      _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v7);
LABEL_9:

  return v6;
}

- (void)createAndLoadSessionWithACAccountID:(id)a3 createBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:].cold.2();

  }
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enableFileProviderBoosting");

  v26 = 0;
  v9 = -[BRCAccountsManager _waitUntilFileProviderIsReady:](self, "_waitUntilFileProviderIsReady:", &v26);
  v10 = v26;
  if (v9)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__38;
    v24 = __Block_byref_object_dispose__38;
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountWithIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "br_personaIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    BRPerformWithPersonaAndError();

    v14 = self->_accountHandlersByACAccountID;
    objc_sync_enter(v14);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountHandlersByACAccountID, "setObject:forKeyedSubscript:", v21[5], v6);
    objc_sync_exit(v14);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1((uint64_t)v10);

  }
}

void __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke_cold_1();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    brc_bread_crumbs();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke_cold_1();

  }
}

- (BOOL)waitForAccountLoadingSynchronouslyIfPossible:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  NSObject *queue;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  _QWORD block[5];
  id v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (*(_WORD *)&self->_loadAccountsRequested)
    goto LABEL_2;
  +[BRCFileProviderDaemonUtils sharedInstance](BRCFileProviderDaemonUtils, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "boostFileProvider");

  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      v14 = "[WARNING] We were unsuccessful in boosting FP during the startup flow%@";
      goto LABEL_13;
    }
LABEL_14:

    v7 = 0;
    goto LABEL_5;
  }
  if (!self->_finishedLoadingAccounts && !self->_loadAccountsRequested)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      v14 = "[WARNING] We still aren't in a state where load accounts was requested%@";
LABEL_13:
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_2:
  -[BRCAccountsManager accountHandlerForACAccountID:](self, "accountHandlerForACAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishedLoading");

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke;
    block[3] = &unk_24FE416D8;
    p_buf = &buf;
    block[4] = self;
    v16 = v4;
    dispatch_sync(queue, block);
    v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
LABEL_5:

  return v7;
}

void __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  NSObject *v4;

  v1 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "accountHandlerForACAccountID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(v1[1] + 8) + 24) = objc_msgSend(v2, "finishedLoading");

  if (!*(_BYTE *)(*(_QWORD *)(v1[1] + 8) + 24))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke_cold_1(v1);

  }
}

- (id)personaIdentifierForACAccountID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDB4398];
  v4 = a3;
  objc_msgSend(v3, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "br_personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createAccountHandlerForAccountID:(id)a3
{
  id v3;
  BRCAccountHandler *v4;

  v3 = a3;
  v4 = -[BRCAccountHandler initWithACAccountID:]([BRCAccountHandler alloc], "initWithACAccountID:", v3);

  return v4;
}

- (id)getOrCreateAccountHandlerForACAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "br_personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BRCurrentPersonaMatchesID();

  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager getOrCreateAccountHandlerForACAccount:].cold.1();

    goto LABEL_8;
  }
  v8 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountHandlersByACAccountID, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_accountHandlersByACAccountID, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountsManager _createAccountHandlerForAccountID:](self, "_createAccountHandlerForAccountID:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountHandlersByACAccountID, "setObject:forKeyedSubscript:", v10, v5);
  }
  objc_sync_exit(v8);

LABEL_11:
  return v10;
}

- (void)createSessionWithACAccountID:(id)a3 dsid:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *maintainFPDomainsQueue;
  id v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountWithIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  maintainFPDomainsQueue = self->_maintainFPDomainsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke;
  block[3] = &unk_24FE43888;
  block[4] = self;
  v20 = v8;
  v21 = v12;
  v22 = v9;
  v23 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v12;
  v17 = v8;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(maintainFPDomainsQueue, v18);

}

void __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  dispatch_block_t v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_2;
  block[3] = &unk_24FE43888;
  block[4] = v2;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v4, v5);

}

void __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__38;
  v11[4] = __Block_byref_object_dispose__38;
  v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_3;
  v4[3] = &unk_24FE47160;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v7 = v9;
  v6 = *(id *)(a1 + 56);
  v8 = v11;
  objc_msgSend(v2, "createAndLoadSessionWithACAccountID:createBlock:", v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);

}

id __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "getOrCreateAccountHandlerForACAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "createAccountSessionWithDSID:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_msgSend(v2, "startAndLoadAccountSynchronously:", *(_QWORD *)(a1 + 40));
  return v2;
}

- (void)updateAccountDisplayName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  BRCAccountsManager *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:].cold.2();

  }
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateAccountForPersonaCache");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke;
  block[3] = &unk_24FE40A80;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v2;
    _os_log_impl(&dword_230455000, v3, OS_LOG_TYPE_INFO, "[INFO] Updating account %@%@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__38;
  v18 = __Block_byref_object_dispose__38;
  v19 = 0;
  v5 = *(id *)(a1[5] + 8);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDataSeparated");

  if (v8)
  {
    objc_msgSend(v6, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "personaIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    BRPerformWithPersonaAndError();

    v11 = v15;
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v13, v14);
  _Block_object_dispose(buf, 8);

}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_56(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fixFileProviderDomainDecorations");

    BRPostAccountTokenChangedNotification();
  }

}

- (BOOL)destroySessionWithACAccountID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  char v8;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  BRCAccountsManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:].cold.2();

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = dispatch_group_create();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke;
  block[3] = &unk_24FE433F0;
  v13 = v4;
  v14 = self;
  v15 = &v16;
  v7 = v4;
  dispatch_sync(queue, block);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v2;
    _os_log_impl(&dword_230455000, v3, OS_LOG_TYPE_INFO, "[INFO] Logging out account %@%@", (uint8_t *)&v14, 0x16u);
  }

  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountWithIdentifier:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "br_personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "cleanupAccountDataForLoggedOutAccountWithPersona:", v9);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v11 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
    objc_sync_enter(v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v11);

    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_2();
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_1();
  }

}

- (void)waitUntilDeviceIsUnlocked
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't register notifications%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "_isDeviceUnlocked"))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  else
    syslog(5, "Device is locked - waiting\n");
}

uint64_t __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke_2(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke_63(uint64_t a1)
{
  uint64_t result;

  result = notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

- (void)_createSyncBubbleTasksIfNecessary
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_accountHandlersByACAccountID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "session");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientTruthWorkloop");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          block[0] = v8;
          block[1] = 3221225472;
          block[2] = __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke;
          block[3] = &unk_24FE3FA18;
          v13 = v10;
          dispatch_async_and_wait(v11, block);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "enumeratePrivateClientZones:", &__block_literal_global_65);
  objc_msgSend(*(id *)(a1 + 32), "enumerateSharedClientZones:", &__block_literal_global_67);
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

uint64_t __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "beginSyncBubbleActivityIfNecessary");
  return 1;
}

uint64_t __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "beginSyncBubbleActivityIfNecessary");
  return 1;
}

- (void)uploadContent
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "yes";
  if (!*(_BYTE *)(a1 + 33))
    v1 = "no";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v2, v3, "[DEBUG] Notified to upload content. resumed:%s%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_0();
}

- (void)willSwitchUser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Notified of a user switch%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __36__BRCAccountsManager_willSwitchUser__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 33))
  {
    if (!*(_QWORD *)(v2 + 40))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2();

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "_createSyncBubbleTasksIfNecessary");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "end");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

- (BOOL)retrySyncBubbleLaterIfNeededWithError:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  BRCAccountsManager *v9;

  v4 = a3;
  if (-[BRCAccountsManager isInSyncBubble](self, "isInSyncBubble")
    && objc_msgSend(v4, "brc_shouldRetryLater"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke;
    v7[3] = &unk_24FE3FA40;
    v8 = v4;
    v9 = self;
    if (retrySyncBubbleLaterIfNeededWithError__onceToken != -1)
      dispatch_once(&retrySyncBubbleLaterIfNeededWithError__onceToken, v7);

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("encountered error domain %@ code %ld"), v7, objc_msgSend(*(id *)(a1 + 32), "code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterStakeHolder:status:reason:", v6, 1, v8);

}

- (BRCBarrier)accountsLoadingBarrier
{
  return self->_accountsLoadingBarrier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_checkNeedsBubbleTask, 0);
  objc_storeStrong((id *)&self->_maintainFPDomainsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountHandlersByACAccountID, 0);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_fault_impl(&dword_230455000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", v4, 0x16u);

}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_230455000, v6, v4, "[DEBUG] No domain to remove found for %@%@", v5);

}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Got an error when trying to find a domain to remove: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] We don't have a domain in the account session, let's try to find a domain for account: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !session%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Can't adopt session's persona, it must have already been deleted.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v6, "[DEBUG] Removed domain %@%@", (uint8_t *)&v7);

}

void __34__BRCAccountsManager_loadAccounts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] We got an error from account store, we can't continue our loading sequence%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self->_checkNeedsBubbleTask%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_31_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Can't perform with account persona of %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed getting the list of FP domains: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed getting the list of enterprise FP domains: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Finding old domains. Current accounts: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_48_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Persisting domain %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Failed maintaining existing file provider domains: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed waiting for File Provider to be ready: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't adopt persona for the account handler. Skipping it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_waitUntilFileProviderIsReady:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Waiting without success for FP to accept XPCs: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)createAndLoadSessionWithACAccountID:createBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: acAccountID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't create and load the session because we can't adopt the persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self->_finishedLoadingAccounts%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Waited without success for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)getOrCreateAccountHandlerForACAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't create an account handler with the wrong persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Updating display name is not supported on non EDS account%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to destroy session during logout%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Destroyed session during logout successfully%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_isDeviceUnlocked
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "unlocked";
  if (a1 != 1)
    v1 = "locked";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v2, v3, "[DEBUG] device is %s%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_0();
}

void __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Encountered an error forcing us to try to retry the sync bubble later - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
