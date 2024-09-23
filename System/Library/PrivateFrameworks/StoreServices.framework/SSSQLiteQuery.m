@implementation SSSQLiteQuery

void __70__SSSQLiteQuery_enumeratePersistentIDsAndProperties_count_usingBlock___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  size_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  sqlite3_int64 v10;
  unint64_t v11;
  unsigned __int8 v12;
  int v13;

  v13 = 1;
  objc_msgSend(*(id *)(a1 + 32), "bindToSelectStatement:bindingIndex:", a2, &v13);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    v5 = (id *)malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
  else
    v5 = 0;
  v6 = 0;
  do
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statementHasRowAfterStepping:", a2))
      break;
    v7 = (void *)MEMORY[0x1A8585BF8]();
    if (v5 && *(_QWORD *)(a1 + 48))
    {
      v8 = 0;
      do
      {

        v5[v8] = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, (int)v8 + 1);
        ++v8;
      }
      while (v8 < *(_QWORD *)(a1 + 48));
    }
    v12 = 0;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = sqlite3_column_int64(a2, 0);
    (*(void (**)(uint64_t, sqlite3_int64, id *, uint64_t, unsigned __int8 *))(v9 + 16))(v9, v10, v5, v6++, &v12);
    LODWORD(v9) = v12;
    objc_autoreleasePoolPop(v7);
  }
  while (!(_DWORD)v9);
  if (v5)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v11 = 0;
      do

      while (v11 < *(_QWORD *)(a1 + 48));
    }
    free(v5);
  }
}

uint64_t __50__SSSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  int64_t v7;

  -[SSSQLitePredicate bindToStatement:bindingIndex:](-[SSSQLiteQueryDescriptor predicate](self->_descriptor, "predicate"), "bindToStatement:bindingIndex:", a3, a4);
  v7 = -[SSSQLiteQueryDescriptor limitCount](self->_descriptor, "limitCount");
  if (v7)
  {
    sqlite3_bind_int(a3, *a4, v7);
    ++*a4;
  }
}

- (id)_newSelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4
{
  id v7;
  objc_class *v8;
  const void **v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = -[SSSQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  objc_msgSend(v7, "addObject:", -[objc_class disambiguatedSQLForProperty:](v8, "disambiguatedSQLForProperty:", CFSTR("ROWID")));
  if (a4)
  {
    v9 = a3;
    v10 = a4;
    do
    {
      v11 = (uint64_t)*v9++;
      objc_msgSend(v7, "addObject:", -[objc_class disambiguatedSQLForProperty:](v8, "disambiguatedSQLForProperty:", v11));
      --v10;
    }
    while (v10);
  }
  v12 = -[SSSQLiteQueryDescriptor _newSelectSQLWithProperties:count:columns:](self->_descriptor, "_newSelectSQLWithProperties:count:columns:", a3, a4, v7);

  return v12;
}

void __34__SSSQLiteQuery_deleteAllEntities__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithPersistentID:inDatabase:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "deleteFromDatabase");
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;

}

- (id)copySelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4
{
  id v7;
  objc_class *v8;
  objc_class *v9;
  const void **v10;
  unint64_t v11;
  uint64_t v12;
  id v13;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = -[SSSQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  if (a4)
  {
    v9 = v8;
    v10 = a3;
    v11 = a4;
    do
    {
      v12 = (uint64_t)*v10++;
      objc_msgSend(v7, "addObject:", -[objc_class disambiguatedSQLForProperty:](v9, "disambiguatedSQLForProperty:", v12));
      --v11;
    }
    while (v11);
  }
  v13 = -[SSSQLiteQueryDescriptor _newSelectSQLWithProperties:count:columns:](self->_descriptor, "_newSelectSQLWithProperties:count:columns:", a3, a4, v7);

  return v13;
}

uint64_t __34__SSSQLiteQuery_deleteAllEntities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  __int128 v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "entityClass");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSSQLiteQuery_deleteAllEntities__block_invoke_2;
  v4[3] = &unk_1E47BEC50;
  v4[4] = v2;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend((id)v5, "enumeratePersistentIDsUsingBlock:", v4);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteQuery;
  -[SSSQLiteQuery dealloc](&v3, sel_dealloc);
}

- (SSSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  SSSQLiteQuery *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSQLiteQuery;
  v6 = -[SSSQLiteQuery init](&v8, sel_init);
  if (v6)
  {
    v6->_database = (SSSQLiteDatabase *)a3;
    v6->_descriptor = (SSSQLiteQueryDescriptor *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SSSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke;
  v3[3] = &unk_1E47BECF0;
  v3[4] = a3;
  -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:](self, "enumeratePersistentIDsAndProperties:count:usingBlock:", 0, 0, v3);
}

- (void)enumeratePersistentIDsAndProperties:(const void *)a3 count:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  SSSQLiteDatabase *database;
  _QWORD v10[7];

  v8 = -[SSSQLiteQuery _newSelectSQLWithProperties:count:](self, "_newSelectSQLWithProperties:count:", a3);
  database = self->_database;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SSSQLiteQuery_enumeratePersistentIDsAndProperties_count_usingBlock___block_invoke;
  v10[3] = &unk_1E47BED18;
  v10[5] = a5;
  v10[6] = a4;
  v10[4] = self;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v8, 0, v10);

}

