@implementation UAFSubscriptionStoreManager

+ (id)getSerialQueue
{
  if (_MergedGlobals_10 != -1)
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_185);
  return (id)qword_2540B1D20;
}

void __45__UAFSubscriptionStoreManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFSubscriptionStoreManager.Serial", 0);
  v1 = (void *)qword_2540B1D20;
  qword_2540B1D20 = (uint64_t)v0;

}

+ (id)_getManagerReadOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  UAFSubscriptionStoreManager *v5;

  v3 = a3;
  +[UAFCommonUtilities getDefaultStoragePath](UAFCommonUtilities, "getDefaultStoragePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[UAFSubscriptionStoreManager initWithDbDirPath:dbName:readOnly:allowCreate:]([UAFSubscriptionStoreManager alloc], "initWithDbDirPath:dbName:readOnly:allowCreate:", v4, CFSTR("/UAFAssetSubscriptions.db"), v3, v3 ^ 1);
  else
    v5 = 0;

  return v5;
}

+ (id)defaultManager
{
  if (qword_2540B1D28 != -1)
    dispatch_once(&qword_2540B1D28, &__block_literal_global_188);
  return (id)qword_2540B1D30;
}

void __45__UAFSubscriptionStoreManager_defaultManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UAFSubscriptionStoreManager _getManagerReadOnly:](UAFSubscriptionStoreManager, "_getManagerReadOnly:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_2540B1D30;
  qword_2540B1D30 = v0;

}

+ (id)writeManager
{
  if (qword_2540B1D38 != -1)
    dispatch_once(&qword_2540B1D38, &__block_literal_global_189_0);
  return (id)qword_2540B1D40;
}

uint64_t __43__UAFSubscriptionStoreManager_writeManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UAFSubscriptionStoreManager _getManagerReadOnly:](UAFSubscriptionStoreManager, "_getManagerReadOnly:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_2540B1D40;
  qword_2540B1D40 = v0;

  return objc_msgSend(MEMORY[0x24BE7A5D0], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_191_0);
}

uint64_t __43__UAFSubscriptionStoreManager_writeManager__block_invoke_2()
{
  NSObject *v0;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "+[UAFSubscriptionStoreManager writeManager]_block_invoke_2";
    _os_log_impl(&dword_229282000, v0, OS_LOG_TYPE_DEFAULT, "%s Device has been unlocked, performing database upgrade check", (uint8_t *)&v2, 0xCu);
  }

  return objc_msgSend((id)qword_2540B1D40, "performDbUpgradeToVersion:", 1);
}

- (UAFSubscriptionStoreManager)initWithDbDirPath:(id)a3 dbName:(id)a4
{
  return -[UAFSubscriptionStoreManager initWithDbDirPath:dbName:readOnly:allowCreate:](self, "initWithDbDirPath:dbName:readOnly:allowCreate:", a3, a4, 1, 0);
}

- (UAFSubscriptionStoreManager)initWithDbDirPath:(id)a3 dbName:(id)a4 readOnly:(BOOL)a5 allowCreate:(BOOL)a6
{
  id v10;
  __CFString *v11;
  UAFSubscriptionStoreManager *v12;
  UAFSubscriptionStoreManager *v13;
  const __CFString *v14;
  uint64_t v15;
  NSString *databaseName;
  uint64_t v17;
  NSString *oldDatabaseName;
  UAFSubscriptionStoreManager *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (__CFString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)UAFSubscriptionStoreManager;
  v12 = -[UAFSubscriptionStoreManager init](&v22, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_7;
  v12->_store = 0;
  v12->_updateCount = 0;
  if (v11)
    v14 = v11;
  else
    v14 = CFSTR("/UAFAssetSubscriptions.db");
  objc_msgSend(v10, "stringByAppendingString:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  databaseName = v13->_databaseName;
  v13->_databaseName = (NSString *)v15;

  objc_msgSend(v10, "stringByAppendingString:", CFSTR("UAFOldVersionDbName.db"));
  v17 = objc_claimAutoreleasedReturnValue();
  oldDatabaseName = v13->_oldDatabaseName;
  v13->_oldDatabaseName = (NSString *)v17;

  if (v13->_databaseName)
  {
    v13->_dbUpToDate = 0;
    v13->_readOnly = a5;
    v13->_allowCreate = a6;
LABEL_7:
    v19 = v13;
    goto LABEL_11;
  }
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[UAFSubscriptionStoreManager initWithDbDirPath:dbName:readOnly:allowCreate:]";
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v14;
    _os_log_error_impl(&dword_229282000, v20, OS_LOG_TYPE_ERROR, "%s Could not construct database path from %@ and %@", buf, 0x20u);
  }

  v19 = 0;
LABEL_11:

  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  +[UAFSubscriptionStoreManager getSerialQueue](UAFSubscriptionStoreManager, "getSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__UAFSubscriptionStoreManager_dealloc__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)UAFSubscriptionStoreManager;
  -[UAFSubscriptionStoreManager dealloc](&v4, sel_dealloc);
}

uint64_t __38__UAFSubscriptionStoreManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (void)_closeDatabase
{
  if (self->_store)
  {
    sqlite3_finalize(self->_writeSubscription);
    sqlite3_finalize(self->_readSubscriptionsForSubscriber);
    sqlite3_finalize(self->_readSubscription);
    sqlite3_finalize(self->_readAllSubscriptions);
    sqlite3_finalize(self->_readAllSubscribers);
    sqlite3_finalize(self->_removeSubscription);
    sqlite3_finalize(self->_removeAllSubscriptions);
    sqlite3_finalize(self->_fetchExpiredSubscriptions);
    sqlite3_finalize(self->_setSystemAssetSetUsages);
    sqlite3_finalize(self->_fetchSystemAssetSetUsages);
    sqlite3_finalize(self->_fetchAllSystemAssetSetUsages);
    sqlite3_finalize(self->_clearSystemAssetSetUsages);
    sqlite3_finalize(self->_removeAllSystemAssetSetUsages);
    sqlite3_finalize(self->_setDbVersion);
    sqlite3_finalize(self->_readDbVersion);
    sqlite3_finalize(self->_readConfigurationKey);
    sqlite3_finalize(self->_writeConfigurationKey);
    sqlite3_finalize(self->_fetchAllConfiguration);
    sqlite3_close_v2(self->_store);
    self->_store = 0;
  }
}

- (BOOL)_openDatabase:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  _BOOL4 readOnly;
  char v11;
  id v12;
  NSObject *v13;
  int v14;
  int v15;
  NSObject *v16;
  sqlite3 **p_store;
  int v18;
  sqlite3 *store;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  char v23;
  int v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  NSObject *v29;
  int v30;
  int v31;
  NSObject *v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  int v37;
  NSObject *v38;
  int v39;
  int v40;
  NSObject *v41;
  int v42;
  int v43;
  NSObject *v44;
  int v45;
  int v46;
  NSObject *v47;
  int v48;
  int v49;
  NSObject *v50;
  int v51;
  int v52;
  NSObject *v53;
  int v54;
  int v55;
  NSObject *v56;
  int v57;
  int v58;
  NSObject *v59;
  int v60;
  int v61;
  NSObject *v62;
  int v63;
  int v64;
  NSObject *v65;
  int v66;
  int v67;
  NSObject *v68;
  int v69;
  int v70;
  NSObject *v71;
  int v72;
  int v73;
  NSObject *v74;
  int v75;
  int v76;
  NSObject *v77;
  NSObject *v78;
  BOOL v79;
  void *v80;
  NSObject *v81;
  int v83;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  id v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  _QWORD v109[2];
  uint64_t v110;
  _QWORD v111[2];

  v111[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (v4 = self->_databaseName) != 0)
  {
    -[NSObject stringByDeletingLastPathComponent](v4, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked"))
    {
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
        _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Attempt to open database before class c unlock", buf, 0xCu);
      }
LABEL_115:

      v79 = 0;
LABEL_116:

      goto LABEL_117;
    }
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v4);
    v9 = v8;
    readOnly = self->_readOnly;
    if (!self->_readOnly && (v8 & 1) == 0 && v6)
    {
      if (!self->_allowCreate)
        goto LABEL_17;
      v103 = 0;
      v11 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v103);
      v12 = v103;
      if ((v11 & 1) == 0)
      {
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
          v106 = 2112;
          v107 = (const char *)v6;
          v108 = 2112;
          v109[0] = v12;
          _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, "%s Could not create database directory %@: %@", buf, 0x20u);
        }

      }
      readOnly = self->_readOnly;
    }
    if (readOnly)
    {
      v14 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v14 = 2;
LABEL_18:
    if (self->_allowCreate)
      v15 = v14 | 4;
    else
      v15 = v14;
    v16 = objc_retainAutorelease(v4);
    p_store = &self->_store;
    v18 = sqlite3_open_v2((const char *)-[NSObject UTF8String](v16, "UTF8String"), &self->_store, v15, 0);
    store = self->_store;
    if (v18)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = v18;
      v110 = *MEMORY[0x24BDD0FC8];
      if (store)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_errmsg(store));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
