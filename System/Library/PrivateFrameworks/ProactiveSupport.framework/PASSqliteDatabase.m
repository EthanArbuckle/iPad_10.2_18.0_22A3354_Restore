@implementation PASSqliteDatabase

void __47___PASSqliteDatabase_prepQuery_onPrep_onError___block_invoke(uint64_t a1)
{
  const char *v2;
  sqlite3 *v3;
  uint32_t v4;
  NSObject *v5;
  uint64_t v6;
  useconds_t v7;
  void *v8;
  void *v9;
  _PASSqliteStatement *v10;
  _PASSqliteStatement *v11;
  void *v12;
  uint64_t v13;
  sqlite3_stmt *v14;
  int v15;
  _PASSqliteStatement *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  unsigned int v22;
  char v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  sqlite3_stmt *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  id v41;
  id v42;
  sqlite3_stmt *ppStmt;
  uint8_t buf[16];
  _BYTE pzTail[12];
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_prepareForFirstQuery");
  objc_msgSend(*(id *)(a1 + 32), "_logQueryPlanForQuery:", *(_QWORD *)(a1 + 40));
  v42 = 0;
  ppStmt = 0;
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("_PASSqliteDatabase.m"), 1211, CFSTR("query string %@ is not Unicode"), *(_QWORD *)(a1 + 40));

    goto LABEL_3;
  }
  if ((-[_PASSqliteStatementCache checkOutStatement:associatedObject:withSQL:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), &ppStmt, &v42, v2) & 1) == 0)
  {
LABEL_3:
    *(_QWORD *)pzTail = 0;
    v3 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int sqlite3_prepare_v2_nolock(sqlite3 *, const char *, int, sqlite3_stmt **, const char **)");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("_PASSqliteDatabase.m"), 1148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("db"));

    }
    v4 = 10;
    v5 = MEMORY[0x1E0C81028];
    while (1)
    {
      v6 = sqlite3_prepare_v2(v3, v2, -1, &ppStmt, (const char **)pzTail);
      if (v6 != 6)
        break;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1A0957000, v5, OS_LOG_TYPE_DEBUG, "Sqlite database locked. Backing off and retrying prepare statement.", buf, 2u);
      }
      v7 = arc4random_uniform(v4);
      usleep(v7);
      v4 <<= v4 >> 5 < 0x271;
    }
    v8 = *(void **)(a1 + 32);
    if ((_DWORD)v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v8, "handleError:sqliteError:forQuery:onError:", 3, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else if (objc_msgSend(v8, "_isLikelySQLStatementContainedInString:", *(_QWORD *)pzTail))
    {
      if (ppStmt)
      {
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_PASSqliteDatabase rejected query containing multiple statements: %@"), *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "handleError:sqliteError:forQuery:onError:", 3, 21, v9, *(_QWORD *)(a1 + 48));

    }
  }
  if (!ppStmt)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v39 = *(_QWORD *)(a1 + 40);
      v40 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      *(_DWORD *)pzTail = 138412546;
      *(_QWORD *)&pzTail[4] = v39;
      v46 = 2080;
      v47 = v40;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to prepare sql statement '%@': %s", pzTail, 0x16u);
    }
    v11 = 0;
    goto LABEL_43;
  }
  v10 = [_PASSqliteStatement alloc];
  v11 = -[_PASSqliteStatement initWithStatementPointer:columnMapping:](v10, "initWithStatementPointer:columnMapping:", ppStmt, v42);
  v12 = (void *)MEMORY[0x1A1AFDC98]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_autoreleasePoolPop(v12);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v14 = ppStmt;
  -[_PASSqliteStatement columnMapping](v11, "columnMapping");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_42;
  v15 = -[_PASSqliteStatementCache crc32ForStatement:](v14);
  v16 = v11;
  v17 = 0;
  v18 = 0;
  v19 = v13 + 8;
  v20 = (char *)(v13 + 12);
  v21 = -1;
  do
  {
    v22 = *v20;
    if (*((_DWORD *)v20 - 1) == v15)
    {
      if (v22 <= 0xF7)
        v23 = -9;
      else
        v23 = *v20;
      *v20 = v22 + ~v23;
      v21 = v17;
    }
    else
    {
      if (*v20)
      {
        if (v22 == 9)
        {
          -[_PASSqliteStatementCache evictCachedStatementForScoreSlot:](v13, v17);
          LOBYTE(v22) = *v20;
        }
        LOBYTE(v22) = v22 - 1;
        *v20 = v22;
      }
      if (*(unsigned __int8 *)(v19 + 8 * v18 + 4) > v22)
        v18 = v17;
    }
    ++v17;
    v20 += 8;
  }
  while (v17 != 32);
  if (v21 == -1)
  {
    -[_PASSqliteStatementCache evictCachedStatementForScoreSlot:](v13, v18);
    v11 = v16;
    v29 = v19 + 8 * v18;
    *(_DWORD *)v29 = v15;
    *(_BYTE *)(v29 + 4) = 8;
    goto LABEL_42;
  }
  v11 = v16;
  if (*(unsigned __int8 *)(v19 + 8 * v21 + 4) < 9u)
  {
LABEL_42:

    sqlite3_finalize(ppStmt);
    goto LABEL_43;
  }
  v24 = 0;
  v25 = *(_DWORD *)(v19 + 8 * v21);
  v26 = v13 + 264;
  while (1)
  {
    v27 = *(sqlite3_stmt **)(v26 + 8 * v24);
    if (v27)
    {
      if (-[_PASSqliteStatementCache crc32ForStatement:](v27) == v25)
        break;
    }
    if (++v24 == 8)
      goto LABEL_37;
  }
  if ((_DWORD)v24 != -1)
  {
    sqlite3_finalize(*(sqlite3_stmt **)(v26 + 8 * (int)v24));
    v30 = v13 + 8 * (int)v24;
    v31 = *(const void **)(v30 + 328);
    if (v31)
      CFRelease(v31);
    sqlite3_reset(v14);
    sqlite3_clear_bindings(v14);
    v32 = (_QWORD *)(v30 + 328);
    *(_QWORD *)(v26 + 8 * (int)v24) = v14;
    v33 = v41;
    v34 = v41;
    goto LABEL_49;
  }
