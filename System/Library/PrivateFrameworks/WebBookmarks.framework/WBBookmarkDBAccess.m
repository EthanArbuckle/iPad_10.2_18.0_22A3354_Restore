@implementation WBBookmarkDBAccess

- (WBBookmarkDBAccess)initWithCollectionType:(int64_t)a3
{
  return -[WBBookmarkDBAccess initWithCollectionType:storeOwner:](self, "initWithCollectionType:storeOwner:", a3, 0);
}

- (WBBookmarkDBAccess)initWithCollectionType:(int64_t)a3 storeOwner:(int64_t)a4
{
  WBBookmarkDBAccess *v6;
  WBBookmarkDBAccess *v7;
  WBBookmarkDBAccess *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBBookmarkDBAccess;
  v6 = -[WBBookmarkDBAccess init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_collectionType = a3;
    v6->_storeOwner = a4;
    v8 = v6;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  WBNSStringFromCollectionType(self->_collectionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WBNSStringFromCollectionStoreOwner(self->_storeOwner);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@, store owner: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)createDatabase
{
  int64_t storeOwner;
  int64_t collectionType;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  _BYTE v21[22];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  collectionType = self->_collectionType;
  storeOwner = self->_storeOwner;
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)&v21[4] = "WebBookmarkDatabaseCreate";
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s()", v21, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.dataaccess"));

  if (collectionType == 1)
  {
    v8 = (void *)objc_opt_class();
    +[WBCollectionConfiguration safariTabCollectionConfiguration](WBCollectionConfiguration, "safariTabCollectionConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!collectionType)
  {
    v8 = (void *)objc_opt_class();
    +[WBCollectionConfiguration safariBookmarkCollectionConfiguration](WBCollectionConfiguration, "safariBookmarkCollectionConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_9;
  }
  v10 = 0;
  v8 = 0;
LABEL_9:
  objc_msgSend(v10, "setStoreOwner:", storeOwner);
  v11 = objc_msgSend(v8, "lockSync");
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v11 & 1) != 0)
  {
    if (v13)
    {
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)&v21[4] = "WebBookmarkDatabaseCreate";
      _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "@@ %s: Did successfully lock database", v21, 0xCu);
    }
    v14 = (void *)objc_msgSend(objc_alloc((Class)v8), "initWithConfiguration:checkIntegrity:", v10, 0);
    v15 = v14;
    if (v14)
    {
      if (!v7 || !objc_msgSend(v14, "_syncType"))
      {
        v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v21 = 136315394;
          *(_QWORD *)&v21[4] = "WebBookmarkDatabaseCreate";
          *(_WORD *)&v21[12] = 2114;
          *(_QWORD *)&v21[14] = v15;
          _os_log_impl(&dword_211022000, v19, OS_LOG_TYPE_INFO, "<- %s -> database: %{public}@", v21, 0x16u);
        }
        v18 = v15;
        goto LABEL_27;
      }
      v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v21 = 136315138;
        *(_QWORD *)&v21[4] = "WebBookmarkDatabaseCreate";
        v17 = "<- %s -> database: NULL due to not running in data access process with DAV enabled";
LABEL_25:
        _os_log_impl(&dword_211022000, v16, OS_LOG_TYPE_INFO, v17, v21, 0xCu);
      }
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v21 = 136315138;
        *(_QWORD *)&v21[4] = "WebBookmarkDatabaseCreate";
        v17 = "<- %s -> database: NULL due to failure to allocate WebBookmarkCollection";
        goto LABEL_25;
      }
    }
    objc_msgSend(v8, "unlockSync", *(_OWORD *)v21);
    v18 = 0;
LABEL_27:

    goto LABEL_28;
  }
  if (v13)
  {
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)&v21[4] = "WebBookmarkDatabaseCreate";
    _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "<- %s -> database: NULL due to failure to obtain lock", v21, 0xCu);
  }
  v18 = 0;
LABEL_28:

  return v18;
}

- (void)openDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "BADatabaseOpen";
    v9 = 2114;
    v10 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v7, 0x16u);
  }
  v5 = a3;
  if ((objc_msgSend(v5, "maintainsSyncMetadata") & 1) == 0)
    objc_msgSend(v5, "beginSyncTransaction");
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "BADatabaseOpen";
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v7, 0xCu);
  }

}

- (void)saveDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "BADatabaseSave";
    v9 = 2114;
    v10 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v7, 0x16u);
  }
  v5 = a3;
  if ((objc_msgSend(v5, "maintainsSyncMetadata") & 1) == 0)
    objc_msgSend(v5, "commitSyncTransaction");
  objc_msgSend(v5, "_postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade");
  if ((objc_msgSend(v5, "maintainsSyncMetadata") & 1) == 0)
    objc_msgSend(v5, "beginSyncTransaction");
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "BADatabaseSave";
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v7, 0xCu);
  }

}

- (void)closeDatabase:(void *)a3 shouldSave:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "BADatabaseClose";
    v12 = 2114;
    v13 = a3;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, shouldSave: %d)", (uint8_t *)&v10, 0x1Cu);
  }
  v7 = a3;
  v8 = objc_msgSend(v7, "maintainsSyncMetadata");
  if (v4)
  {
    if ((v8 & 1) == 0)
      objc_msgSend(v7, "commitSyncTransaction");
    objc_msgSend(v7, "_restoreMissingSpecialBookmarksWithChangeNotification:", 0);
    objc_msgSend(v7, "_postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade");
  }
  else if ((v8 & 1) == 0)
  {
    objc_msgSend(v7, "rollbackSyncTransaction");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "unlockSync");
  }
  v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "BADatabaseClose";
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v10, 0xCu);
  }

}

- (__CFData)copySyncDataWithDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "BADatabaseCopySyncData";
    v12 = 2114;
    v13 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  v5 = a3;
  objc_msgSend(v5, "syncDataForKey:", CFSTR("BASyncData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("(null)");
    }
    v10 = 136315394;
    v11 = "BADatabaseCopySyncData";
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s -> Return data of size: %{public}@", (uint8_t *)&v10, 0x16u);
    if (v6)

  }
  return (__CFData *)v6;
}

- (void)setSyncData:(__CFData *)a3 database:(void *)a4
{
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", CFDataGetLength(a3));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("(null)");
    }
    v9 = 136315650;
    v10 = "BADatabaseSetSyncData";
    v11 = 2114;
    v12 = a4;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, data size: %{public}@)", (uint8_t *)&v9, 0x20u);
    if (a3)

  }
  objc_msgSend(a4, "setSyncData:forKey:", a3, CFSTR("BASyncData"));
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "BADatabaseSetSyncData";
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v9, 0xCu);
  }
}

- (void)clearAllSyncDataWithDatabase:(void *)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "BADatabaseClearAllSyncData";
    v8 = 2114;
    v9 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(a3, "_clearAllSyncData");
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "BADatabaseClearAllSyncData";
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (__CFArray)copyChangesWithDatabase:(void *)a3 changeToken:(const void *)a4
{
  NSObject *v6;
  void *v7;
  __CFArray *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "BADatabaseCopyChanges";
    v15 = 2114;
    v16 = a3;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  v7 = a3;
  objc_msgSend(v7, "changeList");
  v8 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "currentRecordGeneration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  *a4 = v10;
  v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "BADatabaseCopyChanges";
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> %{public}@, %{public}@", (uint8_t *)&v13, 0x20u);
  }

  return v8;
}

