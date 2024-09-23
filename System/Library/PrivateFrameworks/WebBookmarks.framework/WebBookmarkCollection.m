@implementation WebBookmarkCollection

- (id)currentDeviceIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  if (-[WBCollectionConfiguration isInMemoryDatabase](self->_configuration, "isInMemoryDatabase"))
  {
    -[WBCollectionConfiguration identifier](self->_configuration, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)deviceIdentifierForCloudKitWithCollectionType:(int64_t)a3 generateIfNeeded:(BOOL)a4
{
  id v4;
  _QWORD v6[7];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke;
  v6[3] = &unk_24CB329C0;
  v7 = a4;
  v6[5] = a3;
  v6[6] = a1;
  v6[4] = &v8;
  performBlockExclusively(v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  WebBookmarkDeviceIdentifier *v4;
  WebBookmarkDeviceIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WebBookmarkDeviceIdentifier *v11;
  NSObject *v12;

  collectionTypeToDeviceIdentifierDictionary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (WebBookmarkDeviceIdentifier *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[WebBookmarkDeviceIdentifier UUID](v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_7:

LABEL_8:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
      goto LABEL_11;
    }
    if (!*(_BYTE *)(a1 + 56)
      && !-[WebBookmarkDeviceIdentifier encounteredErrorWhileObtainingUUID](v5, "encounteredErrorWhileObtainingUUID"))
    {
      goto LABEL_8;
    }
  }
  objc_msgSend((id)objc_opt_class(), "safariDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(*(id *)(a1 + 48), "_cloudKitSyncMetadataFileNameWithCollectionType:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WebBookmarkDeviceIdentifier stopObservingChanges](v5, "stopObservingChanges");
    v11 = -[WebBookmarkDeviceIdentifier initWithPlistURL:readOnly:]([WebBookmarkDeviceIdentifier alloc], "initWithPlistURL:readOnly:", v10, *(_BYTE *)(a1 + 56) == 0);

    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v3);
    v5 = v11;
    goto LABEL_7;
  }
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke_cold_1();
LABEL_11:

}

- (WBCollectionConfiguration)configuration
{
  return self->_configuration;
}

- (id)bookmarkWithUUID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  WebBookmark *v7;
  void *v8;
  WebBookmark *v9;

  v4 = a3;
  v5 = -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("external_uuid = ? AND deleted = 0"));
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    v7 = [WebBookmark alloc];
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v7, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v5, v8, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    sqlite3_finalize(v5);
  }
  else
  {
    -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", v5);
    v9 = 0;
  }

  return v9;
}

- (sqlite3_stmt)_selectBookmarksWhere:(id)a3
{
  return -[WebBookmarkCollection _selectBookmarksWhere:returnType:](self, "_selectBookmarksWhere:returnType:", a3, 0);
}

+ (id)_cloudKitSyncMetadataFileNameWithCollectionType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("SafariTabsSyncMetadata.plist");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("BookmarksSyncMetadata.plist");
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  return self;
}

uint64_t __41__WebBookmarkCollection_Sync__unlockSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unlockSync");
}

- (BOOL)_verifyAllTablesExist:(int *)a3
{
  void *v5;
  int v6;
  const unsigned __int8 *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[8];
  sqlite3_stmt *v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, self->_db, "SELECT name from sqlite_master where type = 'table'");
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v6 = sqlite3_step(v20);
      if (v6 != 100)
        break;
      v7 = sqlite3_column_text(v20, 0);
      if (v7)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
        objc_msgSend(v5, "addObject:", v8);

      }
    }
    if (a3)
      *a3 = v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(&unk_24CB4B720, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(&unk_24CB4B720);
          if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)) & 1) == 0)
          {
            v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[WebBookmarkCollection _verifyAllTablesExist:].cold.1();
            v12 = 0;
            goto LABEL_20;
          }
        }
        v9 = objc_msgSend(&unk_24CB4B720, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_20:

  }
  else
  {
    v12 = 0;
    if (a3)
      *a3 = sqlite3_errcode(self->_db);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);
  return v12;
}

- (BOOL)_addBookmarkWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 orderIndex:(unsigned int)a6 isFolder:(BOOL)a7 externalUUID:(id)a8 associatedBookmark:(id)a9 updateParentChildCount:(BOOL)a10 updateAncestorEntries:(BOOL)a11 incrementGenerations:(BOOL)a12
{
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  id v18;
  id v19;
  int v20;
  sqlite3_stmt *v21;
  uint64_t v22;
  WebBookmarks::BookmarkSQLStatement *db;
  sqlite3 *v24;
  NSString *v25;
  NSObject *v26;
  BOOL v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  sqlite3_int64 insert_rowid;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  _BYTE v54[8];
  sqlite3_stmt *v55;
  char v56;
  uint8_t buf[4];
  _BYTE v58[14];
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v13 = a7;
  v14 = *(_QWORD *)&a6;
  v15 = *(void **)&a5;
  v63 = *MEMORY[0x24BDAC8D0];
  v52 = a3;
  v53 = a4;
  v18 = a8;
  v19 = a9;
  if ((_DWORD)v15 == 0x7FFFFFFF)
  {
    v20 = 0;
    goto LABEL_3;
  }
  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET order_index = order_index + 1 WHERE parent = %d AND order_index >= %d"), v15, v14);
  v24 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  LODWORD(db) = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v24, v25);

  if ((_DWORD)db)
  {
    v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:].cold.2();
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "SELECT (hidden + hidden_ancestor_count) FROM bookmarks WHERE id = ?");
    sqlite3_bind_int(*(sqlite3_stmt **)&v58[4], 1, (int)v15);
    if (sqlite3_step(*(sqlite3_stmt **)&v58[4]) == 100)
    {
      v20 = sqlite3_column_int(*(sqlite3_stmt **)&v58[4], 0);
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
LABEL_3:
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v54, self->_db, (const char *)objc_msgSend(CFSTR("INSERT INTO bookmarks (title, url, parent, type, external_uuid, order_index, extra_attributes, fetched_icon, icon, locally_added, archive_status, web_filter_status, hidden_ancestor_count, editable, local_attributes, syncable, dav_generation, last_selected_child, subtype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), "UTF8String"));
      if (!v56)
      {
        v27 = 0;
LABEL_56:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v54);
        goto LABEL_57;
      }
      v21 = v55;
      if (a10)
        -[WebBookmarkCollection _updateCachedChildCountForParentID:inDirection:](self, "_updateCachedChildCountForParentID:inDirection:", v15, 1);
      if (v18)
      {
        v22 = (uint64_t)v18;
      }
      else
      {
        objc_msgSend(v19, "UUID");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend((id)objc_opt_class(), "_uniqueExternalUUID");
          v22 = objc_claimAutoreleasedReturnValue();
        }
      }
      v28 = (void *)v22;
      sqlite3_bind_text(v21, 1, (const char *)objc_msgSend(objc_retainAutorelease(v52), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(v21, 2, (const char *)objc_msgSend(objc_retainAutorelease(v53), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if ((_DWORD)v15 == 0x7FFFFFFF)
        sqlite3_bind_null(v21, 3);
      else
        sqlite3_bind_int(v21, 3, (int)v15);
      sqlite3_bind_int(v21, 4, v13);
      v51 = objc_retainAutorelease(v28);
      sqlite3_bind_text(v21, 5, (const char *)objc_msgSend(v51, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(v21, 6, v14);
      objc_msgSend(v19, "extraAttributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = bindAttributesToSQLStatement(v21, 7, v29);

      if ((v30 & 1) != 0)
      {
        sqlite3_bind_int(v21, 8, objc_msgSend(v19, "fetchedIconData"));
        objc_msgSend(v19, "iconData");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        bindNullableDataToSQLStatement(v21, 9, v31);

        sqlite3_bind_int(v21, 10, objc_msgSend(v19, "isAddedLocally"));
        sqlite3_bind_int(v21, 11, objc_msgSend(v19, "archiveStatus"));
        sqlite3_bind_int(v21, 12, objc_msgSend(v19, "webFilterStatus"));
        sqlite3_bind_int(v21, 13, v20);
        if (v19)
          v32 = objc_msgSend(v19, "isEditable");
        else
          v32 = 1;
        sqlite3_bind_int(v21, 14, v32);
        objc_msgSend(v19, "localAttributes");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        bindAttributesToSQLStatement(v21, 15, v34);

        if (v19)
          v35 = objc_msgSend(v19, "isSyncable");
        else
          v35 = 1;
        sqlite3_bind_int(v21, 16, v35);
        sqlite3_bind_int64(v21, 17, -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration"));
        v36 = objc_msgSend(v19, "lastSelectedChildID");
        if (v36 == 0x7FFFFFFF)
          sqlite3_bind_null(v21, 18);
        else
          sqlite3_bind_int(v21, 18, v36);
        sqlite3_bind_int(v21, 19, objc_msgSend(v19, "subtype"));
        v37 = sqlite3_step(v21);
        if (v37 == 101)
        {
          insert_rowid = sqlite3_last_insert_rowid(self->_db);
          if (v13 && a11)
            -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withParentID:](self, "_insertAncestorTableEntriesForBookmarkID:withParentID:", insert_rowid, v15);
          objc_msgSend(v19, "_setOrderIndex:", v14);
          objc_msgSend(v19, "_setID:", insert_rowid);
          objc_msgSend(v19, "_setUUID:", v51);
          objc_msgSend(v19, "_setInserted:", 1);
          if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
            && objc_msgSend(v19, "isSyncable"))
          {
            objc_msgSend(v19, "serverID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (!v39)
            {
              objc_msgSend(MEMORY[0x24BDD1880], "UUID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "UUIDString");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[WebBookmarkCollection setServerID:forBookmark:](self, "setServerID:forBookmark:", v40, v19);
            if (!v39)
            {

            }
          }
          if (!a12)
          {
            -[WebBookmarkCollection _markBookmarkID:added:](self, "_markBookmarkID:added:", insert_rowid, 0);
            v27 = 1;
            goto LABEL_55;
          }
          if (objc_msgSend(v19, "isSyncable"))
          {
            if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
            {
              objc_msgSend(v19, "syncPosition");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v41 == 0;

              if (v42)
              {
                -[WebBookmarkCollection generateSyncPositionForBookmark:](self, "generateSyncPositionForBookmark:", v19);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setSyncPosition:", v43);

              }
            }
          }
          if (-[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v19))
          {
            v27 = -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");
LABEL_55:
            v18 = v51;
            goto LABEL_56;
          }
        }
        else
        {
          v44 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "serverID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "wb_stringByRedactingBookmarkDAVServerID");
            v47 = (id)objc_claimAutoreleasedReturnValue();
            -[WebBookmarkCollection _errorForMostRecentSQLiteError](self, "_errorForMostRecentSQLiteError");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "userInfo");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x24BE82F90]);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v58 = v47;
            *(_WORD *)&v58[8] = 1024;
            *(_DWORD *)&v58[10] = (_DWORD)v15;
            v59 = 1024;
            v60 = v37;
            v61 = 2114;
            v62 = v50;
            _os_log_error_impl(&dword_211022000, v44, OS_LOG_TYPE_ERROR, "Could not insert record with server ID: %{public}@ into parent with ID: %d, error: %d %{public}@", buf, 0x22u);

          }
        }
      }
      v27 = 0;
      goto LABEL_55;
    }
    v33 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:].cold.1();
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  }
  v27 = 0;
LABEL_57:

  return v27;
}

- (id)syncStringForKey:(id)a3
{
  id v4;
  void *v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  char v9;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "SELECT value FROM sync_properties WHERE key = ?");
  if (v9
    && (sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v8) == 100))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v8, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (sqlite3_stmt)_selectBookmarksWhere:(id)a3 returnType:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  sqlite3 *db;
  id v12;
  sqlite3_stmt *v13;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  switch(a4)
  {
    case 0:
      v8 = (void *)MEMORY[0x24BDD17C8];
      BookmarkSQLiteColumns();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("SELECT %@ FROM bookmarks WHERE %@"), v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 1:
      v7 = CFSTR("SELECT id FROM bookmarks WHERE %@");
      goto LABEL_7;
    case 2:
      v7 = CFSTR("SELECT count(*) FROM bookmarks WHERE %@");
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  ppStmt = 0;
  db = self->_db;
  v12 = objc_retainAutorelease(v10);
  if (sqlite3_prepare_v2(db, (const char *)objc_msgSend(v12, "UTF8String"), -1, &ppStmt, 0))
    v13 = 0;
  else
    v13 = ppStmt;

  return v13;
}

- (sqlite3_stmt)_sqliteStatementWithQuery:(id)a3
{
  id v4;
  sqlite3 *db;
  id v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  db = self->_db;
  v6 = objc_retainAutorelease(v4);
  if (sqlite3_prepare_v2(db, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0))
    v7 = 0;
  else
    v7 = ppStmt;

  return v7;
}

- (void)logRegulatoryBookmarksRead
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "Read Safari bookmarks", v4, 2u);
  }

}

- (BOOL)applyInMemoryChangesToDatabase
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))return 1;
  -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _applyInMemoryChanges:postChangeNotification:](self, "_applyInMemoryChanges:postChangeNotification:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_inMemoryChangeSet
{
  void *v2;

  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    objc_msgSend((id)objc_opt_class(), "inMemoryChangeSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_trackChangesInMemoryIfDatabaseWriteIsNotAllowed
{
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::onceToken != -1)
    dispatch_once(&-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::onceToken, &__block_literal_global_768);
  return -[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::trackChangesInMemory;
}

+ (WebBookmarkChangeSet)inMemoryChangeSet
{
  return (WebBookmarkChangeSet *)(id)inMemoryChangeSet;
}

- (id)_applyInMemoryChanges:(id)a3 postChangeNotification:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend((id)objc_opt_class(), "isLockedSync");
    if ((v9 & 1) == 0 && (objc_msgSend((id)objc_opt_class(), "lockSync") & 1) == 0)
    {
      v14 = 0;
      goto LABEL_15;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          -[WebBookmarkCollection _applyInMemoryChange:fromChangeSet:updatedBookmarks:](self, "_applyInMemoryChange:fromChangeSet:updatedBookmarks:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13++), v6, v7);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "removeAllChanges");
    if ((v9 & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "unlockSync");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __70__WebBookmarkCollection__applyInMemoryChanges_postChangeNotification___block_invoke;
    v16[3] = &unk_24CB326C0;
    v17 = a4;
    v16[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
  }
  v14 = v7;
LABEL_15:

  return v14;
}

- (int64_t)currentRecordGeneration
{
  const char *v2;

  return (int)WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT value from sync_properties WHERE key = '_dav_generation'", v2);
}

- (WebBookmarkList)favoritesFolderList
{
  void *v3;
  uint64_t v4;

  -[WebBookmarkCollection favoritesFolder](self, "favoritesFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");

  return (WebBookmarkList *)-[WebBookmarkCollection listWithID:](self, "listWithID:", v4);
}

- (WebBookmark)favoritesFolder
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("_FavoritesFolderID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if ((_DWORD)v4)
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[WebBookmarkCollection bookmarksBarBookmark](self, "bookmarksBarBookmark");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    -[WebBookmarkCollection bookmarksBarBookmark](self, "bookmarksBarBookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (WebBookmark *)v8;
}

- (WebBookmark)bookmarksBarBookmark
{
  void *v3;
  int v4;
  uint64_t v5;

  +[WBWebFilterSettings sharedWebFilterSettings](WBWebFilterSettings, "sharedWebFilterSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesAllowedSitesOnly");

  if (v4)
    v5 = 4;
  else
    v5 = 1;
  -[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:", v5);
  return (WebBookmark *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)bookmarkWithSpecialID:(int)a3
{
  WebBookmark *v5;
  sqlite3_stmt *v6;
  void *v7;
  WebBookmark *v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("special_id = ? AND deleted = 0")));
  if (v12 && (sqlite3_bind_int(v11, 1, a3), sqlite3_step(v11) == 100))
  {
    v5 = [WebBookmark alloc];
    v6 = v11;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v5, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v6, v7, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

  }
  else
  {
    v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8;
}

- (BOOL)updateBookmarkSyncPositionIfNeeded:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
    && (objc_msgSend(v4, "isSyncable") & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke;
    v7[3] = &unk_24CB32C38;
    v7[4] = self;
    v8 = v4;
    v5 = -[WebBookmarkCollection updateSyncDataForBookmark:usingBlock:](self, "updateSyncDataForBookmark:usingBlock:", v8, v7);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_rootFolderHiddenChildrenClause
{
  void *v2;
  uint64_t v3;

  -[WebBookmarkCollection favoritesFolder](self, "favoritesFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identifier");

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AND hidden = 0 AND id != %d AND (num_children > 0 OR special_id != %d)"), v3, 2);
}

- (void)_enumerateContentsOfBookmarkFolder:(int)a3 includingSubfolders:(BOOL)a4 usingBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(id, void *, _BYTE *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  WebBookmarkCollection *v20;
  void *v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, _BYTE *))a5;
  v20 = self;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    if ((objc_msgSend(v21, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend(v21, "addObject:", v11);
      -[WebBookmarkCollection listWithID:](v20, "listWithID:", objc_msgSend(v11, "intValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bookmarkArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v22 = 0;
            v8[2](v8, v18, &v22);
            if (v22 || !a4)
            {
              if (v22)
              {

                goto LABEL_19;
              }
            }
            else if (objc_msgSend(v18, "isFolder"))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v18, "identifier"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v19);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v15)
            continue;
          break;
        }
      }

    }
  }
LABEL_19:

}

- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4 includeHidden:(BOOL)a5
{
  return -[WebBookmarkCollection listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:](self, "listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, 0);
}

- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4
{
  return -[WebBookmarkCollection listWithID:skipOffset:includeHidden:](self, "listWithID:skipOffset:includeHidden:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (id)listWithID:(int)a3
{
  return -[WebBookmarkCollection listWithID:skipOffset:](self, "listWithID:skipOffset:", *(_QWORD *)&a3, 0);
}

- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4 includeHidden:(BOOL)a5 includeDescendantsAsChildren:(BOOL)a6 filteredUsingString:(id)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  WebBookmarkListQuery *v13;
  uint64_t v14;
  WebBookmarkListQuery *v15;
  WebBookmarkList *v16;

  v7 = a6;
  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = [WebBookmarkListQuery alloc];
  if (v7)
    v14 = v8 | 0x10;
  else
    v14 = v8;
  v15 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:](v13, "initWithFolderID:inCollection:usingFilter:options:", v10, self, v12, v14);
  v16 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v15, v9, self);

  return v16;
}

+ (id)_uniqueExternalUUID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4 insertTombstoneBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  unsigned int (**v9)(id, id);
  BOOL v10;
  int v11;
  void *v12;
  void *v13;
  int64_t v14;
  int v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  NSObject *v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (unsigned int (**)(id, id))a5;
  if (v6 && (objc_msgSend(v8, "isSyncable") & 1) != 0)
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    objc_msgSend(v8, "serverID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WebBookmarkCollection _isTombstoneWithServerID:](self, "_isTombstoneWithServerID:", v12);

    v11 = 0;
  }
  if (objc_msgSend(v8, "identifier"))
  {
    objc_msgSend(v8, "serverID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WebBookmarkCollection _syncType](self, "_syncType");
    if (v14 != 2)
    {
      if (v11)
      {
        v15 = objc_msgSend(v8, "isFolder");
        if (v14 == 1)
          v16 = v15;
        else
          v16 = 0;
        if (v16 == 1)
        {
          if (!-[WebBookmarkCollection _insertTombsonesRecursivelyForRootFolder:insertTombstoneBlock:](self, "_insertTombsonesRecursivelyForRootFolder:insertTombstoneBlock:", v8, v9))goto LABEL_22;
        }
        else if (v13 && !v9[2](v9, v8))
        {
          goto LABEL_22;
        }
      }
      if ((objc_msgSend(v8, "isHidden") & 1) != 0
        || -[WebBookmarkCollection _updateCachedChildCountForParentID:inDirection:](self, "_updateCachedChildCountForParentID:inDirection:", objc_msgSend(v8, "parentID"), 0xFFFFFFFFLL))
      {
        v18 = -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v8);
        if (-[WebBookmarkCollection _deleteRecursively:descendantsOnly:](self, "_deleteRecursively:descendantsOnly:", objc_msgSend(v8, "identifier"), 0))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET order_index = (order_index - 1) WHERE parent = %d AND order_index > %d"), objc_msgSend(v8, "parentID"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v19))
          {
            v17 = 0;
          }
          else
          {
            if (-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType") != 1 || !v10)
              self->_dirty = 1;
            v22 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109376;
              v24 = objc_msgSend(v8, "identifier");
              v25 = 1024;
              v26 = objc_msgSend(v8, "parentID");
              _os_log_impl(&dword_211022000, v22, OS_LOG_TYPE_INFO, "Deleted bookmark with ID %d from parent with ID %d", buf, 0xEu);
            }

            v17 = -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");
          }

          goto LABEL_23;
        }
      }
    }
LABEL_22:
    v17 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (BOOL)_updateCachedChildCountForParentID:(int)a3 inDirection:(int)a4
{
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a4 < 0)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET num_children = num_children - 1 WHERE id = %d"), *(_QWORD *)&a3);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET num_children = num_children + 1 WHERE id = %d"), *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v7);

  if (v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      v12 = a3;
      v13 = 1024;
      v14 = a4;
      v15 = 1024;
      v16 = v8;
      _os_log_error_impl(&dword_211022000, v9, OS_LOG_TYPE_ERROR, "Could not update cached child count for parent ID %d in direction: %d, error: %d", buf, 0x14u);
    }
  }
  return v8 == 0;
}

- (int)_executeSQL:(id)a3
{
  return WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)a3, (NSString *)a3);
}

- (BOOL)_saveBookmark:(id)a3 withSpecialID:(int)a4 updateGenerationIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  sqlite3_stmt *v33;
  id v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  sqlite3 *db;
  id v40;
  int v41;
  sqlite3_stmt *v42;
  id v43;
  sqlite3_stmt *v44;
  id v45;
  sqlite3_stmt *v46;
  void *v47;
  void *v48;
  char v49;
  sqlite3_stmt *v50;
  void *v51;
  int v52;
  uint64_t v53;
  double v54;
  int v55;
  void *v56;
  int v57;
  WebBookmarks::BookmarkSQLStatement *v58;
  void *v59;
  void *v60;
  sqlite3 *v61;
  NSString *v62;
  uint64_t v63;
  void *v64;
  uint64_t v66;
  int v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  WebBookmarkCollection *v72;
  BOOL v73;
  sqlite3_stmt *ppStmt;
  sqlite3_stmt *v75;
  uint64_t v76;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v76 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    v9 = 2;
    goto LABEL_8;
  }
  v9 = -[WebBookmarkCollection _mergeBookmarkIntoPersistedBookmark:forAttributes:](self, "_mergeBookmarkIntoPersistedBookmark:forAttributes:", v8, -69);
  if (!objc_msgSend(v8, "isSyncable")
    || (objc_msgSend(v8, "syncState"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "integerValue"),
        v10,
        v11 != 1))
  {
LABEL_8:
    if ((objc_msgSend(v8, "isFolder") & 1) == 0)
    {
      objc_msgSend(v8, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:].cold.2();
      }
    }
    v15 = objc_msgSend(v8, "parentID");
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6)
    {
      -[WebBookmarkCollection _databaseTitleForSpecialID:](self, "_databaseTitleForSpecialID:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v17);

      if ((v6 - 3) <= 3)
        objc_msgSend(v8, "setExtraAttributesValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("com.apple.bookmarks.OmitFromUI"));
    }
    if ((objc_msgSend(v8, "isInserted") & 1) == 0 && objc_msgSend(v8, "isSyncable"))
      objc_msgSend(v8, "_setSyncable:", -[WebBookmarkCollection _childrenOfParentBookmarkAreUnsyncable:](self, "_childrenOfParentBookmarkAreUnsyncable:", v16) ^ 1);
    if ((objc_msgSend(v8, "isInserted") & 1) == 0)
    {
      v21 = -[WebBookmarkCollection bookmarkRequiresParent:specialID:](self, "bookmarkRequiresParent:specialID:", v8, v6);
      v22 = v21;
      if (v21 && (!v16 || (objc_msgSend(v16, "isFolder") & 1) == 0))
      {
        v37 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v8, "UUID");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:].cold.1();
        }

        goto LABEL_68;
      }
      v23 = objc_msgSend(v8, "isFolder");
      if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
        && objc_msgSend(v8, "isSyncable"))
      {
        objc_msgSend(v8, "lockFields");
      }
      objc_msgSend(v8, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE2(v66) = v5;
      BYTE1(v66) = v22;
      LOBYTE(v66) = v22;
      v26 = -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:](self, "_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:", v24, v25, v15, -[WebBookmarkCollection _orderIndexForBookmarkInsertedIntoParent:insertAtBeginning:](self, "_orderIndexForBookmarkInsertedIntoParent:insertAtBeginning:", v15, v23), v23, 0, v8, v66);

      if (!v26)
      {
        if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
          && objc_msgSend(v8, "isSyncable"))
        {
          objc_msgSend(v8, "unlockFields");
        }
        goto LABEL_68;
      }
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke;
      v70[3] = &unk_24CB32998;
      v73 = v5;
      v71 = v8;
      v72 = self;
      -[WebBookmarkCollection updateSyncDataForBookmark:usingBlock:](self, "updateSyncDataForBookmark:usingBlock:", v71, v70);

      goto LABEL_34;
    }
    if (!-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata") || v9 != 1 || v5)
    {
      ppStmt = 0;
      v18 = &stru_24CB35168;
      if (v5)
      {
        v19 = objc_msgSend(v8, "needsSyncUpdate");
        v20 = CFSTR(", dav_generation = ?7");
        v67 = v19;
        if (!v19)
          v20 = &stru_24CB35168;
        v18 = CFSTR(", modified_attributes = ?13");
      }
      else
      {
        v67 = 0;
        v20 = &stru_24CB35168;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET title = ?1, url = ?2, extra_attributes = ?3, local_attributes = ?11, fetched_icon = ?4, icon = ?5, locally_added = ?10, archive_status = ?8, web_filter_status = ?12, last_selected_child = ?14%@%@ WHERE id = ?6"), v20, v18);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      db = self->_db;
      v40 = objc_retainAutorelease(v38);
      v41 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v40, "UTF8String"), -1, &ppStmt, 0);
      v42 = ppStmt;
      if (v41)
        goto LABEL_66;
      objc_msgSend(v8, "title");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v42, 1, (const char *)objc_msgSend(v43, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v44 = ppStmt;
      objc_msgSend(v8, "address");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v44, 2, (const char *)objc_msgSend(v45, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v46 = ppStmt;
      objc_msgSend(v8, "extraAttributes");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v46) = bindAttributesToSQLStatement(v46, 3, v47);

      v42 = ppStmt;
      if ((v46 & 1) == 0)
        goto LABEL_66;
      objc_msgSend(v8, "localAttributes");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = bindAttributesToSQLStatement(v42, 11, v48);

      v42 = ppStmt;
      if ((v49 & 1) != 0)
      {
        sqlite3_bind_int(ppStmt, 4, objc_msgSend(v8, "fetchedIconData"));
        v50 = ppStmt;
        objc_msgSend(v8, "iconData");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        bindNullableDataToSQLStatement(v50, 5, v51);

        sqlite3_bind_int(ppStmt, 6, objc_msgSend(v8, "identifier"));
        sqlite3_bind_int(ppStmt, 10, objc_msgSend(v8, "isAddedLocally"));
        sqlite3_bind_int(ppStmt, 8, objc_msgSend(v8, "archiveStatus"));
        sqlite3_bind_int(ppStmt, 12, objc_msgSend(v8, "webFilterStatus"));
        if (v67)
          sqlite3_bind_int64(ppStmt, 7, -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration"));
        if (v5)
          sqlite3_bind_int64(ppStmt, 13, objc_msgSend(v8, "modifiedAttributes"));
        v52 = objc_msgSend(v8, "lastSelectedChildID");
        if (v52 == 0x7FFFFFFF)
          sqlite3_bind_null(ppStmt, 14);
        else
          sqlite3_bind_int(ppStmt, 14, v52);
        if (sqlite3_step(ppStmt) == 101)
        {
          sqlite3_finalize(ppStmt);

          goto LABEL_34;
        }
        -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", ppStmt);
      }
      else
      {
LABEL_66:
        -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", v42);
      }

      goto LABEL_68;
    }
LABEL_34:
    v27 = objc_msgSend(v8, "omitFromUI");
    if ((_DWORD)v27 == objc_msgSend(v8, "isHidden"))
      goto LABEL_46;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt, self->_db, "UPDATE bookmarks SET hidden = ? WHERE id = ?");
    sqlite3_bind_int(v75, 1, v27);
    sqlite3_bind_int(v75, 2, objc_msgSend(v8, "identifier"));
    if (sqlite3_step(v75) == 101)
    {
      v28 = (_DWORD)v27 ? 0xFFFFFFFFLL : 1;
      if (-[WebBookmarkCollection _updateCachedChildCountForParentID:inDirection:](self, "_updateCachedChildCountForParentID:inDirection:", v15, v28))
      {
        objc_msgSend(v8, "_setHidden:", v27);
        if (!objc_msgSend(v8, "isFolder")
          || ((v29 = objc_msgSend(v8, "identifier"), (_DWORD)v27) ? (v30 = 1) : (v30 = 0xFFFFFFFFLL),
              -[WebBookmarkCollection _updateHiddenAncestorCountForBookmarksUnderFolderID:addingOffset:](self, "_updateHiddenAncestorCountForBookmarksUnderFolderID:addingOffset:", v29, v30)))
        {
          WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt);
LABEL_46:
          objc_msgSend(v8, "extraAttributes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKey:", CFSTR("com.apple.ReadingList"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
LABEL_73:
            if (!(_DWORD)v6
              || -[WebBookmarkCollection _markBookmarkID:withSpecialID:](self, "_markBookmarkID:withSpecialID:", objc_msgSend(v8, "identifier"), v6))
            {
              objc_msgSend(v16, "UUID");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "isEqualToString:", &stru_24CB35168);

              if (!v57)
                goto LABEL_97;
              v58 = self->_db;
              v59 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend((id)objc_opt_class(), "_uniqueExternalUUID");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "stringWithFormat:", CFSTR("UPDATE bookmarks SET external_uuid = '%@' WHERE id = %d"), v60, v15);
              v61 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
              LODWORD(v58) = WebBookmarks::BookmarkSQLStatement::executeSQL(v58, v61, v62);

              if (!(_DWORD)v58)
              {
LABEL_97:
                if (-[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration"))
                {
                  if ((_DWORD)v6)
                    objc_msgSend(v8, "markSpecial:", v6);
                  if ((objc_msgSend(v8, "isFolder") & 1) != 0
                    || (v63 = objc_msgSend(v8, "identifier"),
                        objc_msgSend(v8, "title"),
                        v64 = (void *)objc_claimAutoreleasedReturnValue(),
                        LOBYTE(v63) = -[WebBookmarkCollection _reindexBookmarkID:title:](self, "_reindexBookmarkID:title:", v63, v64), v64, (v63 & 1) != 0))
                  {
                    if (!-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
                      || (v68[0] = MEMORY[0x24BDAC760],
                          v68[1] = 3221225472,
                          v68[2] = __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke_2,
                          v68[3] = &unk_24CB328D0,
                          v69 = v8,
                          v12 = -[WebBookmarkCollection updateSyncDataForBookmark:usingBlock:](self, "updateSyncDataForBookmark:usingBlock:", v69, v68), v69, v12))
                    {
                      LOBYTE(v12) = 1;
                      self->_dirty = 1;
                    }
                    goto LABEL_86;
                  }
                }
              }
            }
LABEL_85:
            LOBYTE(v12) = 0;
LABEL_86:

            goto LABEL_87;
          }
          WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt, self->_db, "UPDATE bookmarks SET last_modified = ?, read = ? WHERE id = ?");
          v33 = v75;
          v34 = v32;
          objc_msgSend(v34, "objectForKey:", CFSTR("DateLastViewed"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v36 = 1;
          }
          else
          {
            objc_msgSend(v34, "objectForKey:", CFSTR("DateAdded"));
            v53 = objc_claimAutoreleasedReturnValue();
            if (!v53)
            {
              sqlite3_bind_null(v33, 1);
              v35 = 0;
              sqlite3_bind_int(v33, 2, 0);
LABEL_72:

              sqlite3_bind_int(v75, 3, objc_msgSend(v8, "identifier"));
              v55 = sqlite3_step(v75);
              WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt);
              if (v55 != 101)
                goto LABEL_85;
              goto LABEL_73;
            }
            v36 = 0;
            v35 = (void *)v53;
          }
          objc_msgSend(v35, "timeIntervalSince1970");
          sqlite3_bind_double(v33, 1, v54);
          sqlite3_bind_int(v33, 2, v36);
          goto LABEL_72;
        }
      }
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt);
LABEL_68:
    LOBYTE(v12) = 0;
LABEL_87:

    goto LABEL_88;
  }
  LOBYTE(v12) = !objc_msgSend(v8, "isInserted")
             || (objc_msgSend(v8, "isDeleted") & 1) != 0
             || -[WebBookmarkCollection _deleteBookmark:leaveTombstone:](self, "_deleteBookmark:leaveTombstone:", v8, 0);
LABEL_88:

  return v12;
}

- (BOOL)_incrementGeneration
{
  NSObject *v3;
  _BOOL4 v4;

  if (-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE generations SET generation = generation + 1"))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[WebBookmarkCollection _incrementGeneration].cold.1();
      LOBYTE(v4) = 0;
    }
  }
  else if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    LOBYTE(v4) = -[WebBookmarkCollection _incrementRecordGeneration](self, "_incrementRecordGeneration");
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (int)_executeSQLWithCString:(const char *)a3
{
  return WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)a3, a3);
}

- (id)bookmarkWithID:(int)a3
{
  void *v4;
  sqlite3_stmt *v5;
  WebBookmark *v6;
  void *v7;
  WebBookmark *v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("id = %d AND deleted = 0"), *(_QWORD *)&a3);
  v5 = -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v4);
  if (sqlite3_step(v5) == 100)
  {
    v6 = [WebBookmark alloc];
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v6, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v5, v7, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    sqlite3_finalize(v5);
  }
  else
  {
    -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", v5);
    v8 = 0;
  }

  return v8;
}

- (BOOL)updateSyncDataForBookmark:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  sqlite3_stmt *v12;
  id v13;
  int v14;
  BOOL v15;
  _BYTE v17[8];
  sqlite3_stmt *v18;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
    && (objc_msgSend(v6, "isSyncable") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x212BD4AC8]();
    -[WebBookmarkCollection syncDataForBookmark:](self, "syncDataForBookmark:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, self->_db, "UPDATE bookmarks SET sync_data = ? WHERE server_id = ?");
      objc_msgSend(v10, "encodedBookmarkSyncData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      bindNullableDataToSQLStatement(v18, 1, v11);
      v12 = v18;
      objc_msgSend(v6, "serverID");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v12, 2, (const char *)objc_msgSend(v13, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v14 = sqlite3_step(v18);
      v15 = v14 == 101;
      if (v14 == 101)
        objc_msgSend(v6, "_setSyncData:cachedWBSyncData:", v11, v10);

      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);
    }
    else
    {
      v15 = 1;
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (unsigned)_orderIndexForBookmarkInsertedIntoParent:(int)a3 insertAtBeginning:(BOOL)a4
{
  _BOOL4 v4;
  const char *v7;
  unsigned int v8;
  unsigned int v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  v4 = a4;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  if (v4)
  {
    if (a3)
    {
      return 0;
    }
    else
    {
      v9 = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT MAX(order_index) + 1 FROM bookmarks WHERE special_id != 0", v7);
      if (v9 == -1)
        return 0;
      else
        return v9;
    }
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT COUNT(*), MAX(order_index) FROM bookmarks WHERE parent = ? AND deleted = 0 AND syncable = 1");
    sqlite3_bind_int(v12, 1, a3);
    if (sqlite3_step(v12) == 100 && sqlite3_column_int(v12, 0))
      v8 = sqlite3_column_int(v12, 1) + 1;
    else
      v8 = 0;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  }
  return v8;
}

- (int64_t)_mergeBookmarkIntoPersistedBookmark:(id)a3 forAttributes:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;
  WebBookmarkCollection *v15;
  unint64_t v16;

  v6 = a3;
  if (objc_msgSend(v6, "isInserted") && (objc_msgSend(v6, "isSyncable") & 1) != 0)
  {
    v7 = (void *)MEMORY[0x212BD4AC8]();
    objc_msgSend(v6, "serverID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](self, "bookmarkWithServerID:excludeDeletedBookmarks:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isDeleted"))
      v10 = 0x4000;
    else
      v10 = a4;
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
      objc_msgSend(v6, "lockFields");
    if (v9)
      v11 = objc_msgSend(v6, "mergeAttributes:withBookmark:", v10, v9);
    else
      v11 = 2;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __75__WebBookmarkCollection__mergeBookmarkIntoPersistedBookmark_forAttributes___block_invoke;
    v13[3] = &unk_24CB32970;
    v15 = self;
    v16 = v10;
    v14 = v6;
    -[WebBookmarkCollection updateSyncDataForBookmark:usingBlock:](self, "updateSyncDataForBookmark:usingBlock:", v14, v13);

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v11 = 2;
  }

  return v11;
}

- (int64_t)_syncType
{
  int64_t v4;

  if (-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"))
    return 1;
  v4 = -[WebBookmarkCollection localMigrationState](self, "localMigrationState");
  if ((unint64_t)(v4 + 1) > 4)
    return 2;
  else
    return qword_2110B88D0[v4 + 1];
}

- (BOOL)_saveAndMoveBookmark:(id)a3 toFolderID:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v6);
  v8 = -[WebBookmarkCollection _moveBookmark:toFolderWithID:detectCycles:](self, "_moveBookmark:toFolderWithID:detectCycles:", v6, v4, 1)&& -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v6, v7, 1)&& -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");

  return v8;
}

- (int)_specialIDForBookmarkBeingSaved:(id)a3
{
  id v4;
  int v5;
  void *v7;
  uint64_t v8;
  WebBookmarks::BookmarkSQLStatement *db;
  sqlite3 *v10;
  NSString *v11;

  v4 = a3;
  if (objc_msgSend(v4, "specialID")
    || !objc_msgSend(v4, "isFolder")
    || objc_msgSend(v4, "parentID")
    || (objc_msgSend(v4, "title"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[WebBookmarkCollection _specialIDForBookmarkTitle:](self, "_specialIDForBookmarkTitle:", v7),
        v7,
        !(_DWORD)v8))
  {
    v5 = 0;
  }
  else
  {
    db = self->_db;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT count(*) FROM Bookmarks WHERE special_id = %u"), v8);
    v10 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
    LODWORD(db) = WebBookmarks::BookmarkSQLStatement::selectInt(db, v10, v11);

    if ((_DWORD)db)
      v5 = 0;
    else
      v5 = v8;
  }

  return v5;
}

- (BOOL)_reindexBookmarkID:(int)a3 title:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[WebBookmarkCollection _clearTitleWordsForBookmarkID:](self, "_clearTitleWordsForBookmarkID:", v4)
    && -[WebBookmarkCollection _indexBookmarkID:title:](self, "_indexBookmarkID:title:", v4, v6);

  return v7;
}

- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4 detectCycles:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  uint64_t v10;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  LOBYTE(v10) = 1;
  LOBYTE(v5) = -[WebBookmarkCollection _moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:](self, "_moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:", v8, v6, -[WebBookmarkCollection _orderIndexForBookmarkInsertedIntoParent:insertAtBeginning:](self, "_orderIndexForBookmarkInsertedIntoParent:insertAtBeginning:", v6, 0), v5, 1, 1, v10);

  return v5;
}

- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4 orderIndex:(unsigned int)a5 detectCycles:(BOOL)a6 incrementGeneration:(BOOL)a7 shouldMerge:(BOOL)a8 generateSyncPositionIfNeeded:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  int v25;
  void *v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  sqlite3 *db;
  id v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  _BYTE v41[8];
  sqlite3_stmt *v42;
  uint8_t buf[4];
  _BYTE v44[14];
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint8_t v51[4];
  int v52;
  sqlite3_stmt *v53;
  uint64_t v54;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "privacyPreservingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v44 = v17;
    *(_WORD *)&v44[8] = 1024;
    *(_DWORD *)&v44[10] = v13;
    v45 = 1024;
    LODWORD(v46) = v12;
    _os_log_impl(&dword_211022000, v16, OS_LOG_TYPE_INFO, "Moving bookmark %{public}@ to parent %d and order index %d", buf, 0x18u);

  }
  if ((objc_msgSend(v15, "isInserted") & 1) != 0)
  {
    v18 = -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v15);
    v19 = objc_msgSend(v15, "parentID");
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20 || (objc_msgSend(v20, "isFolder") & 1) == 0)
      goto LABEL_19;
    if (v11 && objc_msgSend(v15, "isFolder"))
    {
      if (objc_msgSend(v15, "identifier") == (_DWORD)v13)
      {
        v22 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v44 = v13;
          _os_log_impl(&dword_211022000, v22, OS_LOG_TYPE_INFO, "Cannot insert bookmark with local ID %d into itself", buf, 8u);
        }
        goto LABEL_19;
      }
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "SELECT COUNT(*) from folder_ancestors WHERE folder_id = ? AND ancestor_id = ?");
      sqlite3_bind_int(*(sqlite3_stmt **)&v44[4], 1, v13);
      sqlite3_bind_int(*(sqlite3_stmt **)&v44[4], 2, objc_msgSend(v15, "identifier"));
      if (sqlite3_step(*(sqlite3_stmt **)&v44[4]) != 100)
      {
        v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
LABEL_17:
          v25 = objc_msgSend(v15, "identifier");
          *(_DWORD *)v51 = 67109376;
          v52 = v25;
          LOWORD(v53) = 1024;
          *(_DWORD *)((char *)&v53 + 2) = v13;
          _os_log_impl(&dword_211022000, v24, OS_LOG_TYPE_INFO, "Cannot insert bookmark with ID %d into parent with ID %d since it is a descendent", v51, 0xEu);
        }
LABEL_18:

        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
LABEL_19:
        v23 = 0;
LABEL_20:

        goto LABEL_21;
      }
      if (sqlite3_column_int(*(sqlite3_stmt **)&v44[4], 0))
      {
        v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        goto LABEL_18;
      }
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
    }
    objc_msgSend(v15, "_setParentID:incrementGeneration:", v13, v10);
    if (a9
      && objc_msgSend(v15, "isSyncable") & v10
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      -[WebBookmarkCollection _generateSyncPositionForOrderIndex:inFolderWithID:direction:](self, "_generateSyncPositionForOrderIndex:inFolderWithID:direction:", v12, objc_msgSend(v15, "parentID"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSyncPosition:", v27);

    }
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata") && v9)
      -[WebBookmarkCollection _mergeBookmarkIntoPersistedBookmark:forAttributes:](self, "_mergeBookmarkIntoPersistedBookmark:forAttributes:", v15, 68);
    if (objc_msgSend(v15, "parentID") != (_DWORD)v13)
    {
      v23 = 1;
      goto LABEL_20;
    }
    if (objc_msgSend(v15, "isSyncable")
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      objc_msgSend(v15, "syncPosition");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WebBookmarkCollection orderIndexOfBookmark:withSyncPosition:inFolderWithID:](self, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v15, v28, objc_msgSend(v15, "parentID"));

    }
    objc_msgSend(v15, "_setOrderIndex:", v12);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v51, self->_db, "UPDATE bookmarks SET order_index = order_index + 1 WHERE parent = ? AND order_index >= ?");
    sqlite3_bind_int(v53, 1, v13);
    sqlite3_bind_int(v53, 2, v12);
    if (sqlite3_step(v53) != 101)
    {
      v23 = 0;
LABEL_58:
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v51);
      goto LABEL_20;
    }
    WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v51);
    v29 = &stru_24CB35168;
    if (v10)
      v30 = CFSTR(" modified_attributes = modified_attributes | ?4,");
    else
      v30 = &stru_24CB35168;
    if (v10)
      v29 = CFSTR(" dav_generation = ?5,");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET parent = ?1, order_index = ?2,%@%@ icon = NULL, fetched_icon = 0 WHERE id = ?3"), v30, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    db = self->_db;
    v33 = objc_retainAutorelease(v31);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v41, db, (const char *)objc_msgSend(v33, "UTF8String"));
    sqlite3_bind_int(v42, 1, v13);
    sqlite3_bind_int(v42, 2, v12);
    sqlite3_bind_int(v42, 3, objc_msgSend(v15, "identifier"));
    if (v10)
    {
      sqlite3_bind_int64(v42, 4, 64);
      sqlite3_bind_int64(v42, 5, -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration"));
    }
    v34 = sqlite3_step(v42);
    if (v34 == 101)
    {
      WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v41);
      if (-[WebBookmarkCollection _updateCachedChildCountForParentID:inDirection:](self, "_updateCachedChildCountForParentID:inDirection:", v13, 1)&& -[WebBookmarkCollection _updateCachedChildCountForParentID:inDirection:](self, "_updateCachedChildCountForParentID:inDirection:", v19, 0xFFFFFFFFLL))
      {
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET order_index = (order_index - 1) WHERE parent = ? AND order_index > ?");
        sqlite3_bind_int(*(sqlite3_stmt **)&v44[4], 1, v19);
        sqlite3_bind_int(*(sqlite3_stmt **)&v44[4], 2, v18);
        if (sqlite3_step(*(sqlite3_stmt **)&v44[4]) == 101)
        {
          WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)buf);
          if (!objc_msgSend(v15, "isFolder")
            || -[WebBookmarkCollection _deleteAncestorTableEntriesForBookmarkID:](self, "_deleteAncestorTableEntriesForBookmarkID:", objc_msgSend(v15, "identifier"))&& -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withParentID:](self, "_insertAncestorTableEntriesForBookmarkID:withParentID:", objc_msgSend(v15, "identifier"), v13))
          {
            objc_msgSend(v15, "setFetchedIconData:", 0);
            objc_msgSend(v15, "setIconData:", 0);
            if (!v10
              || -[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v15))
            {
              v23 = 1;
LABEL_62:
              WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
              goto LABEL_57;
            }
          }
        }
        else
        {
          v36 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[WebBookmarkCollection _moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:].cold.1(v19, v36, v37);
        }
        v23 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      v35 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_msgSend(v15, "identifier");
        objc_msgSend(v15, "serverID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "wb_stringByRedactingBookmarkDAVServerID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)v44 = v15;
        *(_WORD *)&v44[8] = 1024;
        *(_DWORD *)&v44[10] = v38;
        v45 = 2114;
        v46 = v40;
        v47 = 1024;
        v48 = v13;
        v49 = 1024;
        v50 = v34;
        _os_log_error_impl(&dword_211022000, v35, OS_LOG_TYPE_ERROR, "Could not move record %{public}@ with localID: %d, server ID: %{public}@, to parent %d, error: %d", buf, 0x28u);

      }
    }
    v23 = 0;
LABEL_57:
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v41);

    goto LABEL_58;
  }
  objc_msgSend(v15, "_setParentID:incrementGeneration:", v13, v10);
  v23 = 1;
LABEL_21:

  return v23;
}

- (BOOL)_isTombstoneWithServerID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  _BYTE v8[8];
  sqlite3_stmt *v9;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "SELECT id FROM bookmarks WHERE server_id = ? AND deleted = 1");
  v5 = v9;
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = sqlite3_step(v9) == 100;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return (char)v4;
}

- (BOOL)_indexBookmarkID:(int)a3 title:(id)a4
{
  __CFString *v6;
  sqlite3_stmt *v7;
  unint64_t v8;
  CFIndex v9;
  const __CFString *MutableCopy;
  WebBookmarkTitleWordTokenizer *wordTokenizer;
  WebBookmarkTitleWordTokenizer *v12;
  WebBookmarkTitleWordTokenizer *v13;
  CFIndex v14;
  CFRange v15;
  int i;
  BOOL v17;
  CFIndex usedBufLen;
  _BYTE v20[8];
  sqlite3_stmt *v21;
  UInt8 buffer[257];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  if (v6)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20, self->_db, "INSERT INTO bookmark_title_words (bookmark_id, word, word_index) VALUES (?, ?, ?)");
    v7 = v21;
    v8 = -[__CFString length](v6, "length");
    if (v8 >= 0x200)
      v9 = 512;
    else
      v9 = v8;
    MutableCopy = CFStringCreateMutableCopy(0, v9, v6);
    -[WebBookmarkCollection _normalizeSearchString:](self, "_normalizeSearchString:", MutableCopy);
    wordTokenizer = self->_wordTokenizer;
    if (!wordTokenizer)
    {
      v12 = objc_alloc_init(WebBookmarkTitleWordTokenizer);
      v13 = self->_wordTokenizer;
      self->_wordTokenizer = v12;

      wordTokenizer = self->_wordTokenizer;
    }
    -[WebBookmarkTitleWordTokenizer setString:](wordTokenizer, "setString:", MutableCopy);
    usedBufLen = 0;
    v14 = -[WebBookmarkTitleWordTokenizer advanceToNextToken](self->_wordTokenizer, "advanceToNextToken");
    v15.length = v15.location;
    for (i = 0; ; ++i)
    {
      v17 = v14 == 0x7FFFFFFFFFFFFFFFLL;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v15.location = v14;
      CFStringGetBytes(MutableCopy, v15, 0x8000100u, 0, 0, buffer, 256, &usedBufLen);
      buffer[usedBufLen] = 0;
      sqlite3_bind_int(v7, 1, a3);
      sqlite3_bind_text(v7, 2, (const char *)buffer, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(v7, 3, i);
      if (sqlite3_step(v7) != 101)
        break;
      sqlite3_reset(v7);
      sqlite3_clear_bindings(v7);
      v14 = -[WebBookmarkTitleWordTokenizer advanceToNextToken](self->_wordTokenizer, "advanceToNextToken");
      v15.length = v15.location;
    }
    CFRelease(MutableCopy);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void)_normalizeSearchString:(__CFString *)a3
{
  CFStringNormalize(a3, kCFStringNormalizationFormD);
  CFStringFold(a3, 0x181uLL, self->_locale);
}

- (BOOL)_deleteRecursively:(int)a3 descendantsOnly:(BOOL)a4
{
  const __CFString *v7;
  void *v8;
  sqlite3 *db;
  id v10;
  int v11;
  NSObject *v12;
  _BYTE v14[8];
  sqlite3_stmt *v15;

  v7 = CFSTR(" OR id = ?");
  if (a4)
    v7 = &stru_24CB35168;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmarks WHERE parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = ?) OR parent = ?%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v10 = objc_retainAutorelease(v8);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, db, (const char *)objc_msgSend(v10, "UTF8String"));
  sqlite3_bind_int(v15, 1, a3);
  sqlite3_bind_int(v15, 2, a3);
  if (!a4)
    sqlite3_bind_int(v15, 3, a3);
  v11 = sqlite3_step(v15);
  if (v11 != 101)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _deleteRecursively:descendantsOnly:].cold.1();
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);

  return v11 == 101;
}

- (BOOL)_deleteBookmarks:(id)a3 leaveTombstone:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if (!-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), v4, (_QWORD)v12))
        {

          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  v10 = -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");
LABEL_11:

  return v10;
}

- (BOOL)_incrementRecordGeneration
{
  const char *v2;

  return WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"UPDATE sync_properties SET value = value + 1 WHERE key = '_dav_generation'", v2) == 0;
}

- (BOOL)deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a4;
  v6 = a3;
  if (!-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata")
    || !objc_msgSend(v6, "isSyncable"))
  {
    goto LABEL_6;
  }
  objc_msgSend(v6, "setSyncState:", &unk_24CB4B1A0);
  -[WebBookmarkCollection _mergeBookmarkIntoPersistedBookmark:forAttributes:](self, "_mergeBookmarkIntoPersistedBookmark:forAttributes:", v6, 0x4000);
  objc_msgSend(v6, "syncState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (!v8)
  {
    v11 = 1;
    goto LABEL_7;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__WebBookmarkCollection_deleteBookmark_leaveTombstone___block_invoke;
    v13[3] = &unk_24CB32948;
    v13[4] = self;
    v14 = v9;
    v15 = v6;
    v10 = v9;
    v11 = -[WebBookmarkCollection _deleteBookmark:leaveTombstone:insertTombstoneBlock:](self, "_deleteBookmark:leaveTombstone:insertTombstoneBlock:", v15, 1, v13);

  }
  else
  {
LABEL_6:
    v11 = -[WebBookmarkCollection _deleteBookmark:leaveTombstone:](self, "_deleteBookmark:leaveTombstone:", v6, v4);
  }
LABEL_7:

  return v11;
}

- (BOOL)_deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__WebBookmarkCollection__deleteBookmark_leaveTombstone___block_invoke;
  v5[3] = &unk_24CB32798;
  v5[4] = self;
  return -[WebBookmarkCollection _deleteBookmark:leaveTombstone:insertTombstoneBlock:](self, "_deleteBookmark:leaveTombstone:insertTombstoneBlock:", a3, a4, v5);
}

- (BOOL)_clearTitleWordsForBookmarkID:(int)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmark_title_words WHERE bookmark_id = %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v4);

  return (_DWORD)self == 0;
}

uint64_t __48__WebBookmarkCollection__setupInMemoryChangeSet__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createInMemoryChangeSet");
}

- (WebBookmarkList)frequentlyVisitedSitesList
{
  return (WebBookmarkList *)-[WebBookmarkCollection listWithSpecialID:](self, "listWithSpecialID:", 5);
}

void __73__WebBookmarkCollection__trackChangesInMemoryIfDatabaseWriteIsNotAllowed__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::trackChangesInMemory = objc_msgSend(v0, "safari_isSafariFamilyApplicationBundle");

}

- (id)listWithSpecialID:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE special_id = %d AND deleted = 0"), v3);
  v6 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v5);
  if ((_DWORD)v6 == -1)
  {
    v7 = 0;
  }
  else
  {
    -[WebBookmarkCollection listWithID:](self, "listWithID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __62__WebBookmarkCollection_initWithConfiguration_checkIntegrity___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setupWithPath:migratingBookmarksPlist:syncAnchorPlist:checkIntegrity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)_setupWithPath:(id)a3 migratingBookmarksPlist:(id)a4 syncAnchorPlist:(id)a5 checkIntegrity:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  bookmarksCollectionQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = -[WebBookmarkCollection _setupWithPath:checkIntegrity:](self, "_setupWithPath:checkIntegrity:", v10, v6);
  if (v14)
  {
    if (-[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed"))
    {
      if (!-[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:](self, "_migrateBookmarksPlist:syncAnchorPlist:", v11, v12))
      {
        v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection _setupWithPath:migratingBookmarksPlist:syncAnchorPlist:checkIntegrity:].cold.1();
      }
    }
  }

  return v14;
}

- (BOOL)_setupWithPath:(id)a3 checkIntegrity:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  WBDatabaseLockAcquisitor *v10;
  WBDatabaseLockAcquisitor *databaseLockAcquisitor;
  BOOL v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  _BOOL4 v22;
  BOOL v23;
  id v24;
  BOOL v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  _QWORD v32[5];
  BOOL v33;
  char v34;
  id v35[7];

  v4 = a4;
  v35[6] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  bookmarksCollectionQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[WebBookmarkCollection _setupInMemoryChangeSet](self, "_setupInMemoryChangeSet");
  v8 = -[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed");
  v9 = v8;
  if (v8
    && -[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    v10 = -[WBDatabaseLockAcquisitor initWithWebBookmarkCollectionClass:]([WBDatabaseLockAcquisitor alloc], "initWithWebBookmarkCollectionClass:", objc_opt_class());
    databaseLockAcquisitor = self->_databaseLockAcquisitor;
    self->_databaseLockAcquisitor = v10;

    -[WBDatabaseLockAcquisitor setDelegate:](self->_databaseLockAcquisitor, "setDelegate:", self);
  }
  self->_mergeMode = 0;
  self->_locale = CFLocaleCopyCurrent();
  self->_lastObservedLocalMigrationState = -1;
  v35[0] = 0;
  v12 = -[WebBookmarkCollection _openDatabaseAtPath:checkIntegrity:error:](self, "_openDatabaseAtPath:checkIntegrity:error:", v6, v4, v35);
  v13 = v35[0];
  if (!v12)
  {
    if (!v9)
      goto LABEL_41;
    v15 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "isLockedSync");
      objc_msgSend(v13, "wb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.6();
    }

    if (objc_msgSend(v13, "code") != 26 && objc_msgSend(v13, "code") != 11)
    {
      v16 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "wb_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.5();
      }
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = objc_claimAutoreleasedReturnValue();
    v34 = 0;
    if ((-[NSObject fileExistsAtPath:isDirectory:](v16, "fileExistsAtPath:isDirectory:", v6, &v34) & 1) == 0)
    {
      v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.4();
      goto LABEL_34;
    }
    if (v34)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.3();
      goto LABEL_34;
    }
    objc_msgSend((id)objc_opt_class(), "_defaultDatabaseFileNameForConfiguration:", self->_configuration);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WebBookmarkCollection _primaryCollection](self, "_primaryCollection")
      && (objc_msgSend(v6, "lastPathComponent"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isEqualToString:", v19),
          v20,
          (v21 & 1) == 0))
    {
      v29 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.2();
    }
    else
    {
      v22 = -[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly");
      v23 = v22;
      if ((!v22 || (objc_msgSend((id)objc_opt_class(), "lockSync") & 1) != 0)
        && objc_msgSend((id)objc_opt_class(), "isLockedSync"))
      {
        v24 = objc_alloc_init(MEMORY[0x24BE82DE0]);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __55__WebBookmarkCollection__setupWithPath_checkIntegrity___block_invoke;
        v32[3] = &unk_24CB326C0;
        v33 = v23;
        v32[4] = self;
        objc_msgSend(v24, "setHandler:", v32);
        if ((objc_msgSend((id)objc_opt_class(), "_removeCorruptedBookmarksDatabaseAtPath:", v6) & 1) != 0)
        {
          v31 = v13;
          v25 = -[WebBookmarkCollection _openDatabaseAtPath:checkIntegrity:error:](self, "_openDatabaseAtPath:checkIntegrity:error:", v6, v4, &v31);
          v26 = v31;

          if (v25)
          {
            objc_msgSend(v26, "userInfo");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKey:", *MEMORY[0x24BDD0FC8]);
            v28 = objc_claimAutoreleasedReturnValue();

            if (v28)
              -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v28, CFSTR("_DatabaseResetReason"));
          }
          else
          {
            v28 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v26, "wb_privacyPreservingDescription");
              objc_claimAutoreleasedReturnValue();
              -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.1();
            }
          }

          v13 = v26;
        }
        else
        {
          v25 = 0;
        }

        if (v25)
          goto LABEL_5;
LABEL_41:
        v14 = 0;
        goto LABEL_42;
      }
    }

LABEL_34:
    v14 = 0;
    goto LABEL_35;
  }
LABEL_5:
  if (-[WebBookmarkCollection _primaryCollection](self, "_primaryCollection")
    && !-[WBCollectionConfiguration skipsExternalNotifications](self->_configuration, "skipsExternalNotifications"))
  {
    -[WebBookmarkCollection _registerForSyncBookmarksFileChangedNotification](self, "_registerForSyncBookmarksFileChangedNotification");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObserver:selector:name:object:](v16, "addObserver:selector:name:object:", self, sel__metaDataFileChanged_, CFSTR("webBookmarksMetaDataDidChangeNotification"), 0);
    v14 = 1;
LABEL_35:

    goto LABEL_42;
  }
  v14 = 1;
LABEL_42:

  return v14;
}

- (BOOL)_primaryCollection
{
  return 1;
}

- (BOOL)_openDatabaseAtPath:(id)a3 checkIntegrity:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BOOL v9;

  v6 = a4;
  v8 = a3;
  v9 = -[WebBookmarkCollection _unsafeOpenDatabaseAtPath:checkIntegrity:error:](self, "_unsafeOpenDatabaseAtPath:checkIntegrity:error:", v8, v6, a5);
  if (!v9)
  {
    sqlite3_close(self->_db);
    self->_db = 0;
  }

  return v9;
}

- (BOOL)_migrateToCurrentSchema
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v3 = -[WebBookmarkCollection _userVersion](self, "_userVersion");
  if (-[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed"))
  {
    if (v3 < 56)
    {
      if (v3 == 55)
      {
LABEL_68:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {
      v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _migrateToCurrentSchema].cold.3();
    }
    if (!-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly")
      || (objc_msgSend((id)objc_opt_class(), "lockSync") & 1) != 0)
    {
      switch(v3)
      {
        case -1:
          v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            -[WebBookmarkCollection _migrateToCurrentSchema].cold.1();
          break;
        case 0:
          -[WebBookmarkCollection _migrateSchemaVersion0ToVersion1](self, "_migrateSchemaVersion0ToVersion1");
          goto LABEL_19;
        case 1:
        case 2:
LABEL_19:
          -[WebBookmarkCollection _migrateSchemaVersion1And2ToVersion3](self, "_migrateSchemaVersion1And2ToVersion3");
          goto LABEL_20;
        case 3:
LABEL_20:
          -[WebBookmarkCollection _migrateSchemaVersion3ToVersion4](self, "_migrateSchemaVersion3ToVersion4");
          goto LABEL_21;
        case 4:
LABEL_21:
          -[WebBookmarkCollection _migrateSchemaVersion4ToVersion5](self, "_migrateSchemaVersion4ToVersion5");
          goto LABEL_22;
        case 5:
LABEL_22:
          -[WebBookmarkCollection _migrateSchemaVersion5ToVersion6](self, "_migrateSchemaVersion5ToVersion6");
          goto LABEL_23;
        case 6:
LABEL_23:
          -[WebBookmarkCollection _migrateSchemaVersion6ToVersion7](self, "_migrateSchemaVersion6ToVersion7");
          goto LABEL_24;
        case 7:
LABEL_24:
          -[WebBookmarkCollection _migrateSchemaVersion7ToVersion8](self, "_migrateSchemaVersion7ToVersion8");
          goto LABEL_25;
        case 8:
LABEL_25:
          -[WebBookmarkCollection _migrateSchemaVersion8ToVersion9](self, "_migrateSchemaVersion8ToVersion9");
          goto LABEL_26;
        case 9:
LABEL_26:
          -[WebBookmarkCollection _migrateSchemaVersion9ToVersion10](self, "_migrateSchemaVersion9ToVersion10");
          goto LABEL_27;
        case 10:
LABEL_27:
          -[WebBookmarkCollection _migrateSchemaVersion10ToVersion11](self, "_migrateSchemaVersion10ToVersion11");
          goto LABEL_28;
        case 11:
        case 12:
        case 13:
LABEL_28:
          -[WebBookmarkCollection _migrateSchemaVersion11And12And13ToVersion14](self, "_migrateSchemaVersion11And12And13ToVersion14");
          goto LABEL_29;
        case 14:
LABEL_29:
          -[WebBookmarkCollection _migrateSchemaVersion14ToVersion15](self, "_migrateSchemaVersion14ToVersion15");
          goto LABEL_30;
        case 15:
LABEL_30:
          -[WebBookmarkCollection _migrateSchemaVersion15ToVersion16](self, "_migrateSchemaVersion15ToVersion16");
          goto LABEL_31;
        case 16:
        case 17:
        case 18:
LABEL_31:
          -[WebBookmarkCollection _migrateSchemaVersion16AndVersion17AndVersion18ToVersion19](self, "_migrateSchemaVersion16AndVersion17AndVersion18ToVersion19");
          goto LABEL_32;
        case 19:
        case 20:
LABEL_32:
          -[WebBookmarkCollection _migrateSchemaVersion19And20ToVersion21](self, "_migrateSchemaVersion19And20ToVersion21");
          goto LABEL_33;
        case 21:
LABEL_33:
          -[WebBookmarkCollection _migrateSchemaVersion21ToVersion22](self, "_migrateSchemaVersion21ToVersion22");
          goto LABEL_34;
        case 22:
LABEL_34:
          -[WebBookmarkCollection _migrateSchemaVersion22ToVersion23](self, "_migrateSchemaVersion22ToVersion23");
          goto LABEL_35;
        case 23:
LABEL_35:
          -[WebBookmarkCollection _migrateSchemaVersion23ToVersion24](self, "_migrateSchemaVersion23ToVersion24");
          goto LABEL_36;
        case 24:
LABEL_36:
          -[WebBookmarkCollection _migrateSchemaVersion24ToVersion25](self, "_migrateSchemaVersion24ToVersion25");
          goto LABEL_37;
        case 25:
LABEL_37:
          -[WebBookmarkCollection _migrateSchemaVersion25ToVersion26](self, "_migrateSchemaVersion25ToVersion26");
          goto LABEL_38;
        case 26:
LABEL_38:
          -[WebBookmarkCollection _migrateSchemaVersion26ToVersion27](self, "_migrateSchemaVersion26ToVersion27");
          goto LABEL_39;
        case 27:
LABEL_39:
          -[WebBookmarkCollection _migrateSchemaVersion27ToVersion28](self, "_migrateSchemaVersion27ToVersion28");
          goto LABEL_40;
        case 28:
LABEL_40:
          -[WebBookmarkCollection _migrateSchemaVersion28ToVersion29](self, "_migrateSchemaVersion28ToVersion29");
          goto LABEL_41;
        case 29:
LABEL_41:
          -[WebBookmarkCollection _migrateSchemaVersion29ToVersion30](self, "_migrateSchemaVersion29ToVersion30");
          goto LABEL_42;
        case 30:
LABEL_42:
          -[WebBookmarkCollection _migrateSchemaVersion30ToVersion31](self, "_migrateSchemaVersion30ToVersion31");
          goto LABEL_43;
        case 31:
LABEL_43:
          -[WebBookmarkCollection _migrateSchemaVersion31ToVersion32](self, "_migrateSchemaVersion31ToVersion32");
          goto LABEL_44;
        case 32:
LABEL_44:
          -[WebBookmarkCollection _migrateSchemaVersion32ToVersion33](self, "_migrateSchemaVersion32ToVersion33");
          goto LABEL_45;
        case 33:
LABEL_45:
          -[WebBookmarkCollection _migrateSchemaVersion33ToVersion34](self, "_migrateSchemaVersion33ToVersion34");
          goto LABEL_46;
        case 34:
LABEL_46:
          -[WebBookmarkCollection _migrateSchemaVersion34ToVersion35](self, "_migrateSchemaVersion34ToVersion35");
          goto LABEL_47;
        case 35:
LABEL_47:
          -[WebBookmarkCollection _migrateSchemaVersion35ToVersion36](self, "_migrateSchemaVersion35ToVersion36");
          goto LABEL_48;
        case 36:
LABEL_48:
          -[WebBookmarkCollection _migrateSchemaVersion36ToVersion37](self, "_migrateSchemaVersion36ToVersion37");
          goto LABEL_49;
        case 37:
LABEL_49:
          -[WebBookmarkCollection _migrateSchemaVersion37ToVersion38](self, "_migrateSchemaVersion37ToVersion38");
          goto LABEL_50;
        case 38:
LABEL_50:
          -[WebBookmarkCollection _migrateSchemaVersion38ToVersion39](self, "_migrateSchemaVersion38ToVersion39");
          goto LABEL_51;
        case 39:
        case 40:
LABEL_51:
          -[WebBookmarkCollection _migrateSchemaVersion39Or40ToVersion41](self, "_migrateSchemaVersion39Or40ToVersion41");
          goto LABEL_52;
        case 41:
LABEL_52:
          -[WebBookmarkCollection _migrateSchemaVersion41ToVersion42](self, "_migrateSchemaVersion41ToVersion42");
          goto LABEL_53;
        case 42:
LABEL_53:
          -[WebBookmarkCollection _migrateSchemaVersion42ToVersion43](self, "_migrateSchemaVersion42ToVersion43");
          goto LABEL_54;
        case 43:
LABEL_54:
          -[WebBookmarkCollection _migrateSchemaVersion43ToVersion44](self, "_migrateSchemaVersion43ToVersion44");
          goto LABEL_55;
        case 44:
LABEL_55:
          -[WebBookmarkCollection _migrateSchemaVersion44ToVersion45](self, "_migrateSchemaVersion44ToVersion45");
          goto LABEL_56;
        case 45:
LABEL_56:
          -[WebBookmarkCollection _migrateSchemaVersion45ToVersion46](self, "_migrateSchemaVersion45ToVersion46");
          goto LABEL_57;
        case 46:
LABEL_57:
          -[WebBookmarkCollection _migrateSchemaVersion46ToVersion47](self, "_migrateSchemaVersion46ToVersion47");
          goto LABEL_58;
        case 47:
LABEL_58:
          -[WebBookmarkCollection _migrateSchemaVersion47ToVersion48](self, "_migrateSchemaVersion47ToVersion48");
          goto LABEL_59;
        case 48:
LABEL_59:
          -[WebBookmarkCollection _migrateSchemaVersion48ToVersion49](self, "_migrateSchemaVersion48ToVersion49");
          goto LABEL_60;
        case 49:
LABEL_60:
          -[WebBookmarkCollection _migrateSchemaVersion49ToVersion50](self, "_migrateSchemaVersion49ToVersion50");
          goto LABEL_61;
        case 50:
LABEL_61:
          -[WebBookmarkCollection _migrateSchemaVersion50ToVersion51](self, "_migrateSchemaVersion50ToVersion51");
          goto LABEL_62;
        case 51:
LABEL_62:
          -[WebBookmarkCollection _migrateSchemaVersion51ToVersion52](self, "_migrateSchemaVersion51ToVersion52");
          goto LABEL_63;
        case 52:
LABEL_63:
          -[WebBookmarkCollection _migrateSchemaVersion52ToVersion53](self, "_migrateSchemaVersion52ToVersion53");
          goto LABEL_64;
        case 53:
LABEL_64:
          -[WebBookmarkCollection _migrateSchemaVersion53ToVersion54](self, "_migrateSchemaVersion53ToVersion54");
          goto LABEL_65;
        case 54:
LABEL_65:
          -[WebBookmarkCollection _migrateSchemaVersion54ToVersion55](self, "_migrateSchemaVersion54ToVersion55");
          break;
        default:
          break;
      }
      -[WebBookmarkCollection _rerunMigrationsIfNecessary](self, "_rerunMigrationsIfNecessary");
      if (-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly"))
        objc_msgSend((id)objc_opt_class(), "unlockSync");
      goto LABEL_68;
    }
    v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v5 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      -[WebBookmarkCollection _migrateToCurrentSchema].cold.2();
      goto LABEL_17;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
    if (v3 <= 54 && v3 != 39)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      v5 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[WebBookmarkCollection _migrateToCurrentSchema].cold.4();
LABEL_17:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (BOOL)_unsafeOpenDatabaseAtPath:(id)a3 checkIntegrity:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 v9;
  int v10;
  id v11;
  sqlite3 **p_db;
  int v13;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  char v18;
  int v19;
  char v20;
  int v21;
  _BOOL4 v22;
  id v23;
  id v24;
  NSObject *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  _QWORD v30[5];
  BOOL v31;
  _BYTE v32[8];
  sqlite3_stmt *v33;
  char v34;
  int v35;
  uint64_t v36;
  _QWORD v37[2];

  v6 = a4;
  v37[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = -[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed");
  if (v9)
    v10 = 3145730;
  else
    v10 = 3145729;
  v11 = objc_retainAutorelease(v8);
  p_db = &self->_db;
  v13 = sqlite3_open_v2((const char *)objc_msgSend(v11, "UTF8String"), &self->_db, v10, 0);
  v35 = v13;
  if (v13 == 14 && v9)
  {
    v35 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), &self->_db, v10 | 4, 0);
    v15 = v35 == 0;
    if (!v35)
      goto LABEL_9;
  }
  else
  {
    v15 = 0;
    if (!v13)
    {
LABEL_9:
      sqlite3_busy_timeout(*p_db, 3000);
      -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA journal_mode = wal");
      v16 = -[WebBookmarkCollection _userVersion](self, "_userVersion");
      if (v16 >= 41)
        -[WebBookmarkCollection _enableForeignKeys](self, "_enableForeignKeys");
      -[WebBookmarkCollection _enableAutoVacuum](self, "_enableAutoVacuum");
      if ((objc_msgSend(v11, "containsString:", CFSTR(":memory:")) & 1) != 0)
        v17 = 1;
      else
        v17 = objc_msgSend(v11, "containsString:", CFSTR("mode=memory"));
      if (v16 == 55)
        v19 = 0;
      else
        v19 = v17;
      v20 = v15 | v19;
      if ((v15 | v19) == 1)
        -[WebBookmarkCollection _createFreshDatabase](self, "_createFreshDatabase");
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32, *p_db, "SELECT * FROM bookmarks LIMIT 1");
      if (v34)
      {
        v21 = sqlite3_step(v33);
        v35 = v21;
        if (v21 == 100)
        {
          WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v32);
          if (-[WebBookmarkCollection _verifyAllTablesExist:](self, "_verifyAllTablesExist:", &v35))
          {
            if (v6 && !-[WebBookmarkCollection _checkDatabaseIntegrity](self, "_checkDatabaseIntegrity"))
            {
              if (a5)
              {
                v36 = *MEMORY[0x24BDD0FC8];
                v37[0] = CFSTR("Database failed full integrity check.");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.SQLiteError"), 11, v27);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
            }
            else
            {
              v22 = -[WebBookmarkCollection _migrateToCurrentSchema](self, "_migrateToCurrentSchema");
              if (v9 || v22)
              {
                v23 = objc_alloc_init(MEMORY[0x24BE82DE0]);
                v30[0] = MEMORY[0x24BDAC760];
                v30[1] = 3221225472;
                v30[2] = __72__WebBookmarkCollection__unsafeOpenDatabaseAtPath_checkIntegrity_error___block_invoke;
                v30[3] = &unk_24CB326C0;
                v31 = v9;
                v30[4] = self;
                objc_msgSend(v23, "setHandler:", v30);
                if ((v20 & 1) != 0)
                {
                  v18 = 1;
LABEL_63:

                  goto LABEL_47;
                }
                if (-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly")
                  && -[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed")
                  && (objc_msgSend((id)objc_opt_class(), "isLockedSync") & 1) == 0)
                {
                  v28 = 0;
                  v18 = 0;
                  if ((objc_msgSend((id)objc_opt_class(), "lockSync") & 1) == 0)
                    goto LABEL_63;
                }
                else
                {
                  v28 = 1;
                }
                if (-[WebBookmarkCollection _updateDatabaseIfNewerSafariVersionWasLaunched](self, "_updateDatabaseIfNewerSafariVersionWasLaunched")&& -[WebBookmarkCollection _updateDatabaseOutsideSafariProcessIfNewerSafariVersionWasLaunched](self, "_updateDatabaseOutsideSafariProcessIfNewerSafariVersionWasLaunched"))
                {
                  v29 = -[WebBookmarkCollection _updateDatabaseIfNewerOSVersionWasLaunched](self, "_updateDatabaseIfNewerOSVersionWasLaunched");
                  if (((v28 | !v29) & 1) != 0)
                  {
                    v18 = v29 && v22;
                  }
                  else
                  {
                    objc_msgSend((id)objc_opt_class(), "unlockSync");
                    v18 = v22;
                  }
                }
                else
                {
                  v18 = 0;
                }
                goto LABEL_63;
              }
            }
            goto LABEL_46;
          }
          if (a5)
          {
            if ((v35 - 5) > 1)
            {
              v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[WebBookmarkCollection _unsafeOpenDatabaseAtPath:checkIntegrity:error:].cold.1();
              -[WebBookmarkCollection _errorForMostRecentSQLiteErrorWithErrorCode:](self, "_errorForMostRecentSQLiteErrorWithErrorCode:", 11);
              v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              -[WebBookmarkCollection _errorForMostRecentSQLiteErrorWithErrorCode:](self, "_errorForMostRecentSQLiteErrorWithErrorCode:");
              v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_42;
          }
        }
        else
        {
          if (a5)
          {
            if (v21 == 101)
              -[WebBookmarkCollection _errorForMostRecentSQLiteErrorWithErrorCode:](self, "_errorForMostRecentSQLiteErrorWithErrorCode:", 11);
            else
              -[WebBookmarkCollection _errorForMostRecentSQLiteError](self, "_errorForMostRecentSQLiteError");
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v32);
        }
      }
      else if (a5)
      {
        if ((sqlite3_errcode(*p_db) - 5) > 1)
          -[WebBookmarkCollection _errorForMostRecentSQLiteErrorWithErrorCode:](self, "_errorForMostRecentSQLiteErrorWithErrorCode:", 11);
        else
          -[WebBookmarkCollection _errorForMostRecentSQLiteError](self, "_errorForMostRecentSQLiteError");
        v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
        v18 = 0;
        *a5 = v24;
LABEL_47:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32);
        goto LABEL_48;
      }
LABEL_46:
      v18 = 0;
      goto LABEL_47;
    }
  }
  if (a5)
  {
    -[WebBookmarkCollection _errorForMostRecentSQLiteError](self, "_errorForMostRecentSQLiteError");
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_48:

  return v18;
}

- (BOOL)_isDatabaseWriteAllowed
{
  _BOOL4 v3;

  if (-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly"))
  {
    v3 = -[WBCollectionConfiguration createIfNeeded](self->_configuration, "createIfNeeded");
    if (v3)
      LOBYTE(v3) = !self->_setupFinished;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_updateDatabaseIfNewerVersion:(id)a3 wasLaunchedForSyncStringKey:(id)a4 upgradeSelector:(SEL)a5 versionType:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  unsigned int (*v24)(_QWORD, _QWORD, _QWORD);
  BOOL v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  WebBookmarkCollection *v32;
  id v33;
  id v34;
  unsigned int (*v35)(_QWORD, _QWORD, _QWORD);
  SEL v36;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCF50], "sf_safariSharedDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringForKey:", CFSTR("DebugForceMigrationFromSafariVersionKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("0");
    if (v17)
      v19 = (__CFString *)v17;
    v16 = v19;

  }
  v20 = objc_msgSend(v10, "compare:options:", v16, 64);
  if (!-[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed"))
  {
    v22 = v20 != 1;
    goto LABEL_13;
  }
  if (!v20)
    goto LABEL_11;
  if (v20 == -1)
  {
    v21 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:].cold.2();
LABEL_11:
    v22 = 1;
    goto LABEL_13;
  }
  if (!-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly")
    || (objc_msgSend((id)objc_opt_class(), "lockSync") & 1) != 0)
  {
    v24 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))-[WebBookmarkCollection methodForSelector:](self, "methodForSelector:", a5);
    if (-[WebBookmarkCollection _isDatabaseWriteAllowed](self, "_isDatabaseWriteAllowed")
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __111__WebBookmarkCollection__updateDatabaseIfNewerVersion_wasLaunchedForSyncStringKey_upgradeSelector_versionType___block_invoke;
      v30 = &unk_24CB328F8;
      v31 = v13;
      v32 = self;
      v33 = v11;
      v34 = v10;
      v35 = v24;
      v36 = a5;
      v25 = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", &v27, 0);

      if (!v25)
      {
LABEL_19:
        v22 = 0;
        goto LABEL_22;
      }
    }
    else if (!v24(self, a5, v16))
    {
      goto LABEL_19;
    }
    -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v10, v11, v27, v28, v29, v30);
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("DebugForceMigrationFromSafariVersionKey"));
    v22 = 1;
LABEL_22:
    if (-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly", v27, v28, v29, v30))
      objc_msgSend((id)objc_opt_class(), "unlockSync");
    goto LABEL_13;
  }
  v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:].cold.1();
  v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)_updateDatabaseIfNewerSafariVersionWasLaunched
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "safari_safariCoreBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_normalizedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:](self, "_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:", v4, CFSTR("newestLaunchedSafariVersion"), sel__performSafariVersionUpgradesFromPreviousVersion_, CFSTR("Safari"));
  return (char)self;
}

- (BOOL)_updateDatabaseIfNewerOSVersionWasLaunched
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_operatingSystemVersionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:](self, "_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:", v4, CFSTR("newestLaunchedOSVersion"), sel__performOSVersionUpgradesFromPreviousVersion_, CFSTR("OS"));
  return (char)self;
}

- (void)_enableForeignKeys
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA foreign_keys = ON");
}

- (void)_enableAutoVacuum
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA auto_vacuum = INCREMENTAL");
}

- (void)_setupInMemoryChangeSet
{
  _QWORD block[5];

  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__WebBookmarkCollection__setupInMemoryChangeSet__block_invoke;
    block[3] = &unk_24CB31DC8;
    block[4] = self;
    if (-[WebBookmarkCollection _setupInMemoryChangeSet]::onceToken != -1)
      dispatch_once(&-[WebBookmarkCollection _setupInMemoryChangeSet]::onceToken, block);
  }
}

- (BOOL)_migrateBookmarksPlist:(id)a3 syncAnchorPlist:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  const char *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v6 || (objc_msgSend(v9, "fileExistsAtPath:", v6) & 1) == 0)
    {
      v8 = 1;
LABEL_26:

      goto LABEL_27;
    }
    WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v22, self->_db);
    if (v22[17])
    {
      if (-[WebBookmarkCollection _importBookmarksPlist:](self, "_importBookmarksPlist:", v6))
      {
        v21 = 0;
        v11 = objc_msgSend(v10, "removeItemAtPath:error:", v6, &v21);
        v12 = v21;
        v13 = v12;
        if ((v11 & 1) != 0)
        {

          if (v7 && objc_msgSend(v10, "fileExistsAtPath:", v7))
          {
            if (!-[WebBookmarkCollection _importSyncAnchorPlist:](self, "_importSyncAnchorPlist:", v7))
            {
              v13 = 0;
              goto LABEL_21;
            }
            v20 = 0;
            v16 = objc_msgSend(v10, "removeItemAtPath:error:", v7, &v20);
            v13 = v20;
            if ((v16 & 1) == 0)
            {
              v17 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "wb_privacyPreservingDescription");
                objc_claimAutoreleasedReturnValue();
                -[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:].cold.1();
              }
LABEL_20:

LABEL_21:
              v8 = 0;
LABEL_24:

              goto LABEL_25;
            }
          }
          else
          {
            v13 = 0;
          }
          WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v22, v14, v15);
          v8 = 1;
          goto LABEL_24;
        }
        v17 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "wb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:].cold.2();
        }
        goto LABEL_20;
      }
      v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:].cold.3();
    }
    v8 = 0;
LABEL_25:
    WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v22);
    goto LABEL_26;
  }
  v8 = 1;
LABEL_27:

  return v8;
}

- (BOOL)_reorderBookmark:(id)a3 afterBookmark:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "privacyPreservingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "Reordering bookmark %{public}@ after bookmark %{public}@", (uint8_t *)&v17, 0x16u);

  }
  v11 = -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v6);
  v12 = -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v7);
  if (v12 >= v11)
    v13 = v12;
  else
    v13 = v12 + 1;
  if (v7)
    v14 = v13;
  else
    v14 = 0;
  v15 = -[WebBookmarkCollection _reorderBookmark:toIndex:](self, "_reorderBookmark:toIndex:", v6, v14);

  return v15;
}

- (int64_t)_userVersion
{
  return -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", CFSTR("PRAGMA user_version"));
}

- (unsigned)orderIndexOfBookmark:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT order_index FROM bookmarks WHERE id = %d"), objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v5);

  if (v6 == -1)
    v6 = 0;

  return v6;
}

- (int)_intFromExecutingSQL:(id)a3
{
  return WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)a3, (NSString *)a3);
}

- (BOOL)_reorderBookmark:(id)a3 toIndex:(unsigned int)a4 generateSyncPositionIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  int v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v10;
    v22 = 1024;
    v23 = v6;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Reordering bookmark %{public}@ to index %d", (uint8_t *)&v20, 0x12u);

  }
  v11 = -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v8);
  if ((_DWORD)v11 != (_DWORD)v6)
  {
    if (v5
      && objc_msgSend(v8, "isSyncable")
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      v13 = objc_msgSend(v8, "parentID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _generateSyncPositionForOrderIndex:inFolderWithID:direction:](self, "_generateSyncPositionForOrderIndex:inFolderWithID:direction:", v6, v13, objc_msgSend(v14, "compare:", v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSyncPosition:", v16);

    }
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
      -[WebBookmarkCollection _mergeBookmarkIntoPersistedBookmark:forAttributes:](self, "_mergeBookmarkIntoPersistedBookmark:forAttributes:", v8, 4);
    if (objc_msgSend(v8, "isSyncable")
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      objc_msgSend(v8, "syncPosition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WebBookmarkCollection orderIndexOfBookmark:withSyncPosition:inFolderWithID:](self, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v8, v17, objc_msgSend(v8, "parentID"));

      v6 = (__PAIR64__(v18, v11) - v18) >> 32;
    }
    objc_msgSend(v8, "_setOrderIndex:", v6);
    if (!-[WebBookmarkCollection _moveBookmark:fromIndex:toIndex:](self, "_moveBookmark:fromIndex:toIndex:", v8, v11, objc_msgSend(v8, "orderIndex"))|| !-[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v8))
    {
      v12 = 0;
      goto LABEL_19;
    }
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v8, "parentID"));
  }
  v12 = 1;
LABEL_19:

  return v12;
}

- (BOOL)_reorderBookmark:(id)a3 toIndex:(unsigned int)a4
{
  return -[WebBookmarkCollection _reorderBookmark:toIndex:generateSyncPositionIfNeeded:](self, "_reorderBookmark:toIndex:generateSyncPositionIfNeeded:", a3, *(_QWORD *)&a4, 1);
}

- (void)_registerForSyncBookmarksFileChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[WebBookmarkCollection _updateSyncNotificationType](self, "_updateSyncNotificationType");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)BookmarksFileChanged, CFSTR("com.apple.bookmarks.BookmarksFileChanged"), 0, (CFNotificationSuspensionBehavior)1024);
}

- (void)_updateSyncNotificationType
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[WebBookmarkCollection localMigrationState](self, "localMigrationState");
  if ((unint64_t)(v3 + 1) > 4)
    v4 = 2;
  else
    v4 = qword_2110B88D0[v3 + 1];
  -[WebBookmarkCollection _setSyncNotificationType:](self, "_setSyncNotificationType:", v4);
  if (v3 != self->_lastObservedLocalMigrationState)
  {
    v9[0] = CFSTR("fromMigrationState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = CFSTR("toMigrationState");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("WebBookmarksDetectedLocalMigrationStateTransitionNotification"), self, v7);

    self->_lastObservedLocalMigrationState = v3;
  }
}

- (void)_setSyncNotificationType:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_DEFAULT, "Setting sync notification type: %ld", buf, 0xCu);
  }
  v5 = objc_opt_class();
  syncLockQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__WebBookmarkCollection_Sync___setSyncNotificationType___block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0lu32l8;
  v7[4] = v5;
  v7[5] = a3;
  dispatch_barrier_async(v6, v7);

}

- (int64_t)localMigrationState
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_deviceIdentifierForCloudKitWithCollectionType:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138477827;
      v14 = v5;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_DEFAULT, "Looking up migration state for device identifier %{private}@", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(CFSTR("_ck_local_migration_state_"), "stringByAppendingString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_DEFAULT, "Local migration state read from database %{public}@", (uint8_t *)&v13, 0xCu);
    }
    v10 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_DEFAULT, "Device identifier is empty", (uint8_t *)&v13, 2u);
    }
    v10 = objc_msgSend(v3, "encounteredErrorWhileObtainingUUID") << 63 >> 63;
  }

  return v10;
}

+ (id)_deviceIdentifierForCloudKitWithCollectionType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", a3, 0);
}

uint64_t __43__WebBookmarkCollection_Sync__isLockedSync__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "_isLockedSync");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_createInMemoryChangeSet
{
  WebBookmarkChangeSet *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [WebBookmarkChangeSet alloc];
  objc_msgSend((id)objc_opt_class(), "inMemoryChangesFileURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WebBookmarkChangeSet initWithFileURL:](v2, "initWithFileURL:");
  v4 = (void *)inMemoryChangeSet;
  inMemoryChangeSet = v3;

}

+ (NSURL)inMemoryChangesFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "safariDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("bookmarkChanges.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (BOOL)performDatabaseUpdatesWithTransaction:(id)a3 secureDelete:(BOOL)a4
{
  return -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:](self, "performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:", a3, 1, a4);
}

uint64_t __72__WebBookmarkCollection__unsafeOpenDatabaseAtPath_checkIntegrity_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 40))
  {
    v1 = result;
    result = objc_msgSend((id)objc_opt_class(), "isLockedSync");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 32), "_restoreMissingSpecialBookmarksWithChangeNotification:", 0);
  }
  return result;
}

- (BOOL)performDatabaseUpdatesWithTransaction:(id)a3 applyInMemoryChanges:(BOOL)a4 secureDelete:(BOOL)a5
{
  _BOOL4 v6;
  uint64_t (**v8)(_QWORD);
  BOOL v9;
  WebBookmarks::BookmarkSQLWriteTransaction *v10;
  BookmarkSQLWriteTransaction *value;
  BookmarkSQLWriteTransaction *v12;
  int v13;
  uint64_t v14;
  const char *v15;
  BookmarkSQLWriteTransaction *v16;

  v6 = a4;
  v8 = (uint64_t (**)(_QWORD))a3;
  if ((objc_msgSend((id)objc_opt_class(), "isLockedSync") & 1) == 0)
    -[WebBookmarkCollection _simulateCrashWithDescription:](self, "_simulateCrashWithDescription:", CFSTR("Trying to edit bookmarks without first obtaining the bookmarks database file lock."));
  if (v6 && !-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    v9 = -[WebBookmarkCollection isTransactionCurrentlyActive](self, "isTransactionCurrentlyActive");
    if (!v9)
    {
      v10 = (WebBookmarks::BookmarkSQLWriteTransaction *)operator new();
      WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(v10, self->_db);
      value = self->_currentTransaction.__ptr_.__value_;
      self->_currentTransaction.__ptr_.__value_ = (BookmarkSQLWriteTransaction *)v10;
      if (value)
        (*(void (**)(BookmarkSQLWriteTransaction *))(*(_QWORD *)value + 8))(value);
    }
    v12 = self->_currentTransaction.__ptr_.__value_;
    if (*((_BYTE *)v12 + 17))
    {
      v13 = v8[2](v8);
      v12 = self->_currentTransaction.__ptr_.__value_;
    }
    else
    {
      v13 = 0;
    }
    WebBookmarks::BookmarkSQLWriteTransaction::requestSecureDelete((uint64_t)v12, a5);
    if (!v9)
    {
      if (v13)
      {
        WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)self->_currentTransaction.__ptr_.__value_, v14, v15);
        v16 = self->_currentTransaction.__ptr_.__value_;
        if (!*((_BYTE *)v16 + 18))
        {
          self->_currentTransaction.__ptr_.__value_ = 0;
LABEL_19:
          (*(void (**)(BookmarkSQLWriteTransaction *))(*(_QWORD *)v16 + 8))(v16);
          goto LABEL_20;
        }
        -[WebBookmarkCollection truncateWAL](self, "truncateWAL");
      }
      v16 = self->_currentTransaction.__ptr_.__value_;
      self->_currentTransaction.__ptr_.__value_ = 0;
      if (!v16)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
LABEL_20:

  return v13;
}

- (BOOL)isTransactionCurrentlyActive
{
  BookmarkSQLWriteTransaction *value;

  value = self->_currentTransaction.__ptr_.__value_;
  return value && *((_BYTE *)value + 17) && *((_BYTE *)value + 16) == 0;
}

+ (BOOL)isLockedSync
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncLockQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__WebBookmarkCollection_Sync__isLockedSync__block_invoke;
  v5[3] = &unk_24CB32DC8;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync(v3, v5);

  LOBYTE(a1) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)a1;
}

- (BOOL)_restoreMissingSpecialBookmarksWithChangeNotification:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  -[WebBookmarkCollection _createRecoveredBookmarksFolderIfNeeded](self, "_createRecoveredBookmarksFolderIfNeeded");
  if (-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"))
    goto LABEL_4;
  v5 = -[WebBookmarkCollection _restoreBookmarkBarIfMissing](self, "_restoreBookmarkBarIfMissing");
  if (v5)
  {
    -[WebBookmarkCollection _restoreOrMergeReadingListFolderWithChangeNotification:](self, "_restoreOrMergeReadingListFolderWithChangeNotification:", v3);
    -[WebBookmarkCollection restoreOrMergeAllowedSitesFolderAndContentsWithChangeNotification:](self, "restoreOrMergeAllowedSitesFolderAndContentsWithChangeNotification:", v3);
LABEL_4:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_createRecoveredBookmarksFolderIfNeeded
{
  int v3;
  _BOOL4 v4;
  id v5;
  _QWORD v6[5];

  v3 = -[WebBookmarkCollection bookmarkIDWithSpecialID:](self, "bookmarkIDWithSpecialID:", 6);
  v4 = -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata");
  if (v3 == 0x7FFFFFFF)
  {
    if (v4)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __64__WebBookmarkCollection__createRecoveredBookmarksFolderIfNeeded__block_invoke;
      v6[3] = &unk_24CB31E10;
      v6[4] = self;
      -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v6, 0);
    }
  }
  else if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmarks WHERE special_id = %d"), 6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:");

  }
}

- (int)bookmarkIDWithSpecialID:(int)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE special_id = %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v4);

  if (v5 == -1)
    return 0x7FFFFFFF;
  else
    return v5;
}

- (BOOL)truncateWAL
{
  return -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA wal_checkpoint(TRUNCATE)") == 0;
}

- (void)restoreOrMergeAllowedSitesFolderAndContentsWithChangeNotification:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    +[WBWebFilterSettings sharedWebFilterSettings](WBWebFilterSettings, "sharedWebFilterSettings");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "usesAllowedSitesOnly") & 1) != 0)
    {
      objc_msgSend(v7, "userSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "whiteListAllowedSites");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _restoreOrMergeAllowedSitesFolderAndContentsWithWebFilterAllowedSites:ensureChildCount:postChangeNotification:](self, "_restoreOrMergeAllowedSitesFolderAndContentsWithWebFilterAllowedSites:ensureChildCount:postChangeNotification:", v6, 1, v3);

    }
  }
}

- (BOOL)maintainsSyncMetadata
{
  return 0;
}

- (void)enumerateDescendantsOfBookmarkID:(int)a3 usingBlock:(id)a4
{
  -[WebBookmarkCollection _enumerateContentsOfBookmarkFolder:includingSubfolders:usingBlock:](self, "_enumerateContentsOfBookmarkFolder:includingSubfolders:usingBlock:", *(_QWORD *)&a3, 1, a4);
}

- (void)_restoreOrMergeReadingListFolderWithChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  int v6;
  WebBookmark *v7;
  sqlite3_stmt *v8;
  void *v9;
  WebBookmark *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  WebBookmark *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  _BYTE v25[8];
  sqlite3_stmt *v26;

  v3 = a3;
  if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    v24 = v3;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v25, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("title = ? AND parent = 0 AND deleted = 0 ORDER BY order_index ASC")));
    sqlite3_bind_text(v26, 1, (const char *)objc_msgSend(CFSTR("com.apple.ReadingList"), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v5 = 0;
    v6 = 0;
    while (sqlite3_step(v26) == 100)
    {
      v7 = [WebBookmark alloc];
      v8 = v26;
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v7, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v8, v9, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

      if ((_DWORD)v5)
      {
        -[WebBookmarkCollection listWithID:](self, "listWithID:", -[WebBookmark identifier](v10, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "bookmarkCount");
        if (v12)
        {
          v13 = 0;
          do
          {
            objc_msgSend(v11, "bookmarkAtIndex:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "address");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[WebBookmarkCollection _firstBookmarkWithURLMatchingString:prefixMatch:inParent:](self, "_firstBookmarkWithURLMatchingString:prefixMatch:inParent:", v15, 0, v5);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              v17 = [WebBookmark alloc];
              objc_msgSend(v14, "title");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "address");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[WebBookmark initReadingListBookmarkWithTitle:address:previewText:](v17, "initReadingListBookmarkWithTitle:address:previewText:", v18, v19, 0);

              objc_msgSend(v14, "extraAttributes");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setExtraAttributes:", v21);

              objc_msgSend(v14, "localAttributes");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setLocalAttributes:", v22);

              objc_msgSend(v20, "_setParentID:", v5);
              -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v20, 0, 1);

            }
            v13 = (v13 + 1);
          }
          while (v12 != (_DWORD)v13);
        }
        -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v10, 1);

        v6 = 1;
      }
      else
      {
        if (!-[WebBookmark isHidden](v10, "isHidden")
          || !-[WebBookmark isReadingListFolder](v10, "isReadingListFolder"))
        {
          -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v10, 3, 1);
        }
        v5 = -[WebBookmark identifier](v10, "identifier");
      }

    }
    if ((_DWORD)v5)
    {
      if ((v6 & v24) != 1)
        goto LABEL_21;
    }
    else
    {
      v23 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));
      -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v23, 3, 1);

      if (!v24)
      {
LABEL_21:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25);
        return;
      }
    }
    -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
    goto LABEL_21;
  }
}

- (BOOL)_restoreBookmarkBarIfMissing
{
  _BOOL4 v3;
  const char *v4;
  const char *v5;
  const char *v6;
  sqlite3_int64 insert_rowid;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v3 = -[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase");
  if (v3)
  {
    if (!WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT COUNT(*) FROM bookmarks WHERE special_id = 1", v4))
    {
      if (WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"UPDATE bookmarks SET order_index = order_index + 1 WHERE parent = 0", v5))goto LABEL_9;
      if (WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"INSERT INTO bookmarks (special_id, parent, type, order_index, editable, deletable, title, external_uuid) VALUES (1, 0, 1, 0, 0, 0, 'BookmarksBar', '')", v6))goto LABEL_9;
      insert_rowid = sqlite3_last_insert_rowid(self->_db);
      if (WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"UPDATE bookmarks SET num_children = num_children + 1 WHERE id = 0", v8))goto LABEL_9;
      v9 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withAncestorIDs:](self, "_insertAncestorTableEntriesForBookmarkID:withAncestorIDs:", insert_rowid, v11);

      if (!v12)
      {
LABEL_9:
        LOBYTE(v3) = 0;
        return v3;
      }
      -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (WebBookmarkCollection)safariBookmarkCollection
{
  void *v2;
  BOOL v3;
  WebBookmarkCollection *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v10[3];

  if (+[WebBookmarkCollection safariBookmarkCollection]::onceToken != -1)
    dispatch_once(&+[WebBookmarkCollection safariBookmarkCollection]::onceToken, &__block_literal_global_158);
  v2 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::collection;
  if (!+[WebBookmarkCollection safariBookmarkCollection]::collection)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)+[WebBookmarkCollection safariBookmarkCollection]::mutex, 0xFFFFFFFFFFFFFFFFLL);
    if (+[WebBookmarkCollection safariBookmarkCollection]::collection)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)+[WebBookmarkCollection safariBookmarkCollection]::mutex);
LABEL_13:
      v2 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::collection;
      return (WebBookmarkCollection *)v2;
    }
    MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WebBookmarkCollection"));
    v3 = +[WebBookmarkCollection isLockedSync](WebBookmarkCollection, "isLockedSync");
    if (!v3)
      +[WebBookmarkCollection lockSync](WebBookmarkCollection, "lockSync");
    v4 = [WebBookmarkCollection alloc];
    +[WBCollectionConfiguration safariBookmarkCollectionConfiguration](WBCollectionConfiguration, "safariBookmarkCollectionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WebBookmarkCollection initWithConfiguration:checkIntegrity:](v4, "initWithConfiguration:checkIntegrity:", v5, 0);
    v7 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::collection;
    +[WebBookmarkCollection safariBookmarkCollection]::collection = v6;

    if (!+[WebBookmarkCollection safariBookmarkCollection]::collection
      && (v8 = WBS_LOG_CHANNEL_PREFIXBookmarks(), os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)))
    {
      +[WebBookmarkCollection safariBookmarkCollection].cold.1();
      if (v3)
        goto LABEL_12;
    }
    else if (v3)
    {
LABEL_12:
      dispatch_semaphore_signal((dispatch_semaphore_t)+[WebBookmarkCollection safariBookmarkCollection]::mutex);
      SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
      goto LABEL_13;
    }
    +[WebBookmarkCollection unlockSync](WebBookmarkCollection, "unlockSync");
    goto LABEL_12;
  }
  return (WebBookmarkCollection *)v2;
}

+ (void)unlockSync
{
  NSObject *v3;
  _QWORD block[5];

  syncLockQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WebBookmarkCollection_Sync__unlockSync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_barrier_sync(v3, block);

}

+ (BOOL)lockSync
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncLockQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__WebBookmarkCollection_Sync__lockSync__block_invoke;
  v5[3] = &unk_24CB32DC8;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_barrier_sync(v3, v5);

  LOBYTE(a1) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)a1;
}

uint64_t __39__WebBookmarkCollection_Sync__lockSync__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "_lockSync");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)_lockSync
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_syncFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "syncLockFileDescriptor");
  objc_msgSend(a1, "_syncLockFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != -1)
    goto LABEL_2;
  objc_msgSend(a1, "safariDirectoryPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v5);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  v14 = open(v13, 512, 438);
  v15 = v14;
  if ((_DWORD)v14 == -1)
  {
    objc_msgSend(v3, "setUnlockSyncRequested:", 0);
    v16 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[WebBookmarkCollection(Sync) _lockSync].cold.1((uint64_t)v13, v16, v17);
    goto LABEL_5;
  }
  if (flock(v14, 6) != -1)
  {
    objc_msgSend(v3, "setSyncLockFileDescriptor:", v15);
LABEL_2:
    objc_msgSend(v3, "setUnlockSyncRequested:", 0);
    v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v8;
      v24 = 2114;
      v25 = v5;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_DEFAULT, "Process %{public}@ did acquire lock: %{public}@", buf, 0x16u);

    }
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  v18 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *__error();
    *(_DWORD *)buf = 138543874;
    v23 = v20;
    v24 = 2114;
    v25 = v5;
    v26 = 1024;
    v27 = v21;
    _os_log_error_impl(&dword_211022000, v18, OS_LOG_TYPE_ERROR, "Process %{public}@ did fail to acquire lock: %{public}@ (%d)", buf, 0x1Cu);

  }
  close(v15);
  v9 = 0;
LABEL_6:

  return v9;
}

+ (void)_unlockSync
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_syncFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "syncLockFileDescriptor");
  if (v4 != -1)
  {
    objc_msgSend(v3, "lockSyncHoldRequestorPointers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v9;
        _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_DEFAULT, "Postponing unlockSync. The process %{public}@ has requested to hold the lock", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(v3, "setUnlockSyncRequested:", 1);
    }
    else
    {
      flock(v4, 8);
      close(v4);
      objc_msgSend(v3, "setSyncLockFileDescriptor:", 0xFFFFFFFFLL);
      objc_msgSend(v3, "setUnlockSyncRequested:", 0);
      if (objc_msgSend(v3, "postSyncNotificationWhenUnlocking"))
      {
        objc_msgSend(a1, "_postBookmarksChangedSyncNotificationOnSyncQueue");
        objc_msgSend(v3, "setPostSyncNotificationWhenUnlocking:", 0);
      }
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_syncLockFileName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v13;
        _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_DEFAULT, "Process %{public}@ did release lock: %{public}@", (uint8_t *)&v14, 0x16u);

      }
    }
  }

}

+ (id)_syncLockFileName
{
  return CFSTR("com.apple.Bookmarks.lock");
}

+ (BOOL)_isLockedSync
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_syncFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syncLockFileDescriptor") != -1;

  return v3;
}

+ (id)_syncFlags
{
  id v3;
  WebBookmarkCollectionSyncFlags *v4;

  if (syncFlagsDictionary(void)::onceToken != -1)
    dispatch_once(&syncFlagsDictionary(void)::onceToken, &__block_literal_global_179);
  v3 = (id)syncFlagsDictionary(void)::syncFlagsDictionary;
  objc_msgSend(v3, "objectForKey:", a1);
  v4 = (WebBookmarkCollectionSyncFlags *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[WebBookmarkCollectionSyncFlags initWithSyncAllowed:]([WebBookmarkCollectionSyncFlags alloc], "initWithSyncAllowed:", objc_msgSend(a1, "isSyncAllowed"));
    objc_msgSend(v3, "setObject:forKey:", v4, a1);
  }

  return v4;
}

- (WebBookmarkCollection)initWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4
{
  id v6;
  NSObject *v7;
  WebBookmarkCollection *v8;
  uint64_t v9;
  WBCollectionConfiguration *configuration;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WebBookmarkCollection *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  WebBookmarkCollection *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  WebBookmarkCollection *v25;
  _QWORD v27[4];
  WebBookmarkCollection *v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  id v38[3];
  objc_super v39;

  v6 = a3;
  bookmarksCollectionQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v39.receiver = self;
  v39.super_class = (Class)WebBookmarkCollection;
  v8 = -[WebBookmarkCollection init](&v39, sel_init);
  if (v8)
  {
    MEMORY[0x212BD4870](v38, CFSTR("com.apple.WebBookmarks.WebBookmarkCollection"));
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (WBCollectionConfiguration *)v9;

    -[WBCollectionConfiguration databasePath](v8->_configuration, "databasePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "databasePathForConfiguration:", v8->_configuration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = 0;
      v14 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "safariDirectoryPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("Bookmarks.plist"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByResolvingSymlinksInPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("Bookmarks.plist.anchor.plist"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByResolvingSymlinksInPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    bookmarksCollectionQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __62__WebBookmarkCollection_initWithConfiguration_checkIntegrity___block_invoke;
    v27[3] = &unk_24CB326E8;
    v32 = &v34;
    v20 = v8;
    v28 = v20;
    v29 = v12;
    v30 = v13;
    v31 = v14;
    v33 = a4;
    v21 = v14;
    v22 = v13;
    v23 = v12;
    dispatch_sync(v19, v27);

    v24 = v35;
    v20->_setupFinished = *((_BYTE *)v35 + 24);
    if (*((_BYTE *)v24 + 24))
      v25 = v20;
    else
      v25 = 0;
    v15 = v25;

    _Block_object_dispose(&v34, 8);
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v38);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)databasePathForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "safariDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_defaultDatabaseFileNameForConfiguration:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByResolvingSymlinksInPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)_defaultDatabaseFileNameForConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "collectionType");
  if (v4)
  {
    if (v4 == 1 && (v5 = objc_msgSend(v3, "storeOwner"), v5 <= 4))
      v6 = off_24CB32D28[v5];
    else
      v6 = 0;
  }
  else
  {
    v6 = CFSTR("Bookmarks.db");
  }

  return (id)v6;
}

+ (BOOL)isSyncAllowed
{
  return objc_opt_class() == (_QWORD)a1;
}

void __56__WebBookmarkCollection_Sync___setSyncNotificationType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_syncFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSyncNotificationType:", *(_QWORD *)(a1 + 40));

}

void __49__WebBookmarkCollection_safariBookmarkCollection__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::mutex;
  +[WebBookmarkCollection safariBookmarkCollection]::mutex = (uint64_t)v0;

}

- (id)readingListWithUnreadOnly:(BOOL)a3 filteredUsingString:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  WebBookmarkInMemoryChangeFilterUnreadOnly *v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("web_filter_status != %zd"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "insertString:atIndex:", CFSTR("read = 0 AND "), 0);
    v9 = objc_alloc_init(WebBookmarkInMemoryChangeFilterUnreadOnly);
  }
  else
  {
    v9 = 0;
  }
  -[WebBookmarkCollection _readingListItemsWhere:filteredBy:withInMemoryFilter:](self, "_readingListItemsWhere:filteredBy:withInMemoryFilter:", v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)purgeableReadingListItems
{
  uint64_t v3;
  WebBookmarkList *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  WebBookmarkList *v17;
  id v18;
  void *v19;
  void *v20;
  WebBookmarkListQuery *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID");
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("parent = %d AND deleted = 0 AND read = 1 AND (archive_status = %zd OR archive_status = %zd)"), v3, 1, 2);
  v21 = -[WebBookmarkListQuery initWithBookmarksWhere:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:orderBy:usingFilter:", v20, 0, 0);
  v4 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v21, 0, self);
  if (-[WebBookmarkList bookmarkCount](v4, "bookmarkCount"))
  {
    v17 = v4;
    v18 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    v5 = objc_alloc(MEMORY[0x24BDBCE48]);
    v19 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v6, "setDay:", -14);
    objc_msgSend(v19, "dateByAddingComponents:toDate:options:", v6, v18, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkList bookmarkArray](v4, "bookmarkArray");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "dateLastViewed");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "compare:", v7) == -1;

          if (v15)
            objc_msgSend(v8, "addObject:", v13);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v4 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v8;
}

- (id)_readingListItemsWhere:(id)a3 filteredBy:(id)a4 withInMemoryFilter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  WebBookmarkListQuery *v13;
  WebBookmarkList *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID");
  objc_msgSend(v11, "appendFormat:", CFSTR("parent = %d AND deleted = 0"), -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  if (v8)
    objc_msgSend(v11, "appendFormat:", CFSTR(" AND %@"), v8);
  v13 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", v11, v12, CFSTR("order_index DESC"), v9);
  -[WebBookmarkListQuery setInMemoryFilter:](v13, "setInMemoryFilter:", v10);
  v14 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v13, 0, self);

  return v14;
}

- (int)readingListFolderBookmarkID
{
  sqlite3 *v3;
  NSString *v4;

  v3 = (sqlite3 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE special_id = %d"), 3);
  LODWORD(self) = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, v3, v4);

  return (int)self;
}

- (id)syncDataForKey:(id)a3
{
  id v4;
  const void *v5;
  void *v6;
  _BYTE v8[8];
  sqlite3_stmt *v9;
  char v10;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "SELECT value FROM sync_properties WHERE key = ?");
  if (v10
    && (sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v9) == 100))
  {
    v5 = sqlite3_column_blob(v9, 0);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, sqlite3_column_bytes(v9, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return v6;
}

- (unint64_t)purgeableSpace
{
  id v2;
  unint64_t v3;
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
  -[WebBookmarkCollection purgeableReadingListItems](self, "purgeableReadingListItems");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "archiveSize", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (int)_finalizeStatementIfNotNull:(sqlite3_stmt *)a3
{
  if (a3)
    return sqlite3_finalize(a3);
  else
    return 0;
}

uint64_t __55__WebBookmarkCollection__setupWithPath_checkIntegrity___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend((id)objc_opt_class(), "unlockSync");
  return result;
}

+ (BOOL)_removeCorruptedBookmarksDatabaseAtPath:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v3;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Removing corrupted bookmarks database %{public}@", buf, 0xCu);
  }
  if (!objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
    goto LABEL_11;
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("corrupted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_web_pathWithUniqueFilenameForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "moveItemAtPath:toPath:error:", v3, v7, 0) & 1) == 0)
  {
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.corrupted"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_web_pathWithUniqueFilenameForPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "moveItemAtPath:toPath:error:", v3, v13, 0))
    {
      v7 = v13;
      goto LABEL_7;
    }

LABEL_11:
    v15 = objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v3);
    goto LABEL_12;
  }
LABEL_7:
  v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v7;
    _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_DEFAULT, "Corrupted bookmarks saved as %{public}@", buf, 0xCu);
  }

  v15 = 1;
LABEL_12:
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-journal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v16))
  {
    if (objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v16))
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v16;
        _os_log_impl(&dword_211022000, v17, OS_LOG_TYPE_DEFAULT, "Also removed the journal file %{public}@.", buf, 0xCu);
      }
    }
    else
    {
      v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:].cold.4();
    }
  }
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v19))
  {
    if (objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v19))
    {
      v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v19;
        _os_log_impl(&dword_211022000, v20, OS_LOG_TYPE_DEFAULT, "Also removed the wal file %{public}@.", buf, 0xCu);
      }
    }
    else
    {
      v21 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:].cold.3();
    }
  }
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-shm"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v22))
  {
    if (objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v22))
    {
      v23 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v22;
        _os_log_impl(&dword_211022000, v23, OS_LOG_TYPE_DEFAULT, "Also removed the shm file %{public}@.", buf, 0xCu);
      }
    }
    else
    {
      v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:].cold.2();
    }
  }
  if ((v15 & 1) == 0)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:].cold.1();
  }

  return v15;
}

- (BOOL)_checkDatabaseIntegrity
{
  int v2;
  NSObject *v3;
  BOOL v4;
  const unsigned __int8 *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;
  int v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "PRAGMA integrity_check(1)");
  v2 = v13;
  if ((v13 - 5) > 1)
  {
    if (v12)
    {
      if (sqlite3_step(v11) == 100)
      {
        v5 = sqlite3_column_text(v11, 0);
        if (v5)
        {
          v4 = strncmp((const char *)v5, "ok", 3uLL) == 0;
          goto LABEL_15;
        }
        v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection _checkDatabaseIntegrity].cold.2();
      }
      else
      {
        v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection _checkDatabaseIntegrity].cold.3();
      }
    }
    else
    {
      v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _checkDatabaseIntegrity].cold.1();
    }
    v4 = 0;
    goto LABEL_15;
  }
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  v4 = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v15 = v2;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "Skipping integrity check because database is busy or locked (sqlite code = %d)", buf, 8u);
  }
LABEL_15:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v4;
}

+ (WebBookmarkCollection)collectionWithConfiguration:(id)a3
{
  id v3;
  WebBookmarkCollection *v4;

  v3 = a3;
  v4 = -[WebBookmarkCollection initWithConfiguration:]([WebBookmarkCollection alloc], "initWithConfiguration:", v3);

  return v4;
}

- (WebBookmarkCollection)initWithConfiguration:(id)a3
{
  return -[WebBookmarkCollection initWithConfiguration:checkIntegrity:](self, "initWithConfiguration:checkIntegrity:", a3, 0);
}

- (WebBookmarkCollection)initWithPath:(id)a3 migratingBookmarksPlist:(id)a4 syncAnchorPlist:(id)a5
{
  id v6;
  WBCollectionConfiguration *v7;
  WebBookmarkCollection *v8;

  v6 = a3;
  v7 = -[WBCollectionConfiguration initWithCollectionType:databasePath:readonly:]([WBCollectionConfiguration alloc], "initWithCollectionType:databasePath:readonly:", 0, v6, 0);
  v8 = -[WebBookmarkCollection initWithConfiguration:checkIntegrity:](self, "initWithConfiguration:checkIntegrity:", v7, 0);

  return v8;
}

+ (NSString)readingListArchivesDirectoryPath
{
  if (+[WebBookmarkCollection readingListArchivesDirectoryPath]::onceToken != -1)
    dispatch_once(&+[WebBookmarkCollection readingListArchivesDirectoryPath]::onceToken, &__block_literal_global_9);
  return (NSString *)(id)+[WebBookmarkCollection readingListArchivesDirectoryPath]::archivePath;
}

void __57__WebBookmarkCollection_readingListArchivesDirectoryPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  WBSafariContainerPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v0;
  if (v0)
  {
    objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.mobilesafari"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "count"))
    {
      objc_msgSend(v1, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.mobilesafari"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }
  }

  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ReadingListArchives"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)+[WebBookmarkCollection readingListArchivesDirectoryPath]::archivePath;
  +[WebBookmarkCollection readingListArchivesDirectoryPath]::archivePath = v4;

}

+ (unint64_t)readingListArchivesDiskUsage
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readingListArchivesDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v2, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "attributesOfItemAtPath:error:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "fileSize");

        v5 += v11;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  bookmarksCollectionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__WebBookmarkCollection_dealloc__block_invoke;
  block[3] = &unk_24CB31DC8;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WebBookmarkCollection;
  -[WebBookmarkCollection dealloc](&v4, sel_dealloc);
}

void __32__WebBookmarkCollection_dealloc__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  sqlite3_close(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, *(const void **)(a1 + 32));
}

- (BOOL)cleanUpReadingListArchives
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  sqlite3 *db;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  NSObject *v35;
  unsigned int v37;
  void *context;
  unsigned int obj;
  id obja;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[8];
  sqlite3_stmt *v54;
  uint8_t v55[128];
  uint8_t v56[4];
  _BYTE v57[18];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_INFO, "Starting to migrate and clean up Reading List archives", buf, 2u);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET archive_status = ? WHERE archive_status = ? OR archive_status = ?");
  sqlite3_bind_int(v54, 1, 0);
  sqlite3_bind_int(v54, 2, 3);
  sqlite3_bind_int(v54, 3, 4);
  if (sqlite3_step(v54) == 101)
  {
    WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)buf);
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "readingListArchivesDirectoryPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PendingBookmarkChanges.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v5);

    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v6, "mutableCopy");

    v37 = -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID");
    v7 = 0;
    v8 = 0;
    obj = 0;
    do
    {
      context = (void *)MEMORY[0x212BD4AC8]();
      -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", v37, 0, obj, 100);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v8 = v9;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v50 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            if ((unint64_t)(objc_msgSend(v13, "archiveStatus") - 1) < 2)
            {
              objc_msgSend(v13, "UUID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "stringByAppendingPathComponent:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v56[0] = 0;
              v16 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v15, v56);
              if (v56[0])
                v17 = v16;
              else
                v17 = 0;
              if ((v17 & 1) != 0)
              {
                objc_msgSend(v13, "UUID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "removeObject:", v18);

              }
              else
              {
                v19 = objc_msgSend(v13, "identifier");
                if ((v7 & 1) != 0)
                  v20 = CFSTR(",%d");
                else
                  v20 = CFSTR("%d");
                objc_msgSend(v42, "appendFormat:", v20, v19);
                v7 = 1;
              }

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v10);
      }

      objc_autoreleasePoolPop(context);
      obj += 100;
    }
    while (objc_msgSend(v8, "count"));
    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET archive_status = ? WHERE parent = ? AND id IN (%@)"), v42);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      db = self->_db;
      obja = objc_retainAutorelease(v21);
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v56, db, (const char *)objc_msgSend(obja, "UTF8String"));
      sqlite3_bind_int(*(sqlite3_stmt **)&v57[4], 1, 0);
      sqlite3_bind_int(*(sqlite3_stmt **)&v57[4], 2, v37);
      if (sqlite3_step(*(sqlite3_stmt **)&v57[4]) != 101)
      {
        v35 = WBS_LOG_CHANNEL_PREFIXDataMigration();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection cleanUpReadingListArchives].cold.1();
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v56);
        v33 = 0;
        goto LABEL_45;
      }
      WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v56);
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v56);

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obja = v43;
    v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(obja);
          v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v3, "stringByAppendingPathComponent:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0;
          v28 = objc_msgSend(v4, "removeItemAtPath:error:", v27, &v44);
          v29 = v44;
          if ((v28 & 1) == 0)
          {
            v30 = (id)WBS_LOG_CHANNEL_PREFIXDataMigration();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v29, "wb_privacyPreservingDescription");
              v31 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v56 = 138543618;
              *(_QWORD *)v57 = v26;
              *(_WORD *)&v57[8] = 2114;
              *(_QWORD *)&v57[10] = v31;
              v32 = (void *)v31;
              _os_log_error_impl(&dword_211022000, v30, OS_LOG_TYPE_ERROR, "Failed to remove Reading List archive directory %{public}@: %{public}@", v56, 0x16u);

            }
          }

        }
        v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v23);
    }
    v33 = 1;
LABEL_45:

    goto LABEL_46;
  }
  v34 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    -[WebBookmarkCollection cleanUpReadingListArchives].cold.2();
  v33 = 0;
LABEL_46:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  return v33;
}

- (BOOL)markArchivedReadingListItemsAsNonRecoverable
{
  WebBookmarkCollection *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parent = %d AND deleted = 0 AND (archive_status = %zd OR archive_status = %zd)"), -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"), 1, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET archive_status = %zd WHERE %@"), 4, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[WebBookmarkCollection _executeSQL:](v2, "_executeSQL:", v4) == 0;

  return (char)v2;
}

- (BOOL)clearAllReadingListArchives
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *obj;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WBCurrentProcessContainerPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "readingListArchivesDirectoryPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v21, &v27);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v27;
    v19 = v5;
    if (v5)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = v5;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v24;
        v9 = 1;
        do
        {
          v10 = 0;
          v11 = v6;
          do
          {
            if (*(_QWORD *)v24 != v8)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
            objc_msgSend(v21, "stringByAppendingPathComponent:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v11;
            v14 = objc_msgSend(v4, "removeItemAtPath:error:", v13, &v22);
            v6 = v22;

            if ((v14 & 1) == 0)
            {
              v15 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v6, "wb_privacyPreservingDescription");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v29 = v12;
                v30 = 2114;
                v31 = v16;
                _os_log_error_impl(&dword_211022000, v15, OS_LOG_TYPE_ERROR, "Failed to remove Reading List archive directory with UUID %{public}@: %{public}@", buf, 0x16u);

              }
              v9 = 0;
            }

            ++v10;
            v11 = v6;
          }
          while (v7 != v10);
          v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v7);
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      obj = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "wb_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection clearAllReadingListArchives].cold.1();
      }
      v9 = 0;
    }

  }
  else
  {
    -[WebBookmarkCollection _safariFetcherServerProxy](self, "_safariFetcherServerProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clearAllReadingListArchives");

    return 1;
  }
  return v9;
}

- (BOOL)clearReadingListArchiveWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WBCurrentProcessContainerPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "readingListArchivesDirectoryPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v17);
      if (v17)
        v10 = v9;
      else
        v10 = 0;
      if ((v10 & 1) != 0)
      {
        v16 = 0;
        v11 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v16);
        v12 = v16;
        if ((v11 & 1) == 0)
        {
          v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "wb_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WebBookmarkCollection clearReadingListArchiveWithUUID:].cold.1();
          }

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[WebBookmarkCollection _safariFetcherServerProxy](self, "_safariFetcherServerProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearReadingListArchiveWithUUID:", v4);

    v11 = 1;
  }

  return v11;
}

- (BOOL)updateReadingListWebFilterStatusForUnsetItemsOnly:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v18;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v5 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Migrating Reading List web filter status", buf, 2u);
  }
  +[WBWebFilterSettings sharedWebFilterSettings](WBWebFilterSettings, "sharedWebFilterSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("web_filter_status = %zd"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _readingListItemsWhere:filteredBy:withInMemoryFilter:](self, "_readingListItemsWhere:filteredBy:withInMemoryFilter:", v7, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_msgSend(v20, "contentFilterOverridesEnabled") & 1) == 0
      && (objc_msgSend(v20, "whiteListEnabled") & 1) == 0)
    {
      -[WebBookmarkCollection markWebContentFilterAllowsAllReadingListItems](self, "markWebContentFilterAllowsAllReadingListItems");
      goto LABEL_19;
    }
    -[WebBookmarkCollection _readingListItemsWhere:filteredBy:withInMemoryFilter:](self, "_readingListItemsWhere:filteredBy:withInMemoryFilter:", 0, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v18, "bookmarkArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v11, "address");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLWithString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v20, "contentFilterListsAllowURL:", v14);

        if (v15)
          v16 = 1;
        else
          v16 = 2;
        objc_msgSend(v11, "setWebFilterStatus:", v16);
        -[WebBookmarkCollection saveBookmark:startReadingListFetcher:](self, "saveBookmark:startReadingListFetcher:", v11, 0);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

LABEL_19:
  return 1;
}

- (BOOL)markWebContentFilterAllowsAllReadingListItems
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[8];
  sqlite3_stmt *v10;

  v3 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Starting to mark all Reading List items as allowed by Web Content Filter", buf, 2u);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET web_filter_status = ? WHERE parent = ? AND deleted = 0 AND web_filter_status != ?");
  sqlite3_bind_int(v10, 1, 1);
  sqlite3_bind_int(v10, 2, -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  sqlite3_bind_int(v10, 3, 1);
  v4 = sqlite3_step(v10);
  if (v4 == 101)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXDataMigration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Finished marking all Reading List items as allowed by Web Content Filter", v8, 2u);
    }
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDataMigration();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection markWebContentFilterAllowsAllReadingListItems].cold.1();
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  return v4 == 101;
}

- (BOOL)incrementalVacuumIfNeeded
{
  return fmax((double)-[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", CFSTR("PRAGMA page_count"))* 0.05, 256.0) >= (double)-[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", CFSTR("PRAGMA freelist_count"))|| -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA incremental_vacuum(256)") == 0;
}

- (BOOL)vacuum
{
  int v2;
  void *v3;

  v2 = -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "VACUUM");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.WebBookmarks.DidVacuumDatabaseNotification"), 0);

  return v2 == 0;
}

- (void)localeSettingsChanged
{
  CFRelease(self->_locale);
  self->_locale = CFLocaleCopyCurrent();
}

- (unint64_t)purge:(unint64_t)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection purgeableReadingListItems](self, "purgeableReadingListItems");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      objc_msgSend(v11, "setArchiveStatus:", 4, (_QWORD)v14);
      objc_msgSend(v11, "setDateLastArchived:", v5);
      -[WebBookmarkCollection saveBookmark:](self, "saveBookmark:", v11);
      v12 = objc_msgSend(v11, "archiveSize");
      objc_msgSend(v11, "clearArchiveSynchronously");
      v7 += v12;
      if (v7 >= a3)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_4;
        break;
      }
    }
  }

  -[WebBookmarkCollection vacuum](self, "vacuum");
  return v7;
}

- (id)bookmarkWithID:(int)a3 includingInMemoryChanges:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = -[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed");
    if (v6)
      v8 = v7;
    else
      v8 = 0;
    if (v8)
    {
      -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applyModificationsToBookmarks:", v10);

    }
  }
  return v6;
}

- (id)validBookmarkUUIDsFromUUIDs:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  sqlite3 *db;
  id v8;
  void *v9;
  const unsigned __int8 *v11;
  void *v12;
  _QWORD v13[5];
  sqlite3_stmt *ppStmt;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("SELECT external_uuid FROM bookmarks WHERE deleted = 0 AND external_uuid IN ("));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v4, "count"); ++i)
    {
      if (i)
        objc_msgSend(v5, "appendString:", CFSTR(","));
      objc_msgSend(v5, "appendString:", CFSTR("?"));
    }
    objc_msgSend(v5, "appendString:", CFSTR(")"));
    ppStmt = 0;
    db = self->_db;
    v8 = objc_retainAutorelease(v5);
    if (sqlite3_prepare_v2(db, (const char *)objc_msgSend(v8, "UTF8String"), -1, &ppStmt, 0))
    {
      -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", ppStmt);
      v9 = 0;
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __53__WebBookmarkCollection_validBookmarkUUIDsFromUUIDs___block_invoke;
      v13[3] = &__block_descriptor_40_e25_v32__0__NSString_8Q16_B24l;
      v13[4] = ppStmt;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      while (sqlite3_step(ppStmt) == 100)
      {
        v11 = sqlite3_column_text(ppStmt, 0);
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v11);
          if (v12)
            objc_msgSend(v9, "addObject:", v12);

        }
      }
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

void __53__WebBookmarkCollection_validBookmarkUUIDsFromUUIDs___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  sqlite3_stmt *v6;
  id v7;

  v5 = a2;
  v6 = *(sqlite3_stmt **)(a1 + 32);
  v7 = objc_retainAutorelease(v5);
  sqlite3_bind_text(v6, a3 + 1, (const char *)objc_msgSend(v7, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (WebBookmark)readingListFolder
{
  return (WebBookmark *)-[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:", 3);
}

- (WebBookmark)webFilterAllowedSitesFolder
{
  return (WebBookmark *)-[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:", 4);
}

- (id)bookmarkAtPath:(id)a3
{
  id v4;
  void *v5;
  WebBookmark *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  WebBookmark *v17;
  sqlite3_stmt *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  sqlite3_stmt *ppStmt;
  _BYTE v28[24];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v28, self->_db);
    if (v28[17])
    {
      ppStmt = 0;
      if (!sqlite3_prepare_v2(self->_db, "SELECT id FROM bookmarks WHERE parent = ? AND type = 1 AND title = ? AND deleted = 0", -1, &ppStmt, 0))
      {
        objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - 1);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              sqlite3_reset(ppStmt);
              sqlite3_bind_int(ppStmt, 1, v8);
              v13 = ppStmt;
              v14 = objc_retainAutorelease(v12);
              sqlite3_bind_text(v13, 2, (const char *)objc_msgSend(v14, "UTF8String", (_QWORD)v23), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              if (sqlite3_step(ppStmt) != 100)
              {
                -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", ppStmt);

                goto LABEL_20;
              }
              v8 = sqlite3_column_int(ppStmt, 0);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
            if (v9)
              continue;
            break;
          }
        }

        sqlite3_finalize(ppStmt);
        ppStmt = -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("parent = ? AND title = ? AND deleted = 0 ORDER BY order_index"));
        sqlite3_bind_int(ppStmt, 1, v8);
        v15 = ppStmt;
        objc_msgSend(v5, "lastObject");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

        if (sqlite3_step(ppStmt) == 100)
        {
          v17 = [WebBookmark alloc];
          v18 = ppStmt;
          -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v17, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v18, v19, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

          sqlite3_finalize(ppStmt);
          WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v28, v20, v21);
        }
        else
        {
          -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", ppStmt);
LABEL_20:
          v6 = 0;
        }

        goto LABEL_22;
      }
      -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", ppStmt);
    }
    v6 = 0;
LABEL_22:
    WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v28);
    goto LABEL_23;
  }
  -[WebBookmarkCollection rootBookmark](self, "rootBookmark");
  v6 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v6;
}

- (WebBookmark)rootBookmark
{
  WebBookmark *rootBookmark;
  WebBookmark *v4;
  WebBookmark *v5;

  rootBookmark = self->_rootBookmark;
  if (!rootBookmark)
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", 0);
    v4 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rootBookmark;
    self->_rootBookmark = v4;

    rootBookmark = self->_rootBookmark;
  }
  return rootBookmark;
}

- (id)subfoldersOfID:(int)a3
{
  void *v4;
  sqlite3_stmt *v5;
  void *v6;
  WebBookmark *v7;
  void *v8;
  WebBookmark *v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("parent = %d AND type = 1 AND deleted = 0 AND hidden = 0 AND hidden_ancestor_count = 0 ORDER BY order_index"), *(_QWORD *)&a3);
  v5 = -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (sqlite3_step(v5) == 100)
  {
    v7 = [WebBookmark alloc];
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v7, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v5, v8, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    objc_msgSend(v6, "addObject:", v9);
  }
  sqlite3_finalize(v5);

  return v6;
}

- (id)descendantsOfBookmarkFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection listWithID:](self, "listWithID:", objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bookmarkArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isFolder", (_QWORD)v15))
        {
          -[WebBookmarkCollection descendantsOfBookmarkFolder:](self, "descendantsOfBookmarkFolder:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v13);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)_descendantIDsOfBookmarkFolderID:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:](self, "_fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:", v3, 0, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[WebBookmarkCollection _fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:](self, "_fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:", objc_msgSend(v10, "intValue", (_QWORD)v16), 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count") == 0;

        if (v12)
        {
          objc_msgSend(v5, "addObject:", v10);
        }
        else
        {
          -[WebBookmarkCollection _descendantIDsOfBookmarkFolderID:](self, "_descendantIDsOfBookmarkFolderID:", objc_msgSend(v10, "intValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (id)objc_msgSend(v5, "setByAddingObjectsFromSet:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

- (BOOL)bookmarkContainsLeafBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isFolder") & 1) != 0)
  {
    -[WebBookmarkCollection listWithID:](self, "listWithID:", objc_msgSend(v4, "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bookmarkArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          if (-[WebBookmarkCollection bookmarkContainsLeafBookmark:](self, "bookmarkContainsLeafBookmark:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13))
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (unint64_t)leafChildCountForBookmarksInFolderWithID:(int)a3
{
  unint64_t v4;
  _BYTE v6[8];
  sqlite3_stmt *v7;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "SELECT COUNT(*) FROM bookmarks WHERE parent = ? AND type = 0 AND hidden = 0");
  sqlite3_bind_int(v7, 1, a3);
  if (sqlite3_step(v7) == 100)
    v4 = sqlite3_column_int(v7, 0);
  else
    v4 = 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (id)leafChildCountForFoldersInFolderWithID:(int)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT parent, count(*) FROM bookmarks WHERE (parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = ?) AND hidden = 0 AND type = 0) GROUP BY parent");
  sqlite3_bind_int(v11, 1, a3);
  while (sqlite3_step(v11) == 100)
  {
    v6 = sqlite3_column_int(v11, 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", sqlite3_column_int(v11, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v8);

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v5;
}

- (int)parentIdentifierOfBookmarkWithID:(int)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT parent FROM bookmarks WHERE id = %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v4);

  if (v5 == -1)
    return 0;
  else
    return v5;
}

- (BOOL)getBookmarkType:(BOOL *)a3 andSubtype:(int64_t *)a4 forBookmarkWithID:(int)a5
{
  int v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, (const char *)objc_msgSend(CFSTR("SELECT type, subtype FROM bookmarks WHERE id = ?"), "UTF8String"));
  sqlite3_bind_int(v11, 1, a5);
  v8 = sqlite3_step(v11);
  if (v8 == 100)
  {
    if (a3)
      *a3 = sqlite3_column_int(v11, 0) != 0;
    if (a4)
      *a4 = sqlite3_column_int(v11, 1);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8 == 100;
}

- (int64_t)subtypeOfBookmarkWithID:(int)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT subtype FROM bookmarks WHERE id = %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v4);

  if (v5 == -1)
    return 0;
  else
    return v5;
}

- (id)bookmarksWithSubtype:(int64_t)a3
{
  void *v4;
  void *v5;
  WebBookmark *v6;
  sqlite3_stmt *v7;
  void *v8;
  WebBookmark *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("subtype = %ld"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v4));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (sqlite3_step(v12) == 100)
  {
    v6 = [WebBookmark alloc];
    v7 = v12;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v6, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v7, v8, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    objc_msgSend(v5, "addObject:", v9);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v5;
}

- (unint64_t)modifiedAttributesOfBookmark:(id)a3
{
  id v4;
  sqlite3 *db;
  id v6;
  sqlite3_int64 v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  v4 = a3;
  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT modified_attributes FROM bookmarks WHERE id = %d"), objc_msgSend(v4, "identifier"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, db, (const char *)objc_msgSend(v6, "UTF8String"));

  if (sqlite3_step(v10) == 100)
    v7 = sqlite3_column_int64(v10, 0);
  else
    v7 = 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);

  return v7;
}

- (int)identifierOfBookmarkWithUUID:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE external_uuid = '%@'"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v4);

  if (v5 == -1)
    return 0x7FFFFFFF;
  else
    return v5;
}

- (id)_bookmarkUUIDsInFolderWithID:(int)a3
{
  uint64_t v3;
  id v5;
  sqlite3 *db;
  id v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  v3 = *(_QWORD *)&a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT external_uuid FROM bookmarks WHERE parent = %d ORDER BY order_index ASC"), v3);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, db, (const char *)objc_msgSend(v7, "UTF8String"));
  while (1)
  {

    if (sqlite3_step(v10) != 100)
      break;
    WBUTF8StringFromSQLStatement(v10, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v5;
}

- (int)bookmarkIdentifierOfAncestorWithSubtype:(int64_t)a3 forBookmark:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[WebBookmarkCollection bookmarkIdentifierOfAncestorWithAnySubtypeInSubtypes:forBookmark:](self, "bookmarkIdentifierOfAncestorWithAnySubtypeInSubtypes:forBookmark:", v9, v6);

  return (int)self;
}

- (int)bookmarkIdentifierOfAncestorWithAnySubtypeInSubtypes:(id)a3 forBookmark:(id)a4
{
  int v4;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "identifier");
  while ((_DWORD)v9 && (_DWORD)v9 != 0x7FFFFFFF)
  {
    v10 = (void *)MEMORY[0x212BD4AC8]();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WebBookmarkCollection subtypeOfBookmarkWithID:](self, "subtypeOfBookmarkWithID:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "containsObject:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = 1;
      v4 = v9;
    }
    else if (objc_msgSend(v8, "isDeleted"))
    {
      -[WebBookmarkCollection syncDataForBookmark:](self, "syncDataForBookmark:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parentRecordID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recordName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](self, "bookmarkWithServerID:excludeDeletedBookmarks:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v17, "identifier");
      v13 = 2;
      v8 = v17;
    }
    else
    {
      v9 = -[WebBookmarkCollection parentIdentifierOfBookmarkWithID:](self, "parentIdentifierOfBookmarkWithID:", v9);
      v13 = 0;
    }
    objc_autoreleasePoolPop(v10);
    if ((v13 | 2) != 2)
      goto LABEL_12;
  }
  v4 = 0x7FFFFFFF;
LABEL_12:

  return v4;
}

- (int)bookmarkIdentifierOfFolderAncestorWithSubtype:(int64_t)a3 forBookmark:(id)a4
{
  int v4;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  char v17;

  v7 = a4;
  v8 = objc_msgSend(v7, "identifier");
  while ((_DWORD)v8 && (_DWORD)v8 != 0x7FFFFFFF)
  {
    v9 = (void *)MEMORY[0x212BD4AC8]();
    v17 = 0;
    v16 = 0;
    if (-[WebBookmarkCollection getBookmarkType:andSubtype:forBookmarkWithID:](self, "getBookmarkType:andSubtype:forBookmarkWithID:", &v17, &v16, v8))
    {
      if (v17 && v16 == a3)
      {
        v10 = 1;
        v4 = v8;
      }
      else if (objc_msgSend(v7, "isDeleted"))
      {
        -[WebBookmarkCollection syncDataForBookmark:](self, "syncDataForBookmark:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "parentRecordID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](self, "bookmarkWithServerID:excludeDeletedBookmarks:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v14, "identifier");
        v10 = 2;
        v7 = v14;
      }
      else
      {
        v8 = -[WebBookmarkCollection parentIdentifierOfBookmarkWithID:](self, "parentIdentifierOfBookmarkWithID:", v8);
        v10 = 0;
      }
    }
    else
    {
      v4 = 0x7FFFFFFF;
      v10 = 1;
    }
    objc_autoreleasePoolPop(v9);
    if ((v10 | 2) != 2)
      goto LABEL_15;
  }
  v4 = 0x7FFFFFFF;
LABEL_15:

  return v4;
}

- (WebBookmarkList)rootList
{
  return (WebBookmarkList *)-[WebBookmarkCollection listWithID:](self, "listWithID:", 0);
}

- (WebBookmarkList)bookmarksBarList
{
  void *v3;
  int v4;
  uint64_t v5;

  +[WBWebFilterSettings sharedWebFilterSettings](WBWebFilterSettings, "sharedWebFilterSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesAllowedSitesOnly");

  if (v4)
    v5 = 4;
  else
    v5 = 1;
  -[WebBookmarkCollection listWithSpecialID:](self, "listWithSpecialID:", v5);
  return (WebBookmarkList *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)readingListWithUnreadOnly:(BOOL)a3
{
  return -[WebBookmarkCollection readingListWithUnreadOnly:filteredUsingString:](self, "readingListWithUnreadOnly:filteredUsingString:", a3, 0);
}

- (BOOL)isEmpty
{
  const char *v3;

  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  return WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT COUNT(*) FROM bookmarks WHERE special_id == 0 AND id != 0 AND deleted = 0;",
                         v3) == 0;
}

- (id)_parentIdentifiersOfBookmarksNeedingIcons
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WebBookmarkCollection favoritesFolder](self, "favoritesFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");

  +[WBWebFilterSettings sharedWebFilterSettings](WBWebFilterSettings, "sharedWebFilterSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesAllowedSitesOnly");

  if (v6)
    v4 = -[WebBookmarkCollection webFilterAllowedSitesFolderBookmarkID](self, "webFilterAllowedSitesFolderBookmarkID");
  v7 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmarkCollection frequentlyVisitedSitesFolderBookmarkID](self, "frequentlyVisitedSitesFolderBookmarkID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "addObject:", v10);

  return v9;
}

- (BOOL)shouldFetchIconForBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_webBookmarks_hasCaseInsensitivePrefix:", CFSTR("http")) & 1) != 0
    || (objc_msgSend(v5, "_webBookmarks_hasCaseInsensitivePrefix:", CFSTR("https")) & 1) != 0)
  {
    -[WebBookmarkCollection _parentIdentifiersOfBookmarksNeedingIcons](self, "_parentIdentifiersOfBookmarksNeedingIcons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "parentID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WebBookmarkList)bookmarksNeedingIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WebBookmarkListQuery *v7;
  WebBookmarkList *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WebBookmarkCollection _parentIdentifiersOfBookmarksNeedingIcons](self, "_parentIdentifiersOfBookmarksNeedingIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("fetched_icon = 0 AND (url LIKE 'http:%%' OR url LIKE 'https:%%') AND parent IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WebBookmarkListQuery initWithBookmarksWhere:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:orderBy:usingFilter:", v6, 0, 0);
  v8 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v7, 0, self);

  return v8;
}

- (BOOL)markAllFavoritesAsNeedingIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  sqlite3 *db;
  id v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WebBookmarkCollection _parentIdentifiersOfBookmarksNeedingIcons](self, "_parentIdentifiersOfBookmarksNeedingIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UPDATE bookmarks SET fetched_icon = 0 WHERE parent IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v8 = objc_retainAutorelease(v6);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)objc_msgSend(v8, "UTF8String"));
  LOBYTE(db) = sqlite3_step(v11) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return (char)db;
}

- (BOOL)deleteAllFavoriteIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  sqlite3 *db;
  id v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WebBookmarkCollection _parentIdentifiersOfBookmarksNeedingIcons](self, "_parentIdentifiersOfBookmarksNeedingIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UPDATE bookmarks SET icon = NULL, fetched_icon = 0 WHERE parent IN (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v8 = objc_retainAutorelease(v6);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)objc_msgSend(v8, "UTF8String"));
  LOBYTE(db) = sqlite3_step(v11) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return (char)db;
}

- (int)webFilterAllowedSitesFolderBookmarkID
{
  sqlite3 *v3;
  NSString *v4;

  v3 = (sqlite3 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE special_id = %d"), 4);
  LODWORD(self) = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, v3, v4);

  return (int)self;
}

- (WebBookmarkList)webFilterAllowedSites
{
  return (WebBookmarkList *)-[WebBookmarkCollection listWithSpecialID:](self, "listWithSpecialID:", 4);
}

- (BOOL)saveBookmark:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[WebBookmarkCollection saveBookmark:startReadingListFetcher:](self, "saveBookmark:startReadingListFetcher:", v4, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType") == 0);

  return (char)self;
}

- (BOOL)saveBookmarks:(id)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  const char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  NSObject *v23;
  id v25;
  BOOL v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[17];
  char v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isLockedSync") & 1) == 0)
    -[WebBookmarkCollection _simulateCrashWithDescription:](self, "_simulateCrashWithDescription:", CFSTR("Trying to save bookmarks without first obtaining the bookmarks database file lock."));
  if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v36, self->_db);
    v26 = v37 != 0;
    if (v37)
    {
      v25 = v6;
      v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      v9 = 0;
      v10 = 0;
      if (v8)
      {
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if (-[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v13, -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v13), 1))
            {
              if (objc_msgSend(v13, "needsSyncUpdate"))
              {
                objc_msgSend(v13, "setNeedsSyncUpdate:", 0);
                v9 = 1;
              }
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v13, "parentID"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v14);
              v15 = objc_msgSend(v13, "specialID") != 0;

              v10 |= v15;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v8);
      }

      WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v36, v16, v17);
      if ((v9 & 1) != 0)
        -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
      if (v4)
      {
        if ((v10 & 1) != 0)
          -[WebBookmarkCollection _postBookmarksSpecialFoldersDidChangeNotification](self, "_postBookmarksSpecialFoldersDidChangeNotification");
        if (objc_msgSend(v27, "count"))
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v18 = v27;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v29 != v20)
                  objc_enumerationMutation(v18);
                -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "unsignedIntValue"));
              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
            }
            while (v19);
          }

        }
      }

      v6 = v25;
    }
    else
    {
      v23 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection saveBookmarks:postNotification:].cold.1();
    }
    WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v36);
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection saveBookmarks:postNotification:].cold.2();
    v26 = 0;
  }

  return v26;
}

- (BOOL)saveBookmark:(id)a3 startReadingListFetcher:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isLockedSync") & 1) == 0)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "UUID");
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection saveBookmark:startReadingListFetcher:].cold.2();
    }

    -[WebBookmarkCollection _simulateCrashWithDescription:](self, "_simulateCrashWithDescription:", CFSTR("Trying to save a bookmark without first obtaining the bookmarks database file lock."));
  }
  if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    v8 = -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:](self, "_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:", v6, v4, 0);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection saveBookmarks:postNotification:].cold.2();
    v8 = 0;
  }

  return v8;
}

- (BOOL)_saveBookmark:(id)a3 startReadingListFetcher:(BOOL)a4 forApplyingInMemoryChanges:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  WebBookmarkCollection *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke;
  v18 = &unk_24CB32008;
  v19 = self;
  v9 = v8;
  v20 = v9;
  v10 = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:](self, "performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:", &v15, 0, 0);
  if (v10)
  {
    if (objc_msgSend(v9, "needsSyncUpdate", v15, v16, v17, v18, v19))
    {
      -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
      objc_msgSend(v9, "setNeedsSyncUpdate:", 0);
    }
    if (!a5)
    {
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v9, "parentID"));
      if (objc_msgSend(v9, "specialID"))
        -[WebBookmarkCollection _postBookmarksSpecialFoldersDidChangeNotification](self, "_postBookmarksSpecialFoldersDidChangeNotification");
    }
    if ((objc_msgSend(v9, "isReadingListItem") & v6) == 1)
    {
      v11 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v12;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Starting Reading List fetcher when saving bookmark with UUID %{public}@", buf, 0xCu);

      }
      -[WebBookmarkCollection _startReadingListFetcher](self, "_startReadingListFetcher");
    }
  }
  else
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "UUID", v15, v16, v17, v18, v19);
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:].cold.1();
    }

  }
  return v10;
}

uint64_t __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_specialIDForBookmarkBeingSaved:", *(_QWORD *)(a1 + 40)), 1);
  if ((v1 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke_cold_1();
  }
  return v1;
}

- (BOOL)deleteBookmark:(id)a3 postChangeNotification:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;

  v4 = a4;
  v6 = a3;
  v7 = -[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase")
    && -[WebBookmarkCollection _deleteBookmark:postChangeNotification:forApplyingInMemoryChanges:](self, "_deleteBookmark:postChangeNotification:forApplyingInMemoryChanges:", v6, v4, 0);

  return v7;
}

- (void)_deleteIconForBookmark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "readingListIconUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bookmarkImagesDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, 0) & 1) != 0)
    {
      objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v7 = objc_msgSend(v4, "removeItemAtPath:error:", v6, &v12);
      v8 = v12;
      if ((v7 & 1) != 0)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Deleted bookmark icon successfully", buf, 2u);
        }
      }
      else
      {
        v11 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "wb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _deleteIconForBookmark:].cold.1();
        }

      }
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _deleteIconForBookmark:].cold.2();
    }

  }
}

- (BOOL)deleteBookmarks:(id)a3 postChangeNotification:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v9 &= -[WebBookmarkCollection deleteBookmark:postChangeNotification:](self, "deleteBookmark:postChangeNotification:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), v4, (_QWORD)v12);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_deleteBookmark:(id)a3 postChangeNotification:(BOOL)a4 forApplyingInMemoryChanges:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  const char *v10;
  BOOL v11;
  _BYTE v13[24];

  v6 = a4;
  v8 = a3;
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13, self->_db);
  if (v13[17]
    && -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v8, objc_msgSend(v8, "specialID") != 5))
  {
    WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v13, v9, v10);
    if (v6)
      -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
    if (!a5)
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v8, "parentID"));
    if (objc_msgSend(v8, "isReadingListItem"))
    {
      objc_msgSend(v8, "clearArchive");
      -[WebBookmarkCollection _deleteIconForBookmark:](self, "_deleteIconForBookmark:", v8);
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13);

  return v11;
}

- (BOOL)deleteBookmark:(id)a3
{
  return -[WebBookmarkCollection deleteBookmark:postChangeNotification:](self, "deleteBookmark:postChangeNotification:", a3, 1);
}

- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[WebBookmarkCollection _moveBookmark:toFolderWithID:detectCycles:](self, "_moveBookmark:toFolderWithID:detectCycles:", v6, v4, 1)&& -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");

  return v7;
}

- (BOOL)moveBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v15 = (int)objc_msgSend(v6, "identifier");
    v16 = 1024;
    v17 = objc_msgSend(v6, "parentID");
    v18 = 2048;
    v19 = (int)v4;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Moving bookmark with identifier %ld and parent ID %d to folder with identifier %ld", buf, 0x1Cu);
  }

  v8 = objc_msgSend(v6, "parentID");
  if ((_DWORD)v8 == (_DWORD)v4)
    goto LABEL_9;
  if ((objc_msgSend(v6, "isInserted") & 1) == 0)
  {
    objc_msgSend(v6, "_setParentID:", v4);
LABEL_9:
    v9 = 1;
    goto LABEL_10;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__WebBookmarkCollection_moveBookmark_toFolderWithID___block_invoke;
  v11[3] = &unk_24CB32770;
  v11[4] = self;
  v12 = v6;
  v13 = v4;
  v9 = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v11, 0);
  if (v9)
  {
    -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v8);
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v4);
  }

LABEL_10:
  return v9;
}

uint64_t __53__WebBookmarkCollection_moveBookmark_toFolderWithID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveBookmark:toFolderWithID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (BOOL)moveBookmark:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  const char *v10;
  BOOL v11;
  _BYTE v13[24];

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13, self->_db);
  if (v13[17]
    && -[WebBookmarkCollection _moveBookmark:fromIndex:toIndex:](self, "_moveBookmark:fromIndex:toIndex:", v8, v6, v5))
  {
    WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v13, v9, v10);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13);

  return v11;
}

- (BOOL)_moveBookmark:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  sqlite3 *db;
  id v13;
  int v14;
  BOOL v15;
  _BYTE v17[8];
  sqlite3_stmt *v18;
  uint8_t buf[4];
  int v20;
  sqlite3_stmt *v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    v20 = objc_msgSend(v8, "identifier");
    LOWORD(v21) = 1024;
    *(_DWORD *)((char *)&v21 + 2) = objc_msgSend(v8, "parentID");
    HIWORD(v21) = 1024;
    v22 = a5;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Moving bookmark with ID %d and parent ID %d to index %d", buf, 0x14u);
  }

  if (a5 >= a4)
    v10 = "UPDATE bookmarks SET order_index = order_index - 1 WHERE order_index > ? AND order_index <= ? AND parent = ?";
  else
    v10 = "UPDATE bookmarks SET order_index = order_index + 1 WHERE order_index < ? AND order_index >= ? AND parent = ?";
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, v10);
  sqlite3_bind_int(v21, 1, a4);
  sqlite3_bind_int(v21, 2, a5);
  sqlite3_bind_int(v21, 3, objc_msgSend(v8, "parentID"));
  if (sqlite3_step(v21) == 101)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET order_index = ?1, dav_generation = ?2%@ WHERE id = ?3"), CFSTR(", modified_attributes = modified_attributes | ?4"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    db = self->_db;
    v13 = objc_retainAutorelease(v11);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, db, (const char *)objc_msgSend(v13, "UTF8String"));
    sqlite3_bind_int(v18, 1, a5);
    sqlite3_bind_int(v18, 2, -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration"));
    sqlite3_bind_int(v18, 3, objc_msgSend(v8, "identifier"));
    sqlite3_bind_int64(v18, 4, 4);
    v14 = sqlite3_step(v18);
    v15 = v14 == 101;
    if (v14 == 101)
      -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);

  }
  else
  {
    v15 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);

  return v15;
}

- (BOOL)reorderBookmark:(id)a3 toIndex:(unsigned int)a4
{
  unint64_t v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "orderIndex");
  if ((_DWORD)v7 != (_DWORD)v4)
  {
    if (!-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
      goto LABEL_15;
    if (objc_msgSend(v6, "isSyncable")
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      v9 = objc_msgSend(v6, "parentID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _generateSyncPositionForOrderIndex:inFolderWithID:direction:](self, "_generateSyncPositionForOrderIndex:inFolderWithID:direction:", v4, v9, objc_msgSend(v10, "compare:", v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSyncPosition:", v12);

    }
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
      -[WebBookmarkCollection _mergeBookmarkIntoPersistedBookmark:forAttributes:](self, "_mergeBookmarkIntoPersistedBookmark:forAttributes:", v6, 4);
    if (objc_msgSend(v6, "isSyncable")
      && -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      objc_msgSend(v6, "syncPosition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[WebBookmarkCollection orderIndexOfBookmark:withSyncPosition:inFolderWithID:](self, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v6, v13, objc_msgSend(v6, "parentID"));

      v4 = (__PAIR64__(v14, v7) - v14) >> 32;
    }
    objc_msgSend(v6, "_setOrderIndex:", v4);
    if (!-[WebBookmarkCollection moveBookmark:fromIndex:toIndex:](self, "moveBookmark:fromIndex:toIndex:", v6, v7, objc_msgSend(v6, "orderIndex"))|| !-[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v6))
    {
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v6, "parentID"));
  }
  v8 = 1;
LABEL_16:

  return v8;
}

- (BOOL)reorderList:(id)a3 moveBookmarkAtIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if ((_DWORD)v6 == (_DWORD)v5)
  {
    v9 = 1;
  }
  else if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    objc_msgSend(v8, "bookmarkAtIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_10;
    objc_msgSend(v8, "_moveBookmarkAtIndex:toIndex:", v6, v5);
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
      -[WebBookmarkCollection _mergeBookmarkIntoPersistedBookmark:forAttributes:](self, "_mergeBookmarkIntoPersistedBookmark:forAttributes:", v10, 4);
    objc_msgSend(v8, "bookmarkAtIndex:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WebBookmarkCollection moveBookmark:fromIndex:toIndex:](self, "moveBookmark:fromIndex:toIndex:", v10, v6, objc_msgSend(v11, "orderIndex"));

    if (v12)
    {
      -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self, "_postBookmarksChangedSyncNotification");
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v10, "parentID"));
      v9 = 1;
    }
    else
    {
LABEL_10:
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)saveArchiveForReadingListBookmarkWithID:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)objc_opt_class(), "isLockedSync") & 1) != 0)
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "Saving offline Reading List archive for bookmark with UUID %{public}@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v5, "setShouldArchive:", 1);
    -[WebBookmarkCollection saveBookmark:startReadingListFetcher:](self, "saveBookmark:startReadingListFetcher:", v5, 1);

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection saveArchiveForReadingListBookmarkWithID:].cold.1();
  }
}

- (void)saveArchivesForReadingListBookmarks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setShouldArchive:", 1, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[WebBookmarkCollection saveBookmarks:postNotification:](self, "saveBookmarks:postNotification:", v4, 1);
}

- (void)deleteArchiveForReadingListBookmarkWithID:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  if (objc_msgSend((id)objc_opt_class(), "isLockedSync"))
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldArchive:", 0);
    objc_msgSend(v6, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection clearReadingListArchiveWithUUID:](self, "clearReadingListArchiveWithUUID:", v5);

    -[WebBookmarkCollection saveBookmark:startReadingListFetcher:](self, "saveBookmark:startReadingListFetcher:", v6, 0);
  }
}

- (void)saveIconWithData:(id)a3 urlString:(id)a4 forBookmark:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25[7];

  v25[6] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "readingListIconUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[WebBookmarkCollection _deleteIconForBookmark:](self, "_deleteIconForBookmark:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setReadingListIconUUID:", v14);
      v12 = (void *)v14;
    }
    objc_msgSend((id)objc_opt_class(), "bookmarkImagesDirectoryPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v15, 0) & 1) == 0)
    {
      v25[0] = 0;
      v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, v25);
      v19 = v25[0];
      if ((v18 & 1) == 0)
      {
        v20 = (id)WBS_LOG_CHANNEL_PREFIXReadingListIcons();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "wb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection saveIconWithData:urlString:forBookmark:].cold.2();
        }

      }
    }
    objc_msgSend(v11, "setReadingListIconURL:", v9);
    objc_msgSend(v11, "setFetchedIconData:", 1);
    v24 = 0;
    v21 = objc_msgSend(v8, "writeToFile:options:error:", v16, 1, &v24);
    v22 = v24;
    if ((v21 & 1) == 0)
    {
      v23 = (id)WBS_LOG_CHANNEL_PREFIXReadingListIcons();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "wb_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection saveIconWithData:urlString:forBookmark:].cold.1();
      }

    }
  }

}

- (void)saveAndMoveBookmark:(id)a3 toFolderID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v4 = *(_QWORD *)&a4;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "isInserted") & 1) != 0)
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v6, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
    v8 = [WebBookmark alloc];
    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WebBookmark initWithTitle:address:collectionType:](v8, "initWithTitle:address:collectionType:", v9, v10, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    v20 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WebBookmarkCollection saveBookmarks:postNotification:](self, "saveBookmarks:postNotification:", v12, 0);

    if (v13)
    {
      v6 = (id)v11;
      goto LABEL_6;
    }
    v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:].cold.2();
    v6 = (id)v11;
  }
  else
  {
    v21[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WebBookmarkCollection saveBookmarks:postNotification:](self, "saveBookmarks:postNotification:", v14, 0);

    if (v15)
    {
LABEL_6:
      if (!-[WebBookmarkCollection moveBookmark:toFolderWithID:](self, "moveBookmark:toFolderWithID:", v6, v4))
      {
        v16 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:].cold.1((uint64_t)&v19, objc_msgSend(v6, "identifier"), v4, v16);

      }
      goto LABEL_15;
    }
    v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:].cold.3();
  }
LABEL_15:

}

- (BOOL)_saveAndMoveBookmark:(id)a3 toFolderID:(int)a4 orderIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  BOOL v9;
  uint64_t v11;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v8), 1)&& (LOBYTE(v11) = 0, -[WebBookmarkCollection _moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:](self, "_moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:", v8, v6, v5, 1, 1, 1, v11))&& -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");

  return v9;
}

- (BOOL)_saveAndMoveBookmarks:(id)a3 toFolderID:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if (!-[WebBookmarkCollection _saveAndMoveBookmark:toFolderID:](self, "_saveAndMoveBookmark:toFolderID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), v4, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)updateBookmarks:(id)a3 inFolderWithID:(int)a4 secureDelete:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  int v13;

  v5 = a5;
  v8 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__WebBookmarkCollection_updateBookmarks_inFolderWithID_secureDelete___block_invoke;
  v11[3] = &unk_24CB32770;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v9 = v8;
  LOBYTE(v5) = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v11, v5);

  return v5;
}

uint64_t __69__WebBookmarkCollection_updateBookmarks_inFolderWithID_secureDelete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBookmarks:inFolderWithID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (BOOL)_updateBookmarks:(id)a3 inFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  WebBookmarkCollection *v33;
  id v34;
  _BYTE *v35;
  uint64_t *v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _BYTE buf[40];
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v4 = *(_QWORD *)&a4;
  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WebBookmarkCollection _bookmarkUUIDsInFolderWithID:](self, "_bookmarkUUIDsInFolderWithID:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke;
  v48[3] = &unk_24CB327C0;
  v28 = v7;
  v49 = v28;
  objc_msgSend(v27, "safari_splitArrayUsingCondition:", v48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "second");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v6, "count");
    v11 = objc_msgSend(v30, "count");
    v12 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v11;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v12;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Update %zu bookmarks with folder ID %d. There are %zu current bookmarks, and %zu will be deleted", buf, 0x26u);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = v29;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x212BD4AC8]();
        -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v19, 1);

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_284;
  v42[3] = &unk_24CB327E8;
  v21 = v20;
  v43 = v21;
  objc_msgSend(v6, "safari_longestIncreasingSubsequenceUsingValues:", v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__2;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__2;
  v51 = 0;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286;
  v31[3] = &unk_24CB32838;
  v32 = v23;
  v33 = self;
  v35 = buf;
  v36 = &v38;
  v24 = v21;
  v34 = v24;
  v37 = v4;
  v25 = v23;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  LOBYTE(v21) = *((_BYTE *)v39 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v38, 8);

  return (char)v21;
}

uint64_t __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2;
  v8[3] = &unk_24CB32798;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "safari_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_284(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = (void *)MEMORY[0x212BD4AC8]();
  v8 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2_287;
  v18 = &unk_24CB32810;
  v20 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v19 = v9;
  objc_msgSend(v8, "setHandler:", &v15);
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9, v15, v16, v17, v18))
  {
    if (objc_msgSend(v9, "modifiedAttributes")
      && (objc_msgSend(*(id *)(a1 + 40), "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v9, 0, 1) & 1) == 0)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      goto LABEL_19;
    }
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v9, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v11, "containsObject:", v12);

    if ((v11 & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 40), "_saveAndMoveBookmark:toFolderID:", v9, *(unsigned int *)(a1 + 72)) & 1) == 0)
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "_errorForMostRecentSQLiteError");
        objc_claimAutoreleasedReturnValue();
        __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286_cold_4();
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
    objc_msgSend(v9, "_setOrderIndex:", objc_msgSend(*(id *)(a1 + 40), "orderIndexOfBookmark:", v9));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_setOrderIndex:", objc_msgSend(*(id *)(a1 + 40), "orderIndexOfBookmark:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)));
    if ((objc_msgSend(*(id *)(a1 + 40), "_reorderBookmark:afterBookmark:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
    {
      v14 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "_errorForMostRecentSQLiteError");
        objc_claimAutoreleasedReturnValue();
        __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286_cold_3();
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
    if ((objc_msgSend(v9, "modifiedAttributes") & 0xFFFFFFFFFFFFFFFBLL) != 0
      && (objc_msgSend(*(id *)(a1 + 40), "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v9, 0, 1) & 1) == 0)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        objc_msgSend(*(id *)(a1 + 40), "_errorForMostRecentSQLiteError");
        objc_claimAutoreleasedReturnValue();
        __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286_cold_1();
      }
LABEL_19:

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

  objc_autoreleasePoolPop(v7);
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2_287(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
}

- (BOOL)fixCachedNumberOfChildrenIfNeeded
{
  char v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  _BYTE v13[8];
  sqlite3_stmt *v14;
  uint8_t v15[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint8_t buf[4];
  int v22;
  sqlite3_stmt *v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->_db, "SELECT id, parent, num_children, (SELECT COUNT(*) FROM bookmarks AS child_bookmark WHERE child_bookmark.parent = parent_bookmark.id AND hidden = 0) AS real_num_children FROM bookmarks AS parent_bookmark WHERE num_children != real_num_children");
  v3 = 0;
  while (sqlite3_step(v14) == 100)
  {
    v4 = sqlite3_column_int(v14, 0);
    v5 = sqlite3_column_int(v14, 1);
    v6 = sqlite3_column_int(v14, 2);
    v7 = sqlite3_column_int(v14, 3);
    v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v22 = v4;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v5;
      HIWORD(v23) = 1024;
      v24 = v6;
      v25 = 1024;
      v26 = v7;
      _os_log_error_impl(&dword_211022000, v8, OS_LOG_TYPE_ERROR, "Number of children mismatch detected for bookmark with id: %d, parent: %d, expected number of children: %d, actual: %d", buf, 0x1Au);
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET num_children = ? WHERE id = ?");
    sqlite3_bind_int(v23, 1, v7);
    sqlite3_bind_int(v23, 2, v4);
    v9 = sqlite3_step(v23);
    if (v9 != 101)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_errmsg(self->_db);
        *(_DWORD *)v15 = 67109634;
        v16 = v4;
        v17 = 1024;
        v18 = v9;
        v19 = 2082;
        v20 = v11;
        _os_log_error_impl(&dword_211022000, v10, OS_LOG_TYPE_ERROR, "Could not fix number of children of folder with id: %d, error: %d, %{public}s", v15, 0x18u);
      }

    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
    v3 = 1;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);
  return v3 & 1;
}

- (sqlite3_stmt)_prefixSearch:(id)a3 usingColumns:(const char *)a4 maxCount:(unsigned int)a5
{
  id v8;
  void *v9;
  sqlite3 *db;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  sqlite3_stmt *v15;
  id v16;
  void *v17;
  sqlite3 *v18;
  sqlite3_stmt *v19;
  __int16 v21;
  sqlite3_stmt *ppStmt;

  v8 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  if (!a4)
    a4 = "DISTINCT url";
  ppStmt = 0;
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT %s FROM bookmarks WHERE type = 0 AND url >= ? AND url < ? AND deleted = 0 LIMIT ?"), a4);
    db = self->_db;
    v11 = objc_retainAutorelease(v9);
    if (!sqlite3_prepare_v2(db, (const char *)objc_msgSend(v11, "UTF8String"), -1, &ppStmt, 0))
    {
      v21 = objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v8, "length") - 1) + 1;
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v13 - 1, 1, v14);

      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      v15 = ppStmt;
      v16 = objc_retainAutorelease(v12);
      sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(ppStmt, 3, a5);

LABEL_9:
      v19 = ppStmt;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT %s FROM bookmarks WHERE type = 0 AND deleted = 0 LIMIT ?"), a4);
    v18 = self->_db;
    v11 = objc_retainAutorelease(v17);
    if (!sqlite3_prepare_v2(v18, (const char *)objc_msgSend(v11, "UTF8String"), -1, &ppStmt, 0))
    {
      sqlite3_bind_int(ppStmt, 1, a5);
      goto LABEL_9;
    }
  }

  v19 = 0;
LABEL_10:

  return v19;
}

- (id)bookmarksMatchingString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const unsigned __int8 *v7;
  void *v8;
  uint64_t v9;
  const unsigned __int8 *v10;
  uint64_t v11;
  void *v12;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  if (!sqlite3_prepare_v2(self->_db, "SELECT id, title, url FROM bookmarks WHERE type = 0 AND deleted = 0", -1, &ppStmt, 0))
  {
    while (1)
    {
      if (sqlite3_step(ppStmt) != 100)
      {
        sqlite3_finalize(ppStmt);
        v6 = v5;
        goto LABEL_12;
      }
      v7 = sqlite3_column_text(ppStmt, 1);
      if (!v7)
        goto LABEL_7;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
      objc_msgSend(v8, "rangeOfString:options:", v4, 385);
      if (v9)
      {
LABEL_9:
        -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", sqlite3_column_int(ppStmt, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

LABEL_10:
      }
      else
      {

LABEL_7:
        v10 = sqlite3_column_text(ppStmt, 2);
        if (v10)
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v10);
          objc_msgSend(v8, "rangeOfString:options:", v4, 385);
          if (!v11)
            goto LABEL_10;
          goto LABEL_9;
        }
      }
    }
  }
  -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", ppStmt);
  v6 = (id)MEMORY[0x24BDBD1A8];
LABEL_12:

  return v6;
}

- (void)_enumerateBookmarksForMatchStatement:(id)a3 normalizedQuery:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, unsigned __int8 *, uint64_t, _BYTE *);
  sqlite3 *db;
  id v12;
  sqlite3_stmt *v13;
  id v14;
  unsigned __int8 *v15;
  const unsigned __int8 *v16;
  uint64_t v17;
  _BYTE v18[8];
  sqlite3_stmt *v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, unsigned __int8 *, uint64_t, _BYTE *))a5;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  db = self->_db;
  v12 = objc_retainAutorelease(v8);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18, db, (const char *)objc_msgSend(v12, "UTF8String"));
  v13 = v19;
  v14 = objc_retainAutorelease(v9);
  sqlite3_bind_text(v13, 1, (const char *)objc_msgSend(v14, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  while (sqlite3_step(v19) == 100)
  {
    v15 = (unsigned __int8 *)sqlite3_column_text(v19, 2);
    if (v15)
      v15 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v15);
    v16 = sqlite3_column_text(v19, 1);
    if (v16)
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v16);
    else
      v17 = 0;
    if ((unint64_t)v15 | v17)
      v10[2](v10, v15, v17, v18);

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18);

}

- (void)enumerateBookmarks:(BOOL)a3 andReadingListItems:(BOOL)a4 matchingString:(id)a5 usingBlock:(id)a6
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFAllocator *v24;
  uint64_t i;
  __CFString *v26;
  __CFString *MutableCopy;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  id v35;
  id obj;
  void *v37;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  _QWORD block[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  __n128 (*v52)(__n128 *, __n128 *);
  uint64_t (*v53)();
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v7 = a4;
  v56 = *MEMORY[0x24BDAC8D0];
  v35 = a5;
  v34 = a6;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  if (a3 || v7)
  {
    v29 = (void *)objc_msgSend(v35, "mutableCopy");
    -[WebBookmarkCollection _normalizeSearchString:](self, "_normalizeSearchString:", v29);
    v10 = v29;
    if (prefixEndingWithFirstWordOfString(NSString *)::once != -1)
      dispatch_once(&prefixEndingWithFirstWordOfString(NSString *)::once, &__block_literal_global_1538);
    v49 = 0;
    v50 = &v49;
    v51 = 0x4012000000;
    v52 = __Block_byref_object_copy__1540;
    v53 = __Block_byref_object_dispose__1541;
    v54 = &unk_2110DB879;
    v11 = prefixEndingWithFirstWordOfString(NSString *)::tokenizerAccessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL33prefixEndingWithFirstWordOfStringP8NSString_block_invoke_1543;
    block[3] = &unk_24CB32CC8;
    v12 = v10;
    v47 = v12;
    v48 = &v49;
    dispatch_sync(v11, block);
    v13 = v50[6];
    v30 = v12;
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v12, "substringToIndex:", v50[7] + v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    _Block_object_dispose(&v49, 8);
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("%"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v16 = CFSTR("AND hidden = 0 AND hidden_ancestor_count = 0");
      if (v7)
        v16 = &stru_24CB35168;
      v33 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AND parent = %d"), -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)MEMORY[0x24BDD17C8];
    BookmarkSQLiteColumns();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("SELECT %@ FROM bookmarks INNER JOIN bookmark_title_words ON bookmarks.id = bookmark_title_words.bookmark_id WHERE bookmark_title_words.word LIKE ? AND type = 0 AND deleted = 0 AND web_filter_status != %zd AND title IS NOT NULL AND url IS NOT NULL AND url != \"\" %@"), v18, 2, v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA case_sensitive_like = true");
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke;
    v44[3] = &unk_24CB32888;
    v19 = v34;
    v44[4] = self;
    v45 = v19;
    -[WebBookmarkCollection _enumerateBookmarksForMatchStatement:normalizedQuery:usingBlock:](self, "_enumerateBookmarksForMatchStatement:normalizedQuery:usingBlock:", v32, v31, v44);
    v20 = (void *)MEMORY[0x24BDD17C8];
    BookmarkSQLiteColumns();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("SELECT %@ FROM bookmarks WHERE url LIKE ? AND type = 0 AND deleted = 0 AND web_filter_status != %zd AND title IS NOT NULL AND url IS NOT NULL %@"), v21, 2, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA case_sensitive_like = false");
    objc_msgSend(v35, "_web_possibleURLPrefixesForUserTypedString");
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v41;
      v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "absoluteString");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          MutableCopy = CFStringCreateMutableCopy(v24, -[__CFString length](v26, "length"), v26);
          -[WebBookmarkCollection _normalizeSearchString:](self, "_normalizeSearchString:", MutableCopy);
          CFStringAppend(MutableCopy, CFSTR("%"));
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke_3;
          v38[3] = &unk_24CB32888;
          v28 = v19;
          v38[4] = self;
          v39 = v28;
          -[WebBookmarkCollection _enumerateBookmarksForMatchStatement:normalizedQuery:usingBlock:](self, "_enumerateBookmarksForMatchStatement:normalizedQuery:usingBlock:", v37, MutableCopy, v38);
          CFRelease(MutableCopy);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
      }
      while (v22);
    }

  }
}

uint64_t __90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke_2;
  v6[3] = &unk_24CB32860;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = a4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, a2, a3, v6);
}

WebBookmark *__90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke_2(uint64_t a1)
{
  WebBookmark *v2;
  uint64_t v3;
  void *v4;
  WebBookmark *v5;

  v2 = [WebBookmark alloc];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 32), "currentDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v2, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v3, v4, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "collectionType"));

  return v5;
}

uint64_t __90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke_4;
  v6[3] = &unk_24CB32860;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = a4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, a2, a3, v6);
}

WebBookmark *__90__WebBookmarkCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke_4(uint64_t a1)
{
  WebBookmark *v2;
  uint64_t v3;
  void *v4;
  WebBookmark *v5;

  v2 = [WebBookmark alloc];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 32), "currentDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v2, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v3, v4, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "collectionType"));

  return v5;
}

- (id)_bookmarksFromStatementSelectingIDs:(const char *)a3 withQuery:(id)a4
{
  __CFString *v6;
  CFIndex v7;
  __CFString *MutableCopy;
  sqlite3_stmt *v9;
  __CFString *v10;
  void *v11;
  const unsigned __int8 *v12;
  const unsigned __int8 *v13;
  const unsigned __int8 *v14;
  void *v15;
  void *v16;
  WebBookmark *v17;
  _BYTE v19[8];
  sqlite3_stmt *v20;

  v6 = (__CFString *)a4;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  v7 = -[__CFString length](v6, "length");
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, v6);
  -[WebBookmarkCollection _normalizeSearchString:](self, "_normalizeSearchString:", MutableCopy);
  CFStringAppend(MutableCopy, CFSTR("%"));
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, self->_db, a3);
  v9 = v20;
  v10 = objc_retainAutorelease(MutableCopy);
  sqlite3_bind_text(v9, 1, (const char *)-[__CFString UTF8String](v10, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  while (sqlite3_step(v20) == 100)
  {
    v12 = sqlite3_column_text(v20, 0);
    v13 = sqlite3_column_text(v20, 1);
    if (v12)
    {
      v14 = v13;
      if (v13)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v12);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v14);
        v17 = -[WebBookmark initWithTitle:address:collectionType:]([WebBookmark alloc], "initWithTitle:address:collectionType:", v15, v16, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));
        objc_msgSend(v11, "addObject:", v17);

      }
    }
  }
  CFRelease(v10);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);

  return v11;
}

- (void)_addBookmarksForReadingListMatchStatement:(id)a3 normalizedQuery:(id)a4 toArray:(id)a5 maxResults:(int)a6
{
  id v10;
  id v11;
  id v12;
  sqlite3 *db;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  WebBookmark *v17;
  sqlite3_stmt *v18;
  void *v19;
  WebBookmark *v20;
  _BYTE v21[8];
  sqlite3_stmt *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  db = self->_db;
  v14 = objc_retainAutorelease(v10);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)objc_msgSend(v14, "UTF8String"));
  v15 = v22;
  v16 = objc_retainAutorelease(v11);
  sqlite3_bind_text(v15, 1, (const char *)objc_msgSend(v16, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v22, 2, -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  sqlite3_bind_int(v22, 3, 2);
  sqlite3_bind_int(v22, 4, a6);
  while (sqlite3_step(v22) == 100)
  {
    v17 = [WebBookmark alloc];
    v18 = v22;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v17, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v18, v19, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    objc_msgSend(v12, "addObject:", v20);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);

}

- (id)readingListBookmarksMatchingString:(id)a3 maxResults:(unsigned int)a4 onlyArchivedBookmarks:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  CFIndex v8;
  const __CFAllocator *v9;
  __CFString *MutableCopy;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  __CFString *v32;
  void *v33;
  __CFString *cf;
  __CFString *theString;
  void *v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v49 = *MEMORY[0x24BDAC8D0];
  theString = (__CFString *)a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  v8 = -[__CFString length](theString, "length");
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, theString);
  -[WebBookmarkCollection _normalizeSearchString:](self, "_normalizeSearchString:", MutableCopy);
  CFStringAppend(MutableCopy, CFSTR("%"));
  cf = MutableCopy;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" AND (archive_status = %zd OR archive_status = %zd)"), 1, 2);
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24CB35168;
  }
  v32 = (__CFString *)v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deleted = 0 AND parent = ? AND web_filter_status != ? AND title IS NOT NULL AND url IS NOT NULL%@ ORDER BY order_index DESC LIMIT ?"), v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  BookmarkSQLiteColumns();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("SELECT %@ FROM bookmarks INNER JOIN bookmark_title_words ON bookmarks.id = bookmark_title_words.bookmark_id WHERE bookmark_title_words.word LIKE ? AND %@"), v13, v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD17C8];
  BookmarkSQLiteColumns();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("SELECT %@ FROM bookmarks WHERE url LIKE ? AND %@"), v15, v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA case_sensitive_like = true");
  -[WebBookmarkCollection _addBookmarksForReadingListMatchStatement:normalizedQuery:toArray:maxResults:](self, "_addBookmarksForReadingListMatchStatement:normalizedQuery:toArray:maxResults:", v33, MutableCopy, v38, v6);
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA case_sensitive_like = false");
  -[__CFString _web_possibleURLPrefixesForUserTypedString](theString, "_web_possibleURLPrefixesForUserTypedString");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "absoluteString");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v21 = CFStringCreateMutableCopy(v9, -[__CFString length](v20, "length"), v20);
        -[WebBookmarkCollection _normalizeSearchString:](self, "_normalizeSearchString:", v21);
        CFStringAppend(v21, CFSTR("%"));
        -[WebBookmarkCollection _addBookmarksForReadingListMatchStatement:normalizedQuery:toArray:maxResults:](self, "_addBookmarksForReadingListMatchStatement:normalizedQuery:toArray:maxResults:", v16, v21, v38, v6);
        CFRelease(v21);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v17);
  }

  CFRelease(cf);
  objc_msgSend(v38, "sortUsingComparator:", &__block_literal_global_320);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v38, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = v38;
  v24 = 0;
  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      v27 = 0;
      v28 = v24;
      do
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v27);
        if (!v28
          || (v30 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v27), "identifier"),
              v30 != objc_msgSend(v28, "identifier")))
        {
          objc_msgSend(v22, "addObject:", v29);
        }
        v24 = v29;

        ++v27;
        v28 = v24;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v22, "count") > (unint64_t)v6)
    objc_msgSend(v22, "removeObjectsInRange:", v6, objc_msgSend(v22, "count") - v6);

  return v22;
}

uint64_t __93__WebBookmarkCollection_readingListBookmarksMatchingString_maxResults_onlyArchivedBookmarks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "orderIndex");
  v6 = objc_msgSend(v4, "orderIndex");
  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    v8 = 1;
  else
    v8 = v7;

  return v8;
}

- (id)firstReadingListBookmarkWithURLMatchingString:(id)a3 prefixMatch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[WebBookmarkCollection _firstBookmarkWithURLMatchingString:prefixMatch:inParent:](self, "_firstBookmarkWithURLMatchingString:prefixMatch:inParent:", v6, v4, -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)indexOfReadingListBookmark:(id)a3 countingOnlyUnread:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  sqlite3 *db;
  id v21;
  unint64_t v22;
  WebBookmarkInMemoryChangeFilterUnreadOnly *v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[8];
  sqlite3_stmt *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v26 = v6;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  -[WebBookmarkCollection readingListWithUnreadOnly:](self, "readingListWithUnreadOnly:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID");
    v24 = objc_alloc_init(WebBookmarkInMemoryChangeFilterUnreadOnly);
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkInMemoryChangeFilterUnreadOnly bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:inFolder:](v24, "bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:inFolder:", v9, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v25);
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deletedBookmarkIDsInBookmarkFolder:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v13);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v31;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
          if (objc_msgSend(v7, "length"))
          {
            objc_msgSend(v18, "stringValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v19);
          }
          else
          {
            objc_msgSend(v18, "stringValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v19);
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    db = self->_db;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM bookmarks WHERE order_index < ? AND parent = ? AND (read = 0 AND deleted = 0 AND id NOT IN (%@))"), v7);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28, db, (const char *)objc_msgSend(v21, "UTF8String"));

    sqlite3_bind_int(v29, 1, objc_msgSend(v26, "orderIndex"));
    sqlite3_bind_int(v29, 2, v8);
    if (sqlite3_step(v29) == 100)
      v22 = objc_msgSend(v27, "_reverseOrderIndex:", sqlite3_column_int(v29, 0));
    else
      v22 = 0x7FFFFFFFFFFFFFFFLL;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28);

  }
  else
  {
    v22 = objc_msgSend(v27, "_reverseOrderIndex:", objc_msgSend(v6, "orderIndex"));
  }

  return v22;
}

- (id)_tableExpressionForArchiveMode:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)a3 > 2)
    v3 = 0;
  else
    v3 = dword_2110B88C4[a3];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE parent = %d AND deleted = 0 AND web_filter_status = %zd ORDER BY order_index DESC LIMIT %d"), -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"), 1, v3);
}

- (id)_orderedWhereClauseForArchiveMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16A8];
  -[WebBookmarkCollection _tableExpressionForArchiveMode:](self, "_tableExpressionForArchiveMode:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("id IN (%@) AND "), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("archive_status IN (%zd,%zd,%zd)"), 0, 6, 3);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("archive_status IN (%zd,%zd)"), 6, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if ((unint64_t)a3 < 3)
    objc_msgSend(v8, "appendFormat:", off_24CB32D50[a3], v9);
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(" ORDER BY archive_status ASC, read ASC, locally_added DESC, order_index DESC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_orderedWhereClauseForArchiveMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD16A8];
  -[WebBookmarkCollection _tableExpressionForArchiveMode:](self, "_tableExpressionForArchiveMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("id IN (%@) AND "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("archive_status IN (%zd,%zd)"), 0, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((unint64_t)a3 < 3)
    objc_msgSend(v6, "appendFormat:", off_24CB32D50[a3], v7);
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(" ORDER BY archive_status ASC, read ASC, locally_added DESC, order_index DESC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)countReadingListBookmarksNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  void *v5;
  unint64_t v6;
  _BYTE v8[8];
  sqlite3_stmt *v9;

  -[WebBookmarkCollection _orderedWhereClauseForArchiveMode:automaticArchivingEnabled:](self, "_orderedWhereClauseForArchiveMode:automaticArchivingEnabled:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v8, -[WebBookmarkCollection _selectBookmarksWhere:returnType:](self, "_selectBookmarksWhere:returnType:", v5, 2));
  if (sqlite3_step(v9) == 100)
    v6 = sqlite3_column_int(v9, 0);
  else
    v6 = 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return v6;
}

- (unint64_t)countReadingListBookmarksNeedingArchiveInMode:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;

  -[WebBookmarkCollection _orderedWhereClauseForArchiveMode:](self, "_orderedWhereClauseForArchiveMode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v7, -[WebBookmarkCollection _selectBookmarksWhere:returnType:](self, "_selectBookmarksWhere:returnType:", v4, 2));
  if (sqlite3_step(v8) == 100)
    v5 = sqlite3_column_int(v8, 0);
  else
    v5 = 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (id)firstReadingListBookmarkNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  void *v5;
  void *v6;
  WebBookmark *v7;
  sqlite3_stmt *v8;
  void *v9;
  WebBookmark *v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;

  -[WebBookmarkCollection _orderedWhereClauseForArchiveMode:automaticArchivingEnabled:](self, "_orderedWhereClauseForArchiveMode:automaticArchivingEnabled:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(" LIMIT 1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v6));
  if (sqlite3_step(v13) == 100)
  {
    v7 = [WebBookmark alloc];
    v8 = v13;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v7, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v8, v9, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

  }
  else
  {
    v10 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10;
}

- (id)firstReadingListBookmarkNeedingArchiveInMode:(int64_t)a3
{
  void *v4;
  void *v5;
  WebBookmark *v6;
  sqlite3_stmt *v7;
  void *v8;
  WebBookmark *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  -[WebBookmarkCollection _orderedWhereClauseForArchiveMode:](self, "_orderedWhereClauseForArchiveMode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" LIMIT 1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v5));
  if (sqlite3_step(v12) == 100)
  {
    v6 = [WebBookmark alloc];
    v7 = v12;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v6, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v7, v8, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

  }
  else
  {
    v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (id)readingListBookmarksNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  WebBookmarkListQuery *v8;
  WebBookmarkList *v9;

  v4 = a4;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  -[WebBookmarkCollection _orderedWhereClauseForArchiveMode:automaticArchivingEnabled:](self, "_orderedWhereClauseForArchiveMode:automaticArchivingEnabled:", a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WebBookmarkListQuery initWithBookmarksWhere:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:orderBy:usingFilter:", v7, 0, 0);
  v9 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v8, 0, self);

  return v9;
}

- (id)readingListBookmarksNeedingArchiveInMode:(int64_t)a3
{
  void *v5;
  WebBookmarkListQuery *v6;
  WebBookmarkList *v7;

  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  -[WebBookmarkCollection _orderedWhereClauseForArchiveMode:](self, "_orderedWhereClauseForArchiveMode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebBookmarkListQuery initWithBookmarksWhere:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:orderBy:usingFilter:", v5, 0, 0);
  v7 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v6, 0, self);

  return v7;
}

- (void)_cullReadingListBookmarksList:(id)a3 toSize:(unint64_t)a4
{
  char v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "bookmarkCount") > a4)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "isLockedSync");
    if ((v6 & 1) != 0 || objc_msgSend((id)objc_opt_class(), "lockSync"))
    {
      objc_msgSend(v10, "bookmarkArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      if (v8 > a4)
      {
        do
        {
          objc_msgSend(v7, "objectAtIndex:", a4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isFullArchiveAvailable"))
            objc_msgSend(v9, "clearArchive");
          objc_msgSend(v9, "setArchiveStatus:", 5);
          -[WebBookmarkCollection saveBookmark:](self, "saveBookmark:", v9);

          ++a4;
        }
        while (v8 != a4);
      }
      if ((v6 & 1) == 0)
        objc_msgSend((id)objc_opt_class(), "unlockSync");

    }
  }

}

- (BOOL)rollOutLastReadingListItem
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  -[WebBookmarkCollection rollingListOfArchivedReadingListItems](self, "rollingListOfArchivedReadingListItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bookmarkCount");
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)v4 - 1 >= 0xF9)
      v6 = 249;
    else
      v6 = v4 - 1;
    -[WebBookmarkCollection _cullReadingListBookmarksList:toSize:](self, "_cullReadingListBookmarksList:toSize:", v3, v6);
  }

  return v5 != 0;
}

- (void)rollOutReadingListItemIfNeededToMakeRoomForOneNewItem
{
  id v3;

  -[WebBookmarkCollection rollingListOfArchivedReadingListItems](self, "rollingListOfArchivedReadingListItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _cullReadingListBookmarksList:toSize:](self, "_cullReadingListBookmarksList:toSize:");

}

- (WebBookmarkList)rollingListOfArchivedReadingListItems
{
  uint64_t v3;
  void *v4;
  WebBookmarkListQuery *v5;
  WebBookmarkList *v6;
  WebBookmarkList *v7;

  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  v3 = -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("parent = %d AND deleted = 0 AND (archive_status = %zd OR archive_status = %zd)"), v3, 1, 2);
  v5 = -[WebBookmarkListQuery initWithBookmarksWhere:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:orderBy:usingFilter:", v4, CFSTR("read ASC, order_index DESC"), 0);
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v5, 0, self);
  if (-[WebBookmarkList bookmarkCount](v6, "bookmarkCount"))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (unint64_t)rollingReadingListMaximumCount
{
  return 250;
}

- (void)clearCarrierBookmarks
{
  WebBookmark *v3;
  sqlite3_stmt *v4;
  void *v5;
  WebBookmark *v6;
  void *v7;
  void *v8;
  int v9;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("syncable = 0 AND parent = 0")));
    while (sqlite3_step(v11) == 100)
    {
      v3 = [WebBookmark alloc];
      v4 = v11;
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v3, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v4, v5, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

      -[WebBookmark localAttributes](v6, "localAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.bookmarks.IsCarrierBookmark"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
        -[WebBookmarkCollection deleteBookmark:postChangeNotification:](self, "deleteBookmark:postChangeNotification:", v6, 0);

    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  }
}

- (id)_firstBookmarkWithURLMatchingString:(id)a3 prefixMatch:(BOOL)a4 inParent:(int)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  sqlite3_stmt *v10;
  sqlite3_stmt *v11;
  id v12;
  WebBookmark *v13;
  sqlite3_stmt *v14;
  void *v15;
  WebBookmark *v16;
  _BYTE v18[8];
  sqlite3_stmt *v19;

  v6 = a4;
  v8 = a3;
  if (v6)
  {
    -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA case_sensitive_like = false");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%%"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("url LIKE ? AND deleted = 0 AND parent = ? LIMIT 1"));
  }
  else
  {
    v10 = -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("url = ? AND deleted = 0 AND parent = ? ORDER BY last_modified ASC LIMIT 1"));
    v9 = v8;
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v18, v10);
  v11 = v19;
  v12 = objc_retainAutorelease(v9);
  sqlite3_bind_text(v11, 1, (const char *)objc_msgSend(v12, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v19, 2, a5);
  if (sqlite3_step(v19) == 100)
  {
    v13 = [WebBookmark alloc];
    v14 = v19;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v13, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v14, v15, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

  }
  else
  {
    v16 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18);

  return v16;
}

- (id)_mergeCandidateFolderWithTitle:(id)a3 parent:(int)a4 mergeMode:(int64_t)a5
{
  id v8;
  const __CFString *v9;
  void *v10;
  WebBookmark *v11;
  sqlite3_stmt *v12;
  void *v13;
  WebBookmark *v14;
  _BYTE v16[8];
  sqlite3_stmt *v17;
  char v18;

  v8 = a3;
  if (a5)
  {
    v9 = &stru_24CB35168;
    if (a5 == 1)
      v9 = CFSTR("AND server_id IS NULL");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("type = 1 AND title = ? AND parent = ? AND deleted = 0 %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v16, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v10));
    if (v18)
    {
      sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(v17, 2, a4);
      while (sqlite3_step(v17) == 100)
      {
        v11 = [WebBookmark alloc];
        v12 = v17;
        -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v11, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v12, v13, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

        if (a5 == 1 || !-[WebBookmarkCollection _bookmarkHasSyncedToServer:](self, "_bookmarkHasSyncedToServer:", v14))
          goto LABEL_12;

      }
    }
    v14 = 0;
LABEL_12:
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_mergeCandidateBookmarkWithTitle:(id)a3 address:(id)a4 parent:(int)a5 mergeMode:(int64_t)a6
{
  id v10;
  id v11;
  const __CFString *v12;
  WebBookmark *v13;
  WebBookmark *v14;
  sqlite3_stmt *v15;
  void *v16;
  _BYTE v18[8];
  sqlite3_stmt *v19;
  char v20;

  v10 = a3;
  v11 = a4;
  if (a6 == 1)
  {
    v12 = CFSTR("type = 0 AND url = ?1 AND parent = ?2 AND deleted = 0 AND server_id IS NULL");
  }
  else
  {
    if (a6 != 2)
    {
      v13 = 0;
      goto LABEL_17;
    }
    v12 = CFSTR("type = 0 AND title = ?3 AND url = ?1 AND parent = ?2 AND deleted = 0");
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v18, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v12));
  if (v20)
  {
    sqlite3_bind_text(v19, 1, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int(v19, 2, a5);
    if (a6 == 2)
    {
      if (v10)
        sqlite3_bind_text(v19, 3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      else
        sqlite3_bind_null(v19, 3);
    }
    while (sqlite3_step(v19) == 100)
    {
      v14 = [WebBookmark alloc];
      v15 = v19;
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v14, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v15, v16, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

      if (a6 == 1 || !-[WebBookmarkCollection _bookmarkHasSyncedToServer:](self, "_bookmarkHasSyncedToServer:", v13))
        goto LABEL_16;

    }
  }
  v13 = 0;
LABEL_16:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18);
LABEL_17:

  return v13;
}

- (void)_createFreshDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to create a fresh database because we failed to lock sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createSchema
{
  void *v3;
  void *v4;
  void *v5;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TABLE generations (generation INTEGER NOT NULL)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "INSERT INTO generations (generation) VALUES (1)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TABLE sync_properties (key TEXT NOT NULL, value TEXT NOT NULL)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX sync_properties_key_index ON sync_properties (key)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "INSERT INTO sync_properties (key, value) VALUES ('_dav_generation', 1)");
  -[WebBookmarkCollection _clearAndCreateBookmarksTables](self, "_clearAndCreateBookmarksTables");
  if (isIPad(void)::onceToken != -1)
    dispatch_once(&isIPad(void)::onceToken, &__block_literal_global_1544);
  if (isIPad(void)::result && !-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend((id)objc_opt_class(), "_uniqueExternalUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("INSERT INTO bookmarks (id, special_id, parent, type, order_index, num_children, editable, deletable, title, external_uuid) VALUES (1, 1, 0, 1, 0, 0, 0, 0, 'BookmarksBar', '%@')"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v5);

    -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET num_children = 1 WHERE id = 0");
  }
  -[WebBookmarkCollection _clearAndCreateAncestorTable](self, "_clearAndCreateAncestorTable");
}

- (id)currentTabServerIDPresenceForParticipant:(id)a3 getTabGroupServerID:(id *)a4
{
  id v6;
  sqlite3_stmt *v7;
  id v8;
  void *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  v6 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT tab_group_server_id, tab_server_id FROM participant_presence WHERE participant_id = ?");
  v7 = v12;
  v8 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v7, 1, (const char *)objc_msgSend(v8, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v12) == 100)
  {
    WBUTF8StringFromSQLStatement(v12, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    WBUTF8StringFromSQLStatement(v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (id)currentTabServerIDPresenceForParticipant:(id)a3 inTabGroupWithServerID:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  void *v12;
  _BYTE v14[8];
  sqlite3_stmt *v15;

  v6 = a3;
  v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, self->_db, "SELECT tab_server_id FROM participant_presence WHERE participant_id = ? AND tab_group_server_id = ?");
  v8 = v15;
  v9 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v10 = v15;
  v11 = objc_retainAutorelease(v7);
  sqlite3_bind_text(v10, 2, (const char *)objc_msgSend(v11, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v15) == 100)
  {
    WBUTF8StringFromSQLStatement(v15, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);

  return v12;
}

- (BOOL)setPresenceInTabWithServerID:(id)a3 tabGroupWithServerID:(id)a4 forParticipant:(id)a5
{
  id v8;
  id v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  BOOL v13;
  uint64_t v15;
  sqlite3_stmt *v16;
  _BYTE v17[8];
  sqlite3_stmt *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, self->_db, "DELETE FROM participant_presence WHERE participant_id = ?");
  v11 = v18;
  v12 = objc_retainAutorelease(v10);
  sqlite3_bind_text(v11, 1, (const char *)objc_msgSend(v12, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v18) == 101)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v15, self->_db, "INSERT INTO participant_presence (participant_id, tab_group_server_id, tab_server_id) VALUES (?, ?, ?)");
    sqlite3_bind_text(v16, 1, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_text(v16, 2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_text(v16, 3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v13 = sqlite3_step(v16) == 101;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v15);
  }
  else
  {
    v13 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);

  return v13;
}

- (BOOL)removePresenceForParticipant:(id)a3 inTabGroupWithServerID:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  _BYTE v13[8];
  sqlite3_stmt *v14;

  v6 = a3;
  v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->_db, "DELETE FROM participant_presence WHERE participant_id = ? AND tab_group_server_id = ?");
  v8 = v14;
  v9 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v10 = v14;
  v11 = objc_retainAutorelease(v7);
  sqlite3_bind_text(v10, 2, (const char *)objc_msgSend(v11, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v6) = sqlite3_step(v14) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

  return (char)v6;
}

- (BOOL)removeUnusedPresenceRecords
{
  BOOL v2;
  _BYTE v4[8];
  sqlite3_stmt *v5;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4, self->_db, "DELETE FROM participant_presence WHERE tab_group_server_id NOT IN (SELECT server_id FROM bookmarks WHERE type = 1 AND subtype = 0) OR tab_server_id NOT IN (SELECT server_id FROM bookmarks WHERE type = 0 AND subtype = 0)");
  v2 = sqlite3_step(v5) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4);
  return v2;
}

- (id)presenceTabUUIDForParticipant:(id)a3 inTabGroupWithServerID:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  void *v12;
  _BYTE v14[8];
  sqlite3_stmt *v15;

  v6 = a3;
  v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, self->_db, "SELECT bookmarks.external_uuid FROM bookmarks INNER JOIN participant_presence ON bookmarks.server_id = participant_presence.tab_server_id WHERE participant_id = ? AND tab_group_server_id = ?");
  v8 = v15;
  v9 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v10 = v15;
  v11 = objc_retainAutorelease(v7);
  sqlite3_bind_text(v10, 2, (const char *)objc_msgSend(v11, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v15) == 100)
  {
    WBUTF8StringFromSQLStatement(v15, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);

  return v12;
}

- (id)activeParticipantsInTabGroupWithServerID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT participant_id FROM participant_presence WHERE tab_group_server_id = ?");
  v5 = v12;
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (sqlite3_step(v12) == 100)
  {
    WBUTF8StringFromSQLStatement(v12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v7, "copy");

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  return v9;
}

- (id)activeParticipantsInTabWithServerID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT participant_id FROM participant_presence WHERE tab_server_id = ?");
  v5 = v12;
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (sqlite3_step(v12) == 100)
  {
    WBUTF8StringFromSQLStatement(v12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v7, "copy");

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  return v9;
}

- (void)markChildrenInFolderAsRead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WebBookmarkCollection listWithID:](self, "listWithID:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarkArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "markAsRead", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[WebBookmarkCollection saveBookmarks:postNotification:](self, "saveBookmarks:postNotification:", v7, 0);
  }

}

- (int64_t)subtypeOfBookmarkWithServerID:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT subtype FROM bookmarks WHERE server_id = '%@'"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", v4);

  if (v5 == -1)
    return 0;
  else
    return v5;
}

- (void)_clearAndCreateBookmarksTitleWordTable
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS bookmark_title_words");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TABLE bookmark_title_words (id INTEGER PRIMARY KEY AUTOINCREMENT, bookmark_id INTEGER NOT NULL CONSTRAINT fk_bookmark_id REFERENCES bookmarks(id) ON DELETE CASCADE, word TEXT, word_index INTEGER)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TRIGGER fkd_bookmark_title_words_bookmark_id BEFORE DELETE ON bookmarks      FOR EACH ROW BEGIN DELETE FROM bookmark_title_words WHERE bookmark_id = OLD.id;      END;");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX title_word_index ON bookmark_title_words(word)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX title_bookmark_id_index ON bookmark_title_words(bookmark_id)");
}

- (void)_clearAndCreateBookmarksTables
{
  id v3;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS bookmarks");
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE bookmarks (id INTEGER PRIMARY KEY AUTOINCREMENT,special_id INTEGER DEFAULT 0,parent INTEGER, type INTEGER,title TEXT,url TEXT COLLATE NOCASE,num_children INTEGER DEFAULT 0,editable INTEGER DEFAULT 1,deletable INTEGER DEFAULT 1,hidden INTEGER DEFAULT 0,hidden_ancestor_count INTEGER DEFAULT 0,order_index INTEGER NOT NULL,external_uuid TEXT UNIQUE,read INTEGER DEFAULT NULL,last_modified REAL DEFAULT NULL,server_id TEXT, sync_key TEXT,sync_data BLOB,added INTEGER DEFAULT 1,deleted INTEGER DEFAULT 0,extra_attributes BLOB DEFAULT NULL,local_attributes BLOB DEFAULT NULL,fetched_icon BOOL DEFAULT 0, icon BLOB DEFAULT NULL,dav_generation INTEGER DEFAULT 0,locally_added BOOL DEFAULT 0,archive_status INTEGER DEFAULT 0,syncable BOOL DEFAULT 1,web_filter_status INTEGER DEFAULT 0, modified_attributes UNSIGNED BIG INT DEFAULT 0, date_closed REAL DEFAULT NULL, last_selected_child INTEGER DEFAULT NULL, subtype INTEGER DEFAULT 0, FOREIGN KEY (last_selected_child) REFERENCES bookmarks (id) ON DELETE SET NULL)"));
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX special_id_index ON bookmarks (special_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX autocomplete_index ON bookmarks (url)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX folder_list_index ON bookmarks (parent, type, order_index)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX group_index ON bookmarks (parent, order_index)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX sync_index ON bookmarks (external_uuid)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX server_id_index ON bookmarks(server_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX dav_generation_index ON bookmarks(dav_generation)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX reading_list_index ON bookmarks (parent, deleted, web_filter_status, order_index DESC)");
  -[WebBookmarkCollection _clearAndCreateBookmarksTitleWordTable](self, "_clearAndCreateBookmarksTitleWordTable");
  -[WebBookmarkCollection _clearAndCreateAncestorTable](self, "_clearAndCreateAncestorTable");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSERT INTO bookmarks (id, type, order_index, num_children, title, external_uuid) VALUES (0, 1, 0, 0, 'Root', '%@')"), CFSTR("Root"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", objc_msgSend(v3, "UTF8String"));

}

- (void)_migrateSchemaVersion0ToVersion1
{
  id v3;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN special_id INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX special_id_index ON bookmarks (special_id)");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET title = 'Root', external_uuid = '%@' WHERE id = 0"), CFSTR("Root"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", objc_msgSend(v3, "UTF8String"));

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET special_id = 1 WHERE id = 1");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET special_id = 2 WHERE id = 2");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 1");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion1And2ToVersion3
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS bookmark_title_words");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TABLE bookmark_title_words (id INTEGER PRIMARY KEY, bookmark_id INTEGER NOT NULL CONSTRAINT fk_bookmark_id REFERENCES bookmarks(id) ON DELETE CASCADE, word TEXT, word_index INTEGER)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TRIGGER fkd_bookmark_title_words_bookmark_id BEFORE DELETE ON bookmarks         FOR EACH ROW BEGIN DELETE FROM bookmark_title_words WHERE bookmark_id = OLD.id;         END;");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX title_word_index ON bookmark_title_words(word)");
  -[WebBookmarkCollection _indexAllTitleWords](self, "_indexAllTitleWords");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 3");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion3ToVersion4
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN server_id TEXT");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN sync_key TEXT");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN sync_data BLOB");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX server_id_index ON bookmarks(server_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 4");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion4ToVersion5
{
  const char *v3;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  if (!WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT count(*) FROM sync_properties WHERE key = '_dav_generation'", v3))-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "INSERT INTO sync_properties (key, value) VALUES ('_dav_generation', 1)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN deleted INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN dav_generation INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX dav_generation_index ON bookmarks(dav_generation)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 5");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion5ToVersion6
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _normalizeDatabaseURLs](self, "_normalizeDatabaseURLs");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 6");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion6ToVersion7
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TABLE folder_ancestors (id INTEGER PRIMARY KEY, folder_id INTEGER NOT NULL CONSTRAINT fk_ancestors_folder_id REFERENCES bookmarks(id) ON DELETE CASCADE, ancestor_id INTEGER NOT NULL)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TRIGGER fkd_ancestors_folder_id BEFORE DELETE ON bookmarks FOR EACH ROW BEGIN DELETE FROM folder_ancestors WHERE folder_id = OLD.id; END;");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX ancestor_folder_id_index on folder_ancestors(folder_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX ancestor_ancestor_id_index on folder_ancestors(ancestor_id)");
  -[WebBookmarkCollection _rebuildAncestorTable](self, "_rebuildAncestorTable");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 7");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion7ToVersion8
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN extra_attributes BLOB DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 8");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion8ToVersion9
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP INDEX IF EXISTS deleted_index");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP INDEX IF EXISTS autocomplete_index");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX autocomplete_index ON bookmarks(url)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 9");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion9ToVersion10
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN hidden INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 10");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion10ToVersion11
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN hidden_ancestor_count INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 11");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion11And12And13ToVersion14
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN read INTEGER DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN last_modified REAL DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 14");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion14ToVersion15
{
  const char *v3;
  int v4;
  int v5;
  _BYTE v6[8];
  sqlite3_stmt *v7;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  v4 = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT id FROM bookmarks WHERE special_id = 3", v3);
  if (v4 >= 1)
  {
    v5 = v4;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "UPDATE bookmarks SET read = 0 WHERE read IS NULL and parent = ?");
    sqlite3_bind_int(v7, 1, v5);
    sqlite3_step(v7);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  }
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 15");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion15ToVersion16
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX title_word_bookmark_id_index ON bookmark_title_words(bookmark_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 16");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion16AndVersion17AndVersion18ToVersion19
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS count_bookmarks WHERE count_bookmarks.parent = bookmarks.id AND hidden = 0) WHERE type = 1");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 19");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion19And20ToVersion21
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  sqlite3_stmt *v7;
  _BYTE v8[8];
  sqlite3_stmt *v9;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  v3 = -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID");
  if (v3)
  {
    v4 = v3;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "SELECT count(*) FROM bookmarks WHERE parent = ? AND deleted = 0");
    sqlite3_bind_int(v9, 1, v4);
    sqlite3_step(v9);
    v5 = sqlite3_column_int(v9, 0);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v6, self->_db, "UPDATE bookmarks SET order_index = ? - order_index - 1 WHERE parent = ?");
    sqlite3_bind_int(v7, 1, v5);
    sqlite3_bind_int(v7, 2, v4);
    sqlite3_step(v7);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v6);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);
  }
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 21");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion21ToVersion22
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  _BYTE v12[8];
  sqlite3_stmt *v13;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN icon BLOB DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN fetched_icon BOOL DEFAULT 0");
  v9 = -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->_db, "SELECT id, extra_attributes FROM bookmarks WHERE deleted = 0 AND parent = ?");
  sqlite3_bind_int(v13, 1, -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  while (sqlite3_step(v13) == 100)
  {
    v3 = sqlite3_column_int(v13, 0);
    WBDataFromNullableColumn(v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 2, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.ReadingList"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("Icon"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("DateLastFetchedIcon"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "removeObjectForKey:", CFSTR("Icon"));
        objc_msgSend(v6, "removeObjectForKey:", CFSTR("DateLastFetchedIcon"));
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "UPDATE bookmarks SET icon = ?, fetched_icon = ?, extra_attributes = ?, dav_generation = ? WHERE id = ?");
        bindNullableDataToSQLStatement(v11, 1, v7);
        sqlite3_bind_int(v11, 2, v8 != 0);
        bindAttributesToSQLStatement(v11, 3, v5);
        sqlite3_bind_int64(v11, 4, v9);
        sqlite3_bind_int(v11, 5, v3);
        sqlite3_step(v11);
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
      }

    }
  }
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 22");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
}

- (void)_migrateSchemaVersion22ToVersion23
{
  sqlite3_int64 v3;
  _BYTE v4[8];
  sqlite3_stmt *v5;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  v3 = -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DELETE FROM sync_properties WHERE key = '_dav_generation'");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4, self->_db, "INSERT INTO sync_properties (key, value) VALUES ('_dav_generation', ?)");
  sqlite3_bind_int64(v5, 1, v3);
  sqlite3_step(v5);
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 23");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4);
}

- (void)_migrateSchemaVersion23ToVersion24
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN added INTEGER DEFAULT 1");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET added = 0 WHERE server_id IS NOT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 24");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion24ToVersion25
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN archived_offline BOOL DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN last_archived REAL DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 25");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion25ToVersion26
{
  const char *v2;
  const char *v4;

  WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"PRAGMA journal_mode = wal", v2);
  WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"PRAGMA user_version = 26", v4);
}

- (void)_migrateSchemaVersion26ToVersion27
{
  -[WebBookmarkCollection _clearAndCreateBookmarksTitleWordTable](self, "_clearAndCreateBookmarksTitleWordTable");
  -[WebBookmarkCollection _indexAllTitleWords](self, "_indexAllTitleWords");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 27");
}

- (void)_migrateSchemaVersion27ToVersion28
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX title_bookmark_id_index ON bookmark_title_words(bookmark_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 28");
}

- (void)_migrateSchemaVersion28ToVersion29
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN locally_added BOOL DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 29");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion29ToVersion30
{
  int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  WebBookmarkCollection *v18;
  _BYTE v19[8];
  sqlite3_stmt *v20;
  _BYTE v21[8];
  sqlite3_stmt *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN local_attributes BLOB DEFAULT NULL");
  v17 = -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration");
  v18 = self;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, self->_db, "SELECT id, extra_attributes, last_archived FROM bookmarks WHERE deleted = 0 AND parent = ?");
  sqlite3_bind_int(v22, 1, -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  while (sqlite3_step(v22) == 100)
  {
    v3 = sqlite3_column_int(v22, 0);
    WBDataFromNullableColumn(v22, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = sqlite3_column_double(v22, 2);
    v6 = v5;
    if (v4 || v5 != 0.0)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 2, 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.ReadingList"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
        v8 = 0;
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("NextPageURLs"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v6 != 0.0 || v9)
      {
        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        if (v6 != 0.0)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("DateLastArchived"));

        }
        if (v10)
          objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("NextPageURLs"));
        v14 = objc_alloc(MEMORY[0x24BDBCE70]);
        v24[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("com.apple.ReadingList");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v14, "initWithObjects:forKeys:", v15, v16);

      }
      else
      {
        v11 = 0;
      }
      if (v8)
      {
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("NextPageURLs"));
        objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("com.apple.ReadingList"));
      }
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, v18->_db, "UPDATE bookmarks SET extra_attributes = ?, local_attributes = ?, dav_generation = ? WHERE id = ?");
      if (v7)
        bindAttributesToSQLStatement(v20, 1, v7);
      else
        sqlite3_bind_null(v20, 1);
      if (v11)
        bindAttributesToSQLStatement(v20, 2, v11);
      else
        sqlite3_bind_null(v20, 2);
      sqlite3_bind_int64(v20, 3, v17);
      sqlite3_bind_int(v20, 4, v3);
      sqlite3_step(v20);
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);

    }
  }
  -[WebBookmarkCollection _executeSQLWithCString:](v18, "_executeSQLWithCString:", "ALTER TABLE bookmarks DROP COLUMN last_archived");
  -[WebBookmarkCollection _executeSQLWithCString:](v18, "_executeSQLWithCString:", "PRAGMA user_version = 30");
  -[WebBookmarkCollection _executeSQLWithCString:](v18, "_executeSQLWithCString:", "END");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
}

- (void)_migrateSchemaVersion30ToVersion31
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN archive_status INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET archive_status = archived_offline");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET archived_offline = NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET last_archived = NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 31");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion31ToVersion32
{
  -[WebBookmarkCollection _clearAndCreateBookmarksTitleWordTable](self, "_clearAndCreateBookmarksTitleWordTable");
  -[WebBookmarkCollection _indexAllTitleWords](self, "_indexAllTitleWords");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 32");
}

- (void)_migrateSchemaVersion32ToVersion33
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET fetched_icon = 0, icon = NULL WHERE parent = (SELECT id FROM bookmarks WHERE special_id = 3)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 33");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion33ToVersion34
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN syncable BOOL DEFAULT 1");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 34");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion34ToVersion35
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET archive_status = 0 WHERE archive_status IS NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 35");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion35ToVersion36
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN web_filter_status INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 36");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion36ToVersion37
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection deleteAllFavoriteIcons](self, "deleteAllFavoriteIcons");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 37");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion37ToVersion38
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection markAllFavoritesAsNeedingIcons](self, "markAllFavoritesAsNeedingIcons");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 38");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion38ToVersion39
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN modified_attributes UNSIGNED BIG INT DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 39");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion39Or40ToVersion41
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DELETE FROM bookmark_title_words WHERE bookmark_id NOT IN (SELECT id FROM bookmarks)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DELETE FROM folder_ancestors WHERE folder_id NOT IN (SELECT id FROM bookmarks)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN date_closed REAL DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 41");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
  -[WebBookmarkCollection _enableForeignKeys](self, "_enableForeignKeys");
}

- (void)_migrateSchemaVersion41ToVersion42
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN last_selected_child INTEGER DEFAULT NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD FOREIGN KEY (last_selected_child) REFERENCES bookmarks (id) ON DELETE SET NULL");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 42");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion42ToVersion43
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX reading_list_index ON bookmarks (parent, deleted, web_filter_status, order_index DESC)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 43");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion43ToVersion44
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 44");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion44ToVersion45
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 45");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion45ToVersion46
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE bookmarks ADD COLUMN subtype INTEGER DEFAULT 0");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 46");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion46ToVersion47
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 47");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion47ToVersion48
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS participants");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 48");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion48ToVersion49
{
  uint64_t v3;
  void *v4;
  WebBookmark *v5;
  sqlite3_stmt *v6;
  void *v7;
  WebBookmark *v8;
  WebBookmark *v9;
  _QWORD v10[4];
  WebBookmark *v11;
  char v12[8];
  sqlite3_stmt *v13;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("deleted = 1")));
    v3 = MEMORY[0x24BDAC760];
    while (sqlite3_step(v13) == 100)
    {
      v4 = (void *)MEMORY[0x212BD4AC8]();
      v5 = [WebBookmark alloc];
      v6 = v13;
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v5, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v6, v7, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

      v10[0] = v3;
      v10[1] = 3221225472;
      v10[2] = __59__WebBookmarkCollection__migrateSchemaVersion48ToVersion49__block_invoke;
      v10[3] = &unk_24CB328D0;
      v9 = v8;
      v11 = v9;
      -[WebBookmarkCollection updateSyncDataForBookmark:usingBlock:](self, "updateSyncDataForBookmark:usingBlock:", v9, v10);

      objc_autoreleasePoolPop(v4);
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  }
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 49");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

id __59__WebBookmarkCollection__migrateSchemaVersion48ToVersion49__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementGenerationForKey:withDeviceIdentifier:", CFSTR("Deleted"), v4);

  return v3;
}

- (void)_migrateSchemaVersion49ToVersion50
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS participant_presence");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 50");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion50ToVersion51
{
  WebBookmark *v3;
  WebBookmark *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v9, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("id NOT IN (SELECT MIN(id) FROM bookmarks GROUP BY external_uuid)")));
  while (sqlite3_step(v10) == 100)
  {
    v3 = [WebBookmark alloc];
    v4 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v3, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v10, 0, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("UPDATE bookmarks SET external_uuid = '%@' WHERE id = %d"), v7, -[WebBookmark identifier](v4, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v8);

  }
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE UNIQUE INDEX IF NOT EXISTS unique_uuid ON bookmarks(external_uuid)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 51");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
}

- (void)_migrateSchemaVersion51ToVersion52
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 52");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion52ToVersion53
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 53");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion53ToVersion54
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 54");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion54ToVersion55
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 55");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

+ (NSString)bookmarkImagesDirectoryPath
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath;
  if (!+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath)
  {
    objc_msgSend((id)objc_opt_class(), "safariDirectoryPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("BookmarkImages"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath;
    +[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath = v4;

    v2 = (void *)+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath;
  }
  return (NSString *)v2;
}

- (BOOL)migrateReadingListIconsFromDatabaseToBookmarkImagesDirectory
{
  uint64_t v2;
  const char *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  id v23;
  _BYTE v24[8];
  sqlite3_stmt *v25;
  uint8_t v26[24];
  uint8_t buf[4];
  _QWORD v28[5];

  *(_QWORD *)((char *)&v28[3] + 4) = *MEMORY[0x24BDAC8D0];
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v26, self->_db);
  if (v26[17])
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24, self->_db, "SELECT id, local_attributes, icon FROM bookmarks WHERE deleted = 0 AND parent = ?");
    sqlite3_bind_int(v25, 1, -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
    objc_msgSend((id)objc_opt_class(), "bookmarkImagesDirectoryPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v21, 0) & 1) == 0)
      objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);
    while (sqlite3_step(v25) == 100)
    {
      v4 = (void *)MEMORY[0x212BD4AC8]();
      v5 = sqlite3_column_int(v25, 0);
      WBDataFromNullableColumn(v25, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WBDataFromNullableColumn(v25, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 2;
      if (v7 && v6)
      {
        v23 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 2, 0, &v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v23;
        if (!v9)
        {
          v11 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "wb_privacyPreservingDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v28[0] = v12;
            _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Got nil local attributes dictionary: %{public}@", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.ReadingList"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "Got nil reading list attributes dictionary, creating one", buf, 2u);
          }
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "stringByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "writeToFile:atomically:", v17, 1);
        objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("ReadingListIconUUID"));
        objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("com.apple.ReadingList"));
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET local_attributes = ?, icon = ? WHERE id = ?");
        bindAttributesToSQLStatement(*(sqlite3_stmt **)((char *)v28 + 4), 1, v9);
        sqlite3_bind_null(*(sqlite3_stmt **)((char *)v28 + 4), 2);
        sqlite3_bind_int(*(sqlite3_stmt **)((char *)v28 + 4), 3, v5);
        v8 = sqlite3_step(*(sqlite3_stmt **)((char *)v28 + 4)) != 101;
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);

      }
      objc_autoreleasePoolPop(v4);
      if ((v8 | 2) != 2)
      {
        v18 = 0;
        goto LABEL_19;
      }
    }
    v18 = WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v26, v2, v3);
LABEL_19:

    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24);
  }
  else
  {
    v18 = 0;
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v26);
  return v18;
}

- (void)_rerunMigrationsIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Bookmarks database appears to have skipped migration steps. Rerunning migration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __111__WebBookmarkCollection__updateDatabaseIfNewerVersion_wasLaunchedForSyncStringKey_upgradeSelector_versionType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "stringForKey:", CFSTR("DebugForceMigrationFromSafariVersionKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "syncStringForKey:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("0");
    if (v5)
      v7 = (__CFString *)v5;
    v4 = v7;

  }
  if (objc_msgSend(*(id *)(a1 + 56), "compare:options:", v4, 64))
    v8 = (*(uint64_t (**)(_QWORD, _QWORD, __CFString *))(a1 + 64))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v4);
  else
    v8 = 1;

  return v8;
}

- (BOOL)_updateDatabaseOutsideSafariProcessIfNewerSafariVersionWasLaunched
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_isInSyncAgent");

  if ((v4 & 1) == 0)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1488], "safari_safariCoreBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_normalizedVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:](self, "_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:", v6, CFSTR("newestLaunchedSafariOutsideSafariProcessVersion"), sel__performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion_, CFSTR("NewestLaunchedSafariVersionOutsideApplicationProcess"));
  return v7;
}

- (BOOL)_performSafariVersionUpgradesFromPreviousVersion:(id)a3
{
  return 1;
}

- (BOOL)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:(id)a3
{
  return 1;
}

- (BOOL)_performOSVersionUpgradesFromPreviousVersion:(id)a3
{
  return 1;
}

uint64_t __64__WebBookmarkCollection__createRecoveredBookmarksFolderIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0x7FFFFFFFLL, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "collectionType"));
  objc_msgSend(v2, "_setSyncable:", 0);
  v6 = CFSTR("com.apple.bookmarks.OmitFromUI");
  v7[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExtraAttributes:", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v2, 6, 1);
  return v4;
}

- (int)_sqliteStatementWithQuery:(id)a3 runInBlock:(id)a4
{
  id v6;
  void (**v7)(id, sqlite3_stmt *);
  sqlite3 *db;
  id v9;
  int v10;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  ppStmt = 0;
  db = self->_db;
  v9 = objc_retainAutorelease(v6);
  v10 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0);
  if (!v10)
  {
    v7[2](v7, ppStmt);
    v10 = sqlite3_finalize(ppStmt);
  }

  return v10;
}

- (id)_errorForMostRecentSQLiteError
{
  return -[WebBookmarkCollection _errorForMostRecentSQLiteErrorWithErrorCode:](self, "_errorForMostRecentSQLiteErrorWithErrorCode:", sqlite3_errcode(self->_db));
}

- (id)_errorForMostRecentSQLiteErrorWithErrorCode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_errmsg(self->_db));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE82F90];
  v9[0] = *MEMORY[0x24BDD0FC8];
  v9[1] = v5;
  v10[0] = v4;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.SQLiteError"), a3, v6);

  return v7;
}

- (BOOL)moveBookmark:(id)a3 toFolderWithID:(int)a4 orderIndex:(unsigned int)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[WebBookmarkCollection _moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:](self, "_moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 1, 0, 1, v6);
}

- (BOOL)_insertTombstoneWithServerID:(id)a3 itemType:(int64_t)a4 subtype:(int64_t)a5 syncData:(id)a6
{
  id v10;
  id v11;
  void *v12;
  sqlite3 *db;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  BOOL v19;
  _BYTE v21[8];
  sqlite3_stmt *v22;

  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSERT INTO bookmarks (order_index, type, subtype, deleted, added, parent, server_id, dav_generation%@) VALUES (0, %ld, %ld, 1, 0, -1, ?, ?%@)"), CFSTR(", sync_data"), a4, a5, CFSTR(", ?"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v14 = objc_retainAutorelease(v12);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)objc_msgSend(v14, "UTF8String"));
  v15 = v22;
  v16 = objc_retainAutorelease(v10);
  sqlite3_bind_text(v15, 1, (const char *)objc_msgSend(v16, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(v22, 2, -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration"));
  v17 = v22;
  if (v11)
  {
    v18 = objc_retainAutorelease(v11);
    sqlite3_bind_blob(v17, 3, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v22, 3);
  }
  v19 = sqlite3_step(v22) == 101 && -[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);

  return v19;
}

- (BOOL)_clearAllTombstones
{
  const char *v2;
  int v3;
  NSObject *v4;

  v3 = WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"DELETE FROM bookmarks WHERE deleted = 1", v2);
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _clearAllTombstones].cold.1();
  }
  return v3 == 0;
}

- (BOOL)_clearAllTombstonesDuringOrBeforeLocalRecordGeneration:(int64_t)a3
{
  WebBookmarks::BookmarkSQLStatement *db;
  id v4;
  sqlite3 *v5;
  const char *v6;
  int v7;
  NSObject *v8;

  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmarks WHERE deleted = 1 AND dav_generation <= %zu"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3 *)objc_msgSend(v4, "UTF8String");
  v7 = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v5, v6);

  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _clearAllTombstones].cold.1();
  }
  return v7 == 0;
}

- (BOOL)_clearTombstoneForBookmark:(id)a3
{
  id v4;
  WebBookmarks::BookmarkSQLStatement *db;
  id v6;
  sqlite3 *v7;
  const char *v8;
  int v9;
  NSObject *v10;

  v4 = a3;
  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmarks WHERE deleted = 1 AND id = %d"), objc_msgSend(v4, "identifier"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (sqlite3 *)objc_msgSend(v6, "UTF8String");
  v9 = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v7, v8);

  if (v9)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _clearAllTombstones].cold.1();
  }

  return v9 == 0;
}

- (BOOL)_clearSyncKeysUnderBookmarkID:(int)a3 isFolder:(BOOL)a4
{
  _BYTE v6[8];
  sqlite3_stmt *v7;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "UPDATE bookmarks SET added = 1, server_id = NULL, sync_key = NULL, sync_data = NULL WHERE parent IN (select folder_id from folder_ancestors where ancestor_id = ?) OR parent = ? OR id = ?");
  sqlite3_bind_int(v7, 1, a3);
  sqlite3_bind_int(v7, 2, a3);
  sqlite3_bind_int(v7, 3, a3);
  LOBYTE(a3) = sqlite3_step(v7) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return a3;
}

- (BOOL)_clearAllSyncKeys
{
  int v2;
  NSObject *v3;
  _BYTE v5[8];
  sqlite3_stmt *v6;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, "UPDATE bookmarks SET server_id = NULL, sync_key = NULL, sync_data = NULL");
  v2 = sqlite3_step(v6);
  if (v2 != 101)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _clearAllSyncKeys].cold.1();
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v2 == 101;
}

- (BOOL)clearAllSyncData
{
  NSObject *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all sync data, likely because the user is logging out", buf, 2u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__WebBookmarkCollection_clearAllSyncData__block_invoke;
  v5[3] = &unk_24CB31E10;
  v5[4] = self;
  return -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v5, 0);
}

uint64_t __41__WebBookmarkCollection_clearAllSyncData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearAllSyncData");
}

- (BOOL)_clearAllSyncData
{
  BOOL v3;
  NSObject *v4;
  int v5;
  int v7;
  NSObject *v8;
  _QWORD v9[6];
  uint64_t v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  char v13;

  if (!-[WebBookmarkCollection _clearAllSyncKeys](self, "_clearAllSyncKeys")
    || !-[WebBookmarkCollection _clearAllTombstones](self, "_clearAllTombstones")
    || !-[WebBookmarkCollection setSyncData:forKey:](self, "setSyncData:forKey:", 0, CFSTR("BASyncData"))
    || !-[WebBookmarkCollection setSyncData:forKey:](self, "setSyncData:forKey:", 0, CFSTR("DAVHomeURL")))
  {
    return 0;
  }
  v3 = 0;
  if (-[WebBookmarkCollection setLocalMigrationState:generateDeviceIdentifierIfNeeded:](self, "setLocalMigrationState:generateDeviceIdentifierIfNeeded:", 0, 0))
  {
    if (!-[WebBookmarkCollection updateAccountHash:](self, "updateAccountHash:", 0))
      return 0;
    if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    {
      -[WebBookmarkCollection resetDeviceIdentifier](self, "resetDeviceIdentifier");
      if (-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE generations SET generation = 0"))
      {
        v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection _clearAllSyncData].cold.2();
        return 0;
      }
      -[WebBookmarkCollection setLastSyncedRecordGeneration:](self, "setLastSyncedRecordGeneration:", 0);
      v10 = 0;
      v11 = (sqlite3_stmt *)&v10;
      v12 = 0x2020000000;
      v13 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __42__WebBookmarkCollection__clearAllSyncData__block_invoke;
      v9[3] = &unk_24CB31E98;
      v9[4] = self;
      v9[5] = &v10;
      -[WebBookmarkCollection enumerateDescendantsOfBookmarkID:usingBlock:](self, "enumerateDescendantsOfBookmarkID:usingBlock:", 0, v9);
      v5 = *((unsigned __int8 *)v11 + 24);
      _Block_object_dispose(&v10, 8);
      if (v5)
        return 0;
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v10, self->_db, "UPDATE bookmarks SET added = 1");
    v7 = sqlite3_step(v11);
    v3 = v7 == 101;
    if (v7 != 101)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _clearAllSyncData].cold.1();
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v10);
  }
  return v3;
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  _BYTE v11[8];
  sqlite3_stmt *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(v5, "isSyncable") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:", v5))
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "_generateNewServerIDForBookmark:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setServerID:forBookmark:", v7, v5);

    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), (const char *)objc_msgSend(CFSTR("UPDATE bookmarks SET dav_generation = ? WHERE id = ?"), "UTF8String"));
    sqlite3_bind_int64(v12, 1, objc_msgSend(*(id *)(a1 + 32), "currentRecordGeneration"));
    sqlite3_bind_int(v12, 2, objc_msgSend(v5, "identifier"));
    v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__WebBookmarkCollection__clearAllSyncData__block_invoke_2;
    v10[3] = &unk_24CB328D0;
    v10[4] = v8;
    if ((objc_msgSend(v8, "updateSyncDataForBookmark:usingBlock:", v5, v10) & 1) != 0)
    {
      if (sqlite3_step(v12) == 101)
      {
        objc_msgSend(*(id *)(a1 + 32), "_incrementGeneration");
LABEL_12:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
        goto LABEL_13;
      }
      v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_1();
      }
    }
    else
    {
      v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_2();
      }
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_12;
  }
LABEL_13:

}

WBBookmarkSyncData *__42__WebBookmarkCollection__clearAllSyncData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WBBookmarkSyncData *v4;
  void *v5;
  void *v6;
  WBBookmarkSyncData *v7;
  id v8;
  void *v9;
  WBBookmarkSyncData *v10;
  _QWORD v12[4];
  WBBookmarkSyncData *v13;
  void *v14;

  v3 = a2;
  v4 = objc_alloc_init(WBBookmarkSyncData);
  objc_msgSend(v3, "position");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBBookmarkSyncData setPosition:](v4, "setPosition:", v5);

  objc_msgSend(*(id *)(a1 + 32), "currentDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__WebBookmarkCollection__clearAllSyncData__block_invoke_3;
  v12[3] = &unk_24CB32920;
  v7 = v4;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  objc_msgSend(v3, "enumerateGenerationsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a3, "incrementedGenerationWithDeviceIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeneration:forKey:", v6, v7);

}

- (BOOL)_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:(id)a3
{
  return 1;
}

- (id)_generateNewServerIDForBookmark:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__WebBookmarkCollection_deleteBookmark_leaveTombstone___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "serverID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1[4], "syncDataForBookmark:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(a1[5], "containsObject:", v8))
    {
      objc_msgSend(v5, "setIsDeletingRecordZone:", 1);
    }
    else
    {
      objc_msgSend(a1[4], "_rootServerIDForRecordZoneID:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v4))
      {
        objc_msgSend(a1[5], "addObject:", v8);
        objc_msgSend(v5, "setIsDeletingRecordZone:", 1);
      }
      else
      {
        objc_msgSend(v5, "setState:", 1);
        objc_msgSend(a1[6], "deviceIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "incrementGenerationForKey:withDeviceIdentifier:", CFSTR("Deleted"), v11);

      }
    }
    v12 = a1[4];
    v13 = objc_msgSend(v3, "itemType");
    v14 = objc_msgSend(v3, "subtype");
    objc_msgSend(v5, "encodedBookmarkSyncData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "_insertTombstoneWithServerID:itemType:subtype:syncData:", v4, v13, v14, v15);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __56__WebBookmarkCollection__deleteBookmark_leaveTombstone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "serverID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "maintainsSyncMetadata"))
    {
      objc_msgSend(*(id *)(a1 + 32), "syncDataForBookmark:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setState:", 1);
      objc_msgSend(v3, "deviceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "incrementGenerationForKey:withDeviceIdentifier:", CFSTR("Deleted"), v6);

      objc_msgSend(v5, "encodedBookmarkSyncData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "syncData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "_insertTombstoneWithServerID:itemType:subtype:syncData:", v4, objc_msgSend(v3, "itemType"), objc_msgSend(v3, "subtype"), v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_insertTombsonesRecursivelyForRootFolder:(id)a3 insertTombstoneBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *i;
  void *context;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  context = (void *)MEMORY[0x212BD4AC8]();
  v32 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v33, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      break;
    v8 = (void *)MEMORY[0x212BD4AC8]();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_24CB4B1B8, v20);

    if (((uint64_t (**)(id, void *))v6)[2](v6, v7))
    {
      v21 = 0;
      do
      {
        v22 = (void *)MEMORY[0x212BD4AC8]();
        -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", objc_msgSend(v7, "identifier"), 3, v21, 100);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = objc_msgSend(v23, "count");
            objc_msgSend(v7, "privacyPreservingDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v42 = v25;
            v43 = 1024;
            v44 = v21;
            v45 = 2114;
            v46 = v26;
            _os_log_impl(&dword_211022000, v24, OS_LOG_TYPE_INFO, "Fetched %zu bookmark children at offset %u in folder %{public}@ while inserting tombstones", buf, 0x1Cu);

          }
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v27 = v23;
          v19 = (void *)objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v19)
          {
            v28 = *(_QWORD *)v37;
            while (2)
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(_QWORD *)v37 != v28)
                  objc_enumerationMutation(v27);
                if ((v6[2](v6, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i)) & 1) == 0)
                {
                  LODWORD(v19) = 1;
                  goto LABEL_26;
                }
              }
              v19 = (void *)objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
              if (v19)
                continue;
              break;
            }
          }
LABEL_26:

          v21 = (v21 + 100);
        }
        else
        {
          LODWORD(v19) = 5;
        }

        objc_autoreleasePoolPop(v22);
      }
      while (!(_DWORD)v19);
      if ((_DWORD)v19 == 5)
      {
        v10 = &unk_24CB4B1B8;
LABEL_4:
        if ((unint64_t)objc_msgSend(v34, "count") > 0x14)
          v11 = 1;
        else
          v11 = 20;
        v12 = objc_msgSend(v10, "intValue");
        -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", objc_msgSend(v7, "identifier"), 5, v12, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = objc_msgSend(v13, "count");
            objc_msgSend(v7, "privacyPreservingDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v42 = v15;
            v43 = 1024;
            v44 = v12;
            v45 = 2114;
            v46 = v16;
            _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "Fetched %zu folder children at offset %u in folder %{public}@ while inserting tombstones", buf, 0x1Cu);

          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v12 + v11));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v17, v18);

          objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v13, "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "insertObjects:atIndexes:", v13, v19);

          LODWORD(v19) = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "identifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", 0, v19);

          objc_msgSend(v33, "removeObjectAtIndex:", 0);
          LODWORD(v19) = 2;
        }

        goto LABEL_35;
      }
    }
    else
    {
      LODWORD(v19) = 1;
    }
    v10 = &unk_24CB4B1B8;
LABEL_35:

    objc_autoreleasePoolPop(v8);
    if ((_DWORD)v19 && (_DWORD)v19 != 2)
      goto LABEL_39;
  }
  LODWORD(v19) = 0;
LABEL_39:

  objc_autoreleasePoolPop(context);
  return (_DWORD)v19 == 0;
}

- (int)_specialIDForBookmarkTitle:(id)a3
{
  id v4;
  int v5;
  void *v6;
  char v7;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v4 = a3;
  if (-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType") == 1)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("BookmarksBar")) & 1) != 0
         || (WebBookmarksBookmarksBarFolderTitle(),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             v7 = objc_msgSend(v4, "isEqualToString:", v6),
             v6,
             (v7 & 1) != 0))
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("BookmarksMenu")) & 1) != 0
         || (WebBookmarksBookmarksMenuFolderTitle(),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v4, "isEqualToString:", v9),
             v9,
             (v10 & 1) != 0))
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ReadingList")) & 1) != 0
         || (WebBookmarksReadingListFolderTitle(),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v4, "isEqualToString:", v11),
             v11,
             (v12 & 1) != 0))
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.WebFilterWhiteList")) & 1) != 0
         || (WebBookmarksWebFilterAllowedSitesFolderTitle(),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             v14 = objc_msgSend(v4, "isEqualToString:", v13),
             v13,
             (v14 & 1) != 0))
  {
    v5 = 4;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FrequentlyVisitedSites")))
  {
    v5 = 5;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_databaseTitleForSpecialID:(int)a3
{
  if ((a3 - 1) > 5)
    return 0;
  else
    return off_24CB32D68[a3 - 1];
}

- (BOOL)_childrenOfParentBookmarkAreUnsyncable:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isWebFilterAllowedSitesFolder") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isFrequentlyVisitedSitesFolder");

  return v4;
}

id __75__WebBookmarkCollection__mergeBookmarkIntoPersistedBookmark_forAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateGenerationsInSyncData:forAttributes:", v3, *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 40), "maintainsSyncMetadata"))
    objc_msgSend(*(id *)(a1 + 32), "unlockFields");
  return v3;
}

- (BOOL)saveBookmark:(id)a3 incrementGenerations:(BOOL)a4
{
  return -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", a3, 0, a4);
}

id __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    v4 = -1;
  else
    v4 = -69;
  objc_msgSend(*(id *)(a1 + 32), "updateGenerationsInSyncData:forAttributes:", v3, v4);
  if (objc_msgSend(*(id *)(a1 + 40), "maintainsSyncMetadata"))
    objc_msgSend(*(id *)(a1 + 32), "unlockFields");
  return v3;
}

id __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "minimumSyncAPIVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumAPIVersion:", objc_msgSend(v4, "integerValue"));

  objc_msgSend(*(id *)(a1 + 32), "syncState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", objc_msgSend(v5, "integerValue"));

  return v3;
}

- (BOOL)_markBookmarkID:(int)a3 withSpecialID:(int)a4
{
  WebBookmarks::BookmarkSQLStatement *db;
  sqlite3 *v5;
  NSString *v6;

  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET special_id = %u, editable = 0, deletable = 0 WHERE id = %u"), *(_QWORD *)&a4, *(_QWORD *)&a3);
  v5 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  LODWORD(db) = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v5, v6);

  return (_DWORD)db == 0;
}

- (BOOL)bookmarkRequiresParent:(id)a3 specialID:(int)a4
{
  return a4 != 6;
}

- (id)serverIDForBookmarkID:(int)a3
{
  return -[WebBookmarkCollection _serverIDForBookmarkID:generateIfNeeded:](self, "_serverIDForBookmarkID:generateIfNeeded:", *(_QWORD *)&a3, 0);
}

- (id)_serverIDForBookmarkID:(int)a3 generateIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE v15[8];
  sqlite3_stmt *v16;
  char v17;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  if ((_DWORD)v5)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v15, self->_db, "SELECT server_id FROM bookmarks WHERE id = ?");
    if (v17 && (sqlite3_bind_int(v16, 1, v5), sqlite3_step(v16) == 100) && (sqlite3_column_type(v16, 0) != 5 || v4))
    {
      WBUTF8StringFromSQLStatement(v16, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length") || !v4)
      {
        v7 = v11;
      }
      else
      {
        -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection setServerID:forBookmark:](self, "setServerID:forBookmark:", v14, v12);

        objc_msgSend(v12, "serverID");
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v7 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v15);
  }
  else
  {
    v8 = -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata");
    v9 = (void *)*MEMORY[0x24BE82E60];
    if (!v8)
      v9 = 0;
    v7 = v9;
  }
  return v7;
}

- (int)bookmarkIDForServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  sqlite3 *db;
  id v14;
  id v15;
  NSObject *v16;
  sqlite3_stmt *v17;
  id v18;
  NSObject *v19;
  _BYTE v21[8];
  sqlite3_stmt *v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE82E60]) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "_wb_stringByStandardizingDAVServerID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqualToString:", v8);
      v10 = &stru_24CB35168;
      if (v4)
        v10 = CFSTR("deleted = 0 AND");
      v11 = CFSTR("rtrim(server_id, '/') LIKE ?");
      if (v9)
        v11 = CFSTR("server_id = ?");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT id FROM bookmarks WHERE %@ %@ ORDER BY server_id ASC"), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      db = self->_db;
      v14 = objc_retainAutorelease(v12);
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)objc_msgSend(v14, "UTF8String"));
      if (v23)
      {
        if (v9)
        {
          v15 = v8;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%%@"), v8);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v22;
        v18 = objc_retainAutorelease(v15);
        sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(v18, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        if (sqlite3_step(v22) == 100)
        {
          v7 = sqlite3_column_int(v22, 0);
        }
        else
        {
          v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v8;
            _os_log_impl(&dword_211022000, v19, OS_LOG_TYPE_INFO, "Did not find any bookmarks with server ID %{public}@", buf, 0xCu);
          }
          v7 = 0x7FFFFFFF;
        }

      }
      else
      {
        v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection bookmarkIDForServerID:excludeDeletedBookmarks:].cold.1();
        v7 = 0x7FFFFFFF;
      }
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);

    }
  }
  else if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    v7 = 0x7FFFFFFF;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)bookmarkWithServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  WebBookmark *v17;
  sqlite3_stmt *v18;
  void *v19;
  _BYTE v21[8];
  sqlite3_stmt *v22;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE82E60]))
  {
    objc_msgSend(v7, "_wb_stringByStandardizingDAVServerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);
    v11 = &stru_24CB35168;
    if (v4)
      v11 = CFSTR("deleted = 0 AND");
    v12 = CFSTR("rtrim(server_id, '/') LIKE ?");
    if (v10)
      v12 = CFSTR("server_id = ?");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ ORDER BY server_id ASC"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v21, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v13));
    if (v10)
    {
      v14 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%%@"), v9);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v22;
    v16 = objc_retainAutorelease(v14);
    sqlite3_bind_text(v15, 1, (const char *)objc_msgSend(v16, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(v22) == 100)
    {
      v17 = [WebBookmark alloc];
      v18 = v22;
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v17, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v18, v19, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    }
    else
    {
      v8 = 0;
    }

    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
  }
  else
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", 0);
    v8 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)setServerID:(id)a3 forBookmark:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "UPDATE bookmarks SET server_id = ? WHERE id = ?");
  if (!v12)
    goto LABEL_7;
  if (v6)
    sqlite3_bind_text(v11, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(v11, 1);
  sqlite3_bind_int(v11, 2, objc_msgSend(v7, "identifier"));
  if (sqlite3_step(v11) == 101)
  {
    objc_msgSend(v7, "setServerID:", v6);
    v8 = 1;
  }
  else
  {
LABEL_7:
    v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (id)_primaryRecordZoneID
{
  void *v2;

  v2 = -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType");
  if (v2 == (void *)1)
  {
    objc_msgSend(MEMORY[0x24BDB91F8], "safari_tabGroupsRecordZoneID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDB91F8], "safari_bookmarksRecordZoneID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_rootServerIDForRecordZoneID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType") == 1)
  {
    objc_msgSend(v4, "safari_tabGroupRootRecordName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setHasSharedTabGroups
{
  return self->_userHasSharedTabGroups
      || -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", CFSTR("YES"), CFSTR("UserHasSharedTabGroupsKey"));
}

- (BOOL)userHasSharedTabGroups
{
  void *v4;

  if (self->_userHasSharedTabGroups)
    return 1;
  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("UserHasSharedTabGroupsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_userHasSharedTabGroups = objc_msgSend(v4, "BOOLValue");

  return self->_userHasSharedTabGroups;
}

- (id)_serverIDBeforeServerID:(id)a3
{
  -[WebBookmarkCollection _serverIDOfSiblingBookmarkWithServerID:immediatelyBeforeOrAfter:](self, "_serverIDOfSiblingBookmarkWithServerID:immediatelyBeforeOrAfter:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_serverIDAfterServerID:(id)a3
{
  -[WebBookmarkCollection _serverIDOfSiblingBookmarkWithServerID:immediatelyBeforeOrAfter:](self, "_serverIDOfSiblingBookmarkWithServerID:immediatelyBeforeOrAfter:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_serverIDOfSiblingBookmarkWithServerID:(id)a3 immediatelyBeforeOrAfter:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  sqlite3 *db;
  id v15;
  const unsigned __int8 *v16;
  void *v17;
  _BYTE v19[8];
  sqlite3_stmt *v20;
  _BYTE v21[8];
  sqlite3_stmt *v22;
  char v23;
  _BYTE v24[8];
  sqlite3_stmt *v25;
  char v26;

  v4 = a4;
  v6 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24, self->_db, "SELECT parent, order_index FROM bookmarks WHERE server_id = ? AND deleted = 0");
  if (v26
    && (sqlite3_bind_text(v25, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v25) == 100))
  {
    v7 = sqlite3_column_int(v25, 0);
    v8 = sqlite3_column_int(v25, 1);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, self->_db, "SELECT special_id FROM bookmarks WHERE id = ? AND deleted = 0");
    if (v23 && (sqlite3_bind_int(v22, 1, v7), sqlite3_step(v22) == 100))
    {
      v9 = (sqlite3_column_int(v22, 0) == 3) ^ v4;
      v10 = v9 == 0;
      if (v9)
        v11 = CFSTR("MAX");
      else
        v11 = CFSTR("MIN");
      v12 = CFSTR(">");
      if (!v10)
        v12 = CFSTR("<");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT server_id, %@(order_index) FROM bookmarks WHERE parent = ? AND order_index %@ ? AND server_id IS NOT NULL AND deleted = 0"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      db = self->_db;
      v15 = objc_retainAutorelease(v13);
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, db, (const char *)objc_msgSend(v15, "UTF8String"));
      sqlite3_bind_int(v20, 1, v7);
      sqlite3_bind_int(v20, 2, v8);
      if (sqlite3_step(v20) == 100 && (v16 = sqlite3_column_text(v20, 0)) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);

    }
    else
    {
      v17 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
  }
  else
  {
    v17 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24);

  return v17;
}

- (id)_firstServerIDInFolderWithServerID:(id)a3
{
  -[WebBookmarkCollection _firstOrLastServerIDInFolderWithServerID:isFirst:](self, "_firstOrLastServerIDInFolderWithServerID:isFirst:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lastServerIDInFolderWithServerID:(id)a3
{
  -[WebBookmarkCollection _firstOrLastServerIDInFolderWithServerID:isFirst:](self, "_firstOrLastServerIDInFolderWithServerID:isFirst:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_firstOrLastServerIDInFolderWithServerID:(id)a3 isFirst:(BOOL)a4
{
  int v4;
  id v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  sqlite3 *db;
  id v13;
  const unsigned __int8 *v14;
  _BYTE v16[8];
  sqlite3_stmt *v17;
  char v18;

  v4 = a4;
  v6 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  if (objc_msgSend(v6, "length"))
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16, self->_db, "SELECT id, special_id FROM bookmarks WHERE server_id = ? AND deleted = 0");
    if (!v18
      || (sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v17) != 100))
    {
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
      v9 = 0;
      goto LABEL_14;
    }
    v7 = sqlite3_column_int(v17, 0);
    v8 = sqlite3_column_int(v17, 1) == 3;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
    v4 ^= v8;
  }
  else
  {
    v7 = 0;
  }
  v10 = CFSTR("MAX");
  if (v4)
    v10 = CFSTR("MIN");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT %@(order_index), server_id FROM bookmarks WHERE parent = ? AND server_id IS NOT NULL"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v13 = objc_retainAutorelease(v11);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16, db, (const char *)objc_msgSend(v13, "UTF8String"));
  sqlite3_bind_int(v17, 1, v7);
  if (sqlite3_step(v17) == 100 && (v14 = sqlite3_column_text(v17, 1)) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);

LABEL_14:
  return v9;
}

+ (void)resetDeviceIdentifierForCloudKitWithCollectionType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76__WebBookmarkCollection_resetDeviceIdentifierForCloudKitWithCollectionType___block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a3;
  performBlockExclusively(v3);
}

void __76__WebBookmarkCollection_resetDeviceIdentifierForCloudKitWithCollectionType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "safariDirectoryPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(a1 + 32), "_cloudKitSyncMetadataFileNameWithCollectionType:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  collectionTypeToDeviceIdentifierDictionary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopObservingChanges");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v6);
  +[WebBookmarkDeviceIdentifier clearDeviceIdentifierWithPlistURL:](WebBookmarkDeviceIdentifier, "clearDeviceIdentifierWithPlistURL:", v5);

}

- (void)resetDeviceIdentifier
{
  void *v3;
  id v4;

  if (-[WBCollectionConfiguration isInMemoryDatabase](self->_configuration, "isInMemoryDatabase"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBCollectionConfiguration setIdentifier:](self->_configuration, "setIdentifier:", v3);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "resetDeviceIdentifierForCloudKitWithCollectionType:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));
  }
}

- (BOOL)_setSyncKey:(id)a3 forBookmark:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "UPDATE bookmarks SET sync_key = ? WHERE id = ?");
  if (!v12)
    goto LABEL_7;
  if (v6)
    sqlite3_bind_text(v11, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(v11, 1);
  sqlite3_bind_int(v11, 2, objc_msgSend(v7, "identifier"));
  if (sqlite3_step(v11) == 101)
  {
    objc_msgSend(v7, "setSyncKey:", v6);
    v8 = 1;
  }
  else
  {
LABEL_7:
    v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)_setSyncData:(id)a3 forBookmark:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "UPDATE bookmarks SET sync_data = ? WHERE id = ?");
  if (!v13)
    goto LABEL_7;
  if (v6)
  {
    v8 = objc_msgSend(v6, "length");
    sqlite3_bind_blob(v12, 1, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v12, 1);
  }
  sqlite3_bind_int(v12, 2, objc_msgSend(v7, "identifier"));
  if (sqlite3_step(v12) == 101)
  {
    objc_msgSend(v7, "setSyncData:", v6);
    v9 = 1;
  }
  else
  {
LABEL_7:
    v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (id)_syncKeysForServerIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  sqlite3_stmt **v11;
  sqlite3_stmt *v12;
  id v13;
  void *v14;
  id v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[8];
  _BYTE v24[16];
  _BYTE v25[8];
  _BYTE v26[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25, self->_db, "SELECT sync_key FROM bookmarks WHERE server_id = ? AND deleted = 0 ORDER BY server_id ASC");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23, self->_db, "SELECT sync_key FROM bookmarks WHERE deleted = 0 AND rtrim(server_id, '/') LIKE ? ORDER BY server_id ASC");
  v4 = 0;
  if (v26[8] && v24[8])
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = v16;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "_wb_stringByStandardizingDAVServerID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
          {
            v10 = v9;
            v11 = (sqlite3_stmt **)v26;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%%@"), v9);
            v10 = (id)objc_claimAutoreleasedReturnValue();
            v11 = (sqlite3_stmt **)v24;
          }
          v12 = *v11;
          sqlite3_reset(*v11);
          v13 = objc_retainAutorelease(v10);
          sqlite3_bind_text(v12, 1, (const char *)objc_msgSend(v13, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          if (sqlite3_step(v12) == 100 && sqlite3_column_type(v12, 0) != 5)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v12, 0));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKey:", v14, v8);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v5);
    }

    v4 = v17;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25);

  return v4;
}

- (id)serverIDsInFolderWithServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _BYTE v13[8];
  sqlite3_stmt *v14;
  char v15;

  v4 = a4;
  v6 = a3;
  v7 = -[WebBookmarkCollection bookmarkIDForServerID:excludeDeletedBookmarks:](self, "bookmarkIDForServerID:excludeDeletedBookmarks:", v6, v4);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->_db, "SELECT server_id from bookmarks where parent = ? AND deleted = 0");
  if (!v15)
    goto LABEL_8;
  sqlite3_bind_int(v14, 1, v7);
  while (1)
  {
    v9 = sqlite3_step(v14);
    if (v9 != 100)
      break;
    if (sqlite3_column_type(v14, 0) != 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v14, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
  }
  if (v9 == 101)
    v11 = v8;
  else
LABEL_8:
    v11 = 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

  return v11;
}

- (id)_serverIDAtOrderIndex:(unsigned int)a3 inFolderWithServerID:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;

  v4 = *(_QWORD *)&a3;
  -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](self, "bookmarkWithServerID:excludeDeletedBookmarks:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isReadingListFolder"))
  {
    -[WebBookmarkCollection readingListWithUnreadOnly:](self, "readingListWithUnreadOnly:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v7, "_reverseOrderIndex:", v4);

  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT server_id FROM bookmarks WHERE parent = ? AND deleted = 0 AND order_index = ?");
  if (v12
    && (sqlite3_bind_int(v11, 1, objc_msgSend(v6, "identifier")), sqlite3_bind_int(v11, 2, v4), sqlite3_step(v11) == 100)
    && sqlite3_column_type(v11, 0) != 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v11, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)_unsafeOrderChildrenWithServerIDs:(id)a3 inFolderWithServerID:(id)a4 excludeDeletedBookmarks:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  int v24;
  sqlite3_stmt *v25;
  int v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  sqlite3_stmt *v34;
  BOOL v35;
  void *v37;
  void *v38;
  int v39;
  id obj;
  int v41;
  _BOOL4 v42;
  WebBookmarkCollection *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[8];
  sqlite3_stmt *pStmt;
  char v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  CFRange v58;

  v5 = a5;
  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v43 = self;
  v42 = v5;
  v37 = v8;
  -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](self, "bookmarkWithServerID:excludeDeletedBookmarks:", a4, v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v38, "isReadingListFolder");
  v10 = objc_msgSend(v38, "identifier");
  -[WebBookmarkCollection listWithID:skipOffset:includeHidden:](self, "listWithID:skipOffset:includeHidden:", v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bookmarkCount");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v14 = 0;
    do
    {
      objc_msgSend(v11, "bookmarkAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

      v14 = (v14 + 1);
    }
    while (v12 != (_DWORD)v14);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v52, v43->_db, "UPDATE bookmarks SET order_index = ? WHERE id = ?");
  if (v54)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v8;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    v41 = v9;
    if (v16)
    {
      v39 = v10;
      v17 = 0;
      v18 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(obj);
          -[WebBookmarkCollection bookmarkWithServerID:excludeDeletedBookmarks:](v43, "bookmarkWithServerID:excludeDeletedBookmarks:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v42);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            if (objc_msgSend(v20, "parentID") != v39)
              goto LABEL_21;
            v58.length = objc_msgSend(v13, "count");
            v58.location = 0;
            v22 = CFArrayBSearchValues((CFArrayRef)v13, v58, v21, (CFComparatorFunction)compareBookmarksByOrder, 0);
            if (v22 >= objc_msgSend(v13, "count"))
              goto LABEL_21;
            objc_msgSend(v13, "objectAtIndex:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "orderIndex");
            LOBYTE(v24) = v24 == objc_msgSend(v21, "orderIndex");

            if ((v24 & 1) == 0)
              goto LABEL_21;
            objc_msgSend(v13, "removeObjectAtIndex:", v22);
            sqlite3_reset(pStmt);
            v25 = pStmt;
            v26 = v17;
            if (v41)
              v26 = objc_msgSend(v11, "_reverseOrderIndex:", v17);
            sqlite3_bind_int(v25, 1, v26);
            sqlite3_bind_int(pStmt, 2, objc_msgSend(v21, "identifier"));
            if (sqlite3_step(pStmt) != 101)
            {
LABEL_21:

              goto LABEL_38;
            }
            v17 = (v17 + 1);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      LODWORD(v17) = 0;
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    if (v41)
    {
      objc_msgSend(v13, "reverseObjectEnumerator");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = v13;
    }
    v28 = v27;
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v45;
      while (2)
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          sqlite3_reset(pStmt);
          v33 = v17 + j;
          v34 = pStmt;
          if ((v41 & 1) != 0)
            LODWORD(v33) = objc_msgSend(v11, "_reverseOrderIndex:", v33);
          sqlite3_bind_int(v34, 1, v33);
          sqlite3_bind_int(pStmt, 2, objc_msgSend(v32, "identifier"));
          if (sqlite3_step(pStmt) != 101)
          {

            goto LABEL_38;
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        LODWORD(v17) = v17 + j;
        if (v29)
          continue;
        break;
      }
    }

    v35 = 1;
    v43->_dirty = 1;
  }
  else
  {
LABEL_38:
    v35 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v52);

  return v35;
}

- (BOOL)_orderChildrenWithServerIDs:(id)a3 inFolderWithServerID:(id)a4 excludeDeletedBookmarks:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  BOOL v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("SAVEPOINT bookmarksdav_order")))
    goto LABEL_5;
  if (!-[WebBookmarkCollection _unsafeOrderChildrenWithServerIDs:inFolderWithServerID:excludeDeletedBookmarks:](self, "_unsafeOrderChildrenWithServerIDs:inFolderWithServerID:excludeDeletedBookmarks:", v8, v9, v5))
  {
    -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("ROLLBACK TRANSACTION TO SAVEPOINT bookmarksdav_order"));
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("RELEASE SAVEPOINT bookmarksdav_order")) == 0;
LABEL_6:

  return v10;
}

- (BOOL)_rebuildAncestorTable
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withAncestorIDs:](self, "_insertAncestorTableEntriesForBookmarkID:withAncestorIDs:", 0, v3);

  return (char)self;
}

- (BOOL)_insertAncestorTableEntriesForBookmarkID:(int)a3 withParentID:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  char v14;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->_db, "SELECT ancestor_id from folder_ancestors WHERE folder_id = ?");
  if (v14)
  {
    sqlite3_bind_int(v13, 1, v4);
    while (sqlite3_step(v13) == 100)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(v13, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    v10 = -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withAncestorIDs:](self, "_insertAncestorTableEntriesForBookmarkID:withAncestorIDs:", v5, v7);
  }
  else
  {
    v10 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10;
}

- (BOOL)_deleteAncestorTableEntriesForBookmarkID:(int)a3
{
  BOOL v4;
  NSObject *v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  char v9;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "DELETE FROM folder_ancestors WHERE folder_id IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = ?) OR folder_id = ?;");
  if (!v9)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v8, 1, a3);
  sqlite3_bind_int(v8, 2, a3);
  if (sqlite3_step(v8) != 101)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _deleteAncestorTableEntriesForBookmarkID:].cold.1();
    goto LABEL_6;
  }
  v4 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  return v4;
}

- (BOOL)_indexAllTitleWords
{
  sqlite3_stmt *v3;
  int v4;
  uint64_t v5;
  const unsigned __int8 *v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT id, title FROM bookmarks where type = 0 AND deleted = 0");
  v3 = v12;
  while (1)
  {
    v4 = sqlite3_step(v3);
    if (v4 != 100)
      break;
    v5 = sqlite3_column_int(v3, 0);
    v6 = sqlite3_column_text(v3, 1);
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v6, 4);
      v8 = -[WebBookmarkCollection _indexBookmarkID:title:](self, "_indexBookmarkID:title:", v5, v7);

      if (!v8)
      {
        v9 = 0;
        goto LABEL_7;
      }
    }
  }
  v9 = v4 == 101;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  return v9;
}

- (void)_collectChangesOfType:(int)a3 withClause:(id)a4 intoArray:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  sqlite3 *db;
  id v14;
  WebBookmark *v15;
  sqlite3_stmt *v16;
  void *v17;
  WebBookmark *v18;
  WBChangeRecord *v19;
  _BYTE v20[8];
  sqlite3_stmt *v21;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  BookmarkSQLiteColumns();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT %@ %@"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v14 = objc_retainAutorelease(v12);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20, db, (const char *)objc_msgSend(v14, "UTF8String"));
  while (sqlite3_step(v21) == 100)
  {
    v15 = [WebBookmark alloc];
    v16 = v21;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v15, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v16, v17, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    v19 = -[WBChangeRecord initWithBookmarkCollection:bookmark:changeType:localRecordGeneration:]([WBChangeRecord alloc], "initWithBookmarkCollection:bookmark:changeType:localRecordGeneration:", self, v18, v6, 0);
    objc_msgSend(v9, "addObject:", v19);

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20);

}

- (NSArray)changeList
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _collectChangesOfType:withClause:intoArray:](self, "_collectChangesOfType:withClause:intoArray:", 0, CFSTR("FROM folder_ancestors LEFT OUTER JOIN bookmarks ON folder_id = bookmarks.id WHERE bookmarks.id != 0 AND added = 1 AND syncable = 1 GROUP BY folder_id ORDER BY count(ancestor_id) ASC"), v3);
  -[WebBookmarkCollection _collectChangesOfType:withClause:intoArray:](self, "_collectChangesOfType:withClause:intoArray:", 0, CFSTR("FROM bookmarks WHERE added = 1 AND id != 0 AND type = 0 AND syncable = 1"), v3);
  if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    v4 = -[WebBookmarkCollection lastSyncedRecordGeneration](self, "lastSyncedRecordGeneration");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FROM folder_ancestors LEFT OUTER JOIN bookmarks ON folder_id = bookmarks.id WHERE dav_generation > %ld AND deleted = 0 AND added = 0 AND bookmarks.id != 0 AND syncable = 1 AND (modified_attributes & %llu) == %llu GROUP BY folder_id ORDER BY count(ancestor_id) ASC"), v4, 64, 64);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _collectChangesOfType:withClause:intoArray:](self, "_collectChangesOfType:withClause:intoArray:", 1, v5, v3);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FROM bookmarks WHERE dav_generation > %ld AND deleted = 0 AND added = 0 AND id != 0 AND syncable = 1 AND modified_attributes != 0 AND ((modified_attributes & %llu) != %llu OR type = 0)"), v4, 64, 64);
  }
  else
  {
    v7 = -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FROM folder_ancestors LEFT OUTER JOIN bookmarks ON folder_id = bookmarks.id WHERE dav_generation = %ld AND deleted = 0 AND added = 0 AND bookmarks.id != 0 AND syncable = 1 AND (modified_attributes & %llu) == %llu GROUP BY folder_id ORDER BY count(ancestor_id) ASC"), v7, 64, 64);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _collectChangesOfType:withClause:intoArray:](self, "_collectChangesOfType:withClause:intoArray:", 1, v8, v3);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FROM bookmarks WHERE dav_generation = %ld AND deleted = 0 AND added = 0 AND id != 0 AND syncable = 1 AND ((modified_attributes & %llu) != %llu OR type = 0)"), v7, 64, 64);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _collectChangesOfType:withClause:intoArray:](self, "_collectChangesOfType:withClause:intoArray:", 1, v6, v3);

  -[WebBookmarkCollection _collectChangesOfType:withClause:intoArray:](self, "_collectChangesOfType:withClause:intoArray:", 2, CFSTR("FROM bookmarks WHERE deleted = 1 AND server_id IS NOT NULL AND syncable = 1 GROUP BY server_id"), v3);
  return (NSArray *)v3;
}

- (id)nextChangeAfterLocalRecordGeneration:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  sqlite3 *db;
  id v9;
  WebBookmark *v10;
  sqlite3_stmt *v11;
  void *v12;
  WebBookmark *v13;
  void *v14;
  int v15;
  int v16;
  sqlite3_int64 v17;
  WBChangeRecord *v18;
  unsigned int v19;
  uint64_t v20;
  WBChangeRecord *v21;
  _BYTE v23[8];
  sqlite3_stmt *v24;

  v5 = (void *)MEMORY[0x24BDD17C8];
  BookmarkSQLiteColumns();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SELECT %@, added, deleted, dav_generation FROM bookmarks WHERE id != 0 AND syncable = 1 AND dav_generation > %ld AND (added = 1 OR deleted = 1 OR modified_attributes != 0) ORDER BY dav_generation ASC LIMIT 1"), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v9 = objc_retainAutorelease(v7);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23, db, (const char *)objc_msgSend(v9, "UTF8String"));
  if (sqlite3_step(v24) == 100)
  {
    v10 = [WebBookmark alloc];
    v11 = v24;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v10, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v11, v12, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));

    BookmarkSQLiteColumnNames();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v14, "count");

    v15 = sqlite3_column_int(v24, (int)v11);
    v16 = sqlite3_column_int(v24, (_DWORD)v11 + 1);
    v17 = sqlite3_column_int64(v24, (int)v11 + 2);
    v18 = [WBChangeRecord alloc];
    if (v16)
      v19 = 2;
    else
      v19 = 1;
    if (v15)
      v20 = 0;
    else
      v20 = v19;
    v21 = -[WBChangeRecord initWithBookmarkCollection:bookmark:changeType:localRecordGeneration:](v18, "initWithBookmarkCollection:bookmark:changeType:localRecordGeneration:", self, v13, v20, v17);

  }
  else
  {
    v21 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23);

  return v21;
}

- (BOOL)_clearChangeList
{
  BOOL v3;
  _BYTE v5[8];
  sqlite3_stmt *v6;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, (const char *)objc_msgSend(CFSTR("UPDATE bookmarks SET added = 0, modified_attributes = 0 WHERE added != 0 OR modified_attributes != 0"), "UTF8String"));
  v3 = sqlite3_step(v6) == 101
    && -[WebBookmarkCollection _clearAllTombstones](self, "_clearAllTombstones")
    && -[WebBookmarkCollection _incrementRecordGeneration](self, "_incrementRecordGeneration");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

- (BOOL)clearChangesDuringOrBeforeLocalRecordGeneration:(int64_t)a3
{
  void *v5;
  sqlite3 *db;
  id v7;
  BOOL v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET added = 0, modified_attributes = 0 WHERE dav_generation <= %zu AND (added != 0 OR modified_attributes != 0)"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v7 = objc_retainAutorelease(v5);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)objc_msgSend(v7, "UTF8String"));
  v8 = sqlite3_step(v11) == 101
    && -[WebBookmarkCollection _clearAllTombstonesDuringOrBeforeLocalRecordGeneration:](self, "_clearAllTombstonesDuringOrBeforeLocalRecordGeneration:", a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)clearChangesForChangeRecords:(id)a3 lastSyncedRecordGeneration:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v10, "changeType"))
        {
          v11 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v10, "bookmark");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("UPDATE bookmarks SET added = 0 WHERE id = %d"), objc_msgSend(v12, "identifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = -[WebBookmarkCollection clearChangesDuringOrBeforeLocalRecordGeneration:](self, "clearChangesDuringOrBeforeLocalRecordGeneration:", a4);
  return v14;
}

- (BOOL)clearChangesForBookmark:(id)a3
{
  id v4;
  void *v5;
  sqlite3 *db;
  id v7;
  BOOL v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET added = 0, modified_attributes = 0 WHERE id = %d"), objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v7 = objc_retainAutorelease(v5);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)objc_msgSend(v7, "UTF8String"));
  if (sqlite3_step(v11) == 101
    && -[WebBookmarkCollection _clearTombstoneForBookmark:](self, "_clearTombstoneForBookmark:", v4))
  {
    objc_msgSend(v4, "setModifiedAttributes:", 0);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)_markBookmarkID:(int)a3 added:(BOOL)a4
{
  _BOOL4 v4;
  _BYTE v7[8];
  sqlite3_stmt *v8;

  v4 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "UPDATE bookmarks SET added = ? WHERE id = ?");
  sqlite3_bind_int(v8, 1, v4);
  sqlite3_bind_int(v8, 2, a3);
  LOBYTE(a3) = sqlite3_step(v8) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  return a3;
}

- (int64_t)lastSyncedRecordGeneration
{
  WebBookmarks::BookmarkSQLStatement *db;
  sqlite3 *v3;
  NSString *v4;
  int64_t v5;

  db = self->_db;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT value from sync_properties WHERE key = '%@'"), CFSTR("LastSyncedRecordGeneration"));
  v3 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  v5 = (int)WebBookmarks::BookmarkSQLStatement::selectInt(db, v3, v4);

  return v5;
}

- (void)setLastSyncedRecordGeneration:(int64_t)a3
{
  int64_t v5;
  WebBookmarks::BookmarkSQLStatement *db;
  NSString *v7;
  sqlite3 *v8;

  v5 = -[WebBookmarkCollection lastSyncedRecordGeneration](self, "lastSyncedRecordGeneration");
  if (v5 != a3)
  {
    db = self->_db;
    if (v5 == -1)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSERT INTO sync_properties (key, value) VALUES ('%@', %zd)"), CFSTR("LastSyncedRecordGeneration"), a3);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE sync_properties SET value = %zd WHERE key = '%@'"), a3, CFSTR("LastSyncedRecordGeneration"));
    v8 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
    WebBookmarks::BookmarkSQLStatement::executeSQL(db, v8, v7);

  }
}

- (void)_metaDataFileChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (!-[WBCollectionConfiguration skipsExternalNotifications](self->_configuration, "skipsExternalNotifications", a3)
    && !-[WBCollectionConfiguration isReadonly](self->_configuration, "isReadonly"))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "Handling bookmarks metadata file change notification", buf, 2u);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__WebBookmarkCollection__metaDataFileChanged___block_invoke;
    block[3] = &unk_24CB31DC8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __46__WebBookmarkCollection__metaDataFileChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncNotificationType");
}

- (void)setFavoritesFolderIdentifier:(int)a3 postChangeNotification:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id v7;

  v4 = a4;
  if (a3 < 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), *(_QWORD *)&a3, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v6;
  -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:");
  if (v4)
    -[WebBookmarkCollection postBookmarksDidReloadNotification](self, "postBookmarksDidReloadNotification");

}

- (int)_favoritesFolderIdentifier
{
  int result;
  void *v4;

  result = self->_favoritesFolderIdentifier;
  if (!result)
  {
    -[WebBookmarkCollection favoritesFolder](self, "favoritesFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_favoritesFolderIdentifier = objc_msgSend(v4, "identifier");

    return self->_favoritesFolderIdentifier;
  }
  return result;
}

- (void)_clearCachedFavoritesFolderIdentifier
{
  self->_favoritesFolderIdentifier = 0;
}

- (void)setFavoritesFolder:(id)a3 localOnly:(BOOL)a4
{
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  if (-[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase"))
  {
    -[WebBookmarkCollection favoritesFolder](self, "favoritesFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "identifier");
    if (v7 != objc_msgSend(v6, "identifier"))
    {
      if (a4
        || (objc_msgSend(v6, "identifier") == 1
         || (objc_msgSend(v6, "setSelectedFavoritesFolder:", MEMORY[0x24BDBD1C0]),
             -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v6, -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v6), 1)))&& (objc_msgSend(v8, "setSelectedFavoritesFolder:", MEMORY[0x24BDBD1C8]), -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v8), 1)))
      {
        -[WebBookmarkCollection setFavoritesFolderIdentifier:postChangeNotification:](self, "setFavoritesFolderIdentifier:postChangeNotification:", objc_msgSend(v8, "identifier"), 1);
      }
    }

  }
}

- (BOOL)bookmarkIsFavoritesFolder:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "identifier");
  LOBYTE(self) = v5 == -[WebBookmarkCollection _favoritesFolderIdentifier](self, "_favoritesFolderIdentifier");

  return (char)self;
}

- (BOOL)bookmarkIsInFavoritesFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[WebBookmarkCollection favoritesFolder](self, "favoritesFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _descendantIDsOfBookmarkFolderID:](self, "_descendantIDsOfBookmarkFolderID:", objc_msgSend(v5, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

- (WebBookmark)frequentlyVisitedSitesFolder
{
  return (WebBookmark *)-[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:", 5);
}

- (NSNumber)frequentlyVisitedSitesFolderBookmarkID
{
  void *v3;
  _BYTE v5[8];
  sqlite3_stmt *v6;

  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, "SELECT id FROM bookmarks WHERE special_id = ?");
  sqlite3_bind_int(v6, 1, 5);
  if (sqlite3_step(v6) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(v6, 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return (NSNumber *)v3;
}

- (BOOL)_clearFrequentlyVisitedSitesFolder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  const char *v11;
  BOOL v12;
  _BYTE v14[24];

  v3 = a3;
  -[WebBookmarkCollection frequentlyVisitedSitesFolderBookmarkID](self, "frequentlyVisitedSitesFolderBookmarkID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
    WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v14, self->_db);
    if (v14[17]
      && -[WebBookmarkCollection _deleteRecursively:descendantsOnly:](self, "_deleteRecursively:descendantsOnly:", v7, v3)&& (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET num_children = 0 WHERE id = %d"), v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v8), v8, !v9))
    {
      WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v14, v10, v11);
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v14);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)clearFrequentlyVisitedSitesFolder
{
  return -[WebBookmarkCollection _clearFrequentlyVisitedSitesFolder:](self, "_clearFrequentlyVisitedSitesFolder:", 1);
}

- (void)deleteFrequentlyVisitedSitesFolder
{
  -[WebBookmarkCollection _clearFrequentlyVisitedSitesFolder:](self, "_clearFrequentlyVisitedSitesFolder:", 0);
}

- (BOOL)bookmarkIsFrequentlyVisitedSite:(id)a3
{
  id v4;
  int v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "parentID");
  -[WebBookmarkCollection frequentlyVisitedSitesFolderBookmarkID](self, "frequentlyVisitedSitesFolderBookmarkID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 == objc_msgSend(v6, "intValue");

  return v5;
}

- (void)_postBookmarksDidReloadNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (-[WebBookmarkCollection _primaryCollection](self, "_primaryCollection"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.bookmarks.BookmarksFileChanged"), 0, 0, 0);
  }
}

- (void)_postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_dirty)
  {
    -[WebBookmarkCollection _postBookmarksDidReloadNotification](self, "_postBookmarksDidReloadNotification");
    -[WebBookmarkCollection _startReadingListFetcher](self, "_startReadingListFetcher");
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "WebBookmarks sync is not posting a change notification because the collection is not dirty", v4, 2u);
    }
  }
}

- (id)_folderContentsDidChangeNotificationName
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType");
  v3 = CFSTR("WebBookmarksTabFolderContentsDidChangeNotification");
  if (v2 != 1)
    v3 = 0;
  if (v2)
    return (id)v3;
  else
    return CFSTR("WebBookmarksFolderContentsDidChangeNotification");
}

- (void)_postBookmarksFolderContentsDidChangeNotification:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_setupFinished)
  {
    v4 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, CFSTR("WebBookmarksChangedFolderID"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _folderContentsDidChangeNotificationName](self, "_folderContentsDidChangeNotificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", v7, self, v8);

  }
}

- (void)_postBookmarksSpecialFoldersDidChangeNotification
{
  id v3;

  if (self->_setupFinished && !-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("WebBookmarksSpecialFoldersDidChangeNotification"), self, 0);

  }
}

- (id)_safariFetcherServerProxy
{
  void *v3;
  char v4;
  SafariFetcherServerProxy *safariFetcherServerProxy;
  SafariFetcherServerProxy *v6;
  SafariFetcherServerProxy *v7;
  SafariFetcherServerProxy *v8;

  if (-[WebBookmarkCollection _primaryCollection](self, "_primaryCollection")
    && (+[WBFeatureManager sharedFeatureManager](WBFeatureManager, "sharedFeatureManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isOfflineReadingListAvailable"),
        v3,
        (v4 & 1) != 0))
  {
    safariFetcherServerProxy = self->_safariFetcherServerProxy;
    if (!safariFetcherServerProxy)
    {
      v6 = objc_alloc_init(SafariFetcherServerProxy);
      v7 = self->_safariFetcherServerProxy;
      self->_safariFetcherServerProxy = v6;

      safariFetcherServerProxy = self->_safariFetcherServerProxy;
    }
    v8 = safariFetcherServerProxy;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_startReadingListFetcher
{
  id v2;

  -[WebBookmarkCollection _safariFetcherServerProxy](self, "_safariFetcherServerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startReadingListFetcher");

}

- (void)_simulateCrashWithDescription:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[WebBookmarkCollection _simulateCrashWithDescription:].cold.1();

}

- (BOOL)_importBookmarksPlist:(id)a3
{
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && -[WebBookmarkCollection mergeWithBookmarksDictionary:clearHidden:error:](self, "mergeWithBookmarksDictionary:clearHidden:error:", v4, 1, 0))
  {
    -[WebBookmarkCollection _normalizeDatabaseURLs](self, "_normalizeDatabaseURLs");
    v5 = 1;
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection _importBookmarksPlist:].cold.1(v4 == 0, v6, v7);
    v5 = 0;
  }

  return v5;
}

- (BOOL)_importSyncAnchorPlist:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ComputerAnchorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v6, CFSTR("ComputerAnchorKey"));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_normalizeDatabaseURLs
{
  int v3;
  const unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  sqlite3_stmt *pStmt;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT id, URL FROM bookmarks WHERE type = 0 AND deleted = 0");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v8, self->_db, "UPDATE bookmarks SET URL = ? WHERE id = ?");
  while (sqlite3_step(v11) == 100)
  {
    v3 = sqlite3_column_int(v11, 0);
    v4 = sqlite3_column_text(v11, 1);
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
      objc_msgSend(v5, "wb_bestURLForUserTypedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
        {
          sqlite3_reset(pStmt);
          sqlite3_bind_text(pStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          sqlite3_bind_int(pStmt, 2, v3);
          sqlite3_step(pStmt);
        }
      }

    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v8);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
}

- (void)_restoreOrMergeAllowedSitesFolderAndContentsWithWebFilterAllowedSites:(id)a3 ensureChildCount:(BOOL)a4 postChangeNotification:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  int v33;
  WebBookmarkCollection *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v27 = a5;
  v5 = a4;
  v45 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v34 = self;
  -[WebBookmarkCollection webFilterAllowedSitesFolder](self, "webFilterAllowedSitesFolder");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (!v7)
  {
    v8 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0, -[WBCollectionConfiguration collectionType](v34->_configuration, "collectionType"));
    objc_msgSend(v8, "_setSyncable:", 0);
    -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](v34, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, 4, 1);
  }
  v31 = v8;
  v29 = (void *)objc_msgSend(v28, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v5 && !-[WebBookmarkCollection _ensureFolderChildrenCount:](v34, "_ensureFolderChildrenCount:", v8))
      goto LABEL_32;
    objc_msgSend(v29, "valueForKey:", CFSTR("address"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection webFilterAllowedSites](v34, "webFilterAllowedSites");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v10, "bookmarkArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v12)
    {
      v33 = 0;
      v13 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v15, "address");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v9, "indexOfObject:", v16);
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[WebBookmarkCollection deleteBookmark:postChangeNotification:](v34, "deleteBookmark:postChangeNotification:", v15, 0);
            v33 = 1;
          }
          else
          {
            objc_msgSend(v30, "addIndex:", v17);
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v12);
    }
    else
    {
      v33 = 0;
    }

  }
  else
  {
    v33 = 1;
  }
  objc_msgSend(v29, "removeObjectsAtIndexes:", v30);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v29;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKey:", CFSTR("pageTitle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("address"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("bookmarkPath"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length") && objc_msgSend(v22, "length"))
        {
          +[WebBookmark _allowedSiteBookmarkWithTitle:address:](WebBookmark, "_allowedSiteBookmarkWithTitle:address:", v22, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection moveBookmark:toFolderWithID:](v34, "moveBookmark:toFolderWithID:", v25, objc_msgSend(v31, "identifier"));
          -[WebBookmarkCollection saveBookmark:](v34, "saveBookmark:", v25);

          v33 = 1;
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v18);
  }

  if ((v33 & v27) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("WebBookmarksDidReloadNotification"), v34, 0);

  }
LABEL_32:

}

- (BOOL)_ensureFolderChildrenCount:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "identifier");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS count_bookmarks WHERE count_bookmarks.parent = %d) WHERE (bookmarks.id = %d AND bookmarks.num_children < 0)"), v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v5) == 0;

  return (char)self;
}

- (void)_clearAndCreateAncestorTable
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS folder_ancestors");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TRIGGER IF EXISTS fkd_ancestors_folder_id");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TABLE folder_ancestors (id INTEGER PRIMARY KEY AUTOINCREMENT, folder_id INTEGER NOT NULL CONSTRAINT fk_ancestors_folder_id REFERENCES bookmarks(id) ON DELETE CASCADE, ancestor_id INTEGER NOT NULL)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE TRIGGER fkd_ancestors_folder_id BEFORE DELETE ON bookmarks FOR EACH ROW BEGIN DELETE FROM folder_ancestors WHERE folder_id = OLD.id; END;");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX ancestor_folder_id_index on folder_ancestors(folder_id)");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX ancestor_ancestor_id_index on folder_ancestors(ancestor_id)");
  -[WebBookmarkCollection _rebuildAncestorTable](self, "_rebuildAncestorTable");
}

- (BOOL)_insertAncestorTableEntriesForBookmarkID:(int)a3 withAncestorIDs:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[8];
  sqlite3_stmt *pStmt;
  char v26;
  uint8_t buf[4];
  _BYTE v28[14];
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24, self->_db, "INSERT INTO folder_ancestors (folder_id, ancestor_id) VALUES (?, ?)");
  if (v26)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          sqlite3_reset(pStmt);
          sqlite3_bind_int(pStmt, 1, v4);
          sqlite3_bind_int(pStmt, 2, objc_msgSend(v11, "intValue", (_QWORD)v20));
          v12 = sqlite3_step(pStmt);
          if (v12 != 101)
          {
            v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)v28 = v11;
              *(_WORD *)&v28[8] = 1024;
              *(_DWORD *)&v28[10] = v4;
              v29 = 1024;
              v30 = v12;
              _os_log_error_impl(&dword_211022000, v16, OS_LOG_TYPE_ERROR, "Could not insert ancestor table entry %{public}@ for bookmark %d, error: %d", buf, 0x18u);
            }

            goto LABEL_17;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
        if (v8)
          continue;
        break;
      }
    }

    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "SELECT id FROM bookmarks WHERE parent = ? AND type = 1 AND deleted = 0");
    if (v28[12])
    {
      sqlite3_bind_int(*(sqlite3_stmt **)&v28[4], 1, v4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      while (1)
      {
        v15 = sqlite3_step(*(sqlite3_stmt **)&v28[4]);
        if (v15 != 100)
          break;
        -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withAncestorIDs:](self, "_insertAncestorTableEntriesForBookmarkID:withAncestorIDs:", sqlite3_column_int(*(sqlite3_stmt **)&v28[4], 0), v14);
      }
      v17 = v15 == 101;
      if (v15 != 101)
      {
        v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withAncestorIDs:].cold.1();
      }

    }
    else
    {
      v17 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  }
  else
  {
LABEL_17:
    v17 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24);

  return v17;
}

- (BOOL)_updateHiddenAncestorCountForBookmarksUnderFolderID:(int)a3 addingOffset:(int)a4
{
  _BYTE v7[8];
  sqlite3_stmt *v8;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "UPDATE bookmarks SET hidden_ancestor_count = hidden_ancestor_count + ? WHERE parent IN (SELECT folder_id from folder_ancestors WHERE ancestor_id = ?) OR parent = ?");
  sqlite3_bind_int(v8, 1, a4);
  sqlite3_bind_int(v8, 2, a3);
  sqlite3_bind_int(v8, 3, a3);
  LOBYTE(a3) = sqlite3_step(v8) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  return a3;
}

- (id)fastFetchBookmarksInBookmarkList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "bookmarkCount"))
  {
    -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:includingHiddenBookmarks:](self, "_fastFetchBookmarksInBookmarkFolder:includingHiddenBookmarks:", objc_msgSend(v4, "folderID"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 includingHiddenBookmarks:(BOOL)a4
{
  return -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:includingInMemoryChanges:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:includingInMemoryChanges:", *(_QWORD *)&a3, a4, 0, 0, 1);
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 includingInMemoryChanges:(BOOL)a4
{
  return -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:includingInMemoryChanges:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:includingInMemoryChanges:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 options:(unint64_t)a4 offset:(int)a5 limit:(int)a6
{
  return -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:includingInMemoryChanges:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:includingInMemoryChanges:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 1);
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 options:(unint64_t)a4 offset:(int)a5 limit:(int)a6 includingInMemoryChanges:(BOOL)a7
{
  uint64_t v11;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  sqlite3 *db;
  id v18;
  WebBookmark *v19;
  sqlite3_stmt *v20;
  void *v21;
  WebBookmark *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _BYTE v28[8];
  sqlite3_stmt *v29;

  v11 = *(_QWORD *)&a3;
  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a4)
    BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions(a4);
  else
    BookmarkInFolderWithoutIconColumnsSelectQuery();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a6 >= 1)
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(" LIMIT ? OFFSET ?"));
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  db = self->_db;
  v18 = objc_retainAutorelease(v15);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28, db, (const char *)objc_msgSend(v18, "UTF8String"));
  sqlite3_bind_int(v29, 1, v11);
  if (a6 >= 1)
  {
    sqlite3_bind_int(v29, 2, a6);
    sqlite3_bind_int(v29, 3, a5);
  }
  while (sqlite3_step(v29) == 100)
  {
    v19 = [WebBookmark alloc];
    v20 = v29;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:](v19, "initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:", v20, v21, 0, -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 0);

    objc_msgSend(v13, "addObject:", v22);
  }
  if (a7)
  {
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "bookmarksAfterReplayingChangesToBookmarks:inFolderWithID:", v13, v11);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = v13;
    }
    v26 = v25;

  }
  else
  {
    v26 = v13;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28);

  return v26;
}

- (id)databaseHealthInformation
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  sqlite3_int64 v6;
  WBBookmarksDatabaseHealthInformation *v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT parent, count(*) AS identical_bookmarks FROM bookmarks GROUP BY parent, type, title, url HAVING identical_bookmarks > 1");
  v3 = 0;
  v4 = 0;
  while (sqlite3_step(v10) == 100)
  {
    v5 = sqlite3_column_int(v10, 0);
    v6 = sqlite3_column_int64(v10, 1) - 1;
    v4 += v6;
    if (v5)
      v6 = 0;
    v3 += v6;
  }
  v7 = -[WBBookmarksDatabaseHealthInformation initWithTopLevelDuplicateBookmarksCount:allDuplicateBookmarksCount:]([WBBookmarksDatabaseHealthInformation alloc], "initWithTopLevelDuplicateBookmarksCount:allDuplicateBookmarksCount:", v3, v4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v7;
}

- (BOOL)isMerging
{
  return self->_mergeMode != 0;
}

- (void)_setMergeMode:(int64_t)a3
{
  self->_mergeMode = a3;
}

- (int64_t)_mergeMode
{
  return self->_mergeMode;
}

- (BOOL)hasInMemoryChanges
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)persistChangesWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistChangesWithCompletion:", v5);

}

- (id)applyInMemoryChanges:(id)a3
{
  -[WebBookmarkCollection _applyInMemoryChanges:postChangeNotification:](self, "_applyInMemoryChanges:postChangeNotification:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_applyInMemoryChange:(id)a3 fromChangeSet:(id)a4 updatedBookmarks:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(objc_msgSend(v8, "changeType"))
  {
    case 0:
      -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v8, "bookmarkID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "privacyPreservingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v13;
        _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "Applying in-memory delete change for %{public}@", buf, 0xCu);

      }
      if (v11)
        -[WebBookmarkCollection _deleteBookmark:postChangeNotification:forApplyingInMemoryChanges:](self, "_deleteBookmark:postChangeNotification:forApplyingInMemoryChanges:", v11, 0, 1);
      goto LABEL_21;
    case 2:
      objc_msgSend(v8, "bookmark");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "privacyPreservingDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v16;
        _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_INFO, "Applying in-memory add change for %{public}@", buf, 0xCu);

      }
      v17 = objc_msgSend(v14, "identifier");
      v18 = objc_msgSend(v8, "specialFolderID");
      if ((_DWORD)v18)
      {
        -[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setParentID:", objc_msgSend(v19, "identifier"));

      }
      -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:](self, "_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:", v14, 0, 1);
      objc_msgSend(v9, "removeChange:", v8);
      objc_msgSend(v9, "updateAddChangesWithInMemoryBookmarkID:toDatabaseGeneratedID:", v17, objc_msgSend(v14, "identifier"));
      objc_msgSend(v10, "addObject:", v14);

      break;
    case 3:
      -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v8, "bookmarkID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "privacyPreservingDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bookmark");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "privacyPreservingDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = (uint64_t)v21;
        v50 = 2114;
        v51 = v23;
        _os_log_impl(&dword_211022000, v20, OS_LOG_TYPE_INFO, "Applying in-memory modify change for %{public}@ from %{public}@", buf, 0x16u);

      }
      if (v11)
      {
        objc_msgSend(v8, "applyModificationsToBookmark:", v11);
        -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:](self, "_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:", v11, 0, 1);
        objc_msgSend(v9, "removeChange:", v8);
      }
      goto LABEL_21;
    case 4:
      -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v8, "bookmarkID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "privacyPreservingDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v25;
        _os_log_impl(&dword_211022000, v24, OS_LOG_TYPE_INFO, "Applying in-memory move change for %{public}@", buf, 0xCu);

      }
      if (v11)
      {
        -[WebBookmarkCollection _moveBookmark:toFolderWithID:](self, "_moveBookmark:toFolderWithID:", v11, objc_msgSend(v8, "associatedBookmarkID"));
        objc_msgSend(v9, "removeChange:", v8);
      }
LABEL_21:

      break;
    case 5:
      -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v8, "bookmarkID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v8, "associatedBookmarkID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v26, "privacyPreservingDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "privacyPreservingDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = (uint64_t)v29;
        v50 = 2114;
        v51 = v30;
        _os_log_impl(&dword_211022000, v28, OS_LOG_TYPE_INFO, "Applying in-memory reorder change for %{public}@ after %{public}@", buf, 0x16u);

      }
      if (v26)
      {
        -[WebBookmarkCollection _reorderBookmark:afterBookmark:](self, "_reorderBookmark:afterBookmark:", v26, v27);
        objc_msgSend(v9, "removeChange:", v8);
      }

      break;
    case 6:
      v31 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "bookmarks");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v49 = objc_msgSend(v32, "count");
        v50 = 1024;
        LODWORD(v51) = objc_msgSend(v8, "parentID");
        _os_log_impl(&dword_211022000, v31, OS_LOG_TYPE_INFO, "Applying in-memory replace change for %zu bookmarks in folder %d", buf, 0x12u);

      }
      objc_msgSend(v8, "bookmarks");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __77__WebBookmarkCollection__applyInMemoryChange_fromChangeSet_updatedBookmarks___block_invoke;
      v46[3] = &unk_24CB32A28;
      v46[4] = self;
      objc_msgSend(v33, "safari_mapObjectsUsingBlock:", v46);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(v8, "parentID");
      v36 = objc_msgSend(v8, "specialFolderID");
      if ((_DWORD)v36)
      {
        -[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v37, "identifier");

      }
      -[WebBookmarkCollection _updateBookmarks:inFolderWithID:](self, "_updateBookmarks:inFolderWithID:", v34, v35);
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v38 = v34;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v43 != v40)
              objc_enumerationMutation(v38);
            -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:](self, "_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), 0, 1, (_QWORD)v42);
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v39);
      }

      objc_msgSend(v9, "removeChange:", v8);
      break;
    default:
      break;
  }

}

id __77__WebBookmarkCollection__applyInMemoryChange_fromChangeSet_updatedBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmarkWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v3, "isInserted") & 1) == 0)
    objc_msgSend(v3, "_setID:", objc_msgSend(v6, "identifier"));

  return v3;
}

uint64_t __70__WebBookmarkCollection__applyInMemoryChanges_postChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WebBookmarksDidReloadNotification"), *(_QWORD *)(a1 + 32), 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_postBookmarksChangedSyncNotification");
}

- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase");
    objc_msgSend(v6, "releaseLock");
  }

}

- (void)deleteBookmarkInMemory:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    v4 = objc_msgSend(v5, "parentID");
    -[WebBookmarkCollection _deleteBookmarkInMemory:](self, "_deleteBookmarkInMemory:", v5);
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v4);
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);
  }

}

- (void)deleteBookmarksInMemory:(id)a3 inFolder:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          -[WebBookmarkCollection _deleteBookmarkInMemory:](self, "_deleteBookmarkInMemory:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v4);
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);
  }

}

- (void)_deleteBookmarkInMemory:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "identifier");
  v6 = objc_msgSend(v4, "parentID");
  -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WebBookmarkChange deleteChangeWithBookmark:](WebBookmarkChange, "deleteChangeWithBookmark:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addChange:", v8);
  if ((objc_msgSend(v4, "isFolder") & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__WebBookmarkCollection__deleteBookmarkInMemory___block_invoke;
    v9[3] = &unk_24CB32A50;
    v10 = v7;
    -[WebBookmarkCollection _enumerateContentsOfBookmarkFolder:includingSubfolders:usingBlock:](self, "_enumerateContentsOfBookmarkFolder:includingSubfolders:usingBlock:", v5, 1, v9);

  }
  else
  {
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v6);
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);
  }

}

void __49__WebBookmarkCollection__deleteBookmarkInMemory___block_invoke(uint64_t a1, void *a2)
{
  WebBookmarkChange *v3;
  id v4;

  v4 = a2;
  v3 = -[WebBookmarkChange initWithBookmarkID:parentID:changeType:]([WebBookmarkChange alloc], "initWithBookmarkID:parentID:changeType:", objc_msgSend(v4, "identifier"), objc_msgSend(v4, "parentID"), 1);
  objc_msgSend(*(id *)(a1 + 32), "addChange:", v3);

}

- (void)addBookmarkInMemory:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "nextBookmarkIDForAddingBookmarkInMemory");
    v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 134218240;
      v12 = (int)v8;
      v13 = 2048;
      v14 = (int)v4;
      _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Adding bookmark in memory with identifier %ld to folder with identifier %ld", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(v6, "_setParentID:", v4);
    objc_msgSend(v6, "_setID:", v8);
    +[WebBookmarkChange bookmarkAddChangeWithBookmark:](WebBookmarkChange, "bookmarkAddChangeWithBookmark:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChange:", v10);

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v4);
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);

  }
}

- (void)modifyBookmarkInMemory:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WebBookmarkChange bookmarkModifyChangeWithBookmark:](WebBookmarkChange, "bookmarkModifyChangeWithBookmark:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addChange:", v5);

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v6, "parentID"));
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);
  }

}

- (void)moveBookmarkInMemory:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    +[WebBookmarkChange moveChangeWithBookmark:toFolderWithID:](WebBookmarkChange, "moveChangeWithBookmark:toFolderWithID:", v8, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChange:", v6);

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v8, "parentID"));
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v4);
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);

  }
}

- (void)reorderBookmarkInMemory:(id)a3 afterBookmark:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    +[WebBookmarkChange reorderChangeWithBookmark:afterBookmark:](WebBookmarkChange, "reorderChangeWithBookmark:afterBookmark:", v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addChange:", v7);

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", objc_msgSend(v9, "parentID"));
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);

  }
}

- (void)replaceBookmarksInMemory:(id)a3 inFolderWithID:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    +[WebBookmarkChange replaceChangeWithBookmarks:inFolderWithID:](WebBookmarkChange, "replaceChangeWithBookmarks:inFolderWithID:", v8, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _inMemoryChangeSet](self, "_inMemoryChangeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChange:", v6);

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", v4);
    -[WBDatabaseLockAcquisitor acquireLockWithTimeout:](self->_databaseLockAcquisitor, "acquireLockWithTimeout:", 60.0);

  }
}

- (BOOL)deduplicateBookmarks
{
  return -[WebBookmarkCollection deduplicateBookmarksWithRootFolder:depth:](self, "deduplicateBookmarksWithRootFolder:depth:", 0, 0);
}

- (BOOL)deduplicateBookmarksWithRootFolder:(int)a3 depth:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  BOOL v9;
  _BYTE v11[24];

  v5 = *(_QWORD *)&a3;
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v11, self->_db);
  v9 = -[WebBookmarkCollection _deduplicateBookmarksWithRootFolder:depth:trackChanges:considerBookmarksWithSyncDataAsUnique:davHomeURL:](self, "_deduplicateBookmarksWithRootFolder:depth:trackChanges:considerBookmarksWithSyncDataAsUnique:davHomeURL:", v5, a4, 1, 0, 0);
  if (v9)
  {
    WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v11, v7, v8);
    -[WebBookmarkCollection _postBookmarksDidReloadNotification](self, "_postBookmarksDidReloadNotification");
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v11);
  return v9;
}

- (BOOL)_deduplicateBookmarksForSyncingAndTrackChanges:(BOOL)a3 considerBookmarksWithSyncDataAsUnique:(BOOL)a4
{
  return -[WebBookmarkCollection _deduplicateBookmarksWithRootFolder:depth:trackChanges:considerBookmarksWithSyncDataAsUnique:davHomeURL:](self, "_deduplicateBookmarksWithRootFolder:depth:trackChanges:considerBookmarksWithSyncDataAsUnique:davHomeURL:", 0, 0, a3, a4, 0);
}

- (BOOL)_deduplicateBookmarksForBookmarkDAVWithHomeURL:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[WebBookmarkCollection _deduplicateBookmarksWithRootFolder:depth:trackChanges:considerBookmarksWithSyncDataAsUnique:davHomeURL:](self, "_deduplicateBookmarksWithRootFolder:depth:trackChanges:considerBookmarksWithSyncDataAsUnique:davHomeURL:", 0, 0, 1, 0, v4))
  {
    objc_msgSend(v4, "dataRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WebBookmarkCollection setSyncData:forKey:](self, "setSyncData:forKey:", v5, CFSTR("DAVHomeURL"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_needsDeduplicationForBookmarkDAVWithHomeURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[WebBookmarkCollection syncDataForKey:](self, "syncDataForKey:", CFSTR("DAVHomeURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithDataRepresentation:relativeToURL:", v5, 0);
    v7 = objc_msgSend(v4, "isEqual:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)_deduplicateBookmarksWithRootFolder:(int)a3 depth:(unint64_t)a4 trackChanges:(BOOL)a5 considerBookmarksWithSyncDataAsUnique:(BOOL)a6 davHomeURL:(id)a7
{
  uint64_t v8;
  void *v10;
  void *v11;
  WebBookmarks::BookmarkSQLStatement *v12;
  WebBookmarks::BookmarkSQLStatement *v13;
  const __CFString *v14;
  sqlite3 *db;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  sqlite3_stmt *v29;
  int v30;
  sqlite3_stmt *v31;
  sqlite3_stmt *v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  sqlite3_stmt *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  id v56;
  id v57;
  id v58;
  void (**v59)(void);
  void *v60;
  int64_t v61;
  WebBookmarks::BookmarkSQLStatement *v62;
  void *v63;
  WebBookmarks::BookmarkSQLStatement *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t i;
  id obj;
  WebBookmarks::BookmarkSQLStatement *v73;
  void *context;
  void *v75;
  void *v76;
  WebBookmarks::BookmarkSQLStatement *v77;
  unsigned int v78;
  id v79;
  id v80;
  id v81;
  _BOOL4 v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  WebBookmarkCollection *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[9];
  BOOL v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v82 = a6;
  v86 = a5;
  v8 = *(_QWORD *)&a3;
  v134 = *MEMORY[0x24BDAC8D0];
  v56 = a7;
  objc_msgSend(v56, "absoluteString");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0;
  v125 = &v124;
  v126 = 0x3032000000;
  v127 = __Block_byref_object_copy__2;
  v128 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v129 = (id)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__2;
  v122 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v123 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v125[5];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = self;
  objc_msgSend(v10, "addObject:", v11);

  v114 = 0;
  v115 = &v114;
  v116 = 0x2020000000;
  v117 = 0;
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v113 = 0;
  v108[0] = MEMORY[0x24BDAC760];
  v108[1] = 3221225472;
  v108[2] = __129__WebBookmarkCollection__deduplicateBookmarksWithRootFolder_depth_trackChanges_considerBookmarksWithSyncDataAsUnique_davHomeURL___block_invoke;
  v108[3] = &unk_24CB32A78;
  v108[4] = &v124;
  v108[5] = &v114;
  v109 = a4 == 0;
  v108[8] = a4;
  v108[6] = &v110;
  v108[7] = &v118;
  v59 = (void (**)(void))MEMORY[0x212BD4C84](v108);
  v12 = (WebBookmarks::BookmarkSQLStatement *)operator new();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(v12, self->_db, "DELETE FROM bookmarks WHERE id = ?");
  v13 = (WebBookmarks::BookmarkSQLStatement *)operator new();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(v13, self->_db, "SELECT num_children FROM bookmarks WHERE id = ?");
  v14 = &stru_24CB35168;
  if (v86)
    v14 = CFSTR(", modified_attributes = modified_attributes | ?4, dav_generation = ?5");
  v77 = v12;
  v73 = v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET parent = ?1, order_index = order_index + ?2%@ WHERE parent = ?3"), v14);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v64 = (WebBookmarks::BookmarkSQLStatement *)operator new();
  db = self->_db;
  v58 = objc_retainAutorelease(v57);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(v64, db, (const char *)objc_msgSend(v58, "UTF8String"));
  v62 = (WebBookmarks::BookmarkSQLStatement *)operator new();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(v62, self->_db, "UPDATE bookmarks SET num_children = num_children + (SELECT num_children FROM bookmarks WHERE id = ?) WHERE id = ?");
  v61 = -[WebBookmarkCollection currentRecordGeneration](self, "currentRecordGeneration");
  while (objc_msgSend((id)v125[5], "count"))
  {
    v60 = (void *)MEMORY[0x212BD4AC8]();
    objc_msgSend((id)v125[5], "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v125[5], "removeObjectAtIndex:", 0);
    if (objc_msgSend(v83, "containsObject:", v63))
    {
      v59[2]();
      v16 = 2;
      goto LABEL_81;
    }
    objc_msgSend(v83, "addObject:", v63);
    -[WebBookmarkCollection bookmarkWithID:](v91, "bookmarkWithID:", objc_msgSend(v63, "intValue"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    do
    {
      context = (void *)MEMORY[0x212BD4AC8]();
      -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:](v91, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", objc_msgSend(v67, "identifier"), 1, v78, 500);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v78 += 500;
      if (!objc_msgSend(v75, "count"))
      {
        v16 = 5;
        goto LABEL_51;
      }
      -[WebBookmarkCollection _appendDuplicateBookmarkGroupsInBookmarks:toGroups:considerBookmarksWithSyncDataAsUnique:davHomePath:](v91, "_appendDuplicateBookmarkGroupsInBookmarks:toGroups:considerBookmarksWithSyncDataAsUnique:davHomePath:", v75, v69, v82, v76);
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      obj = v69;
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
      if (!v65)
      {
        v16 = 0;
        goto LABEL_50;
      }
      v66 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v65; ++i)
        {
          if (*(_QWORD *)v105 != v66)
            objc_enumerationMutation(obj);
          v70 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          objc_msgSend(v70, "duplicates");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v68, "count");
          v18 = v17;
          v19 = *((unsigned __int8 *)v111 + 24);
          v20 = v19 == 0;
          v21 = v19 != 0;
          if (v20)
            v21 = v17 != 0;
          *((_BYTE *)v111 + 24) = v21;
          objc_msgSend(v70, "originalBookmark");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v80 = v68;
          v22 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v100, v132, 16);
          v78 -= v18;
          if (!v22)
            goto LABEL_44;
          v87 = *(void **)v101;
          while (2)
          {
            v23 = 0;
            v84 = v22;
            do
            {
              if (*(void **)v101 != v87)
                objc_enumerationMutation(v80);
              v24 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v23);
              v25 = (void *)MEMORY[0x212BD4AC8]();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v24, "identifier"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "addObject:", v26);

              if (!-[WebBookmarkCollection _mergeBookmark:withOriginalBookmark:prioritizeOriginalBookmarkAttributes:generateChangesIfNeeded:](v91, "_mergeBookmark:withOriginalBookmark:prioritizeOriginalBookmarkAttributes:generateChangesIfNeeded:", v24, v89, 1, v86))
              {
                v33 = 0;
                goto LABEL_41;
              }
              if (objc_msgSend(v24, "isFolder") && objc_msgSend(v89, "isFolder"))
              {
                v27 = v24;
                v28 = v89;
                v29 = (sqlite3_stmt *)*((_QWORD *)v73 + 1);
                sqlite3_reset(v29);
                sqlite3_clear_bindings(v29);
                sqlite3_bind_int(v29, 1, objc_msgSend(v28, "identifier"));
                if (sqlite3_step(v29) != 100)
                  goto LABEL_39;
                v30 = sqlite3_column_int(v29, 0);
                v31 = (sqlite3_stmt *)*((_QWORD *)v64 + 1);
                sqlite3_reset(v31);
                sqlite3_clear_bindings(v31);
                sqlite3_bind_int(v31, 1, objc_msgSend(v28, "identifier"));
                sqlite3_bind_int(v31, 2, v30);
                sqlite3_bind_int(v31, 3, objc_msgSend(v27, "identifier"));
                if (v86)
                {
                  sqlite3_bind_int(v31, 4, 64);
                  sqlite3_bind_int64(v31, 5, v61);
                }
                if (sqlite3_step(v31) != 101)
                {
LABEL_39:
                  v33 = 0;
                  goto LABEL_40;
                }
                v32 = (sqlite3_stmt *)*((_QWORD *)v62 + 1);
                sqlite3_reset(v32);
                sqlite3_clear_bindings(v32);
                sqlite3_bind_int(v32, 1, objc_msgSend(v27, "identifier"));
                sqlite3_bind_int(v32, 2, objc_msgSend(v28, "identifier"));
                v33 = sqlite3_step(v32) == 101;

                if (!v33)
                  goto LABEL_41;
              }
              v34 = v86
                 && -[WebBookmarkCollection _bookmark:hasCurrentDAVHomePath:](v91, "_bookmark:hasCurrentDAVHomePath:", v24, v76);
              v35 = v24;
              objc_msgSend(v35, "serverID");
              v28 = (id)objc_claimAutoreleasedReturnValue();
              if (v28)
                v36 = v34;
              else
                v36 = 0;
              if (v36)
              {
                v37 = objc_msgSend(v35, "itemType");
                v38 = objc_msgSend(v35, "subtype");
                -[WebBookmarkCollection _syncDataForBookmarkID:](v91, "_syncDataForBookmarkID:", objc_msgSend(v35, "identifier"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v37) = -[WebBookmarkCollection _insertTombstoneWithServerID:itemType:subtype:syncData:](v91, "_insertTombstoneWithServerID:itemType:subtype:syncData:", v28, v37, v38, v39);

                if ((v37 & 1) == 0)
                  goto LABEL_39;
              }
              v40 = (sqlite3_stmt *)*((_QWORD *)v77 + 1);
              sqlite3_reset(v40);
              sqlite3_clear_bindings(v40);
              sqlite3_bind_int(v40, 1, objc_msgSend(v35, "identifier"));
              v33 = sqlite3_step(v40) == 101;
LABEL_40:

LABEL_41:
              objc_autoreleasePoolPop(v25);
              if (!v33)
              {

                v16 = 1;
                goto LABEL_50;
              }
              ++v23;
            }
            while (v84 != v23);
            v22 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v100, v132, 16);
            if (v22)
              continue;
            break;
          }
LABEL_44:

          objc_msgSend(v70, "removeAllDuplicates");
        }
        v16 = 0;
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
      }
      while (v65);
LABEL_50:

LABEL_51:
      objc_autoreleasePoolPop(context);
    }
    while (!v16);
    if (v16 == 5)
    {
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v79 = v69;
      v41 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v96, v131, 16);
      if (v41)
      {
        v81 = *(id *)v97;
        do
        {
          v42 = 0;
          v85 = v41;
          do
          {
            if (*(id *)v97 != v81)
              objc_enumerationMutation(v79);
            v90 = v42;
            v43 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v42);
            v88 = (void *)MEMORY[0x212BD4AC8]();
            objc_msgSend(v43, "originalBookmark");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v44, "isFolder")
              && (!a4 || v115[3] < a4 || objc_msgSend(v43, "foundDuplicates")))
            {
              v45 = (void *)v119[5];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v44, "identifier"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v46);

            }
            if (v82)
            {
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              objc_msgSend(v43, "duplicatesToKeep");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v92, v130, 16);
              if (v48)
              {
                v49 = *(_QWORD *)v93;
                do
                {
                  for (j = 0; j != v48; ++j)
                  {
                    if (*(_QWORD *)v93 != v49)
                      objc_enumerationMutation(v47);
                    v51 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
                    if (objc_msgSend(v51, "isFolder")
                      && (!a4 || v115[3] < a4 || objc_msgSend(v43, "foundDuplicates")))
                    {
                      v52 = (void *)v119[5];
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v51, "identifier"));
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "addObject:", v53);

                    }
                  }
                  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v92, v130, 16);
                }
                while (v48);
              }

            }
            objc_autoreleasePoolPop(v88);
            v42 = v90 + 1;
          }
          while (v90 + 1 != v85);
          v41 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v96, v131, 16);
        }
        while (v41);
      }

      v59[2]();
      v16 = 0;
    }

LABEL_81:
    objc_autoreleasePoolPop(v60);
    self = v91;
    if ((v16 | 2) != 2)
    {
LABEL_86:
      v54 = 0;
      goto LABEL_87;
    }
  }
  if (!-[WebBookmarkCollection _deleteAndRebuildAncestorTableRecords](self, "_deleteAndRebuildAncestorTableRecords")
    || !-[WebBookmarkCollection _recalculateCachedChildrenCountAndOrderIndices](self, "_recalculateCachedChildrenCountAndOrderIndices"))
  {
    goto LABEL_86;
  }
  v54 = 1;
  self->_dirty = 1;
LABEL_87:
  (*(void (**)(WebBookmarks::BookmarkSQLStatement *))(*(_QWORD *)v62 + 8))(v62);
  (*(void (**)(WebBookmarks::BookmarkSQLStatement *))(*(_QWORD *)v64 + 8))(v64);

  (*(void (**)(WebBookmarks::BookmarkSQLStatement *))(*(_QWORD *)v73 + 8))(v73);
  (*(void (**)(WebBookmarks::BookmarkSQLStatement *))(*(_QWORD *)v77 + 8))(v77);

  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v124, 8);

  return v54;
}

void __129__WebBookmarkCollection__deduplicateBookmarksWithRootFolder_depth_trackChanges_considerBookmarksWithSyncDataAsUnique_davHomeURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (*(_BYTE *)(a1 + 72)
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= *(_QWORD *)(a1 + 64)
      || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
  }
}

- (BOOL)_deleteAndRebuildAncestorTableRecords
{
  BOOL v3;
  _BYTE v5[8];
  sqlite3_stmt *v6;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, "DELETE FROM folder_ancestors");
  v3 = sqlite3_step(v6) == 101 && -[WebBookmarkCollection _rebuildAncestorTable](self, "_rebuildAncestorTable");
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

- (BOOL)_recalculateCachedChildrenCountAndOrderIndices
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  WebBookmarkCollection *v19;
  void *v20;
  uint64_t v21;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[8];
  sqlite3_stmt *v28;
  _BYTE v29[8];
  sqlite3_stmt *pStmt;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", &unk_24CB4B1D0);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29, self->_db, "UPDATE bookmarks SET order_index = ? WHERE id = ?");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v27, self->_db, "UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS b WHERE b.parent = ? AND b.hidden = 0) WHERE id = ? AND type = 1");
  v4 = 0;
  v19 = self;
  v20 = v3;
  do
  {
    v5 = objc_msgSend(v3, "count", v19);
    if (!v5)
      break;
    context = (void *)MEMORY[0x212BD4AC8]();
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v7 = objc_msgSend(v6, "intValue");
    v8 = v7;
    if ((v4 & 1) == 0 || (_DWORD)v7)
    {
      if (!(v4 & 1 | v7))
        v4 = 1;
      -[WebBookmarkCollection _fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:](self, "_fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:", v7, 0, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v24;
        v21 = v5;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            sqlite3_reset(pStmt);
            sqlite3_clear_bindings(pStmt);
            sqlite3_bind_int(pStmt, 1, v13 + i);
            sqlite3_bind_int(pStmt, 2, objc_msgSend(v16, "intValue"));
            if (sqlite3_step(pStmt) != 101)
            {
              v9 = 1;
              v17 = v11;
              self = v19;
              v3 = v20;
              v5 = v21;
              goto LABEL_18;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          v13 += i;
          v3 = v20;
          v5 = v21;
          if (v12)
            continue;
          break;
        }
      }

      self = v19;
      -[WebBookmarkCollection _fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:](v19, "_fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:", v8, 1, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v17);
      sqlite3_reset(v28);
      sqlite3_clear_bindings(v28);
      sqlite3_bind_int(v28, 1, v8);
      sqlite3_bind_int(v28, 2, v8);
      v9 = sqlite3_step(v28) != 101;
LABEL_18:

    }
    else
    {
      v9 = 2;
    }

    objc_autoreleasePoolPop(context);
  }
  while ((v9 | 2) == 2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v27);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29);

  return v5 == 0;
}

- (BOOL)_bookmarkHasSyncedToServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    -[WebBookmarkCollection syncDataForBookmark:](self, "syncDataForBookmark:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "syncData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
  }

  return v6 != 0;
}

- (BOOL)_bookmark:(id)a3 hasPriorityOverBookmarkForDeduplication:(id)a4 prioritizeBookmarksWithSyncData:(BOOL)a5 davHomePath:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  int v13;
  int v14;
  BOOL v15;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v10, "specialID");
  v14 = objc_msgSend(v11, "specialID");
  if (v13 && !v14)
    goto LABEL_3;
  if (!v13 && v14)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  if (v7)
  {
    v17 = -[WebBookmarkCollection _bookmarkHasSyncedToServer:](self, "_bookmarkHasSyncedToServer:", v10);
    v18 = -[WebBookmarkCollection _bookmarkHasSyncedToServer:](self, "_bookmarkHasSyncedToServer:", v11);
    if (v17 && !v18)
      goto LABEL_3;
    if (!v17 && v18)
      goto LABEL_6;
  }
  v19 = -[WebBookmarkCollection _bookmark:hasCurrentDAVHomePath:](self, "_bookmark:hasCurrentDAVHomePath:", v10, v12);
  v20 = -[WebBookmarkCollection _bookmark:hasCurrentDAVHomePath:](self, "_bookmark:hasCurrentDAVHomePath:", v11, v12);
  if (!v19 || v20)
  {
    if (!v19 && v20)
      goto LABEL_6;
    objc_msgSend(v10, "serverID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "length");
    v24 = objc_msgSend(v22, "length");
    if (v23 && !v24)
      goto LABEL_15;
    if (v23 || !v24)
    {
      v25 = objc_msgSend(v21, "safari_isSpecialFolderRecordName");
      v26 = objc_msgSend(v22, "safari_isSpecialFolderRecordName");
      if (((v25 ^ 1 | v26) & 1) == 0)
      {
LABEL_15:
        v15 = 1;
LABEL_19:

        goto LABEL_7;
      }
      if ((v25 | v26 ^ 1) == 1)
      {
        v15 = objc_msgSend(v21, "compare:", v22) == -1;
        goto LABEL_19;
      }
    }
    v15 = 0;
    goto LABEL_19;
  }
LABEL_3:
  v15 = 1;
LABEL_7:

  return v15;
}

- (BOOL)_bookmark:(id)a3 hasCurrentDAVHomePath:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "serverID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    if (v5)
      v7 = objc_msgSend(v6, "_webBookmarks_hasCaseInsensitivePrefix:", v5);
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_appendDuplicateBookmarkGroupsInBookmarks:(id)a3 toGroups:(id)a4 considerBookmarksWithSyncDataAsUnique:(BOOL)a5 davHomePath:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  BOOL v21;
  _BOOL8 v22;
  uint64_t v23;
  WBDuplicateBookmarkGroup *v24;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v32 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v27 = a4;
  v30 = a6;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      v28 = v10;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v11);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v31 = v27;
        v13 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        v29 = v11;
        if (!v13)
        {

LABEL_26:
          v24 = -[WBDuplicateBookmarkGroup initWithOriginalBookmark:]([WBDuplicateBookmarkGroup alloc], "initWithOriginalBookmark:", v12);
          objc_msgSend(v31, "addObject:", v24);

          goto LABEL_27;
        }
        v14 = 0;
        v15 = *(_QWORD *)v34;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v31);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
            v18 = (void *)MEMORY[0x212BD4AC8]();
            objc_msgSend(v17, "originalBookmark");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[WebBookmarkCollection _bookmark:isDuplicateOfBookmark:](self, "_bookmark:isDuplicateOfBookmark:", v12, v19);
            v21 = v20;
            if (v20)
            {
              v22 = -[WebBookmarkCollection _bookmark:hasPriorityOverBookmarkForDeduplication:prioritizeBookmarksWithSyncData:davHomePath:](self, "_bookmark:hasPriorityOverBookmarkForDeduplication:prioritizeBookmarksWithSyncData:davHomePath:", v12, v19, v32, v30);
              if (v32)
              {
                if (-[WebBookmarkCollection _bookmarkHasSyncedToServer:](self, "_bookmarkHasSyncedToServer:", v19)
                  && v22)
                {
                  objc_msgSend(v17, "addDuplicateBookmarkToKeep:", v19);
                  objc_msgSend(v17, "exchangeOriginalBookmarkWithBookmark:", v12);
LABEL_17:
                  v14 = 1;
                  goto LABEL_18;
                }
                if (!(-[WebBookmarkCollection _bookmarkHasSyncedToServer:](self, "_bookmarkHasSyncedToServer:", v12) ^ 1 | v22))
                {
                  objc_msgSend(v17, "addDuplicateBookmarkToKeep:", v12);
                  goto LABEL_17;
                }
              }
              objc_msgSend(v17, "addDuplicateBookmark:replaceOriginal:", v12, v22);
              goto LABEL_17;
            }
LABEL_18:

            objc_autoreleasePoolPop(v18);
            if (v21)
              goto LABEL_23;
            ++v16;
          }
          while (v13 != v16);
          v23 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          v13 = v23;
        }
        while (v23);
LABEL_23:

        if ((v14 & 1) == 0)
          goto LABEL_26;
LABEL_27:
        v11 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);
  }

}

- (BOOL)_bookmark:(id)a3 isDuplicateOfBookmark:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isFolder");
  if (v7 != objc_msgSend(v5, "isFolder")
    || (v8 = objc_msgSend(v6, "identifier"), v8 == objc_msgSend(v5, "identifier"))
    || !objc_msgSend(v6, "isSyncable")
    || !objc_msgSend(v5, "isSyncable"))
  {
    v14 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "serverID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_wb_stringByStandardizingDAVServerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_wb_stringByStandardizingDAVServerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v5, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v16)
    {

    }
    else
    {
      objc_msgSend(v6, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        v14 = 0;
LABEL_20:

        goto LABEL_8;
      }
    }
    objc_msgSend(v5, "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isFolder") & 1) != 0)
    {
      LOBYTE(v22) = 0;
    }
    else
    {
      objc_msgSend(v6, "address");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v23)
      {
        LOBYTE(v22) = 0;
      }
      else
      {
        objc_msgSend(v6, "address");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v24, "isEqualToString:", v21) ^ 1;

      }
    }
    v14 = v22 ^ 1;

    goto LABEL_20;
  }
  v14 = 1;
LABEL_8:

  return v14;
}

- (id)_fetchBookmarkIDsInFolder:(int)a3 onlyFolders:(BOOL)a4 includingHiddenBookmarks:(BOOL)a5
{
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[8];
  sqlite3_stmt *v14;

  v7 = &stru_24CB35168;
  v8 = CFSTR(" AND type = 1");
  if (!a4)
    v8 = &stru_24CB35168;
  if (!a5)
    v7 = CFSTR(" AND hidden = 0");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parent = ?%@%@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v13, -[WebBookmarkCollection _selectBookmarksWhere:returnType:](self, "_selectBookmarksWhere:returnType:", v9, 1));
  sqlite3_bind_int(v14, 1, a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  while (sqlite3_step(v14) == 100)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(v14, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

  return v10;
}

- (BOOL)_mergeBookmark:(id)a3 withOriginalBookmark:(id)a4 prioritizeOriginalBookmarkAttributes:(BOOL)a5 generateChangesIfNeeded:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned int v39;
  _BOOL4 v40;

  v6 = a6;
  v40 = a5;
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v10, "specialID"))
  {
    objc_msgSend(v10, "isSelectedFavoritesFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v12, "BOOLValue");

    if ((objc_msgSend(v9, "isFolder") & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v10, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v9, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    objc_msgSend(v10, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v17 - 1 >= v19)
    {
LABEL_7:
      v21 = 0;
    }
    else
    {
      objc_msgSend(v9, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v20);

      v21 = 1;
    }
    if ((objc_msgSend(v9, "isFolder") & 1) == 0)
    {
      objc_msgSend(v10, "address");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "address");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v9, "address");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAddress:", v25);

        v21 = 1;
      }
    }
    objc_msgSend(v10, "extraAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extraAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "count");
    v29 = objc_msgSend(v27, "count");
    if (v28 || !v29)
    {
      if (v28 && !v29)
        goto LABEL_17;
      if (!v29 || !v28 || (objc_msgSend(v27, "isEqualToDictionary:", v26) & 1) != 0)
      {
LABEL_18:
        objc_msgSend(v10, "localAttributes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localAttributes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "count");
        v34 = objc_msgSend(v32, "count");
        if (v33 || !v34)
        {
          if (v33 && !v34)
            goto LABEL_24;
          if (!v34 || !v33 || (objc_msgSend(v32, "isEqualToDictionary:", v31) & 1) != 0)
            goto LABEL_25;
          if (v40)
          {
            v35 = (void *)objc_msgSend(v32, "mutableCopy");
            objc_msgSend(v35, "addEntriesFromDictionary:", v31);
          }
          else
          {
            v35 = (void *)objc_msgSend(v31, "mutableCopy");
            objc_msgSend(v35, "addEntriesFromDictionary:", v32);
          }
          objc_msgSend(v10, "setLocalAttributes:", v35);
        }
        else
        {
          objc_msgSend(v9, "localAttributes");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setLocalAttributes:", v35);
        }

LABEL_24:
        v21 = 1;
LABEL_25:
        objc_msgSend(v10, "cleanUpRedundantPreviewText");
        v11 = -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v10, 0, v21 & v6);
        v36 = objc_msgSend(v10, "identifier");
        objc_msgSend(v10, "isSelectedFavoritesFolder");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:](self, "updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:", v36, v39, objc_msgSend(v37, "BOOLValue"));

        goto LABEL_26;
      }
      if (v40)
      {
        v30 = (void *)objc_msgSend(v27, "mutableCopy");
        objc_msgSend(v30, "addEntriesFromDictionary:", v26);
      }
      else
      {
        v30 = (void *)objc_msgSend(v26, "mutableCopy");
        objc_msgSend(v30, "addEntriesFromDictionary:", v27);
      }
      objc_msgSend(v10, "setExtraAttributes:", v30);
    }
    else
    {
      objc_msgSend(v9, "extraAttributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExtraAttributes:", v30);
    }

LABEL_17:
    v21 = 1;
    goto LABEL_18;
  }
  v11 = 1;
LABEL_26:

  return v11;
}

- (void)updateSelectedFavoritesFolderWithBookmarkID:(int)a3 wasFavoritesFolder:(BOOL)a4 isFavoritesFolder:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;

  v5 = a5;
  v6 = a4;
  +[WBFeatureManager sharedFeatureManager](WBFeatureManager, "sharedFeatureManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "favoritesFolderSelectionShouldSync");

  if (((v6 || v5) & v10 & 1) != 0)
  {
    if (!v6
      || v5
      || (-[WebBookmarkCollection favoritesFolder](self, "favoritesFolder"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "identifier"),
          v11,
          v12 == a3))
    {
      if (v5)
        v13 = a3;
      else
        v13 = 0;
      -[WebBookmarkCollection setFavoritesFolderIdentifier:postChangeNotification:](self, "setFavoritesFolderIdentifier:postChangeNotification:", v13, 0);
    }
  }
}

- (BOOL)_usesCloudKit
{
  return -[WebBookmarkCollection _syncType](self, "_syncType") == 1;
}

- (BOOL)setLocalMigrationState:(int64_t)a3 generateDeviceIdentifierIfNeeded:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  sqlite3_stmt *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  _BYTE v19[8];
  sqlite3_stmt *v20;
  char v21;

  objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(CFSTR("_ck_local_migration_state_"), "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    if (-[WebBookmarkCollection _syncSetString:forKey:updatedExistingKey:](self, "_syncSetString:forKey:updatedExistingKey:", v10, v9, &v21))
    {
      if (v21)
      {
        LOBYTE(v11) = 1;
        self->_dirty = 1;
      }
      else
      {
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, self->_db, "DELETE FROM sync_properties WHERE key != ? AND key LIKE ?");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%%"), CFSTR("_ck_local_migration_state_"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        sqlite3_bind_text(v20, 1, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v11 = v20;
        v14 = objc_retainAutorelease(v13);
        sqlite3_bind_text(v11, 2, (const char *)objc_msgSend(v14, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v15 = sqlite3_step(v20);
        LOBYTE(v11) = v15 == 101;
        if (v15 == 101)
        {
          self->_dirty = 1;
        }
        else
        {
          v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[WebBookmarkCollection setLocalMigrationState:generateDeviceIdentifierIfNeeded:].cold.1();
        }

        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);
      }
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection setLocalMigrationState:generateDeviceIdentifierIfNeeded:].cold.2();
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LODWORD(v11) = objc_msgSend(v6, "encounteredErrorWhileObtainingUUID") ^ 1;
  }

  return (char)v11;
}

- (NSData)deprecatedUsernameAccountHash
{
  return (NSData *)-[WebBookmarkCollection syncDataForKey:](self, "syncDataForKey:", CFSTR("AccountHash"));
}

- (NSData)accountHash
{
  return (NSData *)-[WebBookmarkCollection syncDataForKey:](self, "syncDataForKey:", CFSTR("AccountDSIDHash"));
}

- (BOOL)updateAccountHash:(id)a3
{
  return -[WebBookmarkCollection setSyncData:forKey:](self, "setSyncData:forKey:", a3, CFSTR("AccountDSIDHash"));
}

- (id)syncableBookmarksIDsInFolderWithBookmarkID:(int)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;

  -[WebBookmarkCollection logRegulatoryBookmarksRead](self, "logRegulatoryBookmarksRead");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT id from bookmarks where parent = ? AND deleted = 0 AND syncable = 1");
  if (!v12)
    goto LABEL_7;
  sqlite3_bind_int(v11, 1, a3);
  while (1)
  {
    v6 = sqlite3_step(v11);
    if (v6 != 100)
      break;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(v11, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (v6 == 101)
    v8 = v5;
  else
LABEL_7:
    v8 = 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (unsigned)orderIndexOfBookmark:(id)a3 withSyncPosition:(id)a4 inFolderWithID:(int)a5
{
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _BYTE v17[8];
  sqlite3_stmt *v18;

  v8 = a3;
  v9 = a4;
  v10 = -[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata");
  if (v9)
    v11 = v10;
  else
    v11 = 0;
  if (v11)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, self->_db, "SELECT sync_data, order_index FROM bookmarks WHERE special_id = 0 AND syncable = 1 AND deleted = 0 AND parent = ? AND id != ? ORDER BY order_index DESC");
    sqlite3_bind_int(v18, 1, a5);
    sqlite3_bind_int(v18, 2, objc_msgSend(v8, "identifier"));
    v12 = 0;
    while (sqlite3_step(v18) == 100)
    {
      WBDataFromNullableColumn(v18, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBBookmarkSyncData positionFromContentsOfData:](WBBookmarkSyncData, "positionFromContentsOfData:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v14;
      if (objc_msgSend(v14, "compare:", v9) == -1)
      {
        v15 = sqlite3_column_int(v18, 1) + 1;
        v12 = v14;
        goto LABEL_11;
      }
    }
    v15 = 0;
LABEL_11:

    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);
  }
  else
  {
    v15 = -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v8);
  }

  return v15;
}

- (id)_positionBeforeBookmark:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WebBookmarkCollection _positionBeforeOrderIndex:inFolderWithID:](self, "_positionBeforeOrderIndex:inFolderWithID:", -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v4), objc_msgSend(v4, "parentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_positionBeforeOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4
{
  void *v6;
  void *v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT sync_data FROM bookmarks WHERE special_id = 0 AND syncable = 1 AND deleted = 0 AND parent = ? AND order_index < ? ORDER BY order_index DESC");
  sqlite3_bind_int(v10, 1, a4);
  sqlite3_bind_int(v10, 2, a3);
  while (sqlite3_step(v10) == 100)
  {
    WBDataFromNullableColumn(v10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBookmarkSyncData positionFromContentsOfData:](WBBookmarkSyncData, "positionFromContentsOfData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
  }
  v7 = 0;
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v7;
}

- (id)_positionAfterBookmark:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WebBookmarkCollection _positionAfterOrderIndex:inFolderWithID:](self, "_positionAfterOrderIndex:inFolderWithID:", -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v4), objc_msgSend(v4, "parentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_positionAfterOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4
{
  void *v6;
  void *v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT sync_data FROM bookmarks WHERE special_id = 0 AND syncable = 1 AND deleted = 0 AND parent = ? AND order_index > ? ORDER BY order_index ASC");
  sqlite3_bind_int(v10, 1, a4);
  sqlite3_bind_int(v10, 2, a3);
  while (sqlite3_step(v10) == 100)
  {
    WBDataFromNullableColumn(v10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBookmarkSyncData positionFromContentsOfData:](WBBookmarkSyncData, "positionFromContentsOfData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
  }
  v7 = 0;
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v7;
}

- (id)_generateSyncPositionForOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4 direction:(int64_t)a5
{
  uint64_t v6;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  if (!-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    return 0;
  v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109376;
    v19[1] = a3;
    v20 = 1024;
    v21 = v6;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Generating position for order index %d in folder id %d", (uint8_t *)v19, 0xEu);
  }
  v10 = a5 != -1;
  if (a5 == -1)
    v11 = a3 + 1;
  else
    v11 = a3;
  -[WebBookmarkCollection _positionBeforeOrderIndex:inFolderWithID:](self, "_positionBeforeOrderIndex:inFolderWithID:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _positionAfterOrderIndex:inFolderWithID:](self, "_positionAfterOrderIndex:inFolderWithID:", a3 - v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE830D8], "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v12, v13, v16, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)generateSyncPositionForBookmark:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WebBookmarkCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v4;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "Generating position for bookmark %{public}@", (uint8_t *)&v13, 0xCu);
    }
    -[WebBookmarkCollection _positionBeforeBookmark:](self, "_positionBeforeBookmark:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _positionAfterBookmark:](self, "_positionAfterBookmark:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE830D8], "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v6, v7, v10, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WBBookmarkDatabaseSyncData)databaseSyncData
{
  void *v2;
  void *v3;

  -[WebBookmarkCollection syncDataForKey:](self, "syncDataForKey:", CFSTR("BASyncData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:](WBBookmarkDatabaseSyncData, "databaseSyncDataWithContentsOfData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBBookmarkDatabaseSyncData *)v3;
}

- (BOOL)saveDatabaseSyncData:(id)a3
{
  void *v4;

  objc_msgSend(a3, "encodedDatabaseSyncData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WebBookmarkCollection setSyncData:forKey:](self, "setSyncData:forKey:", v4, CFSTR("BASyncData"));

  return (char)self;
}

- (BOOL)clearSyncDataAfterICloudKeychainReset
{
  NSObject *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Clearing sync data because the user has reset the iCloud Keychain.", buf, 2u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__WebBookmarkCollection_clearSyncDataAfterICloudKeychainReset__block_invoke;
  v5[3] = &unk_24CB31E10;
  v5[4] = self;
  return -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v5, 0);
}

uint64_t __62__WebBookmarkCollection_clearSyncDataAfterICloudKeychainReset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSyncDataAfterICloudKeychainReset");
}

- (BOOL)_clearSyncDataAfterICloudKeychainReset
{
  BOOL v3;
  int v4;
  NSObject *v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[WebBookmarkCollection setLastSyncedRecordGeneration:](self, "setLastSyncedRecordGeneration:", 0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__WebBookmarkCollection__clearSyncDataAfterICloudKeychainReset__block_invoke;
  v9[3] = &unk_24CB31E98;
  v9[4] = self;
  v9[5] = &v10;
  -[WebBookmarkCollection enumerateDescendantsOfBookmarkID:usingBlock:](self, "enumerateDescendantsOfBookmarkID:usingBlock:", 0, v9);
  if (*((_BYTE *)v11 + 24))
  {
    v3 = 0;
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "UPDATE bookmarks SET added = 1");
    v4 = sqlite3_step(v8);
    v3 = v4 == 101;
    if (v4 != 101)
    {
      v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection _clearAllSyncData].cold.1();
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  }
  _Block_object_dispose(&v10, 8);
  return v3;
}

void __63__WebBookmarkCollection__clearSyncDataAfterICloudKeychainReset__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(v5, "isSyncable") & 1) != 0)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), (const char *)objc_msgSend(CFSTR("UPDATE bookmarks SET dav_generation = ? WHERE id = ?"), "UTF8String"));
    sqlite3_bind_int64(v8, 1, objc_msgSend(*(id *)(a1 + 32), "currentRecordGeneration"));
    sqlite3_bind_int(v8, 2, objc_msgSend(v5, "identifier"));
    if ((objc_msgSend(*(id *)(a1 + 32), "updateSyncDataForBookmark:usingBlock:", v5, &__block_literal_global_796) & 1) != 0)
    {
      if (sqlite3_step(v8) == 101)
      {
        objc_msgSend(*(id *)(a1 + 32), "_incrementGeneration");
LABEL_10:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
        goto LABEL_11;
      }
      v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_1();
      }
    }
    else
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_2();
      }
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_10;
  }
LABEL_11:

}

id __63__WebBookmarkCollection__clearSyncDataAfterICloudKeychainReset__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "clearAllCKRecords");
  return v2;
}

- (BOOL)updateDatabaseSyncDataUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__WebBookmarkCollection_updateDatabaseSyncDataUsingBlock___block_invoke;
  v7[3] = &unk_24CB32AE0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v7, 0);

  return (char)self;
}

uint64_t __58__WebBookmarkCollection_updateDatabaseSyncDataUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  WBBookmarkDatabaseSyncData *v3;
  WBBookmarkDatabaseSyncData *v4;
  void *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "databaseSyncData");
  v3 = (WBBookmarkDatabaseSyncData *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v4 = objc_alloc_init(WBBookmarkDatabaseSyncData);
  (*(void (**)(uint64_t, WBBookmarkDatabaseSyncData *))(v2 + 16))(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  if (v5)
    v6 = objc_msgSend(*(id *)(a1 + 32), "saveDatabaseSyncData:", v5);
  else
    v6 = 1;

  return v6;
}

- (int64_t)nextDatabaseSyncChangeID
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__WebBookmarkCollection_nextDatabaseSyncChangeID__block_invoke;
  v4[3] = &unk_24CB32B08;
  v4[4] = &v5;
  -[WebBookmarkCollection updateDatabaseSyncDataUsingBlock:](self, "updateDatabaseSyncDataUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __49__WebBookmarkCollection_nextDatabaseSyncChangeID__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "nextChangeID");
  return v3;
}

- (id)modifiedSyncingAttributesForBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[WebBookmarkCollection allSyncingAttributesForBookmark:](self, "allSyncingAttributesForBookmark:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  +[WebBookmark modifiedAttributesToFieldNames](WebBookmark, "modifiedAttributesToFieldNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__WebBookmarkCollection_modifiedSyncingAttributesForBookmark___block_invoke;
  v13[3] = &unk_24CB32B30;
  v8 = v4;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v9;

  return v11;
}

void __62__WebBookmarkCollection_modifiedSyncingAttributesForBookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_fieldsForAttributes:", objc_msgSend(v9, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "_attributesForField:", v7);
  if ((objc_msgSend(*(id *)(a1 + 32), "modifiedAttributes") & v8) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v5);

}

- (id)allSyncingAttributesForBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
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
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("Deleted"));
  if (!v6)

  if (objc_msgSend(v6, "integerValue") == 1)
  {
    v8 = v5;
    goto LABEL_93;
  }
  v9 = objc_msgSend(v4, "parentID");
  if ((_DWORD)v9 == -[WebBookmarkCollection bookmarkIDWithSpecialID:](self, "bookmarkIDWithSpecialID:", 6))
  {
    v10 = 0;
  }
  else
  {
    -[WebBookmarkCollection _serverIDForBookmarkID:generateIfNeeded:](self, "_serverIDForBookmarkID:generateIfNeeded:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "minimumSyncAPIVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_24CB4B1E8;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("MinimumAPIVersion"));

  if ((objc_msgSend(v4, "isFolder") & 1) != 0 || !objc_msgSend(v4, "isPinned"))
  {
    objc_msgSend(v4, "title");
    v19 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v19;
    if (v19)
    {
      v18 = 0;
      v17 = 0;
      v16 = 1;
      v14 = (void *)v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v15 = 0;
      v16 = 1;
      v17 = 1;
    }
  }
  else
  {
    objc_msgSend(v4, "pinnedTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 1;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("Title"));
  if (v17)
  {

    if (!v16)
      goto LABEL_21;
LABEL_61:

    if (!v18)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (v16)
    goto LABEL_61;
LABEL_21:
  if (v18)
LABEL_22:

LABEL_23:
  -[WebBookmarkCollection syncDataForBookmark:](self, "syncDataForBookmark:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "positionDictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("Position"));
  if (!v21)

  v23 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("ParentFolder"));
  if (!v10)

  -[WebBookmarkCollection serverIDForBookmarkID:](self, "serverIDForBookmarkID:", objc_msgSend(v4, "lastSelectedChildID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("LastSelectedTab"));
  if (!v24)

  objc_msgSend(v4, "extraAttributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SymbolImageName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("SymbolImageName"));
  if (!v27)

  objc_msgSend(v4, "extraAttributes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CustomFavoritesFolderServerID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("CustomFavoritesFolderServerID"));
  if (!v30)

  objc_msgSend(v4, "startPageSectionsDataRepresentation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("CustomStartPageSectionsData"));
  if (!v32)

  objc_msgSend(v4, "UUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "safari_startPageBackgroundImageFileURLForIdentifier:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend(v36, "checkResourceIsReachableAndReturnError:", 0);
    v38 = v36;
    if ((v37 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("BackgroundImage"));
    if ((v37 & 1) == 0)

  }
  objc_msgSend(v4, "extraAttributes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safari_numberForKey:", CFSTR("com.apple.bookmarks.SelectedFavoritesFolder"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("IsSelectedFavoritesFolder"));
  if (!v40)

  if ((objc_msgSend(v4, "isFolder") & 1) != 0 || !objc_msgSend(v4, "isPinned"))
  {
    objc_msgSend(v4, "address");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "pinnedAddress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = v42;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (!v44)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("URL"));
  if (!v44)

  objc_msgSend(v4, "dateAdded");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("DateAdded"));
  if (!v46)

  objc_msgSend(v4, "dateLastViewed");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("DateLastViewed"));
  if (!v48)

  objc_msgSend(v4, "previewText");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("PreviewText"));
  if (!v50)

  objc_msgSend(v4, "readingListIconURL");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("ImageURL"));
  if (!v52)

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isPinned"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("IsPinned"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "showIconOnly"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("ShowIconOnly"));

  objc_msgSend(v4, "creationDeviceIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("CreationDeviceIdentifier"));
  if (!v56)

  objc_msgSend(v4, "deviceTypeIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v59, CFSTR("DeviceTypeIdentifier"));
  if (!v58)

  v60 = v5;
LABEL_93:

  return v5;
}

- (id)_syncDataForBookmarkID:(int)a3
{
  void *v4;
  _BYTE v6[8];
  sqlite3_stmt *v7;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "SELECT sync_data FROM bookmarks WHERE id = ?");
  sqlite3_bind_int(v7, 1, a3);
  if (sqlite3_step(v7) == 100)
  {
    WBDataFromNullableColumn(v7, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (id)_syncDataBlobForBookmarkServerID:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT sync_data FROM bookmarks WHERE server_id = ?");
  v5 = v10;
  v6 = objc_retainAutorelease(v4);
  sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v10) == 100)
  {
    WBDataFromNullableColumn(v10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);

  return v7;
}

- (id)syncDataForBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "serverID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[WebBookmarkCollection _syncDataForBookmarkServerID:](self, "_syncDataForBookmarkServerID:", v5);
  else
    -[WebBookmarkCollection syncDataForBookmarkID:](self, "syncDataForBookmarkID:", objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)syncDataForBookmarkID:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  WBBookmarkSyncData *v6;
  WBBookmarkSyncData *v7;

  -[WebBookmarkCollection _syncDataForBookmarkID:](self, "_syncDataForBookmarkID:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBookmarkSyncData syncDataWithContentsOfData:](WBBookmarkSyncData, "syncDataWithContentsOfData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(WBBookmarkSyncData);
  v7 = v6;

  return v7;
}

- (id)_syncDataForBookmarkServerID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  WBBookmarkSyncData *v6;
  WBBookmarkSyncData *v7;

  -[WebBookmarkCollection _syncDataBlobForBookmarkServerID:](self, "_syncDataBlobForBookmarkServerID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBookmarkSyncData syncDataWithContentsOfData:](WBBookmarkSyncData, "syncDataWithContentsOfData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(WBBookmarkSyncData);
  v7 = v6;

  return v7;
}

- (BOOL)updateSyncDataForBookmarkWithRecordName:(id)a3 excludeDeletedBookmarks:(BOOL)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke;
  v13[3] = &unk_24CB32B80;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  LOBYTE(self) = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v13, 0);

  return (char)self;
}

uint64_t __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "bookmarkWithServerID:excludeDeletedBookmarks:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke_2;
    v6[3] = &unk_24CB32B58;
    v8 = *(id *)(a1 + 48);
    v7 = v2;
    v4 = objc_msgSend(v3, "updateSyncDataForBookmark:usingBlock:", v7, v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateDescendantsOfBookmark:(id)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = objc_msgSend(a3, "identifier");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__WebBookmarkCollection_enumerateDescendantsOfBookmark_usingBlock___block_invoke;
  v9[3] = &unk_24CB32BA8;
  v8 = v6;
  v10 = v8;
  -[WebBookmarkCollection _enumerateContentsOfBookmarkFolder:includingSubfolders:usingBlock:](self, "_enumerateContentsOfBookmarkFolder:includingSubfolders:usingBlock:", v7, 1, v9);

}

uint64_t __67__WebBookmarkCollection_enumerateDescendantsOfBookmark_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)markAttributesAsModified:(unint64_t)a3 forBookmark:(id)a4
{
  id v6;
  _BYTE v8[8];
  sqlite3_stmt *v9;

  v6 = a4;
  objc_msgSend(v6, "markAttributesAsModified:", a3);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "UPDATE bookmarks SET modified_attributes = modified_attributes | ? WHERE id = ?");
  sqlite3_bind_int64(v9, 1, objc_msgSend(v6, "modifiedAttributes"));
  sqlite3_bind_int(v9, 2, objc_msgSend(v6, "identifier"));
  LOBYTE(self) = sqlite3_step(v9) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return (char)self;
}

id __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  id v18;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_2;
  v16[3] = &unk_24CB316B8;
  v6 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v7 = v3;
  v18 = v7;
  objc_msgSend(v4, "setHandler:", v16);
  objc_msgSend(*(id *)(a1 + 40), "syncPosition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "safari_containsObjectPassingTest:", &__block_literal_global_845) & 1) != 0)
  {
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_4;
    v15[3] = &unk_24CB32C10;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "safari_mapObjectsUsingBlock:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE830D8]), "initWithSortValues:", v10);
    objc_msgSend(v7, "setPosition:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setSyncPosition:incrementGeneration:", v11, 0);
    v12 = v7;

  }
  else
  {
    objc_msgSend(v7, "setPosition:", v8);
    v13 = v7;
  }

  return v7;
}

void __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_2(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "serverIDForBookmarkID:", objc_msgSend(a1[5], "parentID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", v3);
  else
    v2 = 0;
  objc_msgSend(a1[6], "setParentRecordID:", v2);
  if (v3)

}

unint64_t __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_3(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "changeID") >> 63;
}

id __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "changeID") < 0)
  {
    objc_msgSend(v3, "positionSortValueWithChangeID:", objc_msgSend(*(id *)(a1 + 32), "nextDatabaseSyncChangeID"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)fixRecoveredBookmarksIfNeeded
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5_0();
  *v1 = 138543362;
  *v3 = v2;
  OUTLINED_FUNCTION_3(&dword_211022000, v5, (uint64_t)v3, "Error fixing recovered bookmark: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (int64_t)firstSkippedProfileGeneration
{
  void *v2;
  int64_t v3;

  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("FirstSkippedProfileGeneration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)didSkipProfileWithGeneration:(int64_t)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("FirstSkippedProfileGeneration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (!v5 || (v6 = objc_msgSend(v5, "integerValue") <= a3, v7 = v10, !v6))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v9, CFSTR("FirstSkippedProfileGeneration"));

    v7 = v10;
  }

}

- (void)clearFirstSkippedProfileGeneration
{
  -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", 0, CFSTR("FirstSkippedProfileGeneration"));
}

- (int64_t)firstSkippedProfileDeviceGeneration
{
  void *v2;
  int64_t v3;

  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("FirstSkippedProfileDeviceGeneration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)didSkipProfileDeviceWithGeneration:(int64_t)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("FirstSkippedProfileDeviceGeneration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (!v5 || (v6 = objc_msgSend(v5, "integerValue") <= a3, v7 = v10, !v6))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v9, CFSTR("FirstSkippedProfileDeviceGeneration"));

    v7 = v10;
  }

}

- (void)clearFirstSkippedProfileDeviceGeneration
{
  -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", 0, CFSTR("FirstSkippedProfileDeviceGeneration"));
}

- (void)saveMinimumAPISyncVersionOfDescendantItemsForItem:(id)a3 includingAncestorItem:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _QWORD v8[5];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "markAttributesAsModified:", 0x8000);
    -[WebBookmarkCollection saveBookmark:incrementGenerations:](self, "saveBookmark:incrementGenerations:", v7, 1);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __97__WebBookmarkCollection_saveMinimumAPISyncVersionOfDescendantItemsForItem_includingAncestorItem___block_invoke;
  v8[3] = &unk_24CB32C60;
  v8[4] = self;
  -[WebBookmarkCollection enumerateDescendantsOfBookmark:usingBlock:](self, "enumerateDescendantsOfBookmark:usingBlock:", v7, v8);

}

void __97__WebBookmarkCollection_saveMinimumAPISyncVersionOfDescendantItemsForItem_includingAncestorItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "markAttributesAsModified:", 0x8000);
  objc_msgSend(*(id *)(a1 + 32), "saveBookmark:incrementGenerations:", v3, 1);

}

- (void)_test_preventPeriodicallyApplyingInMemoryChangesToDatabase
{
  WBDatabaseLockAcquisitor *databaseLockAcquisitor;

  -[WBDatabaseLockAcquisitor releaseLock](self->_databaseLockAcquisitor, "releaseLock");
  databaseLockAcquisitor = self->_databaseLockAcquisitor;
  self->_databaseLockAcquisitor = 0;

}

- (void)test_restoreMissingSpecialBookmarks
{
  -[WebBookmarkCollection _restoreMissingSpecialBookmarksWithChangeNotification:](self, "_restoreMissingSpecialBookmarksWithChangeNotification:", 1);
}

- (void).cxx_destruct
{
  BookmarkSQLWriteTransaction *value;

  value = self->_currentTransaction.__ptr_.__value_;
  self->_currentTransaction.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(BookmarkSQLWriteTransaction *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_storeStrong((id *)&self->_databaseLockAcquisitor, 0);
  objc_storeStrong((id *)&self->_safariFetcherServerProxy, 0);
  objc_storeStrong((id *)&self->_rootBookmark, 0);
  objc_storeStrong((id *)&self->_wordTokenizer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)_bookmarkDictionaryForSqliteRow:(sqlite3_stmt *)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  int v10;
  const __CFString *v11;
  const unsigned __int8 *v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  const unsigned __int8 *v17;
  id v18;
  const unsigned __int8 *v19;
  id v20;
  const char *v21;
  id v22;
  uint64_t v24;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = sqlite3_column_int(a3, 0);
  if (v10)
    v11 = CFSTR("WebBookmarkTypeList");
  else
    v11 = CFSTR("WebBookmarkTypeLeaf");
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("WebBookmarkType"));
  v12 = sqlite3_column_text(a3, 1);
  v13 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v12)
    v14 = (const char *)v12;
  else
    v14 = "";
  v15 = (void *)objc_msgSend(v13, "initWithUTF8String:", v14);
  if (v10)
  {
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("Title"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v15, CFSTR("title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("URIDictionary"));

  }
  v17 = sqlite3_column_text(a3, 2);
  if (!v10 && v17)
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v17);
    objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("URLString"));
LABEL_13:

    goto LABEL_14;
  }
  if (v10 && v6)
  {
    v24 = sqlite3_column_int(a3, 3);
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (!-[WebBookmarkCollection _addChildrenOfID:toCollection:recursive:error:](self, "_addChildrenOfID:toCollection:recursive:error:", v24, v18, 1, a5))
    {
      v22 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("Children"));
    goto LABEL_13;
  }
LABEL_14:
  v19 = sqlite3_column_text(a3, 4);
  v20 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v19)
    v21 = (const char *)v19;
  else
    v21 = "";
  v18 = (id)objc_msgSend(v20, "initWithUTF8String:", v21);
  objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("WebBookmarkUUID"));
  v22 = v9;
LABEL_18:

  return v22;
}

- (BOOL)_addChildrenOfID:(int)a3 toCollection:(id)a4 recursive:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t v12;
  id i;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v22;
  id v23;
  id v24;
  sqlite3_stmt *ppStmt;

  v7 = a5;
  v10 = a4;
  v11 = (void *)MEMORY[0x212BD4AC8]();
  ppStmt = 0;
  v12 = sqlite3_prepare_v2(self->_db, "SELECT type, title, url, id, external_uuid FROM bookmarks WHERE parent = ? AND deleted = 0 AND hidden = 0 AND syncable = 1 ORDER BY order_index", -1, &ppStmt, 0);
  if ((_DWORD)v12)
  {
    v24 = 0;
    _SetErrorFromSQLiteResult(v12, &v24);
    i = v24;
    v14 = 0;
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, a3);
    for (i = 0; ; i = v18)
    {
      v15 = sqlite3_step(ppStmt);
      v16 = v15;
      if ((_DWORD)v15 != 100)
        break;
      v23 = i;
      -[WebBookmarkCollection _bookmarkDictionaryForSqliteRow:recursive:error:](self, "_bookmarkDictionaryForSqliteRow:recursive:error:", ppStmt, v7, &v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;

      if (!v17)
      {
        i = v18;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "objectForKey:", CFSTR("WebBookmarkUUID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v10, "setObject:forKey:", v17, v19);

      }
      else
      {
        objc_msgSend(v10, "addObject:", v17);
      }

    }
    if ((_DWORD)v15 == 101)
    {
      v14 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v22 = i;
    _SetErrorFromSQLiteResult(v16, &v22);
    v20 = v22;

    v14 = 0;
    i = v20;
LABEL_16:
    sqlite3_finalize(ppStmt);
  }
  objc_autoreleasePoolPop(v11);
  if (a6)
    *a6 = objc_retainAutorelease(i);

  return v14;
}

- (id)bookmarksDictionary
{
  int v3;
  sqlite3_stmt *v4;
  int v5;
  uint64_t v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  sqlite3_stmt *ppStmt;
  _BYTE v23[24];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v23, self->_db);
  if (!v23[17])
    goto LABEL_17;
  ppStmt = 0;
  v3 = sqlite3_prepare_v2(self->_db, "SELECT type, title, url, id, external_uuid FROM bookmarks WHERE id = 0", -1, &ppStmt, 0);
  v4 = ppStmt;
  if (v3 || (v5 = sqlite3_step(ppStmt), v4 = ppStmt, v5 != 100))
  {
    -[WebBookmarkCollection _finalizeStatementIfNotNull:](self, "_finalizeStatementIfNotNull:", v4);
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  -[WebBookmarkCollection _bookmarkDictionaryForSqliteRow:recursive:error:](self, "_bookmarkDictionaryForSqliteRow:recursive:error:", ppStmt, 1, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sqlite3_finalize(ppStmt);
  WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v23, v6, v7);
  objc_msgSend(v17, "removeObjectForKey:", CFSTR("Title"));
  objc_msgSend(v17, "objectForKey:", CFSTR("Children"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", CFSTR("Title"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BookmarksBar")) & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("WebBookmarkUUID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", &stru_24CB35168);

          if (v15)
          {
            objc_msgSend(v8, "removeObject:", v12);
            goto LABEL_19;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }
LABEL_19:

LABEL_18:
  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v23);
  return v17;
}

- (BOOL)_syncAdd:(id)a3 toParent:(int)a4 withOrderIndex:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  uint64_t v21;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("WebBookmarkType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("WebBookmarkTypeList"));

  if ((_DWORD)v12)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("Title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("URIDictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("URLString"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (__CFString *)v15;
  else
    v16 = &stru_24CB35168;
  objc_msgSend(v10, "objectForKey:", CFSTR("WebBookmarkUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  v18 = -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:](self, "_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:", v13, v16, v8, v7, v12, v17, 0, v21);

  if (!v18)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.ErrorDomain"), 5, 0);
      v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  if ((v12 & 1) == 0
    && !-[WebBookmarkCollection _indexBookmarkID:title:](self, "_indexBookmarkID:title:", sqlite3_last_insert_rowid(self->_db), v13))
  {
    goto LABEL_13;
  }
  v19 = 1;
LABEL_14:

  return v19;
}

- (BOOL)_mergeChildrenOfID:(int)a3 referencingBase:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  sqlite3_int64 insert_rowid;
  id v19;
  BOOL v20;
  void *context;
  void *v23;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x212BD4AC8]();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("Children"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  context = (void *)v7;
  if (v9)
  {
    obj = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKey:", CFSTR("WebBookmarkType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WebBookmarkTypeList")) & 1) != 0
          || (objc_msgSend(v15, "isEqualToString:", CFSTR("WebBookmarkTypeLeaf")) & 1) != 0)
        {
          v28 = v11;
          v16 = -[WebBookmarkCollection _syncAdd:toParent:withOrderIndex:error:](self, "_syncAdd:toParent:withOrderIndex:error:", v14, a3, v10, &v28);
          v17 = v28;

          if (!v16)
          {

            v20 = 0;
            goto LABEL_16;
          }
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("WebBookmarkTypeList")))
          {
            insert_rowid = sqlite3_last_insert_rowid(self->_db);
            v27 = v17;
            -[WebBookmarkCollection _mergeChildrenOfID:referencingBase:error:](self, "_mergeChildrenOfID:referencingBase:error:", insert_rowid, v14, &v27);
            v19 = v27;

            v17 = v19;
          }
          v10 = (v10 + 1);
          v11 = v17;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v9)
        continue;
      break;
    }
    v20 = 1;
    v17 = v11;
LABEL_16:
    v8 = obj;
  }
  else
  {
    v17 = 0;
    v20 = 1;
  }

  objc_autoreleasePoolPop(context);
  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v20;
}

- (BOOL)_markSpecialBookmarks
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;

  if (-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET special_id = 1, editable = 0, deletable = 0 WHERE id = (SELECT id FROM bookmarks WHERE title = 'BookmarksBar' AND parent = 0 ORDER BY id ASC LIMIT 1);"))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
LABEL_6:
      -[WebBookmarkCollection(Sync) _markSpecialBookmarks].cold.1();
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    if (!-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET special_id = 2, editable = 0, deletable = 0 WHERE id = (SELECT id FROM bookmarks WHERE title = 'BookmarksMenu' AND parent = 0 ORDER BY id ASC LIMIT 1);"))
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v4 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
      goto LABEL_6;
  }
  return v4;
}

- (BOOL)mergeWithBookmarksDictionary:(id)a3 clearHidden:(BOOL)a4 error:(id *)a5
{
  return -[WebBookmarkCollection mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:](self, "mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:", a3, a4, 1, a5);
}

- (BOOL)mergeWithBookmarksDictionary:(id)a3 clearHidden:(BOOL)a4 clearSyncData:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = CFSTR("DELETE FROM bookmarks WHERE id != 0 AND hidden = 0 AND hidden_ancestor_count = 0 AND syncable = 1");
  if (v8)
    v11 = CFSTR("DELETE FROM bookmarks WHERE id != 0 AND syncable = 1");
  v12 = v11;
  if (-[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v12))
  {
    v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.5();
  }
  else
  {
    if (v8)
      -[WebBookmarkCollection clearAllReadingListArchives](self, "clearAllReadingListArchives");
    if (-[WebBookmarkCollection _mergeChildrenOfID:referencingBase:error:](self, "_mergeChildrenOfID:referencingBase:error:", 0, v10, a6))
    {
      if (-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS count_bookmarks WHERE count_bookmarks.parent = bookmarks.id AND hidden = 0) WHERE type = 1"))
      {
        v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.3();
      }
      else if (-[WebBookmarkCollection _markSpecialBookmarks](self, "_markSpecialBookmarks"))
      {
        if (-[WebBookmarkCollection _restoreMissingSpecialBookmarksWithChangeNotification:](self, "_restoreMissingSpecialBookmarksWithChangeNotification:", 1))
        {
          if (-[WebBookmarkCollection _rebuildAncestorTable](self, "_rebuildAncestorTable"))
          {
            if (-[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration")
              && (!v7 || -[WebBookmarkCollection _clearAllSyncData](self, "_clearAllSyncData")))
            {
              -[WebBookmarkCollection _startReadingListFetcher](self, "_startReadingListFetcher");
              v23 = 1;
              goto LABEL_15;
            }
          }
          else
          {
            v33 = WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.1(v33, v34, v35, v36, v37, v38, v39, v40);
          }
        }
        else
        {
          v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
        }
      }
    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  v23 = 0;
LABEL_15:

  return v23;
}

- (void)removePersistedInMemoryBookmarkChangesFile
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inMemoryChangesFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", v2, 0);

}

- (unint64_t)generation
{
  return -[WebBookmarkCollection _intFromExecutingSQL:](self, "_intFromExecutingSQL:", CFSTR("SELECT generation FROM generations"));
}

- (BOOL)_syncPropertyExistsForKey:(id)a3
{
  id v4;
  BOOL v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  char v9;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "SELECT COUNT(*) FROM sync_properties WHERE key = ?");
  v5 = v9
    && (sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v8) == 100)&& sqlite3_column_int(v8, 0) > 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (BOOL)_deleteSyncPropertyForKey:(id)a3
{
  id v4;
  BOOL v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  char v9;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "DELETE FROM sync_properties WHERE key = ?");
  if (v9)
  {
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v5 = sqlite3_step(v8) == 101;
  }
  else
  {
    v5 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (BOOL)syncSetString:(id)a3 forKey:(id)a4
{
  return -[WebBookmarkCollection _syncSetString:forKey:updatedExistingKey:](self, "_syncSetString:forKey:updatedExistingKey:", a3, a4, 0);
}

- (BOOL)_syncSetString:(id)a3 forKey:(id)a4 updatedExistingKey:(BOOL *)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  _BOOL4 v11;
  void (*v12)(_QWORD *, uint64_t);
  const char *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v17;
  sqlite3_stmt *v18;
  char v19;
  _QWORD v20[5];

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __72__WebBookmarkCollection_Sync___syncSetString_forKey_updatedExistingKey___block_invoke;
    v20[3] = &__block_descriptor_40_e8_v12__0B8l;
    v20[4] = a5;
    v10 = (_QWORD *)MEMORY[0x212BD4C84](v20);
    v11 = -[WebBookmarkCollection _syncPropertyExistsForKey:](self, "_syncPropertyExistsForKey:", v9);
    v12 = (void (*)(_QWORD *, uint64_t))v10[2];
    if (v11)
    {
      v12(v10, 1);
      v13 = "UPDATE sync_properties SET value = ? WHERE key = ?";
    }
    else
    {
      v12(v10, 0);
      v13 = "INSERT INTO sync_properties (value, key) VALUES (?, ?)";
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v17, self->_db, v13);
    if (v19)
    {
      sqlite3_bind_text(v18, 1, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(v18, 2, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(v18) == 101)
      {
        v14 = 1;
LABEL_12:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v17);

        goto LABEL_13;
      }
      v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection(Sync) _syncSetString:forKey:updatedExistingKey:].cold.1();
    }
    v14 = 0;
    goto LABEL_12;
  }
  v14 = -[WebBookmarkCollection _deleteSyncPropertyForKey:](self, "_deleteSyncPropertyForKey:", v9);
LABEL_13:

  return v14;
}

uint64_t __72__WebBookmarkCollection_Sync___syncSetString_forKey_updatedExistingKey___block_invoke(uint64_t result, char a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(result + 32);
  if (v2)
    *v2 = a2;
  return result;
}

- (BOOL)setSyncData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  _BYTE v14[8];
  sqlite3_stmt *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[WebBookmarkCollection syncDataForKey:](self, "syncDataForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = "UPDATE sync_properties SET value = ? WHERE key = ?";
    else
      v9 = "INSERT INTO sync_properties (value, key) VALUES (?, ?)";
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, self->_db, v9);
    if (v16)
    {
      v10 = objc_msgSend(v6, "length");
      sqlite3_bind_blob(v15, 1, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(v15) == 101)
      {
        v11 = 1;
LABEL_12:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);
        goto LABEL_13;
      }
      v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WebBookmarkCollection(Sync) setSyncData:forKey:].cold.1();
    }
    v11 = 0;
    goto LABEL_12;
  }
  v11 = -[WebBookmarkCollection _deleteSyncPropertyForKey:](self, "_deleteSyncPropertyForKey:", v7);
LABEL_13:

  return v11;
}

- (id)allSyncDataForKeysWithPrefix:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  char v14;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->_db, "SELECT key, value FROM sync_properties WHERE key = ?");
  if (v14)
  {
    v5 = v13;
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("%"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    while (sqlite3_step(v13) == 100)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(v13, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = sqlite3_column_blob(v13, 1);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, sqlite3_column_bytes(v13, 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1B8];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v7;
}

- (BOOL)removeAllSyncDataForKeyWithPrefix:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  BOOL v7;
  _BYTE v9[8];
  sqlite3_stmt *v10;
  char v11;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "DELETE FROM sync_properties WHERE key LIKE ?");
  if (v11)
  {
    v5 = v10;
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("%"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    v7 = sqlite3_step(v10) == 101;
  }
  else
  {
    v7 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);

  return v7;
}

- (BOOL)beginSyncTransaction
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "SAVEPOINT sync");
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (v3 == 1)
    {
      v5 = v4;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = sqlite3_errmsg(self->_db);
        -[WebBookmarkCollection(Sync) beginSyncTransaction].cold.2((uint64_t)v6, (uint64_t)v11, v5);
      }

    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WebBookmarkCollection(Sync) beginSyncTransaction].cold.3();
    }
    if (objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection(Sync) beginSyncTransaction].cold.1(v8, (uint64_t)&v10, v7);
      }

    }
  }
  else
  {
    self->_dirty = 0;
  }
  return v3 == 0;
}

- (void)commitSyncTransaction
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "RELEASE SAVEPOINT sync");
}

- (void)rollbackSyncTransaction
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ROLLBACK TRANSACTION TO SAVEPOINT sync");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "RELEASE SAVEPOINT sync");
}

+ (void)unlockSyncAsynchronously
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Unlocking sync asynchronously", buf, 2u);
  }
  syncLockQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WebBookmarkCollection_Sync__unlockSyncAsynchronously__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_barrier_async(v4, block);

}

uint64_t __55__WebBookmarkCollection_Sync__unlockSyncAsynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unlockSync");
}

+ (void)holdLockSync:(const void *)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Hold lock sync for requestor %p", buf, 0xCu);
  }
  syncLockQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WebBookmarkCollection_Sync__holdLockSync___block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  v7[4] = a1;
  v7[5] = a3;
  dispatch_barrier_async(v6, v7);

}

void __44__WebBookmarkCollection_Sync__holdLockSync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_syncFlags");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockSyncHoldRequestorPointers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (void)unholdLockSync:(const void *)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[7];
  uint8_t buf[4];
  const void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Unhold lock sync for requestor %p", buf, 0xCu);
  }
  v6 = operator new();
  MEMORY[0x212BD4870](v6, CFSTR("com.apple.WebBookmarks.WebBookmarkCollection_Sync"));
  syncLockQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WebBookmarkCollection_Sync__unholdLockSync___block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a1;
  block[5] = a3;
  block[6] = v6;
  dispatch_barrier_async(v7, block);

}

void __46__WebBookmarkCollection_Sync__unholdLockSync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_syncFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockSyncHoldRequestorPointers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

  if (objc_msgSend(v2, "unlockSyncRequested") && !objc_msgSend(v3, "count"))
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = (uint64_t)v8;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to unlock sync since last requestor has unheld the lock in process %{public}@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_unlockSync");
  }
  else if (objc_msgSend(v2, "unlockSyncRequested"))
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Unlock sync requested but there are still %zu requestors remaining", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(id **)(a1 + 48);
  if (v9)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v9);
    MEMORY[0x212BD4888]();
  }

}

- (void)_postBookmarksChangedSyncNotification
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (!-[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"))
  {
    v2 = objc_opt_class();
    syncLockQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__WebBookmarkCollection_Sync___postBookmarksChangedSyncNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __68__WebBookmarkCollection_Sync___postBookmarksChangedSyncNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postBookmarksChangedSyncNotificationOnSyncQueue");
}

+ (void)_postBookmarksChangedSyncNotificationOnSyncQueue
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  os_activity_scope_state_s state;

  objc_msgSend(a1, "_syncFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "syncAllowed") & 1) != 0)
  {
    if (objc_msgSend(v2, "syncLockFileDescriptor") == -1)
    {
      if (objc_msgSend(v2, "syncNotificationType") == 1)
      {
        v3 = _os_activity_create(&dword_211022000, "Request sync client trigger sync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
        os_activity_scope_enter(v3, &state);
        v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_DEFAULT, "Requesting a CloudKit bookmarks sync due to local changes", v6, 2u);
        }
        objc_msgSend(MEMORY[0x24BE82DA8], "sharedProxy");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "userDidUpdateBookmarkDatabase");

        os_activity_scope_leave(&state);
      }
    }
    else
    {
      objc_msgSend(v2, "setPostSyncNotificationWhenUnlocking:", 1);
    }
  }

}

- (BOOL)containsOnlyStockBookmarks
{
  WebBookmarkListQuery *v3;
  WebBookmarkList *v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[WebBookmarkListQuery initWithBookmarksWhere:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:orderBy:usingFilter:", CFSTR("special_id == 0 AND id != 0 AND deleted = 0"), 0, 0);
  v4 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v3, 0, self);
  v5 = -[WebBookmarkList bookmarkCount](v4, "bookmarkCount");
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      -[WebBookmarkList bookmarkAtIndex:](v4, "bookmarkAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "wb_BOOLForKey:", CFSTR("com.apple.bookmarks.IsBuiltinBookmark")) & 1) == 0
        && (objc_msgSend(v9, "wb_BOOLForKey:", CFSTR("com.apple.bookmarks.IsBuiltinDeviceBookmark")) & 1) == 0
        && (objc_msgSend(v9, "wb_BOOLForKey:", CFSTR("com.apple.bookmarks.IsCarrierBookmark")) & 1) == 0)
      {
        break;
      }

      v7 = (v7 + 1);
      v6 = v7 >= v5;
      if (v5 == (_DWORD)v7)
        goto LABEL_7;
    }

  }
  else
  {
LABEL_7:
    v6 = 1;
  }

  return v6;
}

- (void)_setupWithPath:checkIntegrity:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Still could not open bookmarks database: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_setupWithPath:checkIntegrity:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9(&dword_211022000, v0, (uint64_t)v0, "Refusing to remove corrupted bookmarks database at %{public}@: The file is not named %{public}@.", v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)_setupWithPath:checkIntegrity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Refusing to remove corrupted bookmarks database at %{public}@: The path appears to be a directory.", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_setupWithPath:checkIntegrity:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Couldn't create bookmarks database at %{public}@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_setupWithPath:checkIntegrity:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Could not open bookmarks database: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_setupWithPath:checkIntegrity:.cold.6()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  *(_DWORD *)v2 = 67109378;
  *(_DWORD *)(v2 + 4) = v1 & 1;
  *(_WORD *)(v2 + 8) = 2114;
  *(_QWORD *)(v2 + 10) = v3;
  OUTLINED_FUNCTION_18(&dword_211022000, v5, v2, "Failed to open Bookmarks database. Acquired sync lock: %d, error: %{public}@.", v4);

  OUTLINED_FUNCTION_4();
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Could not remove bookmarks database %{public}@", v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Failed to remove the shm file %{public}@.", v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Failed to remove the wal file %{public}@.", v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Failed to remove the journal file at %{public}@.", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_unsafeOpenDatabaseAtPath:checkIntegrity:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "A table is missing from bookmarks database. The database is corrupt.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_verifyAllTablesExist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Table %{public}@ is missing from bookmarks database", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_checkDatabaseIntegrity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "sqlite3_step failed for integrity_check with error code %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setupWithPath:migratingBookmarksPlist:syncAnchorPlist:checkIntegrity:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9(&dword_211022000, v0, (uint64_t)v0, "Failed to migrate from bookmarks plist at path %{public}@ sync anchor plist path %{public}@", v1);
  OUTLINED_FUNCTION_4_0();
}

+ (void)safariBookmarkCollection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Unable to initialize WebBookmarkCollection. Nil was returned from +initSafariBookmarkCollectionCheckingIntegrity:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cleanUpReadingListArchives
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to migrate Reading List archives; couldn't reset record status.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearAllReadingListArchives
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to get list of archive directories: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)clearReadingListArchiveWithUUID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_9(&dword_211022000, v6, v4, "Failed to remove reading list archive at path %{public}@: %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)markWebContentFilterAllowsAllReadingListItems
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to mark all Reading List items as allowed by Web Content Filter with result code: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveBookmarks:postNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Could not open a write transaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveBookmarks:postNotification:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Could not apply in-memory changes to database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveBookmark:startReadingListFetcher:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8382e-34);
  *(_WORD *)(v3 + 12) = 2114;
  *(_QWORD *)(v3 + 14) = CFSTR("Trying to save a bookmark without first obtaining the bookmarks database file lock.");
  OUTLINED_FUNCTION_9(&dword_211022000, v4, (uint64_t)v4, "Failed to save bookmark with UUID %{public}@: %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to save bookmark %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

void __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "_saveBookmark:withSpecialID:updateGenerationIfNeeded: failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteIconForBookmark:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to delete bookmark icon: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_deleteIconForBookmark:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "No BookmarkImages directory exists, but bookmark had an icon UUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveArchiveForReadingListBookmarkWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to acquire lock when saving offline Reading List archive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveIconWithData:urlString:forBookmark:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Saving Reading List icon failed: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)saveIconWithData:urlString:forBookmark:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Creating a directory for Reading List icons failed: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)saveAndMoveBookmark:(uint64_t)a3 toFolderID:(NSObject *)a4 .cold.1(uint64_t a1, int a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 67109376;
  *(_DWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 8) = 1024;
  *(_DWORD *)(a1 + 10) = a3;
  OUTLINED_FUNCTION_13(&dword_211022000, a4, a3, "Moving bookmark %d to folder %d failed", (uint8_t *)a1);
}

- (void)saveAndMoveBookmark:toFolderID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Saving a previously deleted bookmark failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveAndMoveBookmark:toFolderID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Saving a bookmark failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to save bookmark during update with error: %@", v4);

  OUTLINED_FUNCTION_4();
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to reorder bookmark during update with error: %@", v4);

  OUTLINED_FUNCTION_4();
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_286_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to save and move bookmark during update with error: %@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_migrateToCurrentSchema
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Could not migrate database because database is not writable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateBookmarksPlist:syncAnchorPlist:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_9(&dword_211022000, v6, v4, "Failed to remove bookmarks sync anchor plist at path %{public}@. Error: %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)_migrateBookmarksPlist:syncAnchorPlist:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_9(&dword_211022000, v6, v4, "Failed to remove old bookmarks plist at path %{public}@. Error: %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)_migrateBookmarksPlist:syncAnchorPlist:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Failed to import bookmarks with plist path %{public}@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to perform Safari version upgrades because we failed to lock sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Warning: The web bookmarks database was used on a more recent %{public}@ version than the current one. Restoring a database from a newer version is not supported.", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_moveBookmark:(uint64_t)a3 toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:.cold.1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = 101;
  OUTLINED_FUNCTION_13(&dword_211022000, a2, a3, "Could not reorder records in previous parent %d, error: %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)_clearAllTombstones
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to clear local bookmark tombstones", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_clearAllSyncKeys
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to clear sync server ids. Sqlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_clearAllSyncData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to reset bookmarks generation. Sqlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to reset generation of bookmark %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Failed to reset sync data of bookmark %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_deleteRecursively:descendantsOnly:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_211022000, v0, v1, "Could not delete records recursively starting with localID: %d, error: %d", v2, v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Cannot save bookmark: failed to get hidden ancestor count (%i)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Cannot save bookmark: failed to update order index of bookmarks during insertion (%i)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveBookmark:withSpecialID:updateGenerationIfNeeded:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8382e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  _os_log_fault_impl(&dword_211022000, v6, OS_LOG_TYPE_FAULT, "Failed to save bookmark %{public}@: Invalid parentID %d", v5, 0x12u);

  OUTLINED_FUNCTION_4();
}

- (void)_saveBookmark:withSpecialID:updateGenerationIfNeeded:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_211022000, v0, OS_LOG_TYPE_FAULT, "Refusing to save a bookmark with no address", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)bookmarkIDForServerID:excludeDeletedBookmarks:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_18(&dword_211022000, v1, (uint64_t)v1, "Could not get bookmark ID with server ID %{public}@ with prepare result %d", v2);
  OUTLINED_FUNCTION_4_0();
}

void __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Safari directory is currently inaccessible", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteAncestorTableEntriesForBookmarkID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_211022000, v0, v1, "Could not delete ancestor table entries for record %d, error: %d", v2, v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)_incrementGeneration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to increment bookmarks generation. Sqlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_simulateCrashWithDescription:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_211022000, v0, OS_LOG_TYPE_FAULT, "%{public}@ Please file a bug citing the following caller:", v1, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

- (void)_importBookmarksPlist:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("not null");
  if ((a1 & 1) != 0)
    v3 = CFSTR("null");
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_3(&dword_211022000, a2, a3, "Failed to merge bookmarks with dictionary. Bookmarks dictionary is %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4_0();
}

- (void)_insertAncestorTableEntriesForBookmarkID:withAncestorIDs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_211022000, v0, v1, "Could not recursively update ancestor table entries for bookmark %d, error: %d", v2, v3);
  OUTLINED_FUNCTION_4_0();
}

- (void)setLocalMigrationState:generateDeviceIdentifierIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_211022000, v0, v1, "Failed to delete local migration state from sync properties. Sqlite error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setLocalMigrationState:generateDeviceIdentifierIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_211022000, v0, v1, "Failed to save local migration state %{public}@ to database", v2);
  OUTLINED_FUNCTION_4_0();
}

@end
