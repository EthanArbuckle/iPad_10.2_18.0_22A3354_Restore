@implementation QLCacheIndexDatabase

- (void)updateHitCount:(id)a3 forFileIdentifier:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  sqlite3_stmt *v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  QLSqliteDatabase *database;
  QLSqliteDatabase *v19;
  float v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  sqlite3_stmt *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[QLCacheIndexDatabase _cacheIdForFileIdentifier:createVersion:](self, "_cacheIdForFileIdentifier:createVersion:", a4, 0);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "UPDATE thumbnails SET hit_count=hit_count+?, last_hit_date=?                              WHERE file_id=? AND size=? AND icon_mode=? AND badge_type=?                                    AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?");
    v26 = v10;
    if (v10)
    {
      v11 = v10;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      obj = v9;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v6, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", objc_msgSend(v17, "unsignedIntValue"), 1, v11);
            database = self->_database;
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v11 = v26;
            -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 2, v26);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", v8, 3, v11);
            v19 = self->_database;
            objc_msgSend(v16, "size");
            -[QLSqliteDatabase bindInt:atIndex:inStatement:](v19, "bindInt:atIndex:inStatement:", (int)v20, 4, v11);
            -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", objc_msgSend(v16, "iconMode"), 5, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v16, "badgeType"), 6, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v16, "iconVariant"), 7, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", (int)objc_msgSend(v16, "interpolationQuality"), 8, v11);
            -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v16, "externalGeneratorDataHash"), 9, v11);
            -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v11);
            -[QLSqliteDatabase resetStatement:unbindValuesThroughIndex:](self->_database, "resetStatement:unbindValuesThroughIndex:", v11, 0);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v26);
    }
    else
    {

    }
  }

}

- (id)removeThumbnailsOlderThanDate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  sqlite3_stmt *v12;
  sqlite3_stmt *v13;
  QLSqliteDatabase *database;
  QLSqliteDatabase *v15;
  uint64_t v16;
  void *v17;
  sqlite3_stmt *v19;

  v4 = a3;
  _log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[QLCacheIndexDatabase removeThumbnailsOlderThanDate:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT rowid, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE last_hit_date<?");
  if (v12)
  {
    v13 = v12;
    database = self->_database;
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 1, v13);
    v19 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "DELETE FROM missing_remote_thumbnails WHERE date<?");
    v15 = self->_database;
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](v15, "bindDouble:atIndex:inStatement:", 1, v13);
    -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v19);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v19);
    -[QLCacheIndexDatabase _removeThumbnailsFromStatement:](self, "_removeThumbnailsFromStatement:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;

  return v17;
}

- (id)_removeThumbnailsFromStatement:(sqlite3_stmt *)a3
{
  void *v5;
  id v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  char v12;
  sqlite3_stmt *v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0;
  if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", a3, &v12))
    v7 = v12 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    do
    {
      v8 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, a3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      -[QLCacheIndexDatabase add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:](self, "add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:", 2, 1, a3, v5);
      if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", a3, &v12))
        v10 = v12 == 0;
      else
        v10 = 1;
    }
    while (!v10);
  }
  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v13);
  if (objc_msgSend(v6, "count"))
  {
    v13 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", objc_msgSend(CFSTR("DELETE FROM thumbnails WHERE rowid IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), "UTF8String"));
    -[QLSqliteDatabase runStatement:withBoundNumbers:startingAtIndex:stepHandler:](self->_database, "runStatement:withBoundNumbers:startingAtIndex:stepHandler:", v13, v6, 1, 0);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v13);
  }

  return v5;
}

- (unint64_t)_cacheIdForFileIdentifier:(id)a3 createVersion:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v16;
  char v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "statementToFindCacheIdInDatabase:", self->_database);
  v18 = v7;
  v17 = 0;
  if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v7, &v17))
    v8 = v17 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend((id)objc_opt_class(), "cacheIdFromRowId:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v7));
    if (a4)
    {
      v10 = -[QLSqliteDatabase newDataFromColumn:inStatement:copyBytes:](self->_database, "newDataFromColumn:inStatement:copyBytes:", 1, v7, 0);
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      v13 = v11;
      *a4 = v13;
      if (!v13)
      {
        _log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v20 = v10;
          v21 = 2112;
          v22 = v6;
          v23 = 2112;
          v24 = v12;
          _os_log_error_impl(&dword_1D54AE000, v14, OS_LOG_TYPE_ERROR, "cannot create the version based on data %@, for file %@: %@", buf, 0x20u);
        }

      }
    }
  }
  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v18);

  return v9;
}

- (id)queryCacheForFileRequests:(id)a3
{
  id v4;
  QLCacheIndexDatabaseQueryEnumerator *v5;

  v4 = a3;
  v5 = -[QLCacheIndexDatabaseQueryEnumerator initWithSqliteDatabase:fileRequests:]([QLCacheIndexDatabaseQueryEnumerator alloc], "initWithSqliteDatabase:fileRequests:", self->_database, v4);

  return v5;
}

- (BOOL)itemIsMissingRemoteThumbnail:(id)a3
{
  id v4;
  QLSqliteDatabase *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  QLSqliteDatabase *v9;
  id v10;
  _QWORD v12[4];
  QLSqliteDatabase *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v4 = a3;
  v5 = self->_database;
  v6 = -[QLSqliteDatabase prepareStatement:](v5, "prepareStatement:", "SELECT version FROM missing_remote_thumbnails WHERE fileProviderId = ? AND itemId = ?");
  v21 = v6;
  objc_msgSend(v4, "providerDomainID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLSqliteDatabase bindObject:atIndex:inStatement:](v5, "bindObject:atIndex:inStatement:", v7, 1, v6);

  objc_msgSend(v4, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLSqliteDatabase bindObject:atIndex:inStatement:](v5, "bindObject:atIndex:inStatement:", v8, 2, v6);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__QLCacheIndexDatabase_itemIsMissingRemoteThumbnail___block_invoke;
  v12[3] = &unk_1E99D2A18;
  v9 = v5;
  v13 = v9;
  v16 = v6;
  v10 = v4;
  v14 = v10;
  v15 = &v17;
  -[QLSqliteDatabase runStatement:stepHandler:](v9, "runStatement:stepHandler:", v6, v12);
  -[QLSqliteDatabase finalizeStatement:](v9, "finalizeStatement:", &v21);
  LOBYTE(v6) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v6;
}

- (void)save
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "save index database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)endTransaction
{
  -[QLSqliteDatabase endTransaction](self->_database, "endTransaction");
}

- (BOOL)beginTransaction
{
  return -[QLSqliteDatabase beginTransaction](self->_database, "beginTransaction");
}

- (id)removeOldThumbnails
{
  double v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v3 - (double)self->_maxThumbnailLifeTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLCacheIndexDatabase removeThumbnailsOlderThanDate:](self, "removeThumbnailsOlderThanDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)do:(id)a3
{
  -[QLSqliteDatabase do:](self->_database, "do:", a3);
}

BOOL __53__QLCacheIndexDatabase_itemIsMissingRemoteThumbnail___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newDataFromColumn:inStatement:copyBytes:", 0, *(_QWORD *)(a1 + 56), 0);
  objc_msgSend(*(id *)(a1 + 40), "itemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToData:", v2) & 1) != 0 || !v2 && !objc_msgSend(v4, "length"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;

  return v5;
}

- (QLCacheIndexDatabase)initWithPath:(id)a3
{
  id v4;
  QLCacheIndexDatabase *v5;
  uint64_t v6;
  NSString *databasePath;
  QLSqliteDatabase *v8;
  QLSqliteDatabase *database;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLCacheIndexDatabase;
  v5 = -[QLCacheIndexDatabase init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("index.sqlite"));
    v6 = objc_claimAutoreleasedReturnValue();
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    v8 = objc_alloc_init(QLSqliteDatabase);
    database = v5->_database;
    v5->_database = v8;

    v5->_maxThumbnailLifeTime = (int)_QLSAppPreferencesIntValueForKey();
    _log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[QLCacheIndexDatabase initWithPath:].cold.1((uint64_t)&v5->_maxThumbnailLifeTime, v10, v11, v12, v13, v14, v15, v16);

  }
  return v5;
}