- (void)clearChangesWithChangeToken:(void *)a3 database:(void *)a4
{
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v26 = 136315650;
    v27 = "BADatabaseClearChangesForToken";
    v28 = 2114;
    v29 = a4;
    v30 = 2114;
    v31 = a3;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v26, 0x20u);
  }
  v7 = a4;
  v8 = objc_msgSend(a3, "intValue");
  if (objc_msgSend(v7, "currentRecordGeneration") != v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[WBBookmarkDBAccess clearChangesWithChangeToken:database:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if ((objc_msgSend(v7, "_clearChangeList") & 1) == 0)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[WBBookmarkDBAccess clearChangesWithChangeToken:database:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
  v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = 136315138;
    v27 = "BADatabaseClearChangesForToken";
    _os_log_impl(&dword_211022000, v25, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v26, 0xCu);
  }

}

- (void)removeItemWithServerId:(__CFString *)a3 database:(void *)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  _BYTE v30[20];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[__CFString wb_stringByRedactingBookmarkDAVServerID](a3, "wb_stringByRedactingBookmarkDAVServerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136315650;
    *(_QWORD *)v30 = "BADatabaseRemoveItemWithServerId";
    *(_WORD *)&v30[8] = 2114;
    *(_QWORD *)&v30[10] = a4;
    *(_WORD *)&v30[18] = 2114;
    v31 = v8;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v29, 0x20u);

  }
  if (a3)
  {
    v9 = a4;
    objc_msgSend(v9, "bookmarkWithServerID:excludeDeletedBookmarks:", a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "isReadingListItem"))
      {
        objc_msgSend(v11, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clearReadingListArchiveWithUUID:", v12);

      }
      if (objc_msgSend(v11, "isReadingListFolder"))
        objc_msgSend(v9, "clearAllReadingListArchives");
      v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        v15 = objc_msgSend(v11, "identifier");
        -[__CFString wb_stringByRedactingBookmarkDAVServerID](a3, "wb_stringByRedactingBookmarkDAVServerID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v11, "parentID");
        v29 = 67109634;
        *(_DWORD *)v30 = v15;
        *(_WORD *)&v30[4] = 2114;
        *(_QWORD *)&v30[6] = v16;
        *(_WORD *)&v30[14] = 1024;
        *(_DWORD *)&v30[16] = v17;
        _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "Deleting bookmark with ID %d and serverID %{public}@ from parent with ID %d", (uint8_t *)&v29, 0x18u);

      }
      objc_msgSend(v9, "deleteBookmark:leaveTombstone:", v11, 0);
      v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      v29 = 136315138;
      *(_QWORD *)v30 = "BADatabaseRemoveItemWithServerId";
    }
    else
    {
      v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[WBBookmarkDBAccess removeItemWithServerId:database:].cold.2(v28);
      v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      v29 = 136315138;
      *(_QWORD *)v30 = "BADatabaseRemoveItemWithServerId";
    }
    _os_log_impl(&dword_211022000, v18, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v29, 0xCu);
LABEL_22:

    return;
  }
  v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[WBBookmarkDBAccess removeItemWithServerId:database:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  v27 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v29 = 136315138;
    *(_QWORD *)v30 = "BADatabaseRemoveItemWithServerId";
    _os_log_impl(&dword_211022000, v27, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v29, 0xCu);
  }
}

- (void)beginMergingChangesWithDatabase:(void *)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "BADatabaseBeginMergingChanges";
    v8 = 2114;
    v9 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(a3, "_setMergeMode:", 1);
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "BADatabaseBeginMergingChanges";
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)finishMergingChangesWithDatabase:(void *)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "BADatabaseFinishMergingChanges";
    v8 = 2114;
    v9 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(a3, "_setMergeMode:", 0);
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "BADatabaseFinishMergingChanges";
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (__CFString)copyServerIdWithItem:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "BAItemCopyServerId";
    v14 = 2114;
    v15 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)objc_msgSend(v6, "copy");

  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    -[__CFString wb_stringByRedactingBookmarkDAVServerID](v7, "wb_stringByRedactingBookmarkDAVServerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "BAItemCopyServerId";
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v12, 0x16u);

  }
  return v7;
}

- (void)setServerId:(__CFString *)a3 item:(void *)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[__CFString wb_stringByRedactingBookmarkDAVServerID](a3, "wb_stringByRedactingBookmarkDAVServerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "BAItemSetServerId";
    v16 = 2114;
    v17 = a4;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, %{public}@)", (uint8_t *)&v14, 0x20u);

  }
  v9 = a4;
  objc_msgSend(v9, "bookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isInserted"))
  {
    objc_msgSend(v9, "collection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bookmark");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setServerID:forBookmark:", a3, v12);

  }
  else
  {
    objc_msgSend(v10, "setServerID:", a3);
  }
  v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "BAItemSetServerId";
    _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v14, 0xCu);
  }

}

- (__CFString)copyParentServerIdWithItem:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "BAItemCopyParentServerId";
    v17 = 2114;
    v18 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v15, 0x16u);
  }
  v5 = a3;
  objc_msgSend(v5, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "parentID");

  objc_msgSend(v5, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serverIDForBookmarkID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__CFString *)objc_msgSend(v9, "copy");

  v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    -[__CFString wb_stringByRedactingBookmarkDAVServerID](v10, "wb_stringByRedactingBookmarkDAVServerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "BAItemCopyParentServerId";
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v15, 0x16u);

  }
  return v10;
}

- (__CFString)copySyncKeyWithItem:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "BAItemCopySyncKey";
    v12 = 2114;
    v13 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)objc_msgSend(v6, "copy");

  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "BAItemCopySyncKey";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> syncKey: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (void)setSyncKey:(__CFString *)a3 item:(void *)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "BAItemSetSyncKey";
    v13 = 2114;
    v14 = a4;
    v15 = 2114;
    v16 = a3;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, syncKey: %{public}@)", (uint8_t *)&v11, 0x20u);
  }
  v7 = a4;
  objc_msgSend(v7, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isInserted"))
  {
    objc_msgSend(v7, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setSyncKey:forBookmark:", a3, v8);

  }
  else
  {
    objc_msgSend(v8, "setSyncKey:", a3);
  }
  v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "BAItemSetSyncKey";
    _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v11, 0xCu);
  }

}

- (__CFData)copySyncDataWithItem:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "BAItemCopySyncData";
    v14 = 2114;
    v15 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v12, 0x16u);
  }
  v5 = a3;
  objc_msgSend(v5, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("(null)");
    }
    v12 = 136315394;
    v13 = "BAItemCopySyncData";
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "<- %s -> Return data of size: %{public}@", (uint8_t *)&v12, 0x16u);
    if (v8)

  }
  return (__CFData *)v8;
}

- (void)setSyncData:(__CFData *)a3 item:(void *)a4
{
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", CFDataGetLength(a3));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("(null)");
    }
    v12 = 136315650;
    v13 = "BAItemSetSyncData";
    v14 = 2114;
    v15 = a4;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, data of size: %{public}@)", (uint8_t *)&v12, 0x20u);
    if (a3)

  }
  v8 = a4;
  objc_msgSend(v8, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isInserted"))
  {
    objc_msgSend(v8, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSyncData:forBookmark:", a3, v9);

  }
  else
  {
    objc_msgSend(v9, "setSyncData:", a3);
  }
  v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "BAItemSetSyncData";
    _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v12, 0xCu);
  }

}