LABEL_108:
        v111[0] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, &v110, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("SQLITE"), v21, v80);
        v7 = objc_claimAutoreleasedReturnValue();

        if ((v23 & 1) == 0)
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
          v106 = 2112;
          v107 = (const char *)v16;
          v108 = 2112;
          v109[0] = v7;
          _os_log_error_impl(&dword_229282000, v81, OS_LOG_TYPE_ERROR, "%s Could not open database (%@): %@", buf, 0x20u);
        }

        if (*p_store)
          sqlite3_close(*p_store);
        *p_store = 0;
        goto LABEL_115;
      }
    }
    else
    {
      if (store)
      {
        sqlite3_busy_timeout(store, 60000);
        if (!self->_readOnly)
        {
          -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "CREATE TABLE IF NOT EXISTS Subscriptions (k0 TEXT, k1 TEXT, k2 BLOB, k3 REAL)");
          -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "CREATE UNIQUE INDEX IF NOT EXISTS subscriptionIndex on Subscriptions (k0, k1)");
          -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "CREATE TABLE IF NOT EXISTS SystemAssetSetUsages (k0 TEXT, k1 BLOB)");
          -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "CREATE UNIQUE INDEX IF NOT EXISTS systemAssetSetUsageIndex on SystemAssetSetUsages (k0)");
          -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "CREATE TABLE IF NOT EXISTS DbVersion (k0 INTEGER)");
          -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "CREATE TABLE IF NOT EXISTS SystemConfiguration (k0 TEXT PRIMARY KEY NOT NULL, k1 TEXT NOT NULL)");
        }
        v24 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO Subscriptions (k0, k1, k2, k3) VALUES (?, ?, ?, ?)", 73, &self->_writeSubscription, 0);
        if (v24)
        {
          v25 = v24;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v85 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "INSERT OR REPLACE INTO Subscriptions (k0, k1, k2, k3) VALUES (?, ?, ?, ?)";
            v108 = 1024;
            LODWORD(v109[0]) = v25;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v85;
            _os_log_error_impl(&dword_229282000, v26, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v27 = sqlite3_prepare_v2(self->_store, "SELECT k2 FROM Subscriptions WHERE k0 = ?", 41, &self->_readSubscriptionsForSubscriber, 0);
        if (v27)
        {
          v28 = v27;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v86 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k2 FROM Subscriptions WHERE k0 = ?";
            v108 = 1024;
            LODWORD(v109[0]) = v28;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v86;
            _os_log_error_impl(&dword_229282000, v29, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v30 = sqlite3_prepare_v2(self->_store, "SELECT k2 FROM Subscriptions WHERE k0 = ? AND k1 = ?", 52, &self->_readSubscription, 0);
        if (v30)
        {
          v31 = v30;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v87 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k2 FROM Subscriptions WHERE k0 = ? AND k1 = ?";
            v108 = 1024;
            LODWORD(v109[0]) = v31;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v87;
            _os_log_error_impl(&dword_229282000, v32, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v33 = sqlite3_prepare_v2(self->_store, "SELECT k2 FROM Subscriptions", 28, &self->_readAllSubscriptions, 0);
        if (v33)
        {
          v34 = v33;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v88 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k2 FROM Subscriptions";
            v108 = 1024;
            LODWORD(v109[0]) = v34;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v88;
            _os_log_error_impl(&dword_229282000, v35, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v36 = sqlite3_prepare_v2(self->_store, "SELECT DISTINCT k0 FROM Subscriptions", 37, &self->_readAllSubscribers, 0);
        if (v36)
        {
          v37 = v36;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v89 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT DISTINCT k0 FROM Subscriptions";
            v108 = 1024;
            LODWORD(v109[0]) = v37;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v89;
            _os_log_error_impl(&dword_229282000, v38, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v39 = sqlite3_prepare_v2(self->_store, "DELETE FROM Subscriptions WHERE k0 = ? AND k1 = ?", 49, &self->_removeSubscription, 0);
        if (v39)
        {
          v40 = v39;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v90 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "DELETE FROM Subscriptions WHERE k0 = ? AND k1 = ?";
            v108 = 1024;
            LODWORD(v109[0]) = v40;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v90;
            _os_log_error_impl(&dword_229282000, v41, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v42 = sqlite3_prepare_v2(self->_store, "DELETE FROM Subscriptions", 25, &self->_removeAllSubscriptions, 0);
        if (v42)
        {
          v43 = v42;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v91 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "DELETE FROM Subscriptions";
            v108 = 1024;
            LODWORD(v109[0]) = v43;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v91;
            _os_log_error_impl(&dword_229282000, v44, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v45 = sqlite3_prepare_v2(self->_store, "SELECT k0, k2 FROM Subscriptions WHERE k3 <> 0.0 AND datetime(k3, 'unixepoch') < datetime('now')", 96, &self->_fetchExpiredSubscriptions, 0);
        if (v45)
        {
          v46 = v45;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v92 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k0, k2 FROM Subscriptions WHERE k3 <> 0.0 AND datetime(k3, 'unixepoch') < datetime('now')";
            v108 = 1024;
            LODWORD(v109[0]) = v46;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v92;
            _os_log_error_impl(&dword_229282000, v47, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v48 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO SystemAssetSetUsages (k0, k1) VALUES (?, ?)", 66, &self->_setSystemAssetSetUsages, 0);
        if (v48)
        {
          v49 = v48;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v93 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "INSERT OR REPLACE INTO SystemAssetSetUsages (k0, k1) VALUES (?, ?)";
            v108 = 1024;
            LODWORD(v109[0]) = v49;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v93;
            _os_log_error_impl(&dword_229282000, v50, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v51 = sqlite3_prepare_v2(self->_store, "SELECT k1 FROM SystemAssetSetUsages WHERE k0 = ?", 48, &self->_fetchSystemAssetSetUsages, 0);
        if (v51)
        {
          v52 = v51;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v94 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k1 FROM SystemAssetSetUsages WHERE k0 = ?";
            v108 = 1024;
            LODWORD(v109[0]) = v52;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v94;
            _os_log_error_impl(&dword_229282000, v53, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v54 = sqlite3_prepare_v2(self->_store, "SELECT k0, k1 FROM SystemAssetSetUsages", 39, &self->_fetchAllSystemAssetSetUsages, 0);
        if (v54)
        {
          v55 = v54;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v95 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k0, k1 FROM SystemAssetSetUsages";
            v108 = 1024;
            LODWORD(v109[0]) = v55;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v95;
            _os_log_error_impl(&dword_229282000, v56, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v57 = sqlite3_prepare_v2(self->_store, "DELETE FROM SystemAssetSetUsages WHERE k0 = ?", 45, &self->_clearSystemAssetSetUsages, 0);
        if (v57)
        {
          v58 = v57;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v96 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "DELETE FROM SystemAssetSetUsages WHERE k0 = ?";
            v108 = 1024;
            LODWORD(v109[0]) = v58;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v96;
            _os_log_error_impl(&dword_229282000, v59, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v60 = sqlite3_prepare_v2(self->_store, "DELETE FROM SystemAssetSetUsages", 32, &self->_removeAllSystemAssetSetUsages, 0);
        if (v60)
        {
          v61 = v60;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v97 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "DELETE FROM SystemAssetSetUsages";
            v108 = 1024;
            LODWORD(v109[0]) = v61;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v97;
            _os_log_error_impl(&dword_229282000, v62, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v63 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO DbVersion (k0) VALUES (?)", 48, &self->_setDbVersion, 0);
        if (v63)
        {
          v64 = v63;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v98 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "INSERT OR REPLACE INTO DbVersion (k0) VALUES (?)";
            v108 = 1024;
            LODWORD(v109[0]) = v64;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v98;
            _os_log_error_impl(&dword_229282000, v65, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v66 = sqlite3_prepare_v2(self->_store, "SELECT * FROM DbVersion ORDER BY k0 DESC LIMIT 1", 48, &self->_readDbVersion, 0);
        if (v66)
        {
          v67 = v66;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v99 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT * FROM DbVersion ORDER BY k0 DESC LIMIT 1";
            v108 = 1024;
            LODWORD(v109[0]) = v67;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v99;
            _os_log_error_impl(&dword_229282000, v68, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v69 = sqlite3_prepare_v2(self->_store, "SELECT k1 FROM SystemConfiguration WHERE k0 = ?", 47, &self->_readConfigurationKey, 0);
        if (v69)
        {
          v70 = v69;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            v100 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k1 FROM SystemConfiguration WHERE k0 = ?";
            v108 = 1024;
            LODWORD(v109[0]) = v70;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v100;
            _os_log_error_impl(&dword_229282000, v71, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v72 = sqlite3_prepare_v2(self->_store, "INSERT OR REPLACE INTO SystemConfiguration (k0, k1) VALUES (?, ?)", 65, &self->_writeConfigurationKey, 0);
        if (v72)
        {
          v73 = v72;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v101 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "INSERT OR REPLACE INTO SystemConfiguration (k0, k1) VALUES (?, ?)";
            v108 = 1024;
            LODWORD(v109[0]) = v73;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v101;
            _os_log_error_impl(&dword_229282000, v74, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        v75 = sqlite3_prepare_v2(self->_store, "SELECT k0, k1 FROM SystemConfiguration", 38, &self->_fetchAllConfiguration, 0);
        if (v75)
        {
          v76 = v75;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v102 = sqlite3_errmsg(*p_store);
            *(_DWORD *)buf = 136315906;
            v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
            v106 = 2080;
            v107 = "SELECT k0, k1 FROM SystemConfiguration";
            v108 = 1024;
            LODWORD(v109[0]) = v76;
            WORD2(v109[0]) = 2080;
            *(_QWORD *)((char *)v109 + 6) = v102;
            _os_log_error_impl(&dword_229282000, v77, OS_LOG_TYPE_ERROR, "%s SQL error while preparing statement: %s, SQL error: (%d) %s", buf, 0x26u);
          }

        }
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
          v106 = 2112;
          v107 = (const char *)v16;
          v108 = 1024;
          LODWORD(v109[0]) = v9;
          _os_log_impl(&dword_229282000, v78, OS_LOG_TYPE_DEFAULT, "%s Opened database (%@), database existed:%d", buf, 0x1Cu);
        }

        if ((v9 & 1) != 0)
        {
          v79 = 1;
        }
        else
        {
          v83 = -[UAFSubscriptionStoreManager _setDbVersion:](self, "_setDbVersion:", 1);
          v79 = v83 == 101 || v83 == 0;
        }
        goto LABEL_116;
      }
      v21 = 0;
      v20 = (void *)MEMORY[0x24BDD1540];
      v110 = *MEMORY[0x24BDD0FC8];
    }
    v22 = &stru_24F1F9848;
    v23 = 1;
    goto LABEL_108;
  }
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v105 = "-[UAFSubscriptionStoreManager _openDatabase:]";
    _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s nil database filename", buf, 0xCu);
  }
  v79 = 0;
LABEL_117:

  return v79;
}

- (int)_beginDatabaseTransaction
{
  int v3;
  NSObject *v4;
  const char *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "BEGIN TRANSACTION;");
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errmsg(self->_store);
      v7 = sqlite3_extended_errcode(self->_store);
      v8 = 136315906;
      v9 = "-[UAFSubscriptionStoreManager _beginDatabaseTransaction]";
      v10 = 1024;
      v11 = v3;
      v12 = 2080;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s Failed to begin transaction with error SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v8, 0x22u);
    }

  }
  return v3;
}

- (int)_endDatabaseTransaction
{
  int v3;
  NSObject *v4;
  const char *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "COMMIT;");
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errmsg(self->_store);
      v7 = sqlite3_extended_errcode(self->_store);
      v8 = 136315906;
      v9 = "-[UAFSubscriptionStoreManager _endDatabaseTransaction]";
      v10 = 1024;
      v11 = v3;
      v12 = 2080;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s Failed to commit transaction with error SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v8, 0x22u);
    }

  }
  return v3;
}

- (int)_rollbackDatabaseTransaction
{
  int v3;
  NSObject *v4;
  const char *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[UAFSubscriptionStoreManager executeSQL:](self, "executeSQL:", "ROLLBACK;");
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errmsg(self->_store);
      v7 = sqlite3_extended_errcode(self->_store);
      v8 = 136315906;
      v9 = "-[UAFSubscriptionStoreManager _rollbackDatabaseTransaction]";
      v10 = 1024;
      v11 = v3;
      v12 = 2080;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s Failed to rollback transaction with error SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v8, 0x22u);
    }

  }
  return v3;
}

- (BOOL)_isUsageLimitExceeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSubscriptionStoreManager _getSubscriptions:](self, "_getSubscriptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applySubscriptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isUsageLimitExceeded:", v8);

  return (char)v4;
}

- (BOOL)_createDbVersionTable
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  BOOL v7;
  BOOL v8;
  int v10;
  const char *v11;
  int v12;
  const char *v13;
  const char *v14;
  int v15;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS DbVersion (k0 INTEGER)"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ppStmt = 0;
  v4 = sqlite3_prepare_v2(self->_store, (const char *)objc_msgSend(v3, "UTF8String"), -1, &ppStmt, 0);
  if (v4)
  {
    v5 = v4;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v14 = sqlite3_errmsg(self->_store);
    v15 = sqlite3_extended_errcode(self->_store);
    *(_DWORD *)buf = 136315906;
    v18 = "-[UAFSubscriptionStoreManager _createDbVersionTable]";
    v19 = 1024;
    v20 = v5;
    v21 = 2080;
    v22 = v14;
    v23 = 1024;
    v24 = v15;
    v13 = "%s Query preparation to create DbVersion table failed SQLite error: %d (%s, Extended: %d)";
LABEL_16:
    _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, v13, buf, 0x22u);
    goto LABEL_3;
  }
  v10 = sqlite3_step(ppStmt);
  v5 = v10;
  if (!v10 || v10 == 101)
    goto LABEL_4;
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = sqlite3_errmsg(self->_store);
    v12 = sqlite3_extended_errcode(self->_store);
    *(_DWORD *)buf = 136315906;
    v18 = "-[UAFSubscriptionStoreManager _createDbVersionTable]";
    v19 = 1024;
    v20 = v5;
    v21 = 2080;
    v22 = v11;
    v23 = 1024;
    v24 = v12;
    v13 = "%s Creating DbVersion table failed SQLite error: %d (%s, Extended: %d)";
    goto LABEL_16;
  }
LABEL_3:

LABEL_4:
  sqlite3_reset(ppStmt);
  sqlite3_finalize(ppStmt);
  if (v5)
    v7 = v5 == 101;
  else
    v7 = 1;
  v8 = v7;

  return v8;
}

- (BOOL)_checkDbVersion
{
  int v3;
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[UAFSubscriptionStoreManager _createDbVersionTable](self, "_createDbVersionTable"))
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v11 = 136315138;
    v12 = "-[UAFSubscriptionStoreManager _checkDbVersion]";
    v7 = "%s Creation or checking of DbVersion table failed";
    goto LABEL_12;
  }
  v3 = sqlite3_step(self->_readDbVersion);
  if ((v3 & 0xFFFFFFFE) != 0x64)
  {
    if (!v3)
      goto LABEL_16;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v11 = 136315138;
    v12 = "-[UAFSubscriptionStoreManager _checkDbVersion]";
    v7 = "%s Reading db version from DbVersion table failed";
LABEL_12:
    v8 = v6;
    v9 = 12;
    goto LABEL_13;
  }
  v4 = sqlite3_column_int(self->_readDbVersion, 0);
  if (v4 == 1)
    return v4;
  v5 = v4;
  if (v4 >= 2)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = "-[UAFSubscriptionStoreManager _checkDbVersion]";
      v13 = 1024;
      v14 = 1;
      v15 = 1024;
      v16 = v5;
      v7 = "%s Db upgrade requested a version %d lesser than the current stored version %d";
      v8 = v6;
      v9 = 24;
LABEL_13:
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
LABEL_14:

    LOBYTE(v4) = 0;
    return v4;
  }
LABEL_16:
  LOBYTE(v4) = 0;
  self->_dbUpToDate = 0;
  return v4;
}

- (BOOL)subscribe:(id)a3 subscriptions:(id)a4 expires:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  BOOL v17;
  BOOL v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__UAFSubscriptionStoreManager_subscribe_subscriptions_expires___block_invoke;
  v20[3] = &unk_24F1F7F00;
  v20[4] = self;
  v21 = v9;
  v22 = v8;
  v23 = v10;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("subscribe for Subscriber: %@"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v20, 1, v15);

  if (v16)
    v17 = v16 == 101;
  else
    v17 = 1;
  v18 = v17;

  return v18;
}

uint64_t __63__UAFSubscriptionStoreManager_subscribe_subscriptions_expires___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_isUsageLimitExceeded:", *(_QWORD *)(a1 + 40)))
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v20 = "-[UAFSubscriptionStoreManager subscribe:subscriptions:expires:]_block_invoke";
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Denying subscription due to exceeding usage limits for subscriber \"%@\", buf, 0x16u);
    }
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = *(id *)(a1 + 40);
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (!v6)
    {
LABEL_14:
      v4 = 0;
      goto LABEL_5;
    }
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_8:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "name", (_QWORD)v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v11, "_subscribeSubscription:subscriptionName:assetSetSubscription:expires:", v12, v13, v10, *(_QWORD *)(a1 + 56));

      if (!(_DWORD)v10)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  v4 = 3;
LABEL_5:

  return v4;
}

- (BOOL)_subscribeSubscription:(id)a3 subscriptionName:(id)a4 assetSetSubscription:(id)a5 expires:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  int v20;
  const char *v21;
  int v22;
  int v23;
  NSObject *v24;
  const char *v25;
  int v26;
  const char *v27;
  int v28;
  BOOL v29;
  BOOL v30;
  int v32;
  NSObject *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  const char *v38;
  int v39;
  const char *v40;
  int v41;
  int v42;
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", self->_writeSubscription, 1, v10);
  if (v14)
  {
    v15 = v14;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sqlite3_errmsg(self->_store);
      v18 = sqlite3_extended_errcode(self->_store);
      v42 = 136316418;
      v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      v44 = 2114;
      v45 = v10;
      v46 = 2112;
      v47 = v11;
      v48 = 1024;
      v49 = v15;
      v50 = 2080;
      v51 = v17;
      v52 = 1024;
      v53 = v18;
      v19 = "%s Binding subscriber name to the write subscription sql query failed for Subscriber: %{public}@, Subscripti"
            "onName: '%@' SQLite error: %d (%s, Extended: %d)";
LABEL_7:
      _os_log_error_impl(&dword_229282000, v16, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v42, 0x36u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v20 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", self->_writeSubscription, 2, v11);
  if (v20)
  {
    v15 = v20;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = sqlite3_errmsg(self->_store);
      v22 = sqlite3_extended_errcode(self->_store);
      v42 = 136316418;
      v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      v44 = 2114;
      v45 = v10;
      v46 = 2112;
      v47 = v11;
      v48 = 1024;
      v49 = v15;
      v50 = 2080;
      v51 = v21;
      v52 = 1024;
      v53 = v22;
      v19 = "%s Binding subscription name to the write subscription sql query failed for Subscriber: %{public}@, Subscrip"
            "tionName: '%@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_7;
    }
LABEL_17:

    goto LABEL_18;
  }
  -[UAFSubscriptionStoreManager _dataFromUAFAssetSubscription:](self, "_dataFromUAFAssetSubscription:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v23 = -[UAFSubscriptionStoreManager bindData:col:data:](self, "bindData:col:data:", self->_writeSubscription, 3, v16);
    if (v23)
    {
      v15 = v23;
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = sqlite3_errmsg(self->_store);
        v26 = sqlite3_extended_errcode(self->_store);
        v42 = 136316418;
        v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
        v44 = 2114;
        v45 = v10;
        v46 = 2112;
        v47 = v11;
        v48 = 1024;
        v49 = v15;
        v50 = 2080;
        v51 = v25;
        v52 = 1024;
        v53 = v26;
        v27 = "%s Binding asset set subscription data to the write subscription sql query failed for Subscriber: '%{publi"
              "c}@', SubscriptionName: '%@' SQLite error: %d (%s, Extended: %d)";
LABEL_32:
        _os_log_error_impl(&dword_229282000, v24, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v42, 0x36u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }

  v16 = v13;
  if (!v16)
  {
    objc_msgSend(v12, "expiration");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v28 = -[UAFSubscriptionStoreManager bindDate:col:date:](self, "bindDate:col:date:", self->_writeSubscription, 4, v16);
  if (v28)
  {
    v15 = v28;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v38 = sqlite3_errmsg(self->_store);
      v39 = sqlite3_extended_errcode(self->_store);
      v42 = 136316418;
      v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      v44 = 2114;
      v45 = v10;
      v46 = 2112;
      v47 = v11;
      v48 = 1024;
      v49 = v15;
      v50 = 2080;
      v51 = v38;
      v52 = 1024;
      v53 = v39;
      v27 = "%s Binding expiry field to the write subscription sql query failed for Subscriber: '%{public}@', Subscriptio"
            "nName: '%@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_32;
    }
LABEL_16:

    goto LABEL_17;
  }

  v32 = sqlite3_step(self->_writeSubscription);
  v15 = v32;
  if (v32 && v32 != 101)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v40 = sqlite3_errmsg(self->_store);
      v41 = sqlite3_extended_errcode(self->_store);
      v42 = 136316418;
      v43 = "-[UAFSubscriptionStoreManager _subscribeSubscription:subscriptionName:assetSetSubscription:expires:]";
      v44 = 2114;
      v45 = v10;
      v46 = 2112;
      v47 = v11;
      v48 = 1024;
      v49 = v15;
      v50 = 2080;
      v51 = v40;
      v52 = 1024;
      v53 = v41;
      _os_log_error_impl(&dword_229282000, v33, OS_LOG_TYPE_ERROR, "%s Executing write subscription failed for Subscriber: '%{public}@', SubscriptionName: '%@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v42, 0x36u);
    }

    v34 = UAFLogContextStorage;
    v35 = kUAFABCDatabaseFailure;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_extended_errcode(self->_store));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    UAFFaultCapture(v34, (uint64_t)v35, (uint64_t)CFSTR("subscription"), (uint64_t)v37);

  }
  else
  {
    ++self->_updateCount;
  }
LABEL_18:
  sqlite3_reset(self->_writeSubscription);
  sqlite3_clear_bindings(self->_writeSubscription);
  if (v15)
    v29 = v15 == 101;
  else
    v29 = 1;
  v30 = v29;

  return v30;
}

- (id)_getSubscription:(sqlite3_stmt *)a3
{
  void *v4;
  void *v5;

  -[UAFSubscriptionStoreManager readData:col:](self, "readData:col:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UAFSubscriptionStoreManager _uafAssetSetSubscriptionFromData:](self, "_uafAssetSetSubscriptionFromData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_getSubscriptions:(sqlite3_stmt *)a3 subscriptionsFor:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (sqlite3_step(a3) == 100)
  {
    *(_QWORD *)&v8 = 136315650;
    v13 = v8;
    do
    {
      -[UAFSubscriptionStoreManager _getSubscription:](self, "_getSubscription:", a3, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "addObject:", v9);
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = sqlite3_errmsg(self->_store);
          *(_DWORD *)buf = v13;
          v15 = "-[UAFSubscriptionStoreManager _getSubscriptions:subscriptionsFor:]";
          v16 = 2114;
          v17 = v6;
          v18 = 2080;
          v19 = v11;
          _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Failed to read subscription for %{public}@: %s", buf, 0x20u);
        }

      }
    }
    while (sqlite3_step(a3) == 100);
  }
  sqlite3_reset(a3);
  sqlite3_clear_bindings(a3);

  return v7;
}

- (id)getSubscriptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__UAFSubscriptionStoreManager_getSubscriptions___block_invoke;
  v8[3] = &unk_24F1F7FF0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v8, 0, CFSTR("get subscriptions"));
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __48__UAFSubscriptionStoreManager_getSubscriptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getSubscriptions:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

- (id)_getSubscriptions:(id)a3
{
  id v4;
  sqlite3_stmt **p_readAllSubscriptions;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  const char *v11;
  int v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    p_readAllSubscriptions = &self->_readAllSubscriptions;
    goto LABEL_7;
  }
  p_readAllSubscriptions = &self->_readSubscriptionsForSubscriber;
  v6 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", self->_readSubscriptionsForSubscriber, 1, v4);
  if (!v6)
  {
LABEL_7:
    -[UAFSubscriptionStoreManager _getSubscriptions:subscriptionsFor:](self, "_getSubscriptions:subscriptionsFor:", *p_readAllSubscriptions, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = v6;
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = sqlite3_errmsg(self->_store);
    v12 = sqlite3_extended_errcode(self->_store);
    v13 = 136316162;
    v14 = "-[UAFSubscriptionStoreManager _getSubscriptions:]";
    v15 = 2114;
    v16 = v4;
    v17 = 1024;
    v18 = v7;
    v19 = 2080;
    v20 = v11;
    v21 = 1024;
    v22 = v12;
    _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s Binding subscription name to the get subscriptions query failed for Subscriber: '%{public}@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v13, 0x2Cu);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (id)getSubscription:(id)a3 subscriber:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__UAFSubscriptionStoreManager_getSubscription_subscriber___block_invoke;
  v12[3] = &unk_24F1F7F50;
  v15 = &v16;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v12, 0, CFSTR("get subscription"));
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __58__UAFSubscriptionStoreManager_getSubscription_subscriber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getSubscription:subscription:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

- (id)_getSubscription:(id)a3 subscription:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *readSubscription;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  int v15;
  int v17;
  const char *v19;
  int v20;
  const char *v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  readSubscription = self->_readSubscription;
  v9 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", readSubscription, 1, v6);
  if (v9)
  {
    v10 = v9;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
  }
  else
  {
    v12 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", readSubscription, 2, v7);
    if (v12)
    {
      v10 = v12;
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_16:
        v22 = sqlite3_errmsg(self->_store);
        v23 = sqlite3_extended_errcode(self->_store);
        v24 = 136316418;
        v25 = "-[UAFSubscriptionStoreManager _getSubscription:subscription:]";
        v26 = 2114;
        v27 = v6;
        v28 = 2114;
        v29 = v7;
        v30 = 1024;
        v31 = v10;
        v32 = 2080;
        v33 = v22;
        v34 = 1024;
        v35 = v23;
        v21 = "%s Error binding read subscription for '%{public}@' '%{public}@' SQLite error: %d (%s, Extended: %d)";
        goto LABEL_17;
      }
    }
    else
    {
      v15 = sqlite3_step(readSubscription);
      if ((v15 - 100) < 2 || v15 == 0)
      {
        -[UAFSubscriptionStoreManager _getSubscription:](self, "_getSubscription:", readSubscription);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      v17 = v15;
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v19 = sqlite3_errmsg(self->_store);
        v20 = sqlite3_extended_errcode(self->_store);
        v24 = 136316418;
        v25 = "-[UAFSubscriptionStoreManager _getSubscription:subscription:]";
        v26 = 2114;
        v27 = v6;
        v28 = 2114;
        v29 = v7;
        v30 = 1024;
        v31 = v17;
        v32 = 2080;
        v33 = v19;
        v34 = 1024;
        v35 = v20;
        v21 = "%s Error executing read subscription for '%{public}@' '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_17:
        _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v24, 0x36u);
      }
    }
  }

  v13 = 0;
LABEL_7:
  sqlite3_reset(readSubscription);
  sqlite3_clear_bindings(readSubscription);

  return v13;
}

