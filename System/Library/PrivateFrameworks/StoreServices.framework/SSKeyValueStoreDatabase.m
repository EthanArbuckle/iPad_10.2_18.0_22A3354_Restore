@implementation SSKeyValueStoreDatabase

- (id)_initReadOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  SSKeyValueStoreDatabase *v7;
  SSSQLiteDatabase *v8;
  SSSQLiteDatabase *v9;
  objc_super v11;
  _QWORD block[5];

  v3 = a3;
  v5 = +[SSKeyValueStoreSchema databasePath](SSKeyValueStoreSchema, "databasePath");
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SSKeyValueStoreDatabase__initReadOnly___block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = v5;
    if (_initReadOnly__sOnce != -1)
      dispatch_once(&_initReadOnly__sOnce, block);
  }
  v11.receiver = self;
  v11.super_class = (Class)SSKeyValueStoreDatabase;
  v7 = -[SSKeyValueStoreDatabase init](&v11, sel_init);
  if (v7)
  {
    v8 = [SSSQLiteDatabase alloc];
    v9 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:](v8, "initWithDatabaseURL:readOnly:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6), v3);
    v7->_database = v9;
    if (!v3)
      -[SSSQLiteDatabase setSetupBlock:](v9, "setSetupBlock:", &__block_literal_global_25);
  }
  return v7;
}

void __41__SSKeyValueStoreDatabase__initReadOnly___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent"), 1, 0, 0);

}

uint64_t __41__SSKeyValueStoreDatabase__initReadOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SSKeyValueStoreSchema createSchemaInDatabase:](SSKeyValueStoreSchema, "createSchemaInDatabase:", a2);
}

- (SSKeyValueStoreDatabase)init
{
  return (SSKeyValueStoreDatabase *)-[SSKeyValueStoreDatabase _initReadOnly:](self, "_initReadOnly:", 0);
}

- (id)initReadOnly
{
  return -[SSKeyValueStoreDatabase _initReadOnly:](self, "_initReadOnly:", 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSKeyValueStoreDatabase;
  -[SSKeyValueStoreDatabase dealloc](&v3, sel_dealloc);
}

- (void)modifyAsyncUsingTransactionBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__SSKeyValueStoreDatabase_modifyAsyncUsingTransactionBlock___block_invoke;
  v3[3] = &unk_1E47BBC58;
  v3[4] = self;
  v3[5] = a3;
  -[SSKeyValueStoreDatabase _dispatchBlockAsync:](self, "_dispatchBlockAsync:", v3);
}

uint64_t __60__SSKeyValueStoreDatabase_modifyAsyncUsingTransactionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifyUsingTransactionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SSKeyValueStoreDatabase_modifyUsingTransactionBlock___block_invoke;
  v4[3] = &unk_1E47BE8C8;
  v4[4] = self;
  v4[5] = a3;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v4);
}

uint64_t __55__SSKeyValueStoreDatabase_modifyUsingTransactionBlock___block_invoke(uint64_t a1)
{
  SSKeyValueStoreTransaction *v2;
  uint64_t v3;

  v2 = -[SSKeyValueStoreSession initWithDatabase:]([SSKeyValueStoreTransaction alloc], "initWithDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v3;
}

- (void)readAsyncUsingSessionBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SSKeyValueStoreDatabase_readAsyncUsingSessionBlock___block_invoke;
  v3[3] = &unk_1E47BBC58;
  v3[4] = self;
  v3[5] = a3;
  -[SSKeyValueStoreDatabase _dispatchBlockAsync:](self, "_dispatchBlockAsync:", v3);
}

uint64_t __54__SSKeyValueStoreDatabase_readAsyncUsingSessionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readUsingSessionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)readUsingSessionBlock:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SSKeyValueStoreDatabase_readUsingSessionBlock___block_invoke;
  v4[3] = &unk_1E47BE8C8;
  v4[4] = self;
  v4[5] = a3;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v4);
}

uint64_t __49__SSKeyValueStoreDatabase_readUsingSessionBlock___block_invoke(uint64_t a1)
{
  SSKeyValueStoreSession *v2;

  v2 = -[SSKeyValueStoreSession initWithDatabase:]([SSKeyValueStoreSession alloc], "initWithDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 1;
}

- (void)_dispatchBlockAsync:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[5];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSKeyValueStoreDatabase__dispatchBlockAsync___block_invoke;
  v4[3] = &unk_1E47B8E90;
  v4[4] = a3;
  -[SSSQLiteDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v4);
}

uint64_t __47__SSKeyValueStoreDatabase__dispatchBlockAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
