@implementation SEMFTSWriter

+ (unsigned)capabilityRequirementForItemType:(unsigned __int16)a3
{
  if (a3 == 63369 || a3 == 61352)
    return 2;
  else
    return 0;
}

+ (BOOL)_isIndexedFieldType:(unsigned __int16)a3
{
  return (a3 - 61355) < 2 || (a3 - 63372) < 2;
}

- (SEMFTSWriter)initWithDatabaseURL:(id)a3 dataProtectionClass:(int)a4
{
  void *v5;
  const char *v6;
  SEMFTSWriter *v7;

  objc_msgSend_connectionToDatabaseAtURL_dataProtectionClass_openMode_(SEMDatabaseConnection, a2, (uint64_t)a3, *(_QWORD *)&a4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (SEMFTSWriter *)objc_msgSend_initWithDatabase_(self, v6, (uint64_t)v5);

  return v7;
}

- (SEMFTSWriter)initWithDatabase:(id)a3
{
  id v5;
  SEMFTSWriter *v6;
  SEMFTSWriter *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSMutableDictionary *commandCache;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEMFTSWriter;
  v6 = -[SEMFTSWriter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = objc_alloc(MEMORY[0x24BDBCED8]);
    v10 = objc_msgSend_initWithCapacity_(v8, v9, 3);
    commandCache = v7->_commandCache;
    v7->_commandCache = (NSMutableDictionary *)v10;

    v7->_inTransaction = 0;
  }

  return v7;
}

- (BOOL)databaseExists
{
  uint64_t v2;

  if (self->_inTransaction)
    return 1;
  else
    return objc_msgSend__databaseExists(self, a2, v2);
}

- (BOOL)_databaseExists
{
  return ((uint64_t (*)(SEMDatabaseConnection *, char *))MEMORY[0x24BEDD108])(self->_database, sel_exists);
}

- (BOOL)_beginTransactionWithError:(id *)a3
{
  BOOL v3;
  const char *v6;
  void **p_database;
  const char *v8;
  NSObject *v9;
  const char *v10;
  SEMDatabaseConnection *database;
  const char *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  SEMDatabaseConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_inTransaction)
    return 1;
  if ((objc_msgSend__databaseExists(self, a2, (uint64_t)a3) & 1) != 0)
  {
    p_database = (void **)&self->_database;
    if ((objc_msgSend_openWithError_(self->_database, v6, (uint64_t)a3) & 1) == 0)
      return 0;
  }
  else
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      database = self->_database;
      v15 = 136315394;
      v16 = "-[SEMFTSWriter _beginTransactionWithError:]";
      v17 = 2112;
      v18 = database;
      _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s Creating database: %@", (uint8_t *)&v15, 0x16u);
    }
    p_database = (void **)&self->_database;
    if (!objc_msgSend_openWithError_(self->_database, v10, (uint64_t)a3)
      || !objc_msgSend_prepareFTSWithError_(*p_database, v12, (uint64_t)a3))
    {
      return 0;
    }
  }
  if (!objc_msgSend_beginTransactionWithError_(*p_database, v8, (uint64_t)a3))
    return 0;
  v3 = 1;
  self->_inTransaction = 1;
  v13 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315138;
    v16 = "-[SEMFTSWriter _beginTransactionWithError:]";
    _os_log_debug_impl(&dword_2462C4000, v13, OS_LOG_TYPE_DEBUG, "%s Database transaction active", (uint8_t *)&v15, 0xCu);
  }
  return v3;
}

