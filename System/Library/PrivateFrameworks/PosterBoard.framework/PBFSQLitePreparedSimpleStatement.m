@implementation PBFSQLitePreparedSimpleStatement

uint64_t __44___PBFSQLitePreparedSimpleStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

void __80___PBFSQLitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke(uint64_t a1, sqlite3 *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_clear_bindings(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[_PBFSQLitePreparedSimpleStatement _bindKey:value:](v10, v9, v11);

        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    do
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32)
                                                                                                  + 24));
      v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v12 == 100)
      {
        if (*(_QWORD *)(a1 + 48))
        {
          +[PBFSQLiteResultRow resultRowWithStatement:]((uint64_t)PBFSQLiteResultRow, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          objc_msgSend(v13, "invalidate");

          v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        }
        else
        {
          v12 = 100;
        }
      }
    }
    while (v12 == 100);
    if (v12 != 101)
    {
      v14 = sqlite3_extended_errcode(a2);
      objc_msgSend(*(id *)(a1 + 32), "loggingCategory");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = sqlite3_errstr(v14);
        v17 = sqlite3_sql(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 24));
        *(_DWORD *)buf = 136315906;
        v23 = "-[_PBFSQLitePreparedSimpleStatement executeWithBindings:resultRowHandler:error:]_block_invoke";
        v24 = 1024;
        v25 = v14;
        v26 = 2080;
        v27 = v16;
        v28 = 2080;
        v29 = v17;
        _os_log_error_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_ERROR, "%s: received extended error %d (%s) executing statement '%s'", buf, 0x26u);
      }

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32)
                                                                                                 + 24));
  }
}

@end