- (int)changeTypeForChange:(void *)a3
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "BAChangeGetChangeType";
    v10 = 2114;
    v11 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  v5 = objc_msgSend(a3, "changeType");
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "BAChangeGetChangeType";
    v10 = 1024;
    LODWORD(v11) = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v8, 0x12u);
  }
  return v5;
}

- (void)copyChangedItemWithChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  BABookmarkItem *v7;
  BABookmarkItem *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "BAChangeCopyChangedItem";
    v15 = 2114;
    v16 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  v5 = a3;
  if (objc_msgSend(v5, "changeType") == 2)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "BAChangeCopyChangedItem";
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    v8 = [BABookmarkItem alloc];
    objc_msgSend(v5, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BABookmarkItem initWithBookmarkCollection:bookmark:](v8, "initWithBookmarkCollection:bookmark:", v9, v10);

    v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "BAChangeCopyChangedItem";
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v7;
}

- (__CFString)copyServerIdWithChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "BAChangeCopyServerId";
    v13 = 2114;
    v14 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v11, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverID");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    -[__CFString wb_stringByRedactingBookmarkDAVServerID](v6, "wb_stringByRedactingBookmarkDAVServerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "BAChangeCopyServerId";
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v11, 0x16u);

  }
  return v6;
}

- (BOOL)changeIsDAVMoveChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "BAChangeIsMove";
    v11 = 2114;
    v12 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(%{public}@)", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "attributesMarkedAsModified:", 64);

  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "BAChangeIsMove";
    v11 = 1024;
    LODWORD(v12) = v6;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v9, 0x12u);
  }
  return v6;
}

- (int64_t)itemTypeForChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "CKBAChangeGetItemType";
    v11 = 2114;
    v12 = (int64_t)a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFolder");

  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "CKBAChangeGetItemType";
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (int64_t)folderTypeForChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  int64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBAChangeGetFolder";
    v12 = 2114;
    v13 = (int64_t)a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(folder: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "specialID");
  switch(v6)
  {
    case 4:
      v7 = 0;
      break;
    case 1:
      v7 = 1;
      break;
    case 2:
      v7 = 2;
      break;
    case 3:
      v7 = 3;
      break;
    default:
      v7 = 0;
      break;
  }

  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBAChangeGetFolder";
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (int64_t)bookmarkTypeForChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBAChangeGetBookmarkType";
    v10 = 2114;
    v11 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(bookmark: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CKBABookmarkTypeForBookmark(v5);

  return v6;
}

- (id)copyDeviceIdentifier
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[WBBookmarkDBAccess copyDeviceIdentifier]";
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "-> %s()", (uint8_t *)&v10, 0xCu);
  }
  +[WebBookmarkCollection deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:](WebBookmarkCollection, "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", self->_collectionType, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WBBookmarkDBAccess copyDeviceIdentifier].cold.1();
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[WBBookmarkDBAccess copyDeviceIdentifier]";
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v10, 0xCu);
  }
  return v6;
}

- (void)resetDeviceIdentifier
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[WBBookmarkDBAccess resetDeviceIdentifier]";
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "-> %s()", (uint8_t *)&v6, 0xCu);
  }
  +[WebBookmarkCollection resetDeviceIdentifierForCloudKitWithCollectionType:](WebBookmarkCollection, "resetDeviceIdentifierForCloudKitWithCollectionType:", self->_collectionType);
  v4 = +[WebBookmarkCollection deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:](WebBookmarkCollection, "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", self->_collectionType, 1);
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[WBBookmarkDBAccess resetDeviceIdentifier]";
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)performMaintenanceOnDatabase:(void *)a3 afterVersion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "CKBADatabasePerformMaintenanceAfterVersion";
    v16 = 2114;
    v17 = a3;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, start version: %{public}@)", (uint8_t *)&v14, 0x20u);
  }
  v7 = a3;
  v8 = objc_msgSend(CFSTR("605.2.2"), "safari_isVersionStringGreaterThanVersionString:", v5);
  v9 = objc_msgSend(v5, "safari_isVersionStringBetweenVersionString:andVersionString:", CFSTR("606"), CFSTR("606.1.16"));
  if ((v8 & 1) != 0 || v9)
    v10 = objc_msgSend(v7, "fixCachedNumberOfChildrenIfNeeded");
  else
    v10 = 0;
  v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = "NO";
    if (v10)
      v12 = "YES";
    v14 = 136315394;
    v15 = "CKBADatabasePerformMaintenanceAfterVersion";
    v16 = 2080;
    v17 = (void *)v12;
    _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> %s", (uint8_t *)&v14, 0x16u);
  }

  return v10;
}

- (int64_t)localCloudKitMigrationState:(void *)a3
{
  NSObject *v4;
  int64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBADatabaseGetLocalCloudKitMigrationState";
    v10 = 2114;
    v11 = (int64_t)a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  v5 = objc_msgSend(a3, "localMigrationState");
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBADatabaseGetLocalCloudKitMigrationState";
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s -> %lld", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (void)setLocalCloudKitMigrationState:(int64_t)a3 database:(void *)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "CKBADatabaseSetLocalCloudKitMigrationState";
    v10 = 2114;
    v11 = a4;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, migration state: %lld)", (uint8_t *)&v8, 0x20u);
  }
  objc_msgSend(a4, "setLocalMigrationState:generateDeviceIdentifierIfNeeded:", a3, 1);
  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "CKBADatabaseSetLocalCloudKitMigrationState";
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v8, 0xCu);
  }
}

- (id)copyUsernameAccountHashWithDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBADatabaseCopyUsernameAccountHash";
    v10 = 2114;
    v11 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(a3, "deprecatedUsernameAccountHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBADatabaseCopyUsernameAccountHash";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)copyAccountHashWithDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBADatabaseCopyAccountHash";
    v10 = 2114;
    v11 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(a3, "accountHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBADatabaseCopyAccountHash";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (void)setAccountHash:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "CKBADatabaseSetAccountHash";
    v10 = 2114;
    v11 = a4;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, account hash: %{public}@)", (uint8_t *)&v8, 0x20u);
  }
  objc_msgSend(a4, "updateAccountHash:", v5);
  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "CKBADatabaseSetAccountHash";
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v8, 0xCu);
  }

}

- (id)copyChangeTokenWithDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBADatabaseCopyChangeToken";
    v12 = 2114;
    v13 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "currentRecordGeneration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBADatabaseCopyChangeToken";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (void)copyItemWithLocalID:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BABookmarkItem *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v16 = 136315650;
    v17 = "CKBADatabaseCopyItemWithLocalID";
    v18 = 2114;
    v19 = a4;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v16, 0x20u);
  }
  if (!v5)
  {
    v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "intValue");
LABEL_7:
    v8 = a4;
    objc_msgSend(v8, "bookmarkWithID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[BABookmarkItem initWithBookmarkCollection:bookmark:]([BABookmarkItem alloc], "initWithBookmarkCollection:bookmark:", v8, v9);
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "CKBADatabaseCopyItemWithLocalID";
        v18 = 2114;
        v19 = v10;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 136315138;
        v17 = "CKBADatabaseCopyItemWithLocalID";
        _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
      }
      v10 = 0;
    }

    goto LABEL_19;
  }
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[WBBookmarkDBAccess copyItemWithLocalID:database:].cold.1(v12);
  v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "CKBADatabaseCopyItemWithLocalID";
    _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
  }
  v10 = 0;
LABEL_19:

  return v10;
}