- (BOOL)doesExist
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", self->_databasePath);

  _log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[QLCacheIndexDatabase doesExist].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  return v4;
}

- (void)open
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "open index database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)isValid
{
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  _BOOL4 v5;
  QLSqliteDatabase *database;
  NSObject *v8;
  BOOL v9;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  _BOOL4 v16;
  int v17;
  sqlite3_stmt *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  if (-[QLSqliteDatabase isOpened](self->_database, "isOpened"))
  {
    v3 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT value FROM preferences WHERE key='version'");
    v18 = v3;
    buf[0] = 0;
    if (v3)
    {
      v4 = v3;
      v5 = -[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v3, buf);
      database = self->_database;
      if (!v5 || buf[0] == 0)
      {
        -[QLSqliteDatabase finalizeStatement:](database, "finalizeStatement:", &v18);
      }
      else
      {
        v11 = -[QLSqliteDatabase newStringFromColumn:inStatement:uniqueInStringTable:](database, "newStringFromColumn:inStatement:uniqueInStringTable:", 0, v4, 0);
        v12 = objc_msgSend(v11, "intValue");
        v13 = v12;
        if (v12 != 12)
        {
          _log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = objc_msgSend(v11, "intValue");
            *(_DWORD *)buf = 67109376;
            v20 = v15;
            v21 = 1024;
            v22 = 12;
            _os_log_impl(&dword_1D54AE000, v14, OS_LOG_TYPE_INFO, "index database current version %d, version expected %d", buf, 0xEu);
          }

        }
        buf[0] = 0;
        v16 = -[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v4, buf);
        v17 = buf[0];

        -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v18);
        if (v13 == 12 && v16 && !v17 && !-[QLSqliteDatabase isCorrupted](self->_database, "isCorrupted"))
        {
          _log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            -[QLCacheIndexDatabase isValid].cold.2();
          v9 = 1;
          goto LABEL_12;
        }
      }
    }
  }
  _log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[QLCacheIndexDatabase isValid].cold.1();
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "close index database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  _log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D54AE000, v3, OS_LOG_TYPE_INFO, "reset index database", v4, 2u);
  }

  unlink(-[NSString fileSystemRepresentation](self->_databasePath, "fileSystemRepresentation"));
}

- (void)checkpoint
{
  -[QLSqliteDatabase checkpoint](self->_database, "checkpoint");
}

- (unint64_t)insertOrUpdateThumbnailWithVersionedFileIdentifier:(id)a3 shouldInvalidAllThumbnailSizes:(BOOL *)a4 added:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v20;
  id v21;
  _BYTE buf[12];
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = 0;
  objc_msgSend(v8, "fileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v11 = -[QLCacheIndexDatabase _cacheIdForFileIdentifier:createVersion:](self, "_cacheIdForFileIdentifier:createVersion:", v10, &v21);
  v12 = v21;

  *a5 = v11 == 0;
  if (v11)
  {
    if (v12)
      v13 = objc_msgSend(v9, "isEqual:", v12) ^ 1;
    else
      v13 = 1;
    *a4 = v13;
    _log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[QLCacheIndexDatabase insertOrUpdateThumbnailWithVersionedFileIdentifier:shouldInvalidAllThumbnailSizes:added:].cold.1(a4, (uint64_t)v8, v16);

    if (*a4)
    {
      _log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "fileIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v12;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v20;
        _os_log_debug_impl(&dword_1D54AE000, v17, OS_LOG_TYPE_DEBUG, "version from database %@, version from disk %@, for %@", buf, 0x20u);

      }
      v18 = objc_msgSend(v8, "statementToUpdateRecordWithCacheIdentifier:inDatabase:", v11, self->_database);
      *(_QWORD *)buf = v18;
      if (v18)
      {
        -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v18);
        -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", buf);
        goto LABEL_15;
      }
LABEL_14:
      v11 = 0;
    }
  }
  else
  {
    v14 = objc_msgSend(v8, "statementToInsertIntoDatabase:", self->_database);
    *(_QWORD *)buf = v14;
    if (!v14)
      goto LABEL_14;
    -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v14);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", buf);
    objc_msgSend(v8, "fileIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_opt_class(), "cacheIdFromRowId:", -[QLSqliteDatabase lastInsertRowId](self->_database, "lastInsertRowId"));

  }
LABEL_15:

  return v11;
}

- (BOOL)getBlobInfoForCacheId:(unint64_t)a3 size:(float)a4 iconMode:(unsigned __int8)a5 badgeType:(unint64_t)a6 iconVariant:(int64_t)a7 interpolationQuality:(int)a8 externalGeneratorDataHash:(unint64_t)a9 bitmapDataBlobInfo:(id *)a10 plistBufferBlobInfo:(id *)a11
{
  uint64_t v12;
  uint64_t v15;
  sqlite3_stmt *v19;
  sqlite3_stmt *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  char v24;
  sqlite3_stmt *v25;

  v12 = *(_QWORD *)&a8;
  v15 = a5;
  v19 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE file_id=? AND size=? AND icon_mode=? AND badge_type=? AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?");
  v25 = v19;
  if (v19)
  {
    v20 = v19;
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v19);
    -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", (int)a4, 2, v20);
    -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", v15, 3, v20);
    -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a6, 4, v20);
    -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a7, 5, v20);
    -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", v12, 6, v20);
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a9, 7, v20);
    v24 = 0;
    v21 = -[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v20, &v24);
    if (v24)
      v22 = v21;
    else
      v22 = 0;
    if (v22)
    {
      *a10 = objc_alloc_init(QLCacheBlobInfo);
      *a11 = objc_alloc_init(QLCacheBlobInfo);
      objc_msgSend(*a10, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v20));
      objc_msgSend(*a10, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 1, v20));
      objc_msgSend(*a11, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 2, v20));
      objc_msgSend(*a11, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 3, v20));
      -[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v20, &v24);
    }
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v25);
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  return v22;
}

