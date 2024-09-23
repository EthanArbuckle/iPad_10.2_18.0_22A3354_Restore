@implementation SEMDatabaseConnection

+ (id)readOnlyConnectionToDatabaseAtURL:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_connectionToDatabaseAtURL_dataProtectionClass_openMode_(v4, v5, (uint64_t)v3, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)connectionToDatabaseAtURL:(id)a3 dataProtectionClass:(int)a4 openMode:(int64_t)a5
{
  uint64_t v6;
  id v7;
  SEMSQLiteDatabase *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = [SEMSQLiteDatabase alloc];
  objc_msgSend_path(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(a5 - 1) >= 3)
    v13 = objc_msgSend_initWithPath_accessPermission_threadingMode_dataProtectionClass_databaseOptions_(v8, v12, (uint64_t)v11, 0, 3, v6, 3);
  else
    v13 = objc_msgSend_initWithPath_accessPermission_threadingMode_dataProtectionClass_databaseOptions_(v8, v12, (uint64_t)v11, a5, 3, v6, 3);
  v14 = (void *)v13;

  v15 = objc_alloc((Class)objc_opt_class());
  v17 = (void *)objc_msgSend_initWithDatabase_(v15, v16, (uint64_t)v14);

  return v17;
}

- (SEMDatabaseConnection)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use supported initializer"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMDatabaseConnection)initWithDatabase:(id)a3
{
  id v5;
  SEMDatabaseConnection *v6;
  SEMDatabaseConnection *v7;
  SEMDatabaseConnection *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SEMDatabaseConnection;
  v6 = -[SEMDatabaseConnection init](&v11, sel_init);
  v7 = v6;
  if (v6 && (v6->_inTransaction = 0, objc_storeStrong((id *)&v6->_db, a3), !v7->_db))
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SEMDatabaseConnection initWithDatabase:]";
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Cannot create connection with nil database.", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (BOOL)exists
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char v9;

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self->_db, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_fileExistsAtPath_(v4, v8, (uint64_t)v7);

  return v9;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SEMDatabaseConnection;
  -[SEMDatabaseConnection description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self->_db, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v7, (uint64_t)CFSTR(" %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_closeWithError_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseConnection;
  -[SEMDatabaseConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)openWithError:(id *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  char v12;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("PRAGMA busy_timeout = %d"), 500);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("PRAGMA cache_spill = %d"), 800);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_openWithError_(self->_db, v8, (uint64_t)a3)
    && objc_msgSend_executeCommandString_error_(self->_db, v9, (uint64_t)v5, a3)
    && objc_msgSend_executeCommandString_error_(self->_db, v10, (uint64_t)CFSTR("PRAGMA foreign_keys = ON;"),
                       a3))
  {
    v12 = objc_msgSend_executeCommandString_error_(self->_db, v11, (uint64_t)v7, a3);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)closeWithError:(id *)a3
{
  return objc_msgSend_closeWithError_(self->_db, a2, (uint64_t)a3);
}

- (BOOL)prepareFTSWithError:(id *)a3
{
  uint64_t v5;
  const char *v6;
  const char *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend_beginTransactionWithError_(self, a2, (uint64_t)a3) & 1) == 0)
  {
    v9 = qword_25441F970;
    v8 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR);
    if (!v8)
      return v8;
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)&v14[4] = "-[SEMDatabaseConnection prepareFTSWithError:]";
    _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Failed to begin transaction on prepare operation.", v14, 0xCu);
LABEL_11:
    LOBYTE(v8) = 0;
    return v8;
  }
  v5 = objc_opt_class();
  if ((objc_msgSend__createTableWithRecordClass_error_(self, v6, v5, a3) & 1) == 0)
  {
    v10 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      objc_msgSend_rollbackTransactionWithError_(self, v11, (uint64_t)a3, *(_OWORD *)v14);
      goto LABEL_11;
    }
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)&v14[4] = "-[SEMDatabaseConnection prepareFTSWithError:]";
    v12 = "%s Failed to create table on prepare operation.";
