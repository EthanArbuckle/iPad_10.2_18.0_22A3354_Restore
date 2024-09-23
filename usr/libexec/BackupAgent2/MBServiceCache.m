@implementation MBServiceCache

+ (id)systemPath
{
  return objc_msgSend((id)MBGetCacheDir(a1, a2), "stringByAppendingPathComponent:", CFSTR("cache.db"));
}

+ (id)cacheWithPath:(id)a3
{
  return -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", a3, objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0)));
}

- (MBServiceCache)initWithPath:(id)a3 domainManager:(id)a4
{
  MBServiceCache *v6;
  NSObject *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSMutableSet *upToDateBackupUDIDs;
  objc_super v13;

  if (!a4)
    sub_100087630();
  v13.receiver = self;
  v13.super_class = (Class)MBServiceCache;
  v6 = -[MBServiceCache init](&v13, "init");
  if (v6)
  {
    v6->_path = (NSString *)a3;
    v6->_domainManager = (MBDomainManager *)a4;
    v6->_stmtsBySQL = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7 = MBGetSQLLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      v6->_countAndTimeBySQL = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (qword_1000F9DE0 != -1)
      dispatch_once(&qword_1000F9DE0, &stru_1000D9418);
    v8 = (void *)qword_1000F9DE8;
    objc_sync_enter((id)qword_1000F9DE8);
    v9 = (NSMutableSet *)objc_msgSend((id)qword_1000F9DE8, "objectForKeyedSubscript:", a3);
    v6->_upToDateBackupUDIDs = v9;
    if (!v9)
    {
      v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v6->_upToDateBackupUDIDs = v10;
      objc_msgSend((id)qword_1000F9DE8, "setObject:forKeyedSubscript:", v10, a3);
    }
    objc_sync_exit(v8);
    upToDateBackupUDIDs = v6->_upToDateBackupUDIDs;
    objc_sync_enter(upToDateBackupUDIDs);
    -[NSMutableSet removeAllObjects](v6->_upToDateBackupUDIDs, "removeAllObjects");
    objc_sync_exit(upToDateBackupUDIDs);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MBServiceCache close](self, "close");

  v3.receiver = self;
  v3.super_class = (Class)MBServiceCache;
  -[MBServiceCache dealloc](&v3, "dealloc");
}

- (void)_remove
{
  NSObject *v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];

  v3 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing cache db", buf, 2u);
    _MBLog(CFSTR("INFO"), "Removing cache db");
  }
  v4 = -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", self->_path, 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)MBSQLiteJournalSuffixes(v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", -[NSString stringByAppendingString:](self->_path, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)), 0);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)_raise:(id)a3
{
  id v4;
  sqlite3 *db;
  uint64_t v6;
  const char *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a3, &v15);
  db = self->_db;
  if (db)
  {
    v6 = sqlite3_errcode(db);
    v7 = sqlite3_errmsg(self->_db);
    v8 = objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (%d(%d)/%s)"), v6, sqlite3_extended_errcode(self->_db), v7);
    v4 = v8;
    if (!self->_corrupt && ((_DWORD)v6 == 26 || (_DWORD)v6 == 11))
    {
      v10 = MBGetDefaultLog(v8, v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v12 = v6;
        v13 = 2080;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing corrupt backup cache db (%d/%s)", buf, 0x12u);
        _MBLog(CFSTR("DEFAULT"), "Removing corrupt backup cache db (%d/%s)", v6, v7);
      }
      self->_corrupt = 1;
      -[MBServiceCache close](self, "close");
      -[MBServiceCache _remove](self, "_remove");
    }
  }
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%@"), v4);
}

- (void)_profile:(id)a3 time:(double)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  double v10;

  v7 = MBGetSQLLog(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_countAndTimeBySQL, "objectForKeyedSubscript:", a3);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "setObject:atIndexedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "integerValue") + 1), 0);
      objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", 1), "doubleValue");
      objc_msgSend(v9, "setObject:atIndexedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 + a4), 1);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_countAndTimeBySQL, "setObject:forKeyedSubscript:", +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4), 0), a3);
    }
  }
}

- (void)_logProfile
{
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v3 = MBGetSQLLog(self, a2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    v6 = MBGetSQLLog(v4, v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SQL: Profile", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "SQL: Profile");
    }
    v7 = -[NSMutableDictionary allKeys](self->_countAndTimeBySQL, "allKeys");
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100011014;
    v27[3] = &unk_1000D9440;
    v27[4] = self;
    v8 = objc_msgSend(v7, "sortedArrayUsingComparator:", v27);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_countAndTimeBySQL, "objectForKeyedSubscript:", v13);
          v15 = objc_msgSend(objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "integerValue");
          v16 = objc_msgSend(objc_msgSend(v14, "objectAtIndexedSubscript:", 1), "doubleValue");
          v18 = v17;
          v20 = MBGetSQLLog(v16, v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = sub_1000110E8(v13);
            *(_DWORD *)buf = 134218498;
            v29 = v15;
            v30 = 2048;
            v31 = v18;
            v32 = 2112;
            v33 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "SQL: %6ld  %6.3f s  %@", buf, 0x20u);
            v22 = sub_1000110E8(v13);
            _MBLog(CFSTR("DEBUG"), "SQL: %6ld  %6.3f s  %@", v15, v18, v22);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
      }
      while (v10);
    }
  }
}

- (void)_exec:(id)a3
{
  double v5;
  double v6;
  double v7;

  if (!self->_db)
    -[MBServiceCache _raise:](self, "_raise:", CFSTR("Database is closed"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  if (sqlite3_exec(self->_db, (const char *)objc_msgSend(a3, "UTF8String"), 0, 0, 0))
    -[MBServiceCache _raise:](self, "_raise:", CFSTR("Error executing SQL: \"%@\"), a3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[MBServiceCache _profile:time:](self, "_profile:time:", a3, v7 - v6);
}

- (id)_prepare:(id)a3
{
  MBSCacheStmt *v6;
  MBSCacheStmt *v7;
  MBSCacheStmt *v8;
  sqlite3_stmt *ppStmt;

  if (!self->_db)
    -[MBServiceCache _raise:](self, "_raise:", CFSTR("Database is closed"));
  v6 = (MBSCacheStmt *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stmtsBySQL, "objectForKeyedSubscript:", a3);
  if (v6)
  {
    v7 = v6;
    if (!-[MBSCacheStmt isReset](v6, "isReset"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 427, CFSTR("Statement not reset after last use: \"%@\"), a3);
  }
  else
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(self->_db, (const char *)objc_msgSend(a3, "UTF8String"), -1, &ppStmt, 0))
      -[MBServiceCache _raise:](self, "_raise:", CFSTR("Error preparing statement: %@"), a3);
    v8 = [MBSCacheStmt alloc];
    v7 = -[MBSCacheStmt initWithCache:SQL:stmt:](v8, "initWithCache:SQL:stmt:", self, a3, ppStmt);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stmtsBySQL, "setObject:forKeyedSubscript:", v7, a3);

  }
  return v7;
}

- (void)_finalizeAll
{
  -[NSMutableDictionary removeAllObjects](self->_stmtsBySQL, "removeAllObjects");
}

- (int64_t)_lastInsertRowID
{
  sqlite3 *db;

  db = self->_db;
  if (!db)
  {
    -[MBServiceCache _raise:](self, "_raise:", CFSTR("Database is closed"));
    db = self->_db;
  }
  return sqlite3_last_insert_rowid(db);
}

- (void)open
{
  NSString *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  sqlite3 **p_db;
  id busy;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const __CFString *v21;

  v17 = 0;
  if (self->_openCount < 1)
  {
    v3 = -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
    v4 = (id)-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v17);
    if ((v4 & 1) == 0)
      v4 = -[MBServiceCache _raise:](self, "_raise:", CFSTR("Error creating cache dir at %@: %@"), v3, v17);
    v6 = MBGetDefaultLog(v4, v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Opening cache db", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "Opening cache db");
    }
    p_db = &self->_db;
    if (sqlite3_open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), &self->_db))
    {
      -[MBServiceCache _raise:](self, "_raise:", CFSTR("Error opening cache db at %@"), self->_path);
LABEL_21:
      -[MBServiceCache _exec:](self, "_exec:", CFSTR("pragma synchronous = normal"));
      goto LABEL_22;
    }
    busy = (id)sqlite3_busy_timeout(*p_db, 900000);
    if ((_DWORD)busy)
      busy = -[MBServiceCache _raise:](self, "_raise:", CFSTR("Error setting cache db busy timeout"));
    v10 = MBGetSQLLog(busy, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sqlite3_trace_v2(*p_db, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_100011670, 0);
    -[MBServiceCache begin](self, "begin");
    -[MBServiceCache _exec:](self, "_exec:", CFSTR("create table if not exists Properties (\n    key                    text primary key,\n    value                  text\n);\n"));
    v11 = -[MBServiceCache propertyForKey:](self, "propertyForKey:", CFSTR("SchemaVersion"));
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "isEqualToString:", CFSTR("26"));
      if ((v13 & 1) != 0)
      {
LABEL_20:
        -[MBServiceCache end](self, "end");
        goto LABEL_21;
      }
      v15 = MBGetDefaultLog(v13, v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v12;
        v20 = 2112;
        v21 = CFSTR("26");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Re-creating cache db because schema version changed (%@ != %@)", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "Re-creating cache db because schema version changed (%@ != %@)", v12, CFSTR("26"));
      }
      -[MBServiceCache _finalizeAll](self, "_finalizeAll");
      -[MBServiceCache _exec:](self, "_exec:", CFSTR("drop table if exists Properties;\ndrop table if exists Backups;\ndrop table if exists Snapshots;\ndrop table if exists Files;\ndrop table if exists FileExtendedAttributes;\ndrop table if exists DisabledDomains;\ndrop table if exists FileChanges;\ndrop table if exists FilesMissingEncryptionKey;\ndrop table if exists FileEncryptionKeys;\ndrop table if exists Restores;\ndrop table if exists RestoreFiles;\ndrop table if exists PlaceholderIcons;\ndrop table if exists FileProtectionClassesToRestore;\ndrop table if exists RestoreFailures;\ndrop table if exists PlaceholderResources;\ndrop table if exists KeyBagInfo;\n"));
      -[MBServiceCache _exec:](self, "_exec:", CFSTR("create table if not exists Properties (\n    key                    text primary key,\n    value                  text\n);\n"));
    }
    -[MBServiceCache _exec:](self, "_exec:", &cfstr_CreateTableIfN_0);
    -[MBServiceCache setProperty:forKey:](self, "setProperty:forKey:", CFSTR("26"), CFSTR("SchemaVersion"));
    -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
    -[MBServiceCache setProperty:forKey:](self, "setProperty:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v16), CFSTR("Created"));
    goto LABEL_20;
  }
  if (!self->_db)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 460, CFSTR("Missing handle for open cache db"));
LABEL_22:
  ++self->_openCount;
}

- (void)close
{
  int64_t openCount;
  MBServiceCache *v3;
  NSObject *v4;
  uint8_t v5[16];

  openCount = self->_openCount;
  if (openCount >= 1)
  {
    v3 = self;
    if (openCount == 1)
    {
      if (!self->_db)
        self = (MBServiceCache *)-[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 530, CFSTR("Missing handle for open cache db"));
      v4 = MBGetDefaultLog(self, a2);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Closing cache db", v5, 2u);
        _MBLog(CFSTR("DEBUG"), "Closing cache db");
      }
      -[MBServiceCache _finalizeAll](v3, "_finalizeAll");
      if (sqlite3_close(v3->_db))
        -[MBServiceCache _raise:](v3, "_raise:", CFSTR("Error closing database"));
      v3->_db = 0;
      -[MBServiceCache _logProfile](v3, "_logProfile");
      openCount = v3->_openCount;
    }
    v3->_openCount = openCount - 1;
  }
}

- (void)begin
{
  -[MBServiceCache _exec:](self, "_exec:", CFSTR("begin exclusive"));
}

- (void)end
{
  -[MBServiceCache _exec:](self, "_exec:", CFSTR("end"));
}

- (void)rollback
{
  -[MBServiceCache _exec:](self, "_exec:", CFSTR("rollback"));
}

- (void)analyze
{
  -[MBServiceCache _exec:](self, "_exec:", CFSTR("analyze"));
}

- (void)vacuum
{
  -[MBServiceCache _exec:](self, "_exec:", CFSTR("vacuum"));
}

- (id)propertyForKey:(id)a3
{
  id v5;
  id v6;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 570, CFSTR("Null key"));
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select value from Properties where key = ?"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v5, "step"))
    v6 = objc_msgSend(v5, "textColumn:", 0);
  else
    v6 = 0;
  objc_msgSend(v5, "reset");
  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v7;

  if (a4)
  {
    if (a3)
    {
LABEL_3:
      v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into Properties (key, value) values (?,?)"));
      objc_msgSend(v7, "bindText:atIndex:", a4, 1);
      objc_msgSend(v7, "bindText:atIndex:", a3, 2);
      objc_msgSend(v7, "step");
      objc_msgSend(v7, "reset");
      return;
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 585, CFSTR("Null key"));
    if (a3)
      goto LABEL_3;
  }
  -[MBServiceCache removePropertyForKey:](self, "removePropertyForKey:", a4);
}

- (void)removePropertyForKey:(id)a3
{
  id v5;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 599, CFSTR("Null key"));
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Properties where key = ?"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  objc_msgSend(v5, "step");
  objc_msgSend(v5, "reset");
}

- (id)creationDate
{
  float v2;

  objc_msgSend(-[MBServiceCache propertyForKey:](self, "propertyForKey:", CFSTR("Created")), "floatValue");
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v2);
}

- (id)configuration
{
  id result;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;

  v8 = 0;
  result = self->_configuration;
  if (!result)
  {
    v4 = -[MBServiceCache propertyForKey:](self, "propertyForKey:", CFSTR("Configuration"));
    if (v4)
    {
      v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", objc_msgSend(v4, "dataUsingEncoding:", 4), 0, 0, &v8);
      if (v6)
      {
LABEL_8:
        result = -[MBServiceConfiguration initWithPropertyList:]([MBServiceConfiguration alloc], "initWithPropertyList:", v6);
        self->_configuration = (MBServiceConfiguration *)result;
        return result;
      }
      v7 = MBGetDefaultLog(0, v5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error deserializing configuration from cache: %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Error deserializing configuration from cache: %@", v8);
      }
      -[MBServiceCache removePropertyForKey:](self, "removePropertyForKey:", CFSTR("Configuration"));
    }
    v6 = 0;
    goto LABEL_8;
  }
  return result;
}