- (id)copyLocalIDsInFolderWithLocalID:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v16 = 136315650;
    v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
    v18 = 2114;
    v19 = a4;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v16, 0x20u);
  }
  if (!v5)
  {
    v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "intValue");
LABEL_7:
    objc_msgSend(a4, "syncableBookmarksIDsInFolderWithBookmarkID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
        v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v16, 0x16u);
      }
      v11 = v8;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[WBBookmarkDBAccess copyLocalIDsInFolderWithLocalID:database:].cold.1();
      v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 136315138;
        v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
        _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
      }
    }

    goto LABEL_21;
  }
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[WBBookmarkDBAccess copyLocalIDsInFolderWithLocalID:database:].cold.2(v12);
  v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
    _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v8;
}

- (void)copyItemWithServerId:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BABookmarkItem *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "CKBADatabaseCopyItemWithServerId";
    v15 = 2114;
    v16 = a4;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", (uint8_t *)&v13, 0x20u);
  }
  v7 = a4;
  objc_msgSend(v7, "bookmarkWithServerID:excludeDeletedBookmarks:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[BABookmarkItem initWithBookmarkCollection:bookmark:]([BABookmarkItem alloc], "initWithBookmarkCollection:bookmark:", v7, v8);
    v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "CKBADatabaseCopyItemWithServerId";
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "CKBADatabaseCopyItemWithServerId";
      _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v13, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)addItem:(void *)a3 underFolderWithServerId:(id)a4 database:(void *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v33 = 136315906;
    v34 = "CKBADatabaseAddItemUnderFolderWithServerId";
    v35 = 2114;
    v36 = a5;
    v37 = 2114;
    v38 = a3;
    v39 = 2114;
    v40 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, item: %{public}@, parentSyncServerId: %{public}@)", (uint8_t *)&v33, 0x2Au);
  }
  v9 = a3;
  objc_msgSend(v9, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bookmark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "bookmarkIDForServerID:excludeDeletedBookmarks:", v7, 1);
  if ((_DWORD)v12 == 0x7FFFFFFF)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v33 = 136315394;
      v34 = "saveBookmarkUnderFolderWithServerId";
      v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "@@ %s: Parent server ID %{public}@ does not point to any item in the local database", (uint8_t *)&v33, 0x16u);
    }
    goto LABEL_6;
  }
  v15 = v12;
  if (objc_msgSend(v10, "isMerging"))
  {
    if (objc_msgSend(v11, "specialID"))
    {
      objc_msgSend(v10, "bookmarkWithSpecialID:", objc_msgSend(v11, "specialID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
LABEL_10:
        objc_msgSend(v10, "_mergeBookmark:withOriginalBookmark:prioritizeOriginalBookmarkAttributes:generateChangesIfNeeded:", v11, v16, 0, 1);
        objc_msgSend(v10, "_markBookmarkID:added:", objc_msgSend(v16, "identifier"), 0);
        objc_msgSend(v11, "serverID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setServerID:forBookmark:", v17, v16);

        objc_msgSend(v11, "syncData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setSyncData:forBookmark:", v18, v16);

        objc_msgSend(v11, "syncKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setSyncKey:forBookmark:", v19, v16);

        objc_msgSend(v9, "setBookmark:", v16);
        v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[WBBookmarkDBAccess addItem:underFolderWithServerId:database:].cold.1((uint64_t)v16, v20);

        v14 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      v21 = objc_msgSend(v11, "isFolder");
      objc_msgSend(v11, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v10, "_mergeCandidateFolderWithTitle:parent:mergeMode:", v22, v15, objc_msgSend(v10, "_mergeMode"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "address");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_mergeCandidateBookmarkWithTitle:address:parent:mergeMode:", v22, v23, v15, objc_msgSend(v10, "_mergeMode"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v16)
        goto LABEL_10;
    }
  }
  if ((objc_msgSend(v11, "isInserted") & 1) == 0)
  {
    objc_msgSend(v11, "_setParentID:", v15);
    objc_msgSend(v10, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v11, objc_msgSend(v11, "specialID"), 0);
    objc_msgSend(v10, "_markBookmarkID:added:", objc_msgSend(v11, "identifier"), 0);
    objc_msgSend(v11, "serverID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServerID:forBookmark:", v26, v11);

    objc_msgSend(v11, "syncData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSyncData:forBookmark:", v27, v11);

    objc_msgSend(v11, "syncKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSyncKey:forBookmark:", v28, v11);

    v29 = objc_msgSend(v11, "identifier");
    objc_msgSend(v11, "isSelectedFavoritesFolder");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:", v29, 0, objc_msgSend(v30, "BOOLValue"));

    v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v14 = 1;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    v33 = 136315650;
    v34 = "saveBookmarkUnderFolderWithServerId";
    v35 = 2114;
    v36 = v9;
    v37 = 2114;
    v38 = v7;
    v25 = "@@ %s: Record %{public}@ was insert in parent record with server ID %{public}@";
    goto LABEL_26;
  }
  if (objc_msgSend(v11, "parentID") == (_DWORD)v15)
  {
    v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v14 = 1;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    v33 = 136315650;
    v34 = "saveBookmarkUnderFolderWithServerId";
    v35 = 2114;
    v36 = v9;
    v37 = 2114;
    v38 = v7;
    v25 = "@@ %s: Record %{public}@ is already inside parent record with server ID %{public}@";
    goto LABEL_26;
  }
  if (!objc_msgSend(v10, "_moveBookmark:toFolderWithID:detectCycles:", v11, v15, 1))
  {
LABEL_6:
    v14 = 0;
    goto LABEL_27;
  }
  v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  v14 = 1;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v33 = 136315650;
    v34 = "saveBookmarkUnderFolderWithServerId";
    v35 = 2114;
    v36 = v9;
    v37 = 2114;
    v38 = v7;
    v25 = "@@ %s: Record %{public}@ did move to parent record with server ID %{public}@";
LABEL_26:
    _os_log_impl(&dword_211022000, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v33, 0x20u);
  }
LABEL_27:

  v31 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v33 = 136315394;
    v34 = "CKBADatabaseAddItemUnderFolderWithServerId";
    v35 = 1024;
    LODWORD(v36) = v14;
    _os_log_impl(&dword_211022000, v31, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v33, 0x12u);
  }

  return v14;
}

- (void)performDeduplicationWithDatabase:(void *)a3 mode:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "CKBADatabasePerformDeduplication";
    v10 = 2114;
    v11 = a3;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, mode: %ld)", (uint8_t *)&v8, 0x20u);
  }
  objc_msgSend(a3, "_deduplicateBookmarksForSyncingAndTrackChanges:considerBookmarksWithSyncDataAsUnique:", a4 == 2, a4 == 1);
  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "CKBADatabasePerformDeduplication";
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v8, 0xCu);
  }
}

- (id)copyServerIdsInFolderWithServerId:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v5, "wb_stringByRedactingBookmarkDAVServerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v25 = "CKBADatabaseCopyServerIdsInFolderWithServerId";
    v26 = 2114;
    v27 = a4;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@)", buf, 0x20u);

  }
  objc_msgSend(a4, "serverIDsInFolderWithServerID:excludeDeletedBookmarks:", v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v9;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, buf, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "wb_stringByRedactingBookmarkDAVServerID", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, buf, 16);
      }
      while (v15);
    }

    *(_DWORD *)buf = 136315394;
    v25 = "CKBADatabaseCopyServerIdsInFolderWithServerId";
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", buf, 0x16u);

  }
  return v9;
}