LABEL_37:
  v28 = 0;
  while (*(_QWORD *)(v26 + 8 * v28))
  {
    if (++v28 == 8)
      goto LABEL_42;
  }
  sqlite3_reset(v14);
  sqlite3_clear_bindings(v14);
  *(_QWORD *)(v26 + 8 * v28) = v14;
  v33 = v41;
  v35 = v41;
  v32 = (_QWORD *)(v13 + 8 * v28 + 328);
LABEL_49:
  *v32 = v33;

LABEL_43:
}

void __44___PASSqliteDatabase__logQueryPlanForQuery___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  FILE *v8;
  id v9;
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 136))
  {
    objc_msgSend(*(id *)(v1 + 128), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setObject:forKey:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 40));
      getQueryPlan(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v10;
      if (!v4)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v10);
        fprintf(*(FILE **)(*(_QWORD *)(a1 + 32) + 136), "EXPLAIN QUERY PLAN\n%s\n\n%s\n\n", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          v7 = 0;
          do
          {
            v8 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
            objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
            v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            fprintf(v8, "%s\n", (const char *)objc_msgSend(v9, "UTF8String"));

            ++v7;
          }
          while (objc_msgSend(v6, "count") > v7);
        }
        fwrite("\n\n----------\n\n", 0xEuLL, 1uLL, *(FILE **)(*(_QWORD *)(a1 + 32) + 136));

        v5 = v10;
      }

    }
  }
}

void __45___PASSqliteDatabase_runQuery_onRow_onError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  char *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  const char *v14;
  _BOOL4 v15;
  sqlite3 *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = 0;
  v4 = 50;
  do
  {
    while (1)
    {
      while (1)
      {
        v5 = sqlite3_step((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "stmt"));
        if ((v3 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "prepareToRunQuery");
        v6 = v5;
        if (v5 > 0x63u)
          break;
        if (v5 == 5)
        {
          if ((v4 & 0x80000000) == 0)
            goto LABEL_21;
        }
        else
        {
          if (v5 != 6)
            goto LABEL_14;
          if (v4 >= 1)
          {
            usleep(0x186A0u);
            goto LABEL_21;
          }
        }
        v10 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_sql((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "stmt")));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v10, "handleError:sqliteError:forQuery:onError:", 4, v5, v11, 0);

LABEL_21:
        --v4;
        v3 = 1;
      }
      if (v5 != 100)
        break;
      v3 = 1;
      if (*(_QWORD *)(a1 + 48))
      {
        v7 = (void *)MEMORY[0x1A1AFDC98]();
        objc_msgSend(*(id *)(a1 + 32), "prepareForRowDeserialization");
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          objc_autoreleasePoolPop(v7);
          goto LABEL_28;
        }
        objc_autoreleasePoolPop(v7);
      }
    }
    if (v5 == 101)
      break;