- (BOOL)insertOrUpdateImageDataForCacheId:(unint64_t)a3 size:(float)a4 iconMode:(unsigned __int8)a5 badgeType:(unint64_t)a6 iconVariant:(int64_t)a7 interpolationQuality:(int)a8 bitmapFormat:(id)a9 bitmapDataBlobInfo:(id)a10 metadataBlobInfo:(id)a11 flavor:(int)a12 contentRect:(CGRect)a13 externalGeneratorDataHash:(unint64_t)a14 lastHitDate:(id)a15
{
  uint64_t v17;
  id v21;
  id v22;
  id v23;
  id v24;
  sqlite3_stmt *v25;
  id v26;
  _BOOL4 v27;
  QLSqliteDatabase *database;
  uint64_t v29;
  QLSqliteDatabase *v30;
  uint64_t v31;
  QLSqliteDatabase *v32;
  uint64_t v33;
  void *v34;
  QLSqliteDatabase *v35;
  uint64_t v36;
  QLSqliteDatabase *v37;
  uint64_t v38;
  QLSqliteDatabase *v39;
  uint64_t v40;
  QLSqliteDatabase *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  QLSqliteDatabase *v46;
  uint64_t v47;
  QLSqliteDatabase *v48;
  uint64_t v49;
  QLSqliteDatabase *v50;
  uint64_t v51;
  QLSqliteDatabase *v52;
  uint64_t v53;
  QLSqliteDatabase *v54;
  uint64_t v55;
  QLSqliteDatabase *v56;
  uint64_t v57;
  int64_t v59;
  void *v60;
  uint64_t v61;
  char v62;
  id v63;
  sqlite3_stmt *v64;
  CGRect v65;

  v61 = *(_QWORD *)&a8;
  v17 = a5;
  v65 = a13;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a15;
  if (a3)
  {
    v25 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT rowid FROM thumbnails WHERE file_id=? AND size=? AND icon_mode=? AND badge_type=? AND icon_variant=? AND interpolation=? AND externalGeneratorDataHash=?");
    v64 = v25;
    if (v25)
    {
      -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v25);
      -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", (int)a4, 2, v25);
      -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", v17, 3, v25);
      -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a6, 4, v25);
      v59 = a7;
      -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a7, 5, v25);
      -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", v61, 6, v25);
      -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a14, 7, v25);
      v63 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, &v63);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v63;
      v62 = 0;
      v27 = -[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v25, &v62);
      database = self->_database;
      if (v27 && v62)
      {
        v29 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](database, "unsignedLongLongFromColumn:inStatement:", 0, v25);
        -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v64);
        v64 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "UPDATE thumbnails SET width=?, height=?, bitmapFormat=?, bitmapdata_location=?, bitmapdata_length=?, plistbuffer_location=?, plistbuffer_length=?, flavor=?, content_rect=?, icon_variant=?, interpolation=?, externalGeneratorDataHash=? WHERE rowid=?");
        if (v64)
        {
          v30 = self->_database;
          v31 = objc_msgSend(v21, "width");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v30, "bindUnsignedLongLong:atIndex:inStatement:", v31, 1, v64);
          v32 = self->_database;
          v33 = objc_msgSend(v21, "height");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v32, "bindUnsignedLongLong:atIndex:inStatement:", v33, 2, v64);
          v34 = v60;
          -[QLSqliteDatabase bindObject:atIndex:inStatement:](self->_database, "bindObject:atIndex:inStatement:", v60, 3, v64);
          v35 = self->_database;
          v36 = objc_msgSend(v22, "location");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v35, "bindUnsignedLongLong:atIndex:inStatement:", v36, 4, v64);
          v37 = self->_database;
          v38 = objc_msgSend(v22, "length");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v37, "bindUnsignedLongLong:atIndex:inStatement:", v38, 5, v64);
          v39 = self->_database;
          v40 = objc_msgSend(v23, "location");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v39, "bindUnsignedLongLong:atIndex:inStatement:", v40, 6, v64);
          v41 = self->_database;
          v42 = objc_msgSend(v23, "length");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v41, "bindUnsignedLongLong:atIndex:inStatement:", v42, 7, v64);
          -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a12, 8, v64);
          -[QLSqliteDatabase bindBytes:length:atIndex:inStatement:](self->_database, "bindBytes:length:atIndex:inStatement:", &v65, 32, 9, v64);
          -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", v59, 10, v64);
          -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", v61, 11, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a14, 12, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", v29, 13, v64);
LABEL_14:
          LOBYTE(v25) = -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v64);
          -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v64);

          goto LABEL_15;
        }
      }
      else
      {
        -[QLSqliteDatabase finalizeStatement:](database, "finalizeStatement:", &v64);
        v64 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "INSERT INTO thumbnails (file_id, size, icon_mode, width, height, bitmapFormat, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length, flavor, content_rect, hit_count, last_hit_date, badge_type, icon_variant, interpolation, externalGeneratorDataHash) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        if (v64)
        {
          if (v24)
            v43 = v24;
          else
            v43 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v43, "timeIntervalSinceReferenceDate");
          v45 = v44;
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", (unint64_t)a4, 2, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", v17, 3, v64);
          v46 = self->_database;
          v47 = objc_msgSend(v21, "width");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v46, "bindUnsignedLongLong:atIndex:inStatement:", v47, 4, v64);
          v48 = self->_database;
          v49 = objc_msgSend(v21, "height");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v48, "bindUnsignedLongLong:atIndex:inStatement:", v49, 5, v64);
          v34 = v60;
          -[QLSqliteDatabase bindObject:atIndex:inStatement:](self->_database, "bindObject:atIndex:inStatement:", v60, 6, v64);
          v50 = self->_database;
          v51 = objc_msgSend(v22, "location");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v50, "bindUnsignedLongLong:atIndex:inStatement:", v51, 7, v64);
          v52 = self->_database;
          v53 = objc_msgSend(v22, "length");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v52, "bindUnsignedLongLong:atIndex:inStatement:", v53, 8, v64);
          v54 = self->_database;
          v55 = objc_msgSend(v23, "location");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v54, "bindUnsignedLongLong:atIndex:inStatement:", v55, 9, v64);
          v56 = self->_database;
          v57 = objc_msgSend(v23, "length");
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](v56, "bindUnsignedLongLong:atIndex:inStatement:", v57, 10, v64);
          -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", a12, 11, v64);
          -[QLSqliteDatabase bindBytes:length:atIndex:inStatement:](self->_database, "bindBytes:length:atIndex:inStatement:", &v65, 32, 12, v64);
          -[QLSqliteDatabase bindInt:atIndex:inStatement:](self->_database, "bindInt:atIndex:inStatement:", 1, 13, v64);
          -[QLSqliteDatabase bindDouble:atIndex:inStatement:](self->_database, "bindDouble:atIndex:inStatement:", 14, v64, v45);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a6, 15, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", v59, 16, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", (int)v61, 17, v64);
          -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a14, 18, v64);
          goto LABEL_14;
        }
      }

      LOBYTE(v25) = 0;
    }
  }
  else
  {
    LOBYTE(v25) = 0;
  }