- (void)setChildrenOrder:(id)a3 forFolderWithServerId:(id)a4 database:(void *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v8, "wb_stringByRedactingBookmarkDAVServerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "CKBADatabaseSetChildrenOrderForFolderWithServerId";
    v16 = 2114;
    v17 = a5;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, %{public}@, %{public}@)", (uint8_t *)&v14, 0x2Au);

  }
  objc_msgSend(a5, "_orderChildrenWithServerIDs:inFolderWithServerID:excludeDeletedBookmarks:", v7, v8, 1);
  v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "CKBADatabaseSetChildrenOrderForFolderWithServerId";
    _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v14, 0xCu);
  }

}

- (id)copyServerIdInFolderBeforeServerId:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "CKBADatabaseCopyServerIdInFolderBeforeServerId";
    v12 = 2114;
    v13 = a4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, request before targetItemId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(a4, "_serverIDBeforeServerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBADatabaseCopyServerIdInFolderBeforeServerId";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)copyServerIdInFolderAfterServerId:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "CKBADatabaseCopyServerIdInFolderAfterServerId";
    v12 = 2114;
    v13 = a4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, request after targetItemId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(a4, "_serverIDAfterServerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBADatabaseCopyServerIdInFolderAfterServerId";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)copyFirstServerIdInFolderWithServerId:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "CKBADatabaseCopyFirstServerIdInFolderWithServerId";
    v12 = 2114;
    v13 = a4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, folderServerId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(a4, "_firstServerIDInFolderWithServerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBADatabaseCopyFirstServerIdInFolderWithServerId";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)copyLastServerIdInFolderWithServerId:(id)a3 database:(void *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "CKBADatabaseCopyLastServerIdInFolderWithServerId";
    v12 = 2114;
    v13 = a4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, folderServerId: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(a4, "_lastServerIDInFolderWithServerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBADatabaseCopyLastServerIdInFolderWithServerId";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (int64_t)itemTypeWithItem:(void *)a3
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "CKBAItemGetItemType";
    v11 = 2114;
    v12 = (int64_t)a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFolder");

  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "CKBAItemGetItemType";
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (BOOL)item:(void *)a3 isInFolderWithServerSyncId:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19 = 136315650;
    v20 = "CKBAItemGetIsInFolderWithServerSyncId";
    v21 = 2114;
    v22 = a3;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, parentRecordName: %@)", (uint8_t *)&v19, 0x20u);
  }
  v7 = a3;
  objc_msgSend(v7, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInserted") & 1) != 0)
  {
    objc_msgSend(v7, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "parentID");
    if (v5 || (_DWORD)v10)
    {
      if (v5)
      {
        objc_msgSend(v9, "serverIDForBookmarkID:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v14, "isEqualToString:", v5);
        v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = "NO";
          if (v12)
            v16 = "YES";
          v19 = 136315394;
          v20 = "CKBAItemGetIsInFolderWithServerSyncId";
          v21 = 2080;
          v22 = (void *)v16;
          _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_INFO, "<- %s -> %s", (uint8_t *)&v19, 0x16u);
        }

      }
      else
      {
        v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v19 = 136315138;
          v20 = "CKBAItemGetIsInFolderWithServerSyncId";
          _os_log_impl(&dword_211022000, v17, OS_LOG_TYPE_INFO, "<- %s -> NO", (uint8_t *)&v19, 0xCu);
        }
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      LOBYTE(v12) = 1;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v19 = 136315138;
        v20 = "CKBAItemGetIsInFolderWithServerSyncId";
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> YES", (uint8_t *)&v19, 0xCu);
      }
    }

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = "CKBAItemGetIsInFolderWithServerSyncId";
      _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "<- %s -> NO", (uint8_t *)&v19, 0xCu);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)item:(void *)a3 isEqualToItem:(void *)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "CKBAItemIsEqualToItem";
    v14 = 2114;
    v15 = a3;
    v16 = 2114;
    v17 = a4;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(item1: %{public}@, item2: %{public}@)", (uint8_t *)&v12, 0x20u);
  }
  objc_msgSend(a3, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToBookmark:", v8);
  v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "CKBAItemIsEqualToItem";
    v14 = 1024;
    LODWORD(v15) = v9;
    _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v12, 0x12u);
  }

  return v9;
}

- (int64_t)folderTypeWithFolder:(void *)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  int64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBAFolderGetFolderType";
    v12 = 2114;
    v13 = (int64_t)a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(folder: %{public}@)", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "specialID");
  switch(v6)
  {
    case 4:
      v7 = 0;
      break;
    case 1:
      v7 = 1;
      break;
    case 2:
      v7 = 2;
      break;
    case 3:
      v7 = 3;
      break;
    default:
      v7 = 0;
      break;
  }

  v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "CKBAFolderGetFolderType";
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "<- %s -> %ld", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

- (void)createFolderWithType:(int64_t)a3 database:(void *)a4
{
  NSObject *v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  id v10;
  BABookmarkItem *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "CKBADatabaseCreateFolder";
    v16 = 2114;
    v17 = a4;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, folder type: %lld)", (uint8_t *)&v14, 0x20u);
  }
  v7 = a4;
  v8 = [WebBookmark alloc];
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WebBookmark initFolderWithParentID:collectionType:](v8, "initFolderWithParentID:collectionType:", 0, objc_msgSend(v9, "collectionType"));

  if ((unint64_t)(a3 - 1) <= 2 && *off_24CB31890[a3 - 1])
    objc_msgSend(v10, "markSpecial:");
  objc_msgSend(v10, "setSubtype:", a3 == 4);
  v11 = -[BABookmarkItem initWithBookmarkCollection:bookmark:]([BABookmarkItem alloc], "initWithBookmarkCollection:bookmark:", v7, v10);
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "CKBADatabaseCreateFolder";
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v14, 0x16u);
  }

  return v11;
}

- (int64_t)bookmarkTypeWithBookmark:(void *)a3
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "CKBABookmarkGetBookmarkType";
    v10 = 2114;
    v11 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(bookmark: %{public}@)", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CKBABookmarkTypeForBookmark(v5);

  return v6;
}

- (void)createBookmarkWithType:(int64_t)a3 database:(void *)a4
{
  NSObject *v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  WebBookmark *v10;
  WebBookmark *v11;
  void *v12;
  BABookmarkItem *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v16 = 136315650;
    v17 = "CKBADatabaseCreateBookmark";
    v18 = 2114;
    v19 = a4;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@, bookmark type: %lld)", (uint8_t *)&v16, 0x20u);
  }
  v7 = a4;
  switch(a3)
  {
    case 2:
      v11 = [WebBookmark alloc];
      objc_msgSend(v7, "currentDeviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WebBookmark initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:](v11, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", &stru_24CB35168, &stru_24CB35168, 0, 1, v9, objc_msgSend(v12, "collectionType"));

      goto LABEL_8;
    case 1:
      v10 = -[WebBookmark initReadingListBookmarkWithTitle:address:previewText:]([WebBookmark alloc], "initReadingListBookmarkWithTitle:address:previewText:", &stru_24CB35168, &stru_24CB35168, &stru_24CB35168);
      break;
    case 0:
      v8 = [WebBookmark alloc];
      objc_msgSend(v7, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WebBookmark initWithTitle:address:collectionType:](v8, "initWithTitle:address:collectionType:", &stru_24CB35168, &stru_24CB35168, objc_msgSend(v9, "collectionType"));
LABEL_8:

      break;
    default:
      v10 = 0;
      break;
  }
  v13 = -[BABookmarkItem initWithBookmarkCollection:bookmark:]([BABookmarkItem alloc], "initWithBookmarkCollection:bookmark:", v7, v10);
  v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "CKBADatabaseCreateBookmark";
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v16, 0x16u);
  }

  return v13;
}

