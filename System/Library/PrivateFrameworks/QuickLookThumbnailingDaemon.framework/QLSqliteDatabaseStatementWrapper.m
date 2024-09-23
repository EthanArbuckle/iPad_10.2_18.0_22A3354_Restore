@implementation QLSqliteDatabaseStatementWrapper

- (void)setInUse:(BOOL)a3
{
  NSMapTable *WeakRetained;
  sqlite3_stmt *stmt;
  NSMapTable *v7;

  WeakRetained = (NSMapTable *)objc_loadWeakRetained((id *)&self->_inUseTable);
  stmt = self->_stmt;
  v7 = WeakRetained;
  if (a3)
    NSMapInsert(WeakRetained, stmt, self);
  else
    NSMapRemove(WeakRetained, stmt);

}

- (NSString)key
{
  return self->_key;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (QLSqliteDatabaseStatementWrapper)initWithStatement:(sqlite3_stmt *)a3 key:(id)a4 inUseTable:(id)a5
{
  id v9;
  id v10;
  QLSqliteDatabaseStatementWrapper *v11;
  QLSqliteDatabaseStatementWrapper *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)QLSqliteDatabaseStatementWrapper;
  v11 = -[QLSqliteDatabaseStatementWrapper init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_stmt = a3;
    objc_storeStrong((id *)&v11->_key, a4);
    objc_storeWeak((id *)&v12->_inUseTable, v10);
  }

  return v12;
}

- (BOOL)isInUse
{
  QLSqliteDatabaseStatementWrapper *v2;
  NSMapTable *WeakRetained;

  v2 = self;
  WeakRetained = (NSMapTable *)objc_loadWeakRetained((id *)&self->_inUseTable);
  LOBYTE(v2) = NSMapGet(WeakRetained, v2->_stmt) == v2;

  return (char)v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLSqliteDatabaseStatementWrapper;
  -[QLSqliteDatabaseStatementWrapper dealloc](&v2, sel_dealloc);
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_inUseTable);
}

@end