LABEL_14:
    _os_log_error_impl(&dword_2462C4000, v10, OS_LOG_TYPE_ERROR, v12, v14, 0xCu);
    goto LABEL_10;
  }
  if ((objc_msgSend_commitTransactionWithError_(self, v7, (uint64_t)a3) & 1) == 0)
  {
    v10 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)&v14[4] = "-[SEMDatabaseConnection prepareFTSWithError:]";
    v12 = "%s Failed to commit transaction on prepare operation.";
    goto LABEL_14;
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)_createTableWithRecordClass:(Class)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend_genSQLCreateStatements(a3, a2, (uint64_t)a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v19, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v6);
        if (!objc_msgSend_executeCommandString_error_(self->_db, v9, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), a4))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v11;
  const char *v12;
  int v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    v17[0] = CFSTR("Attempted to begin transaction when one is already active");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v17, &v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v4, v6, 0x251785690, 11, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3 && v7)
      *a3 = objc_retainAutorelease(v7);

    LOBYTE(v9) = 0;
  }
  else
  {
    v11 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "-[SEMDatabaseConnection beginTransactionWithError:]";
      _os_log_debug_impl(&dword_2462C4000, v11, OS_LOG_TYPE_DEBUG, "%s Beginning transaction", (uint8_t *)&v14, 0xCu);
    }
    v9 = objc_msgSend_beginTransactionWithError_(self->_db, v12, (uint64_t)a3);
    if (v9)
    {
      LOBYTE(v9) = 1;
      self->_inTransaction = 1;
    }
  }
  return v9;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  NSObject *v5;
  const char *v6;
  int v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "-[SEMDatabaseConnection commitTransactionWithError:]";
      _os_log_debug_impl(&dword_2462C4000, v5, OS_LOG_TYPE_DEBUG, "%s Committing transaction.", (uint8_t *)&v14, 0xCu);
    }
    v7 = objc_msgSend_commitTransactionWithError_(self->_db, v6, (uint64_t)a3);
    if (v7)
    {
      self->_inTransaction = 0;
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    v17[0] = CFSTR("Attempted to commit transaction when none are active");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, 0x251785690, 12, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3 && v11)
      *a3 = objc_retainAutorelease(v11);

    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  NSObject *v5;
  const char *v6;
  int v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "-[SEMDatabaseConnection rollbackTransactionWithError:]";
      _os_log_debug_impl(&dword_2462C4000, v5, OS_LOG_TYPE_DEBUG, "%s Rolling back transaction.", (uint8_t *)&v14, 0xCu);
    }
    v7 = objc_msgSend_rollbackTransactionWithError_(self->_db, v6, (uint64_t)a3);
    if (v7)
    {
      self->_inTransaction = 0;
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    v17[0] = CFSTR("Attempted to rollback transaction when none are active");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, 0x251785690, 13, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3 && v11)
      *a3 = objc_retainAutorelease(v11);

    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)cleanup:(id *)a3
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0BA0];
    v16[0] = CFSTR("Attempted to cleanup while transaction is active");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v4, v6, 0x251785690, 16, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
    {
      if (v7)
        *a3 = objc_retainAutorelease(v7);
    }

    return 0;
  }
  else
  {
    v11 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[SEMDatabaseConnection cleanup:]";
      _os_log_debug_impl(&dword_2462C4000, v11, OS_LOG_TYPE_DEBUG, "%s Cleaning database.", (uint8_t *)&v13, 0xCu);
    }
    return objc_msgSend_cleanup_(self->_db, v12, (uint64_t)a3);
  }
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend_executeCommand_options_(self->_db, a2, (uint64_t)a3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  return v9 == 0;
}