- (BOOL)deleteAllEntities
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
  v9 = 1;
  database = self->_database;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSSQLiteQuery_deleteAllEntities__block_invoke;
  v5[3] = &unk_1E47BEC78;
  v5[4] = self;
  v5[5] = &v6;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyEntityIdentifiers
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SSSQLiteQuery_copyEntityIdentifiers__block_invoke;
  v5[3] = &unk_1E47BEBD8;
  v5[4] = v3;
  -[SSSQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v5);
  return v3;
}

void __38__SSSQLiteQuery_copyEntityIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (int64_t)countOfEntities
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SSSQLiteQuery_countOfEntities__block_invoke;
  v4[3] = &unk_1E47BEC00;
  v4[4] = &v5;
  -[SSSQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__SSSQLiteQuery_countOfEntities__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(const void *)a4 count:(unint64_t)a5
{
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  objc_class *v13;
  const void **v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  SSSQLiteDatabase *database;
  char v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CREATE TEMPORARY TABLE "));
  objc_msgSend(v9, "appendString:", a3);
  objc_msgSend(v9, "appendString:", CFSTR(" AS "));
  v10 = (void *)-[SSSQLiteQueryDescriptor copy](self->_descriptor, "copy");
  objc_msgSend(v10, "setOrderingDirections:", 0);
  objc_msgSend(v10, "setOrderingProperties:", 0);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = -[SSSQLiteQueryDescriptor entityClass](self->_descriptor, "entityClass");
  if (a5)
  {
    v13 = v12;
    v14 = a4;
    v15 = a5;
    do
    {
      v16 = (uint64_t)*v14++;
      objc_msgSend(v11, "addObject:", -[objc_class disambiguatedSQLForProperty:](v13, "disambiguatedSQLForProperty:", v16));
      --v15;
    }
    while (v15);
  }
  v17 = (void *)objc_msgSend(v10, "_newSelectSQLWithProperties:count:columns:", a4, a5, v11);
  objc_msgSend(v9, "appendString:", v17);

  objc_msgSend(v9, "appendString:", CFSTR(";"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  database = self->_database;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__SSSQLiteQuery_createTemporaryTableWithName_properties_count___block_invoke;
  v21[3] = &unk_1E47BEC28;
  v21[5] = self;
  v21[6] = &v22;
  v21[4] = v10;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v9, 0, v21);

  v19 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v19;
}

uint64_t __63__SSSQLiteQuery_createTemporaryTableWithName_properties_count___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;

  v5 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "predicate"), "bindToStatement:bindingIndex:", a2, &v5);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  objc_class *v5;

  v5 = -[SSSQLiteQueryDescriptor memoryEntityClass](self->_descriptor, "memoryEntityClass");
  if (!v5)
    v5 = (objc_class *)objc_opt_class();
  -[SSSQLiteQuery enumerateMemoryEntitiesWithProperties:usingBlock:](self, "enumerateMemoryEntitiesWithProperties:usingBlock:", -[objc_class defaultProperties](v5, "defaultProperties"), a3);
}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[8];
  _QWORD v13[6];

  v7 = -[SSSQLiteQueryDescriptor memoryEntityClass](self->_descriptor, "memoryEntityClass");
  if (!v7)
    v7 = (objc_class *)objc_opt_class();
  v8 = objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8;
    v10 = malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(a3, "getObjects:range:", v10, 0, v9);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2;
      v12[3] = &unk_1E47BECC8;
      v12[4] = v7;
      v12[5] = a3;
      v12[6] = a4;
      v12[7] = v9;
      -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:](self, "enumeratePersistentIDsAndProperties:count:usingBlock:", v11, v9, v12);
      free(v11);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke;
    v13[3] = &unk_1E47BECA0;
    v13[4] = v7;
    v13[5] = a4;
    -[SSSQLiteQuery enumeratePersistentIDsUsingBlock:](self, "enumeratePersistentIDsUsingBlock:", v13);
  }
}

void __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_alloc_init(*(Class *)(a1 + 32));
  objc_msgSend(v4, "setDatabaseID:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__SSSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;

  v9 = objc_alloc_init(*(Class *)(a1 + 32));
  objc_msgSend(v9, "setDatabaseID:", a2);
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 >= 1)
  {
    for (i = 0; i < v6; ++i)
    {
      v8 = *(_QWORD *)(a3 + 8 * i);
      if (v8)
      {
        objc_msgSend(v9, "setValue:forProperty:", v8, objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", i));
        v6 = *(_QWORD *)(a1 + 56);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (SSSQLiteQueryDescriptor)queryDescriptor
{
  return (SSSQLiteQueryDescriptor *)(id)-[SSSQLiteQueryDescriptor copy](self->_descriptor, "copy");
}

@end