LABEL_14:
    v8 = (char *)sqlite3_sql((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "stmt"));
    if (v8)
      v8 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "handleError:sqliteError:forQuery:onError:", 4, v5, v8, *(_QWORD *)(a1 + 56));
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

    if (!v9)
      goto LABEL_28;
    v3 = 1;
  }
  while ((v6 - 5) < 2);
  objc_msgSend(v2, "timeIntervalSinceNow");
  v13 = v12;
  if (v12 < -0.5 && os_variant_has_internal_diagnostics())
  {
    v14 = sqlite3_sql((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "stmt"));
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v15)
      {
        v16 = *(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        getQueryPlan(v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = v13 * -1000.0;
        v21 = 2080;
        v22 = v14;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Slow query (%0.2f ms): %s\n%@", (uint8_t *)&v19, 0x20u);

      }
    }
    else if (v15)
    {
      v19 = 134217984;
      v20 = v13 * -1000.0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Slow query (%0.2f ms) -- unknown SQL", (uint8_t *)&v19, 0xCu);
    }
  }
LABEL_28:

}

void __59___PASSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "runQuery:onRow:onError:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  char v5;
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 16);
  if (v3 <= 0)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend((id)v2, "_txnBeginExclusive");
      v5 = 1;
    }
    else
    {
      objc_msgSend((id)v2, "_txnBegin");
      v5 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = v5;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 0;
  }
  else if (*(_BYTE *)(a1 + 64) && !*(_BYTE *)(v2 + 112))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_PASSqliteDatabase.m"), 1483, CFSTR("Read transaction now wants to write"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke_2;
  v10[3] = &unk_1E44311E8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v6 = (void (**)(_QWORD))MEMORY[0x1A1AFDE78](v10);
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v7 = (void *)MEMORY[0x1A1AFDC98]();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32))
    v6[2](v6);
  v9 = *(_QWORD *)(a1 + 32);
  if (v3 <= 0 && !*(_BYTE *)(v9 + 20))
  {
    objc_msgSend((id)v9, "_txnEnd");
    v9 = *(_QWORD *)(a1 + 32);
  }
  --*(_DWORD *)(v9 + 16);

}

uint64_t __44___PASSqliteDatabase_frailWriteTransaction___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __39___PASSqliteDatabase_writeTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __43___PASSqliteDatabase_frailReadTransaction___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __38___PASSqliteDatabase_readTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __45___PASSqliteDatabase_disableQueryPlanLogging__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 136))
  {
    v2 = result;
    v3 = *(void **)(v1 + 120);
    *(_QWORD *)(v1 + 120) = 0;

    v4 = *(_QWORD *)(v2 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = 0;

    result = fclose(*(FILE **)(*(_QWORD *)(v2 + 32) + 136));
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 136) = 0;
  }
  return result;
}

void __53___PASSqliteDatabase_enableQueryPlanLoggingWithPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const std::__fs::filesystem::path *v6;
  id v7;
  const std::__fs::filesystem::path *v8;
  std::error_code *v9;
  int v10;
  uint64_t v11;
  int *v12;
  char *v13;
  int v14;
  uint64_t v15;
  FILE *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  int *v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disableQueryPlanLogging");
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
  v7 = objc_retainAutorelease(v5);
  v8 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "fileSystemRepresentation");
  rename(v6, v8, v9);
  if (v10)
  {
    if (*__error() != 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = __error();
      v13 = strerror(*v12);
      v14 = *__error();
      v28 = 138413058;
      v29 = v11;
      v30 = 2112;
      v31 = (char *)v7;
      v32 = 2080;
      v33 = v13;
      v34 = 1024;
      v35 = v14;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to rename stale EXPLAIN QUERY PLAN logfile \"%@\" --> \"%@\": %s (%d)", (uint8_t *)&v28, 0x26u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 40);
    v28 = 138412546;
    v29 = v15;
    v30 = 2112;
    v31 = (char *)v7;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "To avoid overwrite, renaming stale EXPLAIN QUERY PLAN logfile \"%@\" --> \"%@\", (uint8_t *)&v28, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = fopen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), "w");
  v16 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
  if (v16)
  {
    setlinebuf(v16);
    v17 = objc_opt_new();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 120);
    *(_QWORD *)(v18 + 120) = v17;

    v20 = objc_opt_new();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 128);
    *(_QWORD *)(v21 + 128) = v20;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setCountLimit:", 100);
    v23 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 40);
      v25 = __error();
      v26 = strerror(*v25);
      v27 = *__error();
      v28 = 138412802;
      v29 = v24;
      v30 = 2080;
      v31 = v26;
      v32 = 1024;
      LODWORD(v33) = v27;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to open EXPLAIN QUERY PLAN logfile \"%@\": %s (%d)", (uint8_t *)&v28, 0x1Cu);
    }
    v23 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;

}

