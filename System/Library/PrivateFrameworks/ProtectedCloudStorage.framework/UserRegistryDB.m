@implementation UserRegistryDB

- (id)getData:(id)a3 type:(int)a4
{
  id v6;
  UserRegistryDB *v7;
  sqlite3_stmt *recordIDStatment;
  id v9;
  const void *v10;
  int v11;
  void *v12;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  recordIDStatment = v7->_recordIDStatment;
  v9 = objc_retainAutorelease(v6);
  if (sqlite3_bind_text(recordIDStatment, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, 0)
    || sqlite3_bind_int(v7->_recordIDStatment, 2, a4)
    || sqlite3_step(v7->_recordIDStatment) != 100)
  {
    v12 = 0;
  }
  else
  {
    v10 = sqlite3_column_blob(v7->_recordIDStatment, 0);
    v11 = sqlite3_column_bytes(v7->_recordIDStatment, 0);
    v12 = 0;
    if (v10 && v11 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  sqlite3_reset(v7->_recordIDStatment);
  objc_sync_exit(v7);

  return v12;
}

- (id)getConfigData:(id)a3
{
  return -[UserRegistryDB getData:type:](self, "getData:type:", a3, 0);
}

- (UserRegistryDB)initWithDSID:(id)a3
{
  id v4;
  UserRegistryDB *v5;
  os_log_t v6;
  UserRegistryDB *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UserRegistryDB;
  v5 = -[UserRegistryDB init](&v9, sel_init);
  if (v5
    && (v6 = os_log_create("com.apple.ProtectedCloudStorage", "UserDB"),
        -[UserRegistryDB setOslog:](v5, "setOslog:", v6),
        v6,
        -[UserRegistryDB setDsid:](v5, "setDsid:", v4),
        -[UserRegistryDB setupDatabase](v5, "setupDatabase")))
  {
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  _os_assert_log();
  _os_crash();
  __break(1u);
  CCDeriveKey();
}

- (BOOL)prepare:(const char *)a3 statement:(sqlite3_stmt *)a4
{
  int v6;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = sqlite3_prepare_v2(self->_sqliteHandle, a3, -1, a4, 0);
  if (v6)
  {
    -[UserRegistryDB oslog](self, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = v6;
      v10 = 2080;
      v11 = a3;
      _os_log_impl(&dword_1A9508000, v8, OS_LOG_TYPE_DEFAULT, "failed to prepare (%d): %s", (uint8_t *)v9, 0x12u);
    }

  }
  return v6 == 0;
}

- (BOOL)setupDatabase
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  sqlite3 **p_sqliteHandle;
  NSObject *v25;
  const char *v26;
  BOOL v27;
  NSObject *v28;
  id v30;
  id v31;
  char *errmsg;
  uint8_t buf[4];
  const char *v34;
  glob_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/com.apple.ProtectedCloudStorage"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v31);
    v9 = v31;

    if ((v8 & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[UserRegistryDB dsid](self, "dsid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("KeysSyncing{,Version2}-%@-%@*"), v11, kPCSServiceName[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v35, 0, sizeof(v35));
      v14 = objc_retainAutorelease(v13);
      if (!glob((const char *)objc_msgSend(v14, "UTF8String"), 128, 0, &v35))
      {
        v30 = v9;
        -[UserRegistryDB oslog](self, "oslog");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v34) = v35.gl_matchc;
          _os_log_impl(&dword_1A9508000, v15, OS_LOG_TYPE_DEFAULT, "Found %d PCS databases files to delete", buf, 8u);
        }

        if (v35.gl_matchc >= 1)
        {
          v16 = 0;
          do
          {
            v17 = v35.gl_pathv[v16];
            -[UserRegistryDB oslog](self, "oslog");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v34 = v17;
              _os_log_impl(&dword_1A9508000, v18, OS_LOG_TYPE_DEFAULT, "removing: %s", buf, 0xCu);
            }

            removefile(v17, 0, 0);
            ++v16;
          }
          while (v16 < v35.gl_matchc);
        }
        globfree(&v35);
        v9 = v30;
      }

      v19 = (void *)MEMORY[0x1E0CB3940];
      -[UserRegistryDB dsid](self, "dsid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("KeysSyncingVersion3-%@-%@.db"), v20, kPCSServiceName[0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_retainAutorelease(v22);
      p_sqliteHandle = &self->_sqliteHandle;
      if (sqlite3_open_v2((const char *)-[NSObject UTF8String](v23, "UTF8String"), &self->_sqliteHandle, 6, 0))
      {
        -[UserRegistryDB oslog](self, "oslog");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = sqlite3_errmsg(*p_sqliteHandle);
          LODWORD(v35.gl_pathc) = 136315138;
          *(size_t *)((char *)&v35.gl_pathc + 4) = (size_t)v26;
          _os_log_impl(&dword_1A9508000, v25, OS_LOG_TYPE_DEFAULT, "Failed to open userDB database: %s", (uint8_t *)&v35, 0xCu);
        }

      }
      else
      {
        -[UserRegistryDB beginExclusiveTransaction](self, "beginExclusiveTransaction");
        if (sqlite3_exec(self->_sqliteHandle, "CREATE TABLE IF NOT EXISTS PCSKeys(recordID TEXT PRIMARY KEY, type INTEGER NOT NULL, data BLOB, publicKey TEXT);CREATE TABLE IF NOT EXISTS SyncDevices(deviceID TEXT PRIMARY KEY NOT NULL, lastSeen TEXT, firs"
               "tSeen TEXT, version TEXT);CREATE TABLE IF NOT EXISTS MirrorKeys(publicKey TEXT PRIMARY KEY NOT NULL, e"
               "scrow BLOB, dsid TEXT NOT NULL, service INTEGER NOT NULL, current INTEGER NOT NULL, type INTEGER NOT NULL"
               ",publicIdentity BLOB);CREATE TABLE IF NOT EXISTS SyncedKeys(deviceNumber INTEGER NOT NULL, pubkeyNumbe"
               "r INTEGER NOT NULL, current INTEGER DEFAULT 0, PRIMARY KEY (deviceNumber,pubkeyNumber)) ;CREATE TABLE IF"
               " NOT EXISTS EscrowedKeys(publicKey TEXT PRIMARY KEY NOT NULL, escrow BLOB,dsid TEXT NOT NULL);CREATE T"
               "RIGGER IF NOT EXISTS removeSyncedKeys DELETE ON SyncDevices    FOR EACH ROW BEGIN        DELETE FROM Sync"
               "edKeys WHERE OLD.rowid = SyncedKeys.deviceNumber ;    END  ; CREATE TRIGGER IF NOT EXISTS removeMirrorKey"
               "s DELETE ON MirrorKeys    FOR EACH ROW BEGIN        DELETE FROM SyncedKeys WHERE OLD.rowid = SyncedKeys.p"
               "ubkeyNumber ;    END  ; CREATE TABLE IF NOT EXISTS UpdateLimits(updateType TEXT PRIMARY KEY NOT NULL, m"
               "od_date DATETIME DEFAULT CURRENT_TIMESTAMP, counter INTEGER, digest TEXT);",
               0,
               0,
               &errmsg))
        {
          -[UserRegistryDB oslog](self, "oslog");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v35.gl_pathc) = 136315138;
            *(size_t *)((char *)&v35.gl_pathc + 4) = (size_t)errmsg;
            _os_log_impl(&dword_1A9508000, v28, OS_LOG_TYPE_DEFAULT, "Create schema for database: %s", (uint8_t *)&v35, 0xCu);
          }

          sqlite3_free(errmsg);
          -[UserRegistryDB endTransaction:](self, "endTransaction:", 0);
        }
        else
        {
          -[UserRegistryDB endTransaction:](self, "endTransaction:", 1);
          sqlite3_exec(self->_sqliteHandle, "PRAGMA journal_mode=WAL;", 0, 0, 0);
          if (-[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT data FROM PCSKeys WHERE recordID = ? AND type = ?;",
                 &self->_recordIDStatment)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "REPLACE INTO PCSKeys (recordID,type,data,publicKey) VALUES(?,?,?,?);",
                 &self->_replaceStatment)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "DELETE FROM PCSKeys WHERE recordID = ?;",
                 &self->_deleteStatment)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT OR IGNORE INTO SyncDevices (deviceID,firstSeen) VALUES(?,?);",
                 &self->_insertWatch)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE SyncDevices SET lastSeen = ? AND version = ? WHERE deviceID = ?;",
                 &self->_updateWatch)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT INTO MirrorKeys (publicKey,dsid,service,current,type,publicIdentity) VALUES(?,?,?,0,?,?);",
                 &self->_insertMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE MirrorKeys SET current=?,type=? WHERE publicKey = ? AND type = ? AND dsid = ?;",
                 &self->_updateMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE MirrorKeys SET type=? WHERE service = ? AND dsid = ?;",
                 &self->_markMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "DELETE FROM MirrorKeys WHERE service = ?;",
                 &self->_deleteMirrorKeys)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT OR REPLACE INTO EscrowedKeys (publicKey,escrow,dsid) VALUES(?,?,?);",
                 &self->_insertEscrowKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE EscrowedKeys SET escrow=? WHERE publicKey = ? AND dsid = ?;",
                 &self->_updateEscrowKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "DELETE FROM EscrowedKeys WHERE publicKey = ? AND dsid = ?;",
                 &self->_deleteEscrowKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT escrow FROM EscrowedKeys WHERE publicKey = ? AND dsid = ?", &self->_queryEscrowKey)&& -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT publicKey,escrow FROM EscrowedKeys WHERE dsid = ?", &self->_queryEscrowKeysAll)&& -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "INSERT INTO SyncedKeys (deviceNumber,pubkeyNumber) SELECT SyncDevices.rowid,MirrorKeys.rowid FROM SyncDevices,MirrorKeys WHERE (SyncDevices.deviceID = ? AND MirrorKeys.publicKey = ? AND MirrorKeys.type = ? AND MirrorKeys.dsid = ?);",
                 &self->_insertWatchKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "UPDATE MirrorKeys SET current = 0 WHERE service=? AND dsid=?;",
                 &self->_resetCurrentMirrorKey)
            && -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT MirrorKeys.publicKey FROM MirrorKeys WHERE MirrorKeys.dsid = ? AND MirrorKeys.type = ? AND (MirrorKeys.rowid NOT IN   (SELECT SyncedKeys.pubkeyNumber FROM SyncedKeys,SyncDevices WHERE (SyncDevices.deviceID = ? AND SyncedKeys.deviceNumber = SyncDevices.rowid))) ORDER BY MirrorKeys.current != 0", &self->_queryMissingKeys))
          {
            v27 = -[UserRegistryDB prepare:statement:](self, "prepare:statement:", "SELECT deviceID FROM SyncDevices;",
                    &self->_queryWatches);
LABEL_44:

            goto LABEL_45;
          }
        }
      }
    }
    else
    {
      -[UserRegistryDB oslog](self, "oslog");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v35.gl_pathc) = 138412290;
        *(size_t *)((char *)&v35.gl_pathc + 4) = (size_t)v9;
        _os_log_impl(&dword_1A9508000, v23, OS_LOG_TYPE_DEFAULT, "Failed to create ApplicationSupport directory: %@", (uint8_t *)&v35, 0xCu);
      }
    }
    v27 = 0;
    goto LABEL_44;
  }
  -[UserRegistryDB oslog](self, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35.gl_pathc) = 0;
    _os_log_impl(&dword_1A9508000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get ApplicationSupport directory", (uint8_t *)&v35, 2u);
  }
  v27 = 0;