- (id)getSubscribers
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__UAFSubscriptionStoreManager_getSubscribers__block_invoke;
  v5[3] = &unk_24F1F7F28;
  v5[4] = self;
  v5[5] = &v6;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v5, 0, CFSTR("get subscribers"));
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __45__UAFSubscriptionStoreManager_getSubscribers__block_invoke(uint64_t a1)
{
  int v2;
  __int128 v3;
  _QWORD *v4;
  sqlite3_stmt *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int128 v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (sqlite3_stmt *)v4[6];
  if (v2 == 100)
  {
    *(_QWORD *)&v3 = 136315394;
    v11 = v3;
    do
    {
      objc_msgSend(v4, "readString:col:", v5, 0, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v9 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
          *(_DWORD *)buf = v11;
          v13 = "-[UAFSubscriptionStoreManager getSubscribers]_block_invoke";
          v14 = 2080;
          v15 = v9;
          _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Failed to read subscriber, SQL error: %s", buf, 0x16u);
        }

      }
      v8 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 48));
      v4 = *(_QWORD **)(a1 + 32);
      v5 = (sqlite3_stmt *)v4[6];
    }
    while (v8 == 100);
  }
  sqlite3_reset(v5);
  return 0;
}

- (BOOL)unsubscribe:(id)a3 subscriptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  char v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  UAFSubscriptionStoreManager *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__UAFSubscriptionStoreManager_unsubscribe_subscriptions___block_invoke;
  v16[3] = &unk_24F1F7F50;
  v8 = v7;
  v20 = &v21;
  v17 = v8;
  v18 = self;
  v9 = v6;
  v19 = v9;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unsubscribe for Subscriber: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v16, 1, v10);

  if (v11)
    v12 = v11 == 101;
  else
    v12 = 1;
  v13 = v12;
  if (*((_BYTE *)v22 + 24))
    v14 = v13;
  else
    v14 = 0;

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __57__UAFSubscriptionStoreManager_unsubscribe_subscriptions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_unsubscribeSubscription:subscription:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  return 0;
}