uint64_t __42___PASSqliteDatabase_languageForFTSTable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":table", *(_QWORD *)(a1 + 32));
}

uint64_t __42___PASSqliteDatabase_languageForFTSTable___block_invoke_2(uint64_t a1, id a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _PAS_sqlite3_column_nsstring((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(a2), "stmt"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = v3;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "languageForFTSTable: sql: %@", (uint8_t *)&v15, 0xCu);
  }
  v4 = v3;
  v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("language=\"), 2);
  if (v6
    && (v7 = v5 + v6,
        v8 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("\"), 2, v7, objc_msgSend(v4, "length") - v7),
        v9))
  {
    objc_msgSend(v4, "substringWithRange:", v7, v8 - v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v15 = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "languageForFTSTable: language: %@", (uint8_t *)&v15, 0xCu);
  }

  return 1;
}

uint64_t __42___PASSqliteDatabase_languageForFTSTable___block_invoke_199(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error during languageForFTSTable: %@", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

uint64_t __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke(uint64_t a1, id a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(a2), "stmt"), 0);
  return 1;
}

uint64_t __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase unable to count rows in table %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return 1;
}

uint64_t __36___PASSqliteDatabase_hasIndexNamed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNonnullNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __36___PASSqliteDatabase_hasIndexNamed___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

