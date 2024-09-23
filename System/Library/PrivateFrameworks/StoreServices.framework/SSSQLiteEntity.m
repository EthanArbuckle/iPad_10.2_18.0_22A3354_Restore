@implementation SSSQLiteEntity

uint64_t __68__SSSQLiteEntity__insertValues_intoTable_withPersistentID_database___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 56));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 2;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v10 + v9;
    }
    while (v6);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v2 = objc_opt_class();
  v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke_2;
  v5[3] = &unk_1E47BEA00;
  v5[4] = v2;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

- (SSSQLiteEntity)initWithPropertyValues:(id)a3 inDatabase:(id)a4
{
  void *v7;
  uint64_t v8;
  const __CFUUID *v9;
  id v10;
  SSSQLiteEntity *v11;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("ROWID"));
  if (v7)
  {
    v8 = objc_msgSend(v7, "longLongValue");
  }
  else
  {
    v9 = CFUUIDCreate(0);
    v8 = *(_OWORD *)&CFUUIDGetUUIDBytes(v9);
    CFRelease(v9);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10 = -[SSSQLiteEntity _copyTableClusteredValuesWithValues:](self, "_copyTableClusteredValuesWithValues:", a3);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke;
  v13[3] = &unk_1E47BEA28;
  v13[4] = self;
  v13[5] = v10;
  v13[7] = &v14;
  v13[8] = v8;
  v13[6] = a4;
  objc_msgSend(a4, "performTransactionWithBlock:", v13);

  if (!*((_BYTE *)v15 + 24))
  {

    self = 0;
  }
  v11 = -[SSSQLiteEntity initWithPersistentID:inDatabase:](self, "initWithPersistentID:inDatabase:", v8, a4);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (SSSQLiteEntity)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4
{
  SSSQLiteEntity *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSQLiteEntity;
  result = -[SSSQLiteEntity init](&v7, sel_init);
  if (result)
  {
    result->_database = (SSSQLiteDatabase *)a4;
    result->_persistentID = a3;
  }
  return result;
}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[7];

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)objc_opt_class();
  v6 = objc_msgSend(v5, "databaseTable");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke;
  v8[3] = &unk_1E47BEB68;
  v8[4] = v5;
  v8[5] = v6;
  v8[6] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
  return v4;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_5(_QWORD *a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)a1[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v10 + v9;
    }
    while (v6);
    v11 = v10 + v9;
  }
  else
  {
    v11 = 1;
  }
  sqlite3_bind_int64(a2, v11, *(_QWORD *)(a1[5] + 16));
  result = objc_msgSend(*(id *)(a1[5] + 8), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyTableClusteredValuesWithValues:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_2;
  v5[3] = &unk_1E47BEAF0;
  v6 = *(_OWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

uint64_t __54__SSSQLiteEntity__copyTableClusteredValuesWithValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = (uint64_t)a2;
  result = objc_msgSend(a2, "isEqualToString:", CFSTR("ROWID"));
  if ((result & 1) == 0)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "foreignDatabaseTableForProperty:", v4);
    if (v7)
    {
      v8 = v7;
      v4 = objc_msgSend(*(id *)(a1 + 32), "foreignDatabaseColumnForProperty:", v4);
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
    }
    v9 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v8);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v9, v8);
      v10 = v9;
    }
    return objc_msgSend(v9, "setObject:forKey:", a3, v4);
  }
  return result;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