LABEL_45:

  return v27;
}

- (BOOL)deleteRecordAll
{
  UserRegistryDB *v2;
  int v3;
  NSObject *v5;
  char *errmsg;
  uint8_t buf[4];
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  errmsg = 0;
  v3 = sqlite3_exec(v2->_sqliteHandle, "DELETE FROM PCSKeys; DELETE FROM SyncedKeys; DELETE FROM MirrorKeys; DELETE FROM SyncDevices;DELETE FROM UpdateLimits;",
         0,
         0,
         &errmsg);
  if (v3)
  {
    -[UserRegistryDB oslog](v2, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = errmsg;
      _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "Failed deleting all records: %s", buf, 0xCu);
    }

  }
  if (errmsg)
    sqlite3_free(errmsg);
  objc_sync_exit(v2);

  return v3 == 0;
}

- (BOOL)beginExclusiveTransaction
{
  int v2;
  char *errmsg;

  errmsg = 0;
  v2 = sqlite3_exec(self->_sqliteHandle, "BEGIN EXCLUSIVE TRANSACTION;", 0, 0, &errmsg);
  if (errmsg)
    sqlite3_free(errmsg);
  return v2 == 0;
}

- (BOOL)endTransaction:(BOOL)a3
{
  const char *v3;

  if (a3)
    v3 = "COMMIT TRANSACTION;";
  else
    v3 = "ROLLBACK TRANSACTION;";
  sqlite3_exec(self->_sqliteHandle, v3, 0, 0, 0);
  return 1;
}