- (BOOL)changeIsMoveChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "CKBAChangeGetWasBookmarkMoved";
    v11 = 2114;
    v12 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a3, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "attributesMarkedAsModified:", 64) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "attributesMarkedAsModified:", 4);
  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "CKBAChangeGetWasBookmarkMoved";
    v11 = 1024;
    LODWORD(v12) = v6;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "<- %s -> %d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)copyDeletedBookmarkSyncDataWithChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "CKBAChangeCopyDeletedBookmarkSyncData";
    v15 = 2114;
    v16 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  v5 = a3;
  if (objc_msgSend(v5, "changeType") == 2)
  {
    objc_msgSend(v5, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v10 = objc_msgSend(v7, "length");
      v13 = 136315650;
      v14 = "CKBAChangeCopyDeletedBookmarkSyncData";
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "<- %s -> syncData %p of size: %ld", (uint8_t *)&v13, 0x20u);

    }
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "CKBAChangeCopyDeletedBookmarkSyncData";
      _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)setDeletedBookmarkSyncData:(id)a3 change:(void *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v21 = 136315906;
    v22 = "CKBAChangeSetDeletedBookmarkSyncData";
    v23 = 2114;
    v24 = a4;
    v25 = 2048;
    v26 = v5;
    v27 = 2048;
    v28 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@, syncData %p of size: %zd)", (uint8_t *)&v21, 0x2Au);

  }
  v8 = a4;
  objc_msgSend(v8, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "changeType") == 2)
  {
    if ((objc_msgSend(v9, "isInserted") & 1) != 0)
    {
      objc_msgSend(v8, "collection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setSyncData:forBookmark:", v5, v9);

      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v21 = 136315138;
        v22 = "CKBAChangeSetDeletedBookmarkSyncData";
LABEL_15:
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[WBBookmarkDBAccess setDeletedBookmarkSyncData:change:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v21 = 136315138;
        v22 = "CKBAChangeSetDeletedBookmarkSyncData";
        goto LABEL_15;
      }
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[WBBookmarkDBAccess setDeletedBookmarkSyncData:change:].cold.2(v12, v8, v9);
    v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "CKBAChangeSetDeletedBookmarkSyncData";
      goto LABEL_15;
    }
  }

}

- (id)copyModifiedAttributesWithChange:(void *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "CKBAChangeCopyModifiedAttributes";
    v15 = 2114;
    v16 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(change: %{public}@)", (uint8_t *)&v13, 0x16u);
  }
  v5 = a3;
  objc_msgSend(v5, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "changeType") == 0;
  objc_msgSend(v5, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  copyBookmarkAttributes(v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[WBBookmarkDBAccess copyModifiedAttributesWithChange:].cold.1();
  v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "CKBAChangeCopyModifiedAttributes";
    _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v13, 0xCu);
  }

  return v9;
}

- (id)copyAttributesWithItem:(void *)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v17 = 136315394;
    v18 = "CKBAItemCopyAttributes";
    v19 = 2114;
    v20 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", (uint8_t *)&v17, 0x16u);
  }
  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(v6, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  copyBookmarkAttributes(v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithDictionary:copyItems:", v10, 1);

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allKeysForObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectsForKeys:", v13);

  v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[WBBookmarkDBAccess copyAttributesWithItem:].cold.1();
  v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "CKBAItemCopyAttributes";
    _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v17, 0xCu);
  }
  return v11;
}

- (void)setModifiedAttributes:(id)a3 item:(void *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  __CFString *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  NSObject *v63;
  void *v64;
  int v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  int v79;
  NSObject *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  int v89;
  const char *v90;
  __int16 v91;
  void *v92;
  _BYTE buf[24];
  void *v94;
  id v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CKBAItemSetModifiedAttributes";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@)", buf, 0x16u);
  }
  v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WBBookmarkDBAccess setModifiedAttributes:item:].cold.1();
  v8 = a4;
  objc_msgSend(v8, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __CKBAItemSetModifiedAttributes_block_invoke;
  v94 = &unk_24CB31830;
  v11 = v9;
  v95 = v11;
  v12 = v10;
  v96 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x212BD4C84](buf);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Title"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = v15;
      objc_msgSend(v16, "numberWithUnsignedInteger:", -[__CFString length](v14, "length"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      v91 = 2114;
      v92 = v18;
      _os_log_impl(&dword_211022000, v17, OS_LOG_TYPE_INFO, "@@ %s: Set title to value of length: %{public}@", (uint8_t *)&v89, 0x16u);

    }
    v19 = v11;
    v20 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[__CFString isEqual:](v14, "isEqual:", v21);

    if (!v22)
      goto LABEL_14;
    v23 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_211022000, v23, OS_LOG_TYPE_INFO, "@@ %s: Set title to value of length: (null)", (uint8_t *)&v89, 0xCu);
    }
    v20 = &stru_24CB35168;
    v19 = v11;
  }
  objc_msgSend(v19, "setTitle:", v20);
LABEL_14:
  if (!objc_msgSend(v11, "isFolder"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v32, "absoluteString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (void *)MEMORY[0x24BDD16E0];
        v36 = v34;
        objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v33, "length"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 136315394;
        v90 = "CKBAItemSetModifiedAttributes";
        v91 = 2114;
        v92 = v37;
        _os_log_impl(&dword_211022000, v36, OS_LOG_TYPE_INFO, "@@ %s: Set URL to value of length: %{public}@", (uint8_t *)&v89, 0x16u);

      }
      objc_msgSend(v11, "setAddress:", v33);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v32, "isEqual:", v38);

      if (v39)
      {
        v40 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v89 = 136315138;
          v90 = "CKBAItemSetModifiedAttributes";
          _os_log_impl(&dword_211022000, v40, OS_LOG_TYPE_INFO, "@@ %s: Set URL to value of length: (null)", (uint8_t *)&v89, 0xCu);
        }
        objc_msgSend(v11, "setAddress:", &stru_24CB35168);
      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ShowIconOnly"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v89 = 136315394;
        v90 = "CKBAItemSetModifiedAttributes";
        v91 = 2112;
        v92 = v41;
        _os_log_impl(&dword_211022000, v42, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: %@", (uint8_t *)&v89, 0x16u);
      }
      v43 = objc_msgSend(v41, "BOOLValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v41, "isEqual:", v44);

      if (!v45)
        goto LABEL_38;
      v46 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v89 = 136315138;
        v90 = "CKBAItemSetModifiedAttributes";
        _os_log_impl(&dword_211022000, v46, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: 0", (uint8_t *)&v89, 0xCu);
      }
      v43 = 0;
    }
    objc_msgSend(v11, "setShowIconOnly:", v43);
LABEL_38:
    if ((objc_msgSend(v11, "isReadingListItem") & 1) == 0)
    {
      v13[2](v13);
      v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        goto LABEL_93;
      v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      goto LABEL_92;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DateAdded"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v49 = v47;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v47, "isEqual:", v50);

      if (!v51)
        goto LABEL_43;
      v49 = 0;
    }
    objc_msgSend(v11, "setDateAdded:", v49);
