@implementation SFExternalCredentialIdentityStore

- (SFExternalCredentialIdentityStore)initWithURL:(id)a3
{
  return -[SFExternalCredentialIdentityStore initWithURL:protectionType:](self, "initWithURL:protectionType:", a3, 2);
}

- (SFExternalCredentialIdentityStore)initWithURL:(id)a3 protectionType:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  id v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFExternalCredentialIdentityStore;
  v7 = -[WBSSQLiteStore initWithURL:protectionType:](&v18, sel_initWithURL_protectionType_, v6, a4);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.SafariFoundation.%@.%p"), v10, v7);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    objc_msgSend(v7, "databaseQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create_with_target_V2(v12, 0, v13);
    v15 = (void *)*((_QWORD *)v7 + 9);
    *((_QWORD *)v7 + 9) = v14;

    dispatch_suspend(*((dispatch_object_t *)v7 + 9));
    v16 = v7;
  }

  return (SFExternalCredentialIdentityStore *)v7;
}

- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 lockingPolicy:(int64_t)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  SFExternalCredentialIdentityStore *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13[1] = 3221225472;
  v13[2] = __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke;
  v13[3] = &unk_24C935B30;
  v14 = self;
  v15 = a7;
  v12.receiver = v14;
  v12.super_class = (Class)SFExternalCredentialIdentityStore;
  v13[0] = MEMORY[0x24BDAC760];
  v11 = v15;
  -[WBSSQLiteStore openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:lockingPolicy:completionHandler:](&v12, sel_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler_, v10, v9, v8, a6, v13);

}

void __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "databaseQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2;
  block[3] = &unk_24C935B08;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = a2;
  block[4] = v5;
  v8 = v6;
  dispatch_async(v4, block);

}

uint64_t __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  void *v4;
  sqlite3 *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  v2 = (uint64_t *)(a1 + 48);
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2_cold_1(v2, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3 *)objc_msgSend(v4, "handle");

    if (v5)
      sqlite3_create_function_v2(v5, "sf_identity_matches_domains", 3, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))credentialIdentityMatchesDomains, 0, 0, 0);
    v6 = objc_alloc(MEMORY[0x24BE82DA0]);
    objc_msgSend(*(id *)(a1 + 32), "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithDatabase:", v7);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = v8;

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, *v2);
  return result;
}

- (void)_databaseWillClose
{
  WBSSQLiteStatementCache *statements;

  -[WBSSQLiteStatementCache invalidate](self->_statements, "invalidate");
  statements = self->_statements;
  self->_statements = 0;

}

- (int)_createFreshDatabaseSchema
{
  void *v2;
  id v3;
  int v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[WBSSQLiteStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke;
  v6[3] = &unk_24C935B58;
  v7 = v2;
  v8 = &v9;
  v3 = v2;
  objc_msgSend(v3, "tryToPerformTransactionInBlock:", v6);
  v4 = *((_DWORD *)v10 + 6);

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(a1 + 32), 0, CFSTR("CREATE TABLE credential_identities (id INTEGER PRIMARY KEY AUTOINCREMENT,identity_type INTEGER DEFAULT 0,service_id TEXT NOT NULL,service_id_type INTEGER NOT NULL DEFAULT 0,external_record_id TEXT DEFAULT NULL,user TEXT DEFAULT NULL,rank INTEGER NOT NULL DEFAULT 0,UNIQUE(service_id, service_id_type, external_record_id, user, identity_type) ON CONFLICT REPLACE)"));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 101)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(a1 + 32), 0, CFSTR("CREATE INDEX credential_identities__service_id ON credential_identities (service_id)"));
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 101)
      return 1;
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastErrorMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_1(v5, (uint64_t)v6);
    }
  }
  else
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastErrorMessage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_2(v4, (uint64_t)v6);
    }
  }

  return 0;
}

