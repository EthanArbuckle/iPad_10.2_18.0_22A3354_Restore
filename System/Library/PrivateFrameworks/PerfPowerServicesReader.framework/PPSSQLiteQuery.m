@implementation PPSSQLiteQuery

- (PPSSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  PPSSQLiteQuery *v9;
  PPSSQLiteQuery *v10;
  uint64_t v11;
  PPSSQLiteQueryDescriptor *descriptor;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPSSQLiteQuery;
  v9 = -[PPSSQLiteQuery init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v11 = objc_msgSend(v8, "copy");
    descriptor = v10->_descriptor;
    v10->_descriptor = (PPSSQLiteQueryDescriptor *)v11;

  }
  return v10;
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  -[PPSSQLiteQuery descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindToStatement:bindingIndex:", a3, a4);

  -[PPSSQLiteQuery descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "limitCount");

  if (v10 >> 31)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("bindToSelectStatement called with limit count %ld, greater than maximum allowed limit count (%d)"), v10, 0x7FFFFFFFLL);
  -[PPSSQLiteQuery descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "offsetCount");

  if (v12 >> 31)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("bindToSelectStatement called with offset count %ld, greater than maximum allowed offset count (%d)"), v12, 0x7FFFFFFFLL);
  if (v10)
  {
    sqlite3_bind_int(a3, *a4, v10);
    ++*a4;
  }
  if (v12)
  {
    sqlite3_bind_int(a3, *a4, v12);
    ++*a4;
  }
}

- (id)columnNamesForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteQuery descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "disambiguatedSQLForProperty:shouldEscape:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), 0, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)selectSQLWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PPSSQLiteQuery descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sqlForSelectWithProperties:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)enumerateProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PPSSQLiteDatabase *database;
  id v15;
  id v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  _QWORD v24[3];
  char v25;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count") >= 0x80000000)
  {
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = objc_msgSend(v8, "count");
    objc_msgSend(v10, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Insane number of properties for enumeration (%lu)"), v11);
  }
  -[PPSSQLiteQuery descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_sqlForSelectWithProperties:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  database = self->_database;
  v22 = v24;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke;
  v23[3] = &unk_25142CE30;
  v23[4] = self;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2;
  v19[3] = &unk_25142CE58;
  v15 = v8;
  v20 = v15;
  v16 = v9;
  v21 = v16;
  v17 = -[PPSSQLiteDatabase executeSQL:shouldCache:error:bindingHandler:enumerationHandler:](database, "executeSQL:shouldCache:error:bindingHandler:enumerationHandler:", v13, 1, a4, v23, v19);

  _Block_object_dispose(v24, 8);
  return v17;
}

uint64_t __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;

  v3 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "bindToSelectStatement:bindingIndex:", a2, &v3);
}

uint64_t __63__PPSSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PPSSQLiteRow::setColumnNames(a2, *(void **)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)queryWithDatabase:(id)a3 entity:(id)a4 predicate:(id)a5
{
  +[PPSSQLiteQuery queryWithDatabase:entity:predicate:groupByProperties:orderByProperties:orderByDirections:limitCount:offsetCount:](PPSSQLiteQuery, "queryWithDatabase:entity:predicate:groupByProperties:orderByProperties:orderByDirections:limitCount:offsetCount:", a3, a4, a5, 0, 0, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryWithDatabase:(id)a3 entity:(id)a4 predicate:(id)a5 groupByProperties:(id)a6 orderByProperties:(id)a7 orderByDirections:(id)a8 limitCount:(unint64_t)a9 offsetCount:(unint64_t)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PPSSQLiteQueryDescriptor *v21;
  PPSSQLiteQuery *v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = -[PPSSQLiteQueryDescriptor initWithEntity:predicate:]([PPSSQLiteQueryDescriptor alloc], "initWithEntity:predicate:", v16, v17);
  -[PPSSQLiteQueryDescriptor setOrderByDirections:](v21, "setOrderByDirections:", v20);
  -[PPSSQLiteQueryDescriptor setOrderByProperties:](v21, "setOrderByProperties:", v19);
  -[PPSSQLiteQueryDescriptor setGroupByProperties:](v21, "setGroupByProperties:", v18);
  -[PPSSQLiteQueryDescriptor setLimitCount:](v21, "setLimitCount:", a9);
  -[PPSSQLiteQueryDescriptor setOffsetCount:](v21, "setOffsetCount:", a10);
  v22 = -[PPSSQLiteQuery initWithDatabase:descriptor:]([PPSSQLiteQuery alloc], "initWithDatabase:descriptor:", v15, v21);

  return v22;
}

- (PPSSQLiteDatabase)database
{
  return (PPSSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (PPSSQLiteQueryDescriptor)descriptor
{
  return (PPSSQLiteQueryDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