LABEL_43:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DateLastViewed"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v53 = objc_opt_isKindOfClass();
    v54 = v52;
    if ((v53 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", v52);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v52, "isEqual:", v55);

      if (!v56)
        goto LABEL_47;
      v54 = 0;
    }
    objc_msgSend(v11, "setReadingListDateLastViewed:", v54);
LABEL_47:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PreviewText"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v58 = objc_opt_isKindOfClass();
    v59 = v57;
    if ((v58 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", v57);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v57, "isEqual:", v60);

      if (!v61)
      {
LABEL_51:
        objc_msgSend(v5, "wb_URLForKey:isValid:", CFSTR("ImageURL"), 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v41, "absoluteString");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setReadingListIconURL:", v62);

        }
        v13[2](v13);
        v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (!os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          goto LABEL_93;
        v89 = 136315138;
        v90 = "CKBAItemSetModifiedAttributes";
LABEL_92:
        _os_log_impl(&dword_211022000, v63, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v89, 0xCu);
        goto LABEL_93;
      }
      v59 = 0;
    }
    objc_msgSend(v11, "setPreviewText:", v59);
    goto LABEL_51;
  }
  objc_msgSend(v12, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "collectionType");

  if (v25 != 1)
  {
    v26 = v14;
    goto LABEL_62;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastSelectedTab"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)MEMORY[0x24BDD16E0];
      v29 = v27;
      objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v26, "length"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      v91 = 2114;
      v92 = v30;
      _os_log_impl(&dword_211022000, v29, OS_LOG_TYPE_INFO, "@@ %s: Set last selected child ID to value of length: %{public}@", (uint8_t *)&v89, 0x16u);

    }
    v31 = objc_msgSend(v12, "bookmarkIDForServerID:excludeDeletedBookmarks:", v26, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v26, "isEqual:", v64);

    if (!v65)
      goto LABEL_62;
    v66 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_211022000, v66, OS_LOG_TYPE_INFO, "@@ %s: Set last selected child ID to null", (uint8_t *)&v89, 0xCu);
    }
    v31 = 0x7FFFFFFFLL;
  }
  objc_msgSend(v11, "setLastSelectedChildID:", v31);
LABEL_62:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SymbolImageName"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
    v70 = v67;
    if (v69)
    {
      v71 = (void *)MEMORY[0x24BDD16E0];
      v72 = v68;
      objc_msgSend(v71, "numberWithUnsignedInteger:", objc_msgSend(v67, "length"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      v91 = 2114;
      v92 = v73;
      _os_log_impl(&dword_211022000, v72, OS_LOG_TYPE_INFO, "@@ %s: Set symbolImageName to value of length: %{public}@", (uint8_t *)&v89, 0x16u);

      v70 = v67;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_70;
    v74 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_211022000, v74, OS_LOG_TYPE_INFO, "@@ %s: Set symbolImageName to null", (uint8_t *)&v89, 0xCu);
    }
    v70 = 0;
  }
  objc_msgSend(v11, "setSymbolImageName:", v70);
LABEL_70:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ShowIconOnly"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      v89 = 136315394;
      v90 = "CKBAItemSetModifiedAttributes";
      v91 = 2112;
      v92 = v75;
      _os_log_impl(&dword_211022000, v76, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: %@", (uint8_t *)&v89, 0x16u);
    }
    v77 = objc_msgSend(v75, "BOOLValue");
LABEL_78:
    objc_msgSend(v11, "setShowIconOnly:", v77);
    goto LABEL_79;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v75, "isEqual:", v78);

  if (v79)
  {
    v80 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      v89 = 136315138;
      v90 = "CKBAItemSetModifiedAttributes";
      _os_log_impl(&dword_211022000, v80, OS_LOG_TYPE_INFO, "@@ %s: Set showIconOnly to value: 0", (uint8_t *)&v89, 0xCu);
    }
    v77 = 0;
    goto LABEL_78;
  }
LABEL_79:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsSelectedFavoritesFolder"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v41, "isEqual:", v81);

    if (!v82)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v83 = v11;
        v84 = v41;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v41, "isEqual:", v85);

        if (!v86)
        {
          v13[2](v13);
          goto LABEL_90;
        }
        v83 = v11;
        v84 = 0;
      }
      objc_msgSend(v83, "setSelectedFavoritesFolder:", v84);
      v13[2](v13);
      if (objc_msgSend(v11, "isInserted"))
      {
        v87 = objc_msgSend(v41, "BOOLValue");
        objc_msgSend(v8, "collection");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:", objc_msgSend(v11, "identifier"), v87 ^ 1, v87);

      }
LABEL_90:
      v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        v89 = 136315138;
        v90 = "CKBAItemSetModifiedAttributes";
        goto LABEL_92;
      }
      goto LABEL_93;
    }
  }
  v13[2](v13);
  v63 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v89 = 136315138;
    v90 = "CKBAItemSetModifiedAttributes";
    goto LABEL_92;
  }
LABEL_93:

}

- (id)copyValueForKey:(id)a3 item:(void *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v30 = 136315650;
    v31 = "CKBAItemCopyValueForKey";
    v32 = 2114;
    v33 = a4;
    v34 = 2114;
    v35 = v5;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "-> %s(item: %{public}@, key: %{public}@)", (uint8_t *)&v30, 0x20u);
  }
  objc_msgSend(a4, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Title")))
  {
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WBBookmarkDBAccess copyValueForKey:item:].cold.1();
    v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_52;
    if (v8)
      goto LABEL_8;
    v11 = CFSTR("(null)");
    goto LABEL_33;
  }
  if (!objc_msgSend(v7, "isFolder"))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("URL")))
    {
      objc_msgSend(v7, "address");
      v10 = objc_claimAutoreleasedReturnValue();
      v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.1();
      v14 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject length](v10, "length"));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = CFSTR("(null)");
        }
        v30 = 136315394;
        v31 = "CKBAItemCopyValueForKey";
        v32 = 2114;
        v33 = v15;
        _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted; length: %{public}@",
          (uint8_t *)&v30,
          0x16u);
        if (v10)

      }
      v23 = v10;
      goto LABEL_51;
    }
    if ((objc_msgSend(v7, "isReadingListItem") & 1) == 0)
    {
      v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_40:
        v8 = 0;
        goto LABEL_53;
      }
      v30 = 136315138;
      v31 = "CKBAItemCopyValueForKey";