LABEL_15:

  return (char)v25;
}

- (id)removeThumbnailForFileIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[QLCacheIndexDatabase _cacheIdForFileIdentifier:createVersion:](self, "_cacheIdForFileIdentifier:createVersion:", v4, 0);
  -[QLCacheIndexDatabase removeAllThumbnailsForCacheId:](self, "removeAllThumbnailsForCacheId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();

  objc_msgSend(v7, "removeFromDatabase:fileWithCacheId:", self->_database, v5);
  return v6;
}

- (id)removeAllThumbnailsForCacheId:(unint64_t)a3
{
  void *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v9;
  void *v10;
  sqlite3_stmt *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  sqlite3_stmt *v16;
  char v17;
  sqlite3_stmt *v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE file_id=?");
  v18 = v6;
  if (!v6)
  {
    v14 = v5;
LABEL_14:
    v10 = v14;
    goto LABEL_15;
  }
  v7 = v6;
  -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v6);
  v17 = 0;
  while (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v7, &v17)
       && v17 != 0)
    -[QLCacheIndexDatabase add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:](self, "add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:", 2, 0, v7, v5);
  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v18);
  v9 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "DELETE FROM thumbnails WHERE file_id=?");
  v16 = v9;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
  {
    v11 = v9;
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v9);
    v12 = -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v11);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v16);
    if (v12)
      v13 = v5;
    else
      v13 = v10;
    v14 = v13;
    goto LABEL_14;
  }
LABEL_15:

  return v10;
}

- (id)removePercentageOldestThumbnails:(unint64_t)a3
{
  double v5;
  unint64_t v6;
  NSObject *v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (double)-[QLCacheIndexDatabase thumbnailCount](self, "thumbnailCount");
  v6 = vcvtpd_u64_f64((double)a3 / 100.0 * v5);
  _log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134218496;
    v12 = a3;
    v13 = 2048;
    v14 = v6;
    v15 = 2048;
    v16 = (unint64_t)v5;
    _os_log_debug_impl(&dword_1D54AE000, v7, OS_LOG_TYPE_DEBUG, "Removing %llu%% oldest thumbnails, which is %lu thumbnails out of total of %lu", (uint8_t *)&v11, 0x20u);
  }

  v8 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT rowid, bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails ORDER BY last_hit_date ASC LIMIT ?");
  if (v8)
  {
    v9 = v8;
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", v6, 1, v8);
    -[QLCacheIndexDatabase _removeThumbnailsFromStatement:](self, "_removeThumbnailsFromStatement:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)batchOfFileProviderItemsStartingAtRowId:(unint64_t)a3 endingAtRowId:(unint64_t *)a4
{
  void *v7;
  void *v8;
  QLSqliteDatabase *database;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  char v21;
  uint64_t v22;

  objc_msgSend(MEMORY[0x1E0CD3280], "queryStringToFindCacheIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" rowid > ? LIMIT 50"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  database = self->_database;
  v10 = objc_retainAutorelease(v8);
  v11 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", objc_msgSend(v10, "UTF8String"));
  v22 = v11;
  if (v11)
  {
    v12 = v11;
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v11);
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v12, &v21))
      v15 = v21 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      do
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD3288]), "initWithSteppedStatement:database:", v12, self->_database);
        v17 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v12);
        if (v17 > v14)
          v14 = v17;
        objc_msgSend(v16, "fileIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

      }
      while (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v12, &v21)&& v21);
    }
    if (a4)
      *a4 = v14;
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v22);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)batchOfRegularItemsStartingAtRowId:(unint64_t)a3 endingAtRowId:(unint64_t *)a4
{
  void *v7;
  void *v8;
  QLSqliteDatabase *database;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  unint64_t v17;
  void *v18;
  char v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0CD3270], "queryStringToFindCacheIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" rowid > ? LIMIT 50"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  database = self->_database;
  v10 = objc_retainAutorelease(v8);
  v11 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", objc_msgSend(v10, "UTF8String"));
  v21 = v11;
  if (v11)
  {
    v12 = v11;
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", a3, 1, v11);
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v12, &v20))
      v15 = v20 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      do
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD3278]), "initWithSteppedStatement:database:", v12, self->_database);
        v17 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v12);
        if (v17 > v14)
          v14 = v17;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v18);

      }
      while (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v12, &v20)&& v20);
    }
    if (a4)
      *a4 = v14;
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v21);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

- (id)removeThumbnailsForDeletedFiles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  QLCacheIndexDatabase *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLCacheIndexDatabase itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLCacheIndexDatabase batchOfFileProviderItemsStartingAtRowId:endingAtRowId:](self, "batchOfFileProviderItemsStartingAtRowId:endingAtRowId:", 0, &v43);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v27 = self;
    v28 = v3;
    do
    {
      v29 = v43;
      v10 = dispatch_group_create();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v40 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            dispatch_group_enter(v10);
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke;
            v35[3] = &unk_1E99D2928;
            v36 = v8;
            v37 = v16;
            v38 = v10;
            objc_msgSend(v7, "fetchItemForItemID:completionHandler:", v16, v35);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v13);
      }

      dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2;
      v33[3] = &unk_1E99D2978;
      self = v27;
      v3 = v28;
      v33[4] = v27;
      v34 = v28;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);

      v17 = v29;
      -[QLCacheIndexDatabase batchOfFileProviderItemsStartingAtRowId:endingAtRowId:](v27, "batchOfFileProviderItemsStartingAtRowId:endingAtRowId:", v29, &v43);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (objc_msgSend(v9, "count"));
  }
  else
  {
    v17 = 0;
  }
  -[QLCacheIndexDatabase batchOfRegularItemsStartingAtRowId:endingAtRowId:](self, "batchOfRegularItemsStartingAtRowId:endingAtRowId:", v17, &v43, v27, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    do
    {
      v19 = v43;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_141;
      v30[3] = &unk_1E99D29A0;
      v31 = v20;
      v32 = v21;
      v22 = v21;
      v23 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v30);
      -[QLCacheIndexDatabase removeBasicFilesWithRowids:](self, "removeBasicFilesWithRowids:", v23);
      -[QLCacheIndexDatabase removeThumbnailsWithCacheIds:](self, "removeThumbnailsWithCacheIds:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v24);

      -[QLCacheIndexDatabase batchOfRegularItemsStartingAtRowId:endingAtRowId:](self, "batchOfRegularItemsStartingAtRowId:endingAtRowId:", v19, &v43);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v25;
    }
    while (objc_msgSend(v25, "count"));
  }
  else
  {
    v25 = v18;
  }

  return v3;
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "providerDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v7);

    if (a2)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    goto LABEL_3;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "prepareStatement:", "SELECT rowid FROM provider_files WHERE fileProviderId = ? AND itemId IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
  v22 = v9;
  if (v9)
  {
    v10 = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bindObject:atIndex:inStatement:", v5, 1, v9);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_138;
    v18[3] = &unk_1E99D2950;
    v18[4] = v11;
    v21 = v10;
    v13 = v7;
    v19 = v13;
    v14 = v8;
    v20 = v14;
    objc_msgSend(v12, "runStatement:withBoundObjects:startingAtIndex:stepHandler:", v10, v6, 2, v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "finalizeStatement:", &v22);
    objc_msgSend(*(id *)(a1 + 32), "removeUbiquitousFilesWithRowids:", v13);
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "removeThumbnailsWithCacheIds:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

  }
  else
  {
    _log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_cold_1();

  }
}

