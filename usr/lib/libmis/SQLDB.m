@implementation SQLDB

- (SQLDB)init
{

  return 0;
}

- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SQLDB *v8;
  SQLDB *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *transactionSem;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSURL *url;
  int v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  sqlite3 *db;
  BOOL v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v35;
  sqlite3 *ppDb;
  uint8_t buf[4];
  int v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SQLDB;
  v8 = -[SQLDB init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v10 = dispatch_semaphore_create(1);
    transactionSem = v9->_transactionSem;
    v9->_transactionSem = (OS_dispatch_semaphore *)v10;

    if (!v9->_transactionSem)
      goto LABEL_16;
    url = v9->_url;
    ppDb = 0;
    if (v4)
      v16 = 65537;
    else
      v16 = 65542;
    objc_msgSend_path(url, v12, v13, v14);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    v22 = sqlite3_open_v2(v21, &ppDb, v16, 0);

    if (v22)
    {
      sub_1DF30EE34();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v38 = v22;
        _os_log_error_impl(&dword_1DF30C000, v26, OS_LOG_TYPE_ERROR, "Error opening DB: %d", buf, 8u);
      }

    }
    db = ppDb;
    v9->_db = ppDb;
    if (!db
      || (!v4
        ? (objc_msgSend_setupPermissions(v9, v23, v24, v25), v28 = sqlite3_db_readonly(v9->_db, 0) == 1, db = v9->_db)
        : (sqlite3 *)(v28 = 1),
          (v9->_readonly = v28, sqlite3_busy_timeout(db, 300000), !v9->_readonly)
       && (objc_msgSend_executeQuery_withBind_withResults_(v9, v29, (uint64_t)CFSTR("PRAGMA journal_mode = WAL"), 0, 0), objc_msgSend_executeQuery_withBind_withResults_(v9, v30, (uint64_t)CFSTR("PRAGMA foreign_keys = ON"), 0, 0), (objc_msgSend_setupSchema(v9, v31, v32, v33) & 1) == 0)))
    {
LABEL_16:

      v9 = 0;
    }
  }

  return v9;
}

- (SQLDB)initWithDatabaseURL:(id)a3
{
  return (SQLDB *)MEMORY[0x1E0DE7D20](self, sel_initWithDatabaseURL_asReadOnly_, a3, 0);
}

- (NSURL)walURL
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_URLByDeletingLastPathComponent(self->_url, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(self->_url, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%@-wal"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v5, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v15;
}

- (NSURL)shmURL
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_URLByDeletingLastPathComponent(self->_url, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(self->_url, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%@-shm"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v5, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v15;
}

- (BOOL)setupSchema
{
  int v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = objc_msgSend_executeQuery_withBind_withResults_(self, a2, (uint64_t)CFSTR("CREATE TABLE IF NOT EXISTS settings(name TEXT, value TEXT, PRIMARY KEY (name))"), 0, 0);
  if (v2)
  {
    sub_1DF30EE34();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1DF30C000, v3, OS_LOG_TYPE_ERROR, "Database failed to initialize.", v5, 2u);
    }

  }
  return v2 == 0;
}

- (void)setupPermissions
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;

  objc_msgSend_path(self->_url, a2, v2, v3);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend_UTF8String(v8, v4, v5, v6);
  sub_1DF3316D4(v7, 384);

}

- (void)dealloc
{
  sqlite3 *db;
  objc_super v4;

  db = self->_db;
  if (db)
    sqlite3_close(db);
  v4.receiver = self;
  v4.super_class = (Class)SQLDB;
  -[SQLDB dealloc](&v4, sel_dealloc);
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1DF326DA0;
  v12[3] = &unk_1EA98A998;
  v13 = v8;
  v9 = v8;
  LODWORD(a4) = objc_msgSend_executeQuery_withBind_withCancellableResults_(self, v10, (uint64_t)a3, (uint64_t)a4, v12);

  return (int)a4;
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5
{
  id v8;
  void (**v9)(id, sqlite3_stmt *);
  uint64_t (**v10)(id, sqlite3_stmt *, void *);
  sqlite3 *db;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  sqlite3_stmt *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  int v53;
  _BOOL4 v54;
  char v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  NSObject *v59;
  int v60;
  int v61;
  const char *v63;
  int v64;
  const char *v65;
  int v66;
  const char *v67;
  int v68;
  SQLDB *v69;
  id v70;
  void (**v71)(id, sqlite3_stmt *);
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  _BYTE v74[14];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, sqlite3_stmt *))a4;
  v10 = (uint64_t (**)(id, sqlite3_stmt *, void *))a5;
  ppStmt = 0;
  db = self->_db;
  v12 = objc_retainAutorelease(v8);
  v16 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
  v17 = sqlite3_prepare_v2(db, v16, -1, &ppStmt, 0);
  if (v17)
  {
    v18 = v17;
    sub_1DF30EE34();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v63 = sqlite3_errmsg(self->_db);
      v64 = sqlite3_errcode(self->_db);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v74 = v63;
      *(_WORD *)&v74[8] = 1024;
      *(_DWORD *)&v74[10] = v64;
      _os_log_error_impl(&dword_1DF30C000, v19, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
    }

    sub_1DF30EE34();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v74 = v18;
      *(_WORD *)&v74[4] = 2112;
      *(_QWORD *)&v74[6] = v12;
      _os_log_error_impl(&dword_1DF30C000, v20, OS_LOG_TYPE_ERROR, "Prepare error (%d) on query: %@", buf, 0x12u);
    }
    v21 = (void *)MEMORY[0x1E0C9AA70];