- (BOOL)_unsubscribeSubscription:(id)a3 subscription:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  int v14;
  BOOL v15;
  BOOL v16;
  int v18;
  NSObject *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  const char *v24;
  int v25;
  const char *v26;
  int v27;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", self->_removeSubscription, 1, v6);
  if (v8)
  {
    v9 = v8;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sqlite3_errmsg(self->_store);
      v12 = sqlite3_extended_errcode(self->_store);
      v28 = 136316418;
      v29 = "-[UAFSubscriptionStoreManager _unsubscribeSubscription:subscription:]";
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      v34 = 1024;
      v35 = v9;
      v36 = 2080;
      v37 = v11;
      v38 = 1024;
      v39 = v12;
      v13 = "%s Binding of subscriber name failed in remove subscription query for Subscriber: '%@', Subscription: '%@' S"
            "QLite error: %d (%s, Extended: %d)";
LABEL_21:
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v28, 0x36u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v14 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", self->_removeSubscription, 2, v7);
  if (v14)
  {
    v9 = v14;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = sqlite3_errmsg(self->_store);
      v25 = sqlite3_extended_errcode(self->_store);
      v28 = 136316418;
      v29 = "-[UAFSubscriptionStoreManager _unsubscribeSubscription:subscription:]";
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      v34 = 1024;
      v35 = v9;
      v36 = 2080;
      v37 = v24;
      v38 = 1024;
      v39 = v25;
      v13 = "%s Binding of subscription name failed in remove subscription query for Subscriber: '%@', Subscription: '%@'"
            " SQLite error: %d (%s, Extended: %d)";
      goto LABEL_21;
    }
LABEL_6:

    goto LABEL_7;
  }
  v18 = sqlite3_step(self->_removeSubscription);
  v9 = v18;
  if (v18 && v18 != 101)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v26 = sqlite3_errmsg(self->_store);
      v27 = sqlite3_extended_errcode(self->_store);
      v28 = 136316418;
      v29 = "-[UAFSubscriptionStoreManager _unsubscribeSubscription:subscription:]";
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      v34 = 1024;
      v35 = v9;
      v36 = 2080;
      v37 = v26;
      v38 = 1024;
      v39 = v27;
      _os_log_error_impl(&dword_229282000, v19, OS_LOG_TYPE_ERROR, "%s Removal of subscription failed for Subscriber: '%@', Subscription: '%@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v28, 0x36u);
    }

    v20 = UAFLogContextStorage;
    v21 = kUAFABCDatabaseFailure;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_extended_errcode(self->_store));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    UAFFaultCapture(v20, (uint64_t)v21, (uint64_t)CFSTR("subscription"), (uint64_t)v23);

  }
  else
  {
    ++self->_updateCount;
  }