uint64_t __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_138(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongFromColumn:inStatement:", 0, *(_QWORD *)(a1 + 56));

  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0CD3280], "cacheIdFromRowId:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  return 1;
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  fsid_t v9;
  char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "fileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (fsgetpath(v10, 0x400uLL, &v9, objc_msgSend(v6, "fileId", objc_msgSend(v6, "fsid"))) <= 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0CD3270], "cacheIdFromRowId:", objc_msgSend(v5, "unsignedLongLongValue")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (BOOL)add:(unint64_t)a3 blobInfosStartingAtColumn:(unint64_t)a4 ofSteppedStatement:(sqlite3_stmt *)a5 toArray:(id)a6
{
  id i;
  QLCacheBlobInfo *v11;

  for (i = a6; a3; --a3)
  {
    v11 = objc_alloc_init(QLCacheBlobInfo);
    -[QLCacheBlobInfo setLocation:](v11, "setLocation:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", a4, a5));
    -[QLCacheBlobInfo setLength:](v11, "setLength:", -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", (a4 + 1), a5));
    if (-[QLCacheBlobInfo length](v11, "length"))
      objc_msgSend(i, "addObject:", v11);

    a4 = (a4 + 2);
  }

  return 1;
}

- (id)removeThumbnailsWithCacheIds:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  void *v7;
  QLSqliteDatabase *database;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  QLCacheIndexDatabase *v17;
  id v18;
  sqlite3_stmt *v19;
  sqlite3_stmt *v20;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", objc_msgSend(CFSTR("SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails WHERE file_id IN  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), "UTF8String"));
    v20 = v5;
    if (v5)
    {
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      database = self->_database;
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __53__QLCacheIndexDatabase_removeThumbnailsWithCacheIds___block_invoke;
      v16 = &unk_1E99D29C8;
      v17 = self;
      v19 = v6;
      v9 = v7;
      v18 = v9;
      -[QLSqliteDatabase runStatement:withBoundNumbers:startingAtIndex:stepHandler:](database, "runStatement:withBoundNumbers:startingAtIndex:stepHandler:", v6, v4, 1, &v13);
      -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v20, v13, v14, v15, v16, v17);
      v20 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", objc_msgSend(CFSTR("DELETE FROM thumbnails WHERE file_id IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), "UTF8String"));
      -[QLSqliteDatabase runStatement:withBoundNumbers:startingAtIndex:stepHandler:](self->_database, "runStatement:withBoundNumbers:startingAtIndex:stepHandler:", v20, v4, 1, 0);
      -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v20);
      v10 = v18;
      v11 = v9;

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

uint64_t __53__QLCacheIndexDatabase_removeThumbnailsWithCacheIds___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:", 2, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return 1;
}

- (void)removeUbiquitousFilesWithRowids:(id)a3
{
  QLSqliteDatabase *database;
  id v5;
  uint64_t v6;

  database = self->_database;
  v5 = a3;
  v6 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", objc_msgSend(CFSTR("DELETE FROM provider_files WHERE rowid IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), "UTF8String"));
  -[QLSqliteDatabase runStatement:withBoundNumbers:startingAtIndex:stepHandler:](self->_database, "runStatement:withBoundNumbers:startingAtIndex:stepHandler:", v6, v5, 1, 0);

  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v6);
}

- (void)removeBasicFilesWithRowids:(id)a3
{
  QLSqliteDatabase *database;
  id v5;
  uint64_t v6;

  database = self->_database;
  v5 = a3;
  v6 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", objc_msgSend(CFSTR("DELETE FROM basic_files WHERE rowid IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), "UTF8String"));
  -[QLSqliteDatabase runStatement:withBoundNumbers:startingAtIndex:stepHandler:](self->_database, "runStatement:withBoundNumbers:startingAtIndex:stepHandler:", v6, v5, 1, 0);

  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v6);
}

- (id)removeFilesWithFileInfo:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        _log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "fileIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v11;
          _os_log_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_INFO, "removing file %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "cacheId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_msgSend(v9, "fileIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fileIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_opt_class();

        objc_msgSend(v15, "tableName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = objc_msgSend(v16, "isEqualToString:", CFSTR("basic_files"));

        if ((_DWORD)v14)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "rowIdFromCacheId:", objc_msgSend(v9, "cacheId")));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v23;
        }
        else
        {
          objc_msgSend(v15, "tableName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("provider_files"));

          if (!v20)
            continue;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v15, "rowIdFromCacheId:", objc_msgSend(v9, "cacheId")));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v22;
        }
        objc_msgSend(v18, "addObject:", v17);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)removeFilesFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  return -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:](self, "removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:", a3, 1);
}

- (id)removeFilesFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  return -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:](self, "removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:", a3, 0);
}