uint64_t __45___PASSqliteDatabase_hasColumnOnTable_named___block_invoke(uint64_t a1, id a2)
{
  uint64_t v3;
  void *v4;

  v3 = 1;
  _PAS_sqlite3_column_nsstring((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(a2), "stmt"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  else
    v3 = 0;

  return v3;
}

void __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke(uint64_t a1, id a2)
{
  id v3;
  sqlite3_stmt *v4;
  void *v5;
  id v6;
  sqlite3_stmt *v7;
  id v8;

  v3 = objc_retainAutorelease(a2);
  v4 = (sqlite3_stmt *)objc_msgSend(v3, "stmt");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%%(%@ %%"), *(_QWORD *)(a1 + 32));
  _PAS_sqlite3_bind_nsstring(v4, 1, v5);

  v6 = objc_retainAutorelease(v3);
  v7 = (sqlite3_stmt *)objc_msgSend(v6, "stmt");

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%%,%@ %%"), *(_QWORD *)(a1 + 32));
  _PAS_sqlite3_bind_nsstring(v7, 2, v8);

}

uint64_t __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke_2(uint64_t a1, id a2)
{
  void *v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _PAS_sqlite3_column_nsstring((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(a2), "stmt"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get table name containing column '%@'", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

uint64_t __36___PASSqliteDatabase_hasTableNamed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNonnullNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __36___PASSqliteDatabase_hasTableNamed___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

uint64_t __37___PASSqliteDatabase_setUserVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase unable to set pragma user_version to %u: %@", (uint8_t *)v6, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

  return 1;
}

uint64_t __33___PASSqliteDatabase_userVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  v4 = sqlite3_column_int((sqlite3_stmt *)objc_msgSend(v3, "stmt"), 0);
  if (v4 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "_PASSqliteDatabase read negative pragma user_version: %d", (uint8_t *)v6, 8u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

  return 1;
}

uint64_t __33___PASSqliteDatabase_userVersion__block_invoke_173(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase unable to read pragma user_version: %@", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

void __37___PASSqliteDatabase_createSnapshot___block_invoke(uint64_t a1)
{
  sqlite3_backup *v2;
  sqlite3_backup *v3;
  unsigned int v4;
  char v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_backup_init(*(sqlite3 **)(a1 + 64), "main", *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "main");
  if (v2)
  {
    v3 = v2;
    do
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_backup_step(v3, -1);
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    while (v4 <= 6 && ((1 << v4) & 0x61) != 0);
    if (v4 != 101)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Sqlite3 backup failed.", (uint8_t *)&v8, 2u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_backup_finish(v3);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v6 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Sqlite3 backup finish failed.", (uint8_t *)&v8, 2u);
        v6 = 0;
      }
    }
    else
    {
      v6 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Sqlite3 backup saved to \"%@\".", (uint8_t *)&v8, 0xCu);
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to initialize sqlite3 backup.", (uint8_t *)&v8, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

_BYTE *__62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[20])
  {
    result = (_BYTE *)objc_msgSend(result, "_txnRollback");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 1;
  }
  return result;
}

uint64_t __73___PASSqliteDatabase_selectColumns_fromTable_whereClause_onPrep_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = a1;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    v18 = *MEMORY[0x1E0C99768];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v11 = objc_retainAutorelease(v3);
        switch(sqlite3_column_type((sqlite3_stmt *)objc_msgSend(v11, "stmt"), v7 + v9))
        {
          case 1:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + (int)v9));
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 2:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + (int)v9));
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 3:
            _PAS_sqlite3_column_nsstring((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + v9);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 4:
            _PAS_sqlite3_column_nsdata((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + v9);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 5:
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v13 = (void *)v12;
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

            break;
          default:
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v14 = sqlite3_column_type((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + v9);
              *(_DWORD *)buf = 67109120;
              v25 = v14;
              _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected sqlite data type: %d", buf, 8u);
            }
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v18, CFSTR("Unexpected sqlite data type: %d"), sqlite3_column_type((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + v9));
            break;
        }
        ++v9;
      }
      while (v6 != v9);
      v7 += v9;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      v6 = v15;
    }
    while (v15);
  }

  objc_msgSend(*(id *)(v17 + 40), "addObject:", v4);
  return 0;
}

void __66___PASSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      v4 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        sqlite3_bind_null((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v13), "stmt"), ++v3);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _PAS_sqlite3_bind_nsstring((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v13), "stmt"), ++v3, v6);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            _PAS_sqlite3_bind_nsdata((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v13), "stmt"), ++v3, v6);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "bindParam:toNSNumber:", ++v3, v6);
            }
            else
            {
              if (!objc_msgSend(v6, "conformsToProtocol:", &unk_1EE5ADC18))
              {
                v9 = (void *)MEMORY[0x1E0C99DA0];
                v14 = CFSTR("type");
                objc_msgSend((id)objc_opt_class(), "description");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v15[0] = v10;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("TypeError"), CFSTR("Could not insert this type into sqlite"), v11);
                v12 = (id)objc_claimAutoreleasedReturnValue();

                objc_exception_throw(v12);
              }
              _PAS_sqlite3_bind_nssecurecoding((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v13), "stmt"), ++v3, v6);
            }
          }
        }
      }

      objc_autoreleasePoolPop(v4);
    }
    while (objc_msgSend(*(id *)(a1 + 32), "count") > v3);
  }

}

uint64_t __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

uint64_t __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_91(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

uint64_t __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_94(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

uint64_t __41___PASSqliteDatabase_valueForPragmaName___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return 1;
}

uint64_t __41___PASSqliteDatabase_valueForPragmaName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: unable to fetch %@: %@", (uint8_t *)&v6, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;

  return 1;
}

sqlite3_int64 __37___PASSqliteDatabase_lastInsertRowId__block_invoke(uint64_t a1)
{
  sqlite3_int64 result;

  result = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43___PASSqliteDatabase__prepareForFirstQuery__block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to set temp_store to MEMORY: %@", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

uint64_t __64___PASSqliteDatabase_initWithFilename_flags_error_errorHandler___block_invoke(uint64_t a1)
{
  sqlite3_close(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
  return ITSCollationContextFreeContextForDatabaseHandle();
}

uint64_t __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

uint64_t __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

uint64_t __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

@end
