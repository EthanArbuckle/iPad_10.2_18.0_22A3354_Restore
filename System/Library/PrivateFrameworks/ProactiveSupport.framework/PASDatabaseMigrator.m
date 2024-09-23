@implementation PASDatabaseMigrator

void __39___PASDatabaseMigrator__clearDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id obj;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_2;
  v43[3] = &unk_1E442FAC0;
  v5 = v2;
  v44 = v5;
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_40;
  v38[3] = &unk_1E442FAE8;
  v41 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v42 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v39 = v6;
  v40 = v7;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_schema WHERE type='table' AND NOT name LIKE 'sqlite_%'"), 0, v43, v38);
  v8 = *(void **)(a1 + 32);
  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_45;
  v36[3] = &unk_1E442FAC0;
  v9 = v5;
  v37 = v9;
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_49;
  v31[3] = &unk_1E442FAE8;
  v34 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v35 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 40);
  v32 = v10;
  v33 = v11;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA table_list"), 0, v36, v31);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v17 = *(void **)(a1 + 32);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), v16);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_52;
        v22[3] = &unk_1E442FB10;
        v25 = *(_QWORD *)(a1 + 48);
        v22[4] = v16;
        v19 = *(id *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(a1 + 40);
        v23 = v19;
        v24 = v20;
        objc_msgSend(v17, "prepAndRunQuery:onPrep:onRow:onError:", v18, 0, 0, v22);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v45, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 32), "setUserVersion:", 0);
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint8_t v6[16];

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "name", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "sqlite_schema had a table with a NULL name", v6, 2u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }

  return 0;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_40(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v6 = a1[4];
    *(_DWORD *)buf = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to clear database: %@ error: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("_PASDatabaseMigrator.m"), 432, CFSTR("failed to clear database: %@ error: %@"), a1[4], v3);

  return 1;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("shadow"), "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(v3, "getNSStringForColumnAlias:", "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "shadow table has nil table name in PRAGMA table_list", v8, 2u);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }

  }
  return 0;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_49(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v6 = a1[4];
    *(_DWORD *)buf = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to clear database: %@ error: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("_PASDatabaseMigrator.m"), 451, CFSTR("failed to clear database: %@ error: %@"), a1[4], v3);

  return 1;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_52(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    *(_DWORD *)buf = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to drop table '%@' from database: %@ error: %@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[6], CFSTR("_PASDatabaseMigrator.m"), 463, CFSTR("failed to drop table '%@' from database: %@ error: %@"), a1[4], a1[5], v3);

  return 1;
}

uint64_t __51___PASDatabaseMigrator__runQuery_context_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASDatabaseMigrator encountered error during migration of db: %@ query: %@ error: %@", (uint8_t *)&v7, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;

  return 1;
}

uint64_t __56___PASDatabaseMigrator__runQueries_nextVersion_context___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1A1AFDC98](v3);
        LODWORD(v7) = objc_msgSend(*(id *)(a1 + 40), "_runQuery:context:database:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16), (_QWORD)v10);
        objc_autoreleasePoolPop(v8);
        if ((_DWORD)v7 != 4)
        {

          return 0;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "setUserVersion:", *(unsigned int *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 24) = *(_DWORD *)(a1 + 56);
  return 1;
}

void __35___PASDatabaseMigrator_description__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A1AFDC98](v4);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v8, "description", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v11);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = v4;
    }
    while (v4);
  }

}

uint64_t __39___PASDatabaseMigrator_migrationNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_migrationNeededWithContexts:toVersion:", a2, 0xFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __42___PASDatabaseMigrator_unmigrateDatabases__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_unmigrateDatabasesWithContexts:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50___PASDatabaseMigrator_migrateDatabasesToVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_migrateDatabasesWithContexts:toVersion:", a2, *(unsigned int *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