- (int)_currentSchemaVersion
{
  return 3;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];

  v3 = *(_QWORD *)&a3;
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("BEGIN TRANSACTION"));

  if (v6 == 101)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke;
    v19[3] = &unk_24C935B80;
    v19[4] = self;
    v7 = (void (**)(_QWORD))MEMORY[0x212BBA4A8](v19);
    if ((_DWORD)v3 != 3 && (_DWORD)v3 != 2
      || (v6 = -[SFExternalCredentialIdentityStore _migrateToSchemaVersion](self, "_migrateToSchemaVersion"), v6 == 101))
    {
      if (-[SFExternalCredentialIdentityStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", v3) != 101)
      {
        v7[2](v7);
        v6 = 101;
        goto LABEL_15;
      }
      -[WBSSQLiteStore database](self, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v16, 0, CFSTR("COMMIT TRANSACTION"));

      if (v6 == 101)
      {
LABEL_15:

        return v6;
      }
      v17 = WBS_LOG_CHANNEL_PREFIXCredentials();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SFExternalCredentialIdentityStore _migrateToSchemaVersion:].cold.1(v3, v17);
    }
    v7[2](v7);
    goto LABEL_15;
  }
  v8 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SFExternalCredentialIdentityStore _migrateToSchemaVersion:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
  return v6;
}

void __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v1, 0, CFSTR("ROLLBACK TRANSACTION"));

  if (v2 != 101)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (int)_migrateToSchemaVersion_2
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("ALTER TABLE credential_identities ADD COLUMN credential_id TEXT DEFAULT NULL"));

  if (v4 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteStore database](self, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 1024;
      v15 = v4;
      _os_log_error_impl(&dword_20E365000, v6, OS_LOG_TYPE_ERROR, "Failed to add credential_id column to credential_identities table: %{public}@ (%d)", (uint8_t *)&v12, 0x12u);

    }
    goto LABEL_7;
  }
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("ALTER TABLE credential_identities ADD COLUMN user_handle TEXT DEFAULT NULL"));

  if (v4 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteStore database](self, "database");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastErrorMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 1024;
      v15 = v4;
      _os_log_error_impl(&dword_20E365000, v6, OS_LOG_TYPE_ERROR, "Failed to add user_handle column to credential_identities table: %{public}@ (%d)", (uint8_t *)&v12, 0x12u);

    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  id obj;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE buf[24];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v3, CFSTR("SELECT * FROM credential_identities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v5)
    goto LABEL_33;
  v6 = *(_QWORD *)v45;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v45 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
      v43 = 0;
      v43 = objc_msgSend(v8, "int64AtIndex:", 0);
      v9 = objc_msgSend(v8, "int64AtIndex:", 1);
      objc_msgSend(v8, "stringAtIndex:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v42 = v10;
      v41 = objc_msgSend(v8, "int64AtIndex:", 3);
      objc_msgSend(v8, "stringAtIndex:", 4);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringAtIndex:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v39 = v11;
      v38 = objc_msgSend(v8, "int64AtIndex:", 6);
      objc_msgSend(v8, "stringAtIndex:", 7);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringAtIndex:", 8);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v42, "safari_bestURLForUserTypedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = objc_msgSend(v39, "length") == 0;

          if (!v21)
          {
            -[WBSSQLiteStore database](self, "database");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v23 = objc_alloc(MEMORY[0x24BE82D98]);
            *(_QWORD *)buf = 0;
            v24 = (void *)objc_msgSend(v23, "initWithDatabase:query:error:", v22, CFSTR("UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ? WHERE id = ?"), buf);
            v25 = *(id *)buf;
            v26 = v25;
            if (v24)
            {
              v27 = v24;
              objc_msgSend(v27, "bindInt64:atParameterIndex:", 1, 1);
              SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(v27, &v42, &v41, &v40, &v39, &v38, &v43);

              v19 = objc_msgSend(v27, "execute");
              objc_msgSend(v27, "invalidate");
              if ((v19 - 100) >= 2 && (_DWORD)v19)
                objc_msgSend(v22, "reportErrorWithCode:statement:error:", v19, objc_msgSend(v27, "handle"), 0);
            }
            else
            {
              LODWORD(v19) = objc_msgSend(v25, "code");
            }

            if ((_DWORD)v19 != 101)
            {
              v28 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                -[WBSSQLiteStore database](self, "database");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "lastErrorMessage");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v32;
                _os_log_error_impl(&dword_20E365000, v28, OS_LOG_TYPE_ERROR, "Failed to recover a password identity with error: %{public}@", buf, 0xCu);

              }
LABEL_29:

              v12 = 0;
              v34 = v19;
              goto LABEL_30;
            }
          }
        }
      }
      v12 = 1;
      if (v9 == 1 && v37 && v36)
      {
        -[WBSSQLiteStore database](self, "database");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x24BE82D98]);
        *(_QWORD *)buf = 0;
        v15 = (void *)objc_msgSend(v14, "initWithDatabase:query:error:", v13, CFSTR("UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ?, credential_id = ?, user_handle = ? WHERE id = ?"), buf);
        v16 = *(id *)buf;
        v17 = v16;
        if (v15)
        {
          v18 = v15;
          objc_msgSend(v18, "bindInt64:atParameterIndex:", 2, 1);
          SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v18, &v42, &v41, &v40, &v39, &v38, &v37, &v36, &v43);

          v19 = objc_msgSend(v18, "execute");
          objc_msgSend(v18, "invalidate");
          if ((v19 - 100) >= 2 && (_DWORD)v19)
            objc_msgSend(v13, "reportErrorWithCode:statement:error:", v19, objc_msgSend(v18, "handle"), 0);
        }
        else
        {
          LODWORD(v19) = objc_msgSend(v16, "code");
        }

        if ((_DWORD)v19 == 101)
        {
          v12 = 1;
          goto LABEL_30;
        }
        v28 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteStore database](self, "database");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastErrorMessage");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v30;
          _os_log_error_impl(&dword_20E365000, v28, OS_LOG_TYPE_ERROR, "Failed to recover a passkey identity with error: %{public}@", buf, 0xCu);

        }
        goto LABEL_29;
      }