- (BOOL)commitChanges:(id *)a3
{
  int v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!self->_inTransaction)
  {
    v8 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315138;
      v11 = "-[SEMFTSWriter commitChanges:]";
      _os_log_debug_impl(&dword_2462C4000, v8, OS_LOG_TYPE_DEBUG, "%s No changes to commit", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  v5 = objc_msgSend_commitTransactionWithError_(self->_database, a2, (uint64_t)a3);
  if (v5)
  {
    v5 = objc_msgSend_closeWithError_(self->_database, v6, (uint64_t)a3);
    if (v5)
    {
      v7 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        v10 = 136315138;
        v11 = "-[SEMFTSWriter commitChanges:]";
        _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Database transaction committed", (uint8_t *)&v10, 0xCu);
      }
      self->_inTransaction = 0;
LABEL_9:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)rollbackChanges:(id *)a3
{
  int v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!self->_inTransaction)
  {
    v8 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315138;
      v11 = "-[SEMFTSWriter rollbackChanges:]";
      _os_log_debug_impl(&dword_2462C4000, v8, OS_LOG_TYPE_DEBUG, "%s No changes to rollback", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  v5 = objc_msgSend_rollbackTransactionWithError_(self->_database, a2, (uint64_t)a3);
  if (v5)
  {
    v5 = objc_msgSend_closeWithError_(self->_database, v6, (uint64_t)a3);
    if (v5)
    {
      v7 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        v10 = 136315138;
        v11 = "-[SEMFTSWriter rollbackChanges:]";
        _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Database transaction rolled back", (uint8_t *)&v10, 0xCu);
      }
      self->_inTransaction = 0;
LABEL_9:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)clearWithError:(id *)a3
{
  return MEMORY[0x24BEDD108](self, sel__deleteAllRecords_, a3);
}

- (BOOL)cleanup:(id *)a3
{
  const char *v5;
  const char *v6;

  if (objc_msgSend_openWithError_(self->_database, a2, (uint64_t)a3)
    && objc_msgSend_cleanup_(self->_database, v5, (uint64_t)a3))
  {
    return objc_msgSend_closeWithError_(self->_database, v6, (uint64_t)a3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_deleteAllRecords:(id *)a3
{
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  SEMDatabaseConnection *database;
  const char *v11;
  char v12;
  id v13;
  NSObject *v14;
  SEMDatabaseConnection *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  SEMDatabaseConnection *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend__beginTransactionWithError_(self, a2, (uint64_t)a3))
    return 0;
  objc_msgSend_builderWithTableName_(SEMDatabaseDelete, v5, 0x251783850);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_build(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v17 = 0;
  v12 = objc_msgSend_executeCommand_error_(database, v11, (uint64_t)v9, &v17);
  v13 = v17;
  if ((v12 & 1) == 0)
  {
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v16 = self->_database;
      *(_DWORD *)buf = 136315650;
      v19 = "-[SEMFTSWriter _deleteAllRecords:]";
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s (%@) Delete failed: %@", buf, 0x20u);
      if (a3)
      {
LABEL_5:
        if (v13)
          *a3 = objc_retainAutorelease(v13);
      }
    }
    else if (a3)
    {
      goto LABEL_5;
    }
  }

  return v12;
}

- (BOOL)deleteExternalId:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  SEMDatabaseConnection *v27;
  char v28;
  id v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  SEMDatabaseConnection *v34;
  SEMDatabaseConnection *database;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  SEMDatabaseConnection *v40;
  __int16 v41;
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend__beginTransactionWithError_(self, v7, (uint64_t)a4))
  {
    objc_msgSend_sem_base64EncodedStringNoPadding(v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v10;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v43, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(self->_commandCache, v13, (uint64_t)&unk_25178EE58);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_updateParameters_(v14, v15, (uint64_t)v12) & 1) == 0)
    {
      objc_msgSend_objectAtIndex_(v12, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_criterionWithColumnName_EQUALSColumnValue_(SEMSQLCommandCriterion, v18, 0x251783890, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_builderWithTableName_(SEMDatabaseDelete, v20, 0x251783850);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCommandCriterion_(v21, v22, (uint64_t)v19);
      objc_msgSend_build(v21, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v32 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          database = self->_database;
          *(_DWORD *)buf = 136315650;
          v38 = "-[SEMFTSWriter deleteExternalId:error:]";
          v39 = 2112;
          v40 = database;
          v41 = 2112;
          v42 = v12;
          _os_log_error_impl(&dword_2462C4000, v32, OS_LOG_TYPE_ERROR, "%s (%@) Failed to build delete with params: {%@}", buf, 0x20u);
        }

        v14 = 0;
        v29 = 0;
        v30 = 0;
        goto LABEL_16;
      }
      objc_msgSend_setObject_forKey_(self->_commandCache, v26, v25, &unk_25178EE58);

      v14 = (void *)v25;
    }
    v27 = self->_database;
    v36 = 0;
    v28 = objc_msgSend_executeCommand_error_(v27, v16, (uint64_t)v14, &v36);
    v29 = v36;
    if ((v28 & 1) != 0)
    {
      v30 = 1;
    }
    else
    {
      v31 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v34 = self->_database;
        *(_DWORD *)buf = 136315650;
        v38 = "-[SEMFTSWriter deleteExternalId:error:]";
        v39 = 2112;
        v40 = v34;
        v41 = 2112;
        v42 = v29;
        _os_log_error_impl(&dword_2462C4000, v31, OS_LOG_TYPE_ERROR, "%s (%@) Delete failed: %@", buf, 0x20u);
      }
      v30 = 0;
      if (a4 && v29)
      {
        v29 = objc_retainAutorelease(v29);
        v30 = 0;
        *a4 = v29;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  v30 = 0;
LABEL_17:

  return v30;
}

- (BOOL)deleteExternalIds:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  SEMDatabaseConnection *v36;
  char v37;
  id v38;
  BOOL v39;
  NSObject *v40;
  NSObject *v41;
  SEMDatabaseConnection *v43;
  SEMDatabaseConnection *database;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  SEMDatabaseConnection *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend__beginTransactionWithError_(self, v7, (uint64_t)a4))
  {
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v11 = objc_msgSend_count(v6, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v14 = v6;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v46, v56, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_sem_base64EncodedStringNoPadding(*(void **)(*((_QWORD *)&v46 + 1) + 8 * i), v17, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v46, v56, 16);
      }
      while (v19);
    }

    objc_msgSend_objectForKey_(self->_commandCache, v24, (uint64_t)&unk_25178EE70);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_updateParameters_(v25, v26, (uint64_t)v13) & 1) == 0)
    {
      objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v27, 0x251783890, v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_builderWithTableName_(SEMDatabaseDelete, v29, 0x251783850);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCommandCriterion_(v30, v31, (uint64_t)v28);
      objc_msgSend_build(v30, v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        v41 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          database = self->_database;
          *(_DWORD *)buf = 136315650;
          v51 = "-[SEMFTSWriter deleteExternalIds:error:]";
          v52 = 2112;
          v53 = database;
          v54 = 2112;
          v55 = v13;
          _os_log_error_impl(&dword_2462C4000, v41, OS_LOG_TYPE_ERROR, "%s (%@) Failed to build delete with params: {%@}", buf, 0x20u);
        }

        v25 = 0;
        v38 = 0;
        v39 = 0;
        goto LABEL_23;
      }
      objc_msgSend_setObject_forKey_(self->_commandCache, v35, v34, &unk_25178EE70);

      v25 = (void *)v34;
    }
    v36 = self->_database;
    v45 = 0;
    v37 = objc_msgSend_executeCommand_error_(v36, v27, (uint64_t)v25, &v45);
    v38 = v45;
    if ((v37 & 1) != 0)
    {
      v39 = 1;
    }
    else
    {
      v40 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v43 = self->_database;
        *(_DWORD *)buf = 136315650;
        v51 = "-[SEMFTSWriter deleteExternalIds:error:]";
        v52 = 2112;
        v53 = v43;
        v54 = 2112;
        v55 = v38;
        _os_log_error_impl(&dword_2462C4000, v40, OS_LOG_TYPE_ERROR, "%s (%@) Delete failed: %@", buf, 0x20u);
      }
      v39 = 0;
      if (a4 && v38)
      {
        v38 = objc_retainAutorelease(v38);
        v39 = 0;
        *a4 = v38;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  v39 = 0;
LABEL_24:

  return v39;
}

- (BOOL)insertRecordsFromCascadeItem:(id)a3 originAppId:(id)a4 externalId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  const char *v19;
  char v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  SEMDatabaseConnection *database;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  SEMFTSWriter *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t *v33;
  id obj;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  SEMDatabaseConnection *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend__beginTransactionWithError_(self, v13, (uint64_t)a6))
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_246302EF4;
    v45 = sub_246302F04;
    v46 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 1;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_246302EF4;
    v35[4] = sub_246302F04;
    objc_msgSend_objectForKey_(self->_commandCache, v14, (uint64_t)&unk_25178EE88);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_content(v10, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id *)(v42 + 5);
    obj = (id)v42[5];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_246302F0C;
    v27[3] = &unk_251782E90;
    v31 = &v37;
    v28 = v11;
    v32 = v35;
    v33 = &v41;
    v29 = v12;
    v30 = self;
    v20 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v17, v19, (uint64_t)&obj, v27);
    objc_storeStrong(v18, obj);

    if ((v20 & 1) == 0)
    {
      v21 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        database = self->_database;
        v26 = v42[5];
        *(_DWORD *)buf = 136315906;
        v48 = "-[SEMFTSWriter insertRecordsFromCascadeItem:originAppId:externalId:error:]";
        v49 = 2112;
        v50 = database;
        v51 = 2112;
        v52 = v10;
        v53 = 2112;
        v54 = v26;
        _os_log_error_impl(&dword_2462C4000, v21, OS_LOG_TYPE_ERROR, "%s (%@) Failed to enumerate fields of item: %@ error: %@", buf, 0x2Au);
      }
      *((_BYTE *)v38 + 24) = 0;
    }

    if (a6)
    {
      v22 = (void *)v42[5];
      if (v22)
        *a6 = objc_retainAutorelease(v22);
    }
    v23 = *((_BYTE *)v38 + 24) != 0;
    _Block_object_dispose(v35, 8);

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandCache, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