LABEL_7:
  sqlite3_reset(self->_removeSubscription);
  sqlite3_clear_bindings(self->_removeSubscription);
  if (v9)
    v15 = v9 == 101;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (BOOL)_removeAllSubscriptions
{
  int v3;
  NSObject *v4;
  const char *v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = sqlite3_step(self->_removeAllSubscriptions);
  if (v3 == 101)
  {
    ++self->_updateCount;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = sqlite3_errmsg(self->_store);
      v8 = sqlite3_extended_errcode(self->_store);
      v9 = 136315906;
      v10 = "-[UAFSubscriptionStoreManager _removeAllSubscriptions]";
      v11 = 1024;
      v12 = v3;
      v13 = 2080;
      v14 = v7;
      v15 = 1024;
      v16 = v8;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s Removal of all the subscriptions failed SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v9, 0x22u);
    }

  }
  sqlite3_reset(self->_removeAllSubscriptions);
  return !v3 || v3 == 101;
}

- (BOOL)removeAllSubscriptions
{
  int v2;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__UAFSubscriptionStoreManager_removeAllSubscriptions__block_invoke;
  v5[3] = &unk_24F1F7F78;
  v5[4] = self;
  v2 = -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v5, 1, CFSTR("removing all subscriptions"));
  return !v2 || v2 == 101;
}

uint64_t __53__UAFSubscriptionStoreManager_removeAllSubscriptions__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_removeAllSubscriptions"))
    return 0;
  else
    return 3;
}

- (BOOL)_setSystemAssetSetUsages:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFSubscriptionStoreManager _removeAllSystemAssetSetUsages](self, "_removeAllSystemAssetSetUsages");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = -[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:](self, "_setSystemAssetSetUsages:usages:", v10, v11);

        if (!(_DWORD)v10)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (int)doDatabaseOperation:(id)a3 useTransaction:(BOOL)a4 logDescription:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  +[UAFSubscriptionStoreManager getSerialQueue](UAFSubscriptionStoreManager, "getSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__UAFSubscriptionStoreManager_doDatabaseOperation_useTransaction_logDescription___block_invoke;
  block[3] = &unk_24F1F7FA0;
  block[4] = self;
  v15 = v9;
  v18 = a4;
  v16 = v8;
  v17 = &v19;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

  LODWORD(v9) = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return (int)v9;
}

void __81__UAFSubscriptionStoreManager_doDatabaseOperation_useTransaction_logDescription___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_openDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160)) & 1) != 0)
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (v2[176] || (objc_msgSend(v2, "_checkDbVersion") & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 64))
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_beginDatabaseTransaction");
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48)
                                                                                             + 16))();
          v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          if (v3 && v3 != 101)
          {
            UAFGetLogCategory((id *)&UAFLogContextStorage);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)v13 = 136315394;
              *(_QWORD *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:]_block_invoke";
              *(_WORD *)&v13[12] = 2114;
              *(_QWORD *)&v13[14] = v11;
              _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Rolling back exclusive transaction of %{public}@", v13, 0x16u);
            }

            if (!objc_msgSend(*(id *)(a1 + 32), "_rollbackDatabaseTransaction")
              || *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 101)
            {
              goto LABEL_13;
            }
            UAFGetLogCategory((id *)&UAFLogContextStorage);
            v5 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              goto LABEL_23;
            v12 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)v13 = 136315394;
            *(_QWORD *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:]_block_invoke";
            *(_WORD *)&v13[12] = 2114;
            *(_QWORD *)&v13[14] = v12;
            v7 = "%s Rollback exclusive transaction of %{public}@ failed";
          }
          else
          {
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_endDatabaseTransaction");
            v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            if (!v4 || v4 == 101)
              goto LABEL_13;
            UAFGetLogCategory((id *)&UAFLogContextStorage);
            v5 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              goto LABEL_23;
            v6 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)v13 = 136315394;
            *(_QWORD *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:]_block_invoke";
            *(_WORD *)&v13[12] = 2114;
            *(_QWORD *)&v13[14] = v6;
            v7 = "%s Commit of exclusive transaction of %{public}@ failed";
          }
          _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, v7, v13, 0x16u);
LABEL_23:

        }
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
LABEL_13:
      objc_msgSend(*(id *)(a1 + 32), "_closeDatabase", *(_OWORD *)v13, *(_QWORD *)&v13[16]);
      return;
    }
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:]_block_invoke";
      *(_WORD *)&v13[12] = 2114;
      *(_QWORD *)&v13[14] = v9;
      _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s Denying %{public}@ due to version mismatch", v13, 0x16u);
    }

  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 3;
}

- (id)_subscriptionTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v6);

  objc_msgSend(v4, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)expireSubscriptions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__UAFSubscriptionStoreManager_expireSubscriptions__block_invoke;
  v2[3] = &unk_24F1F7F78;
  v2[4] = self;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v2, 1, CFSTR("expiring subscriptions"));
}

uint64_t __50__UAFSubscriptionStoreManager_expireSubscriptions__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v3;
  __int128 v4;
  sqlite3_stmt **v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72);
  v3 = sqlite3_step(v2);
  v5 = *(sqlite3_stmt ***)(a1 + 32);
  if (v3 == 100)
  {
    *(_QWORD *)&v4 = 136315906;
    v19 = v4;
    do
    {
      objc_msgSend(v5, "readString:col:", v2, 0, v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "readData:col:", v2, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = v6 == 0;
      else
        v8 = 1;
      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "_uafAssetSetSubscriptionFromData:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDBCE60], "now");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "_subscriptionTime:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v21 = "-[UAFSubscriptionStoreManager expireSubscriptions]_block_invoke";
            v22 = 2114;
            v23 = v10;
            v24 = 2114;
            v25 = v6;
            v26 = 2114;
            v27 = v14;
            _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s Removing expired sub '%{public}@' from subscriber '%{public}@' at '%{public}@'", buf, 0x2Au);

          }
          v15 = *(void **)(a1 + 32);
          objc_msgSend(v10, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_unsubscribeSubscription:subscription:", v6, v16);

        }
      }

      v17 = sqlite3_step(v2);
      v5 = *(sqlite3_stmt ***)(a1 + 32);
    }
    while (v17 == 100);
  }
  sqlite3_reset(v5[9]);
  return 0;
}

- (id)updateSystemAssetSetUsages:(id *)a3 configurationManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  if (!v6)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__UAFSubscriptionStoreManager_updateSystemAssetSetUsages_configurationManager___block_invoke;
  v10[3] = &unk_24F1F7FC8;
  v12 = &v20;
  v13 = &v14;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v10, 1, CFSTR("updating system asset set usages"));
  if (a3)
    *a3 = objc_retainAutorelease((id)v21[5]);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