LABEL_30:

      if (!v12)
        goto LABEL_34;
      ++v7;
    }
    while (v5 != v7);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  }
  while (v5);
LABEL_33:
  v34 = 101;
LABEL_34:

  return v34;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v10;
  void *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteStore database](self, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastErrorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v13 = v3;
      v14 = 2114;
      v15 = v11;
      v16 = 1024;
      v17 = v7;
      _os_log_error_impl(&dword_20E365000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (void)saveCredentialIdentities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke;
  block[3] = &unk_24C935BD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke_2;
  v6[3] = &unk_24C935BA8;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = &v9;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v6);

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *((unsigned __int8 *)v10 + 24));

  _Block_object_dispose(&v9, 8);
}

uint64_t __73__SFExternalCredentialIdentityStore_saveCredentialIdentities_completion___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_saveCredentialIdentities:", *(_QWORD *)(a1 + 40)) == 101;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (void)replaceCredentialIdentitiesWithIdentities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke;
  block[3] = &unk_24C935BF8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeAllCredentialIdentities");
  *((_BYTE *)v12 + 24) = v2 == 101;
  if (v2 == 101)
  {
    objc_msgSend(*(id *)(a1 + 32), "_vacuum");
    objc_msgSend(*(id *)(a1 + 32), "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke_2;
    v8[3] = &unk_24C935BA8;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v10 = &v11;
    v8[4] = v4;
    v9 = v5;
    objc_msgSend(v3, "tryToPerformTransactionInBlock:", v8);

    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *((unsigned __int8 *)v12 + 24));

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __90__SFExternalCredentialIdentityStore_replaceCredentialIdentitiesWithIdentities_completion___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_saveCredentialIdentities:", *(_QWORD *)(a1 + 40)) == 101;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (void)removeAllCredentialIdentitiesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__SFExternalCredentialIdentityStore_removeAllCredentialIdentitiesWithCompletion___block_invoke;
  v7[3] = &unk_24C935C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __81__SFExternalCredentialIdentityStore_removeAllCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeAllCredentialIdentities");
  if (v2 == 101)
    objc_msgSend(*(id *)(a1 + 32), "_vacuum");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
  return result;
}