- (id)removeFilesFromUninstalledFileProvidersWithIdentifiers:(id)a3 whichAreRemaining:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;
  QLSqliteDatabase *database;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  QLSqliteDatabase *v20;
  void *v21;
  QLSqliteDatabase *v22;
  id v23;
  NSObject *v24;
  void *v25;
  QLSqliteDatabase *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  unint64_t v30;
  QLSqliteDatabase *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v37;
  __CFString *v38;
  void *v39;
  void *v40;
  uint8_t v41[16];
  uint8_t buf[8];
  _QWORD v43[5];
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;

  v4 = a4;
  v6 = a3;
  v7 = CFSTR("IN");
  if (v4)
    v7 = CFSTR("NOT IN");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT rowid FROM provider_files WHERE fileProviderId %@ ("), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    do
    {
      if (v11)
        v12 = CFSTR(",?");
      else
        v12 = CFSTR("?");
      objc_msgSend(v10, "appendString:", v12);
      ++v11;
    }
    while (v11 < objc_msgSend(v6, "count"));
  }
  objc_msgSend(v9, "appendString:", v10);
  objc_msgSend(v9, "appendString:", CFSTR(")"));
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  database = self->_database;
  v16 = objc_retainAutorelease(v9);
  v17 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", objc_msgSend(v16, "UTF8String"));
  v47 = v17;
  if (v17)
  {
    v18 = v17;
    v39 = v14;
    v40 = v13;
    if (objc_msgSend(v6, "count"))
    {
      v19 = 0;
      do
      {
        v20 = self->_database;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLSqliteDatabase bindObject:atIndex:inStatement:](v20, "bindObject:atIndex:inStatement:", v21, ++v19, v18);

      }
      while (v19 < objc_msgSend(v6, "count"));
    }
    v22 = self->_database;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __97__QLCacheIndexDatabase_removeFilesFromUninstalledFileProvidersWithIdentifiers_whichAreRemaining___block_invoke;
    v43[3] = &unk_1E99D2950;
    v43[4] = self;
    v46 = v18;
    v37 = v40;
    v44 = v37;
    v23 = v39;
    v45 = v23;
    -[QLSqliteDatabase runStatement:stepHandler:](v22, "runStatement:stepHandler:", v18, v43);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v47);
    _log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D54AE000, v24, OS_LOG_TYPE_DEFAULT, "Clearing download deny list for removed domains during fileprovider uninstallation", buf, 2u);
    }

    v38 = v8;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DELETE FROM missing_remote_thumbnails WHERE fileProviderId %@ ("), v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendString:", v10);
    objc_msgSend(v25, "appendString:", CFSTR(")"));
    v26 = self->_database;
    v27 = objc_retainAutorelease(v25);
    v28 = -[QLSqliteDatabase prepareStatement:](v26, "prepareStatement:", objc_msgSend(v27, "UTF8String"));
    *(_QWORD *)buf = v28;
    if (!v28)
    {
      _log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:].cold.2();

    }
    if (objc_msgSend(v6, "count"))
    {
      v30 = 0;
      do
      {
        v31 = self->_database;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLSqliteDatabase bindObject:atIndex:inStatement:](v31, "bindObject:atIndex:inStatement:", v32, ++v30, v28);

      }
      while (v30 < objc_msgSend(v6, "count"));
    }
    -[QLSqliteDatabase runStatement:stepHandler:](self->_database, "runStatement:stepHandler:", v28, 0);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", buf);
    _log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_1D54AE000, v33, OS_LOG_TYPE_DEFAULT, "Finished clearing download deny list for removed domains during fileprovider uninstallation", v41, 2u);
    }

    -[QLCacheIndexDatabase removeUbiquitousFilesWithRowids:](self, "removeUbiquitousFilesWithRowids:", v37);
    -[QLCacheIndexDatabase removeThumbnailsWithCacheIds:](self, "removeThumbnailsWithCacheIds:", v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v38;
    v14 = v39;
    v13 = v40;
  }
  else
  {
    _log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:].cold.1();

    v34 = 0;
  }

  return v34;
}

uint64_t __97__QLCacheIndexDatabase_removeFilesFromUninstalledFileProvidersWithIdentifiers_whichAreRemaining___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongFromColumn:inStatement:", 0, *(_QWORD *)(a1 + 56));

  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0CD3280], "cacheIdFromRowId:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  return 1;
}

- (unint64_t)missingRemoteThumbnailsCountForFileProviderIds:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  QLSqliteDatabase *database;
  id v9;
  unint64_t v10;
  BOOL v11;
  char v13;
  unint64_t v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT count(itemId) FROM missing_remote_thumbnails WHERE fileProviderId IN ("));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      if (v6)
        v7 = CFSTR(",?");
      else
        v7 = CFSTR("?");
      objc_msgSend(v5, "appendString:", v7);
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  database = self->_database;
  v9 = objc_retainAutorelease(v5);
  v10 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", objc_msgSend(v9, "UTF8String"));
  v14 = v10;
  if (v10)
  {
    v13 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v10, &v13))
      v11 = v13 == 0;
    else
      v11 = 1;
    if (v11)
      v10 = 0;
    else
      v10 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v10);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v14);
  }

  return v10;
}

- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  QLSqliteDatabase *database;
  sqlite3_stmt *v8;

  v4 = a3;
  v5 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "UPDATE thumbnails SET last_hit_date=?");
  v8 = v5;
  if (v5)
  {
    database = self->_database;
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 1, v5);
    LOBYTE(v5) = -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v5);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v8);
  }

  return (char)v5;
}

- (id)enumeratorForAllUbiquitousFiles:(BOOL)a3 withExtraInfo:(BOOL)a4
{
  return -[QLCacheIndexDatabaseFileInfoEnumerator initWithSqliteDatabase:toEnumerateUbiquitousFiles:extraInfo:]([QLCacheIndexDatabaseFileInfoEnumerator alloc], "initWithSqliteDatabase:toEnumerateUbiquitousFiles:extraInfo:", self->_database, a3, a4);
}

- (unint64_t)sizeSumOfThumbnailsOlderThanDate:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  QLSqliteDatabase *database;
  BOOL v7;
  char v9;
  sqlite3_stmt *v10;

  v4 = a3;
  v5 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT SUM(bitmapdata_length) FROM thumbnails WHERE last_hit_date<?");
  v10 = v5;
  if (v5)
  {
    database = self->_database;
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    -[QLSqliteDatabase bindDouble:atIndex:inStatement:](database, "bindDouble:atIndex:inStatement:", 1, v5);
    v9 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v5, &v9))
      v7 = v9 == 0;
    else
      v7 = 1;
    if (v7)
      v5 = 0;
    else
      v5 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v5);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v10);
  }

  return (unint64_t)v5;
}

- (id)allReservedBuffers
{
  void *v3;
  sqlite3_stmt *v4;
  sqlite3_stmt *v5;
  char v8;
  sqlite3_stmt *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT location, length FROM reserved_buffer");
  v9 = v4;
  if (v4)
  {
    v5 = v4;
    v8 = 0;
    while (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v5, &v8)
         && v8 != 0)
      -[QLCacheIndexDatabase add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:](self, "add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:", 1, 0, v5, v3);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v9);
  }
  return v3;
}

- (id)allBuffersIncludingReserved:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  void *v9;
  char v11;
  sqlite3_stmt *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT bitmapdata_location, bitmapdata_length, plistbuffer_location, plistbuffer_length FROM thumbnails");
  v12 = v6;
  if (v6)
  {
    v7 = v6;
    v11 = 0;
    while (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v7, &v11)
         && v11 != 0)
      -[QLCacheIndexDatabase add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:](self, "add:blobInfosStartingAtColumn:ofSteppedStatement:toArray:", 2, 0, v7, v5);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v12);
    if (v3)
    {
      -[QLCacheIndexDatabase allReservedBuffers](self, "allReservedBuffers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v9);

    }
  }
  return v5;
}