uint64_t __79__UAFSubscriptionStoreManager_updateSystemAssetSetUsages_configurationManager___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_getSubscriptions:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v15 = 136315394;
    v16 = "-[UAFSubscriptionStoreManager updateSystemAssetSetUsages:configurationManager:]_block_invoke";
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_229282000, v5, OS_LOG_TYPE_DEBUG, "%s All subscriptions now %{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "applySubscriptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v15 = 136315394;
    v16 = "-[UAFSubscriptionStoreManager updateSystemAssetSetUsages:configurationManager:]_block_invoke";
    v17 = 2114;
    v18 = v13;
    _os_log_debug_impl(&dword_229282000, v9, OS_LOG_TYPE_DEBUG, "%s All asset set usages now %{public}@", (uint8_t *)&v15, 0x16u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "_setSystemAssetSetUsages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v15 = 136315394;
      v16 = "-[UAFSubscriptionStoreManager updateSystemAssetSetUsages:configurationManager:]_block_invoke";
      v17 = 2114;
      v18 = v14;
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Failed to update storage to reflect asset set usages %{public}@", (uint8_t *)&v15, 0x16u);
    }

  }
  return 0;
}

- (id)updateSystemAssetSetUsages:(id *)a3
{
  return -[UAFSubscriptionStoreManager updateSystemAssetSetUsages:configurationManager:](self, "updateSystemAssetSetUsages:configurationManager:", a3, 0);
}

- (BOOL)_setSystemAssetSetUsages:(id)a3 usages:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  BOOL v18;
  BOOL v19;
  int v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[UAFSubscriptionStoreManager bindString:col:string:](self, "bindString:col:string:", self->_setSystemAssetSetUsages, 1, v6);
  if (!v8)
  {
    -[UAFSubscriptionStoreManager _dataFromSystemAssetSetUsages:](self, "_dataFromSystemAssetSetUsages:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315394;
        v25 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
        v26 = 2114;
        v27 = v6;
        _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Getting system asset set usages data from the usages failed for AssetSetName: '%{public}@'", (uint8_t *)&v24, 0x16u);
      }
      v9 = 3;
      goto LABEL_12;
    }
    v13 = -[UAFSubscriptionStoreManager bindData:col:data:](self, "bindData:col:data:", self->_setSystemAssetSetUsages, 2, v10);
    if (v13)
    {
      v9 = v13;
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_13;
      }
      v15 = sqlite3_errmsg(self->_store);
      v16 = sqlite3_extended_errcode(self->_store);
      v24 = 136316162;
      v25 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
      v26 = 2114;
      v27 = v6;
      v28 = 1024;
      v29 = v9;
      v30 = 2080;
      v31 = v15;
      v32 = 1024;
      v33 = v16;
      v17 = "%s Binding system asset set usages data failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
    }
    else
    {
      v21 = sqlite3_step(self->_setSystemAssetSetUsages);
      v9 = v21;
      if (!v21 || v21 == 101)
        goto LABEL_13;
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v22 = sqlite3_errmsg(self->_store);
      v23 = sqlite3_extended_errcode(self->_store);
      v24 = 136316162;
      v25 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
      v26 = 2114;
      v27 = v6;
      v28 = 1024;
      v29 = v9;
      v30 = 2080;
      v31 = v22;
      v32 = 1024;
      v33 = v23;
      v17 = "%s Setting system asset set usages failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
    }
    _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v24, 0x2Cu);
    goto LABEL_12;
  }
  v9 = v8;
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = sqlite3_errmsg(self->_store);
    v12 = sqlite3_extended_errcode(self->_store);
    v24 = 136316162;
    v25 = "-[UAFSubscriptionStoreManager _setSystemAssetSetUsages:usages:]";
    v26 = 2114;
    v27 = v6;
    v28 = 1024;
    v29 = v9;
    v30 = 2080;
    v31 = v11;
    v32 = 1024;
    v33 = v12;
    _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Binding asset set name to the set system asset set usages query failed for  AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v24, 0x2Cu);
  }
LABEL_13:

  sqlite3_reset(self->_setSystemAssetSetUsages);
  sqlite3_clear_bindings(self->_setSystemAssetSetUsages);
  if (v9)
    v18 = v9 == 101;
  else
    v18 = 1;
  v19 = v18;

  return v19;
}

- (id)getSystemAssetSetUsages:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__UAFSubscriptionStoreManager_getSystemAssetSetUsages___block_invoke;
  v8[3] = &unk_24F1F7FF0;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v8, 0, CFSTR("get system asset set usages"));
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __55__UAFSubscriptionStoreManager_getSystemAssetSetUsages___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v18;
  const char *v19;
  int v20;
  uint64_t v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "bindString:col:string:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1, *(_QWORD *)(a1 + 40));
  if ((_DWORD)v2)
  {
    v3 = v2;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v7 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v24 = 136316162;
      v25 = "-[UAFSubscriptionStoreManager getSystemAssetSetUsages:]_block_invoke";
      v26 = 2114;
      v27 = v5;
      v28 = 1024;
      v29 = v3;
      v30 = 2080;
      v31 = v6;
      v32 = 1024;
      v33 = v7;
      v8 = "%s Binding asset set name failed for get system asset set usages query failed for AssetSetName: '%{public}@' "
           "SQLite error: %d (%s, Extended: %d)";
LABEL_4:
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v24, 0x2Cu);
    }
  }
  else
  {
    v9 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
    v3 = v9;
    if ((v9 - 100) < 2 || (_DWORD)v9 == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "readData:col:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v4 = v11;
        objc_msgSend(*(id *)(a1 + 32), "_systemAssetSetUsagesFromData:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 40);
          v19 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
          v20 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
          v24 = 136316162;
          v25 = "-[UAFSubscriptionStoreManager getSystemAssetSetUsages:]_block_invoke";
          v26 = 2114;
          v27 = v18;
          v28 = 1024;
          v29 = v3;
          v30 = 2080;
          v31 = v19;
          v32 = 1024;
          v33 = v20;
          _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, "%s Fetched nil system asset set usages for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v24, 0x2Cu);
        }

        v4 = 0;
      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 40);
        v22 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
        v23 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
        v24 = 136316162;
        v25 = "-[UAFSubscriptionStoreManager getSystemAssetSetUsages:]_block_invoke";
        v26 = 2114;
        v27 = v21;
        v28 = 1024;
        v29 = v3;
        v30 = 2080;
        v31 = v22;
        v32 = 1024;
        v33 = v23;
        v8 = "%s Fetching system asset usages from database failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
        goto LABEL_4;
      }
    }
  }

  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 88));
  return v3;
}

- (id)getAllSystemAssetSetUsages
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__UAFSubscriptionStoreManager_getAllSystemAssetSetUsages__block_invoke;
  v5[3] = &unk_24F1F7F28;
  v5[4] = self;
  v5[5] = &v6;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v5, 0, CFSTR("get system asset set usages"));
  if (objc_msgSend((id)v7[5], "count"))
    v3 = (id)v7[5];
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __57__UAFSubscriptionStoreManager_getAllSystemAssetSetUsages__block_invoke(uint64_t a1)
{
  int v2;
  __int128 v3;
  _QWORD *v4;
  sqlite3_stmt *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (sqlite3_stmt *)v4[12];
  if (v2 == 100)
  {
    *(_QWORD *)&v3 = 136315138;
    v13 = v3;
    do
    {
      objc_msgSend(v4, "readString:col:", v5, 0, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "readData:col:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), 1);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(*(id *)(a1 + 32), "_systemAssetSetUsagesFromData:", v7);
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = v8;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, v6);
          }
          else
          {
            UAFGetLogCategory((id *)&UAFLogContextStorage);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v15 = "-[UAFSubscriptionStoreManager getAllSystemAssetSetUsages]_block_invoke";
              v16 = 2114;
              v17 = v6;
              _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not deserialize usages for assetset %{public}@", buf, 0x16u);
            }

            v9 = 0;
          }
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v15 = "-[UAFSubscriptionStoreManager getAllSystemAssetSetUsages]_block_invoke";
            v16 = 2114;
            v17 = v6;
            _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly retrieved a nil usage for assetset %{public}@", buf, 0x16u);
          }
        }

      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v15 = "-[UAFSubscriptionStoreManager getAllSystemAssetSetUsages]_block_invoke";
          _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly retrieved a nil assetset name from SystemAssetSetUsages", buf, 0xCu);
        }
      }

      v11 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
      v4 = *(_QWORD **)(a1 + 32);
      v5 = (sqlite3_stmt *)v4[12];
    }
    while (v11 == 100);
  }
  sqlite3_reset(v5);
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
  return 0;
}

- (BOOL)clearSystemAssetSetUsages:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  BOOL v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__UAFSubscriptionStoreManager_clearSystemAssetSetUsages___block_invoke;
  v10[3] = &unk_24F1F8018;
  v10[4] = self;
  v11 = v4;
  v5 = v4;
  v6 = -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v10, 1, CFSTR("clearing system asset set usages"));
  if (v6)
    v7 = v6 == 101;
  else
    v7 = 1;
  v8 = v7;

  return v8;
}

uint64_t __57__UAFSubscriptionStoreManager_clearSystemAssetSetUsages___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "bindString:col:string:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), 1, *(_QWORD *)(a1 + 40));
  if ((_DWORD)v2)
  {
    v3 = v2;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_4;
    }
    v11 = *(_QWORD *)(a1 + 40);
    v12 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v13 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v14 = 136316162;
    v15 = "-[UAFSubscriptionStoreManager clearSystemAssetSetUsages:]_block_invoke";
    v16 = 2114;
    v17 = v11;
    v18 = 1024;
    v19 = v3;
    v20 = 2080;
    v21 = v12;
    v22 = 1024;
    v23 = v13;
    v10 = "%s Binding asset set name failed for removing system asset set usages query failed for AssetSetName: '%{public"
          "}@' SQLite error: %d (%s, Extended: %d)";