uint64_t __50__SSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 database:(id)a6
{
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD v22[8];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT OR REPLACE INTO "));
  objc_msgSend(v11, "appendString:", a4);
  objc_msgSend(v11, "appendString:", CFSTR(" ("));
  v12 = objc_msgSend(a1, "foreignKeyColumnForTable:", a4);
  if (v12)
    v13 = (const __CFString *)v12;
  else
    v13 = CFSTR("ROWID");
  objc_msgSend(v11, "appendString:", v13);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(a3);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "appendString:", CFSTR(", "));
        objc_msgSend(v11, "appendString:", v17);
      }
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }
  objc_msgSend(v11, "appendString:", CFSTR(") VALUES (?"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    while (1)
    {
      if (*(_QWORD *)v24 != v19)
        objc_enumerationMutation(a3);
      objc_msgSend(v11, "appendString:", CFSTR(", ?"));
      if (!--v18)
      {
        v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (!v18)
          break;
      }
    }
  }
  objc_msgSend(v11, "appendString:", CFSTR(");"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__SSSQLiteEntity__insertValues_intoTable_withPersistentID_database___block_invoke;
  v22[3] = &unk_1E47BEB40;
  v22[6] = &v31;
  v22[7] = a5;
  v22[4] = a3;
  v22[5] = a6;
  objc_msgSend(a6, "prepareStatementForSQL:cache:usingBlock:", v11, 0, v22);

  v20 = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);
  return v20;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  if (objc_msgSend(a1, "joinClauseForProperty:"))
    return a3;
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend(a1, "databaseTable"), a3);
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

- (BOOL)deleteFromDatabase
{
  SSSQLiteDatabase *database;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  database = self->_database;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSSQLiteEntity_deleteFromDatabase__block_invoke;
  v5[3] = &unk_1E47BEA78;
  v5[4] = self;
  v5[5] = &v6;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SSSQLiteEntity_SSSQLiteQueryAdditions__anyInDatabase_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithPersistentID:inDatabase:", a2, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  *a4 = 1;
  return result;
}

uint64_t __52__SSSQLiteEntity_initWithPropertyValues_inDatabase___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_insertValues:intoTable:withPersistentID:database:", a3, a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4
{
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__60;
  v14 = __Block_byref_object_dispose__60;
  v15 = 0;
  v6 = (void *)objc_msgSend(a1, "queryWithDatabase:predicate:", a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SSSQLiteEntity_SSSQLiteQueryAdditions__anyInDatabase_predicate___block_invoke;
  v9[3] = &unk_1E47BED40;
  v9[5] = a3;
  v9[6] = &v10;
  v9[4] = a1;
  objc_msgSend(v6, "enumeratePersistentIDsUsingBlock:", v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  SSSQLiteQueryDescriptor *v9;
  SSSQLiteQuery *v10;

  v9 = objc_alloc_init(SSSQLiteQueryDescriptor);
  -[SSSQLiteQueryDescriptor setEntityClass:](v9, "setEntityClass:", a1);
  -[SSSQLiteQueryDescriptor setMemoryEntityClass:](v9, "setMemoryEntityClass:", objc_msgSend(a1, "memoryEntityClass"));
  -[SSSQLiteQueryDescriptor setOrderingProperties:](v9, "setOrderingProperties:", a5);
  -[SSSQLiteQueryDescriptor setPredicate:](v9, "setPredicate:", a4);
  v10 = -[SSSQLiteQuery initWithDatabase:descriptor:]([SSSQLiteQuery alloc], "initWithDatabase:descriptor:", a3, v9);

  return v10;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  return (id)objc_msgSend(a1, "queryWithDatabase:predicate:orderingProperties:", a3, a4, 0);
}

BOOL __36__SSSQLiteEntity_deleteFromDatabase__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_deleteRowFromTable:usingColumn:", objc_msgSend((id)objc_opt_class(), "databaseTable"), CFSTR("ROWID"));
  v2 = (void *)objc_msgSend((id)objc_opt_class(), "foreignDatabaseTablesToDelete");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
      v8 = objc_msgSend((id)objc_opt_class(), "foreignKeyColumnForTable:", v7);
      if (v8)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_deleteRowFromTable:usingColumn:", v7, v8);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          break;
      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4
{
  void *v5;
  SSSQLiteDatabase *database;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ?;"),
                 a3,
                 a4);
  database = self->_database;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SSSQLiteEntity__deleteRowFromTable_usingColumn___block_invoke;
  v8[3] = &unk_1E47BE9D0;
  v8[4] = self;
  v8[5] = &v9;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v5, 1, v8);

  LOBYTE(self) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" = ?"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", a3);
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v7;
  void *v8;
  BOOL v9;

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, a4, 0);
  v9 = -[SSSQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);

  return v9;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  SSSQLiteDatabase *database;
  _QWORD v9[9];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v5 = (void *)objc_opt_class();
  v6 = objc_msgSend(v5, "databaseTable");
  database = self->_database;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke;
  v9[3] = &unk_1E47BEB18;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = v5;
  v9[7] = v6;
  v9[8] = &v10;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v9);
  LOBYTE(a3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a3;
}