- (void)addReservedBufferWithBlobInfo:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  NSObject *v7;
  sqlite3_stmt *v8;

  v4 = a3;
  v5 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "INSERT INTO reserved_buffer (location, length) VALUES (?, ?)");
  v8 = v5;
  if (v5)
  {
    v6 = v5;
    _log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[QLCacheIndexDatabase addReservedBufferWithBlobInfo:].cold.1(v4, v7);

    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v4, "location"), 1, v6);
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v4, "length"), 2, v6);
    -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v6);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v8);
  }

}

- (BOOL)removeReservedBufferWithBlobInfo:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v7;

  v4 = a3;
  v5 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "DELETE FROM reserved_buffer WHERE location=?");
  v7 = v5;
  if (v5)
  {
    -[QLSqliteDatabase bindUnsignedLongLong:atIndex:inStatement:](self->_database, "bindUnsignedLongLong:atIndex:inStatement:", objc_msgSend(v4, "location"), 1, v5);
    LOBYTE(v5) = -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v5);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v7);
  }

  return (char)v5;
}

- (unint64_t)reserveBufferCount
{
  sqlite3_stmt *v3;
  BOOL v4;
  char v6;
  sqlite3_stmt *v7;

  v3 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT count(location) FROM reserved_buffer");
  v7 = v3;
  if (v3)
  {
    v6 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v3, &v6))
      v4 = v6 == 0;
    else
      v4 = 1;
    if (v4)
      v3 = 0;
    else
      v3 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v3);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v7);
  }
  return (unint64_t)v3;
}

- (unint64_t)reserveBufferSize
{
  sqlite3_stmt *v3;
  BOOL v4;
  char v6;
  sqlite3_stmt *v7;

  v3 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT SUM(length) FROM reserved_buffer");
  v7 = v3;
  if (v3)
  {
    v6 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v3, &v6))
      v4 = v6 == 0;
    else
      v4 = 1;
    if (v4)
      v3 = 0;
    else
      v3 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v3);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v7);
  }
  return (unint64_t)v3;
}

- (void)_createTables
{
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE TABLE preferences (key TEXT UNIQUE PRIMARY KEY, value TEXT)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE INDEX key ON preferences (key)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "INSERT INTO preferences (key, value) VALUES ('version', '%d')", 12);
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE TABLE basic_files (fileId INTEGER PRIMARY KEY, fsid INTEGER, version BLOB)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE TABLE provider_files (fileProviderId TEXT, itemId TEXT, version BLOB)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE UNIQUE INDEX fileProviderIdItemId ON provider_files (fileProviderId, itemId)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE TABLE thumbnails (file_id INTEGER, size REAL, icon_mode INTEGER, hit_count INTEGER, last_hit_date REAL, width INTEGER, height INTEGER, bitmapFormat BLOB, bitmapdata_location INTEGER, bitmapdata_length INTEGER, plistbuffer_location INTEGER, plistbuffer_length INTEGER, flavor INTEGER, content_rect BLOB, badge_type INTEGER, icon_variant INTEGER, interpolation INTEGER, externalGeneratorDataHash INTEGER)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE UNIQUE INDEX size ON thumbnails (file_id, size, icon_mode, badge_type, icon_variant, interpolation, externalGeneratorDataHash)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE INDEX last_hit_date ON thumbnails (last_hit_date)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE TABLE reserved_buffer (location INTEGER, length INTEGER)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE UNIQUE INDEX location_reserved_buffer ON reserved_buffer (location)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE TABLE missing_remote_thumbnails (fileProviderId TEXT, itemId TEXT, version BLOB, date REAL)");
  -[QLSqliteDatabase execute:](self->_database, "execute:", "CREATE UNIQUE INDEX missing_remote_thumbnails_index ON missing_remote_thumbnails (fileProviderId, itemId)");
}

- (void)_deleteAllTables
{
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  void *v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  sqlite3_stmt *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT name FROM sqlite_master WHERE type='table'");
  v21 = v3;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_opt_new();
    v20 = 0;
    if (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v4, &v20))
      v6 = v20 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      do
      {
        v7 = -[QLSqliteDatabase newStringFromColumn:inStatement:uniqueInStringTable:](self->_database, "newStringFromColumn:inStatement:uniqueInStringTable:", 0, v4, 0);
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = objc_retainAutorelease(v7);
        v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("DROP TABLE %s"), objc_msgSend(v9, "UTF8String"));
        objc_msgSend(v5, "addObject:", v10);

      }
      while (-[QLSqliteDatabase stepStatement:didReturnData:](self->_database, "stepStatement:didReturnData:", v4, &v20)&& v20);
    }
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v21);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[QLSqliteDatabase execute:](self->_database, "execute:", objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i)), "UTF8String"));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v13);
    }

  }
}

- (unint64_t)fileEntryCount
{
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  unint64_t v5;
  sqlite3_stmt *v7;

  if (!-[QLSqliteDatabase isOpened](self->_database, "isOpened"))
    return 0;
  v3 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT sum(count) FROM (SELECT COUNT(*) AS count FROM basic_files UNION ALL SELECT COUNT(*) AS count FROM provider_files)");
  v7 = v3;
  if (!v3)
    return 0;
  v4 = v3;
  -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v3);
  v5 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v4);
  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v7);
  return v5;
}

- (unint64_t)thumbnailCount
{
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  unint64_t v5;
  sqlite3_stmt *v7;

  if (!-[QLSqliteDatabase isOpened](self->_database, "isOpened"))
    return 0;
  v3 = -[QLSqliteDatabase prepareStatement:](self->_database, "prepareStatement:", "SELECT COUNT(*) FROM thumbnails");
  v7 = v3;
  if (!v3)
    return 0;
  v4 = v3;
  -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v3);
  v5 = -[QLSqliteDatabase unsignedLongLongFromColumn:inStatement:](self->_database, "unsignedLongLongFromColumn:inStatement:", 0, v4);
  -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v7);
  return v5;
}

- (id)lastCrapWithDate:(id *)a3
{
  return -[QLSqliteDatabase lastCrapWithDate:](self->_database, "lastCrapWithDate:", a3);
}

