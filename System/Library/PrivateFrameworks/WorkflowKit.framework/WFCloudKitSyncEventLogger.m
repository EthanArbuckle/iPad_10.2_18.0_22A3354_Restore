@implementation WFCloudKitSyncEventLogger

- (id)_initWithFilename:(const char *)a3 flags:(int)a4 postNotifications:(BOOL)a5
{
  WFCloudKitSyncEventLogger *v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  BOOL v13;
  sqlite3 *db;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  WFCloudKitSyncEventLogger *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)WFCloudKitSyncEventLogger;
  v8 = -[WFCloudKitSyncEventLogger init](&v21, sel_init);
  if (v8)
  {
    v9 = sqlite3_open_v2(a3, &v8->_db, a4, 0);
    if (v9)
    {
      v10 = v9;
      getWFCloudKitSyncLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = sqlite3_errstr(v10);
        *(_DWORD *)buf = 136315394;
        v23 = "-[WFCloudKitSyncEventLogger _initWithFilename:flags:postNotifications:]";
        v24 = 2080;
        v25 = v12;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to set up sync logger: %s", buf, 0x16u);
      }

    }
    else
    {
      v13 = -[WFCloudKitSyncEventLogger _applySchemaIfNecessary](v8, "_applySchemaIfNecessary");
      db = v8->_db;
      if (v13)
      {
        v15 = sqlite3_prepare_v2(db, "INSERT INTO events (type, timestamp, event) VALUES (?,?,?)", -1, &v8->_log_event, 0);
        if (!v15)
        {
          v8->_postNotifications = a5;
          -[WFCloudKitSyncEventLogger clearOldLogs](v8, "clearOldLogs");
          v19 = v8;
          goto LABEL_13;
        }
        v16 = v15;
        getWFCloudKitSyncLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = sqlite3_errstr(v16);
          *(_DWORD *)buf = 136315394;
          v23 = "-[WFCloudKitSyncEventLogger _initWithFilename:flags:postNotifications:]";
          v24 = 2080;
          v25 = v18;
          _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s Failed to prepare log_event statement: %s", buf, 0x16u);
        }

        db = v8->_db;
      }
      sqlite3_close_v2(db);
    }
  }
  v19 = 0;
LABEL_13:

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_finalize(self->_log_event);
  sqlite3_close_v2(self->_db);
  v3.receiver = self;
  v3.super_class = (Class)WFCloudKitSyncEventLogger;
  -[WFCloudKitSyncEventLogger dealloc](&v3, sel_dealloc);
}

- (void)logRecordFetched:(id)a3
{
  id v4;

  -[WFCloudKitSyncEventLogger _eventForRecord:](self, "_eventForRecord:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 0, v4);

}

- (void)logDeletionFetched:(id)a3
{
  id v4;

  -[WFCloudKitSyncEventLogger _eventForRecordID:](self, "_eventForRecordID:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 1, v4);

}

- (void)logRecordPushed:(id)a3
{
  id v4;

  -[WFCloudKitSyncEventLogger _eventForRecord:](self, "_eventForRecord:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 2, v4);

}

- (void)logRecordPushFailed:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("record");
  v6 = a4;
  -[WFCloudKitSyncEventLogger _eventForRecord:](self, "_eventForRecord:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("error");
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 4, v8);
}

- (void)logRecordDeleted:(id)a3
{
  id v4;

  -[WFCloudKitSyncEventLogger _eventForRecordID:](self, "_eventForRecordID:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 3, v4);

}

- (void)logRecordDeleteFailed:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("record");
  v6 = a4;
  -[WFCloudKitSyncEventLogger _eventForRecordID:](self, "_eventForRecordID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("error");
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 5, v8);
}

- (void)logDatabaseModify:(id)a3 value:(id)a4
{
  id v5;

  -[WFCloudKitSyncEventLogger _eventForDatabaseDescriptor:value:](self, "_eventForDatabaseDescriptor:value:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 6, v5);

}

- (void)logDatabaseInsert:(id)a3 value:(id)a4
{
  id v5;

  -[WFCloudKitSyncEventLogger _eventForDatabaseDescriptor:value:](self, "_eventForDatabaseDescriptor:value:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 7, v5);

}

- (void)logDatabaseRemove:(id)a3
{
  id v4;

  -[WFCloudKitSyncEventLogger _eventForDatabaseDescriptor:value:](self, "_eventForDatabaseDescriptor:value:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 8, v4);

}

- (void)logLibraryMerge:(id)a3 remote:(id)a4 after:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("local");
  v13[1] = CFSTR("remote");
  v14[0] = a3;
  v14[1] = a4;
  v13[2] = CFSTR("after");
  v14[2] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 9, v12);
}

- (void)logEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("event");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 10, v6);
}

- (void)logError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("error");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCloudKitSyncEventLogger _logEventWithType:event:](self, "_logEventWithType:event:", 11, v6);
}