void __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v8;
  const __CFString *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  _QWORD v21[7];
  _QWORD v22[3];
  char v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = objc_msgSend(*(id *)(a1 + 32), "foreignKeyColumnForTable:", a2);
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("ROWID");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v10 = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 40));
  v11 = MEMORY[0x1E0C809B0];
  if ((v10 & 1) == 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT 1 FROM "));
    objc_msgSend(v12, "appendString:", a2);
    objc_msgSend(v12, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v12, "appendString:", v9);
    objc_msgSend(v12, "appendString:", CFSTR(" =  ? LIMIT 1;"));
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(v13 + 8);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_3;
    v24[3] = &unk_1E47BE9D0;
    v24[4] = v13;
    v24[5] = &v25;
    objc_msgSend(v14, "prepareStatementForSQL:cache:usingBlock:", v12, 1, v24);

  }
  if (*((_BYTE *)v26 + 24))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE "));
    objc_msgSend(v16, "appendString:", a2);
    objc_msgSend(v16, "appendString:", CFSTR(" SET "));
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_4;
    v21[3] = &unk_1E47BEAC8;
    v21[5] = v15;
    v21[6] = v22;
    v21[4] = v16;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v21);
    objc_msgSend(v16, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v16, "appendString:", a2);
    objc_msgSend(v16, "appendString:", CFSTR("."));
    objc_msgSend(v16, "appendString:", v9);
    objc_msgSend(v16, "appendString:", CFSTR(" = ?;"));
    v19[0] = v11;
    v17 = *(_OWORD *)(a1 + 48);
    v18 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
    v19[1] = 3221225472;
    v19[2] = __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_5;
    v19[3] = &unk_1E47BE980;
    v19[4] = v15;
    v20 = v17;
    objc_msgSend(v18, "prepareStatementForSQL:cache:usingBlock:", v16, 1, v19);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_insertValues:intoTable:withPersistentID:database:", a3, a2, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) ^ 1;
  _Block_object_dispose(&v25, 8);
}

+ (id)copyDatabaseDictionaryToSetClientDictionary:(id)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SSSQLiteEntity_copyDatabaseDictionaryToSetClientDictionary___block_invoke;
  v7[3] = &unk_1E47BEA50;
  v7[4] = a1;
  v7[5] = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
  return v5;
}

void __62__SSSQLiteEntity_copyDatabaseDictionaryToSetClientDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(a1 + 32), "databasePropertyToSetClientProperty:", a2);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 32), "databaseValueForProperty:clientValue:", v6, a3), v6);
  }
  else
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v7)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_INFO))
      v9 &= 2u;
    if (v9)
    {
      v20 = 138412546;
      v21 = objc_opt_class();
      v22 = 2112;
      v23 = a2;
      LODWORD(v19) = 22;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v20, v19);
        free(v11);
        SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
      }
    }
  }
}

+ (id)databasePropertyToGetClientProperty:(id)a3
{
  return a3;
}

+ (id)databasePropertyToSetClientProperty:(id)a3
{
  return a3;
}

+ (id)databaseValueForProperty:(id)a3 clientValue:(id)a4
{
  return a4;
}

+ (id)databaseTable
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("+[%@ databaseTable] not implemented"), a1);
  return 0;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

- (id)copyValuesForClientProperties:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t i;
  uint64_t j;
  uint64_t v11;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_msgSend(a3, "count");
  v7 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  v8 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  if (v6 < 1)
  {
    -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", v7, v8, v6);
    if (v8)
LABEL_10:
      free(v8);
  }
  else
  {
    for (i = 0; i != v6; ++i)
      *((_QWORD *)v8 + i) = objc_msgSend((id)objc_opt_class(), "databasePropertyToGetClientProperty:", objc_msgSend(a3, "objectAtIndex:", i));
    -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", v7, v8, v6);
    for (j = 0; j != v6; ++j)
    {
      v11 = v7[j];
      if (v11 && *((_QWORD *)v8 + j))
        objc_msgSend(v5, "setObject:forKey:", v11, objc_msgSend(a3, "objectAtIndex:", j));
    }
    if (v8)
      goto LABEL_10;
  }
  if (v7)
    free(v7);
  return v5;
}

- (id)copyXPCEncodedValuesForClientProperties:(id)a3
{
  xpc_object_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  __CFString **v9;
  __CFString **v10;
  uint64_t v11;
  uint64_t v12;
  __CFString **v13;
  __CFString *v14;

  v5 = xpc_array_create(0, 0);
  v6 = objc_msgSend(a3, "count");
  v7 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  if (v7)
  {
    v8 = v7;
    v9 = (__CFString **)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
    if (v9)
    {
      v10 = v9;
      if (v6)
      {
        v11 = 0;
        while (1)
        {
          v12 = objc_msgSend((id)objc_opt_class(), "databasePropertyToGetClientProperty:", objc_msgSend(a3, "objectAtIndex:", v11));
          v8[v11] = v12;
          if (!v12)
            break;
          if (v6 == ++v11)
          {
            -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", v10, v8, v6);
            v13 = v10;
            do
            {
              v14 = *v13;
              if (!*v13)
                v14 = (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
              SSXPCArraySetCFObject(v5, 0xFFFFFFFFFFFFFFFFLL, v14);
              ++v13;
              --v6;
            }
            while (v6);
            break;
          }
        }
      }
      else
      {
        -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", v9, v8, 0);
      }
      free(v10);
    }
    free(v8);
  }
  return v5;
}

- (BOOL)existsInDatabase
{
  void *v3;
  SSSQLiteDatabase *database;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;"),
                 objc_msgSend((id)objc_opt_class(), "databaseTable"),
                 CFSTR("ROWID"));
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SSSQLiteEntity_existsInDatabase__block_invoke;
  v6[3] = &unk_1E47BE9D0;
  v6[4] = self;
  v6[5] = &v7;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v3, 1, v6);

  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