LABEL_10:
    _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, 0x2Cu);
    goto LABEL_3;
  }
  v6 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
  v3 = v6;
  if ((_DWORD)v6 && (_DWORD)v6 != 101)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v9 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v14 = 136316162;
    v15 = "-[UAFSubscriptionStoreManager clearSystemAssetSetUsages:]_block_invoke";
    v16 = 2114;
    v17 = v7;
    v18 = 1024;
    v19 = v3;
    v20 = 2080;
    v21 = v8;
    v22 = 1024;
    v23 = v9;
    v10 = "%s Removing system asset set usages failed for AssetSetName: '%{public}@' SQLite error: %d (%s, Extended: %d)";
    goto LABEL_10;
  }
LABEL_4:
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
  return v3;
}

- (BOOL)_removeAllSystemAssetSetUsages
{
  int v3;
  NSObject *v4;
  const char *v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = sqlite3_step(self->_removeAllSystemAssetSetUsages);
  if (v3 != 101)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = sqlite3_errmsg(self->_store);
      v8 = sqlite3_extended_errcode(self->_store);
      v9 = 136315906;
      v10 = "-[UAFSubscriptionStoreManager _removeAllSystemAssetSetUsages]";
      v11 = 1024;
      v12 = v3;
      v13 = 2080;
      v14 = v7;
      v15 = 1024;
      v16 = v8;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s Removal of all the system asset set usages failed SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v9, 0x22u);
    }

  }
  sqlite3_reset(self->_removeAllSystemAssetSetUsages);
  return !v3 || v3 == 101;
}

- (BOOL)removeAllSystemAssetSetUsages
{
  int v2;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__UAFSubscriptionStoreManager_removeAllSystemAssetSetUsages__block_invoke;
  v5[3] = &unk_24F1F7F78;
  v5[4] = self;
  v2 = -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v5, 1, CFSTR("remove all system asset set usages"));
  return !v2 || v2 == 101;
}

uint64_t __60__UAFSubscriptionStoreManager_removeAllSystemAssetSetUsages__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_removeAllSystemAssetSetUsages"))
    return 0;
  else
    return 3;
}

- (int)_setDbVersion:(int)a3
{
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const char *v12;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = -[UAFSubscriptionStoreManager _beginDatabaseTransaction](self, "_beginDatabaseTransaction");
  if (v5)
  {
    v6 = v5;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[UAFSubscriptionStoreManager _setDbVersion:]";
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Begin exclusive transaction of setting db version failed", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_15;
  }
  v8 = sqlite3_bind_int(self->_setDbVersion, 1, a3);
  if (v8)
  {
    v6 = v8;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = sqlite3_errmsg(self->_store);
      v13 = sqlite3_extended_errcode(self->_store);
      v14 = 136315906;
      v15 = "-[UAFSubscriptionStoreManager _setDbVersion:]";
      v16 = 1024;
      v17 = v6;
      v18 = 2080;
      v19 = v12;
      v20 = 1024;
      v21 = v13;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Binding db version failed SQLite error: %d (%s, Extended: %d)", (uint8_t *)&v14, 0x22u);
    }

  }
  else
  {
    v6 = sqlite3_step(self->_setDbVersion);
    if (!v6)
    {
LABEL_11:
      v6 = -[UAFSubscriptionStoreManager _endDatabaseTransaction](self, "_endDatabaseTransaction");
      goto LABEL_15;
    }
  }
  if (v6 == 101)
    goto LABEL_11;
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[UAFSubscriptionStoreManager _setDbVersion:]";
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Rolling back exclusive transaction of setting db version", (uint8_t *)&v14, 0xCu);
  }

  -[UAFSubscriptionStoreManager _rollbackDatabaseTransaction](self, "_rollbackDatabaseTransaction");
LABEL_15:
  sqlite3_reset(self->_setDbVersion);
  sqlite3_clear_bindings(self->_setDbVersion);
  return v6;
}

- (BOOL)_moveDatabase
{
  void *v3;
  NSString *oldDatabaseName;
  id v5;
  void *v6;
  NSString *databaseName;
  NSString *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  oldDatabaseName = self->_oldDatabaseName;
  v14 = 0;
  objc_msgSend(v3, "removeItemAtPath:error:", oldDatabaseName, &v14);
  v5 = v14;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  databaseName = self->_databaseName;
  v8 = self->_oldDatabaseName;
  v13 = v5;
  v9 = objc_msgSend(v6, "moveItemAtPath:toPath:error:", databaseName, v8, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[UAFSubscriptionStoreManager _moveDatabase]";
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s Moving the database failed with error: %@", buf, 0x16u);
    }

  }
  return v9;
}

- (int)_performDbUpgrade:(int)a3
{
  int v5;
  int v6;
  int v7;
  _QWORD *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  int v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v5 = 0;
  v6 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  while (!self->_dbUpToDate)
  {
    if (v7 <= 0)
    {
      v8 = &upgradeBlocks + v7;
      while (1)
      {
        v9 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x22E2C6D60](*v8, a2);
        if ((((uint64_t (**)(_QWORD, UAFSubscriptionStoreManager *))v9)[2](v9, self) & 1) == 0)
          break;
        v10 = v7 + 1;
        v11 = -[UAFSubscriptionStoreManager _setDbVersion:](self, "_setDbVersion:", (v7 + 1));
        v5 = v11;
        if (v11 && v11 != 101)
          goto LABEL_13;

        ++v8;
        ++v7;
        if (v10 == 1)
          goto LABEL_14;
      }
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[UAFSubscriptionStoreManager _performDbUpgrade:]";
        v20 = 1024;
        v21 = v7;
        v22 = 1024;
        v23 = v6;
        _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s Upgrading db failed at version %d in attempt %d", buf, 0x18u);
      }

      v5 = 3;
LABEL_13:

    }
LABEL_14:
    if (v5)
      v13 = v5 == 101;
    else
      v13 = 1;
    v14 = v13;
    self->_dbUpToDate = v14;
    if (v5 && v5 != 101)
    {
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[UAFSubscriptionStoreManager _performDbUpgrade:]";
        v20 = 1024;
        v21 = v6;
        _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, "%s Couldn't upgrade the database so attempting db deletion and retrying during attempt %d", buf, 0x12u);
      }

      if (!-[UAFSubscriptionStoreManager _moveDatabase](self, "_moveDatabase"))
      {
LABEL_27:
        if (!self->_dbUpToDate)
        {
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[UAFSubscriptionStoreManager _performDbUpgrade:]";
            v20 = 1024;
            v21 = 5;
            _os_log_error_impl(&dword_229282000, v16, OS_LOG_TYPE_ERROR, "%s Couldn't upgrade the database even after %d attempts", buf, 0x12u);
          }

        }
        return v5;
      }
      v5 = -[UAFSubscriptionStoreManager _openDatabase:](self, "_openDatabase:", self->_databaseName);
      v7 = a3;
    }
    if (++v6 == 5)
      goto LABEL_27;
  }
  return v5;
}

- (BOOL)performDbUpgradeToVersion:(int)a3
{
  NSObject *v5;
  int v6;
  BOOL v7;
  BOOL v8;
  _QWORD block[6];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  +[UAFSubscriptionStoreManager getSerialQueue](UAFSubscriptionStoreManager, "getSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__UAFSubscriptionStoreManager_performDbUpgradeToVersion___block_invoke;
  block[3] = &unk_24F1F8040;
  block[4] = self;
  block[5] = &v12;
  v11 = a3;
  dispatch_sync(v5, block);

  v6 = *((_DWORD *)v13 + 6);
  if (v6)
    v7 = v6 == 101;
  else
    v7 = 1;
  v8 = v7;
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __57__UAFSubscriptionStoreManager_performDbUpgradeToVersion___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  int v10;
  _BYTE v11[18];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "_openDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  if ((result & 1) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 3;
    return result;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_createDbVersionTable"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32)
                                                                                                + 128));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(_DWORD *)(v3 + 24);
    if ((v4 & 0xFFFFFFFE) == 0x64)
    {
      v5 = sqlite3_column_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 128), 0);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_DWORD *)(v3 + 24))
        goto LABEL_5;
    }
    else
    {
      v5 = 0;
      if (v4)
      {
LABEL_5:
        *(_DWORD *)(v3 + 24) = 3;
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v11 = 136315138;
          *(_QWORD *)&v11[4] = "-[UAFSubscriptionStoreManager performDbUpgradeToVersion:]_block_invoke";
          v7 = "%s Reading db version from DbVersion table failed";
LABEL_20:
          _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, v7, v11, 0xCu);
          goto LABEL_9;
        }
        goto LABEL_9;
      }
    }
    v8 = *(_DWORD *)(a1 + 48);
    if ((_DWORD)v5 == v8)
    {
      *(_DWORD *)(v3 + 24) = 0;
    }
    else if ((int)v5 <= v8)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performDbUpgrade:", v5);
    }
    else
    {
      *(_DWORD *)(v3 + 24) = 3;
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = "-[UAFSubscriptionStoreManager performDbUpgradeToVersion:]_block_invoke";
        *(_WORD *)&v11[12] = 1024;
        *(_DWORD *)&v11[14] = v10;
        v12 = 1024;
        v13 = v5;
        _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Db upgrade requested a version %d lesser than the current stored version %d", v11, 0x18u);
      }

    }
    return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase", *(_OWORD *)v11);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 3;
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)&v11[4] = "-[UAFSubscriptionStoreManager performDbUpgradeToVersion:]_block_invoke";
    v7 = "%s Creation or checking of DbVersion table failed";
    goto LABEL_20;
  }