- (id)events
{
  return -[WFCloudKitSyncEventLogger _eventsWithFilter:](self, "_eventsWithFilter:", 0);
}

- (id)eventsWithType:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type == %i"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger _eventsWithFilter:](self, "_eventsWithFilter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eventsWithFilter:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  sqlite3 *db;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WFCloudKitSyncEvent *v23;
  id v25;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0x1E0CB3000uLL;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WHERE %@"), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E7AFA810;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT id, type, timestamp, event FROM events %@ ORDER BY timestamp DESC"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ppStmt = 0;
  db = self->_db;
  v9 = objc_retainAutorelease(v7);
  v10 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0);
  if (v10)
  {
    v11 = v10;
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sqlite3_errstr(v11);
      *(_DWORD *)buf = 136315394;
      v28 = "-[WFCloudKitSyncEventLogger _eventsWithFilter:]";
      v29 = 2080;
      v30 = v13;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to prepare events statement: %s", buf, 0x16u);
    }

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v25 = v9;
    v14 = (void *)objc_opt_new();
    while (sqlite3_step(ppStmt) == 100)
    {
      v15 = sqlite3_column_int(ppStmt, 0);
      v16 = sqlite3_column_int(ppStmt, 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(ppStmt, 2));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v5;
      objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", sqlite3_column_text(ppStmt, 3));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v19, "dataUsingEncoding:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "JSONObjectWithData:options:error:", v21, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = -[WFCloudKitSyncEvent initWithIdentifier:eventType:date:content:]([WFCloudKitSyncEvent alloc], "initWithIdentifier:eventType:date:content:", v15, v16, v17, v22);
      objc_msgSend(v14, "addObject:", v23);

      v5 = v18;
    }
    sqlite3_finalize(ppStmt);
    v9 = v25;
  }

  return v14;
}

- (void)clearLogs
{
  NSObject *v3;
  char *errmsg;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  if (sqlite3_exec(self->_db, "DELETE FROM events", 0, 0, &errmsg))
  {
    getWFCloudKitSyncLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "-[WFCloudKitSyncEventLogger clearLogs]";
      v7 = 2080;
      v8 = errmsg;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Failed to delete events: %s", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }
  if (self->_postNotifications)
    notify_post((const char *)WFCloudKitSyncEventsDidChange);
}

- (void)clearOldLogs
{
  void *v3;
  double v4;
  void *v5;
  sqlite3 *db;
  id v7;
  NSObject *v8;
  char *errmsg;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DELETE FROM events WHERE (timestamp < %lf)"), v4 + -86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  errmsg = 0;
  db = self->_db;
  v7 = objc_retainAutorelease(v5);
  if (sqlite3_exec(db, (const char *)objc_msgSend(v7, "UTF8String"), 0, 0, &errmsg))
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFCloudKitSyncEventLogger clearOldLogs]";
      v12 = 2080;
      v13 = errmsg;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to delete events: %s", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }
  if (self->_postNotifications)
    notify_post((const char *)WFCloudKitSyncEventsDidChange);

}

- (BOOL)_applySchemaIfNecessary
{
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  sqlite3 *db;
  id v15;
  sqlite3_stmt *ppStmt;
  char *errmsg;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  errmsg = 0;
  v3 = sqlite3_prepare_v2(self->_db, "PRAGMA user_version", -1, &ppStmt, 0);
  if (v3)
  {
    v4 = v3;
    getWFCloudKitSyncLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errstr(v4);
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
      v21 = 2080;
      v22 = (char *)v6;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Failed to prepare statement: %s", buf, 0x16u);
    }

    goto LABEL_24;
  }
  if (sqlite3_step(ppStmt) != 100)
  {
    sqlite3_finalize(ppStmt);
LABEL_9:
    v9 = sqlite3_exec(self->_db, "BEGIN TRANSACTION", 0, 0, &errmsg);
    getWFCloudKitSyncLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
        v21 = 2080;
        v22 = errmsg;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to start transaction: %s", buf, 0x16u);
      }

      goto LABEL_23;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_INFO, "%s Schema version has changed. Dropping all tables and recreating database.", buf, 0xCu);
    }

    if (sqlite3_exec(self->_db, "PRAGMA foreign_keys = OFF", 0, 0, &errmsg))
    {
      getWFCloudKitSyncLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
        v21 = 2080;
        v22 = errmsg;
        v13 = "%s Failed to disable foreign key constraints: %s";
LABEL_21:
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
      }
    }
    else
    {
      if (!sqlite3_exec(self->_db, "DROP TABLE IF EXISTS events", 0, 0, &errmsg))
      {
        v8 = -[WFCloudKitSyncEventLogger _applySchema](self, "_applySchema");
        if (!v8)
          return v8;
        db = self->_db;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), 2);
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LODWORD(db) = sqlite3_exec(db, (const char *)objc_msgSend(v15, "UTF8String"), 0, 0, &errmsg);

        if ((_DWORD)db)
        {
          getWFCloudKitSyncLogObject();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 136315394;
          v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
          v21 = 2080;
          v22 = errmsg;
          v13 = "%s SQL error: %s";
          goto LABEL_21;
        }
        if (!sqlite3_exec(self->_db, "PRAGMA foreign_keys = ON", 0, 0, &errmsg))
        {
          if (!sqlite3_exec(self->_db, "COMMIT", 0, 0, &errmsg))
            goto LABEL_7;
          getWFCloudKitSyncLogObject();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 136315394;
          v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
          v21 = 2080;
          v22 = errmsg;
          v13 = "%s Failed to start transaction: %s";
          goto LABEL_21;
        }
        getWFCloudKitSyncLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        goto LABEL_17;
      }
      getWFCloudKitSyncLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
        v21 = 2080;
        v22 = errmsg;
        v13 = "%s Unable to drop events table: %s";
        goto LABEL_21;
      }
    }