LABEL_39:
      _os_log_impl(&dword_211022000, v20, OS_LOG_TYPE_INFO, "<- %s -> (null)", (uint8_t *)&v30, 0xCu);
      goto LABEL_40;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("DateAdded")))
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.4(v17);
      v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v30 = 136315138;
        v31 = "CKBAItemCopyValueForKey";
        _os_log_impl(&dword_211022000, v18, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
      }
      objc_msgSend(v7, "dateAdded");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("DateLastViewed")))
    {
      v21 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.5(v21);
      v22 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v30 = 136315138;
        v31 = "CKBAItemCopyValueForKey";
        _os_log_impl(&dword_211022000, v22, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
      }
      objc_msgSend(v7, "dateLastViewed");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PreviewText")))
      {
        v27 = objc_msgSend(v5, "isEqualToString:", CFSTR("ImageURL"));
        v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        v20 = v28;
        if (!v27)
        {
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            goto LABEL_40;
          v30 = 136315138;
          v31 = "CKBAItemCopyValueForKey";
          goto LABEL_39;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[WBBookmarkDBAccess copyValueForKey:item:].cold.7(v20);
        v29 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = 136315138;
          v31 = "CKBAItemCopyValueForKey";
          _os_log_impl(&dword_211022000, v29, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
        }
        objc_msgSend(v7, "readingListIconURL");
        v23 = objc_claimAutoreleasedReturnValue();
        v10 = v23;
LABEL_51:
        bookmarkURLWithString(v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:

        goto LABEL_53;
      }
      v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.6(v25);
      v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v30 = 136315138;
        v31 = "CKBAItemCopyValueForKey";
        _os_log_impl(&dword_211022000, v26, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted", (uint8_t *)&v30, 0xCu);
      }
      objc_msgSend(v7, "previewText");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v19;
    goto LABEL_53;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("IsSelectedFavoritesFolder")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("SymbolImageName")))
    {
      objc_msgSend(v7, "symbolImageName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[WBBookmarkDBAccess copyValueForKey:item:].cold.1();
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_52;
      if (v8)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      v11 = CFSTR("(null)");
LABEL_33:
      v30 = 136315394;
      v31 = "CKBAItemCopyValueForKey";
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "<- %s -> Return value redacted; length: %{public}@",
        (uint8_t *)&v30,
        0x16u);
      if (v8)

      goto LABEL_52;
    }
    v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_40;
    v30 = 136315138;
    v31 = "CKBAItemCopyValueForKey";
    goto LABEL_39;
  }
  objc_msgSend(v7, "isSelectedFavoritesFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v30 = 136315394;
    v31 = "CKBAItemCopyValueForKey";
    v32 = 2114;
    v33 = v8;
    _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "<- %s -> %{public}@", (uint8_t *)&v30, 0x16u);
  }
LABEL_53:

  return v8;
}

- (void)clearlAllLocalBookmarksForAutomatedTestingWithDatabase:(void *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "CKBADatabaseClearAllLocalBookmarksForAutomatedTesting";
    v9 = 2114;
    v10 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", (uint8_t *)&v7, 0x16u);
  }
  v5 = a3;
  if (objc_msgSend(v5, "mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:", MEMORY[0x24BDBD1B8], 1, 0, 0))objc_msgSend(v5, "postBookmarksDidReloadNotification");
  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "CKBADatabaseClearAllLocalBookmarksForAutomatedTesting";
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "<- %s", (uint8_t *)&v7, 0xCu);
  }

}

- (id)copySaveURLForAssetWithKey:(id)a3 item:(void *)a4
{
  void *v5;
  WBTabGroup *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!objc_msgSend(a3, "isEqual:", CFSTR("BackgroundImage")))
    return 0;
  objc_msgSend(a4, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBTabGroup initWithBookmark:]([WBTabGroup alloc], "initWithBookmark:", v5);
  -[WBTabGroup uuid](v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_startPageBackgroundImageFileURLForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)notifyForSaveOfAssetWithKey:(id)a3 item:(void *)a4
{
  void *v5;
  WBTabGroup *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (objc_msgSend(a3, "isEqual:", CFSTR("BackgroundImage")))
  {
    objc_msgSend(a4, "bookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBTabGroup initWithBookmark:]([WBTabGroup alloc], "initWithBookmark:", v5);
    -[WBTabGroup uuid](v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__WBBookmarkDBAccess_notifyForSaveOfAssetWithKey_item___block_invoke;
    v10[3] = &unk_24CB31830;
    v11 = v7;
    v12 = v5;
    v8 = v5;
    v9 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

void __55__WBBookmarkDBAccess_notifyForSaveOfAssetWithKey_item___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("backgroundImageIdentifier"));
  if (objc_msgSend(*(id *)(a1 + 40), "subtype") == 2)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("profileBackgroundImageIsDefined"));
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("nonGlobalStartPageBackgroundImageDidChangeRemotelyNotification"), 0, v3, 1);

}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (int64_t)storeOwner
{
  return self->_storeOwner;
}

- (void)clearChangesWithChangeToken:(uint64_t)a3 database:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_211022000, a1, a3, "XX %s: Could not clear the current change list", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)clearChangesWithChangeToken:(uint64_t)a3 database:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_211022000, a1, a3, "XX %s: Client passed us a change token that does not match the current generation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)removeItemWithServerId:(uint64_t)a3 database:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_211022000, a1, a3, "XX %s: Client requested that we remove the root folder", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)removeItemWithServerId:(void *)a1 database:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "wb_stringByRedactingBookmarkDAVServerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_211022000, v3, v4, "XX %s: Client requested that we remove item with server ID \"%{public}@\" but it does not exist", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)copyDeviceIdentifier
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v0, v1, "## %s(deviceIdentifier: %@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)copyItemWithLocalID:(void *)a1 database:.cold.1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_9_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_211022000, v4, v5, "XX %s: CKBALocalID is an instance of %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)copyLocalIDsInFolderWithLocalID:database:.cold.1()
{
  os_log_t v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "CKBADatabaseCopyLocalIDsInFolderWithLocalID";
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_211022000, v0, OS_LOG_TYPE_FAULT, "XX %s: Client requested server IDs of children of local ID \"%{public}@\" but it does not exist or is not a folder!", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

- (void)copyLocalIDsInFolderWithLocalID:(void *)a1 database:.cold.2(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_9_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_211022000, v4, v5, "XX %s: CKBALocalID is an instance of %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)addItem:(uint64_t)a1 underFolderWithServerId:(NSObject *)a2 database:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_211022000, a2, OS_LOG_TYPE_DEBUG, "Item was merged with %{private}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

- (void)setDeletedBookmarkSyncData:(uint64_t)a3 change:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_211022000, a1, a3, "XX %s: Cannot update the sync data of a Delete change that does exist in the database", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setDeletedBookmarkSyncData:(void *)a3 change:.cold.2(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  v5 = OUTLINED_FUNCTION_7(a1);
  v6 = 136315650;
  v7 = "CKBAChangeSetDeletedBookmarkSyncData";
  v8 = 1024;
  v9 = objc_msgSend(a2, "changeType");
  v10 = 1024;
  v11 = objc_msgSend(a3, "isInserted");
  _os_log_fault_impl(&dword_211022000, v5, OS_LOG_TYPE_FAULT, "XX %s: Cannot set the sync data of a change that is not a Delete. Change type = %d, inserted = %d", (uint8_t *)&v6, 0x18u);

}

- (void)copyModifiedAttributesWithChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v0, v1, "## %s(%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)copyAttributesWithItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v0, v1, "## %s(%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)setModifiedAttributes:item:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v0, v1, "## %s(attributes: %@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)copyValueForKey:item:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v0, v1, "## %s(value: %@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)copyValueForKey:(void *)a1 item:.cold.4(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "dateAdded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v1, v3, "## %s(value: %@)", (uint8_t *)v4);

  OUTLINED_FUNCTION_3_0();
}

- (void)copyValueForKey:(void *)a1 item:.cold.5(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "dateLastViewed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v1, v3, "## %s(value: %@)", (uint8_t *)v4);

  OUTLINED_FUNCTION_3_0();
}

- (void)copyValueForKey:(void *)a1 item:.cold.6(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "previewText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v1, v3, "## %s(value: %@)", (uint8_t *)v4);

  OUTLINED_FUNCTION_3_0();
}

- (void)copyValueForKey:(void *)a1 item:.cold.7(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "readingListIconURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_211022000, v1, v3, "## %s(value: %@)", (uint8_t *)v4);

  OUTLINED_FUNCTION_3_0();
}

@end