- (void)setConfiguration:(id)a3
{
  NSData *v6;
  id v7;
  NSAssertionHandler *v8;
  uint64_t v9;

  v9 = 0;
  -[MBServiceCache begin](self, "begin");
  if (objc_msgSend(a3, "propertyList"))
  {
    v6 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", objc_msgSend(a3, "propertyList"), 100, 0, &v9);
    if (!v6)
    {
      v8 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 639, CFSTR("Error serializing configuration: %@"), v9);
    }
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
  }
  else
  {
    v7 = 0;
  }
  -[MBServiceCache setProperty:forKey:](self, "setProperty:forKey:", v7, CFSTR("Configuration"));
  -[MBServiceCache addDisabledDomainNames:restricted:](self, "addDisabledDomainNames:restricted:", objc_msgSend(a3, "domainNamesNotToBackUp"), 1);
  -[MBServiceCache end](self, "end");

  self->_configuration = (MBServiceConfiguration *)a3;
}

- (void)removeAccount
{
  -[MBServiceCache removeAllBackups](self, "removeAllBackups");
  -[MBServiceCache removeAllFileChanges](self, "removeAllFileChanges");
  -[MBServiceCache removeAllDisabledDomains](self, "removeAllDisabledDomains");
  -[MBServiceCache removeAllRestores](self, "removeAllRestores");
}

- (id)backupForUDID:(id)a3 lastModified:(int64_t *)a4
{
  id v8;
  id v9;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 664, CFSTR("Null backup UDID"));
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select lastModified, attributes from Backups where backupUDID = ?"));
  objc_msgSend(v8, "bindText:atIndex:", a3, 1);
  if (!objc_msgSend(v8, "step"))
  {
    v9 = 0;
    goto LABEL_9;
  }
  v9 = +[MBSBackup backup](MBSBackup, "backup");
  objc_msgSend(v9, "setBackupUDID:", MBDataWithString(a3));
  if (!objc_msgSend(v9, "backupUDID"))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 673, CFSTR("Failed to convert backup UDID: \"%@\"), a3);
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a4)
LABEL_6:
    *a4 = (int64_t)objc_msgSend(v8, "int64Column:", 0);
LABEL_7:
  objc_msgSend(v9, "setAttributes:", -[MBSBackupAttributes initWithData:]([MBSBackupAttributes alloc], "initWithData:", objc_msgSend(v8, "blobColumn:", 1)));
  objc_msgSend(v9, "setSnapshots:", objc_msgSend(-[MBServiceCache snapshotsForBackupUDID:](self, "snapshotsForBackupUDID:", a3), "mutableCopy"));
LABEL_9:
  objc_msgSend(v8, "reset");
  return v9;
}

- (void)keybagUUID:(id *)a3 keybagID:(unsigned int *)a4 forBackupUDID:(id)a5
{
  id v7;
  void *v8;

  v7 = objc_msgSend(objc_msgSend(-[MBServiceCache backupForUDID:lastModified:](self, "backupForUDID:lastModified:", a5, 0), "snapshots"), "lastObject");
  v8 = v7;
  if (a3)
    *a3 = objc_msgSend(objc_msgSend(v7, "attributes"), "keybagUUID");
  if (a4)
    *a4 = objc_msgSend(objc_msgSend(v8, "attributes"), "keybagID");
}

- (void)addBackup:(id)a3 lastModified:(int64_t)a4
{
  id v8;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 691, CFSTR("Null backup"));
  if (!objc_msgSend(a3, "backupUDID"))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 692, CFSTR("Null backup UDID"));
    if (a4)
      goto LABEL_5;
LABEL_7:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 693, CFSTR("Zero backup last modified time"));
    goto LABEL_5;
  }
  if (!a4)
    goto LABEL_7;
LABEL_5:
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into Backups values (?,?,?)"));
  objc_msgSend(v8, "bindText:atIndex:", MBStringWithData(objc_msgSend(a3, "backupUDID")), 1);
  objc_msgSend(v8, "bindInt64:atIndex:", a4, 2);
  objc_msgSend(v8, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "attributes"), "data"), 3);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (void)removeDomainName:(id)a3 backupUDID:(id)a4 lastModified:(int64_t)a5
{
  id v10;
  id v11;

  if (!a3)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 704, CFSTR("Null domain name"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 705, CFSTR("Null backup UDID"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set lastModified = ? where snapshotID in (select snapshotID from Files where backupUDID = ? and domainName = ?)"));
  objc_msgSend(v10, "bindInt64:atIndex:", a5, 1);
  objc_msgSend(v10, "bindText:atIndex:", a4, 2);
  objc_msgSend(v10, "bindText:atIndex:", a3, 3);
  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");
  v11 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Files where backupUDID = ? and domainName = ?"));
  objc_msgSend(v11, "bindText:atIndex:", a4, 1);
  objc_msgSend(v11, "bindText:atIndex:", a3, 2);
  objc_msgSend(v11, "step");
  objc_msgSend(v11, "reset");
  -[MBServiceCache setLastModified:forBackupUDID:](self, "setLastModified:forBackupUDID:", a5, a4);
}

- (void)setLastModified:(int64_t)a3 forBackupUDID:(id)a4
{
  id v7;

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 724, CFSTR("Null backup UDID"));
  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Backups set lastModified = ? where backupUDID = ?"));
  objc_msgSend(v7, "bindInt64:atIndex:", a3, 1);
  objc_msgSend(v7, "bindText:atIndex:", a4, 2);
  objc_msgSend(v7, "step");
  objc_msgSend(v7, "reset");
}

- (void)removeBackupForUDID:(id)a3
{
  id v5;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 734, CFSTR("Null backup UDID"));
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Backups where backupUDID = ?"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  objc_msgSend(v5, "step");
  objc_msgSend(v5, "reset");
}

- (void)removeAllBackups
{
  id v2;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Backups"));
  objc_msgSend(v2, "step");
  objc_msgSend(v2, "reset");
}

- (id)_snapshotWithStmt:(id)a3
{
  id v4;

  v4 = +[MBSSnapshot snapshot](MBSSnapshot, "snapshot");
  objc_msgSend(v4, "setSnapshotID:", objc_msgSend(a3, "intColumn:", 1));
  objc_msgSend(v4, "setLastModified:", objc_msgSend(a3, "int64Column:", 2));
  objc_msgSend(v4, "setCommitted:", objc_msgSend(a3, "int64Column:", 3));
  objc_msgSend(v4, "setAttributes:", -[MBSSnapshotAttributes initWithData:]([MBSSnapshotAttributes alloc], "initWithData:", objc_msgSend(a3, "blobColumn:", 6)));
  return v4;
}

- (id)snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v7;
  id v8;

  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Snapshots where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v7, "bindText:atIndex:", a4, 1);
  objc_msgSend(v7, "bindInteger:atIndex:", a3, 2);
  if (objc_msgSend(v7, "step"))
    v8 = -[MBServiceCache _snapshotWithStmt:](self, "_snapshotWithStmt:", v7);
  else
    v8 = 0;
  objc_msgSend(v7, "reset");
  return v8;
}

- (id)snapshotsForBackupUDID:(id)a3
{
  id v5;
  id v6;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 776, CFSTR("Null backup UDID"));
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Snapshots where backupUDID = ?"));
  objc_msgSend(v6, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v6, "step"))
  {
    do
      objc_msgSend(v5, "addObject:", -[MBServiceCache _snapshotWithStmt:](self, "_snapshotWithStmt:", v6));
    while ((objc_msgSend(v6, "step") & 1) != 0);
  }
  objc_msgSend(v6, "reset");
  objc_msgSend(v5, "sortUsingComparator:", &stru_1000D9480);
  return v5;
}

- (void)addSnapshot:(id)a3 backupUDID:(id)a4
{
  id v8;

  if (!a3)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 794, CFSTR("Null snapshot"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 795, CFSTR("Null backup UDID"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into Snapshots values (?,?,?,?,?,?,?)"));
  objc_msgSend(v8, "bindText:atIndex:", a4, 1);
  objc_msgSend(v8, "bindInteger:atIndex:", objc_msgSend(a3, "snapshotID"), 2);
  objc_msgSend(v8, "bindInt64:atIndex:", objc_msgSend(a3, "lastModified"), 3);
  objc_msgSend(v8, "bindInt64:atIndex:", objc_msgSend(a3, "committed"), 4);
  objc_msgSend(v8, "bindInt64:atIndex:", objc_msgSend(a3, "committed"), 5);
  objc_msgSend(v8, "bindInt:atIndex:", 0, 6);
  objc_msgSend(v8, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "attributes"), "data"), 7);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (void)_removeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Snapshots where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v6, "bindText:atIndex:", a4, 1);
  objc_msgSend(v6, "bindInteger:atIndex:", a3, 2);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)removeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t)a5
{
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  unint64_t v31;

  v9 = -[MBServiceCache snapshotsForBackupUDID:](self, "snapshotsForBackupUDID:", a4);
  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      if (objc_msgSend(v11, "snapshotID") == a3)
        break;
      if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
        return;
    }
    if (objc_msgSend(v11, "committed"))
    {
      v13 = (char *)objc_msgSend(v9, "count");
      if (v10 >= (unint64_t)(v13 - 1))
      {
        v27 = MBGetDefaultLog(v13, v14);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Removing last snapshot", buf, 2u);
          _MBLog(CFSTR("INFO"), "Removing last snapshot");
        }
      }
      else
      {
        v15 = objc_msgSend(objc_msgSend(v9, "objectAtIndexedSubscript:", v10 + 1), "snapshotID");
        v16 = v15;
        v18 = MBGetDefaultLog(v15, v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v29 = a3;
          v30 = 2048;
          v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Merging snapshot %lu into snapshot %lu", buf, 0x16u);
          _MBLog(CFSTR("INFO"), "Merging snapshot %lu into snapshot %lu", a3, v16);
        }
        v19 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update or ignore Files set snapshotID = ? where backupUDID = ? and snapshotID = ?"));
        objc_msgSend(v19, "bindInteger:atIndex:", v16, 1);
        objc_msgSend(v19, "bindText:atIndex:", a4, 2);
        objc_msgSend(v19, "bindInteger:atIndex:", a3, 3);
        objc_msgSend(v19, "step");
        objc_msgSend(v19, "reset");
        v20 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Files set duplicateFileID = null, duplicateSnapshotID = 0 where backupUDID = ? and snapshotID = ? and duplicateSnapshotID = ?"));
        objc_msgSend(v20, "bindText:atIndex:", a4, 1);
        objc_msgSend(v20, "bindInteger:atIndex:", v16, 2);
        objc_msgSend(v20, "bindInteger:atIndex:", a3, 3);
        objc_msgSend(v20, "step");
        v21 = objc_msgSend(v20, "reset");
        if (!v10)
        {
          v23 = MBGetDefaultLog(v21, v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v29 = v16;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Discarding deleted files from snapshot %lu", buf, 0xCu);
            _MBLog(CFSTR("INFO"), "Discarding deleted files from snapshot %lu", v16);
          }
          v24 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Files where backupUDID = ? and snapshotID = ? and deleted = 1"));
          objc_msgSend(v24, "bindText:atIndex:", a4, 1);
          objc_msgSend(v24, "bindInteger:atIndex:", v16, 2);
          objc_msgSend(v24, "step");
          objc_msgSend(v24, "reset");
        }
        v25 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set lastModified = ? where backupUDID = ? and snapshotID = ?"));
        objc_msgSend(v25, "bindInt64:atIndex:", a5, 1);
        objc_msgSend(v25, "bindText:atIndex:", a4, 2);
        objc_msgSend(v25, "bindInteger:atIndex:", v16, 3);
        objc_msgSend(v25, "step");
        objc_msgSend(v25, "reset");
      }
    }
    else
    {
      v26 = MBGetDefaultLog(0, v12);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Removing uncommitted snapshot", buf, 2u);
        _MBLog(CFSTR("INFO"), "Removing uncommitted snapshot");
      }
    }
    -[MBServiceCache _removeSnapshotForID:backupUDID:](self, "_removeSnapshotForID:backupUDID:", a3, a4);
  }
}

- (void)mergeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t)a5
{
  id v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  unint64_t v28;

  v10 = -[MBServiceCache snapshotsForBackupUDID:](self, "snapshotsForBackupUDID:", a4);
  if (!objc_msgSend(v10, "count"))
    return;
  v11 = 0;
  while (1)
  {
    v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
    if (objc_msgSend(v12, "snapshotID") == a3)
      break;
    if (++v11 >= (unint64_t)objc_msgSend(v10, "count"))
      return;
  }
  if (!objc_msgSend(v12, "committed"))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 880, CFSTR("Cannot merge uncommitted snapshots"));
    if (v11)
      goto LABEL_8;
LABEL_17:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 881, CFSTR("Cannot merge first snapshot"));
    goto LABEL_8;
  }
  if (!v11)
    goto LABEL_17;
LABEL_8:
  v13 = -[MBServiceCache localCommittedForSnapshotID:backupUDID:](self, "localCommittedForSnapshotID:backupUDID:", objc_msgSend(v12, "snapshotID"), a4);
  v14 = objc_msgSend(objc_msgSend(v10, "objectAtIndexedSubscript:", v11 - 1), "snapshotID");
  v15 = v14;
  v17 = MBGetDefaultLog(v14, v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v26 = a3;
    v27 = 2048;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Merging snapshot %lu into snapshot %lu", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Merging snapshot %lu into snapshot %lu", a3, v15);
  }
  v18 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update or replace Files set snapshotID = ? where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v18, "bindInteger:atIndex:", v15, 1);
  objc_msgSend(v18, "bindText:atIndex:", a4, 2);
  objc_msgSend(v18, "bindInteger:atIndex:", a3, 3);
  objc_msgSend(v18, "step");
  objc_msgSend(v18, "reset");
  v19 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Files set duplicateFileID = null, duplicateSnapshotID = 0 where backupUDID = ? and snapshotID = ? and duplicateSnapshotID = ?"));
  objc_msgSend(v19, "bindText:atIndex:", a4, 1);
  objc_msgSend(v19, "bindInteger:atIndex:", v15, 2);
  objc_msgSend(v19, "bindInteger:atIndex:", a3, 3);
  objc_msgSend(v19, "step");
  v20 = objc_msgSend(v19, "reset");
  if (v11 == 1)
  {
    v22 = MBGetDefaultLog(v20, v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Discarding deleted files from snapshot %lu", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Discarding deleted files from snapshot %lu", v15);
    }
    v23 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Files where backupUDID = ? and snapshotID = ? and deleted = 1"));
    objc_msgSend(v23, "bindText:atIndex:", a4, 1);
    objc_msgSend(v23, "bindInteger:atIndex:", v15, 2);
    objc_msgSend(v23, "step");
    objc_msgSend(v23, "reset");
  }
  v24 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set lastModified = ?, committed = ?, localCommitted = ?, attributes = ? where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v24, "bindInt64:atIndex:", a5, 1);
  objc_msgSend(v24, "bindInt64:atIndex:", objc_msgSend(v12, "committed"), 2);
  objc_msgSend(v24, "bindInt64:atIndex:", v13, 3);
  objc_msgSend(v24, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(v12, "attributes"), "data"), 4);
  objc_msgSend(v24, "bindText:atIndex:", a4, 5);
  objc_msgSend(v24, "bindInteger:atIndex:", v15, 6);
  objc_msgSend(v24, "step");
  objc_msgSend(v24, "reset");
  -[MBServiceCache _removeSnapshotForID:backupUDID:](self, "_removeSnapshotForID:backupUDID:", a3, a4);
}