- (BOOL)replaceRecord:(id)a3 type:(int)a4 data:(id)a5 publicKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  UserRegistryDB *v13;
  sqlite3_stmt *replaceStatment;
  id v15;
  sqlite3_stmt *v16;
  id v17;
  BOOL v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  objc_sync_enter(v13);
  replaceStatment = v13->_replaceStatment;
  v15 = objc_retainAutorelease(v10);
  v18 = !sqlite3_bind_text(replaceStatment, 1, (const char *)objc_msgSend(v15, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)&& !sqlite3_bind_int(v13->_replaceStatment, 2, a4)&& (v16 = v13->_replaceStatment, v17 = objc_retainAutorelease(v11), !sqlite3_bind_blob(v16, 3, (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))&& !sqlite3_bind_text(v13->_replaceStatment, 4, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1,
           (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
     && sqlite3_step(v13->_replaceStatment) == 101;
  sqlite3_reset(v13->_replaceStatment);
  objc_sync_exit(v13);

  return v18;
}

- (BOOL)replaceConfigRecord:(id)a3 data:(id)a4
{
  return -[UserRegistryDB replaceRecord:type:data:publicKey:](self, "replaceRecord:type:data:publicKey:", a3, 0, a4, &stru_1E55403F8);
}

- (id)getRecordIDData:(id)a3
{
  return -[UserRegistryDB getData:type:](self, "getData:type:", a3, 1);
}

- (BOOL)replaceRecordID:(id)a3 data:(id)a4 publicKey:(id)a5
{
  return -[UserRegistryDB replaceRecord:type:data:publicKey:](self, "replaceRecord:type:data:publicKey:", a3, 1, a4, a5);
}

- (BOOL)deleteRecordID:(id)a3
{
  id v4;
  UserRegistryDB *v5;
  sqlite3_stmt *deleteStatment;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  deleteStatment = v5->_deleteStatment;
  v7 = objc_retainAutorelease(v4);
  if (sqlite3_bind_text(deleteStatment, 1, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0))
    v8 = 0;
  else
    v8 = sqlite3_step(v5->_deleteStatment) == 101;
  sqlite3_reset(v5->_deleteStatment);
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)setMirrorKey:(id)a3 service:(int)a4 type:(int)a5 publicIdentity:(id)a6
{
  id v10;
  id v11;
  UserRegistryDB *v12;
  sqlite3_stmt *insertMirrorKey;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  BOOL v17;

  v10 = a3;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  insertMirrorKey = v12->_insertMirrorKey;
  v14 = objc_retainAutorelease(v10);
  v17 = !sqlite3_bind_text(insertMirrorKey, 1, (const char *)objc_msgSend(v14, "UTF8String"), -1, 0)
     && !sqlite3_bind_text(v12->_insertMirrorKey, 2, -[NSString UTF8String](v12->_dsid, "UTF8String"), -1, 0)
     && !sqlite3_bind_int(v12->_insertMirrorKey, 3, a4)
     && !sqlite3_bind_int(v12->_insertMirrorKey, 4, a5)
     && (v15 = v12->_insertMirrorKey,
         v16 = objc_retainAutorelease(v11),
         !sqlite3_bind_blob(v15, 5, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), 0))
     && sqlite3_step(v12->_insertMirrorKey) == 101;
  sqlite3_reset(v12->_insertMirrorKey);
  objc_sync_exit(v12);

  return v17;
}

- (BOOL)markMirrorKey:(int)a3 type:(int)a4
{
  UserRegistryDB *v6;
  BOOL v7;

  v6 = self;
  objc_sync_enter(v6);
  if (sqlite3_bind_int(v6->_markMirrorKey, 1, a4)
    || sqlite3_bind_int(v6->_markMirrorKey, 2, a3)
    || sqlite3_bind_text(v6->_markMirrorKey, 3, -[NSString UTF8String](v6->_dsid, "UTF8String"), -1, 0))
  {
    v7 = 0;
  }
  else
  {
    while (sqlite3_step(v6->_markMirrorKey) == 100)
      ;
    v7 = 1;
  }
  sqlite3_reset(v6->_markMirrorKey);
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)updateMirrorKey:(id)a3 service:(int)a4 type:(int)a5 newType:(int)a6 current:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  UserRegistryDB *v13;
  BOOL v14;

  v7 = a7;
  v12 = a3;
  v13 = self;
  objc_sync_enter(v13);
  if (v7)
  {
    if (sqlite3_bind_int(v13->_resetCurrentMirrorKey, 1, a4)
      || sqlite3_bind_text(v13->_resetCurrentMirrorKey, 2, -[NSString UTF8String](v13->_dsid, "UTF8String"), -1, 0))
    {
      goto LABEL_12;
    }
    while (sqlite3_step(v13->_resetCurrentMirrorKey) == 100)
      ;
  }
  if (sqlite3_bind_int(v13->_updateMirrorKey, 1, v7)
    || sqlite3_bind_int(v13->_updateMirrorKey, 2, a6)
    || sqlite3_bind_text(v13->_updateMirrorKey, 3, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1, 0)|| sqlite3_bind_int(v13->_updateMirrorKey, 4, a5)|| sqlite3_bind_text(v13->_updateMirrorKey, 5, -[NSString UTF8String](v13->_dsid, "UTF8String"), -1, 0))
  {
LABEL_12:
    v14 = 0;
    goto LABEL_11;
  }
  v14 = sqlite3_step(v13->_updateMirrorKey) == 101;
LABEL_11:
  sqlite3_reset(v13->_resetCurrentMirrorKey);
  sqlite3_reset(v13->_updateMirrorKey);
  objc_sync_exit(v13);

  return v14;
}

- (BOOL)deleteMirrorKeys:(int)a3
{
  UserRegistryDB *v4;
  BOOL v5;

  v4 = self;
  objc_sync_enter(v4);
  if (sqlite3_bind_int(v4->_deleteMirrorKeys, 1, a3))
    v5 = 0;
  else
    v5 = sqlite3_step(v4->_deleteMirrorKeys) == 101;
  sqlite3_reset(v4->_deleteMirrorKeys);
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)setEscrowKey:(id)a3 escrowBlob:(id)a4
{
  id v6;
  id v7;
  UserRegistryDB *v8;
  sqlite3_stmt *insertEscrowKey;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  insertEscrowKey = v8->_insertEscrowKey;
  v10 = objc_retainAutorelease(v6);
  if (sqlite3_bind_text(insertEscrowKey, 1, (const char *)objc_msgSend(v10, "UTF8String"), -1, 0)
    || (v11 = v8->_insertEscrowKey,
        v12 = objc_retainAutorelease(v7),
        sqlite3_bind_blob(v11, 2, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 0))
    || sqlite3_bind_text(v8->_insertEscrowKey, 3, -[NSString UTF8String](v8->_dsid, "UTF8String"), -1, 0))
  {
    v13 = -1;
  }
  else
  {
    v13 = sqlite3_step(v8->_insertEscrowKey);
    if (v13 == 101)
    {
      v14 = 1;
      goto LABEL_10;
    }
  }
  -[UserRegistryDB oslog](v8, "oslog");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v13;
    _os_log_impl(&dword_1A9508000, v15, OS_LOG_TYPE_DEFAULT, "failed to set escrow key (%d)", (uint8_t *)v17, 8u);
  }

  v14 = 0;
LABEL_10:
  sqlite3_reset(v8->_insertEscrowKey);
  objc_sync_exit(v8);

  return v14;
}