- (void)removeCredentialIdentities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SFExternalCredentialIdentityStore_removeCredentialIdentities_completion___block_invoke;
  block[3] = &unk_24C935BD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __75__SFExternalCredentialIdentityStore_removeCredentialIdentities_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeCredentialIdentities:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
  return result;
}

- (int)_removeCredentialIdentities:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = -[SFExternalCredentialIdentityStore _removeCredentialIdentity:](self, "_removeCredentialIdentity:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          if (v9 != 101)
          {
            v10 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteStore database](self, "database");
              objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[SFExternalCredentialIdentityStore _removeCredentialIdentities:].cold.1();
            }

            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 101;
LABEL_14:

  }
  else
  {
    v9 = 101;
  }

  return v9;
}

- (int)_removeCredentialIdentity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("DELETE FROM credential_identities WHERE service_id = ? AND service_id_type = ? AND external_record_id = ? AND user = ? AND identity_type = ?"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13[0] = objc_msgSend(v4, "serviceIdentifierType");
    objc_msgSend(v4, "externalRecordIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "user");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "type");
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v5, &v12, v13, &v11, &v10, &v9);

    v6 = objc_msgSend(v5, "execute");
    if (v6 != 101)
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteStore database](self, "database");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[SFExternalCredentialIdentityStore _removeCredentialIdentity:].cold.1();
      }

    }
    objc_msgSend(v5, "reset");

  }
  else
  {
    v6 = 101;
  }

  return v6;
}

- (int)_removeAllCredentialIdentities
{
  void *v3;
  int v4;
  NSObject *v5;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("DELETE FROM credential_identities"));

  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteStore database](self, "database");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFExternalCredentialIdentityStore _removeAllCredentialIdentities].cold.1();
    }

  }
  return v4;
}

- (int)_vacuum
{
  void *v3;
  int v4;
  NSObject *v5;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("VACUUM"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteStore database](self, "database");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFExternalCredentialIdentityStore _vacuum].cold.1();
    }

  }
  return v4;
}

- (int)_saveCredentialIdentities:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
      v9 = objc_msgSend(v8, "rowIdentifier", (_QWORD)v13);
      if (v9 == -1)
        v9 = -[SFExternalCredentialIdentityStore _rowIDOfCredentialIdentityIfExists:](self, "_rowIDOfCredentialIdentityIfExists:", v8);
      if (v9 == -1)
      {
        v10 = -[SFExternalCredentialIdentityStore _insertCredentialIdentity:](self, "_insertCredentialIdentity:", v8);
      }
      else
      {
        objc_msgSend(v8, "setRowIdentifier:");
        v10 = -[SFExternalCredentialIdentityStore _updateCredentialIdentity:](self, "_updateCredentialIdentity:", v8);
      }
      v11 = v10;
      if (v10 != 101)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v11 = 101;
  }

  return v11;
}