- (BOOL)areAllFilesCommittedForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6;
  BOOL v7;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from Files where backupUDID = ? and snapshotID = ? and committed = 0"));
  objc_msgSend(v6, "bindText:atIndex:", a4, 1);
  objc_msgSend(v6, "bindInteger:atIndex:", a3, 2);
  if (objc_msgSend(v6, "step"))
  {
    v7 = objc_msgSend(v6, "intColumn:", 0) == 0;
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Snapshot not found: %d"), a3);
    v7 = 0;
  }
  objc_msgSend(v6, "reset");
  return v7;
}

- (void)setLastModified:(int64_t)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v9;

  if (!a5)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 947, CFSTR("Null backup UDID"));
  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set lastModified = ? where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v9, "bindInt64:atIndex:", a3, 1);
  objc_msgSend(v9, "bindText:atIndex:", a5, 2);
  objc_msgSend(v9, "bindInteger:atIndex:", a4, 3);
  objc_msgSend(v9, "step");
  objc_msgSend(v9, "reset");
}

- (void)setCommitted:(int64_t)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v10;

  if (!a5)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 958, CFSTR("Null backup UDID"));
  if (!-[MBServiceCache areAllFilesCommittedForSnapshotID:backupUDID:](self, "areAllFilesCommittedForSnapshotID:backupUDID:", a4, a5))-[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 959, CFSTR("Not all files in snapshot have been committed"));
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set committed = ? where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v10, "bindInt64:atIndex:", a3, 1);
  objc_msgSend(v10, "bindText:atIndex:", a5, 2);
  objc_msgSend(v10, "bindInteger:atIndex:", a4, 3);
  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");
}

- (BOOL)isStaleSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6;
  BOOL v7;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select stale from Snapshots where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v6, "bindText:atIndex:", a4, 1);
  objc_msgSend(v6, "bindInteger:atIndex:", a3, 2);
  if (objc_msgSend(v6, "step"))
  {
    v7 = objc_msgSend(v6, "intColumn:", 0) != 0;
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Snapshot not found: %d"), a3);
    v7 = 0;
  }
  objc_msgSend(v6, "reset");
  return v7;
}

- (void)setStale:(BOOL)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  _BOOL8 v7;
  id v8;

  v7 = a3;
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set stale = ? where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v8, "bindInt:atIndex:", v7, 1);
  objc_msgSend(v8, "bindText:atIndex:", a5, 2);
  objc_msgSend(v8, "bindInteger:atIndex:", a4, 3);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (int64_t)localCommittedForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v6;
  id v7;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select localCommitted from Snapshots where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v6, "bindText:atIndex:", a4, 1);
  objc_msgSend(v6, "bindInteger:atIndex:", a3, 2);
  if (objc_msgSend(v6, "step"))
  {
    v7 = objc_msgSend(v6, "int64Column:", 0);
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Snapshot not found: %d"), a3);
    v7 = 0;
  }
  objc_msgSend(v6, "reset");
  return (int64_t)v7;
}

- (void)setLocalCommitted:(int64_t)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v8;

  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Snapshots set localCommitted = ? where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v8, "bindInt64:atIndex:", a3, 1);
  objc_msgSend(v8, "bindText:atIndex:", a5, 2);
  objc_msgSend(v8, "bindInteger:atIndex:", a4, 3);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (id)_fileWithStmt:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  MBFile *v9;
  signed int v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  NSData *v14;
  __int128 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  int v22;
  int v23;

  v5 = objc_msgSend(a3, "int64Column:", 0);
  v6 = objc_msgSend(a3, "textColumn:", 4);
  v7 = objc_msgSend(a3, "textColumn:", 5);
  v8 = -[MBDomainManager domainForName:](self->_domainManager, "domainForName:", v6);
  if (!v8)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 205, CFSTR("Domain not found: %@"), v6));
  v9 = +[MBFile fileWithDomain:relativePath:](MBFile, "fileWithDomain:relativePath:", v8, v7);
  -[MBFile setSnapshotID:](v9, "setSnapshotID:", (int)objc_msgSend(a3, "intColumn:", 2));
  -[MBFile setCommitted:](v9, "setCommitted:", objc_msgSend(a3, "intColumn:", 9) != 0);
  -[MBFile setDeleted:](v9, "setDeleted:", objc_msgSend(a3, "intColumn:", 10) != 0);
  -[MBFile setTarget:](v9, "setTarget:", objc_msgSend(a3, "textColumn:", 13));
  -[MBFile setKeybagID:](v9, "setKeybagID:", objc_msgSend(a3, "intColumn:", 14));
  -[MBFile setEncryptionKey:](v9, "setEncryptionKey:", objc_msgSend(a3, "blobColumn:", 15));
  -[MBFile setEncryptionKeyVersion:](v9, "setEncryptionKeyVersion:", (int)objc_msgSend(a3, "intColumn:", 16));
  -[MBFile setDecryptedSize:](v9, "setDecryptedSize:", objc_msgSend(a3, "int64Column:", 17));
  -[MBFile setDigest:](v9, "setDigest:", objc_msgSend(a3, "blobColumn:", 6));
  v22 = 0;
  v21 = 0u;
  v16 = 0u;
  LOWORD(v16) = (unsigned __int16)objc_msgSend(a3, "intColumn:", 18);
  *(_QWORD *)&v21 = (int)objc_msgSend(a3, "intColumn:", 19);
  DWORD1(v16) = objc_msgSend(a3, "intColumn:", 20);
  DWORD2(v16) = objc_msgSend(a3, "intColumn:", 21);
  v18 = objc_msgSend(a3, "int64Column:", 22);
  v19 = objc_msgSend(a3, "int64Column:", 23);
  v17 = objc_msgSend(a3, "int64Column:", 24);
  v20 = objc_msgSend(a3, "int64Column:", 7);
  v23 = objc_msgSend(a3, "intColumn:", 25);
  -[MBFile setNode:](v9, "setNode:", &v16);
  v10 = objc_msgSend(a3, "intColumn:", 25);
  v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v10);
  if (v10)
  {
    v12 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select name, value from FileExtendedAttributes where fileRowID = ?"));
    objc_msgSend(v12, "bindInt64:atIndex:", v5, 1);
    if (objc_msgSend(v12, "step"))
    {
      do
      {
        v13 = objc_msgSend(v12, "textColumn:", 0);
        v14 = (NSData *)objc_msgSend(v12, "blobColumn:", 1);
        if (!v14)
          v14 = +[NSData data](NSData, "data");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, v13);
      }
      while ((objc_msgSend(v12, "step") & 1) != 0);
    }
    objc_msgSend(v12, "reset");
  }
  -[MBFile setExtendedAttributes:](v9, "setExtendedAttributes:", v11);
  return v9;
}

- (id)fileForID:(id)a3 backupUDID:(id)a4
{
  id v8;
  id v9;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1082, CFSTR("Null file ID"));
    if (a4)
      goto LABEL_3;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1083, CFSTR("Null backup UDID"));
LABEL_3:
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Files where backupUDID = ? and fileID = ?"));
  objc_msgSend(v9, "bindText:atIndex:", a4, 1);
  objc_msgSend(v9, "bindText:atIndex:", objc_msgSend(a3, "string"), 2);
  if (objc_msgSend(v9, "step"))
  {
    do
      objc_msgSend(v8, "addObject:", -[MBServiceCache _fileWithStmt:](self, "_fileWithStmt:", v9));
    while ((objc_msgSend(v9, "step") & 1) != 0);
  }
  objc_msgSend(v9, "reset");
  objc_msgSend(v8, "sortUsingComparator:", &stru_1000D94A0);
  return objc_msgSend(v8, "lastObject");
}

- (id)fileForID:(id)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v10;
  id v11;

  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1105, CFSTR("Null file ID"));
    if (a5)
      goto LABEL_3;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1106, CFSTR("Null backup UDID"));
LABEL_3:
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Files where backupUDID = ? and snapshotID = ? and fileID = ?"));
  objc_msgSend(v10, "bindText:atIndex:", a5, 1);
  objc_msgSend(v10, "bindInteger:atIndex:", a4, 2);
  objc_msgSend(v10, "bindText:atIndex:", objc_msgSend(a3, "string"), 3);
  if (objc_msgSend(v10, "step"))
    v11 = -[MBServiceCache _fileWithStmt:](self, "_fileWithStmt:", v10);
  else
    v11 = 0;
  objc_msgSend(v10, "reset");
  return v11;
}

- (BOOL)encryptedFilesExistForBackupUDID:(id)a3
{
  id v5;
  BOOL v6;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1123, CFSTR("Null backup UDID"));
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from Files where backupUDID = ? and encryptionKey is not null"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v5, "step"))
    v6 = objc_msgSend(v5, "intColumn:", 0) != 0;
  else
    v6 = 0;
  objc_msgSend(v5, "reset");
  return v6;
}

- (BOOL)encryptedFilesExistForBackupUDID:(id)a3 keybagID:(int64_t)a4
{
  id v7;
  BOOL v8;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1137, CFSTR("Null backup UDID"));
  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from Files where backupUDID = ? and keybagID = ? and encryptionKey is not null"));
  objc_msgSend(v7, "bindText:atIndex:", a3, 1);
  objc_msgSend(v7, "bindInteger:atIndex:", a4, 2);
  if (objc_msgSend(v7, "step"))
    v8 = objc_msgSend(v7, "intColumn:", 0) != 0;
  else
    v8 = 0;
  objc_msgSend(v7, "reset");
  return v8;
}

- (void)addFile:(id)a3 snapshotID:(unint64_t)a4 backupUDID:(id)a5 committed:(BOOL)a6
{
  _BOOL8 v6;
  id v12;
  const __CFString *v13;
  const __CFString *v14;
  id v15;
  int64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a6;
  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1152, CFSTR("Null file"));
  if ((objc_msgSend(a3, "verifyWithError:", 0) & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1153, CFSTR("Invalid file"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "duplicateFile"), "fileID"), "isEqualToData:", objc_msgSend(a3, "fileID"))&& objc_msgSend(objc_msgSend(a3, "duplicateFile"), "snapshotID") == a4)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1155, CFSTR("Self-referencing duplicate file: %@:%@ (%@)"), objc_msgSend(a3, "domain"), objc_msgSend(a3, "relativePath"), objc_msgSend(a3, "fileID"));
    if (a5)
      goto LABEL_8;
  }
  else if (a5)
  {
    goto LABEL_8;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1156, CFSTR("Null backup UDID"));
LABEL_8:
  v12 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into Files values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"));
  objc_msgSend(v12, "bindText:atIndex:", a5, 1);
  objc_msgSend(v12, "bindInt:atIndex:", a4, 2);
  objc_msgSend(v12, "bindText:atIndex:", MBStringWithData(objc_msgSend(a3, "fileID")), 3);
  objc_msgSend(v12, "bindText:atIndex:", objc_msgSend(a3, "domain"), 4);
  v13 = (const __CFString *)objc_msgSend(a3, "relativePath");
  if (v13)
    v14 = v13;
  else
    v14 = &stru_1000DBB88;
  objc_msgSend(v12, "bindText:atIndex:", v14, 5);
  objc_msgSend(v12, "bindBlob:atIndex:", objc_msgSend(a3, "signature"), 6);
  objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(a3, "size"), 7);
  objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(a3, "added"), 8);
  objc_msgSend(v12, "bindInt:atIndex:", v6, 9);
  objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(a3, "hasAttributes") ^ 1, 10);
  objc_msgSend(v12, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFile"), "fileID"), 11);
  objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFile"), "snapshotID"), 12);
  if (objc_msgSend(a3, "hasAttributes"))
  {
    v15 = objc_msgSend(a3, "attributes");
    objc_msgSend(v12, "bindText:atIndex:", objc_msgSend(v15, "target"), 13);
    objc_msgSend(v12, "bindInteger:atIndex:", objc_msgSend(v15, "keybagID"), 14);
    objc_msgSend(v12, "bindBlob:atIndex:", objc_msgSend(v15, "encryptionKey"), 15);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "encryptionKeyVersion"), 16);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "decryptedSize"), 17);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "mode"), 18);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "inodeNumber"), 19);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "userID"), 20);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "groupID"), 21);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "lastModified"), 22);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "lastStatusChange"), 23);
    objc_msgSend(v12, "bindInt64:atIndex:", objc_msgSend(v15, "birth"), 24);
    objc_msgSend(v12, "bindInt:atIndex:", objc_msgSend(v15, "protectionClass"), 25);
    objc_msgSend(v12, "bindInteger:atIndex:", objc_msgSend(v15, "extendedAttributesCount"), 26);
  }
  objc_msgSend(v12, "step");
  objc_msgSend(v12, "reset");
  if (objc_msgSend(objc_msgSend(a3, "attributes"), "extendedAttributesCount"))
  {
    v16 = -[MBServiceCache _lastInsertRowID](self, "_lastInsertRowID");
    v17 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into FileExtendedAttributes values (?,?,?)"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = objc_msgSend(objc_msgSend(a3, "attributes"), "extendedAttributes");
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v17, "bindInt64:atIndex:", v16, 1);
          objc_msgSend(v17, "bindText:atIndex:", objc_msgSend(v23, "name"), 2);
          objc_msgSend(v17, "bindBlob:atIndex:", objc_msgSend(v23, "value"), 3);
          objc_msgSend(v17, "step");
          objc_msgSend(v17, "reset");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v20);
    }
  }
}