LABEL_39:

  }
  else
  {
    if (v9)
      v9[2](v9, ppStmt);
    if (v10 && (v22 = ppStmt, (v23 = sqlite3_column_count(ppStmt)) != 0))
    {
      v26 = v23;
      objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v24, 2 * v23, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 >= 1)
      {
        v69 = self;
        v70 = v12;
        v71 = v9;
        v27 = 0;
        do
        {
          v28 = sqlite3_column_origin_name(v22, v27);
          v29 = sqlite3_column_name(v22, v27);
          v30 = sqlite3_column_table_name(v22, v27);
          if (v28 && v30)
          {
            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v31, (uint64_t)v30, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_hasSuffix_(v33, v34, (uint64_t)CFSTR("s"), v35))
            {
              v39 = objc_msgSend_length(v33, v36, v37, v38);
              objc_msgSend_substringToIndex_(v33, v40, v39 - 1, v41);
              v42 = objc_claimAutoreleasedReturnValue();

              v33 = (void *)v42;
            }
            objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v36, v27, v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v44, (uint64_t)CFSTR("%@_%s"), v45, v33, v28);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v21, v47, (uint64_t)v43, (uint64_t)v46);

          }
          if (v29)
          {
            objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v31, v27, v32);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v49, (uint64_t)v29, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v21, v52, (uint64_t)v48, (uint64_t)v51);

          }
          v27 = (v27 + 1);
        }
        while (v26 != (_DWORD)v27);
        v12 = v70;
        v9 = v71;
        self = v69;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0C9AA70];
    }
    do
    {
      v53 = sqlite3_step(ppStmt);
      v18 = v53;
      if ((v53 - 102) <= 0xFFFFFFFD)
      {
        sub_1DF30EE34();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v67 = sqlite3_errmsg(self->_db);
          v68 = sqlite3_errcode(self->_db);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v74 = v67;
          *(_WORD *)&v74[8] = 1024;
          *(_DWORD *)&v74[10] = v68;
          _os_log_error_impl(&dword_1DF30C000, v56, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
        }

        sub_1DF30EE34();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v74 = v18;
          *(_WORD *)&v74[4] = 2112;
          *(_QWORD *)&v74[6] = v12;
          _os_log_error_impl(&dword_1DF30C000, v20, OS_LOG_TYPE_ERROR, "Step error (%d) on query: %@", buf, 0x12u);
        }
        goto LABEL_39;
      }
      v54 = v53 == 100;
      v55 = 1;
      if (v10 && v18 == 100)
      {
        v55 = v10[2](v10, ppStmt, v21);
        v54 = 1;
      }
    }
    while (v54 && (v55 & 1) != 0);
    if (v54)
      v18 = 100;
    if (((!v54 | v55) & 1) == 0)
    {
      sub_1DF30EE34();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DF30C000, v20, OS_LOG_TYPE_ERROR, "Query canceled", buf, 2u);
      }
      v18 = 4;
      goto LABEL_39;
    }
  }
  v57 = v18;
  if (ppStmt)
  {
    v57 = sqlite3_finalize(ppStmt);
    if (v57)
    {
      sub_1DF30EE34();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v65 = sqlite3_errmsg(self->_db);
        v66 = sqlite3_errcode(self->_db);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v74 = v65;
        *(_WORD *)&v74[8] = 1024;
        *(_DWORD *)&v74[10] = v66;
        _os_log_error_impl(&dword_1DF30C000, v58, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
      }

      sub_1DF30EE34();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v74 = v57;
        *(_WORD *)&v74[4] = 2112;
        *(_QWORD *)&v74[6] = v12;
        _os_log_error_impl(&dword_1DF30C000, v59, OS_LOG_TYPE_ERROR, "Finalize error (%d) on query: %@", buf, 0x12u);
      }

    }
  }
  if (v18 == 101)
    v60 = v57;
  else
    v60 = v18;
  if (v18)
    v61 = v60;
  else
    v61 = v57;

  return v61;
}

