@implementation SHSQLiteUtils

+ (BOOL)createDatabase:(sqlite3 *)a3 atURL:(id)a4 error:(id *)a5
{
  id v8;
  int v9;
  BOOL result;

  objc_msgSend(a4, "absoluteString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = sqlite3_open((const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4), a3);

  if (v9)
  {
    sh_databaseErrorToNSError(*a3, 200, a5);
    +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", *a3, 0);
    result = 0;
    *a3 = 0;
  }
  else if ((objc_msgSend(a1, "defenseAgainstBadDatabase:", *a3) & 1) != 0)
  {
    return 1;
  }
  else
  {
    +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", *a3, 0);
    return 0;
  }
  return result;
}

+ (BOOL)openDatabase:(sqlite3 *)a3 atURL:(id)a4 error:(id *)a5
{
  id v8;
  int v9;
  BOOL v10;

  objc_msgSend(a4, "absoluteString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = sqlite3_open_v2((const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4), a3, 1, 0);

  if (v9)
  {
    sh_databaseErrorToNSError(*a3, 200, a5);
    +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", *a3, 0);
    v10 = 0;
    *a3 = 0;
  }
  else
  {
    v10 = 1;
    sqlite3_create_collation(*a3, (const char *)objc_msgSend(SHInsightsCustomCollation, "cStringUsingEncoding:", 4), 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))sh_CaseDiacriticInsensitiveCollation);
    if ((objc_msgSend(a1, "defenseAgainstBadDatabase:", *a3) & 1) == 0)
    {
      +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", *a3, 0);
      return 0;
    }
  }
  return v10;
}

+ (BOOL)defenseAgainstBadDatabase:(sqlite3 *)a3
{
  char v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t v17[4];
  id v18;
  __int128 buf;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sqlite3_db_config(a3, 1003, 0, 0);
  sqlite3_db_config(a3, 1015, 0, 0);
  v16 = 0;
  v5 = objc_msgSend(a1, "runNoResultSQL:onDatabase:error:", CFSTR("PRAGMA cell_size_check=ON"), a3, &v16);
  v6 = v16;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x2020000000;
    v21 = 0;
    v14 = v6;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43__SHSQLiteUtils_defenseAgainstBadDatabase___block_invoke;
    v15[3] = &unk_24DCD2520;
    v15[4] = &buf;
    v8 = objc_msgSend(a1, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", CFSTR("PRAGMA quick_check"), a3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v15, &v14);
    v9 = v14;

    if (v8 && *(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v10 = 1;
    }
    else
    {
      shcore_log_object();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_21A508000, v12, OS_LOG_TYPE_ERROR, "Failed to run quick check %@", v17, 0xCu);
      }

      v10 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    shcore_log_object();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_21A508000, v11, OS_LOG_TYPE_ERROR, "Failed to turn on cell_size_check %@", (uint8_t *)&buf, 0xCu);
    }

    v10 = 0;
    v9 = v7;
  }

  return v10;
}

void __43__SHSQLiteUtils_defenseAgainstBadDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  sh_columnToText(a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "isEqualToString:", CFSTR("ok"));

}

+ (BOOL)closeDatabase:(sqlite3 *)a3 error:(id *)a4
{
  BOOL v6;
  BOOL v7;

  sqlite3_close(a3);
  if (a3)
    v6 = 1;
  else
    v6 = a4 == 0;
  v7 = v6;
  if (!v6)
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (BOOL)runNoResultSQL:(id)a3 onDatabase:(sqlite3 *)a4 error:(id *)a5
{
  return objc_msgSend(a1, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", a3, a4, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], &__block_literal_global_0, a5);
}

+ (BOOL)runSQL:(id)a3 onDatabase:(sqlite3 *)a4 replacingTokens:(id)a5 withObjects:(id)a6 rowHandler:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  sqlite3 *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  BOOL v36;
  id v38;
  id *v39;
  id v40;
  id v41;
  void (**v42)(id, sqlite3_stmt *);
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  sqlite3_stmt *ppStmt;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v42 = (void (**)(id, sqlite3_stmt *))a7;
  v16 = (void *)objc_msgSend(v13, "mutableCopy");
  if (objc_msgSend(v14, "count"))
  {
    v17 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "queryStringForCount:", objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", v18, v20, 0, 0, objc_msgSend(v16, "length"));

      ++v17;
    }
    while (objc_msgSend(v14, "count") > v17);
  }
  ppStmt = 0;
  v21 = objc_retainAutorelease(v16);
  v22 = a4;
  if (sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v21, "cStringUsingEncoding:", 4), -1, &ppStmt, 0))
    goto LABEL_25;
  v38 = v21;
  v39 = a8;
  v41 = v14;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v40 = v15;
  obj = v15;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v46;
          do
          {
            v33 = 0;
            v34 = v25;
            do
            {
              if (*(_QWORD *)v46 != v32)
                objc_enumerationMutation(v29);
              sqlite3_bind_text(ppStmt, v25 + v33 + 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v33)), "cStringUsingEncoding:", 4), -1, 0);
              ++v33;
            }
            while (v31 != v33);
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
            v25 += v33;
          }
          while (v31);
          v25 = v34 + v33;
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v24);
  }

  v14 = v41;
  v21 = v38;
  a8 = v39;
  v22 = a4;
  while (1)
  {
    v35 = sqlite3_step(ppStmt);
    if (v35 != 100)
      break;
    v42[2](v42, ppStmt);
  }
  v15 = v40;
  if (v35 != 101)
  {
LABEL_25:
    sh_databaseErrorToNSError(v22, 201, a8);
    v36 = 0;
  }
  else
  {
    v36 = 1;
  }
  sqlite3_finalize(ppStmt);

  return v36;
}

+ (BOOL)database:(sqlite3 *)a3 hasPopulatedTable:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v8 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SHSQLiteUtils_database_hasPopulatedTable_error___block_invoke;
  v11[3] = &unk_24DCD2520;
  v11[4] = &v12;
  objc_msgSend(a1, "runSQL:onDatabase:replacingTokens:withObjects:rowHandler:error:", v9, a3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v11, a5);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a5;
}

uint64_t __50__SHSQLiteUtils_database_hasPopulatedTable_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  result = sqlite3_column_int(a2, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (int)result > 0;
  return result;
}

+ (id)queryStringForCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v5 = 0;
    do
    {
      if (v5)
        v6 = CFSTR(", ?");
      else
        v6 = CFSTR("?");
      objc_msgSend(v4, "appendString:", v6);
      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

+ (void)startTransactionOnDatabase:(sqlite3 *)a3
{
  sqlite3_exec(a3, "BEGIN", 0, 0, 0);
}

+ (void)commitTransactionOnDatabase:(sqlite3 *)a3
{
  sqlite3_exec(a3, "COMMIT", 0, 0, 0);
}

@end