- (void)removeFileID:(id)a3 forSnapshotID:(unint64_t)a4 backupUDID:(id)a5
{
  id v8;

  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Files where backupUDID = ? and snapshotID = ? and fileID = ?"));
  objc_msgSend(v8, "bindText:atIndex:", a5, 1);
  objc_msgSend(v8, "bindInteger:atIndex:", a4, 2);
  objc_msgSend(v8, "bindText:atIndex:", objc_msgSend(a3, "string"), 3);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (void)setCommitted:(BOOL)a3 forFileID:(id)a4 snapshotID:(unint64_t)a5 backupUDID:(id)a6
{
  _BOOL8 v9;
  id v10;

  v9 = a3;
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Files set committed = ? where fileID = ? and snapshotID = ? and backupUDID = ?"));
  objc_msgSend(v10, "bindInt:atIndex:", v9, 1);
  objc_msgSend(v10, "bindText:atIndex:", objc_msgSend(a4, "string"), 2);
  objc_msgSend(v10, "bindInteger:atIndex:", a5, 3);
  objc_msgSend(v10, "bindText:atIndex:", a6, 4);
  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");
}

- (id)_fileIDEnumeratorWithStmt:(id)a3
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001418C;
  v4[3] = &unk_1000D94C8;
  v4[5] = self;
  v4[6] = a2;
  v4[4] = a3;
  return +[MBSCacheEnumerator enumeratorWithStmt:block:](MBSCacheEnumerator, "enumeratorWithStmt:block:", a3, v4);
}

- (id)fileIDEnumeratorForSnapshotID:(unint64_t)a3 backupUDID:(id)a4
{
  id v7;

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1236, CFSTR("Null backup UDID"));
  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select fileID from Files where backupUDID = ? and snapshotID = ?"));
  objc_msgSend(v7, "bindText:atIndex:", a4, 1);
  objc_msgSend(v7, "bindInteger:atIndex:", a3, 2);
  return -[MBServiceCache _fileIDEnumeratorWithStmt:](self, "_fileIDEnumeratorWithStmt:", v7);
}

- (id)encryptedFileIDEnumeratorForBackupUDID:(id)a3
{
  id v5;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1246, CFSTR("Null backup UDID"));
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select fileID from Files where backupUDID = ? and encryptionKey is not null and encryptionKeyVersion > 1 and keybagID > 2"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  return -[MBServiceCache _fileIDEnumeratorWithStmt:](self, "_fileIDEnumeratorWithStmt:", v5);
}

- (id)deletedFileIDEnumeratorForBackupUDID:(id)a3
{
  id v5;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1255, CFSTR("Null backup UDID"));
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select distinct fileID from Files where backupUDID = ? and fileID not in (select fileID from FileChanges)"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  return -[MBServiceCache _fileIDEnumeratorWithStmt:](self, "_fileIDEnumeratorWithStmt:", v5);
}

- (id)encryptionKeyForFileWithID:(id)a3 backupUDID:(id)a4
{
  id v6;
  id v7;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select encryptionKey from Files where backupUDID = ? and fileID = ? and encryptionKeyVersion >= 2 order by snapshotID desc limit 1"));
  objc_msgSend(v6, "bindText:atIndex:", a4, 1);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "string"), 2);
  if (objc_msgSend(v6, "step"))
    v7 = objc_msgSend(v6, "blobColumn:", 0);
  else
    v7 = 0;
  objc_msgSend(v6, "reset");
  return v7;
}

- (unint64_t)nextBackupSizeWithUDID:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select sum(size) from Files, Snapshots where Files.backupUDID = ?1 and Snapshots.backupUDID = ?1 and Files.snapshotID = Snapshots.snapshotID and Snapshots.committed != 0 and duplicateFileID is null"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v5, "step"))
    v6 = objc_msgSend(v5, "int64Column:", 0);
  else
    v6 = 0;
  objc_msgSend(v5, "reset");
  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select sum(size) from FileChanges where (type = 1 or type = 2) and duplicateFileID is null and domainName not in (select domainName from DisabledDomains)"));
  if (objc_msgSend(v7, "step"))
    v8 = objc_msgSend(v7, "int64Column:", 0);
  else
    v8 = 0;
  objc_msgSend(v7, "reset");
  return (unint64_t)v6 + (_QWORD)v8;
}

- (id)domainNamesForBackupUDID:(id)a3
{
  id v5;
  id v6;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1304, CFSTR("Null backup UDID"));
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select domainName from Files where backupUDID = ? and domainName is not null union select domainName from FileChanges where domainName is not null"));
  objc_msgSend(v6, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v6, "step"))
  {
    do
      objc_msgSend(v5, "addObject:", objc_msgSend(v6, "textColumn:", 0));
    while ((objc_msgSend(v6, "step") & 1) != 0);
  }
  objc_msgSend(v6, "reset");
  return v5;
}

- (id)activeDomainNamesForBackupUDID:(id)a3
{
  id v5;
  id v6;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1319, CFSTR("Null backup UDID"));
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select distinct domainName from Files where backupUDID = ? and domainName is not null"));
  objc_msgSend(v6, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v6, "step"))
  {
    do
      objc_msgSend(v5, "addObject:", objc_msgSend(v6, "textColumn:", 0));
    while ((objc_msgSend(v6, "step") & 1) != 0);
  }
  objc_msgSend(v6, "reset");
  return v5;
}

- (id)domainInfoForName:(id)a3 backupUDID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unsigned int v12;
  _BOOL8 v13;

  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select sum(size) from Files, Snapshots where Files.backupUDID = ?1 and Snapshots.backupUDID = ?1 and Files.snapshotID = Snapshots.snapshotID and Files.domainName = ?2 and Snapshots.committed != 0 and duplicateFileID is null"));
  objc_msgSend(v7, "bindText:atIndex:", a4, 1);
  objc_msgSend(v7, "bindText:atIndex:", a3, 2);
  if (objc_msgSend(v7, "step"))
    v8 = objc_msgSend(v7, "int64Column:", 0);
  else
    v8 = 0;
  objc_msgSend(v7, "reset");
  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select sum(size) from FileChanges where domainName = ? and (type = 1 or type = 2) and duplicateFileID is null"));
  objc_msgSend(v9, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v9, "step"))
    v10 = objc_msgSend(v9, "int64Column:", 0);
  else
    v10 = 0;
  objc_msgSend(v9, "reset");
  v11 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select restricted from DisabledDomains where domainName = ?"));
  objc_msgSend(v11, "bindText:atIndex:", a3, 1);
  v12 = objc_msgSend(v11, "step");
  if (v12)
    v13 = objc_msgSend(v11, "intColumn:", 0) != 0;
  else
    v13 = 0;
  objc_msgSend(v11, "reset");
  return +[MBDomainInfo domainInfoWithName:systemApp:remoteSize:localSize:enabled:restricted:](MBDomainInfo, "domainInfoWithName:systemApp:remoteSize:localSize:enabled:restricted:", a3, 0, v8, v10, v12 ^ 1, v13);
}

- (id)_disabledDomainNames
{
  id result;
  id v4;

  result = self->_disabledDomainNames;
  if (!result)
  {
    self->_disabledDomainNames = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select domainName from DisabledDomains"));
    if (objc_msgSend(v4, "step"))
    {
      do
        -[NSMutableSet addObject:](self->_disabledDomainNames, "addObject:", objc_msgSend(v4, "textColumn:", 0));
      while ((objc_msgSend(v4, "step") & 1) != 0);
    }
    objc_msgSend(v4, "reset");
    return self->_disabledDomainNames;
  }
  return result;
}

- (BOOL)isDomainNameEnabled:(id)a3
{
  return objc_msgSend(-[MBServiceCache _disabledDomainNames](self, "_disabledDomainNames"), "containsObject:", a3) ^ 1;
}

- (void)setDisabledDomainNames:(id)a3 restrictedDomainNames:(id)a4
{

  self->_disabledDomainNames = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  -[MBServiceCache begin](self, "begin");
  -[MBServiceCache removeAllDisabledDomains](self, "removeAllDisabledDomains");
  -[MBServiceCache addDisabledDomainNames:restricted:](self, "addDisabledDomainNames:restricted:", a3, 0);
  -[MBServiceCache addDisabledDomainNames:restricted:](self, "addDisabledDomainNames:restricted:", a4, 1);
  -[MBServiceCache addDisabledDomainNames:restricted:](self, "addDisabledDomainNames:restricted:", objc_msgSend(-[MBServiceCache configuration](self, "configuration"), "domainNamesNotToBackUp"), 1);
  -[MBServiceCache end](self, "end");
}

- (void)addDisabledDomainNames:(id)a3 restricted:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a4;
  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into DisabledDomains values (?,?)"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(v7, "bindText:atIndex:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), 1);
        objc_msgSend(v7, "bindInt:atIndex:", v4, 2);
        objc_msgSend(v7, "step");
        objc_msgSend(v7, "reset");
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[NSMutableSet addObjectsFromArray:](self->_disabledDomainNames, "addObjectsFromArray:", objc_msgSend(a3, "allObjects"));
}

- (void)removeDisabledDomainNames:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from DisabledDomains where domainName = ?"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "bindText:atIndex:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), 1);
        objc_msgSend(v5, "step");
        objc_msgSend(v5, "reset");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[NSMutableSet minusSet:](self->_disabledDomainNames, "minusSet:", a3);
}

- (void)removeAllDisabledDomains
{
  id v3;

  v3 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from DisabledDomains"));
  objc_msgSend(v3, "step");
  objc_msgSend(v3, "reset");
  -[NSMutableSet removeAllObjects](self->_disabledDomainNames, "removeAllObjects");
}

- (id)_lastRefreshPropertyKeyForBackupUDID:(id)a3
{
  if (a3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("DateOfLastRefresh"), a3);
  else
    return CFSTR("DateOfLastRefresh");
}

- (id)dateOfLastRefreshForBackupUDID:(id)a3
{
  id result;

  result = -[MBServiceCache propertyForKey:](self, "propertyForKey:", -[MBServiceCache _lastRefreshPropertyKeyForBackupUDID:](self, "_lastRefreshPropertyKeyForBackupUDID:", a3));
  if (result)
  {
    objc_msgSend(result, "doubleValue");
    return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  return result;
}

- (BOOL)isRefreshNeededForBackupUDID:(id)a3
{
  NSMutableSet *upToDateBackupUDIDs;

  upToDateBackupUDIDs = self->_upToDateBackupUDIDs;
  objc_sync_enter(upToDateBackupUDIDs);
  LOBYTE(a3) = -[NSMutableSet containsObject:](self->_upToDateBackupUDIDs, "containsObject:", a3) ^ 1;
  objc_sync_exit(upToDateBackupUDIDs);
  return (char)a3;
}

- (void)forceRefreshForBackupUDID:(id)a3
{
  NSMutableSet *upToDateBackupUDIDs;

  upToDateBackupUDIDs = self->_upToDateBackupUDIDs;
  objc_sync_enter(upToDateBackupUDIDs);
  -[NSMutableSet removeObject:](self->_upToDateBackupUDIDs, "removeObject:", a3);
  objc_sync_exit(upToDateBackupUDIDs);
}

- (BOOL)_rebuildSnapshot:(id)a3 backupUDID:(id)a4 service:(id)a5 error:(id *)a6
{
  id v7;
  char *v11;
  _UNKNOWN **v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id *v21;
  MBFileID *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  BOOL v33;
  id v35;
  char *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v7 = a5;
  v11 = 0;
  v12 = &AnalyticsSendEventLazy_ptr;
  while (1)
  {
    v13 = objc_alloc_init((Class)v12[200]);
    v14 = objc_msgSend(v7, "listFilesForBackupUDID:snapshotID:offset:limit:error:", a4, objc_msgSend(a3, "snapshotID"), v11, objc_msgSend(-[MBServiceCache configuration](self, "configuration"), "listFilesCount"), a6);
    if (!v14)
      break;
    v15 = v14;
    if (!objc_msgSend(v14, "count"))
      goto LABEL_34;
    v37 = v11;
    v38 = v13;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v19);
          if (!objc_msgSend(v20, "verifyWithError:", a6))
          {
            if (!a6)
            {
              v32 = v38;
              goto LABEL_31;
            }
            v29 = *a6;
            v13 = v38;
            if (!*a6)
              goto LABEL_28;
            goto LABEL_27;
          }
          v21 = a6;
          v22 = +[MBFileID fileIDWithData:](MBFileID, "fileIDWithData:", objc_msgSend(v20, "fileID"));
          v23 = objc_msgSend(v20, "MBFileWithDomainManager:", self->_domainManager);
          v24 = -[MBServiceCache fileForID:snapshotID:backupUDID:](self, "fileForID:snapshotID:backupUDID:", v22, objc_msgSend(a3, "snapshotID"), a4);
          if (objc_msgSend(a3, "committed")
            || !objc_msgSend(v23, "isRegularFile")
            || objc_msgSend(objc_msgSend(objc_msgSend(v20, "duplicateFile"), "fileID"), "length"))
          {
            v25 = 1;
          }
          else if (v24
                 && objc_msgSend(v24, "isCommitted")
                 && objc_msgSend(objc_msgSend(v24, "digest"), "isEqualToData:", objc_msgSend(v20, "signature")))
          {
            v25 = objc_msgSend(v24, "isStatusChangedComparedToFile:", v23) ^ 1;
          }
          else
          {
            v25 = 0;
          }
          -[MBServiceCache addFile:snapshotID:backupUDID:committed:](self, "addFile:snapshotID:backupUDID:committed:", v20, 0, a4, v25);
          v19 = (char *)v19 + 1;
          a6 = v21;
        }
        while (v17 != v19);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        v17 = v26;
        if (v26)
          continue;
        break;
      }
    }
    v27 = objc_msgSend(obj, "count");
    v28 = v27 >= objc_msgSend(-[MBServiceCache configuration](self, "configuration"), "listFilesCount");
    v13 = v38;
    v7 = a5;
    v12 = &AnalyticsSendEventLazy_ptr;
    if (!v28)
    {
LABEL_34:
      objc_msgSend(v13, "drain");
      -[MBServiceCache _removeSnapshotForID:backupUDID:](self, "_removeSnapshotForID:backupUDID:", objc_msgSend(a3, "snapshotID"), a4);
      -[MBServiceCache addSnapshot:backupUDID:](self, "addSnapshot:backupUDID:", a3, a4);
      v35 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Files set snapshotID = ? where snapshotID = 0"));
      v33 = 1;
      objc_msgSend(v35, "bindInteger:atIndex:", objc_msgSend(a3, "snapshotID"), 1);
      objc_msgSend(v35, "step");
      objc_msgSend(v35, "reset");
      return v33;
    }
    v11 = &v37[(_QWORD)objc_msgSend(obj, "count")];
    objc_msgSend(v38, "drain");
  }
  if (a6)
  {
    v29 = *a6;
    if (*a6)
LABEL_27:
      v30 = v29;
LABEL_28:
    objc_msgSend(v13, "drain");
    if (*a6)
      v31 = *a6;
  }
  else
  {
    v32 = v13;
LABEL_31:
    objc_msgSend(v32, "drain");
  }
  return 0;
}