uint64_t __34__SSSQLiteEntity_existsInDatabase__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statementHasRowAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  SSSQLiteDatabase *database;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[7];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a5 == 1 && objc_msgSend((id)*a4, "isEqualToString:", CFSTR("ROWID")))
  {
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
  }
  else
  {
    v9 = (void *)objc_opt_class();
    v21 = objc_msgSend(v9, "databaseTable");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (a5)
    {
      v12 = 0;
      do
      {
        a3[v12] = 0;
        v13 = objc_msgSend(v9, "disambiguatedSQLForProperty:", a4[v12], v21);
        if (v12)
          objc_msgSend(v10, "appendString:", CFSTR(", "));
        objc_msgSend(v10, "appendString:", v13);
        v14 = objc_msgSend(v9, "joinClauseForProperty:", a4[v12]);
        if (v14)
          objc_msgSend(v11, "addObject:", v14);
        ++v12;
      }
      while (a5 != v12);
    }
    objc_msgSend(v10, "appendString:", CFSTR(" FROM "), v21);
    objc_msgSend(v10, "appendString:", v22);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v11);
          v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v10, "appendString:", CFSTR(" "));
          objc_msgSend(v10, "appendString:", v19);
        }
        v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v16);
    }
    objc_msgSend(v10, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v10, "appendString:", v22);
    objc_msgSend(v10, "appendString:", CFSTR(".ROWID = ?;"));
    database = self->_database;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48__SSSQLiteEntity_getValues_forProperties_count___block_invoke;
    v23[3] = &unk_1E47BEAA0;
    v23[4] = self;
    v23[5] = a5;
    v23[6] = a3;
    -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v10, 1, v23);

  }
}

id __48__SSSQLiteEntity_getValues_forProperties_count___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  id result;
  unint64_t v5;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1[4] + 16));
  result = (id)objc_msgSend(*(id *)(a1[4] + 8), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result && a1[5])
  {
    v5 = 0;
    do
    {
      result = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, v5);
      *(_QWORD *)(a1[6] + 8 * v5++) = result;
    }
    while (v5 < a1[5]);
  }
  return result;
}

uint64_t __42__SSSQLiteEntity_setValuesWithDictionary___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statementHasRowAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)valueForProperty:(id)a3
{
  void *v4;
  id v5;

  v4 = 0;
  v5 = a3;
  -[SSSQLiteEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v4, &v5, 1);
  return v4;
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6
{
  SSSQLiteQueryDescriptor *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__60;
  v21 = __Block_byref_object_dispose__60;
  v22 = 0;
  v11 = objc_alloc_init(SSSQLiteQueryDescriptor);
  -[SSSQLiteQueryDescriptor setEntityClass:](v11, "setEntityClass:", a1);
  -[SSSQLiteQueryDescriptor setPredicate:](v11, "setPredicate:", a5);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@(%@)"), a4, objc_msgSend(a1, "disambiguatedSQLForProperty:", a3));
  v23[0] = a3;
  v13 = -[SSSQLiteQueryDescriptor _newSelectSQLWithProperties:count:columns:](v11, "_newSelectSQLWithProperties:count:columns:", v23, 1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__SSSQLiteEntity_SSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_database___block_invoke;
  v16[3] = &unk_1E47BE980;
  v16[4] = v11;
  v16[5] = a6;
  v16[6] = &v17;
  objc_msgSend(a6, "prepareStatementForSQL:cache:usingBlock:", v13, 1, v16);

  v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);
  return v14;
}

uint64_t __97__SSSQLiteEntity_SSSQLiteQueryAdditions___aggregateValueForProperty_function_predicate_database___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;
  int v5;

  v5 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "predicate"), "bindToStatement:bindingIndex:", a2, &v5);
  result = objc_msgSend(*(id *)(a1 + 40), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    result = SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  }
  return result;
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return (id)objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:database:", a3, CFSTR("COUNT"), a4, a5);
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return (id)objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:database:", a3, CFSTR("MAX"), a4, a5);
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5
{
  return (id)objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:database:", a3, CFSTR("MIN"), a4, a5);
}

@end
