@implementation PASDatabaseJournal

uint64_t __37___PASDatabaseJournal_stopJournaling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

uint64_t __38___PASDatabaseJournal_startJournaling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40) ^ 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

void __48___PASDatabaseJournal_deleteAllJournaledQueries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Removing all journal files at %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v10 = 0;
  objc_msgSend(v2, "removeItemAtPath:error:", v3, &v10);
  v4 = v10;

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to remove journal directory: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v9 = v4;
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v9);
  v7 = v9;

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to re-create directory for storing journals: %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  __int128 *p_buf;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  __int128 buf;
  uint64_t v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_closeCurrentFile");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Executing queries from journals to %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x2020000000;
  v29 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  sel_getName(*(SEL *)(a1 + 56));
  v2 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke_48;
  v8[3] = &unk_1E442FD78;
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v10 = &v19;
  v8[4] = v4;
  v5 = *(_QWORD *)(a1 + 48);
  v11 = &v15;
  v12 = v5;
  v13 = &v23;
  v9 = v3;
  p_buf = &buf;
  objc_msgSend(v9, "writeTransaction:", v8);

  while (1)
  {
    v7 = *((_DWORD *)v24 + 6) + 1;
    *((_DWORD *)v24 + 6) = v7;
    if (v7 >= *((_DWORD *)v20 + 6))
      break;
    free(*(void **)(v16[3] + 8 * v7));
  }
  free((void *)v16[3]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);
}

void __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke_48(uint64_t a1)
{
  const char *v2;
  __int128 v3;
  int v4;
  NSObject *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int *v14;
  char *v15;
  __int128 v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "UTF8String");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = scandir(v2, (dirent ***)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 24), 0, MEMORY[0x1E0C81560]);
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = *__error();
      v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)buf = 67109378;
      v18 = v13;
      v19 = 2080;
      v20 = v15;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to open journal directory: errno(%i): %s", buf, 0x12u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    return;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v4 >= *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return;
  v5 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v3 = 67109120;
  v16 = v3;
  while (1)
  {
    v6 = *(_BYTE **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 8 * v4);
    if (v6[20] != 8)
    {
      free(v6);
      goto LABEL_14;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6 + 21);
    free(v6);
    v8 = (void *)MEMORY[0x1A1AFDC98]();
    buf[0] = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "_executeFile:onDb:becameLocked:", v7, *(_QWORD *)(a1 + 40), buf) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    if (buf[0])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      objc_autoreleasePoolPop(v8);
      goto LABEL_20;
    }
    objc_autoreleasePoolPop(v8);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(_DWORD *)(v9 + 24) + 1;
    *(_DWORD *)(v9 + 24) = v10;
    if ((v10 & 1) == 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = v16;
        v18 = v11;
        _os_log_debug_impl(&dword_1A0957000, v5, OS_LOG_TYPE_DEBUG, "journal execution checking lock state after %u files", buf, 8u);
      }
      if (!+[_PASDeviceState isUnlocked](_PASDeviceState, "isUnlocked", v16))
        break;
    }

LABEL_14:
    v4 = ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (v4 >= *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    *(_DWORD *)buf = v16;
    v18 = v12;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "journal execution exiting early after %u files because device is locked", buf, 8u);
  }
LABEL_20:

}

uint64_t __79___PASDatabaseJournal__executeNextRecordFromFile_onDb_becameLocked_deleteFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("__query"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal error when replaying query: %@: %@", (uint8_t *)&v7, 0x16u);

  }
  if (_sqliteErrorIndicatesDeviceBecameLocked(v3))
  {
    **(_BYTE **)(a1 + 40) = 0;
    v4 = *(_BYTE **)(a1 + 48);
    if (v4)
      *v4 = 1;
  }

  return 0;
}

void __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 *p_buf;
  id v17;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "substringToIndex:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("select"));

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "skipping select query", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v6 = (void *)MEMORY[0x1A1AFDC98](objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("__query")));
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "_getCurrentFile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "write:", v7);

      objc_autoreleasePoolPop(v6);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 40))
      {
        objc_msgSend(*(id *)(a1 + 48), "_addCurrentFileToLog");
      }
      else
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v19 = 0x2020000000;
        v20 = 1;
        v10 = *(void **)(a1 + 56);
        v11 = *(_QWORD *)(a1 + 32);
        +[_PASDatabaseJournal _binderForDictionary:](_PASDatabaseJournal, "_binderForDictionary:", *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_24;
        v14[3] = &unk_1E4430830;
        v15 = *(id *)(a1 + 32);
        p_buf = &buf;
        objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v11, v12, 0, v14);

        v13 = *(void **)(a1 + 48);
        if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          objc_msgSend(v13, "_clearCurrentFile");
        else
          objc_msgSend(v13, "_addCurrentFileToLog");

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error archiving: %@", (uint8_t *)&buf, 0xCu);
      }

      objc_autoreleasePoolPop(v6);
    }

  }
}

uint64_t __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_27(uint64_t a1, uint64_t a2)
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
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

uint64_t __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_24(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v6, 0x16u);
  }
  if (_sqliteErrorIndicatesDeviceBecameLocked(v3))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

  return 0;
}

void __44___PASDatabaseJournal__binderForDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44___PASDatabaseJournal__binderForDictionary___block_invoke_2;
  v6[3] = &unk_1E442FD00;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __44___PASDatabaseJournal__binderForDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  char isKindOfClass;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("__query")) & 1) == 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("qmarksSeparatedByCommas")))
    {
      v19 = v6;
      v20 = v5;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v8)
        goto LABEL_15;
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = 1;
      while (1)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v11 + 1;
            sqlite3_bind_int64((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "stmt"), v11, objc_msgSend(v13, "longLongValue"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v14 = v11 + 1;
            _PAS_sqlite3_bind_nsstring((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "stmt"), v11, v13);
          }
          v11 = v14;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (!v9)
        {
LABEL_15:

          v6 = v19;
          v5 = v20;
          goto LABEL_21;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "bindNamedParamToNull:", objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v17 = *(void **)(a1 + 32);
      v18 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v17, "bindNamedParam:toInteger:", v18, objc_msgSend(v6, "longValue"));
      else
        objc_msgSend(v17, "bindNamedParam:toNSString:", v18, v6);
    }
  }
LABEL_21:

}

@end