- (BOOL)refreshForBackupUDID:(id)a3 service:(id)a4 deleted:(BOOL *)a5 error:(id *)a6
{
  _BOOL8 v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  MBServiceConfiguration *v21;
  uint64_t v22;
  MBServiceConfiguration *v23;
  NSObject *v24;
  double v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSDate *v31;
  NSDate *v32;
  NSDate *v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  unsigned int v52;
  id v53;
  uint64_t v54;
  void *v55;
  _BOOL8 v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  NSDate *v67;
  NSDate *v68;
  id v69;
  id v70;
  uint64_t v71;
  NSObject *v72;
  NSDate *v73;
  NSDate *v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSDate *v80;
  NSDate *v81;
  id v82;
  uint64_t v83;
  void *k;
  void *v85;
  double v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  NSString *v90;
  id v91;
  uint64_t v92;
  NSObject *v93;
  double v94;
  double v95;
  NSMutableSet *upToDateBackupUDIDs;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  void *v103;
  id *v104;
  id v105;
  uint64_t v106;
  id v107;
  MBServiceCache *v108;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  uint8_t v129[128];
  uint8_t buf[4];
  double v131;
  __int16 v132;
  NSDate *v133;
  __int16 v134;
  NSDate *v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];

  if (*(double *)&a3 == 0.0)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1524, CFSTR("Null backup UDID"));
    if (a4)
      goto LABEL_3;
  }
  else if (a4)
  {
    goto LABEL_3;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1525, CFSTR("Null service"));
LABEL_3:
  v128 = 0;
  if (a5)
    *a5 = 0;
  v11 = -[MBServiceCache isRefreshNeededForBackupUDID:](self, "isRefreshNeededForBackupUDID:", a3);
  if (v11)
  {
    v13 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v15 = v14;
    v17 = MBGetDefaultLog(v13, v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v131 = *(double *)&a3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Refreshing cache for backup %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Refreshing cache for backup %@", a3);
    }
    v18 = objc_alloc_init((Class)NSAutoreleasePool);
    v103 = v18;
    if (!self->_configurationUpToDate)
    {
      v20 = MBGetDefaultLog(v18, v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Getting configuration", buf, 2u);
        _MBLog(CFSTR("INFO"), "Getting configuration");
      }
      v21 = +[MBServiceConfiguration configurationWithURL:error:](MBServiceConfiguration, "configurationWithURL:error:", sub_10000792C(), a6);
      v23 = v21;
      if (!v21)
      {
        if (a6)
        {
          if (*a6)
            v100 = *a6;
          objc_msgSend(v103, "drain");
          if (*a6)
            v101 = *a6;
        }
        else
        {
          objc_msgSend(v103, "drain");
        }
        return 0;
      }
      v24 = MBGetDefaultLog(v21, v22);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = COERCE_DOUBLE(-[MBServiceConfiguration propertyList](v23, "propertyList"));
        *(_DWORD *)buf = 138412290;
        v131 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Configuration: %@", buf, 0xCu);
        _MBLog(CFSTR("DEBUG"), "Configuration: %@", -[MBServiceConfiguration propertyList](v23, "propertyList"));
      }
      -[MBServiceCache setConfiguration:](self, "setConfiguration:", v23);
      self->_configurationUpToDate = 1;
    }
    v127 = 0;
    v26 = objc_msgSend(a4, "backupForUDID:lastModified:error:", a3, &v127, &v128);
    if (v26
      || (+[MBError isError:withCode:](MBError, "isError:withCode:", v128, 4) & 1) != 0)
    {
      -[MBServiceCache begin](self, "begin");
      v126 = 0;
      v108 = self;
      v27 = -[MBServiceCache backupForUDID:lastModified:](self, "backupForUDID:lastModified:", a3, &v126);
      v29 = v27;
      if (!v26)
      {
        v36 = MBGetDefaultLog(v27, v28);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Backup not found by service", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Backup not found by service");
        }
        if (v29)
        {
          if (a5)
            *a5 = 1;
          -[MBServiceCache removeBackupForUDID:](self, "removeBackupForUDID:", a3);
        }
        goto LABEL_94;
      }
      if (v27)
      {
        if (v126 != v127)
        {
          v30 = MBGetDefaultLog(v27, v28);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(double *)&v31 = COERCE_DOUBLE(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v126));
            v32 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v127);
            *(_DWORD *)buf = 138412546;
            v131 = *(double *)&v31;
            v132 = 2112;
            v133 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Backup modified (%@ != %@)", buf, 0x16u);
            v33 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v126);
            _MBLog(CFSTR("DEFAULT"), "Backup modified (%@ != %@)", v33, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v127));
          }
          -[MBServiceCache setLastModified:forBackupUDID:](self, "setLastModified:forBackupUDID:", v127, a3);
        }
      }
      else
      {
        v37 = MBGetDefaultLog(0, v28);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Backup not found in cache", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Backup not found in cache");
        }
        -[MBServiceCache addBackup:lastModified:](self, "addBackup:lastModified:", v26, v127);
      }
      v105 = a4;
      v38 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v39 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v104 = a6;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v40 = objc_msgSend(v26, "snapshots");
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v123;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(_QWORD *)v123 != v42)
              objc_enumerationMutation(v40);
            objc_msgSend(v38, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i), "snapshotID")));
          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
        }
        while (v41);
      }
      if (v29)
      {
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v44 = objc_msgSend(v29, "snapshots");
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v119;
          do
          {
            for (j = 0; j != v45; j = (char *)j + 1)
            {
              if (*(_QWORD *)v119 != v46)
                objc_enumerationMutation(v44);
              objc_msgSend(v39, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j), "snapshotID")));
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
          }
          while (v45);
        }
      }
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v48 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
      if (!v48)
        goto LABEL_83;
      v106 = *(_QWORD *)v115;
LABEL_51:
      v107 = v48;
      v49 = 0;
      while (1)
      {
        if (*(_QWORD *)v115 != v106)
          objc_enumerationMutation(v38);
        v50 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v49);
        v51 = objc_msgSend(v38, "objectForKeyedSubscript:", v50);
        v52 = objc_msgSend(v51, "snapshotID");
        v53 = objc_msgSend(v39, "objectForKeyedSubscript:", v50);
        v55 = v53;
        if (!v53)
          break;
        if (!objc_msgSend(v53, "committed"))
        {
          v56 = -[MBServiceCache isStaleSnapshotID:backupUDID:](v108, "isStaleSnapshotID:backupUDID:", v52, a3);
          if (v56)
          {
            v58 = MBGetDefaultLog(v56, v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&v131 = v52;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Rebuilding uncommitted snapshot %lu", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "Rebuilding uncommitted snapshot %lu", v52);
            }
            goto LABEL_78;
          }
        }
        v59 = objc_msgSend(v55, "lastModified");
        v60 = objc_msgSend(v51, "lastModified");
        if (v59 != v60)
        {
          v79 = MBGetDefaultLog(v60, v61);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            v80 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v55, "lastModified"));
            v81 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v51, "lastModified"));
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&v131 = v52;
            v132 = 2112;
            v133 = v80;
            v134 = 2112;
            v135 = v81;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Rebuilding modified snapshot %lu (%@ != %@)", buf, 0x20u);
            a6 = v104;
            _MBLog(CFSTR("DEFAULT"), "Rebuilding modified snapshot %lu (%@ != %@)", v52, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v55, "lastModified")), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v51, "lastModified")));
          }
          goto LABEL_78;
        }
        v62 = MBGetDefaultLog(v60, v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&v131 = v52;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Snapshot %lu is unmodified", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Snapshot %lu is unmodified", v52);
        }
        v63 = objc_msgSend(v55, "lastModified");
        v64 = objc_msgSend(v51, "lastModified");
        if (v63 != v64)
        {
          v66 = MBGetDefaultLog(v64, v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v55, "lastModified"));
            v68 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v51, "lastModified"));
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&v131 = v52;
            v132 = 2112;
            v133 = v67;
            v134 = 2112;
            v135 = v68;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Correcting snapshot %lu last-modified value (%@ != %@)", buf, 0x20u);
            a6 = v104;
            _MBLog(CFSTR("DEFAULT"), "Correcting snapshot %lu last-modified value (%@ != %@)", v52, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v55, "lastModified")), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v51, "lastModified")));
          }
          -[MBServiceCache setLastModified:forSnapshotID:backupUDID:](v108, "setLastModified:forSnapshotID:backupUDID:", objc_msgSend(v51, "lastModified"), v52, a3);
        }
        v69 = objc_msgSend(v55, "committed");
        v70 = objc_msgSend(v51, "committed");
        if (v69 != v70)
        {
          v72 = MBGetDefaultLog(v70, v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            v73 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v55, "committed"));
            v74 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v51, "committed"));
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&v131 = v52;
            v132 = 2112;
            v133 = v73;
            v134 = 2112;
            v135 = v74;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Correcting snapshot %lu committed value (%@ != %@)", buf, 0x20u);
            a6 = v104;
            _MBLog(CFSTR("DEFAULT"), "Correcting snapshot %lu committed value (%@ != %@)", v52, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v55, "committed")), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v51, "committed")));
          }
          -[MBServiceCache setCommitted:forSnapshotID:backupUDID:](v108, "setCommitted:forSnapshotID:backupUDID:", objc_msgSend(v51, "committed"), v52, a3);
        }
        v75 = objc_msgSend(objc_msgSend(objc_msgSend(v55, "attributes"), "dictionaryRepresentation"), "isEqualToDictionary:", objc_msgSend(objc_msgSend(v51, "attributes"), "dictionaryRepresentation"));
        if ((v75 & 1) == 0)
        {
          v77 = MBGetDefaultLog(v75, v76);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&v131 = v52;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Correcting snapshot %lu attributes", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), "Correcting snapshot %lu attributes", v52);
          }
          -[MBServiceCache addSnapshot:backupUDID:](v108, "addSnapshot:backupUDID:", v51, a3);
        }
LABEL_79:
        if (!-[MBServiceCache localCommittedForSnapshotID:backupUDID:](v108, "localCommittedForSnapshotID:backupUDID:", v52, a3))-[MBServiceCache setLocalCommitted:snapshotID:backupUDID:](v108, "setLocalCommitted:snapshotID:backupUDID:", objc_msgSend(v51, "committed"), v52, a3);
        if (v107 == (id)++v49)
        {
          v48 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
          if (v48)
            goto LABEL_51;
LABEL_83:
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          v82 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
          if (v82)
          {
            v83 = *(_QWORD *)v111;
            do
            {
              for (k = 0; k != v82; k = (char *)k + 1)
              {
                if (*(_QWORD *)v111 != v83)
                  objc_enumerationMutation(v39);
                v85 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)k);
                if (!objc_msgSend(v38, "objectForKeyedSubscript:", v85))
                {
                  v86 = COERCE_DOUBLE(objc_msgSend(v85, "integerValue"));
                  v88 = MBGetDefaultLog(*(_QWORD *)&v86, v87);
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    v131 = v86;
                    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Deleting snapshot %lu from cache", buf, 0xCu);
                    _MBLog(CFSTR("DEFAULT"), "Deleting snapshot %lu from cache", *(_QWORD *)&v86);
                  }
                  -[MBServiceCache _removeSnapshotForID:backupUDID:](v108, "_removeSnapshotForID:backupUDID:", *(_QWORD *)&v86, a3);
                }
              }
              v82 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
            }
            while (v82);
          }
LABEL_94:
          -[MBServiceCache end](v108, "end");
          -[MBServiceCache analyze](v108, "analyze");
          objc_msgSend(v103, "drain");
          -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
          v90 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v89);
          -[MBServiceCache setProperty:forKey:](v108, "setProperty:forKey:", v90, -[MBServiceCache _lastRefreshPropertyKeyForBackupUDID:](v108, "_lastRefreshPropertyKeyForBackupUDID:", a3));
          v91 = -[MBServiceCache setProperty:forKey:](v108, "setProperty:forKey:", v90, -[MBServiceCache _lastRefreshPropertyKeyForBackupUDID:](v108, "_lastRefreshPropertyKeyForBackupUDID:", 0));
          v93 = MBGetDefaultLog(v91, v92);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
            *(_DWORD *)buf = 134217984;
            v131 = v94 - v15;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Refreshed cache in %0.3f s", buf, 0xCu);
            +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
            _MBLog(CFSTR("DEFAULT"), "Refreshed cache in %0.3f s", v95 - v15);
          }
          upToDateBackupUDIDs = v108->_upToDateBackupUDIDs;
          objc_sync_enter(upToDateBackupUDIDs);
          -[NSMutableSet addObject:](v108->_upToDateBackupUDIDs, "addObject:", a3);
          objc_sync_exit(upToDateBackupUDIDs);
          -[MBServiceCache repair](v108, "repair");
          return 1;
        }
      }
      v78 = MBGetDefaultLog(0, v54);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&v131 = v52;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Adding snapshot %lu to cache", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Adding snapshot %lu to cache", v52);
      }
LABEL_78:
      if (!-[MBServiceCache _rebuildSnapshot:backupUDID:service:error:](v108, "_rebuildSnapshot:backupUDID:service:error:", v51, a3, v105, a6))
      {
        if (a6 && *a6)
          v97 = *a6;
        objc_msgSend(v103, "drain");
        if (a6 && *a6)
          v98 = *a6;
        v35 = 0;
        -[MBServiceCache rollback](v108, "rollback");
        return v35;
      }
      goto LABEL_79;
    }
    if (a6)
    {
      *a6 = v128;
      objc_msgSend(v103, "drain");
      v99 = v128;
    }
    else
    {
      objc_msgSend(v103, "drain");
    }
    return 0;
  }
  v34 = MBGetDefaultLog(v11, v12);
  v35 = 1;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v131 = *(double *)&a3;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Not refreshing cache because backup is up-to-date: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Not refreshing cache because backup is up-to-date: %@", a3);
    return 1;
  }
  return v35;
}

