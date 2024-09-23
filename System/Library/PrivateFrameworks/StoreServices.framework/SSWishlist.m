@implementation SSWishlist

- (SSWishlist)initWithAccountIdentifier:(int64_t)a3
{
  SSWishlist *v4;
  SSWishlist *v5;
  id v6;
  void *v7;
  id v8;
  SSSQLiteDatabase *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SSWishlist;
  v4 = -[SSWishlist init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_accountIdentifier = a3;
    v6 = +[SSWishlistDatabaseSchema databasePathWithAccountIdentifier:](SSWishlistDatabaseSchema, "databasePathWithAccountIdentifier:", a3);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v6, "stringByDeletingLastPathComponent"), 1, 0, 0);

    v9 = -[SSSQLiteDatabase initWithDatabaseURL:]([SSSQLiteDatabase alloc], "initWithDatabaseURL:", v7);
    v5->_database = v9;
    -[SSSQLiteDatabase setSetupBlock:](v9, "setSetupBlock:", &__block_literal_global_39);
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v7, "setResourceValue:forKey:error:", v10, *MEMORY[0x1E0C999D8], 0);
  }
  return v5;
}

uint64_t __40__SSWishlist_initWithAccountIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SSWishlistDatabaseSchema createSchemaInDatabase:](SSWishlistDatabaseSchema, "createSchemaInDatabase:", a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSWishlist;
  -[SSWishlist dealloc](&v3, sel_dealloc);
}

+ (BOOL)existsForAccountIdentifier:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  LOBYTE(a3) = objc_msgSend(v4, "fileExistsAtPath:", +[SSWishlistDatabaseSchema databasePathWithAccountIdentifier:](SSWishlistDatabaseSchema, "databasePathWithAccountIdentifier:", a3));

  return a3;
}

- (BOOL)deleteBackingStore
{
  SSSQLiteDatabase *database;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  database = self->_database;
  if (database
    && (v6[0] = MEMORY[0x1E0C809B0],
        v6[1] = 3221225472,
        v6[2] = __32__SSWishlist_deleteBackingStore__block_invoke,
        v6[3] = &unk_1E47C02A8,
        v6[4] = &v7,
        -[SSSQLiteDatabase accessDatabaseUsingBlock:](database, "accessDatabaseUsingBlock:", v6),
        *((_BYTE *)v8 + 24)))
  {

    self->_database = 0;
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __32__SSWishlist_deleteBackingStore__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CPSqliteDatabaseDelete();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSNumber)lastSyncTime
{
  SSSQLiteDatabase *database;
  NSNumber *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__78;
  v10 = __Block_byref_object_dispose__78;
  v11 = 0;
  database = self->_database;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__SSWishlist_lastSyncTime__block_invoke;
  v5[3] = &unk_1E47BEC78;
  v5[4] = self;
  v5[5] = &v6;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v5);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__SSWishlist_lastSyncTime__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v6[4];
  __int128 v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("SELECT value FROM properties WHERE key=\"lastSyncTime\";"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __26__SSWishlist_lastSyncTime__block_invoke_2;
  v6[3] = &unk_1E47BE9D0;
  v7 = v3;
  objc_msgSend(v4, "prepareStatementForSQL:cache:usingBlock:", v2, 0, v6);

  return 1;
}

void __26__SSWishlist_lastSyncTime__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "statementHasRowAfterStepping:", a2))
  {
    v4 = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(v4, "integerValue"));

  }
}

- (void)performTransactionWithBlock:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SSWishlist_performTransactionWithBlock___block_invoke;
  v4[3] = &unk_1E47C02D0;
  v4[4] = self;
  v4[5] = a3;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v4);
}

uint64_t __42__SSWishlist_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setLastSyncTime:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SSWishlist_setLastSyncTime___block_invoke;
  v4[3] = &unk_1E47C02F8;
  v4[4] = a3;
  v4[5] = self;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v4);
}

uint64_t __30__SSWishlist_setLastSyncTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[7];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES (\"lastSyncTime\", ?)"));
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v3 + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __30__SSWishlist_setLastSyncTime___block_invoke_3;
    v10[3] = &unk_1E47BEC28;
    v10[5] = v3;
    v10[6] = &v12;
    v10[4] = v4;
    objc_msgSend(v5, "prepareStatementForSQL:cache:usingBlock:", v2, 0, v10);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __30__SSWishlist_setLastSyncTime___block_invoke_2;
    v11[3] = &unk_1E47BFC98;
    v11[4] = v6;
    v11[5] = &v12;
    objc_msgSend(v7, "prepareStatementForSQL:cache:usingBlock:", CFSTR("DELETE FROM properties WHERE key=\"lastSyncTime\"), 0, v11);
  }
  v8 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __30__SSWishlist_setLastSyncTime___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __30__SSWishlist_setLastSyncTime___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  SSSQLiteBindFoundationValueToStatement(a2, 1, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(*(id *)(a1 + 32), "longLongValue")));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)accountIdentifier
{
  return self->_accountIdentifier;
}

@end