- (void)noteRemoteThumbnailMissingForItems:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  QLSqliteDatabase *database;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  QLSqliteDatabase *v13;
  void *v14;
  void *v15;
  QLSqliteDatabase *v16;
  void *v17;
  void *v18;
  QLSqliteDatabase *v19;
  void *v20;
  void *v21;
  void *v22;
  QLSqliteDatabase *v23;
  __CFString *v24;
  uint64_t v25;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      v6 = CFSTR("INSERT OR REPLACE INTO missing_remote_thumbnails(fileProviderId, itemId, version, date) VALUES ");
      do
      {
        if (v5)
        {
          -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(","));
          v7 = objc_claimAutoreleasedReturnValue();

          v6 = (__CFString *)v7;
        }
        -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("(?,?,?,?)"));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v5;
        v6 = v8;
      }
      while (v5 < objc_msgSend(v4, "count"));
    }
    else
    {
      v8 = CFSTR("INSERT OR REPLACE INTO missing_remote_thumbnails(fileProviderId, itemId, version, date) VALUES ");
    }
    database = self->_database;
    v24 = objc_retainAutorelease(v8);
    v10 = -[QLSqliteDatabase prepareStatement:](database, "prepareStatement:", -[__CFString UTF8String](v24, "UTF8String"));
    v25 = v10;
    if (objc_msgSend(v4, "count"))
    {
      v11 = 0;
      v12 = 4;
      do
      {
        v13 = self->_database;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "providerDomainID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLSqliteDatabase bindObject:atIndex:inStatement:](v13, "bindObject:atIndex:inStatement:", v15, (v12 - 3), v10);

        v16 = self->_database;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "itemIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLSqliteDatabase bindObject:atIndex:inStatement:](v16, "bindObject:atIndex:inStatement:", v18, (v12 - 2), v10);

        v19 = self->_database;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "itemVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contentVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLSqliteDatabase bindObject:atIndex:inStatement:](v19, "bindObject:atIndex:inStatement:", v22, (v12 - 1), v10);

        v23 = self->_database;
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        -[QLSqliteDatabase bindDouble:atIndex:inStatement:](v23, "bindDouble:atIndex:inStatement:", v12, v10);
        ++v11;
        v12 = (v12 + 4);
      }
      while (objc_msgSend(v4, "count") > v11);
    }
    -[QLSqliteDatabase stepStatement:](self->_database, "stepStatement:", v10);
    -[QLSqliteDatabase finalizeStatement:](self->_database, "finalizeStatement:", &v25);

  }
}

- (id)itemsGroupedByProviderDomain:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "providerDomainID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "providerDomainID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

        }
        objc_msgSend(v12, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)noteRemoteThumbnailPresentForItems:(id)a3
{
  void *v4;
  QLSqliteDatabase *v5;
  QLSqliteDatabase *v6;
  id v7;
  _QWORD v8[4];
  QLSqliteDatabase *v9;
  const char *v10;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[QLCacheIndexDatabase itemsGroupedByProviderDomain:](self, "itemsGroupedByProviderDomain:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_database;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__QLCacheIndexDatabase_noteRemoteThumbnailPresentForItems___block_invoke;
    v8[3] = &unk_1E99D29F0;
    v9 = v5;
    v10 = "DELETE FROM missing_remote_thumbnails WHERE fileProviderId = ? AND itemId IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    v6 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __59__QLCacheIndexDatabase_noteRemoteThumbnailPresentForItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "itemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v14 = objc_msgSend(*(id *)(a1 + 32), "prepareStatement:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "bindObject:atIndex:inStatement:", v5, 1, v14);
  objc_msgSend(*(id *)(a1 + 32), "runStatement:withBoundObjects:startingAtIndex:stepHandler:", v14, v7, 2, 0);
  objc_msgSend(*(id *)(a1 + 32), "finalizeStatement:", &v14);

}

- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3
{
  void *v4;
  QLSqliteDatabase *v5;
  id v6;
  id v7;
  QLSqliteDatabase *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  QLSqliteDatabase *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  -[QLCacheIndexDatabase itemsGroupedByProviderDomain:](self, "itemsGroupedByProviderDomain:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_database;
  v19 = -[QLSqliteDatabase prepareStatement:](v5, "prepareStatement:", "SELECT itemId, version FROM missing_remote_thumbnails WHERE fileProviderId = ? AND itemId IN (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke;
  v15 = &unk_1E99D2A40;
  v16 = v5;
  v18 = v19;
  v7 = v6;
  v17 = v7;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);
  -[QLSqliteDatabase finalizeStatement:](v8, "finalizeStatement:", &v19, v12, v13, v14, v15);
  v9 = v17;
  v10 = v7;

  return v10;
}

void __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v12, "itemVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentVersion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "bindObject:atIndex:inStatement:", v5, 1, *(_QWORD *)(a1 + 48));
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke_208;
  v33[3] = &unk_1E99D2A18;
  v19 = *(id *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 48);
  v34 = v19;
  v37 = v20;
  v21 = v7;
  v35 = v21;
  v36 = &v42;
  objc_msgSend(v16, "runStatement:withBoundObjects:startingAtIndex:stepHandler:", v17, v18, 2, v33);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v48, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        v27 = (void *)v43[5];
        objc_msgSend(v26, "itemIdentifier", (_QWORD)v29);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v27) = objc_msgSend(v27, "containsObject:", v28);

        if ((v27 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v26);
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v48, 16);
    }
    while (v23);
  }

  _Block_object_dispose(&v42, 8);
}

uint64_t __73__QLCacheIndexDatabase_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke_208(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newStringFromColumn:inStatement:uniqueInStringTable:", 0, *(_QWORD *)(a1 + 56), 0);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "newDataFromColumn:inStatement:copyBytes:", 1, *(_QWORD *)(a1 + 56), 0);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v3) & 1) != 0 || !v3 && !objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v2);

  return 1;
}

- (unint64_t)maxThumbnailLifeTime
{
  return self->_maxThumbnailLifeTime;
}

- (QLSqliteDatabase)database
{
  return (QLSqliteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (FPItemManager)itemManager
{
  return (FPItemManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)initWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1D54AE000, a2, a3, "max life time for a thumbnail %llu seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)doesExist
{
  OUTLINED_FUNCTION_4(&dword_1D54AE000, a2, a3, "index exists %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)isValid
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "index database is valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)insertOrUpdateThumbnailWithVersionedFileIdentifier:(_BYTE *)a1 shouldInvalidAllThumbnailSizes:(uint64_t)a2 added:(NSObject *)a3 .cold.1(_BYTE *a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = "";
  if (!*a1)
    v3 = " not";
  v4 = 136315394;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_7(&dword_1D54AE000, a3, (uint64_t)a3, "all thumbnails should%s be invalidate for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __55__QLCacheIndexDatabase_removeThumbnailsForDeletedFiles__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Could not prepare statement to find rowids to delete deleted items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeThumbnailsOlderThanDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1D54AE000, a2, a3, "remove thumbnails older than %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Could not prepare statement to retrieve rowids for fileprovider uninstallation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeFilesFromUninstalledFileProvidersWithIdentifiers:whichAreRemaining:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Could not prepare statement to clear download deny list for fileprovider uninstallation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addReservedBufferWithBlobInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "location");
  v7 = 2048;
  v8 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_7(&dword_1D54AE000, a2, v4, "Adding reserved buffer (%llu, %llu)", (uint8_t *)&v5);
}

@end