- (BOOL)updateEscrowKey:(id)a3 escrowBlob:(id)a4
{
  id v6;
  id v7;
  UserRegistryDB *v8;
  sqlite3_stmt *updateEscrowKey;
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  updateEscrowKey = v8->_updateEscrowKey;
  v10 = objc_retainAutorelease(v7);
  v11 = !sqlite3_bind_blob(updateEscrowKey, 1, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0)&& !sqlite3_bind_text(v8->_updateEscrowKey, 2, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0)&& !sqlite3_bind_text(v8->_updateEscrowKey, 3, -[NSString UTF8String](v8->_dsid, "UTF8String"), -1, 0)&& sqlite3_step(v8->_updateEscrowKey) == 101;
  sqlite3_reset(v8->_updateEscrowKey);
  objc_sync_exit(v8);

  return v11;
}

- (BOOL)deleteEscrowKey:(id)a3
{
  id v4;
  UserRegistryDB *v5;
  sqlite3_stmt *deleteEscrowKey;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  deleteEscrowKey = v5->_deleteEscrowKey;
  v7 = objc_retainAutorelease(v4);
  v8 = !sqlite3_bind_text(deleteEscrowKey, 1, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0)
    && !sqlite3_bind_text(v5->_deleteEscrowKey, 2, -[NSString UTF8String](v5->_dsid, "UTF8String"), -1, 0)
    && sqlite3_step(v5->_deleteEscrowKey) == 101;
  sqlite3_reset(v5->_deleteEscrowKey);
  objc_sync_exit(v5);

  return v8;
}