- (int)_insertCredentialIdentity:(id)a3
{
  id v4;
  const __CFString *v5;
  int v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  NSObject *v10;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = objc_msgSend(v4, "type");
  v5 = &stru_24C9367F0;
  v6 = 1;
  switch(v24)
  {
    case 0:
      goto LABEL_15;
    case 1:
    case 4:
      v5 = CFSTR("INSERT INTO credential_identities (identity_type, service_id, service_id_type, external_record_id, user, rank) VALUES (?, ?, ?, ?, ?, ?)");
      goto LABEL_4;
    case 2:
      v5 = CFSTR("INSERT INTO credential_identities (identity_type, service_id, service_id_type, external_record_id, user, rank, credential_id, user_handle) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
      goto LABEL_4;
    default:
LABEL_4:
      -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
      switch(v24)
      {
        case 0:
          goto LABEL_14;
        case 1:
          objc_msgSend(v4, "serviceIdentifier");
          v23 = objc_claimAutoreleasedReturnValue();
          v25[0] = objc_msgSend(v4, "serviceIdentifierType");
          objc_msgSend(v4, "externalRecordIdentifier");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "user");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "rank");
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v7, &v24, &v23, v25, &v22, &v21, &v20);

          v8 = &v23;
          goto LABEL_8;
        case 2:
          objc_msgSend(v4, "serviceIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v25[0] = objc_msgSend(v4, "serviceIdentifierType");
          objc_msgSend(v4, "externalRecordIdentifier");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "user");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "rank");
          objc_msgSend(v4, "credentialID");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "userHandle");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v7, &v24, &v19, v25, &v18, &v17, &v20, &v16, &v15);

          v8 = &v19;
          goto LABEL_8;
        case 4:
          objc_msgSend(v4, "serviceIdentifier");
          v14 = objc_claimAutoreleasedReturnValue();
          v25[0] = objc_msgSend(v4, "serviceIdentifierType");
          objc_msgSend(v4, "externalRecordIdentifier");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "user");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "rank");
          SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v7, &v24, &v14, v25, &v13, &v12, &v20);

          v8 = &v14;
LABEL_8:

          break;
        default:
          break;
      }
      v6 = objc_msgSend(v7, "execute");
      if (v6 == 101)
      {
        -[WBSSQLiteStore database](self, "database");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setRowIdentifier:", objc_msgSend(v9, "lastInsertRowID"));

        objc_msgSend(v7, "reset");
        v6 = 101;
      }
      else
      {
        v10 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteStore database](self, "database");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[SFExternalCredentialIdentityStore _insertCredentialIdentity:].cold.1();
        }

        objc_msgSend(v7, "reset");
      }
LABEL_14:

LABEL_15:
      return v6;
  }
}

- (int)_updateCredentialIdentity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 0;
  v23 = objc_msgSend(v4, "type");
  v6 = 1;
  switch(v23)
  {
    case 0:
      goto LABEL_11;
    case 1:
      -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ? WHERE id = ?"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceIdentifier");
      v22 = objc_claimAutoreleasedReturnValue();
      v24[0] = objc_msgSend(v4, "serviceIdentifierType");
      objc_msgSend(v4, "externalRecordIdentifier");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "user");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "rank");
      v18 = objc_msgSend(v4, "rowIdentifier");
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v5, &v23, &v22, v24, &v21, &v20, &v19, &v18);

      v7 = (id)v22;
      goto LABEL_5;
    case 2:
      v7 = v4;
      -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ?, credential_id = ?, user_handle = ? WHERE id = ?"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceIdentifier");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v24[0] = objc_msgSend(v7, "serviceIdentifierType");
      objc_msgSend(v7, "externalRecordIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "user");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v7, "rank");
      objc_msgSend(v7, "credentialID");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userHandle");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v7, "rowIdentifier");
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v5, &v23, &v17, v24, &v16, &v15, &v19, &v14, &v13, &v18);

      goto LABEL_5;
    case 4:
      -[WBSSQLiteStatementCache statementForQuery:error:](self->_statements, "statementForQuery:error:", CFSTR("UPDATE credential_identities SET identity_type = ?, service_id = ?, service_id_type = ?, external_record_id = ?, user = ?, rank = ? WHERE id = ?"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v24[0] = objc_msgSend(v4, "serviceIdentifierType");
      objc_msgSend(v4, "externalRecordIdentifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "user");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "rank");
      v18 = objc_msgSend(v4, "rowIdentifier");
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v5, &v23, &v12, v24, &v11, &v10, &v19, &v18);

      v7 = (id)v12;
LABEL_5:

      break;
    default:
      break;
  }
  v6 = objc_msgSend(v5, "execute");
  if (v6 == 101)
  {
    objc_msgSend(v5, "reset");
    v6 = 101;
  }
  else
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteStore database](self, "database");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[SFExternalCredentialIdentityStore _updateCredentialIdentity:].cold.1();
    }

    objc_msgSend(v5, "reset");
  }
LABEL_11:

  return v6;
}

- (void)fetchCredentialIdentitiesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __77__SFExternalCredentialIdentityStore_fetchCredentialIdentitiesWithCompletion___block_invoke;
    v7[3] = &unk_24C935C48;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __77__SFExternalCredentialIdentityStore_fetchCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_fetchCredentialIdentities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__SFExternalCredentialIdentityStore_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke;
    block[3] = &unk_24C935C70;
    v12 = v7;
    block[4] = self;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

void __97__SFExternalCredentialIdentityStore_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a1[5];
  v1 = a1[6];
  v3 = (void *)a1[4];
  +[_SFCredentialIdentityTypeMatcher singleType:](_SFCredentialIdentityTypeMatcher, "singleType:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fetchCredentialIdentitiesMatchingDomains:credentialIdentityType:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

- (void)fetchPasskeyCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__SFExternalCredentialIdentityStore_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke;
    block[3] = &unk_24C935C70;
    v12 = v7;
    block[4] = self;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

void __96__SFExternalCredentialIdentityStore_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a1[5];
  v1 = a1[6];
  v3 = (void *)a1[4];
  +[_SFCredentialIdentityTypeMatcher singleType:](_SFCredentialIdentityTypeMatcher, "singleType:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fetchCredentialIdentitiesMatchingDomains:credentialIdentityType:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

- (void)fetchAllPasskeyCredentialIdentitiesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __87__SFExternalCredentialIdentityStore_fetchAllPasskeyCredentialIdentitiesWithCompletion___block_invoke;
    v7[3] = &unk_24C935C48;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __87__SFExternalCredentialIdentityStore_fetchAllPasskeyCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_fetchCredentialIdentitiesWithType:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __100__SFExternalCredentialIdentityStore_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke;
    block[3] = &unk_24C935C70;
    v12 = v7;
    block[4] = self;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

void __100__SFExternalCredentialIdentityStore_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a1[5];
  v1 = a1[6];
  v3 = (void *)a1[4];
  +[_SFCredentialIdentityTypeMatcher singleType:](_SFCredentialIdentityTypeMatcher, "singleType:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fetchCredentialIdentitiesMatchingDomains:credentialIdentityType:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

- (id)_credentialIdentityFromRow:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __objc2_class **v13;
  SFPasskeyCredentialIdentity *v14;
  SFPasskeyCredentialIdentity *v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "int64AtIndex:", 0);
  objc_msgSend(v3, "stringAtIndex:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "int64AtIndex:", 3);
  objc_msgSend(v3, "stringAtIndex:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAtIndex:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "int64AtIndex:", 6);
  objc_msgSend(v3, "stringAtIndex:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAtIndex:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "int64AtIndex:", 1);
  switch(v12)
  {
    case 1:
      v13 = off_24C934B60;
      break;
    case 2:
      v14 = -[SFPasskeyCredentialIdentity initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:credentialID:userHandle:]([SFPasskeyCredentialIdentity alloc], "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:credentialID:userHandle:", v4, v5, v6, v7, v8, v9, v10, v11);
      goto LABEL_8;
    case 4:
      v13 = off_24C934B50;
      break;
    default:
      v15 = 0;
      goto LABEL_10;
  }
  v14 = (SFPasskeyCredentialIdentity *)objc_msgSend(objc_alloc(*v13), "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:", v4, v5, v6, v7, v8, v9);
LABEL_8:
  v15 = v14;
LABEL_10:

  return v15;
}

- (id)_fetchCredentialIdentitiesMatchingDomains:(id)a3 credentialIdentityType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33 = a4;
  v31 = v6;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
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
          objc_msgSend(v12, "safari_highLevelDomainFromHost");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            v15 = (void *)v13;
          else
            v15 = v12;
          v16 = v15;

          objc_msgSend(v16, "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v9);
    }

    v18 = objc_alloc(MEMORY[0x24BE82D98]);
    -[WBSSQLiteStore database](self, "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v18, "initWithDatabase:query:", v19, CFSTR("SELECT * FROM credential_identities WHERE sf_identity_matches_domains(service_id, service_id_type, ?) == 1"));

    sqlite3_bind_pointer((sqlite3_stmt *)objc_msgSend(v32, "handle"), 1, v7, "domainSet", 0);
    objc_msgSend(v32, "fetch");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v33, "matchAllTypes");
    v22 = objc_msgSend(v33, "typeToMatch");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v30;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v23);
          -[SFExternalCredentialIdentityStore _credentialIdentityFromRow:](self, "_credentialIdentityFromRow:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27 && ((v21 & 1) != 0 || objc_msgSend(v27, "type") == v22))
            objc_msgSend(v20, "addObject:", v28);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v24);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v20;
}

- (int64_t)_rowIDOfCredentialIdentityIfExists:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE82D98]);
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDatabase:query:", v6, CFSTR("SELECT * FROM credential_identities WHERE service_id = ? AND service_id_type = ? AND user = ? AND identity_type = ?"));

  objc_msgSend(v4, "serviceIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "serviceIdentifierType");
  objc_msgSend(v4, "user");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "type");
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},long>(v7, &v16, &v15, &v14, &v13);

  objc_msgSend(v7, "fetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "int64AtIndex:", 0);
  else
    v11 = -1;

  return v11;
}

