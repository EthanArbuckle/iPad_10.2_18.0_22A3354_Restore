@implementation ICDelegateAccountStoreSchema

+ (int64_t)currentVersion
{
  return 11000;
}

+ (id)dateForValue:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
}

+ (id)defaultDatabasePath
{
  void *v2;
  void *v3;

  MSVMobileHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/com.apple.iTunesCloud/ICDelegateAccountStore.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)setupWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__31864;
  v20 = __Block_byref_object_dispose__31865;
  v21 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ICDelegateAccountStoreSchema_setupWithConnection_error___block_invoke;
  v11[3] = &unk_1E43900D8;
  v7 = v6;
  v12 = v7;
  v13 = &v16;
  v14 = &v22;
  v15 = a1;
  objc_msgSend(v7, "performTransaction:", v11);
  v8 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v8 = *((unsigned __int8 *)v23 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

+ (double)valueForDate:(id)a3
{
  double result;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return result;
}

+ (BOOL)_createDefaultSchemaWithConnection:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_retain((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("CREATE TABLE IF NOT EXISTS account(identity TEXT PRIMARY KEY,storefront TEXT);"),
                         CFSTR("CREATE TABLE IF NOT EXISTS metadata(key TEXT PRIMARY KEY,value TEXT);"),
                         CFSTR("CREATE TABLE IF NOT EXISTS token(account_identity TEXT UNIQUE,type INTEGER NOT NULL,expiration_date REAL,data BLOB NOT NULL);"),
                         CFSTR("CREATE TABLE IF NOT EXISTS delegation_uuid(user_identity TEXT,uuid TEXT,insertion_date REAL,UNIQUE(user_identity, uuid));"),
                         CFSTR("ANALYZE"),
                         0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v17 = v12;
        v14 = objc_msgSend(v5, "executeStatement:error:", v13, &v17);
        v9 = v17;

        if (!v14)
        {

          if (a4)
          {
            v9 = objc_retainAutorelease(v9);
            v15 = 0;
            *a4 = v9;
          }
          else
          {
            v15 = 0;
          }
          goto LABEL_15;
        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v15 = 1;
LABEL_15:

  return v15;
}

uint64_t __58__ICDelegateAccountStoreSchema_setupWithConnection_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v18;
  id obj;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  v6 = *(id *)(a1 + 32);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__31864;
  v33 = __Block_byref_object_dispose__31865;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ____GetUserVersion_block_invoke;
  v20[3] = &unk_1E4390100;
  v20[4] = &v29;
  v20[5] = &v25;
  v20[6] = &v21;
  objc_msgSend(v6, "executeQuery:withResults:", CFSTR("PRAGMA user_version"), v20);
  if (*((_BYTE *)v26 + 24))
  {
    v7 = v22[3];
    v8 = 1;
  }
  else
  {
    v4 = objc_retainAutorelease((id)v30[5]);
    v7 = 0;
    v8 = *((_BYTE *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  objc_storeStrong(v3, v4);
  if (v8)
  {
    if (v7)
    {
      if (v7 == 11000)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      objc_msgSend(*(id *)(a1 + 32), "truncate");
    }
    v9 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v11 + 40);
    v12 = objc_msgSend(v9, "_createDefaultSchemaWithConnection:error:", v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA user_version=%ld"), 11000);
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(id *)(v15 + 40);
      v16 = objc_msgSend(v14, "executeStatement:error:", v13, &v18);
      objc_storeStrong((id *)(v15 + 40), v18);
      if (v16)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

    }
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

@end