LABEL_9:

  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase", *(_OWORD *)v11);
}

- (id)_dataFromUAFAssetSubscription:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[UAFSubscriptionStoreManager _dataFromUAFAssetSubscription:]";
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s Failed to archive subscription asset set usages: %@", buf, 0x16u);
    }

  }
  return v3;
}

- (id)_uafAssetSetSubscriptionFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDD1620];
    v4 = a3;
    v9 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (v6)
    {
      UAFGetLogCategory((id *)&UAFLogContextStorage);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[UAFSubscriptionStoreManager _uafAssetSetSubscriptionFromData:]";
        v12 = 2112;
        v13 = v6;
        _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Failed to unarchive subscription asset set usages: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_dataFromSystemAssetSetUsages:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[UAFSubscriptionStoreManager _dataFromSystemAssetSetUsages:]";
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s Failed to archive system asset set usages: %@", buf, 0x16u);
    }

  }
  return v3;
}

- (id)_systemAssetSetUsagesFromData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v7, v5, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[UAFSubscriptionStoreManager _systemAssetSetUsagesFromData:]";
      v15 = 2112;
      v16 = v9;
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Failed to unarchive subscription asset set usages: %@", buf, 0x16u);
    }

  }
  return v8;
}

- (id)getSystemConfigurationForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v9 = MEMORY[0x24BDAC760];
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("get system configuration for key: %@"), v5, v9, 3221225472, __60__UAFSubscriptionStoreManager_getSystemConfigurationForKey___block_invoke, &unk_24F1F7FF0, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", &v9, 0, v6);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __60__UAFSubscriptionStoreManager_getSystemConfigurationForKey___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  sqlite3_stmt *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (sqlite3_stmt *)v2[17];
  v4 = objc_msgSend(v2, "bindString:col:string:", v3, 1, *(_QWORD *)(a1 + 40));
  if ((_DWORD)v4)
  {
    v5 = v4;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v18 = *(_QWORD *)(a1 + 40);
    v19 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v20 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v21 = 136316162;
    v22 = "-[UAFSubscriptionStoreManager getSystemConfigurationForKey:]_block_invoke";
    v23 = 2114;
    v24 = v18;
    v25 = 1024;
    v26 = v5;
    v27 = 2080;
    v28 = v19;
    v29 = 1024;
    v30 = v20;
    v17 = "%s Error binding read subscription for '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_14:
    _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0x2Cu);
    goto LABEL_3;
  }
  v7 = sqlite3_step(v3);
  v5 = v7;
  if ((v7 - 100) < 2 || (_DWORD)v7 == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "readString:col:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    goto LABEL_10;
  }
  UAFGetLogCategory((id *)&UAFLogContextStorage);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v16 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    v21 = 136316162;
    v22 = "-[UAFSubscriptionStoreManager getSystemConfigurationForKey:]_block_invoke";
    v23 = 2114;
    v24 = v14;
    v25 = 1024;
    v26 = v5;
    v27 = 2080;
    v28 = v15;
    v29 = 1024;
    v30 = v16;
    v17 = "%s Error executing read SystemConfiguration key for '%{public}@' SQLite error: %d (%s, Extended: %d)";
    goto LABEL_14;
  }
LABEL_3:

LABEL_10:
  sqlite3_reset(v3);
  sqlite3_clear_bindings(v3);
  return v5;
}

- (void)setSystemConfigurationForKey:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UAFSubscriptionStoreManager getSystemConfigurationForKey:](self, "getSystemConfigurationForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "isEqualToString:", v7))
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]";
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping update of %{public}@ as value is unchanged", buf, 0x16u);
    }

  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = v6;
    v14 = v7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("set system configuration for key: %@"), v13, v12, 3221225472, __70__UAFSubscriptionStoreManager_setSystemConfigurationForKey_withValue___block_invoke, &unk_24F1F8068, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", &v12, 0, v11);

  }
}

uint64_t __70__UAFSubscriptionStoreManager_setSystemConfigurationForKey_withValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  int v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "bindString:col:string:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), 1, *(_QWORD *)(a1 + 40));
  if ((_DWORD)v2)
  {
    v3 = v2;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v7 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v18 = 136316162;
      v19 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]_block_invoke";
      v20 = 2114;
      v21 = v5;
      v22 = 1024;
      v23 = v3;
      v24 = 2080;
      v25 = v6;
      v26 = 1024;
      v27 = v7;
      v8 = "%s Binding key to SystemConfiguration: '%{public}@' SQLite error: %d (%s, Extended: %d)";
LABEL_13:
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v18, 0x2Cu);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "bindString:col:string:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), 2, *(_QWORD *)(a1 + 48));
  if ((_DWORD)v9)
  {
    v3 = v9;
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v17 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v18 = 136316162;
      v19 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]_block_invoke";
      v20 = 2114;
      v21 = v15;
      v22 = 1024;
      v23 = v3;
      v24 = 2080;
      v25 = v16;
      v26 = 1024;
      v27 = v17;
      v8 = "%s Binding value to SystemConfiguration: '%{public}@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  v11 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 144));
  v3 = v11;
  if ((_DWORD)v11 && (_DWORD)v11 != 101)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v14 = sqlite3_extended_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      v18 = 136316162;
      v19 = "-[UAFSubscriptionStoreManager setSystemConfigurationForKey:withValue:]_block_invoke";
      v20 = 2114;
      v21 = v12;
      v22 = 1024;
      v23 = v3;
      v24 = 2080;
      v25 = v13;
      v26 = 1024;
      v27 = v14;
      v8 = "%s Executing set SystemConfiguration failed for: '%{public}@' SQLite error: %d (%s, Extended: %d)";
      goto LABEL_13;
    }
LABEL_6:

  }
  sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 144));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 144));
  return v3;
}

- (id)getAllSystemConfiguration
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__UAFSubscriptionStoreManager_getAllSystemConfiguration__block_invoke;
  v4[3] = &unk_24F1F7F28;
  v4[4] = self;
  v4[5] = &v5;
  -[UAFSubscriptionStoreManager doDatabaseOperation:useTransaction:logDescription:](self, "doDatabaseOperation:useTransaction:logDescription:", v4, 1, CFSTR("getting all system configuration keys & values"));
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __56__UAFSubscriptionStoreManager_getAllSystemConfiguration__block_invoke(uint64_t a1)
{
  int v2;
  __int128 v3;
  _QWORD *v4;
  sqlite3_stmt *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 152));
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (sqlite3_stmt *)v4[19];
  if (v2 == 100)
  {
    *(_QWORD *)&v3 = 136315138;
    v16 = v3;
    do
    {
      objc_msgSend(v4, "readString:col:", v5, 0, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "readString:col:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), 1);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = v7;
          v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          if (!v9)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = *(void **)(v11 + 40);
            *(_QWORD *)(v11 + 40) = v10;

            v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextStorage);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v18 = "-[UAFSubscriptionStoreManager getAllSystemConfiguration]_block_invoke";
            _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, "%s Unexpectedly retrieved a nil value from SystemConfiguration", buf, 0xCu);
          }

          v8 = 0;
        }
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextStorage);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          v18 = "-[UAFSubscriptionStoreManager getAllSystemConfiguration]_block_invoke";
          _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s Unexpectedly retrieved a nil key from SystemConfiguration", buf, 0xCu);
        }
      }

      v14 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 152));
      v4 = *(_QWORD **)(a1 + 32);
      v5 = (sqlite3_stmt *)v4[19];
    }
    while (v14 == 100);
  }
  sqlite3_reset(v5);
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 152));
  return 0;
}

- (int)executeSQL:(const char *)a3
{
  char *v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  char *errmsg;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;
  uint64_t v17;
  char v18;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!self->_store)
    return 1;
  errmsg = 0;
  v5 = sqlite3_vmprintf(a3, &v18);
  v6 = sqlite3_exec(self->_store, v5, 0, 0, &errmsg);
  if (v6)
    v7 = errmsg == 0;
  else
    v7 = 1;
  if (!v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextStorage);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[UAFSubscriptionStoreManager executeSQL:]";
      v13 = 2080;
      v14 = a3;
      v15 = 2080;
      v16 = errmsg;
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s execute(%s) Error: %s", buf, 0x20u);
    }

    sqlite3_free(errmsg);
  }
  sqlite3_free(v5);
  return v6;
}

- (int)bindString:(sqlite3_stmt *)a3 col:(int)a4 string:(id)a5
{
  return sqlite3_bind_text(a3, a4, (const char *)objc_msgSend(objc_retainAutorelease(a5), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (int)bindData:(sqlite3_stmt *)a3 col:(int)a4 data:(id)a5
{
  id v7;
  const void *v8;
  int v9;

  v7 = objc_retainAutorelease(a5);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  return sqlite3_bind_blob(a3, a4, v8, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (int)bindDate:(sqlite3_stmt *)a3 col:(int)a4 date:(id)a5
{
  double v7;

  objc_msgSend(a5, "timeIntervalSince1970");
  return sqlite3_bind_double(a3, a4, v7);
}

- (id)readData:(sqlite3_stmt *)a3 col:(int)a4
{
  int v6;
  const void *v7;
  void *v8;

  v6 = sqlite3_column_bytes(a3, a4);
  v7 = sqlite3_column_blob(a3, a4);
  if (v6 < 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)readString:(sqlite3_stmt *)a3 col:(int)a4
{
  void *v4;

  v4 = (void *)sqlite3_column_text(a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldDatabaseName, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
}

@end