- (void)repair
{
  NSObject *v3;
  id v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  unsigned int v11;

  v3 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Repairing cache if needed", buf, 2u);
    _MBLog(CFSTR("INFO"), "Repairing cache if needed");
  }
  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from Files where lower(hex(duplicateFileID)) = fileID and duplicateSnapshotID = snapshotID"));
  objc_msgSend(v4, "step");
  v5 = objc_msgSend(v4, "intColumn:", 0);
  v6 = objc_msgSend(v4, "reset");
  if (v5)
  {
    v8 = MBGetDefaultLog(v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Repairing %d self referencing duplicate files in cache", buf, 8u);
      _MBLog(CFSTR("DEFAULT"), "Repairing %d self referencing duplicate files in cache", v5);
    }
    v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Files set duplicateFileID = null, duplicateSnapshotID = 0 where lower(hex(duplicateFileID)) = fileID and duplicateSnapshotID = snapshotID"));
    objc_msgSend(v9, "step");
    objc_msgSend(v9, "reset");
  }
}

- (void)verifyBackupUDID:(id)a3 service:(id)a4
{
  NSObject *v8;
  id v9;
  id v10;
  MBServiceCache *v11;
  NSAssertionHandler *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[8];
  uint64_t v20;

  v20 = 0;
  v8 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Verifying cache", buf, 2u);
    _MBLog(CFSTR("INFO"), "Verifying cache");
  }
  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from Files where lower(hex(duplicateFileID)) = fileID and duplicateSnapshotID = snapshotID"));
  objc_msgSend(v9, "step");
  v10 = objc_msgSend(v9, "intColumn:", 0);
  objc_msgSend(v9, "reset");
  if ((_DWORD)v10)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1735, CFSTR("%d self referencing duplicate files in cache"), v10);
  v11 = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", MBTemporaryPath(), self->_domainManager);
  -[MBServiceCache open](v11, "open");
  sub_100084A04(1);
  if (!-[MBServiceCache refreshForBackupUDID:service:deleted:error:](v11, "refreshForBackupUDID:service:deleted:error:", a3, a4, 0, &v20))
  {
    v12 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1744, CFSTR("Failed to refresh temporary cache: %@"), v20);
  }
  sub_100084A04(0);
  v13 = -[MBServiceCache _prepare:](v11, "_prepare:", CFSTR("select * from Backups where backupUDID = ?"));
  objc_msgSend(v13, "bindText:atIndex:", a3, 1);
  v14 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Backups where backupUDID = ?"));
  objc_msgSend(v14, "bindText:atIndex:", a3, 1);
  objc_msgSend(v13, "verifyEqualToStmt:exceptColumnNumbers:", v14, 0);
  v15 = -[MBServiceCache _prepare:](v11, "_prepare:", CFSTR("select * from Snapshots where backupUDID = ? order by snapshotID"));
  objc_msgSend(v15, "bindText:atIndex:", a3, 1);
  v16 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Snapshots where backupUDID = ? order by snapshotID"));
  objc_msgSend(v16, "bindText:atIndex:", a3, 1);
  objc_msgSend(v15, "verifyEqualToStmt:exceptColumnNumbers:", v16, +[NSSet setWithObjects:](NSSet, "setWithObjects:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5), 0));
  v17 = -[MBServiceCache _prepare:](v11, "_prepare:", CFSTR("select * from Files where backupUDID = ? order by snapshotID, fileID"));
  objc_msgSend(v17, "bindText:atIndex:", a3, 1);
  v18 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from Files where backupUDID = ? order by snapshotID, fileID"));
  objc_msgSend(v18, "bindText:atIndex:", a3, 1);
  objc_msgSend(v17, "verifyEqualToStmt:exceptColumnNumbers:", v18, +[NSSet setWithObjects:](NSSet, "setWithObjects:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9), 0));
  -[MBServiceCache close](v11, "close");
  -[MBServiceCache _remove](v11, "_remove");
}

- (id)_fileChangeFromStmt:(id)a3
{
  MBFileID *v6;
  id v7;
  id v8;
  id v9;
  MBSFileReference *v10;
  id v11;

  v6 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(a3, "textColumn:", 0));
  if (!v6)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1787, CFSTR("Failed to convert file change ID"));
  v7 = objc_msgSend(a3, "blobColumn:", 4);
  v8 = objc_msgSend(a3, "intColumn:", 5);
  if (v7)
  {
    v9 = v8;
    v10 = objc_alloc_init(MBSFileReference);
    -[MBSFileReference setFileID:](v10, "setFileID:", v7);
    -[MBSFileReference setSnapshotID:](v10, "setSnapshotID:", v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = +[MBServiceFileChange fileChange](MBServiceFileChange, "fileChange");
  objc_msgSend(v11, "setFileID:", v6);
  objc_msgSend(v11, "setType:", objc_msgSend(a3, "intColumn:", 1));
  objc_msgSend(v11, "setDomainName:", objc_msgSend(a3, "textColumn:", 2));
  objc_msgSend(v11, "setRelativePath:", objc_msgSend(a3, "textColumn:", 3));
  objc_msgSend(v11, "setDuplicateFileReference:", v10);
  objc_msgSend(v11, "setSize:", objc_msgSend(a3, "int64Column:", 6));
  objc_msgSend(v11, "setResult:", objc_msgSend(a3, "intColumn:", 7));
  return v11;
}

- (id)fileChangeEnumerator
{
  return +[MBSFileChangeEnumerator enumeratorWithCache:](MBSFileChangeEnumerator, "enumeratorWithCache:", self);
}

- (id)fileChangeIDsWithResult:(int)a3 offset:(unint64_t)a4 limit:(unint64_t)a5
{
  uint64_t v7;
  id v9;
  id v10;

  v7 = *(_QWORD *)&a3;
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select fileID from FileChanges where result = ? limit ? offset ?"));
  objc_msgSend(v10, "bindInt:atIndex:", v7, 1);
  objc_msgSend(v10, "bindInteger:atIndex:", a5, 2);
  objc_msgSend(v10, "bindInteger:atIndex:", a4, 3);
  if (objc_msgSend(v10, "step"))
  {
    do
      objc_msgSend(v9, "addObject:", +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(v10, "textColumn:", 0)));
    while ((objc_msgSend(v10, "step") & 1) != 0);
  }
  objc_msgSend(v10, "reset");
  return v9;
}

- (void)addFileChange:(id)a3
{
  id v6;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1830, CFSTR("Null file change"));
  if (!objc_msgSend(a3, "fileID"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1831, CFSTR("Null file change ID"));
  if (!objc_msgSend(a3, "domainName"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1832, CFSTR("Null file change domain"));
  if (!objc_msgSend(a3, "relativePath"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1833, CFSTR("Null file change relative path"));
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert into FileChanges values (?,?,?,?,?,?,?,?)"));
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(objc_msgSend(a3, "fileID"), "string"), 1);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "type"), 2);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "domainName"), 3);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "relativePath"), 4);
  objc_msgSend(v6, "bindBlob:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFileReference"), "fileID"), 5);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(objc_msgSend(a3, "duplicateFileReference"), "snapshotID"), 6);
  objc_msgSend(v6, "bindInt64:atIndex:", objc_msgSend(a3, "size"), 7);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "result"), 8);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)setResult:(int)a3 forFileChangeID:(id)a4
{
  uint64_t v5;
  id v7;

  v5 = *(_QWORD *)&a3;
  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 1849, CFSTR("Null fileID"));
  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update FileChanges set result = ? where fileID = ?"));
  objc_msgSend(v7, "bindInt:atIndex:", v5, 1);
  objc_msgSend(v7, "bindText:atIndex:", objc_msgSend(a4, "string"), 2);
  objc_msgSend(v7, "step");
  objc_msgSend(v7, "reset");
}

- (void)fileChangeCount:(unint64_t *)a3 size:(unint64_t *)a4
{
  id v6;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*), sum(size) from FileChanges where (type = 1 or type = 2) and duplicateFileID is null and domainName not in (select domainName from DisabledDomains)"));
  if (objc_msgSend(v6, "step"))
  {
    if (a3)
      *a3 = (int)objc_msgSend(v6, "intColumn:", 0);
    if (a4)
      *a4 = (unint64_t)objc_msgSend(v6, "int64Column:", 1);
  }
  objc_msgSend(v6, "reset");
}

- (void)updateFileChangesAfterCommittingSnapshot
{
  id v3;
  id v4;
  id v5;

  v3 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FileChanges where type = 3"));
  objc_msgSend(v3, "step");
  objc_msgSend(v3, "reset");
  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update FileChanges set type = 0 where (type = 1 or type = 2) and domainName not in (select domainName from DisabledDomains)"));
  objc_msgSend(v4, "step");
  objc_msgSend(v4, "reset");
  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update FileChanges set type = 1 where (type = 0 or type = 2) and domainName in (select domainName from DisabledDomains)"));
  objc_msgSend(v5, "step");
  objc_msgSend(v5, "reset");
}

- (void)updateFileChangesAfterRemovingDomainName:(id)a3
{
  id v5;
  id v6;

  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FileChanges where domainName = ? and type = 3"));
  objc_msgSend(v5, "bindText:atIndex:", a3, 1);
  objc_msgSend(v5, "step");
  objc_msgSend(v5, "reset");
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update FileChanges set type = 1 where domainName = ?"));
  objc_msgSend(v6, "bindText:atIndex:", a3, 1);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)removeAllFileChanges
{
  id v2;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FileChanges"));
  objc_msgSend(v2, "step");
  objc_msgSend(v2, "reset");
}

- (BOOL)areFilesMissingEncryptionKey
{
  id v2;
  BOOL v3;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from FilesMissingEncryptionKey"));
  if (objc_msgSend(v2, "step"))
    v3 = objc_msgSend(v2, "intColumn:", 0) != 0;
  else
    v3 = 0;
  objc_msgSend(v2, "reset");
  return v3;
}

- (id)pathsForFilesMissingEncryptionKeyWithOffset:(unint64_t)a3 limit:(unint64_t)a4
{
  id v7;
  id v8;

  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select path from FilesMissingEncryptionKey limit ? offset ?"));
  objc_msgSend(v8, "bindInteger:atIndex:", a4, 1);
  objc_msgSend(v8, "bindInteger:atIndex:", a3, 2);
  if (objc_msgSend(v8, "step"))
  {
    do
      objc_msgSend(v7, "addObject:", objc_msgSend(v8, "textColumn:", 0));
    while ((objc_msgSend(v8, "step") & 1) != 0);
  }
  objc_msgSend(v8, "reset");
  return v7;
}

- (void)addFileMissingEncryptionKeyWithPath:(id)a3
{
  id v4;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into FilesMissingEncryptionKey values (?)"));
  objc_msgSend(v4, "bindText:atIndex:", a3, 1);
  objc_msgSend(v4, "step");
  objc_msgSend(v4, "reset");
}

- (void)removeFileMissingEncryptionKeyWithPath:(id)a3
{
  id v4;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FilesMissingEncryptionKey where path = ?"));
  objc_msgSend(v4, "bindText:atIndex:", a3, 1);
  objc_msgSend(v4, "step");
  objc_msgSend(v4, "reset");
}

- (void)removeAllFilesMissingEncryptionKey
{
  id v2;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FilesMissingEncryptionKey"));
  objc_msgSend(v2, "step");
  objc_msgSend(v2, "reset");
}

- (id)encryptionKeyForFileWithInodeNumber:(unint64_t)a3
{
  id v4;
  id v5;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select encryptionKey from FileEncryptionKeys where inodeNumber = ?"));
  objc_msgSend(v4, "bindInt64:atIndex:", a3, 1);
  if (objc_msgSend(v4, "step"))
    v5 = objc_msgSend(v4, "blobColumn:", 0);
  else
    v5 = 0;
  objc_msgSend(v4, "reset");
  return v5;
}

- (void)setFileEncryptionKey:(id)a3 forInodeNumber:(unint64_t)a4
{
  id v6;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into FileEncryptionKeys values (?,?)"));
  objc_msgSend(v6, "bindInt64:atIndex:", a4, 1);
  objc_msgSend(v6, "bindBlob:atIndex:", a3, 2);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)removeFileEncryptionKeyForInodeNumber:(unint64_t)a3
{
  id v4;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FileEncryptionKeys where inodeNumber = ?"));
  objc_msgSend(v4, "bindInt64:atIndex:", a3, 1);
  objc_msgSend(v4, "step");
  objc_msgSend(v4, "reset");
}

- (void)removeAllFileEncryptionKeys
{
  id v2;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FileEncryptionKeys"));
  objc_msgSend(v2, "step");
  objc_msgSend(v2, "reset");
}

- (unint64_t)restoreIDForMode:(id)a3
{
  const __CFString *v5;
  id v6;
  signed int v7;
  unint64_t v8;
  id v9;
  id v10;

  if (objc_msgSend(a3, "value"))
    v5 = CFSTR("select restoreID from Restores where type = ? and value = ?");
  else
    v5 = CFSTR("select restoreID from Restores where type = ? and value is null");
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", v5);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "type"), 1);
  if (objc_msgSend(a3, "value"))
    objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(a3, "value"), 2);
  if ((objc_msgSend(v6, "step") & 1) != 0)
  {
    v7 = objc_msgSend(v6, "intColumn:", 0);
    objc_msgSend(v6, "reset");
    if (v7)
      return v7;
  }
  else
  {
    objc_msgSend(v6, "reset");
  }
  if ((objc_msgSend(a3, "isForeground") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select max(restoreID)+1 from Restores"));
    if (objc_msgSend(v9, "step"))
      v8 = (int)objc_msgSend(v9, "intColumn:", 0);
    else
      v8 = 2;
    objc_msgSend(v9, "reset");
  }
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert into Restores values (?,?,?)"));
  objc_msgSend(v10, "bindInt:atIndex:", v8, 1);
  objc_msgSend(v10, "bindInt:atIndex:", objc_msgSend(a3, "type"), 2);
  objc_msgSend(v10, "bindText:atIndex:", objc_msgSend(a3, "value"), 3);
  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");
  return v8;
}

- (id)restoreModeForBackgroundAppWithRestoreID:(unint64_t)a3
{
  id v4;
  MBServiceRestoreMode *v5;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select value from Restores where restoreID = ? and type = ?"));
  objc_msgSend(v4, "bindInt:atIndex:", a3, 1);
  objc_msgSend(v4, "bindInt:atIndex:", 1, 2);
  if (objc_msgSend(v4, "step"))
    v5 = +[MBServiceRestoreMode restoreModeWithType:value:](MBServiceRestoreMode, "restoreModeWithType:value:", 1, objc_msgSend(v4, "textColumn:", 0));
  else
    v5 = 0;
  objc_msgSend(v4, "reset");
  return v5;
}