- (id)queryEscrowKey:(id)a3
{
  id v4;
  UserRegistryDB *v5;
  sqlite3_stmt *queryEscrowKey;
  id v7;
  const void *v8;
  unsigned int v9;
  void *v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  queryEscrowKey = v5->_queryEscrowKey;
  v7 = objc_retainAutorelease(v4);
  if (sqlite3_bind_text(queryEscrowKey, 1, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0)
    || sqlite3_bind_text(v5->_queryEscrowKey, 2, -[NSString UTF8String](v5->_dsid, "UTF8String"), -1, 0)
    || sqlite3_step(v5->_queryEscrowKey) != 100)
  {
    v10 = 0;
  }
  else
  {
    v8 = sqlite3_column_blob(v5->_queryEscrowKey, 0);
    v9 = sqlite3_column_bytes(v5->_queryEscrowKey, 0);
    if (!v8 || (v9 & 0x80000000) != 0)
    {
      sqlite3_reset(v5->_queryEscrowKey);
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sqlite3_reset(v5->_queryEscrowKey);
LABEL_9:
  objc_sync_exit(v5);

  return v10;
}

- (id)queryEscrowKeys
{
  id v3;
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  const void *v6;
  int v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!sqlite3_bind_text(self->_queryEscrowKeysAll, 1, -[NSString UTF8String](self->_dsid, "UTF8String"), -1, 0)
    && sqlite3_step(self->_queryEscrowKeysAll) == 100)
  {
    do
    {
      v4 = sqlite3_column_text(self->_queryEscrowKeysAll, 0);
      if (v4)
      {
        v5 = v4;
        v6 = sqlite3_column_blob(self->_queryEscrowKeysAll, 1);
        v7 = sqlite3_column_bytes(self->_queryEscrowKeysAll, 1);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v6, v7);
        objc_msgSend(v3, "setValue:forKey:", v9, v8);

      }
    }
    while (sqlite3_step(self->_queryEscrowKeysAll) == 100);
  }
  sqlite3_reset(self->_queryEscrowKeysAll);
  return v3;
}