- (BOOL)executeCommand:(id)a3 error:(id *)a4 returningRow:(id *)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SEMDatabaseValueRow *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  objc_msgSend_executeCommand_options_(self->_db, a2, (uint64_t)a3, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = [SEMDatabaseValueRow alloc];
    objc_msgSend_rowValueTuples(v7, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend_initWithDatabaseValueArray_(v12, v19, (uint64_t)v18);

    if (a5)
      *a5 = objc_retainAutorelease(v20);

  }
  return v11 == 0;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  int RowResultsOfSelect_outRows_error;
  id v12;
  const char *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;

  v8 = a3;
  v9 = a5;
  v31 = 0;
  RowResultsOfSelect_outRows_error = objc_msgSend__getRowResultsOfSelect_outRows_error_(self, v10, (uint64_t)v8, &v31, a4);
  v12 = v31;
  if (RowResultsOfSelect_outRows_error)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_2462CF41C;
    v29 = sub_2462CF42C;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_2462CF434;
    v17[3] = &unk_25175EBD8;
    v18 = v9;
    v19 = &v25;
    v20 = &v21;
    objc_msgSend_enumerateObjectsUsingBlock_(v12, v13, (uint64_t)v17);
    if (a4)
    {
      v14 = (void *)v26[5];
      if (v14)
        *a4 = objc_retainAutorelease(v14);
    }
    v15 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v14[4];
  id v15;
  Class v16;

  v10 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2462CF580;
  v14[3] = &unk_25175EC00;
  v15 = v10;
  v16 = a4;
  v11 = v10;
  LOBYTE(a5) = objc_msgSend_enumerateRowResultsOfSelect_error_usingBlock_(self, v12, (uint64_t)a3, a5, v14);

  return (char)a5;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8
{
  id v11;
  uint64_t (**v12)(id, void *, id *, _BYTE *);
  const char *v13;
  unint64_t v14;
  id v15;
  id v16;
  __int128 v17;
  void *v18;
  void *v19;
  const char *v20;
  int RowResultsOfSelect_outRows_error;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  SEMDatabaseValueRow *v30;
  const char *v31;
  void *v32;
  void *v33;
  int v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  int v43;
  __int128 v45;
  unint64_t v47;
  id v48;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v58;
  id v59;
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = (uint64_t (**)(id, void *, id *, _BYTE *))a8;
  v14 = objc_msgSend_addLimit_offset_(v11, v13, a4, a5);
  v15 = 0;
  v16 = 0;
  *(_QWORD *)&v17 = 136315906;
  v45 = v17;
  v47 = a4;
  v48 = v11;
  do
  {
    v18 = v15;
    v19 = (void *)MEMORY[0x249557014](v14);
    v59 = v15;
    v60 = v16;
    RowResultsOfSelect_outRows_error = objc_msgSend__getRowResultsOfSelect_outRows_error_(self, v20, (uint64_t)v11, &v60, &v59);
    v22 = v60;

    v15 = v59;
    if (!RowResultsOfSelect_outRows_error)
      goto LABEL_24;
    v51 = v19;
    v52 = v22;
    v58 = 0;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v16 = v22;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v23, (uint64_t)&v54, v69, 16);
    if (!v24)
    {
      RowResultsOfSelect_outRows_error = 1;
      goto LABEL_17;
    }
    v25 = v24;
    v26 = *(_QWORD *)v55;
    while (2)
    {
      v27 = 0;
      v28 = v15;
      do
      {
        if (*(_QWORD *)v55 != v26)
          objc_enumerationMutation(v16);
        v29 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v27);
        v30 = [SEMDatabaseValueRow alloc];
        v32 = (void *)objc_msgSend_initWithDatabaseValueArray_(v30, v31, v29);
        v33 = v32;
        if (v58)
        {

          RowResultsOfSelect_outRows_error = 1;
          v15 = v28;
LABEL_16:
          a4 = v47;
          v11 = v48;
          goto LABEL_17;
        }
        v53 = v28;
        v34 = v12[2](v12, v32, &v53, &v58);
        v15 = v53;

        if (!v34)
        {
          RowResultsOfSelect_outRows_error = 0;
          goto LABEL_16;
        }
        ++v27;
        v28 = v15;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v35, (uint64_t)&v54, v69, 16);
      RowResultsOfSelect_outRows_error = 1;
      a4 = v47;
      v11 = v48;
      if (v25)
        continue;
      break;
    }
LABEL_17:

    v19 = v51;
    if (!a6)
    {
      v22 = v52;
LABEL_24:
      objc_autoreleasePoolPop(v19);
      break;
    }
    v36 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v40 = v36;
      v43 = objc_msgSend_count(v16, v41, v42);
      *(_DWORD *)buf = v45;
      v62 = "-[SEMDatabaseConnection enumerateRowResultsOfSelect:batchSize:offset:enumerateAll:error:usingBlock:]";
      v63 = 1024;
      v64 = a5;
      v65 = 1024;
      v66 = a4;
      v67 = 1024;
      v68 = v43;
      _os_log_debug_impl(&dword_2462C4000, v40, OS_LOG_TYPE_DEBUG, "%s Read database batch {offset: %u batchSize: %u} total records read: %u", buf, 0x1Eu);

    }
    a5 += a4;
    objc_msgSend_replaceOffset_(v11, v37, a5, v45);
    objc_autoreleasePoolPop(v51);
    v22 = v52;
    if (!RowResultsOfSelect_outRows_error)
      break;
    v14 = objc_msgSend_count(v16, v38, v39);
  }
  while (v14 >= a4);
  if (v15)
  {
    LOBYTE(RowResultsOfSelect_outRows_error) = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v15);
  }

  return RowResultsOfSelect_outRows_error;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  const char *v18;
  _QWORD v20[4];
  id v21;
  Class v22;

  v10 = a7;
  v16 = a9;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2462CFAA8;
  v20[3] = &unk_25175EC00;
  v21 = v16;
  v22 = a4;
  v17 = v16;
  LOBYTE(a8) = objc_msgSend_enumerateRowResultsOfSelect_batchSize_offset_enumerateAll_error_usingBlock_(self, v18, (uint64_t)a3, a5, a6, v10, a8, v20);

  return (char)a8;
}

- (int)rowsModified:(id *)a3
{
  return MEMORY[0x24BEDD108](self->_db, sel_rowsModified_, a3);
}

- (BOOL)_getRowResultsOfSelect:(id)a3 outRows:(id *)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  const char *v20;
  void *v21;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_executeCommand_options_(self->_db, v9, (uint64_t)v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      v17 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v23 = v17;
        objc_msgSend_commandString(v8, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parameters(v8, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(self->_db, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 136316162;
        v34 = "-[SEMDatabaseConnection _getRowResultsOfSelect:outRows:error:]";
        v35 = 2112;
        v36 = v26;
        v37 = 2112;
        v38 = v29;
        v39 = 2112;
        v40 = v32;
        v41 = 2112;
        v42 = v16;
        _os_log_error_impl(&dword_2462C4000, v23, OS_LOG_TYPE_ERROR, "%s Could not execute command=%@ with parameters=%@ in database file at %@, err=%@", (uint8_t *)&v33, 0x34u);

      }
      v18 = 0;
    }
    else
    {
      objc_msgSend_rowValueTuples(v10, v14, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0BA0];
    v44[0] = CFSTR("Could not execute non-select command on read-only database connection");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v44, &v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v19, v20, 0x251785690, 14, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    v18 = 0;
    if (a5 && v21)
    {
      v16 = objc_retainAutorelease(v21);
      v18 = 0;
      *a5 = v16;
    }
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