LABEL_22:

LABEL_23:
    sqlite3_free(errmsg);
LABEL_24:
    LOBYTE(v8) = 0;
    return v8;
  }
  v7 = sqlite3_column_int(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  if (v7 != 2)
    goto LABEL_9;
LABEL_7:
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)_applySchema
{
  int v2;
  NSObject *v3;
  char *errmsg;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  v2 = sqlite3_exec(self->_db, "CREATE TABLE events (id INTEGER PRIMARY KEY,type INTEGER NOT NULL,timestamp REAL NOT NULL,event TEXT NOT NULL)", 0, 0, &errmsg);
  if (v2)
  {
    getWFCloudKitSyncLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "-[WFCloudKitSyncEventLogger _applySchema]";
      v8 = 2080;
      v9 = errmsg;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Failed to set schema: %s", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }
  return v2 == 0;
}

- (void)_logEventWithType:(int)a3 event:(id)a4
{
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 10, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  v12 = sqlite3_bind_int(self->_log_event, 1, a3);
  if (v12)
  {
    v13 = v12;
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315394;
      v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      v25 = 2080;
      v26 = sqlite3_errstr(v13);
      v15 = "%s Failed to bind event type value in event log statement: %s";
LABEL_10:
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, 0x16u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v16 = sqlite3_bind_double(self->_log_event, 2, v9);
  if (v16)
  {
    v17 = v16;
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315394;
      v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      v25 = 2080;
      v26 = sqlite3_errstr(v17);
      v15 = "%s Failed to bind timestamp value in event log statement: %s";
      goto LABEL_10;
    }
LABEL_11:

    sqlite3_reset(self->_log_event);
    goto LABEL_12;
  }
  v18 = sqlite3_bind_text(self->_log_event, 3, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, 0);
  if (v18)
  {
    v19 = v18;
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315394;
      v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      v25 = 2080;
      v26 = sqlite3_errstr(v19);
      v15 = "%s Failed to bind json value in event log statement: %s";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v20 = sqlite3_step(self->_log_event);
  if (v20 != 101)
  {
    v21 = v20;
    getWFCloudKitSyncLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315394;
      v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      v25 = 2080;
      v26 = sqlite3_errstr(v21);
      _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to execute event log statement: %s", (uint8_t *)&v23, 0x16u);
    }

  }
  sqlite3_reset(self->_log_event);
  if (self->_postNotifications)
    notify_post((const char *)WFCloudKitSyncEventsDidChange);
LABEL_12:

}

- (id)_eventForDatabaseDescriptor:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectType");
  WFDescriptionForDatabaseObjectType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("type"));

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("id"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  return v7;
}

- (id)_eventForRecord:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  v25[0] = CFSTR("id");
  objc_msgSend(v3, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("zoneID");
  objc_msgSend(v3, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "zoneName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  v25[2] = CFSTR("type");
  objc_msgSend(v3, "recordType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = CFSTR("values");
  v26[2] = v18;
  v26[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_eventForRecordID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("id");
  v3 = a3;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("zoneID");
  v10[0] = v4;
  objc_msgSend(v3, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)createPersistedSyncEventLogger
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "wf_shortcutsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("synclog.db"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc((Class)a1);
  v6 = objc_retainAutorelease(v4);
  v7 = (void *)objc_msgSend(v5, "_initWithFilename:flags:postNotifications:", objc_msgSend(v6, "fileSystemRepresentation"), 65542, 1);

  return v7;
}

+ (id)createInMemorySyncEventLogger
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFilename:flags:postNotifications:", ", 65666, 0);
}

@end
