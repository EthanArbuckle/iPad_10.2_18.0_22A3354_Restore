@implementation TAPersistenceManager

- (TAPersistenceManager)initWithSettings:(id)a3
{
  id v5;
  TAPersistenceManager *v6;
  TAPersistenceManager *v7;
  TAPersistenceStore *v8;
  TAPersistenceStore *store;
  uint64_t v10;
  NSHashTable *observers;
  TAPersistenceManager *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TAPersistenceManager;
  v6 = -[TAPersistenceManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    if (!-[TAPersistenceManager _createDirectoryIfNotPresent](v7, "_createDirectoryIfNotPresent"))
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = objc_alloc_init(TAPersistenceStore);
    store = v7->_store;
    v7->_store = v8;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;

  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (BOOL)_createDirectoryIfNotPresent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAPersistenceManagerSettings persistenceDirectoryURL](self->_settings, "persistenceDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
  v5 = v11;

  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      *(_DWORD *)buf = 68289283;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2081;
      v17 = v9;
      _os_log_impl(&dword_217877000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager encountered error in creating directory\", \"error\":\"%{private}s\"}", buf, 0x1Cu);

    }
  }

  return v5 == 0;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversOnWriteToURL:(id)a3 bytes:(unint64_t)a4
{
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didWriteToURL:bytes:", v6, a4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversOnReadFromURL:(id)a3 bytes:(unint64_t)a4
{
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didReadFromURL:bytes:", v6, a4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)load
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSObject *log;
  id v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[TAPersistenceManagerSettings _getStoreURL](self->_settings, "_getStoreURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 2, &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    if (v8)
    {
      v9 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        objc_msgSend(v3, "absoluteString");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = objc_msgSend(v11, "UTF8String");
        objc_msgSend(v8, "description");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        *(_DWORD *)buf = 68289539;
        v29 = 0;
        v30 = 2082;
        v31 = "";
        v32 = 2081;
        v33 = v12;
        v34 = 2081;
        v35 = v14;
        _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager encountered error in loading file\", \"url\":\"%{private}s\", \"error\":\"%{private}s\"}", buf, 0x26u);

      }
      v15 = 0;
    }
    else
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;
      v15 = v18 == 0;
      if (v18)
      {
        v19 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          log = v19;
          objc_msgSend(v3, "absoluteString");
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v21 = objc_msgSend(v20, "UTF8String");
          objc_msgSend(v18, "description");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = objc_msgSend(v22, "UTF8String");
          *(_DWORD *)buf = 68289539;
          v29 = 0;
          v30 = 2082;
          v31 = "";
          v32 = 2081;
          v33 = v21;
          v34 = 2081;
          v35 = v23;
          _os_log_impl(&dword_217877000, log, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager encountered error in unarchiving store\", \"url\":\"%{private}s\", \"error\":\"%{private}s\"}", buf, 0x26u);

        }
      }
      else
      {
        objc_storeStrong((id *)&self->_store, v17);
        -[TAPersistenceManager _notifyObserversOnReadFromURL:bytes:](self, "_notifyObserversOnReadFromURL:bytes:", v3, objc_msgSend(v7, "length"));
      }

    }
  }
  else
  {
    v16 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      _os_log_impl(&dword_217877000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAPersistenceManager file does not exist\"}", buf, 0x12u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)save
{
  void *v3;
  void *v4;
  TAPersistenceStore *store;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v25;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_store)
  {
    -[TAPersistenceManagerSettings _getStoreURL](self->_settings, "_getStoreURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x219A13570]();
    store = self->_store;
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", store, 1, &v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    v8 = (void *)TAStatusLog;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        objc_msgSend(v7, "description");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "UTF8String");
        *(_DWORD *)buf = 68289283;
        v28 = 0;
        v29 = 2082;
        v30 = "";
        v31 = 2081;
        v32 = v11;
        _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager error archiving store\", \"error\":\"%{private}s\"}", buf, 0x1Cu);

      }
      v12 = 0;
      v13 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        v16 = v8;
        objc_msgSend(v3, "path");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v18 = objc_msgSend(v17, "UTF8String");
        *(_DWORD *)buf = 68289283;
        v28 = 0;
        v29 = 2082;
        v30 = "";
        v31 = 2081;
        v32 = v18;
        _os_log_impl(&dword_217877000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAPersistenceManager saving to location\", \"path\":\"%{private}s\"}", buf, 0x1Cu);

      }
      v25 = 0;
      objc_msgSend(v6, "writeToURL:options:error:", v3, 1073741825, &v25);
      v19 = v25;
      if (v19)
      {
        v20 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          objc_msgSend(v19, "description");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = objc_msgSend(v22, "UTF8String");
          *(_DWORD *)buf = 68289283;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          v31 = 2081;
          v32 = v23;
          _os_log_impl(&dword_217877000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager error archiving store\", \"error\":\"%{private}s\"}", buf, 0x1Cu);

        }
        v12 = 0;
        v13 = 1;
      }
      else
      {
        v12 = objc_msgSend(v6, "length");
        v13 = 0;
      }

    }
    objc_autoreleasePoolPop(v4);
    v15 = v13 == 0;
    if (!v13)
      -[TAPersistenceManager _notifyObserversOnWriteToURL:bytes:](self, "_notifyObserversOnWriteToURL:bytes:", v3, v12);

  }
  else
  {
    v14 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      _os_log_impl(&dword_217877000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager no store to save\"}", buf, 0x12u);
    }
    return 0;
  }
  return v15;
}

- (BOOL)reset
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  TAPersistenceStore *v10;
  TAPersistenceStore *store;
  BOOL v12;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAPersistenceManagerSettings persistenceDirectoryURL](self->_settings, "persistenceDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "removeItemAtURL:error:", v4, &v14);
  v5 = v14;

  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      *(_DWORD *)buf = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2081;
      v20 = v9;
      _os_log_impl(&dword_217877000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAPersistenceManager error reseting directory\", \"error\":\"%{private}s\"}", buf, 0x1Cu);

    }
    goto LABEL_6;
  }
  if (!-[TAPersistenceManager _createDirectoryIfNotPresent](self, "_createDirectoryIfNotPresent"))
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v10 = objc_alloc_init(TAPersistenceStore);
  store = self->_store;
  self->_store = v10;

  v12 = 1;
LABEL_7:

  return v12;
}

- (void)onUpdatedTAStore:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "deviceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAPersistenceStore setDeviceRecord:](self->_store, "setDeviceRecord:", v5);

  objc_msgSend(v4, "visitState");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[TAPersistenceStore setVisitState:](self->_store, "setVisitState:", v6);
}

- (TAPersistenceStore)store
{
  return self->_store;
}

- (TAPersistenceManagerSettings)settings
{
  return (TAPersistenceManagerSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