- (void)setRestoreID:(unint64_t)a3 forType:(int)a4 value:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a4;
  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select restoreID from Restores where type = ? and value = ?"));
  objc_msgSend(v9, "bindInt:atIndex:", v6, 1);
  objc_msgSend(v9, "bindText:atIndex:", a5, 2);
  if (objc_msgSend(v9, "step"))
  {
    do
    {
      v10 = objc_msgSend(v9, "intColumn:", 0);
      v11 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update Restores set restoreID = ? where restoreID = ?"));
      objc_msgSend(v11, "bindInt:atIndex:", a3, 1);
      objc_msgSend(v11, "bindInt:atIndex:", v10, 2);
      objc_msgSend(v11, "step");
      objc_msgSend(v11, "reset");
      v12 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update RestoreFiles set restoreID = ? where restoreID = ?"));
      objc_msgSend(v12, "bindInt:atIndex:", a3, 1);
      objc_msgSend(v12, "bindInt:atIndex:", v10, 2);
      objc_msgSend(v12, "step");
      objc_msgSend(v12, "reset");
    }
    while ((objc_msgSend(v9, "step") & 1) != 0);
  }
  objc_msgSend(v9, "reset");
}

- (void)removeAllRestores
{
  id v2;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from Restores"));
  objc_msgSend(v2, "step");
  objc_msgSend(v2, "reset");
}

- (id)restoreBackupUDID
{
  return -[MBServiceCache propertyForKey:](self, "propertyForKey:", CFSTR("RestoreBackupUDID"));
}

- (void)setRestoreBackupUDID:(id)a3
{
  -[MBServiceCache setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("RestoreBackupUDID"));
}

- (int64_t)restoreSnapshotID
{
  return (int64_t)objc_msgSend(-[MBServiceCache propertyForKey:](self, "propertyForKey:", CFSTR("RestoreSnapshotID")), "integerValue");
}

- (void)setRestoreSnapshotID:(int64_t)a3
{
  -[MBServiceCache setProperty:forKey:](self, "setProperty:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3), CFSTR("RestoreSnapshotID"));
}

- (int64_t)restoreBackupLastModified
{
  return (int64_t)objc_msgSend(-[MBServiceCache propertyForKey:](self, "propertyForKey:", CFSTR("RestoreBackupLastModified")), "longLongValue");
}

- (void)setRestoreBackupLastModified:(int64_t)a3
{
  -[MBServiceCache setProperty:forKey:](self, "setProperty:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3), CFSTR("RestoreBackupLastModified"));
}

- (BOOL)containsRestoreFilesForRestoreID:(unint64_t)a3
{
  id v4;
  BOOL v5;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from RestoreFiles where restoreID = ? and state != 2 and state != 3"));
  objc_msgSend(v4, "bindInteger:atIndex:", a3, 1);
  if (objc_msgSend(v4, "step"))
    v5 = objc_msgSend(v4, "intColumn:", 0) != 0;
  else
    v5 = 0;
  objc_msgSend(v4, "reset");
  return v5;
}

- (BOOL)containsRestoreFilesWithState:(int)a3 forRestoreID:(unint64_t)a4
{
  uint64_t v5;
  id v6;
  BOOL v7;

  v5 = *(_QWORD *)&a3;
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from RestoreFiles where restoreID = ? and state = ?"));
  objc_msgSend(v6, "bindInteger:atIndex:", a4, 1);
  objc_msgSend(v6, "bindInt:atIndex:", v5, 2);
  if (objc_msgSend(v6, "step"))
    v7 = objc_msgSend(v6, "intColumn:", 0) != 0;
  else
    v7 = 0;
  objc_msgSend(v6, "reset");
  return v7;
}

- (BOOL)containsFailedRestoreFilesForRestoreID:(unint64_t)a3
{
  id v4;
  BOOL v5;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from RestoreFiles where restoreID = ? and state = 4"));
  objc_msgSend(v4, "bindInteger:atIndex:", a3, 1);
  if (objc_msgSend(v4, "step"))
    v5 = objc_msgSend(v4, "intColumn:", 0) != 0;
  else
    v5 = 0;
  objc_msgSend(v4, "reset");
  return v5;
}

- (id)_restoreFileWithStmt:(id)a3
{
  id v4;

  v4 = +[MBServiceRestoreFile restoreFile](MBServiceRestoreFile, "restoreFile");
  objc_msgSend(v4, "setRestoreID:", (int)objc_msgSend(a3, "intColumn:", 0));
  objc_msgSend(v4, "setFileID:", +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(a3, "textColumn:", 1)));
  objc_msgSend(v4, "setSnapshotID:", (int)objc_msgSend(a3, "intColumn:", 2));
  objc_msgSend(v4, "setItemID:", (int)objc_msgSend(a3, "intColumn:", 3));
  objc_msgSend(v4, "setState:", objc_msgSend(a3, "intColumn:", 4));
  objc_msgSend(v4, "setPriority:", (int)objc_msgSend(a3, "intColumn:", 5));
  return v4;
}

- (id)_restoreFilesWithStmt:(id)a3
{
  id v5;

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (objc_msgSend(a3, "step"))
  {
    do
      objc_msgSend(v5, "addObject:", -[MBServiceCache _restoreFileWithStmt:](self, "_restoreFileWithStmt:", a3));
    while ((objc_msgSend(a3, "step") & 1) != 0);
  }
  return v5;
}

- (void)restoreFilesCount:(unint64_t *)a3 size:(unint64_t *)a4 forRestoreID:(unint64_t)a5 backupUDID:(id)a6
{
  id v10;

  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*), sum(f.size) FROM RestoreFiles rf JOIN Files f ON f.fileID = rf.fileID AND f.snapshotID = rf.snapshotID WHERE rf.restoreID = ? AND rf.state = 0 AND f.backupUDID = ? AND NOT (f.domainName LIKE 'AppDomain-%' AND (f.encryptionKey IS NOT NULL OR (f.protectionClass != 0 AND f.protectionClass != 4)))"));
  objc_msgSend(v10, "bindInteger:atIndex:", a5, 1);
  objc_msgSend(v10, "bindText:atIndex:", a6, 2);
  if (objc_msgSend(v10, "step"))
  {
    if (a3)
      *a3 = (int)objc_msgSend(v10, "intColumn:", 0);
    if (a4)
      *a4 = (unint64_t)objc_msgSend(v10, "int64Column:", 1);
  }
  objc_msgSend(v10, "reset");
}

- (id)restoreFilesForBackupUDID:(id)a3 offset:(unint64_t)a4 limit:(unint64_t)a5
{
  id v9;
  id v10;

  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select RestoreFiles.* from RestoreFiles, Files where Files.backupUDID = ? and Files.fileID = RestoreFiles.fileID order by Files.domainName, Files.relativePath limit ? offset ?"));
  objc_msgSend(v9, "bindText:atIndex:", a3, 1);
  objc_msgSend(v9, "bindInteger:atIndex:", a5, 2);
  objc_msgSend(v9, "bindInteger:atIndex:", a4, 3);
  v10 = -[MBServiceCache _restoreFilesWithStmt:](self, "_restoreFilesWithStmt:", v9);
  objc_msgSend(v9, "reset");
  return v10;
}

- (id)restoreFilesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 restoreID:(unint64_t)a5 pendingOnly:(BOOL)a6 offset:(unint64_t)a7 limit:(unint64_t)a8
{
  const __CFString *v15;
  id v16;
  id v17;

  if (a6)
    v15 = CFSTR("and RestoreFiles.state = 0 limit ?");
  else
    v15 = CFSTR("order by Files.added limit ? offset ?");
  v16 = -[MBServiceCache _prepare:](self, "_prepare:", objc_msgSend(CFSTR("select RestoreFiles.* from RestoreFiles, Files where RestoreFiles.restoreID = ? and RestoreFiles.snapshotID = ? and Files.backupUDID = ? and Files.snapshotID = ? and Files.fileID = RestoreFiles.fileID "), "stringByAppendingString:", v15));
  objc_msgSend(v16, "bindInteger:atIndex:", a5, 1);
  objc_msgSend(v16, "bindInteger:atIndex:", a3, 2);
  objc_msgSend(v16, "bindText:atIndex:", a4, 3);
  objc_msgSend(v16, "bindInteger:atIndex:", a3, 4);
  objc_msgSend(v16, "bindInteger:atIndex:", a8, 5);
  if (!a6)
    objc_msgSend(v16, "bindInteger:atIndex:", a7, 6);
  v17 = -[MBServiceCache _restoreFilesWithStmt:](self, "_restoreFilesWithStmt:", v16);
  objc_msgSend(v16, "reset");
  return v17;
}

- (id)restoreFileForFileID:(id)a3
{
  id v5;
  id v6;

  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from RestoreFiles where fileID = ?"));
  objc_msgSend(v5, "bindText:atIndex:", objc_msgSend(a3, "string"), 1);
  if (objc_msgSend(v5, "step"))
    v6 = -[MBServiceCache _restoreFileWithStmt:](self, "_restoreFileWithStmt:", v5);
  else
    v6 = 0;
  objc_msgSend(v5, "reset");
  return v6;
}

- (id)restoreFileForItemID:(unint64_t)a3
{
  id v5;
  id v6;

  v5 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select * from RestoreFiles where itemID = ?"));
  objc_msgSend(v5, "bindInt64:atIndex:", a3, 1);
  if (objc_msgSend(v5, "step"))
    v6 = -[MBServiceCache _restoreFileWithStmt:](self, "_restoreFileWithStmt:", v5);
  else
    v6 = 0;
  objc_msgSend(v5, "reset");
  return v6;
}

- (void)addRestoreFile:(id)a3
{
  id v6;

  if (!objc_msgSend(a3, "restoreID"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2260, CFSTR("Restored ID not set"));
  if (!objc_msgSend(a3, "fileID"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2261, CFSTR("File ID not set"));
  if (!objc_msgSend(a3, "snapshotID"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2262, CFSTR("Snapshot ID not set"));
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into RestoreFiles values (?,?,?,?,?,0)"));
  objc_msgSend(v6, "bindInteger:atIndex:", objc_msgSend(a3, "restoreID"), 1);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(objc_msgSend(a3, "fileID"), "string"), 2);
  objc_msgSend(v6, "bindInteger:atIndex:", objc_msgSend(a3, "snapshotID"), 3);
  objc_msgSend(v6, "bindInt64:atIndex:", objc_msgSend(a3, "itemID"), 4);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "state"), 5);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)setRestoreID:(unint64_t)a3 forRestoreFile:(id)a4
{
  id v6;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update RestoreFiles set restoreID = ? where restoreID = ? and fileID = ?"));
  objc_msgSend(v6, "bindInteger:atIndex:", a3, 1);
  objc_msgSend(v6, "bindInteger:atIndex:", objc_msgSend(a4, "restoreID"), 2);
  objc_msgSend(v6, "bindText:atIndex:", objc_msgSend(objc_msgSend(a4, "fileID"), "string"), 3);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)setRestoreID:(unint64_t)a3 forDomainName:(id)a4 relativePath:(id)a5 backupUDID:(id)a6
{
  id v10;

  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update RestoreFiles set restoreID = ? where fileID in (select distinct fileID from Files where backupUDID = ? and domainName = ? and relativePath like (? || '%'))"));
  objc_msgSend(v10, "bindInteger:atIndex:", a3, 1);
  objc_msgSend(v10, "bindText:atIndex:", a6, 2);
  objc_msgSend(v10, "bindText:atIndex:", a4, 3);
  objc_msgSend(v10, "bindText:atIndex:", a5, 4);
  objc_msgSend(v10, "step");
  objc_msgSend(v10, "reset");
}

- (void)setState:(int)a3 forFileID:(id)a4 restoreID:(unint64_t)a5
{
  uint64_t v7;
  id v8;

  v7 = *(_QWORD *)&a3;
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update RestoreFiles set state = ? where restoreID = ? and fileID = ?"));
  objc_msgSend(v8, "bindInt:atIndex:", v7, 1);
  objc_msgSend(v8, "bindInteger:atIndex:", a5, 2);
  objc_msgSend(v8, "bindText:atIndex:", objc_msgSend(a4, "string"), 3);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (void)setState:(int)a3 forRestoreID:(unint64_t)a4
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)&a3;
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update RestoreFiles set state = ? where restoreID = ?"));
  objc_msgSend(v6, "bindInt:atIndex:", v5, 1);
  objc_msgSend(v6, "bindInteger:atIndex:", a4, 2);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (void)prioritizeRestoreFileWithFileID:(id)a3
{
  id v4;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("update RestoreFiles set priority = (select max(priority)+1 from RestoreFiles) where fileID = ?"));
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "string"), 1);
  objc_msgSend(v4, "step");
  objc_msgSend(v4, "reset");
}

- (id)filesToRestoreForDomainName:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 backupUDID:(id)a6 range:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v10;
  id v14;
  id v15;
  const __CFString *v16;
  id v17;
  MBFileID *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  length = a7.length;
  location = a7.location;
  v10 = a5;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v15 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v15, "appendString:", CFSTR("select RestoreFiles.fileID, RestoreFiles.snapshotID, RestoreFiles.priority from RestoreFiles, Files"));
  objc_msgSend(v15, "appendFormat:", CFSTR(" where Files.backupUDID = '%@'"), a6);
  objc_msgSend(v15, "appendString:", CFSTR(" and Files.snapshotID = RestoreFiles.snapshotID"));
  objc_msgSend(v15, "appendString:", CFSTR(" and Files.fileID = RestoreFiles.fileID"));
  if (a3)
    objc_msgSend(v15, "appendFormat:", CFSTR(" and Files.domainName = '%@'"), a3);
  if (a4 && objc_msgSend(a4, "length"))
    objc_msgSend(v15, "appendFormat:", CFSTR(" and Files.relativePath like '%@%%'"), a4);
  if (v10)
    v16 = CFSTR(" and RestoreFiles.state = 0");
  else
    v16 = CFSTR(" and RestoreFiles.state != 2 and RestoreFiles.state != 3");
  objc_msgSend(v15, "appendString:", v16);
  objc_msgSend(v15, "appendString:", CFSTR(" order by RestoreFiles.priority desc, Files.lastModified desc limit ? offset ?"));
  v17 = -[MBServiceCache _prepare:](self, "_prepare:", v15);
  objc_msgSend(v17, "bindInt64:atIndex:", length, 1);
  objc_msgSend(v17, "bindInt64:atIndex:", location, 2);
  if (objc_msgSend(v17, "step"))
  {
    do
    {
      v18 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(v17, "textColumn:", 0));
      v19 = (int)objc_msgSend(v17, "intColumn:", 1);
      v20 = (int)objc_msgSend(v17, "intColumn:", 2);
      v21 = -[MBServiceCache fileForID:snapshotID:backupUDID:](self, "fileForID:snapshotID:backupUDID:", v18, v19, a6);
      objc_msgSend(v21, "setPriority:", v20);
      objc_msgSend(v14, "addObject:", v21);
    }
    while ((objc_msgSend(v17, "step") & 1) != 0);
  }
  objc_msgSend(v17, "reset");
  return v14;
}