- (BOOL)updateSyncDevice:(id)a3 seen:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  UserRegistryDB *v11;
  sqlite3_stmt *insertWatch;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  insertWatch = v11->_insertWatch;
  v13 = objc_retainAutorelease(v8);
  v16 = !sqlite3_bind_text(insertWatch, 1, (const char *)objc_msgSend(v13, "UTF8String"), -1, 0)
     && (v14 = v11->_insertWatch,
         v15 = objc_retainAutorelease(v9),
         !sqlite3_bind_text(v14, 2, (const char *)objc_msgSend(v15, "UTF8String"), -1, 0))
     && (sqlite3_step(v11->_insertWatch),
         !sqlite3_bind_text(v11->_updateWatch, 1, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), -1, 0))&& !sqlite3_bind_text(v11->_updateWatch, 2, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), -1, 0)&& !sqlite3_bind_text(v11->_updateWatch, 3, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, 0)&& sqlite3_step(v11->_updateWatch) == 101;
  sqlite3_reset(v11->_insertWatch);
  sqlite3_reset(v11->_updateWatch);
  objc_sync_exit(v11);

  return v16;
}

- (BOOL)syncedKeyToDevice:(id)a3 type:(int)a4 device:(id)a5
{
  id v8;
  id v9;
  UserRegistryDB *v10;
  sqlite3_stmt *insertWatchKey;
  id v12;
  BOOL v13;

  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  insertWatchKey = v10->_insertWatchKey;
  v12 = objc_retainAutorelease(v9);
  v13 = !sqlite3_bind_text(insertWatchKey, 1, (const char *)objc_msgSend(v12, "UTF8String"), -1, 0)
     && !sqlite3_bind_text(v10->_insertWatchKey, 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0)&& !sqlite3_bind_int(v10->_insertWatchKey, 3, a4)&& !sqlite3_bind_text(v10->_insertWatchKey, 4, -[NSString UTF8String](v10->_dsid, "UTF8String"), -1, 0)&& sqlite3_step(v10->_insertWatchKey) == 101;
  sqlite3_reset(v10->_insertWatchKey);
  objc_sync_exit(v10);

  return v13;
}