- (int)transaction:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_transaction_immediate_, a3, 0);
}

- (int)transaction:(id)a3 immediate:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int (**v6)(_QWORD);
  const char *v7;
  int v8;
  int v9;
  const char *v10;

  v4 = a4;
  v6 = (unsigned int (**)(_QWORD))a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_transactionSem, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
    v8 = objc_msgSend_executeQuery_withBind_withResults_(self, v7, (uint64_t)CFSTR("begin immediate transaction"), 0, 0);
  else
    v8 = objc_msgSend_executeQuery_withBind_withResults_(self, v7, (uint64_t)CFSTR("begin transaction"), 0, 0);
  v9 = v8;
  if (!v8)
  {
    if (v6[2](v6)
      && !objc_msgSend_executeQuery_withBind_withResults_(self, v10, (uint64_t)CFSTR("end transaction"), 0, 0))
    {
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend_executeQuery_withBind_withResults_(self, v10, (uint64_t)CFSTR("rollback transaction"), 0, 0);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_transactionSem);

  return v9;
}

- (int)checkpoint
{
  return sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
}

- (id)readSetting:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1DF326C0C;
  v17 = sub_1DF326C1C;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1DF326D14;
  v11[3] = &unk_1EA98A9C0;
  v6 = v4;
  v12 = v6;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = sub_1DF326D50;
  v10[3] = &unk_1EA98A9E8;
  v10[4] = &v13;
  objc_msgSend_executeQuery_withBind_withResults_(self, v7, (uint64_t)CFSTR("SELECT value FROM settings WHERE name = ?1"), (uint64_t)v11, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setSetting:(id)a3 toValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1DF326CB0;
  v11[3] = &unk_1EA98AA10;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend_executeQuery_withBind_withResults_(self, v10, (uint64_t)CFSTR("INSERT OR REPLACE INTO settings (name, value) VALUES (?1, ?2)"), (uint64_t)v11, 0);

}

- (void)deleteSetting:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1DF326C74;
  v7[3] = &unk_1EA98A9C0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_executeQuery_withBind_withResults_(self, v6, (uint64_t)CFSTR("DELETE FROM settings WHERE name = ?1"), (uint64_t)v7, 0);

}

- (unint64_t)tableRowCount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1DF326C0C;
  v22 = sub_1DF326C1C;
  v23 = 0;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("SELECT COUNT(*) FROM %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1DF326C24;
  v17[3] = &unk_1EA98A9E8;
  v17[4] = &v18;
  v12 = objc_msgSend_executeQuery_withBind_withResults_(self, v8, (uint64_t)v7, 0, v17);
  if (v12)
  {
    sub_1DF30EE34();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v4;
      v26 = 1024;
      v27 = v12;
      _os_log_error_impl(&dword_1DF30C000, v13, OS_LOG_TYPE_ERROR, "Unable to table row count for %@: %d", buf, 0x12u);
    }

  }
  v14 = (void *)v19[5];
  if (v14)
    v15 = objc_msgSend_unsignedIntegerValue(v14, v9, v10, v11);
  else
    v15 = 0;

  _Block_object_dispose(&v18, 8);
  return v15;
}

- (id)lastInsertRowID
{
  void *v2;
  sqlite3_int64 insert_rowid;
  const char *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  insert_rowid = sqlite3_last_insert_rowid(self->_db);
  return (id)objc_msgSend_numberWithLongLong_(v2, v4, insert_rowid, v5);
}

- (NSURL)dbURL
{
  return self->_url;
}

- (double)totalSizeMB
{
  return self->_totalSizeMB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSem, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (id)databaseWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sub_1DF30EE34();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1DF30C000, v5, OS_LOG_TYPE_DEFAULT, "DB being loaded from %@", (uint8_t *)&v11, 0xCu);
  }

  v6 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend_initWithDatabaseURL_(v6, v7, (uint64_t)v4, v8);

  return v9;
}

@end