- (id)pathsToRestoreForDomain:(id)a3 absolutePath:(id)a4 pendingOnly:(BOOL)a5 backupUDID:(id)a6 range:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v10;
  id v14;
  id v15;
  const __CFString *v16;
  id v17;

  length = a7.length;
  location = a7.location;
  v10 = a5;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v15 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v15, "appendString:", CFSTR("select distinct(Restores.value) from Restores, RestoreFiles, Files"));
  objc_msgSend(v15, "appendFormat:", CFSTR(" where Files.backupUDID = '%@'"), a6);
  objc_msgSend(v15, "appendString:", CFSTR(" and Restores.restoreID = RestoreFiles.restoreID"));
  objc_msgSend(v15, "appendString:", CFSTR(" and Files.snapshotID = RestoreFiles.snapshotID"));
  objc_msgSend(v15, "appendString:", CFSTR(" and Files.fileID = RestoreFiles.fileID"));
  if (a3)
    objc_msgSend(v15, "appendFormat:", CFSTR(" and Files.domainName = '%@'"), a3);
  if (a4 && objc_msgSend(a4, "length"))
    objc_msgSend(v15, "appendFormat:", CFSTR(" and Restores.value like '%@%%'"), a4);
  if (v10)
    v16 = CFSTR(" and RestoreFiles.state = 0");
  else
    v16 = CFSTR(" and RestoreFiles.state != 2 and RestoreFiles.state != 3");
  objc_msgSend(v15, "appendString:", v16);
  objc_msgSend(v15, "appendString:", CFSTR(" order by Restores.value asc limit ? offset ?"));
  v17 = -[MBServiceCache _prepare:](self, "_prepare:", v15);
  objc_msgSend(v17, "bindInt64:atIndex:", length, 1);
  objc_msgSend(v17, "bindInt64:atIndex:", location, 2);
  if (objc_msgSend(v17, "step"))
  {
    do
      objc_msgSend(v14, "addObject:", objc_msgSend(v17, "textColumn:", 0));
    while ((objc_msgSend(v17, "step") & 1) != 0);
  }
  objc_msgSend(v17, "reset");
  return v14;
}

- (BOOL)restoreFileExistsWithDomainName:(id)a3 relativePath:(id)a4 backupUDID:(id)a5
{
  id v10;
  BOOL v11;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_9:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2397, CFSTR("Null relative path"));
    if (a5)
      goto LABEL_4;
    goto LABEL_10;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2396, CFSTR("Null domain name"));
  if (!a4)
    goto LABEL_9;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_10:
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2398, CFSTR("Null backup UDID"));
LABEL_4:
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*) from Files cross join RestoreFiles where Files.backupUDID = ? and Files.snapshotID = RestoreFiles.snapshotID and Files.fileID = RestoreFiles.fileID and Files.domainName = ? and Files.relativePath = ? and RestoreFiles.state != 2 and RestoreFiles.state != 3"));
  objc_msgSend(v10, "bindText:atIndex:", a5, 1);
  objc_msgSend(v10, "bindText:atIndex:", a3, 2);
  objc_msgSend(v10, "bindText:atIndex:", a4, 3);
  if (objc_msgSend(v10, "step"))
    v11 = objc_msgSend(v10, "intColumn:", 0) != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "reset");
  return v11;
}

- (BOOL)restoreFilesExistForDomainName:(id)a3 backupUDID:(id)a4 size:(unint64_t *)a5
{
  id v10;
  BOOL v11;

  if (!a3)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2421, CFSTR("Null domain name"));
    if (a4)
      goto LABEL_3;
LABEL_10:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBServiceCache.m"), 2422, CFSTR("Null backup UDID"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_10;
LABEL_3:
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select count(*), sum(Files.size) from Files cross join RestoreFiles where Files.backupUDID = ? and Files.snapshotID = RestoreFiles.snapshotID and Files.fileID = RestoreFiles.fileID and Files.domainName = ? and RestoreFiles.state != 2 and RestoreFiles.state != 3"));
  objc_msgSend(v10, "bindText:atIndex:", a4, 1);
  objc_msgSend(v10, "bindText:atIndex:", a3, 2);
  if (objc_msgSend(v10, "step") && objc_msgSend(v10, "intColumn:", 0))
  {
    v11 = 1;
    if (a5)
      *a5 = (unint64_t)objc_msgSend(v10, "int64Column:", 1);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v10, "reset");
  return v11;
}

- (id)protectionClassesToRestoreByPathWithOffset:(unint64_t)a3 limit:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;

  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select domainName, relativePath, protectionClass from FileProtectionClassesToRestore limit ? offset ?"));
  objc_msgSend(v8, "bindInteger:atIndex:", a4, 1);
  objc_msgSend(v8, "bindInteger:atIndex:", a3, 2);
  if (objc_msgSend(v8, "step"))
  {
    do
    {
      v9 = objc_msgSend(v8, "textColumn:", 0);
      v10 = objc_msgSend(v8, "textColumn:", 1);
      v11 = objc_msgSend(v8, "intColumn:", 2);
      v12 = -[MBDomainManager domainForName:](self->_domainManager, "domainForName:", v9);
      if (v12)
      {
        v14 = v12;
        v15 = objc_msgSend(v12, "isUninstalledAppDomain");
        if ((v15 & 1) != 0)
        {
          v17 = MBGetDefaultLog(v15, v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v21 = v14;
            v22 = 2112;
            v23 = v10;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "App uninstalled for protection class to restore: %@:%@", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "App uninstalled for protection class to restore: %@:%@", v14, v10);
          }
        }
        else
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v11), objc_msgSend(objc_msgSend(v14, "rootPath"), "stringByAppendingPathComponent:", v10));
        }
      }
      else
      {
        v18 = MBGetDefaultLog(0, v13);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = 0;
          v22 = 2112;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Domain not found for protection class to restore: %@:%@", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), "Domain not found for protection class to restore: %@:%@", 0, v10);
        }
      }
    }
    while ((objc_msgSend(v8, "step") & 1) != 0);
  }
  objc_msgSend(v8, "reset");
  return v7;
}

- (void)setProtectionClass:(unsigned __int8)a3 toRestoreForDomainName:(id)a4 relativePath:(id)a5
{
  uint64_t v7;
  id v8;

  v7 = a3;
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into FileProtectionClassesToRestore values (?,?,?)"));
  objc_msgSend(v8, "bindText:atIndex:", a4, 1);
  objc_msgSend(v8, "bindText:atIndex:", a5, 2);
  objc_msgSend(v8, "bindInt:atIndex:", v7, 3);
  objc_msgSend(v8, "step");
  objc_msgSend(v8, "reset");
}

- (void)removeAllProtectionClassesToRestore
{
  id v2;

  v2 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from FileProtectionClassesToRestore"));
  objc_msgSend(v2, "step");
  objc_msgSend(v2, "reset");
}

- (void)addRestoreFailure:(id)a3
{
  id v4;

  v4 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into RestoreFailures values (?,?,?,?,?,?)"));
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "identifier"), 1);
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "dataclass"), 2);
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "assetType"), 3);
  objc_msgSend(v4, "bindText:atIndex:", objc_msgSend(a3, "displayName"), 4);
  objc_msgSend(v4, "bindBlob:atIndex:", objc_msgSend(a3, "icon"), 5);
  if (objc_msgSend(a3, "error"))
    objc_msgSend(v4, "bindBlob:atIndex:", +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(a3, "error"), 1, 0), 6);
  objc_msgSend(v4, "step");
  objc_msgSend(v4, "reset");
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v6 = CFSTR("and dataclass = ?");
  v7 = &stru_1000DBB88;
  if (!a3)
    v6 = &stru_1000DBB88;
  if (a4)
    v7 = CFSTR("and assetType = ?");
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("select count(*) from RestoreFailures where 1 %@ %@"), v6, v7));
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "bindText:atIndex:", a3, 1);
    v10 = 2;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v10 = 1;
  if (a4)
LABEL_7:
    objc_msgSend(v9, "bindText:atIndex:", a4, v10);
LABEL_8:
  if (objc_msgSend(v9, "step"))
    v11 = (int)objc_msgSend(v9, "intColumn:", 0);
  else
    v11 = 0;
  objc_msgSend(v9, "reset");
  return v11;
}

- (id)restoreFailuresForDataClass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;

  length = a5.length;
  location = a5.location;
  v10 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = CFSTR("and dataclass = ?");
  v12 = &stru_1000DBB88;
  if (!a3)
    v11 = &stru_1000DBB88;
  if (a4)
    v12 = CFSTR("and assetType = ?");
  v13 = -[MBServiceCache _prepare:](self, "_prepare:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("select identifier, dataclass, assetType, displayName, icon, error from RestoreFailures where 1 %@ %@ order by dataclass, identifier limit ? offset ?"), v11, v12));
  v14 = v13;
  if (a3)
  {
    objc_msgSend(v13, "bindText:atIndex:", a3, 1);
    v15 = 2;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v15 = 1;
  if (a4)
  {
LABEL_7:
    v16 = v15 + 1;
    objc_msgSend(v14, "bindText:atIndex:", a4);
    v15 = v16;
  }
LABEL_8:
  v17 = (v15 + 1);
  objc_msgSend(v14, "bindInteger:atIndex:", length);
  objc_msgSend(v14, "bindInteger:atIndex:", location, v17);
  if (objc_msgSend(v14, "step"))
  {
    do
    {
      v18 = objc_alloc_init((Class)MBRestoreFailure);
      objc_msgSend(v18, "setIdentifier:", objc_msgSend(v14, "textColumn:", 0));
      objc_msgSend(v18, "setDataclass:", objc_msgSend(v14, "textColumn:", 1));
      objc_msgSend(v18, "setAssetType:", objc_msgSend(v14, "textColumn:", 2));
      objc_msgSend(v18, "setDisplayName:", objc_msgSend(v14, "textColumn:", 3));
      objc_msgSend(v18, "setIcon:", objc_msgSend(v14, "blobColumn:", 4));
      v19 = objc_msgSend(v14, "blobColumn:", 5);
      if (v19)
        objc_msgSend(v18, "setError:", +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSError), v19, 0));
      objc_msgSend(v10, "addObject:", v18);

    }
    while ((objc_msgSend(v14, "step") & 1) != 0);
  }
  objc_msgSend(v14, "reset");
  return v10;
}

- (id)relativePathsOfPlaceholderResourcesWithBundleID:(id)a3 lastModified:(int64_t)a4
{
  id v7;
  id v8;

  v7 = +[NSMutableSet set](NSMutableSet, "set");
  -[MBServiceCache begin](self, "begin");
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select relativePath from PlaceholderResources where bundleID = ? and lastModified = ?"));
  objc_msgSend(v8, "bindText:atIndex:", a3, 1);
  objc_msgSend(v8, "bindInt64:atIndex:", a4, 2);
  if (objc_msgSend(v8, "step"))
  {
    do
      objc_msgSend(v7, "addObject:", objc_msgSend(v8, "textColumn:", 0));
    while ((objc_msgSend(v8, "step") & 1) != 0);
  }
  objc_msgSend(v8, "reset");
  -[MBServiceCache end](self, "end");
  return v7;
}

- (void)setPlaceholderResourceRelativePaths:(id)a3 lastModified:(int64_t)a4 forBundleID:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  -[MBServiceCache begin](self, "begin");
  v9 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from PlaceholderResources where bundleID = ?"));
  objc_msgSend(v9, "bindText:atIndex:", a5, 1);
  objc_msgSend(v9, "step");
  objc_msgSend(v9, "reset");
  v10 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert or replace into PlaceholderResources values (?,?,?)"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(a3);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14);
        objc_msgSend(v10, "bindText:atIndex:", a5, 1);
        objc_msgSend(v10, "bindText:atIndex:", v15, 2);
        objc_msgSend(v10, "bindInt64:atIndex:", a4, 3);
        objc_msgSend(v10, "step");
        objc_msgSend(v10, "reset");
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }
  -[MBServiceCache end](self, "end");
}

- (void)setKeyBagInfo:(id)a3 forBackupUDID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("delete from KeyBagInfo where backupUDID = ?"));
  objc_msgSend(v7, "bindText:atIndex:", a4, 1);
  objc_msgSend(v7, "step");
  objc_msgSend(v7, "reset");
  v8 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert into KeyBagInfo values (?,?,?)"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12);
        objc_msgSend(v8, "bindText:atIndex:", a4, 1);
        objc_msgSend(v8, "bindInt:atIndex:", objc_msgSend(v13, "bagID"), 2);
        objc_msgSend(v8, "bindBlob:atIndex:", +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v13, "uuid"), 16, 0), 3);
        objc_msgSend(v8, "step");
        objc_msgSend(v8, "reset");
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
}

- (void)addKeyBagInfo:(id)a3 forBackupUDID:(id)a4
{
  id v6;

  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("insert into KeyBagInfo values (?,?,?)"));
  objc_msgSend(v6, "bindText:atIndex:", a4, 1);
  objc_msgSend(v6, "bindInt:atIndex:", objc_msgSend(a3, "bagID"), 2);
  objc_msgSend(v6, "bindBlob:atIndex:", +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(a3, "uuid"), 16, 0), 3);
  objc_msgSend(v6, "step");
  objc_msgSend(v6, "reset");
}

- (id)keyBagInfoForBackupUDID:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = +[NSMutableSet set](NSMutableSet, "set");
  v6 = -[MBServiceCache _prepare:](self, "_prepare:", CFSTR("select keybagID,keybagUUID from KeyBagInfo where backupUDID = ?"));
  objc_msgSend(v6, "bindText:atIndex:", a3, 1);
  if (objc_msgSend(v6, "step"))
  {
    while (1)
    {
      v7 = objc_msgSend(v6, "blobColumn:", 1);
      if ((unint64_t)objc_msgSend(v7, "length") <= 0xF)
        break;
      objc_msgSend(v5, "addObject:", +[MBKeyBagInfo infoWithID:uuid:](MBKeyBagInfo, "infoWithID:uuid:", objc_msgSend(v6, "intColumn:", 0), objc_msgSend(v7, "bytes")));
      if ((objc_msgSend(v6, "step") & 1) == 0)
        goto LABEL_4;
    }
    objc_msgSend(v6, "reset");
    return 0;
  }
  else
  {
LABEL_4:
    objc_msgSend(v6, "reset");
    if (objc_msgSend(v5, "count"))
      return v5;
    else
      return 0;
  }
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (void)setDomainManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