- (id)syncDevices
{
  UserRegistryDB *v2;
  void *v3;
  int v4;
  sqlite3_stmt *queryWatches;
  const unsigned __int8 *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v4 = sqlite3_step(v2->_queryWatches);
    queryWatches = v2->_queryWatches;
    if (v4 != 100)
      break;
    v6 = sqlite3_column_text(queryWatches, 0);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
  }
  sqlite3_reset(queryWatches);
  objc_sync_exit(v2);

  return v3;
}

- (id)missingKeysFromDevice:(id)a3 type:(int)a4
{
  id v6;
  UserRegistryDB *v7;
  void *v8;
  const unsigned __int8 *v9;
  void *v10;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sqlite3_bind_text(v7->_queryMissingKeys, 1, -[NSString UTF8String](v7->_dsid, "UTF8String"), -1, 0)
    && !sqlite3_bind_int(v7->_queryMissingKeys, 2, a4)
    && !sqlite3_bind_text(v7->_queryMissingKeys, 3, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0))
  {
    while (sqlite3_step(v7->_queryMissingKeys) == 100)
    {
      v9 = sqlite3_column_text(v7->_queryMissingKeys, 0);
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

      }
    }
  }
  sqlite3_reset(v7->_queryMissingKeys);
  objc_sync_exit(v7);

  return v8;
}

- (sqlite3)sqliteHandle
{
  return self->_sqliteHandle;
}

- (void)setSqliteHandle:(sqlite3 *)a3
{
  self->_sqliteHandle = a3;
}

- (sqlite3_stmt)recordIDStatment
{
  return self->_recordIDStatment;
}