- (id)_fetchCredentialIdentities
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v4, CFSTR("SELECT * FROM credential_identities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        -[SFExternalCredentialIdentityStore _credentialIdentityFromRow:](self, "_credentialIdentityFromRow:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_fetchCredentialIdentitiesWithType:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE82D98]);
  -[WBSSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDatabase:query:", v7, CFSTR("SELECT * FROM credential_identities WHERE identity_type = ?"));

  objc_msgSend(v8, "bindInt64:atParameterIndex:", a3, 1);
  objc_msgSend(v8, "fetch");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        -[SFExternalCredentialIdentityStore _credentialIdentityFromRow:](self, "_credentialIdentityFromRow:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && objc_msgSend(v13, "type") == a3)
          objc_msgSend(v5, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v5;
}

- (void)fetchStoreEmptyStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __72__SFExternalCredentialIdentityStore_fetchStoreEmptyStateWithCompletion___block_invoke;
    v7[3] = &unk_24C935C48;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __72__SFExternalCredentialIdentityStore_fetchStoreEmptyStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_fetchStoreIsEmpty"));
}

- (BOOL)_fetchStoreIsEmpty
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[WBSSQLiteStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v2, CFSTR("SELECT EXISTS(SELECT 1 FROM credential_identities)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "int64AtIndex:", 0) < 1;
  else
    v5 = 1;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statements, 0);
}

void __135__SFExternalCredentialIdentityStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_20E365000, a2, OS_LOG_TYPE_ERROR, "Failed to open credential identities database with error %ld", (uint8_t *)&v3, 0xCu);
}

void __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_1(void *a1, uint64_t a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_0((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v3, v4, "Failed to create index on identities table with error %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

void __63__SFExternalCredentialIdentityStore__createFreshDatabaseSchema__block_invoke_cold_2(void *a1, uint64_t a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_0((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v3, v4, "Failed to create identities table with error %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)_migrateToSchemaVersion:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20E365000, a2, OS_LOG_TYPE_ERROR, "Failed to commit the transaction while migrating database to schema version %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateToSchemaVersion:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Failed to start a transaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __61__SFExternalCredentialIdentityStore__migrateToSchemaVersion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Failed to roll back transaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_removeCredentialIdentities:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v4, v5, "Failed to delete an entry from identities table with error %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)_removeCredentialIdentity:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v4, v5, "Failed to delete an item from identities table with error %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)_removeAllCredentialIdentities
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v4, v5, "Failed to delete entries from identities table with error %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)_vacuum
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v4, v5, "Failed to vacuum identities table with error %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)_insertCredentialIdentity:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v4, v5, "Failed to insert an item into identities table with error %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)_updateCredentialIdentity:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_20E365000, v4, v5, "Failed to update an item of identities table with error %{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

@end