- (void)setRecordIDStatment:(sqlite3_stmt *)a3
{
  self->_recordIDStatment = a3;
}

- (sqlite3_stmt)replaceStatment
{
  return self->_replaceStatment;
}

- (void)setReplaceStatment:(sqlite3_stmt *)a3
{
  self->_replaceStatment = a3;
}

- (sqlite3_stmt)deleteStatment
{
  return self->_deleteStatment;
}

- (void)setDeleteStatment:(sqlite3_stmt *)a3
{
  self->_deleteStatment = a3;
}

- (sqlite3_stmt)insertWatch
{
  return self->_insertWatch;
}

- (void)setInsertWatch:(sqlite3_stmt *)a3
{
  self->_insertWatch = a3;
}

- (sqlite3_stmt)updateWatch
{
  return self->_updateWatch;
}

- (void)setUpdateWatch:(sqlite3_stmt *)a3
{
  self->_updateWatch = a3;
}

- (sqlite3_stmt)insertMirrorKey
{
  return self->_insertMirrorKey;
}

- (void)setInsertMirrorKey:(sqlite3_stmt *)a3
{
  self->_insertMirrorKey = a3;
}

- (sqlite3_stmt)updateMirrorKey
{
  return self->_updateMirrorKey;
}

- (void)setUpdateMirrorKey:(sqlite3_stmt *)a3
{
  self->_updateMirrorKey = a3;
}

- (sqlite3_stmt)markMirrorKey
{
  return self->_markMirrorKey;
}

- (void)setMarkMirrorKey:(sqlite3_stmt *)a3
{
  self->_markMirrorKey = a3;
}

- (sqlite3_stmt)deleteMirrorKeys
{
  return self->_deleteMirrorKeys;
}

- (void)setDeleteMirrorKeys:(sqlite3_stmt *)a3
{
  self->_deleteMirrorKeys = a3;
}

- (sqlite3_stmt)resetCurrentMirrorKey
{
  return self->_resetCurrentMirrorKey;
}

- (void)setResetCurrentMirrorKey:(sqlite3_stmt *)a3
{
  self->_resetCurrentMirrorKey = a3;
}

- (sqlite3_stmt)insertEscrowKey
{
  return self->_insertEscrowKey;
}

- (void)setInsertEscrowKey:(sqlite3_stmt *)a3
{
  self->_insertEscrowKey = a3;
}

- (sqlite3_stmt)updateEscrowKey
{
  return self->_updateEscrowKey;
}

- (void)setUpdateEscrowKey:(sqlite3_stmt *)a3
{
  self->_updateEscrowKey = a3;
}

- (sqlite3_stmt)deleteEscrowKey
{
  return self->_deleteEscrowKey;
}

- (void)setDeleteEscrowKey:(sqlite3_stmt *)a3
{
  self->_deleteEscrowKey = a3;
}

- (sqlite3_stmt)queryEscrowKey
{
  return self->_queryEscrowKey;
}

- (void)setQueryEscrowKey:(sqlite3_stmt *)a3
{
  self->_queryEscrowKey = a3;
}

- (sqlite3_stmt)queryEscrowKeysAll
{
  return self->_queryEscrowKeysAll;
}

- (void)setQueryEscrowKeysAll:(sqlite3_stmt *)a3
{
  self->_queryEscrowKeysAll = a3;
}

- (sqlite3_stmt)insertWatchKey
{
  return self->_insertWatchKey;
}

- (void)setInsertWatchKey:(sqlite3_stmt *)a3
{
  self->_insertWatchKey = a3;
}

- (sqlite3_stmt)queryMissingKeys
{
  return self->_queryMissingKeys;
}

- (void)setQueryMissingKeys:(sqlite3_stmt *)a3
{
  self->_queryMissingKeys = a3;
}

- (sqlite3_stmt)queryWatches
{
  return self->_queryWatches;
}

- (void)setQueryWatches:(sqlite3_stmt *)a3
{
  self->_queryWatches = a3;
}

- (OS_os_log)oslog
{
  return (OS_os_log *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOslog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
}

@end
